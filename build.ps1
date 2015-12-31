<# Diese Datei lädt die index.md und inkludiert an den entsprechenden Stellen alle angegebenen
   Subdateien ein. Danach wird noch ein TOC gebaut und an der ntsprechende Stelle hinterlegt.

   Der Build beschwert sich über nicht verknüpfte md Dateien, damit man nichts vergisst.
#>


<# Konfiguration #>

$global:eingabedatei = "index.md"
$global:ausgabedatei = "Prinzipiensammlung-Gesamt.md"

$global:tableOfContents = @()

<# /Konfiguration #>

Clear

function VerarbeiteDatei ($dateiname) 
{
    (Get-Content $dateiname -Encoding UTF8).Split("`n") | % {
        
        # DEBUG Ausgabe
        #Write-Host $_ -ForegroundColor Cyan

        <# Include Befehle verarbeiten #>
        if ( $_.StartsWith("include ") ) {
            $include_dateiname = $_.Remove(0, "include ".Length)
            VerarbeiteDatei $include_dateiname
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

<# Gehe in das Verzeichnis, in dem das Skript sich befindet #>

<# Erstmal aufräumen #>
if ( Test-Path $ausgabedatei )
{
    Remove-Item $ausgabedatei
}

VerarbeiteDatei $eingabedatei

<# Table of Contents einsetzen #>
$inhalt = Get-Content $ausgabedatei -Encoding UTF8
$inhaltsverzeichnis = InhaltsverzeichnisZUsammenstellen
$inhalt = $inhalt.Replace("Table-Of-Contents-Here", $inhaltsverzeichnis)
$inhalt | Out-File $ausgabedatei -Encoding utf8

Write-Host $ausgabedatei wurde erstellt.
#notepad $ausgabedatei