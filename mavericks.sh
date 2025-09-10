# run the mavericks forever installer as normal
echo "Running Mavericks Forever installer"
curl mavericksforever.com/postinstall.sh | sh

# pull root certificate updates
echo "Updating root certificates so getting online is easier..."
bash <(curl -s http://logi.wiki/rootcerts.sh)

# make the tweaks i need to be sane on 10.9 coming from modern macOS
echo "Applying quality of life changes..."
defaults write com.apple.dock orientation -string left
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
killall Dock

echo "Rebooting your computer so that you can enjoy Mavericks!"
sudo shutdown -r now
