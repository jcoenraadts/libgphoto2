## Compile the IO library into a libtool module shared library
iolib_LTLIBRARIES = usbscsi.la

usbscsi_la_LDFLAGS = -module -no-undefined -avoid-version \
	-export-dynamic \
	-export-symbols $(top_srcdir)/iolib.sym
usbscsi_la_CPPFLAGS = $(AM_CPPFLAGS) $(INTL_CFLAGS) $(CPPFLAGS)
usbscsi_la_DEPENDENCIES = $(top_srcdir)/iolib.sym
usbscsi_la_LIBADD =				\
	$(top_builddir)/libgphoto2_port/libgphoto2_port.la	\
	$(SERIAL_LIBS)						\
	$(INTLLIBS)
usbscsi_la_SOURCES = linux.c
