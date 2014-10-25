CFLAGS += -DNO_XOPEN -Os
VERSION ?= 1.0.3
BUILD_NUMBER ?= 0

lndir: lndir.c
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

.PHONY: rpm
rpm: lndir
	fpm -s dir -t rpm -n lndir --url http://cgit.freedesktop.org/xorg/util/lndir --vendor Xorg -v $(VERSION) --iteration $(BUILD_NUMBER) --prefix /usr/bin $^

.PHONY: clean
clean:
	rm -f lndir lndir-*.rpm
