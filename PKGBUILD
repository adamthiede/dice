# Maintainer: Adam Thiede <me@adamthiede.com>

_pkgname=dice-gui
pkgname=dice-gui
pkgver=1.3.r9.gb7a5e74
pkgrel=1
pkgdesc="GTK3 Dice Roller with Python CLI"
arch=(x86_64 aarch64)
url="https://gitlab.com/elagost/dice-gui"
license=(GPL3)
depends=(gtk3 python)
makedepends=(git gcc make gtk3 vala python-pylint)
provides=(dice-gui)
source=("dice-gui::git+https://gitlab.com/elagost/dice-gui")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd ${_pkgname}
    make
}

package() {
    cd ${_pkgname}
    PREFIX="${pkgdir}/usr/" make install
}
