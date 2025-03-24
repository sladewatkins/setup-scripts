# This Mac setup script should work fine on both Intel and Apple silicon Macs
# I've only tested it on an Apple silicon (M2) MacBook Pro running Sonoma (14.4.1).
# Basically, I was sick of setting up my Mac from scratch every time since I fresh install each new release of macOS
# so I wrote this to make it mostly automate itself. Cool, huh?

# Xcode CL tools, because apparently I need Xcode for everything on the Mac (thanks Apple!)
xcode-select --install

# Homebrew, because practically everything is on there that you need
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

# get all my mandatory apps from Homebrew
# everything I need to get some serious work done the computer
brew install altserver 1password 1password-cli discord alfred steam steamcmd iina git hiddenbar imageoptim microsoft-office android-platform-tools rbenv mas

# why does Apple still ship an ancient version of git in the 2020s by default?!
# anyways, config git really fast
git config --global user.name "Slade Watkins"
git config --global user.email srw@sladewatkins.net
git config --global core.editor "nano"

# Mac App Store apps (install through MAS command line)
# Future Slade, please make sure your Mac is logged into your Apple ID or some of these might fail (authentication for the paid apps)
# fun fact: if any of you reading this google "mac app store" alongside the id number, it'll tell you what they are!
# for example, "mac app store 899247664" returns results for "TestFlight", which I use to beta test apps on iOS/macOS!
# remember that if you're ever confused what something is (it's gonna happen)
mas install 497799835 899247664 1569813296 1436953057 1659154653 1508706541 2144121543 1463298887

# get devkitpro
# mainly for rverse and other Nintendo homebrew stuff
wget https://apt.devkitpro.org/install-devkitpro-pacman
   chmod +x ./install-devkitpro-pacman
   sudo ./install-devkitpro-pacman
sudo installer -pkg devkitpro-pacman-installer.pkg -target /
