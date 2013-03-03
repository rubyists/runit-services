# Maintainer: Kevin Berry <kb@rubyists.com>
pkgname='runit-services-git'
pkgver=20110919
pkgrel=5
arch=('x86_64' 'i686')
pkgdesc="A collection of commonly used service directories"
url="http://github.com/rubyists/runit-services"
license=('custom')
provides=('runit-services')
depends=('runit')
makedepends=('git')
backup=(/etc/sv/agetty-generic/run /etc/sv/agetty-tty1/run /etc/sv/agetty-tty2/run /etc/sv/agetty-tty3/run /etc/sv/agetty-tty4/run /etc/sv/agetty-tty5/run
        /etc/sv/agetty-tty6/run /etc/sv/apache2/run /etc/sv/avahi/run /etc/sv/bumblebeed/run /etc/sv/couchdb/run /etc/sv/cron/run /etc/sv/cups/run
        /etc/sv/dbus/run /etc/sv/fgetty-generic/run /etc/sv/fgetty-tty2/run /etc/sv/fgetty-tty3/run /etc/sv/freeswitch/run /etc/sv/gdm/run /etc/sv/gssd/run
        /etc/sv/idmapd/run /etc/sv/kdm/run /etc/sv/lighttpd/run /etc/sv/lighttpd2/run /etc/sv/memcached/run /etc/sv/mongodb/run /etc/sv/mysql/run
        /etc/sv/nfs-server/run /etc/sv/ngetty/run /etc/sv/ntpd/run /etc/sv/openntpd/run /etc/sv/openvpn/run /etc/sv/postgresql/run /etc/sv/redis/run
        /etc/sv/rpcbind/run /etc/sv/sshd/run /etc/sv/statd/run /etc/sv/syslog-ng/run)
        
source=('COPYRIGHT' "README.md")
md5sums=('69ec4109404fce21737ac93f9d844d49'
'48e57754259ba7b646ff30868b418fef')


_gitroot="git://github.com/rubyists/runit-services.git"
_gitname="runit-services"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
    else
      git clone --depth=1 $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

}

package() {
    cd "$srcdir/$_gitname/"

    install -D -m 0644 COPYRIGHT "$pkgdir/usr/share/doc/runit-services/COPYRIGHT"
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/runit-services/README.md"
    install -D -d "$pkgdir/etc/sv"

    for service in etc/sv/*;do
      cp -a $service "$pkgdir/etc/sv/"
    done
}
