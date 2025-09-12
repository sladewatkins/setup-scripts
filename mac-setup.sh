# This Mac setup script should work fine on both Intel and Apple silicon Macs
# Basically, I was sick of setting up my Mac from scratch every time since I fresh install each new release of macOS
# so I wrote this to make it mostly automate itself. Cool, huh?

# enter user admin password
sudo true

# Install Xcode Command Line Tools (plus accept license)
echo "Getting Xcode Command Line Tools and accepting license..."
sudo xcode-select --install
sudo xcodebuild -license

# set dock to left-align and auto-hide with instant reveal
echo "Setting dock to left side of screen and turning on auto-hide with instant reveal..."
defaults write com.apple.dock orientation -string left
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
killall Dock

# Homebrew, because practically everything is on there that you need
echo "Checking if Homebrew is installed..."
if test ! $(which brew); then
  echo "Homebrew is not installed. Running installer..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install Rosetta 2 for Apple silicon computers (games need it)
if [[ "$(uname -m)" == "arm64" ]]; then
  echo "This is an Apple silicon Mac, installing Rosetta 2 and Silicon Info now."
  softwareupdate --install-rosetta --agree-to-license
  brew install silicon-info
else
  echo "This is not an Apple silicon Mac, skipping Rosetta 2 and Silicon Info installation."
fi

# Gatekeeper - allow apps from Anywhere
# make sure to go enable in settings manually later!
echo "Enabling hidden Apps from Anywhere option in the Privacy & Security menu."
sudo spctl --master-disable
echo "Enabled, make sure to go enable that manually in System Settings once the script is finished running."

# autocorrect begone
echo "Disabling Autocorrect..."
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false
sudo defaults write /System/Library/User\ Template/Non_localized/Library/Preferences/.GlobalPreferences NSAutomaticSpellingCorrectionEnabled -bool false
sudo defaults write /System/Library/User\ Template/Non_localized/Library/Preferences/.GlobalPreferences WebAutomaticSpellingCorrectionEnabled -bool false
echo "Autocorrect disabled."

# disable Time Machine nags
echo "Disabling nags to enable Time Machine backups of this machine."
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
echo "Time Machine nags are now disabled."

# search current folder by default
echo "Setting Finder to seearch the current folder by default..."
sudo defaults write /System/Library/User\ Template/Non_localized/Library/Preferences/com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
echo "Finder will now search the current folder by default."

# why does Apple still ship an ancient version of git in the 2020s by default?!
# anyways, config git really fast
echo "Configuring git with user name, email, and editor now."
git config --global user.name "Slade Watkins"
git config --global user.email srw@sladewatkins.net
git config --global core.editor "nano"
echo "Configured git."

# update HomeBrew && get all my mandatory apps from it
# everything I need to get some serious work done the computer
echo "Now updating Homebrew and installing applications."
brew update && brew install altserver 1password 1password-cli discord steam steamcmd prismlauncher iina git imageoptim microsoft-office android-platform-tools rbenv mas obs roblox
brew tap nextfire/tap
brew install apple-music-discord-rpc
brew services restart apple-music-discord-rpc
brew services start nextfire/tap/apple-music-discord-rpc
echo "Homebrew has been updated and applications are installed."

# Mac App Store apps (install through MAS command line)
# Future Slade, please make sure your Mac is logged into your Apple ID or some of these might fail (authentication for the paid apps)
# fun fact: if any of you reading this google "mac app store" alongside the id number, it'll tell you what they are!
# for example, "mac app store 899247664" returns results for "TestFlight", which I use to beta test apps on iOS/macOS!
# remember that if you're ever confused what something is (it's gonna happen)
echo "Installing apps from the Mac App Store."
mas install 497799835 899247664 1569813296 1436953057 1659154653 1508706541 2144121543 1463298887
echo "All apps from the Mac App Store have been installed..."

# Make sure you're on the latest version of macOS and have ALL updates
echo "Now updating macOS to the latest version available for this machine..."
sudo softwareupdate -i -a

echo "Updates complete. Rebooting now."
sudo shutdown -r now 
