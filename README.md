# dice-gui

## simple dice roller project written with gtk and vala

### Files:
- dicevala: dice roller source code
- dice: dice roller binary, built on Fedora 34, should work with any recent-ish Linux distro
- dice.py: dice roller CLI written in python

### Build requirements:
- vala compiler
- c compiler
- gtk3 development files

### Building:
to install/uninstall locally:

`PREFIX=~/.local make install`

`PREFIX=~/.local make uninstall`

to install systemwide:

`make install`

`make uninstall`

## Packages:

Flatpak available at [my signal flatpak repo site](https://elagost.com/flatpak/)

After adding the remote, `flatpak install com.elagost.Dice`

It can be run from ui, or the dice-cli command can be run with `flatpak run --command=dice-cli com.elagost.Dice`

Arch/Fedora packages coming soon. Work on the pkgbuild/spec file is incomplete.
