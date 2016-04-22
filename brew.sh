#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

#--------------------------------------------------------------------------------
# Keep-alive: update existing `sudo` time stamp until the script has finished.
#--------------------------------------------------------------------------------
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#--------------------------------------------------------------------------------
# Check for Homebrew and nstall if we don't have it
#--------------------------------------------------------------------------------
if test ! $(which brew); then
  echo -e "---Installing homebrew---"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#--------------------------------------------------------------------------------
# Install zsh and copy my .zshrc file.
#--------------------------------------------------------------------------------
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo -e "---Creating a symbolic link for .zshrc---"
cp -r init/zshrc ~/.zshrc

#--------------------------------------------------------------------------------
# Make sure we’re using the latest Homebrew.
#--------------------------------------------------------------------------------
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names



#--------------------------------------------------------------------------------
# Install latest bash and completion2
#--------------------------------------------------------------------------------
brew install bash
brew tap homebrew/versions
brew install bash-completion2
# We installed the new shell, now we have to activate it.
echo -e "---Adding the newly installed shell to the list of allowed shells---"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

#--------------------------------------------------------------------------------
# Install git and configure global variables.
#--------------------------------------------------------------------------------
brew install git
git.config --global user.name “Rup Gautam”
git.config --global user.email “rup.gautam@yahoo.com”
git.config --global credential.helper osxkeychain

#--------------------------------------------------------------------------------
#Installing some useful tools like wget,ffmpeg,rename etc.
#--------------------------------------------------------------------------------
brew install wget --with-iri
brew install nmap
brew install dns2tcp
brew install pngcheck
brew install tcptrace
brew install aircrack-ng
brew install bfg
brew install binutils
brew install dark-mode
brew install p7zip
brew install unrar
brew install pigz
brew install pv
brew install rename
brew install speedtest_cli
brew install id3tool
brew install rtmpdump
brew install ffmpeg --with-fdk-aac --with-libvorbis --with-libvpx --with-theora
brew install glib xz gmp gnutls libgcrypt d-bus geoip  c-ares lua portaudio #required for wireshark to work well.
brew install wireshark --with-qt #than only install wireshark 

#--------------------------------------------------------------------------------
# Installing Python
#--------------------------------------------------------------------------------
brew install python
brew install python3

#--------------------------------------------------------------------------------
# Install ruby-build and rbenv
#--------------------------------------------------------------------------------
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

#--------------------------------------------------------------------------------
# Install node,npm & gems packages
#--------------------------------------------------------------------------------
brew install node
sudo npm install -g ios-sim #needs sudo
sudo npm install -g yo #needs sudo
sudo npm install -g generator-angular-fullstack #needs sudo
sudo npm install -g grunt-cli #needs sudo
sudo npm install -g bower #needs sudo
echo -e "---Installing  gems too---"
sudo gem install cocoapods
sudo gem install cocoapods-keys

#--------------------------------------------------------------------------------
# Install more recent versions of some OS X tools.
#--------------------------------------------------------------------------------
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

#--------------------------------------------------------------------------------
# Install useful font tools.
#--------------------------------------------------------------------------------
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2
echo -e "--- Downloading powerline fonts ---"
git clone https://github.com/powerline/fonts.git && cd fonts
sudo chmod +x install.sh && ./install.sh
sudo rm -rf fonts

#--------------------------------------------------------------------------------
# Install pdf tools.
#--------------------------------------------------------------------------------
brew tap homebrew/x11 && brew update
brew install xpdf

#--------------------------------------------------------------------------------
# Install git and zipping tools.
#--------------------------------------------------------------------------------
brew install git-lfs
brew install git-flow
brew install git-extras
brew install imagemagick --with-webp
brew install ssh-copy-id
brew install tree

#--------------------------------------------------------------------------------
# Install Heroku tools
#--------------------------------------------------------------------------------
brew install heroku-toolbelt
heroku update

#--------------------------------------------------------------------------------
# Install cask
#--------------------------------------------------------------------------------
brew install caskroom/cask/brew-cask
brew update && brew cleanup

#--------------------------------------------------------------------------------
# Development tools casks.
#--------------------------------------------------------------------------------
brew cask install --appdir="/Applications" sublime-text3
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" heroku-toolbelt
brew cask install --appdir="/Applications" macdown
#brew cask install --appdir="/Applications" mou #But I'm using macdown. :(
brew cask install --appdir="/Applications" mysqlworkbench
brew cask install --appdir="/Applications" sketch
brew cask install --appdir="/Applications" genymotion
#brew cask install --appdir="/Applications" docker
#brew cask install --appdir="/Applications" boot2docker

#--------------------------------------------------------------------------------
# Development tools casks.
#--------------------------------------------------------------------------------
brew cask install --appdir="/Applications" airmail-beta #very best email client so far.
brew cask install --appdir="/Applications" 1password #my external memory
brew cask install --appdir="/Applications" appcleaner #trash that shit app
brew cask install --appdir="/Applications" telegram #I don't use it, but I can't delete it.
brew cask install --appdir="/Applications" caffeine #yes please double double
brew cask install --appdir="/Applications" teamviewer #for helping tech dummies
brew cask install --appdir="/Applications" carbon-copy-cloner #just incase osx/I  screwed 
brew cask install --appdir="/Applications" chitchat #Whatsapp desktop clone
brew cask install --appdir="/Applications" firefox #no words
brew cask install --appdir="/Applications" mac2imgur #upload screenshot to imgur
brew cask install --appdir="/Applications" gpgtools #cuz snowden uses it
brew cask install --appdir="/Applications" goofy # FB messanger for Desktop
brew cask install --appdir="/Applications" silverlights #netflix and beinsports' living pills
brew cask install --appdir="/Applications" dropbox #saves me some spaces
brew cask install --appdir="/Applications" skype #hello mom!
brew cask install --appdir="/Applications" spectacle #less messy windows
brew cask install --appdir="/Applications" spotify #pumpit up
brew cask install --appdir="/Applications" microsoft-office #get ur own license 
brew cask install --appdir="/Applications" cyberduck #Hey! duck carry this to server2

#--------------------------------------------------------------------------------
# Install quick look plugins.
#--------------------------------------------------------------------------------
brew cask install qlstephen \
                qlmarkdown \
                quicklook-json \
                qlprettypatch \
                quicklook-csv \
                betterzipql \
                qlimagesize \
                webpquicklook \
                suspicious-package


--------------------------------------------------------------------------------
# Finishing up everthing. And removing outdated versions
--------------------------------------------------------------------------------
brew cleanup && brew update && brew upgrade
echo -e "Done brewing this machine, Please wait ...."



--------------------------------------------------------------------------------
#Thank you @donnemartin/dev-setup and many others.
--------------------------------------------------------------------------------



