# powershell-scripts

## 一覧

| スクリプト名                            | 概要               |
| --------------------------------------- | ------------------ |
| [poiner-watch.ps1](./pointer-watch.ps1) | ポインタの位置監視 |

## 使い方

### pointer-watch.ps1

```
. .\pointer-watch.ps1

$prevPosition = readStorePosition
$nowPosition = getPointerPosition
storePosition($nowPosition)

$same = isMaxSameCountOvered($prevPosition, $nowPosition)
if ($same) {
    return $true
} else {
    return $false
}
```
