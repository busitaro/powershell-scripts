. "${PSScriptRoot}\lock.ps1"
. "${PSScriptRoot}\pointer-watch.ps1"

$prevPosition = readStorePosition
$nowPosition = getPointerPosition
storePosition($nowPosition)

$sameCountOver = isMaxSameCountOvered($prevPosition, $nowPosition)

if ($sameCountOver) {
    lock
}
