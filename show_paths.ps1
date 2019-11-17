del links.txt

foreach ($folder in $(Get-ChildItem -Attributes Directory -Name .)) {

	if ($folder -like "03. Planos de iter*") {
		write-output "* 03\. Planos de Itera$([char]0x00e7)$([char]0x00e3)o"  |  out-file "links.txt" -append -encoding utf8
		
	}

	foreach ($file in $(Get-ChildItem -Name -Filter "*.pdf" $folder)) {
		$str = "https://github.com/Aendur/engsw-2-2019/blob/master/$folder\$file" 
		$str = $str -replace " ","%20"
		$str = $str -replace "\u00e7","%C3%A7" # replace ç
		$str = $str -replace "\u00e3","%C3%A3" # replace ã
		$str = $str -replace "\\","/" 

		$fld = $folder -replace "`r`n", ""

		if ($folder -like "03. Planos de iter*") {
			write-output "    * [$file]($str)" |  out-file "links.txt" -append -encoding utf8
		} else {
			write-output "* [$folder]($str)" |  out-file "links.txt" -append -encoding utf8
		}
		
	}
}

