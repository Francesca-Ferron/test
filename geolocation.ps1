Add-Type -AssemblyName System.Device
$GeoWatcher = New-Object System.Device.Location.GeoCoordinateWatcher(1)
$GeoWatcher.Start()

while (($GeoWatcher.Status -ne 'Ready') -and ($GeoWatcher.Permission -ne 'Denied')) {
    Start-Sleep -Milliseconds 100
}
$location = $GeoWatcher.Position.Location
$latitude = $location.Latitude
$longitude = $location.Longitude
$googleMapsUrl = "https://www.google.com/maps?q=$latitude,$longitude"

$googleMapsUrl | Out-File -FilePath "C:\eicar.txt" -Encoding UTF8
