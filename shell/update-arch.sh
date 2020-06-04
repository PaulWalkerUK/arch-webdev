# Update catalog

# Backup existing mirrorlist
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup

# If pre-prepared mirrorlist already exists in .\vagrant then use that,
# otherwise generate one
FILE=/vagrant/mirrorlist
if [ -f "$FILE" ]; then
    echo "$FILE exists"
    cp $FILE /etc/pacman.d/mirrorlist
else 
    echo "$FILE does not exist"
    curl -s "https://www.archlinux.org/mirrorlist/?country=GB&country=FR&protocol=http&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' > /etc/pacman.d/mirrorlist
fi

# Update existing packages
. /vagrant/shell/set_proxy.sh
pacman -Syyuu --noconfirm

## Maybe needed for vbox desktop? Seems OK without
#pacman -S --noconfirm --needed xf86-video-vmware

#pacman -S --noconfirm --needed base-devel
#pacman -S --noconfirm --needed git
#pacman -S --noconfirm --needed dosfstools
#pacman -S --noconfirm --needed openssh
#pacman -S --noconfirm --needed os-prober
#pacman -S --noconfirm --needed mtools
#pacman -S --noconfirm --needed linux-headers
#pacman -S --noconfirm --needed linux-lts
#pacman -S --noconfirm --needed linux-lts-headers
#pacman -S --noconfirm --needed network-manager-applet
#pacman -S --noconfirm --needed networkmanager
#pacman -S --noconfirm --needed wireless_tools
#pacman -S --noconfirm --needed wpa_supplicant
#pacman -S --noconfirm --needed dialog