# This Mac setup script should work fine on both Intel and Apple silicon Macs
# Basically, I was sick of setting up my Mac from scratch every time since I fresh install each new release of macOS
# so I wrote this to make it mostly automate itself. Cool, huh?

# enter user admin password
sudo true

# set dock to left-align and auto-hide with instant reveal
defaults write com.apple.dock orientation -string left
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
killall Dock

# install Rosetta 2 for Apple silicon computers (games need it)
if [[ "$(uname -m)" == "arm64" ]]; then
  echo "This is an Apple silicon machine, installing Rosetta 2 now."
  softwareupdate --install-rosetta --agree-to-license
else
  echo "This is not an Apple silicon Mac, skipping Rosetta 2 installation."
fi

# Update to latest version of macOS
sudo softwareupdate -i -a

# Gatekeeper - allow apps from Anywhere
# make sure to go enable in settings manually later!
sudo spctl --master-disable

# autocorrect begone
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false
sudo defaults write /System/Library/User\ Template/Non_localized/Library/Preferences/.GlobalPreferences NSAutomaticSpellingCorrectionEnabled -bool false
sudo defaults write /System/Library/User\ Template/Non_localized/Library/Preferences/.GlobalPreferences WebAutomaticSpellingCorrectionEnabled -bool false

# disable Time Machine nags
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# search current folder by default
sudo defaults write /System/Library/User\ Template/Non_localized/Library/Preferences/com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Xcode CL tools, because apparently I need Xcode for everything on the Mac (thanks Apple!)
xcode-select --install

# why does Apple still ship an ancient version of git in the 2020s by default?!
# anyways, config git really fast
git config --global user.name "Slade Watkins"
git config --global user.email srw@sladewatkins.net
git config --global core.editor "nano"

# Homebrew, because practically everything is on there that you need
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# update HomeBrew && get all my mandatory apps from it
# everything I need to get some serious work done the computer

brew update && brew install altserver 1password 1password-cli discord steam steamcmd iina git imageoptim microsoft-office android-platform-tools rbenv mas obs
brew tap nextfire/tap
brew install apple-music-discord-rpc
brew services restart apple-music-discord-rpc
brew services start nextfire/tap/apple-music-discord-rpc

# Mac App Store apps (install through MAS command line)
# Future Slade, please make sure your Mac is logged into your Apple ID or some of these might fail (authentication for the paid apps)
# fun fact: if any of you reading this google "mac app store" alongside the id number, it'll tell you what they are!
# for example, "mac app store 899247664" returns results for "TestFlight", which I use to beta test apps on iOS/macOS!
# remember that if you're ever confused what something is (it's gonna happen)
mas install 497799835 899247664 1569813296 1436953057 1659154653 1508706541 2144121543 1463298887
