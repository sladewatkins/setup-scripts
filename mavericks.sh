# run the mavericks forever installer as normal
echo "Running Mavericks Forever installer"
curl mavericksforever.com/postinstall.sh | sh

# pull root certificate updates
echo "Updating root certificates so getting online is easier..."
bash <(curl -s http://logi.wiki/rootcerts.sh)

# Get Xcode Command Line Tools for Mavericks (and accept license terms)
echo "Getting Xcode Command Line Tools and accepting license..."
sudo xcode-select --install
sudo xcodebuild -license

echo "Rebooting your computer so that you can enjoy Mavericks!"
sudo shutdown -r now
