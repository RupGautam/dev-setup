#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew tap homebrew/versions
brew tap homebrew/science
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install git and set global config variables
brew install git
git.config --global user.name “Rup Gautam”
git.config --global user.email “rup.gautam@yahoo.com”
git.config --global credential.helper osxkeychain

# Install `wget` with IRI support.
brew install wget --with-iri

# Install Python
brew install python
brew install python3

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install htop
brew install nmap
brew install fdupes #find dup files

# Install other useful binaries.
brew install dark-mode
brew install git-lfs
brew install git-flow
brew install git-extras
brew install imagemagick --with-webp
brew install pv
brew install rename
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install pkg-config libffi
brew install id3tool
brew install rtmpdump
brew install ffmpeg --with-fdk-aac --with-libvorbis --with-libvpx --with-theora
sudo npm install -g cordova
npm install phonegap -g

# Install Heroku
brew install heroku-toolbelt
heroku update

# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions # need to add tap before installing different versions of apps. e.g: sublime-text2 sublime-text3
brew update 

# Core casks
#brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" java
brew cask install --appdir="/Applications" xquartz

# Development tool casks
brew cask install --appdir="/Applications" sublime-text3
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" heroku-toolbelt
brew cask install --appdir="/Applications" macdown

# Misc casks
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" skype
#brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" dropbox
#brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" teamviewer
brew cask install --appdir="/Applications" handbrake
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" caffeine
brew cask install --appdir="/Applications" chromecast
brew cask install --appdir="/Applications" mysqlworkbench
brew cask install --appdir="/Applications" mac2imgur
brew cask install --appdir="/Applications" bittorrent
brew cask install --appdir="/Applications" cyberduck
brew cask install --appdir="/Applications" timemachinescheduler
brew cask install --appdir="/Applications" wireshark
brew cask install --appdir="/Applications" namechanger
brew cask install --appdir="/Applications" sketch
brew cask install --appdir="/Applications" microsoft-office




#brew cask install --appdir="/Applications" gimp
#brew cask install --appdir="/Applications" inkscape

#Remove comment to install LaTeX distribution MacTeX
#brew cask install --appdir="/Applications" mactex

# Link cask apps to Alfred
#brew cask alfred link

# Install Docker, which requires virtualbox
#brew install docker
#brew install boot2docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# Remove outdated versions from the cellar.
brew cleanup && brew update && brew upgrade

# Installing private/non-supported homebrew apps | tap private repo
# brew tap repo-name/homebrew-cask https://github.com/user/repo-name.git;
# brew cask install repo-name;
