function empty-folder() {
    param(
        $folderPath
    )

    foreach($child in Get-ChildItem $folderPath) {
        Remove-Item $child.FullName -Recurse -Force
    }
}
