<#
    Diese Tools helfen bei der Zusammenstellung von Dokumenten aus mehreren 
    MarkDown-Dateien.
#>

function VerarbeiteDatei ($dateiname, $ausgabedatei) 
{
    (Get-Content $dateiname -Encoding UTF8).Split("`n") | % {
        
        # DEBUG Ausgabe
        #Write-Host $_ -ForegroundColor Cyan

        <# Include Befehle verarbeiten #>
        if ( $_.StartsWith("include ") ) {
            $include_dateiname = $_.Remove(0, "include ".Length)
            VerarbeiteDatei $include_dateiname $ausgabedatei
            return
        }
        
        <# Table-Of-Contents-Here #>
        if ( $_.StartsWith("Table-Of-Contents-Here") ) {
            <# Im Moment befinden wir uns im Sammelmodus, da bedeutet die Kennzeichnung nur: 
               Inhaltsverzeichnis ab hier aufbauen. #>
            $global:tableOfContents = @() 
        }

        <# Table-Of-Contents aufbauen #>

        <# Überschriften für Table-Of-Contents sammeln #>
        if ( $_.StartsWith("#") ) {
            $link = $_.Replace("#", "").Replace(" ", "_").Replace("(", "").Replace(")", "") + 
                "_" + $global:tableOfContents.Count;
            $global:tableOfContents += @{ Titel = $_; Link = $link }
            
            "
<a name=`"" + $link + "`"></a>" | Out-File $ausgabedatei -Encoding utf8 -Append
        }


        $_ | Out-File $ausgabedatei -Encoding utf8 -Append 
    }    
}

function InhaltsverzeichnisZusammenstellen() 
{
    $ergebnis = ""; 

    for ($i = 0; $i -lt $global:tableOfContents.Count; $i++ )
    {
        $ergebnis += "<a href=`""
        $ergebnis += "#" + $global:tableOfContents[$i].Link
        $ergebnis += "`">"
        $ergebnis += $global:tableOfContents[$i].Titel.Replace("#", "&nbsp;&nbsp;")
        $ergebnis += "</a>"
        $ergebnis += "<br/>`r`n"
    }

    return $ergebnis
}


function MarkdownBuild($verzeichnisMitMds, $eingabedatei, $ausgabedatei)
{
    cd $verzeichnisMitMds

    $global:tableOfContents = @()

    <# Erstmal aufräumen #>
    if ( Test-Path $ausgabedatei )
    {
        Remove-Item $ausgabedatei
    }

    VerarbeiteDatei $eingabedatei $ausgabedatei

    <# Table of Contents einsetzen #>
    $inhalt = Get-Content $ausgabedatei -Encoding UTF8
    $inhaltsverzeichnis = InhaltsverzeichnisZUsammenstellen
    $inhalt = $inhalt.Replace("Table-Of-Contents-Here", $inhaltsverzeichnis)
    $inhalt | Out-File $ausgabedatei -Encoding utf8

    Write-Host $ausgabedatei wurde erstellt.
    cd ..
}