$storeFile = '.\store\pointer'
$sameCountFile = '.\store\same'
# 指定回数までポインタが移動しないことを許容
$maxSameCount = 3

function isSame($positions) {
    $position1 = $positions[0]
    $position2 = $positions[1]

    if ($position1.x -eq $position2.x -and $position1.y -eq $position2.y) {
        return $true
    } else {
        return $false
    }
}

function isMaxSameCountOvered($positions) {
    $prevPosition = $positions[0]
    $nowPosition = $positions[1]

    if (isSame($prevPosition, $nowPosition)) {
        $count = readSameCount
        $count++
        if ($count -gt $maxSameCount) {
            storeSame(0)
            return $true
        } else {
            storeSame($count)
            return $false
        }
    } else {
        storeSame(0)
        return $false
    }
}

function getPointerPosition() {
    Add-Type -AssemblyName System.Windows.Forms
    $x = [System.Windows.Forms.Cursor]::Position.X # マウスのX座標
    $y = [System.Windows.Forms.Cursor]::Position.Y # マウスのY座標
    $position = @{}
    $position['x'] = $x
    $position['y'] = $y

    return $position
}

function storePosition($position) {
    echo ${position}.x ${position}.y > $storeFile
}

function readStorePosition() {
    if (Test-Path $storeFile) {
        $files = (Get-Content $storeFile)
        
        if ($files -eq $null) {
            return $null
        } else {
            $lines = $files.Split("\r\n")
            $position = @{}
            $position['x'] = $lines[0]
            $position['y'] = $lines[1]

            return $position
        }
    } else {
        return $null
    }
}

function storeSame($count) {
    echo $count > $sameCountFile
}

function readSameCount() {
    if (Test-Path $sameCountFile) {
        $count = (Get-Content $sameCountFile)
        return [int]$count
    } else {
        return 0
    }
}
