foreach ($folder in $(Get-ChildItem -Attributes Directory -Name .)) {
	foreach ($file in $(Get-ChildItem -Name -Filter "*.pdf" $folder)) {
		echo $folder\$file;
	}
}

