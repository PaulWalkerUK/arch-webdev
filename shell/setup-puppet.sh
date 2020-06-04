. /vagrant/shell/set_proxy.sh

pacman -S --noconfirm --needed puppet

pacman -S --noconfirm --needed rubygems

echo "PATH=\"$PATH:$(ruby -e 'puts Gem.user_dir')/bin\"" >> ~/.profile
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

gem install librarian-puppet

PUPPET_DIR=/etc/puppet/

if [ ! -d "$PUPPET_DIR" ]; then
  mkdir -p $PUPPET_DIR
fi
cp /vagrant/puppet/Puppetfile $PUPPET_DIR

## git is (only) needed if running librarian-puppet with --verbose ( https://github.com/voxpupuli/librarian-puppet/issues/56 )
#pacman -S --noconfirm --needed git
cd $PUPPET_DIR && librarian-puppet install --clean


