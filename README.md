# powershell-scripts

## 一覧

| スクリプト名                                 | 概要                             |
| -------------------------------------------- | -------------------------------- |
| [poiner-watch.ps1](./pointer-watch.ps1)      | ポインタの位置監視               |
| [location.ps1](./location.ps1)               | 位置情報取得                     |
| [lock.ps1](./lock.ps1)                       | windows のアカウントロック       |
| [lock-by-pointer.ps1](./lock-by-pointer.ps1) | ポインタ位置監視結果によりロック |
| [logging.ps1](./logging.ps1)                 | ログ出力                         |

## 使い方

### pointer-watch.ps1

```
. .\pointer-watch.ps1

$prevPosition = readStorePosition
$nowPosition = getPointerPosition
storePosition $nowPosition

$same = isMaxSameCountOvered $prevPosition $nowPosition
if ($same) {
    return $true
} else {
    return $false
}
```

### location.ps1

```
. .\location.ps1
$location = getLocation
echo $location.Latitude # 緯度
echo $location.longitude # 経度
```

### lock.ps1

```
. .\lock.ps1

lock
```

### logging.ps1

```
. .\logging.ps1
outputLog "/path/to/logfile" "message"
```
