function lock() {
    Start-Process 'cmd' -ArgumentList '/c rundll32.exe user32.dll,LockWorkStation'
}
