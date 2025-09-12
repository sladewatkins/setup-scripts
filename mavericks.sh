# run the mavericks forever installer as normal
echo "Running Mavericks Forever installer"
curl mavericksforever.com/postinstall.sh | sh

# pull root certificate updates
echo "Updating root certificates so getting online is easier..."
bash <(curl -s http://logi.wiki/rootcerts.sh)

echo "Rebooting your computer so that you can enjoy Mavericks!"
sudo shutdown -r now
