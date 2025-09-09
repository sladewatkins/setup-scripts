# Setup Scripts
I use these to automate the setup of my computers and get running within a few minutes, because I was tired of having to download a trillion things separately. These are dependent on its operating system (usually Linux or macOS), and as such, are quite literally tailored towards me. I wouldn't recommend using them for your own systems (unless you modify them for yourself, of course, or really feel like being *me* today for some reason.)

## macOS
Copy, paste, then run this command in **Terminal.app**. Keep in mind, it's setting up the Terminal and all apps on the system to act like me, not you. I would actually recommend you fork this repo and change the scripts yourself first.

```
/bin/bash -c "$(curl -fsSL https://setup.sladewatkins.com/mac)"
```

This script requires [macOS Sonoma (14.x)](https://apps.apple.com/us/app/macos-sonoma/id6450717509?mt=12), macOS Sequoia (15.x), or macOS Tahoe (26.x). It should work fine on Intel Macs, but I've only tested on Apple silicon (M2 & M4).

## Windows 11
**NOTICE**: I won't support this script for Windows 10. I only recommend running this on Windows 11 24H2 or later.

Run the file in ``windows.ps1``, or simply copy/paste this into Windows Terminal:

```
irm https://setup.sladewatkins.com/win | iex
```

If for whatever reason you get an error, try running this command instead:

```
iex (curl.exe -s --doh-url https://1.1.1.1/dns-query https://setup.sladewatkins.com/win | Out-String)
```

**NOTE**: This script relies heavily on [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/) to simplify getting and installing software. It includes flags to auto accept the EULA for the Microsoft Store and other package license agreements. If you do not agree with these terms, do not run the script.

## Pop!_OS 22.04 / 24.04
Coming soon.
