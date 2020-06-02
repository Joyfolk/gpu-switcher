all:

install:
	-systemctl stop gpu-switcher.service
	-systemctl disable gpu-switcher.service
	mkdir -p ${DESTDIR}/usr/bin/
	mkdir -p ${DESTDIR}/etc/gpu-switcher
	echo "MODE: AUTO">/etc/gpu-switcher/gpu-switcher.conf
	cp *.conf /etc/gpu-switcher
	cp gpu-switcher ${DESTDIR}/usr/bin
	cp gpu-switcher.service ${DESTDIR}/etc/systemd/system/
	systemctl daemon-reload
	systemctl enable gpu-switcher.service	

uninstall:
	-systemctl stop gpu-switcher.service
	-systemctl disable gpu-switcher.service
	rm -rf ${DESTDIR}/usr/bin/egpu-switcher
	rm -rf ${DESTDIR}/etc/gpu-switcher
	rm -rf ${DESTDIR}/etc/system/gpu-switcher.service
	systemctl daemon-reload
	systemctl reset-failed	
	
