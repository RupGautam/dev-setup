# Most have CLIs'
brew install linode-cli #manage linode nodes from terminal
npm install -g cloudflare-cli #manage domain names from terminal
gem install tugboat #manage DO droplets from terminal

# Powerline fonts
git clone https://github.com/powerline/fonts.git && cd fonts
sudo chmod +x install.sh && ./install.sh
sudo rm -rf fonts
# Install fonts
brew tap caskroom/fonts
brew update
brew cask install font-roboto
brew cask install font-roboto-slab
brew cask install font-ubuntu
brew cask install font-anonymous-pro
brew cask install font-droid-sans
#brew cask install font-droid-sans-mono
#brew cask install font-droid-serif
#brew cask install font-nexa
brew cask install font-open-sans
#brew cask install font-open-sans-condensed
brew cask install font-source-code-pro

# Install npm packages
sudo npm install -g ios-sim
sudo npm install -g yo
sudo npm install -g generator-angular-fullstack
sudo npm install -g grunt-cli
sudo npm install -g bower

# Install gems
sudo gem install cocoapods
sudo gem install cocoapods-keys

# Install Xcode package manager
curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh



