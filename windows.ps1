Write-Host "Removing Microsoft Edge and instaling Edge WebView."
iex "&{$(irm https://cdn.jsdelivr.net/gh/he3als/EdgeRemover@main/get.ps1)} -UninstallEdge -RemoveEdgeData -InstallWebView"
Write-Host "Installing applications..."
winget install AgileBits.1Password AgileBits.1Password.CLI Google.Chrome Valve.Steam Valve.SteamCMD EpicGames.EpicGamesLauncher GOG.Galaxy Microsoft.Office Microsoft.PowerToys GitHub.GitHubDesktop Git.Git Notepad++.Notepad++ goatcorp.XIVLauncher Ookla.Speedtest.CLI Ookla.Speedtest.Desktop OBSProject.OBSStudio ChatterinoTeam.Chatterino ShareX.ShareX REALiX.HWiNFO 9NM4T8B9JQZ1 Microsoft.WindowsTerminal 7zip.7zip CiderCollective.Cider --accept-package-agreements --accept-source-agreements
Start-Process "https://github.com/sorayuki/obs-multi-rtmp/releases/download/0.7.3/obs-multi-rtmp-0.7.3.0-windows-x64-Installer.exe"
if (Get-WmiObject Win32_VideoController | Where-Object { $_.Name -like "*NVIDIA*" }) {
    Write-Host "An NVIDIA graphics card was detected. Running the NVIDIA App install script..."
    
    irm https://raw.githubusercontent.com/emilwojcik93/Install-NvidiaApp/refs/heads/main/Install-NvidiaApp.ps1 | iex
    
} else {
    Write-Host "NVIDIA graphics card not detected. Skipping..."
}
if (Get-WmiObject Win32_VideoController | Where-Object { $_.Name -like "*AMD*" }) {
    Write-Host "An AMD graphics card was detected. Running the AMD driver installation script..."
    
    Start-Process "https://drivers.amd.com/drivers/installer/25.10/whql/amd-software-adrenalin-edition-25.9.1-minimalsetup-250901_web.exe"
    
} else {
    Write-Host "AMD graphics card not detected. Skipping..."
}
Write-Host "Now installing WSL - Ubuntu 24.04!"
wsl --install --distribution Ubuntu-24.04
Write-Host "All done! The computer will restart in 15 seconds to apply all settings. If you installed any drivers, NVIDIA or AMD, note that you'll HAVE to open their respective apps to check for updates and configure settings!"
Restart-Computer -Timeout 15
