# dice-gui

## simple dice roller project written with gtk and vala

There's also `dice.py` that's a CLI written in Python.

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

Linux aarch64 Flatpak available at [my flatpak repo site](https://elagost.com/flatpak/)

After adding the remote, `flatpak install com.elagost.Dice`

It can be run from ui, or the dice-cli command can be run with `flatpak run --command=dice-cli com.elagost.Dice`

