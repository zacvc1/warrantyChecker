

function get_device_info($serial){
    $url = "https://pcsupport.lenovo.com/gb/en/products/$serial/warranty"
    $req = Invoke-WebRequest -uri $url -Method "GET"
    $content_array = $req.Content.split("};")
    $json = $content_array[0].split(" || ")
    $json = "[" + $json[1] + "}]" | ConvertFrom-Json
    return $json
}



$serial = Read-Host "Enter serial: "

$device_info = get_device_info ($serial)

Write-Host "Serial Number: "$device_info.serialnumber -ForegroundColor Green
Write-Host "Warranty Status: "$device_info.warrantystatus -ForegroundColor Green

