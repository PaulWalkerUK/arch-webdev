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
package { 'unzip': ensure => installed }
package { 'nano': ensure => installed }
package { 'php-intl': ensure => installed }
package { 'firefox': ensure => installed }
package { 'composer': ensure => installed }
package { 'mousepad': ensure => installed }

exec { 'flyway':
  command => 'cd /tmp; git clone https://aur.archlinux.org/flyway.git; cd flyway; makepkg -si --noconfirm',
  provider => 'shell',
  user => 'vagrant',
  require => Package['base-devel','git'],
  unless => 'which flyway',
  timeout => 0,
}

file { '/etc/php/conf.d/10_enable_intl.ini':
  ensure => file,
  content => "extension=intl",
  require => Package['php-intl'],
}
