# Maintainer: Kevin Berry <kb@rubyists.com>
pkgname='runit-services-git'
pkgver=20110427
pkgrel=1
pkgdesc="A collection of commonly used service directories"
arch=('all')
url="http://github.com/rubyists/runit-services"
license=('custom')
provides=('runit-services')
depends=('runit')
makedepends=('git')
optdepends=('socklog-dietlibc: advanced logging system' 'runit-services: a collection of commonly used service directories')
source=('COPYRIGHT')
md5sums=('00378d23a0f0d8bb6dbc60d9f0578b7c')

_gitroot="https://github.com/rubyists/runit-services.git"
_gitname="runit-services"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

}

package() {
  cd "$srcdir/$_gitname-build/"
  for service in etc/sv/*;do
    cp -a $service $pkgdir/etc/sv/
  done
} 
