function outputLog() {
    param(
        $file,
        $message
    )

    # 日付
    $date = Get-Date -Format "yyyy/MM/dd HH:mm:ss"

    # ログ出力
    Write-Output "${date}: $message" >> $file
}
