# Setup Scripts
I use these to automate the [setup of my computers](https://slade.link/setup) and get running within a few minutes, because I was tired of having to download a trillion things separately. These are dependent on its operating system (usually Linux or macOS), and as such, are quite literally tailored towards me. I wouldn't recommend using them for your own systems (unless you modify them for yourself, of course, or really feel like being *me* today for some reason.)

## Macs
I use Macs as my primary daily driver computers, because I find them extremely reliable, especially as they get older. Heck, I've even given my parents my old M2 MacBook Pro and they seem to enjoy it!

For some background: I originally switched away from Windows in 2016 because an old friend gave me a [2010 Mac mini](https://support.apple.com/en-us/112588) and later a 2011 MacBook Pro, which resulted in me falling in love with macOS (I updated to [macOS Sierra](https://512pixels.net/projects/aqua-screenshot-library/macos-10-12-sierra/) from Mavericks as updates stopped in September 2016 and I switched to Mac in November 2016) rather quickly. I've been using Macs in some capacity ever since (although I've had a Windows or Linux computer around, too, as I've gotten into PC games.) You can see the setup I run these days [on my website here](https://slade.link/setup).

### macOS (Tahoe 26.x)

#### Requirements
 - This script requires [macOS 26 Tahoe](https://support.apple.com/en-us/102662) (26.x) and a compatible Mac. 
 - This script requires at least 20GB of free space on your SSD. On a fresh install, this won't be an issue, but it's something to be aware of.
 - This script should work with modern Intel Macs still supported by macOS 26 Tahoe, but as I do not own any, I can't verify that. **You're on your own if you decide to use this on one!**
 - This script *has* been tested on an M2 MacBook Pro (up to macOS Sequoia), M4 Pro MacBook Pro, and M4 Max Mac Studio.
 - This script automatically updates your machine to the latest version of macOS. To opt-out, fork or download it and remove the ``sudo softwareupdate -i -a`` command.
 
#### Recommendations
 - I still highly recommend updating to the latest version of macOS available. This isn't strictly necessary, but prevents any app incompatibilities and ensures you have all security fixes needed for browsing the modern web. If you'd like to opt out of this, note that **the script includes this at the end before the final restart command is issued**. You should fork the script and remove the command you see below. ***Please note that this script is ONLY supported on macOS 26 Tahoe.***

If you're ready to go, paste, then run this command in **Terminal.app**. Keep in mind, it's setting up the Terminal and all apps on the system to act like me, not you. I would actually recommend you fork this repo and change the scripts yourself first.

NOTE: After the script installs Homebrew, you may need to rerun the script again. Push up on the keyboard a couple times until you see it again, or just CMD+V the script address below. Should come right back and eventually continue where it left off!

```
/bin/bash -c "$(curl -fsSL https://slade.link/setup-mac)"
```

### OS X Mavericks
#### Prerequisites 
- Needs to be a [Mavericks-era Mac](https://support.apple.com/en-us/112560) or Hackintosh.
- Do not expect miracles.

For OS X Mavericks capable computers (my 2011 27-inch iMac), I mostly use the guide at [https://www.mavericksforever.com](https://www.mavericksforever.com) to make OS X Mavericks (10.9) usable in the modern era. It's surprisingly pleasant, even in the 2020s!

However, I do make a couple small tweaks in order to be sane coming from newer versions of macOS. You can get those by running this command in terminal:

```
curl slade.link/setup-mav | sh
```

## Windows 11
**NOTICE**: I won't support this script for Windows 10. I only recommend running this on Windows 11 24H2 or later, and even then, it isn't actively updated anymore as I've recently acquired a System76 Thelio Mira and have switched to Linux.

### Prerequisites
- Windows 11 24H2 or later (Insider builds, with the exception of Canary channel, are probably fine)
- Pro Edition or higher. Home Edition is not supported by this script (for now)
- CPU Virtualization must be enabled for Intel (VMX/Intel VT-x) or AMD (AMD-V/SVM). You can do this in BIOS, consult your manufacturer's manual for more information.
- NVIDIA or AMD graphics cards, as my computers only have those. Sorry to the five Intel Arc users...
- Plug laptops or 2-in-1s into power. Trust me.

Run the ``windows.ps1`` file from File Explorer, or simply copy/paste this command into [Windows Terminal](https://github.com/microsoft/terminal) to make things easier:


```
irm https://raw.githubusercontent.com/sladewatkins/setup-scripts/HEAD/windows.ps1 | iex
```

If for whatever reason you get an error, try running this command instead:

```
iex (curl.exe -s --doh-url https://1.1.1.1/dns-query https://raw.githubusercontent.com/sladewatkins/setup-scripts/HEAD/windows.ps1 | Out-String)
```

If you do not have Windows Terminal (should be included on Windows 11), [download it here](https://github.com/microsoft/terminal/releases) or run the following command in Powershell:
```
winget install Microsoft.WindowsTerminal
```

Trust me, you don't want to be using the Powershell or Command Prompt naked in 2025. Terminal is so much nicer.

**NOTE**: This script relies heavily on [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/) to simplify getting and installing software. It includes flags to auto accept the EULA for the Microsoft Store and other package license agreements. If you do not agree with these terms, do not run the script.

## Pop!_OS 22.04 / 24.04
Coming soon.
