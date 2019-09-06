NAME = runit-services
SHELL = /bin/bash
INSTALL = /usr/bin/install
MSGFMT = /usr/bin/msgfmt
SED = /bin/sed
DESTDIR =
BINDIR = /usr/bin
DOCDIR = /usr/share/doc/$(NAME)
SRVDIR = /etc/sv

all:

install: all
	$(INSTALL) -d $(DESTDIR)$(BINDIR)
	$(INSTALL) -d $(DESTDIR)$(DOCDIR)
	$(INSTALL) -d $(DESTDIR)$(SRVDIR)
	$(INSTALL) -D -m 0755 rsvlog "$(DESTDIR)$(BINDIR)/rsvlog"
	$(INSTALL) -D -m 0644 COPYRIGHT "$(DESTDIR)$(DOCDIR)/COPYRIGHT"
	$(INSTALL) -D -m 0644 README.md "$(DESTDIR)$(DOCDIR)/README.md"
	for dir in etc/sv/*; do \
		cp -a "$$dir" "$(DESTDIR)$(SRVDIR)/"; \
	done

uninstall:
	rm $(DESTDIR)$(BINDIR)/rsvlog
	rm -r $(DESTDIR)$(DOCDIR)
