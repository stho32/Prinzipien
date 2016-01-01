<# Diese Datei lädt die index.md und inkludiert an den entsprechenden Stellen alle angegebenen
   Subdateien ein. Danach wird noch ein TOC gebaut und an der ntsprechende Stelle hinterlegt.

   Der Build beschwert sich über nicht verknüpfte md Dateien, damit man nichts vergisst.
#>

. ".\MdTools.ps1"

#Clear
cd Prinzipiensammlung

MarkdownBuild "index.md" "../Prinzipiensammlung.md"

cd ..

#notepad $ausgabedatei