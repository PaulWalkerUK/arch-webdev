$use_proxy = lookup('http_proxy.use', Boolean)
$http_proxy = lookup('http_proxy.value', String)

if $use_proxy {
  notice ("Setting proxy to: $http_proxy")
  set_env {'http_proxy': value => $http_proxy }
}

include vbox_guest_additions
include locales
include xorg
include lightdm
include xfce

package { 'base-devel': ensure => installed }

package { 'git': ensure => installed }

exec { 'flyway':
        command => 'cd /tmp; git clone https://aur.archlinux.org/flyway.git; cd flyway; makepkg -si --noconfirm',
        provider => 'shell',
        user => 'vagrant',
        require => Package['base-devel','git'],
        unless => 'which flyway',
}