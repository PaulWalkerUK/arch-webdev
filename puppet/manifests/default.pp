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
