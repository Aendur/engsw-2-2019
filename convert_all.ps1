# & "D:\Program Files\LibreOffice\program\swriter.exe" --headless --convert-to pdf ".\1. Project Defined Process\Project Defined Process.rtf" 


foreach ($folder in $(Get-ChildItem -Attributes Directory -Name .)) {
	foreach ($file in $(Get-ChildItem -Name -Filter "*.rtf" $folder)) {
		echo $folder\$file;
		Start-Process -Wait "D:\Program Files\LibreOffice\program\swriter.exe" -ArgumentList "--headless --convert-to pdf `"$folder\$file`" --outdir `"$folder`" " 
	}
}

#  --outdir "$folder"'