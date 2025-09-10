# run the mavericks forever installer as normal
curl mavericksforever.com/postinstall.sh | sh

# pull root certificate updates
bash <(curl -s http://logi.wiki/rootcerts.sh)

# make the tweaks i need to be sane on 10.9 coming from modern macOS
defaults write com.apple.dock orientation -string left
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
killall Dock
