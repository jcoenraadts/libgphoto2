## Compile the IO library into a libtool module shared library
iolib_LTLIBRARIES = usbdiskdirect.la

usbdiskdirect_la_LDFLAGS = -module -no-undefined -avoid-version \
	-export-dynamic \
	-export-symbols $(top_srcdir)/iolib.sym
usbdiskdirect_la_CPPFLAGS = $(AM_CPPFLAGS) $(INTL_CFLAGS) $(CPPFLAGS)
usbdiskdirect_la_DEPENDENCIES = $(top_srcdir)/iolib.sym
usbdiskdirect_la_LIBADD =				\
	$(top_builddir)/libgphoto2_port/libgphoto2_port.la	\
	$(SERIAL_LIBS)						\
	$(INTLLIBS)
usbdiskdirect_la_SOURCES = linux.c
