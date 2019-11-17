write-output "## Artefatos"  |  out-file "index.md" -encoding utf8
write-output "Clique nos links para acessar a documenta$([char]0x00e7)$([char]0x00e3)o referente a cada um"  |  out-file "index.md" -append -encoding utf8
write-output "dos artefatos do projeto. A numera$([char]0x00e7)$([char]0x00e3)o dos documentos correspondem"  |  out-file "index.md" -append -encoding utf8
write-output "$([char]0x00e0) numera$([char]0x00e7)$([char]0x00e3)o dos itens na especifica$([char]0x00e7)$([char]0x00e3)o do trabalho, fornecida pelo"  |  out-file "index.md" -append -encoding utf8
write-output "professor. Os planos de itera$([char]0x00e7)$([char]0x00e3)o s$([char]0x00e3)o numerados da seguinte forma:<br/>"  |  out-file "index.md" -append -encoding utf8
write-output "``Itera$([char]0x00e7)$([char]0x00e3)o <sprint>-<itens prduzidos>``"  |  out-file "index.md" -append -encoding utf8



foreach ($folder in $(Get-ChildItem -Attributes Directory -Name .)) {

	if ($folder -like "03. Planos de iter*") {
		write-output "* 03\. Planos de Itera$([char]0x00e7)$([char]0x00e3)o"  |  out-file "index.md" -append -encoding utf8
		
	}

	foreach ($file in $(Get-ChildItem -Name -Filter "*.pdf" $folder)) {
		$str = "https://github.com/Aendur/engsw-2-2019/blob/master/$folder\$file" 
		$str = $str -replace " ","%20"
		$str = $str -replace "\u00e7","%C3%A7" # replace ç
		$str = $str -replace "\u00e3","%C3%A3" # replace ã
		$str = $str -replace "\\","/" 

		$fld = $folder -replace "`r`n", ""

		if ($folder -like "03. Planos de iter*") {
			write-output "    * [$file]($str)" |  out-file "index.md" -append -encoding utf8
		} else {
			write-output "* [$folder]($str)" |  out-file "index.md" -append -encoding utf8
		}
		
	}
}

