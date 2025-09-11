# Setup Scripts
I use these to automate the [setup of my computers](https://setup.sladewatkins.com/about) and get running within a few minutes, because I was tired of having to download a trillion things separately. These are dependent on its operating system (usually Linux or macOS), and as such, are quite literally tailored towards me. I wouldn't recommend using them for your own systems (unless you modify them for yourself, of course, or really feel like being *me* today for some reason.)

## macOS (Sonoma and later)

### Prerequisites 
- An Intel or Apple silicon based Mac running macOS Sonoma or later. There is now a check for Apple silicon that will auto-install Rosetta 2 and Silicon Info (which is great for knowing when to blame Rosetta 2 for awful performance!)
- At least 20GB of free space on your drive. We're going to eat a good chunk of it with app installs (mostly Xcode and build caches!)

I am going to go ahead and recommend you update to the latest version of macOS for your machine before starting (command is below). This isn't strictly necessary, but prevents any app incompatibilities and ensures you have all security fixes needed for browsing the modern web. If you'd like to opt out of this, note that **the script includes this at the end before the final restart command is issued**. You should fork the script and remove the command you see below.

```
sudo softwareupdate -i -a
```

Copy, paste, then run this command in **Terminal.app**. Keep in mind, it's setting up the Terminal and all apps on the system to act like me, not you. I would actually recommend you fork this repo and change the scripts yourself first.

```
/bin/bash -c "$(curl -fsSL https://setup.sladewatkins.com/mac)"
```

This script requires [macOS Sonoma (14.x)](https://apps.apple.com/us/app/macos-sonoma/id6450717509?mt=12), macOS Sequoia (15.x), or macOS Tahoe (26.x). It should work fine on Intel Macs, but I've only tested on Apple silicon (M2 & M4).

## OS X Mavericks

### Prerequisites 
- Needs to be a Mavericks-era Mac or Hackintosh.
- Do not expect miracles.

For OS X Mavericks capable computers (my 2011 27-inch iMac), I mostly use the guide at [https://www.mavericksforever.com](https://www.mavericksforever.com) to make OS X Mavericks (10.9) usable in the modern era. It's surprisingly pleasant, even in the 2020s!

However, I do make a couple small tweaks in order to be sane coming from newer versions of macOS. You can get those by running this command in terminal:

```
curl setup.sladewatkins.com/mav | sh
```


## Windows 11
**NOTICE**: I won't support this script for Windows 10. I only recommend running this on Windows 11 24H2 or later.

### Prerequisites
- Windows 11 24H2 or later (Insider builds, with the exception of Canary channel, are probably fine)
- Pro Edition or higher. Home Edition is not supported by this script (for now)
- CPU Virtualization must be enabled for Intel (VMX/Intel VT-x) or AMD (AMD-V/SVM). You can do this in BIOS, consult your manufacturer's manual for more information.
- Plug laptops or 2-in-1s into power. Trust me.

Run the ``windows.ps1`` file from File Explorer, or simply copy/paste this command into [Windows Terminal](https://github.com/microsoft/terminal) to make things easier:


```
irm https://setup.sladewatkins.com/win | iex
```

If for whatever reason you get an error, try running this command instead:

```
iex (curl.exe -s --doh-url https://1.1.1.1/dns-query https://setup.sladewatkins.com/win | Out-String)
```

If you do not have Windows Terminal (should be included on Windows 11), [download it here](https://github.com/microsoft/terminal/releases).

**NOTE**: This script relies heavily on [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/) to simplify getting and installing software. It includes flags to auto accept the EULA for the Microsoft Store and other package license agreements. If you do not agree with these terms, do not run the script.

## Pop!_OS 22.04 / 24.04
Coming soon.
