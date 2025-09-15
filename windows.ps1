iex "&{$(irm https://cdn.jsdelivr.net/gh/he3als/EdgeRemover@main/get.ps1)} -UninstallEdge -RemoveEdgeData -InstallWebView"
wsl --install --distribution Ubuntu-24.04
winget install AgileBits.1Password AgileBits.1Password.CLI Google.Chrome Valve.Steam Valve.SteamCMD EpicGames.EpicGamesLauncher GOG.Galaxy Roblox.Roblox Microsoft.Office Microsoft.PowerToys GitHub.GitHubDesktop Git.Git Notepad++.Notepad++ goatcorp.XIVLauncher Ookla.Speedtest.CLI Ookla.Speedtest.Desktop OBSProject.OBSStudio ChatterinoTeam.Chatterino ShareX.ShareX REALiX.HWiNFO 9NM4T8B9JQZ1 Microsoft.WindowsTerminal --accept-package-agreements --accept-source-agreements
Start-Process "https://cdn.cider.sh/winget/cider-v3.1.0-windows-x64.exe"
Start-Process "https://github.com/sorayuki/obs-multi-rtmp/releases/download/0.7.3/obs-multi-rtmp-0.7.3.0-windows-x64-Installer.exe"
irm https://raw.githubusercontent.com/emilwojcik93/Install-NvidiaApp/refs/heads/main/Install-NvidiaApp.ps1 | iex
Write-Host "All done! The computer will restart in 15 seconds to apply all settings. You will want to open the NVIDIA app when it does."
Restart-Computer -Timeout 15
