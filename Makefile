#!\${PREFIX}/bin/env bash
ifndef PREFIX
  PREFIX = /usr/
endif

default:build

build:
	valac --pkg gtk+-3.0 dice.vala -o dice

b4:
	valac --pkg gtk4 dice2.vala -o dice2

4:
	gcc `pkg-config --cflags gtk4` dice2.c -o cdice2 `pkg-config --libs gtk4`
	#gcc -I/usr/include/gtk-4.0 -o dice2 dice2.c $( pkg-config --libs gtk4 )

pylint:
	pylint dice.py

clean:
	rm -f ./dice

all:
	valac --pkg gtk+-3.0 dice.vala -o dice
	pylint dice.py

install:
	mkdir -p ${PREFIX}/share/icons/hicolor/apps/
	mkdir -p ${PREFIX}/share/icons/hicolor/128x128/apps/
	mkdir -p ${PREFIX}/share/icons/hicolor/96x96/apps/
	mkdir -p ${PREFIX}/share/icons/hicolor/72x72/apps/
	mkdir -p ${PREFIX}/share/icons/hicolor/64x64/apps/
	mkdir -p ${PREFIX}/share/icons/hicolor/32x32/apps/
	mkdir -p ${PREFIX}/bin/
	mkdir -p ${PREFIX}/share/applications/
	cp dice.png ${PREFIX}/share/icons/hicolor/apps/
	cp dice_128.png ${PREFIX}/share/icons/hicolor/128x128/apps/dice.png
	cp dice_96.png ${PREFIX}/share/icons/hicolor/96x96/apps/dice.png
	cp dice_72.png ${PREFIX}/share/icons/hicolor/72x72/apps/dice.png
	cp dice_64.png ${PREFIX}/share/icons/hicolor/64x64/apps/dice.png
	cp dice_32.png ${PREFIX}/share/icons/hicolor/32x32/apps/dice.png
	cp dice ${PREFIX}/bin/
	cp dice.py ${PREFIX}/bin/dice-cli
	cp dice.desktop ${PREFIX}/share/applications/
#useful for local builds
	#sed -e "s,Exec=/usr/bin/dice,Exec=${PREFIX}/bin/dice," -i ${PREFIX}/share/applications/dice.desktop

uninstall:
	rm -f ${PREFIX}/share/icons/hicolor/apps/dice.png
	rm -f ${PREFIX}/share/icons/hicolor/128x128/apps/dice.png
	rm -f ${PREFIX}/share/icons/hicolor/96x96/apps/dice.png
	rm -f ${PREFIX}/share/icons/hicolor/72x72/apps/dice.png
	rm -f ${PREFIX}/share/icons/hicolor/64x64/apps/dice.png
	rm -f ${PREFIX}/share/icons/hicolor/32x32/apps/dice.png
	rm -f ${PREFIX}/share/applications/dice.desktop
	rm -f ${PREFIX}/bin/dice
	rm -f ${PREFIX}/bin/dice-cli
