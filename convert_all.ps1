
if ($args[0] -like "[0-1][0-9]*") {
	$pattern = @($args[0])
} else {
	$pattern = ""
}

foreach ($folder in $(Get-ChildItem -Attributes Directory -Name .)) {
	foreach ($file in $(Get-ChildItem -Name -Filter "*.rtf" $folder)) {
		if ($folder -like "$pattern*") {
			echo $folder\$file;
			Start-Process -Wait "D:\Program Files\LibreOffice\program\swriter.exe" -ArgumentList "--headless --convert-to pdf `"$folder\$file`" --outdir `"$folder`" " 
		}
	}
}




