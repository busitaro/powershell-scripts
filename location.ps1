function getLocation() {
    # GeoWatcher�̎擾
    Add-Type -AssemblyName System.Device
    $GeoWatcher = New-Object System.Device.Location.GeoCoordinateWatcher

    # GeoWather�̊J�n
    $GeoWatcher.Start()

    # GeoWatcher�̈ʒu���擾��ҋ@
    $maxCount = 50
    $retryCount = 0
    while (($GeoWatcher.Status -ne "Ready") -And ($retryCount -le $maxCount)) {
        Start-Sleep -s 1
        $retryCount++
    }

    # �ʒu�����擾�ł��Ă��Ȃ��ꍇ�AIsUnknown�v���p�e�B��True���ݒ�
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
