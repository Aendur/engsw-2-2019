foreach ($folder in $(Get-ChildItem -Attributes Directory -Name .)) {
	foreach ($file in $(Get-ChildItem -Name -Filter "*.pdf" $folder)) {
		copy "$folder\$file" "send\$folder\$file"
	}
}

copy "LEIA-ME.txt"  "send\LEIA-ME.txt"

