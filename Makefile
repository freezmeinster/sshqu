build:
	@go build
instdep:
	@go get github.com/gliderlabs/ssh
	@go get github.com/kr/pty
deb:
	@echo "Clean old build dir === OK"
	@rm -rf uiid/
	@rm -f *.deb
	@echo "Create build dir === OK"
	@mkdir -p uiid/DEBIAN
	@mkdir -p uiid/usr/local/bin
	@mkdir -p uiid/lib/systemd/system
	@echo "Copy control file === OK"
	@cp conf/control uiid/DEBIAN/
	@cp conf/postinst uiid/DEBIAN/
	@cp conf/postrm uiid/DEBIAN/
	@echo "Copy binary file === OK"
	@cp conf/uiid.service uiid/lib/systemd/system
	@cp sshqu uiid/usr/local/bin/uiid
	@dpkg-deb --build uiid
