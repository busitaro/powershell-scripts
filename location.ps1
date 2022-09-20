function getLocation() {
    # GeoWatcherの取得
    Add-Type -AssemblyName System.Device
    $GeoWatcher = New-Object System.Device.Location.GeoCoordinateWatcher

    # GeoWatherの開始
    $GeoWatcher.Start()

    # GeoWatcherの位置情報取得を待機
    $maxCount = 50
    $retryCount = 0
    while (($GeoWatcher.Status -ne "Ready") -And ($retryCount -le $maxCount)) {
        Start-Sleep -s 1
        $retryCount++
    }

    # 位置情報を取得できていない場合、IsUnknownプロパティにTrueが設定
    return $GeoWatcher.Position.Location
}

function callApi($latitude, $longitude) {
    echo $latitude
    echo $longitude
}

function errorLog() {
    $logFile
}

$location = getLocation
if ($location.isUnknown) {
    errorLog
} else {
    $latitude = $location.Latitude
    $longitude = $location.Longitude
    callApi $latitude $longitude
}
