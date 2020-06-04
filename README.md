# vagrant-base_arch

This Vagrant file sets up a minimal Arch Linux with a GUI desktop. It is very 
minimal and provides a base for more useful variations.

More specifically, it sets up:
* Arch Linux
* VirtualBox Guest Additions with X support
* Xorg Server
* LightDM
* XFCE

## Note ##
A proxy is currently defined in two places - this will almost certainly need 
removing for anyone else (I'll look to improve this in the future). It needs
removing from:
* `shell/set_proxy.sh`
* `puppet/data/common.yaml`

## Using This Template

After making a new repository from this template, if you want to keep up to date with this changes to the template, you can:

 * Add the template repo as a remote: `git remote add template https://github.com/PaulWalkerUK/vagrant-base_arch.git`
 * Update the template remote: `git fetch template`
 * Merge the changes: `git merge template/master --allow-unrelated-histories`
 
 (Credit: https://stackoverflow.com/questions/56577184/github-pull-changes-from-a-template-repository)
