Received: from mail-pf0-x22e.google.com ([2607:f8b0:400e:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN5w1-0004q0-UT
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 21:41:31 +0000
Received: by mail-pf0-x22e.google.com with SMTP id e65so61071841pfe.0
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 13:41:09 -0800 (PST)
Date: Sat, 23 Jan 2016 13:41:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC][PATCH] mtd-utils: Change build system to autoconf
Message-ID: <20160123214105.GB24744@localhost>
References: <1447891231-16565-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447891231-16565-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 19, 2015 at 01:00:31AM +0100, Richard Weinberger wrote:
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> So, I did it.
> 
> mtd-utils open coded Makefile f***** me more than once.
> I decided to bite the bulled and converted to a major build system.
> Using kbuild for userspace turned out to be more complicated than expected
> and nobody did a sane standalone variant so far.
> While I like cmake a lot I choose automake as it works well for cross builds and embedded Linux environments.
> This patch is a RFC, some bits are still missing, e.g. the tests/ directory.
> 
> Thanks,
> //richard

For a non-RFC version, I still think it'd be good to have more rationale
in the commit message. But in principle, I'd be OK with this change. I'm
not in love with our current set of makefiles.

Among the other things that are still missing: need to modify
'make_a_release.sh'. It makes some assumptions about the build system
(e.g., how to find the VERSION). It would also need to be sure to run
'autoconf' before releases, so the tarballs don't depend on autotools.

I think you also need to fix up the 'WITHOUT_FOO' handling. You've now
made the liblzo dependency a requirement, not optional, and you've
dropped support for 'WITHOUT_XATTR'. I'd like to leave at least the
current level of flexibility in the conversion, and the future, it might
be nice to have more flexibility (e.g., libacl could be optional).

Regards,
Brian

> ---
>  .gitignore            |   5 --
>  Makefile              | 133 ---------------------------------
>  Makefile.am           | 202 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  autogen.sh            |   3 +
>  configure.ac          |  28 +++++++
>  include/common.h      |   1 -
>  nor-utils/rfddump.c   |   4 +-
>  nor-utils/rfdformat.c |   4 +-
>  8 files changed, 237 insertions(+), 143 deletions(-)
>  delete mode 100644 Makefile
>  create mode 100644 Makefile.am
>  create mode 100755 autogen.sh
>  create mode 100644 configure.ac
> 
> diff --git a/.gitignore b/.gitignore
> index 2aac52c..5548e48 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -55,11 +55,6 @@
>  #
>  !.gitignore
>  
> -#
> -# Generated include files
> -#
> -/include/version.h
> -
>  # stgit generated dirs
>  patches-*
>  *.patch
> diff --git a/Makefile b/Makefile
> deleted file mode 100644
> index bd9504a..0000000
> --- a/Makefile
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -
> -# -*- sh -*-
> -
> -VERSION = 1.5.2
> -
> -CPPFLAGS += -D_GNU_SOURCE -I./include -I$(BUILDDIR)/include -I./ubi-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS) $(UUIDCPPFLAGS)
> -
> -ifeq ($(WITHOUT_XATTR), 1)
> -  CPPFLAGS += -DWITHOUT_XATTR
> -endif
> -ifeq ($(WITHOUT_LZO), 1)
> -  CPPFLAGS += -DWITHOUT_LZO
> -else
> -  LZOLDLIBS = -llzo2
> -endif
> -
> -TESTS = tests
> -
> -MISC_BINS = \
> -	ftl_format doc_loadbios ftl_check mtd_debug docfdisk \
> -	serve_image recv_image mtdpart flash_erase flash_lock \
> -	flash_unlock flash_otp_info flash_otp_dump flash_otp_lock \
> -	flash_otp_write flashcp
> -UBI_BINS = \
> -	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
> -	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
> -UBIFS_BINS = \
> -	mkfs.ubifs/mkfs.ubifs
> -JFFSX_BINS = \
> -	mkfs.jffs2 sumtool jffs2reader jffs2dump
> -NAND_BINS = \
> -	nanddump nandwrite nandtest nftldump nftl_format
> -NOR_BINS = \
> -	rfddump rfdformat
> -
> -BINS = $(addprefix misc-utils/,$(MISC_BINS))
> -BINS += $(addprefix ubi-utils/,$(UBI_BINS))
> -BINS += $(addprefix ubifs-utils/,$(UBIFS_BINS))
> -BINS += $(addprefix jffsX-utils/,$(JFFSX_BINS))
> -BINS += $(addprefix nand-utils/,$(NAND_BINS))
> -BINS += $(addprefix nor-utils/,$(NOR_BINS))
> -SCRIPTS = $(addprefix misc-utils/,flash_eraseall)
> -
> -TARGETS = $(BINS)
> -TARGETS += lib/libmtd.a
> -TARGETS += ubi-utils/libubi.a
> -
> -OBJDEPS = $(BUILDDIR)/include/version.h
> -
> -include common.mk
> -
> -CLEAN_FIND = find "$(BUILDDIR)/" -xdev '(' -name '*.[ao]' -o -name '.*.c.dep' ')'
> -
> -clean::
> -ifneq ($(BUILDDIR)/.git,)
> -ifneq ($(BUILDDIR),.)
> -ifneq ($(BUILDDIR),$(CURDIR))
> -	rm -rf $(BUILDDIR)
> -endif
> -endif
> -endif
> -# findutils v4.1.x (RHEL 4) do not have '+' syntax
> -	@if test -d "$(BUILDDIR)/"; then \
> -		$(CLEAN_FIND) -exec rm -f {} + 2> /dev/null || \
> -		$(CLEAN_FIND) -exec rm -f {} \; ; \
> -	fi
> -	rm -f $(BUILDDIR)/include/version.h
> -	$(MAKE) -C $(TESTS) clean
> -
> -install:: $(addprefix $(BUILDDIR)/,${BINS} ${SCRIPTS})
> -	mkdir -p ${DESTDIR}/${SBINDIR}
> -	install -m 0755 $^ ${DESTDIR}/${SBINDIR}/
> -	mkdir -p ${DESTDIR}/${MANDIR}/man1
> -	install -m 0644 jffsX-utils/mkfs.jffs2.1 ${DESTDIR}/${MANDIR}/man1/
> -	-gzip -9f ${DESTDIR}/${MANDIR}/man1/*.1
> -
> -tests::
> -	$(MAKE) -C $(TESTS)
> -
> -cscope:
> -	cscope -bR
> -
> -$(BUILDDIR)/include/version.h: $(BUILDDIR)/include/version.h.tmp
> -	$(call BECHO,CHK)
> -	$(Q)cmp -s $@ $@.tmp && rm -f $@.tmp || mv $@.tmp $@
> -$(BUILDDIR)/include/version.h.tmp:
> -	${Q}mkdir -p $(dir $@)
> -	$(Q)echo '#define VERSION "$(VERSION)"' > $@
> -
> -#
> -# Utils in top level
> -#
> -obj-mkfs.jffs2 = compr_rtime.o compr_zlib.o compr_lzo.o compr.o rbtree.o
> -LDFLAGS_mkfs.jffs2 = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(CPPFLAGS)
> -LDLIBS_mkfs.jffs2  = -lz $(LZOLDLIBS)
> -
> -LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
> -LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
> -
> -$(foreach v,$(MISC_BINS),$(eval $(call mkdep,misc-utils/,$(v))))
> -$(foreach v,$(JFFSX_BINS),$(eval $(call mkdep,jffsX-utils/,$(v))))
> -$(foreach v,$(NAND_BINS),$(eval $(call mkdep,nand-utils/,$(v))))
> -$(foreach v,$(NOR_BINS),$(eval $(call mkdep,nor-utils/,$(v))))
> -
> -#
> -# Common libmtd
> -#
> -obj-libmtd.a = libmtd.o libmtd_legacy.o libcrc32.o libfec.o
> -$(call _mkdep,lib/,libmtd.a)
> -
> -#
> -# Utils in ubi-utils/ subdir
> -#
> -obj-libiniparser.a = libiniparser.o dictionary.o
> -obj-libscan.a      = libscan.o
> -obj-libubi.a       = libubi.o
> -obj-libubigen.a    = libubigen.o
> -
> -obj-mtdinfo   = libubigen.a
> -obj-ubinize   = libubigen.a libiniparser.a
> -obj-ubiformat = libubigen.a libscan.a
> -
> -$(foreach v,libubi.a libubigen.a libiniparser.a libscan.a,$(eval $(call _mkdep,ubi-utils/,$(v))))
> -$(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-common.o)))
> -
> -#
> -# Utils in ubifs-utils subdir
> -#
> -obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o \
> -	hashtable/hashtable.o hashtable/hashtable_itr.o
> -LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
> -LDLIBS_mkfs.ubifs = -lz $(LZOLDLIBS) -lm -luuid
> -$(call mkdep,ubifs-utils/mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
> diff --git a/Makefile.am b/Makefile.am
> new file mode 100644
> index 0000000..d517d96
> --- /dev/null
> +++ b/Makefile.am
> @@ -0,0 +1,202 @@
> +AUTOMAKE_OPTIONS = foreign
> +
> +AM_CPPFLAGS = -D_GNU_SOURCE -I$(top_srcdir)/include
> +
> +MISC_BINS = \
> +	ftl_format doc_loadbios ftl_check mtd_debug docfdisk \
> +	serve_image recv_image flash_erase flash_lock \
> +	flash_unlock flash_otp_info flash_otp_dump flash_otp_lock \
> +	flash_otp_write flashcp
> +
> +NAND_BINS = \
> +	nanddump nandwrite nandtest nftldump nftl_format
> +
> +NOR_BINS = \
> +	rfddump rfdformat
> +
> +UBI_BINS = \
> +	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
> +	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
> +
> +UBIFS_BINS = \
> +	mkfs.ubifs
> +
> +JFFSX_BINS = \
> +	mkfs_jffs2 jffs2dump jffs2reader
> +
> +bin_PROGRAMS = $(MISC_BINS) $(NAND_BINS) $(NOR_BINS) $(UBI_BINS) $(UBIFS_BINS) $(JFFSX_BINS)
> +
> +# internal libs
> +
> +noinst_LIBRARIES = libmtd.a libubi.a libubigen.a
> +
> +libmtd_a_SOURCES = \
> +	lib/libmtd.c \
> +	lib/libfec.c \
> +	lib/libcrc32.c \
> +	lib/libmtd_legacy.c \
> +	lib/libmtd_int.h
> +
> +libubi_a_SOURCES = ubi-utils/libubi.c ubi-utils/ubiutils-common.c ubi-utils/libubi_int.h
> +libubi_a_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +libubigen_a_SOURCES = ubi-utils/libubigen.c
> +libubigen_a_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +# misc-utils
> +
> +ftl_format_SOURCES = misc-utils/ftl_format.c
> +
> +doc_loadbios_SOURCES = misc-utils/doc_loadbios.c
> +
> +ftl_check_SOURCES = misc-utils/ftl_check.c
> +
> +mtd_debug_SOURCES = misc-utils/mtd_debug.c
> +
> +docfdisk_SOURCES = misc-utils/docfdisk.c
> +
> +serve_image_SOURCES = misc-utils/serve_image.c
> +serve_image_LDADD = libmtd.a
> +
> +recv_image_SOURCES = misc-utils/recv_image.c
> +recv_image_LDADD = libmtd.a
> +
> +flash_lock_SOURCES = misc-utils/flash_lock.c
> +
> +flash_unlock_SOURCES = misc-utils/flash_unlock.c
> +
> +flash_otp_info_SOURCES = misc-utils/flash_otp_info.c
> +
> +flash_otp_dump_SOURCES = misc-utils/flash_otp_dump.c
> +
> +flash_otp_lock_SOURCES = misc-utils/flash_otp_lock.c
> +
> +flash_otp_write_SOURCES = misc-utils/flash_otp_write.c
> +
> +flashcp_SOURCES = misc-utils/flashcp.c
> +
> +flash_erase_SOURCES = misc-utils/flash_erase.c
> +flash_erase_LDADD = libmtd.a
> +
> +# nand-utils
> +
> +nanddump_SOURCES = nand-utils/nanddump.c
> +nanddump_LDADD = libmtd.a
> +
> +nandwrite_SOURCES = nand-utils/nandwrite.c
> +nandwrite_LDADD = libmtd.a
> +
> +nandtest_SOURCES = nand-utils/nandtest.c
> +nandtest_LDADD = libmtd.a
> +
> +nftldump_SOURCES = nand-utils/nftldump.c
> +nftldump_LDADD = libmtd.a
> +
> +nftl_format_SOURCES = nand-utils/nftl_format.c
> +nftl_format_LDADD = libmtd.a
> +
> +# nor-utils
> +
> +rfddump_SOURCES = nor-utils/rfddump.c
> +rfddump_LDADD = libmtd.a
> +
> +rfdformat_SOURCES = nor-utils/rfdformat.c
> +rfdformat_LDADD = libmtd.a
> +
> +# ubi-utils
> +
> +ubiupdatevol_SOURCES = ubi-utils/ubiupdatevol.c
> +ubiupdatevol_LDADD = libmtd.a libubi.a
> +ubiupdatevol_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +ubimkvol_SOURCES = ubi-utils/ubimkvol.c
> +ubimkvol_LDADD = libmtd.a libubi.a
> +ubimkvol_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +ubirmvol_SOURCES = ubi-utils/ubirmvol.c
> +ubirmvol_LDADD = libmtd.a libubi.a
> +ubirmvol_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +ubicrc32_SOURCES = ubi-utils/ubicrc32.c
> +ubicrc32_LDADD = libmtd.a libubi.a
> +ubicrc32_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +ubinfo_SOURCES = ubi-utils/ubinfo.c
> +ubinfo_LDADD = libmtd.a libubi.a
> +ubinfo_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +ubiattach_SOURCES = ubi-utils/ubiattach.c
> +ubiattach_LDADD = libmtd.a libubi.a
> +ubiattach_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +ubidetach_SOURCES = ubi-utils/ubidetach.c
> +ubidetach_LDADD = libmtd.a libubi.a
> +ubidetach_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +ubinize_SOURCES = ubi-utils/ubinize.c ubi-utils/libiniparser.c ubi-utils/dictionary.c
> +ubinize_LDADD = libubi.a libubigen.a libmtd.a
> +ubinize_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +ubiformat_SOURCES = ubi-utils/ubiformat.c ubi-utils/libscan.c
> +ubiformat_LDADD = libubi.a libubigen.a libmtd.a
> +ubiformat_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +ubirename_SOURCES = ubi-utils/ubirename.c
> +ubirename_LDADD = libmtd.a libubi.a
> +ubirename_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +mtdinfo_SOURCES = ubi-utils/mtdinfo.c
> +mtdinfo_LDADD = libubi.a libubigen.a libmtd.a
> +mtdinfo_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +ubirsvol_SOURCES = ubi-utils/ubirsvol.c
> +ubirsvol_LDADD = libmtd.a libubi.a
> +ubirsvol_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +ubiblock_SOURCES = ubi-utils/ubiblock.c
> +ubiblock_LDADD = libmtd.a libubi.a
> +ubiblock_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
> +
> +# ubifs-utils
> +
> +mkfs_ubifs_SOURCES = \
> +	ubifs-utils/mkfs.ubifs/mkfs.ubifs.c \
> +	ubifs-utils/mkfs.ubifs/defs.h \
> +	ubifs-utils/mkfs.ubifs/lpt.h \
> +	ubifs-utils/mkfs.ubifs/mkfs.ubifs.h \
> +	ubifs-utils/mkfs.ubifs/crc16.h \
> +	ubifs-utils/mkfs.ubifs/key.h \
> +	ubifs-utils/mkfs.ubifs/compr.h \
> +	ubifs-utils/mkfs.ubifs/ubifs.h \
> +	ubifs-utils/mkfs.ubifs/crc16.c \
> +	ubifs-utils/mkfs.ubifs/lpt.c \
> +	ubifs-utils/mkfs.ubifs/compr.c \
> +	ubifs-utils/mkfs.ubifs/hashtable/hashtable.h \
> +	ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h \
> +	ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h \
> +	ubifs-utils/mkfs.ubifs/hashtable/hashtable.c \
> +	ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c \
> +	ubifs-utils/mkfs.ubifs/devtable.c
> +mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(UUID_LIBS) -lm
> +mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(UUID_CFLAGS) \
> +	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/mkfs.ubifs/
> +
> +# jffs1/2-utils
> +
> +mkfs_jffs2_SOURCES = \
> +	jffsX-utils/mkfs.jffs2.c \
> +	jffsX-utils/rbtree.h \
> +	jffsX-utils/compr_zlib.c \
> +	jffsX-utils/compr.h \
> +	jffsX-utils/rbtree.c \
> +	jffsX-utils/compr_lzo.c \
> +	jffsX-utils/compr.c \
> +	jffsX-utils/compr_rtime.c
> +mkfs_jffs2_LDADD = libmtd.a $(ZLIB_LIBS) $(LZO_LIBS)
> +mkfs_jffs2_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS)
> +
> +jffs2reader_SOURCES = jffsX-utils/jffs2reader.c
> +jffs2reader_LDADD = libmtd.a $(ZLIB_LIBS) $(LZO_LIBS)
> +
> +jffs2dump_SOURCES = jffsX-utils/jffs2dump.c
> +jffs2dump_LDADD = libmtd.a $(ZLIB_LIBS) $(LZO_LIBS)
> diff --git a/autogen.sh b/autogen.sh
> new file mode 100755
> index 0000000..c08fadf
> --- /dev/null
> +++ b/autogen.sh
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +autoreconf --force --install --symlink
> diff --git a/configure.ac b/configure.ac
> new file mode 100644
> index 0000000..396c1a3
> --- /dev/null
> +++ b/configure.ac
> @@ -0,0 +1,28 @@
> +AC_PREREQ([2.60])
> +
> +AC_INIT([mtd-utils], 1.5.2, [linux-mtd@lists.infradead.org], mtd-utils)
> +AM_INIT_AUTOMAKE([dist-bzip2])
> +AC_CONFIG_FILES([lib/Makefile])
> +AM_SILENT_RULES([yes])
> +AC_PROG_LIBTOOL
> +AC_DISABLE_STATIC
> +AC_PROG_CC
> +AC_PROG_INSTALL
> +
> +#PKG_CHECK_MODULES(LIBPCIACCESS, [pciaccess >= 0.10.0])
> +
> +PKG_CHECK_MODULES(ZLIB, [ zlib ])
> +PKG_CHECK_MODULES(UUID, [ uuid ])
> +
> +have_lzo="yes"
> +AC_ARG_VAR([LZO_CFLAGS], [C compiler flags for lzo])
> +AC_ARG_VAR([LZO_LIBS], [linker flags for lzo])
> +AC_CHECK_LIB([lzo2], [lzo1x_1_15_compress], [LZO_LIBS="-llzo2"],
> +	[AC_CHECK_LIB([lzo],[lzo1x_1_15_compress],[LZO_LIBS="-llzo"],
> +		[have_lzo="no"]
> +	)]
> +)
> +test "${have_lzo}" != "yes" && AC_MSG_ERROR([lzo missing])
> +
> +
> +AC_OUTPUT([Makefile])
> diff --git a/include/common.h b/include/common.h
> index fb0ca83..817d5e7 100644
> --- a/include/common.h
> +++ b/include/common.h
> @@ -28,7 +28,6 @@
>  #include <errno.h>
>  #include <features.h>
>  #include <inttypes.h>
> -#include "version.h"
>  
>  #ifndef PROGRAM_NAME
>  # error "You must define PROGRAM_NAME before including this header"
> diff --git a/nor-utils/rfddump.c b/nor-utils/rfddump.c
> index 0375bac..32810f5 100644
> --- a/nor-utils/rfddump.c
> +++ b/nor-utils/rfddump.c
> @@ -10,7 +10,7 @@
>   */
>  
>  #define PROGRAM_NAME "rfddump"
> -#define VERSION "$Revision 1.0 $"
> +#define PROGRAM_VERSION "$Revision 1.0 $"
>  
>  #define _XOPEN_SOURCE 500 /* For pread */
>  
> @@ -69,7 +69,7 @@ void display_help(void)
>  
>  void display_version(void)
>  {
> -	printf("%s " VERSION "\n"
> +	printf("%s " PROGRAM_VERSION "\n"
>  			"\n"
>  			"This is free software; see the source for copying conditions.  There is NO\n"
>  			"warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n",
> diff --git a/nor-utils/rfdformat.c b/nor-utils/rfdformat.c
> index 17d9d2d..a8a44a9 100644
> --- a/nor-utils/rfdformat.c
> +++ b/nor-utils/rfdformat.c
> @@ -13,7 +13,7 @@
>   */
>  
>  #define PROGRAM_NAME "rfdformat"
> -#define VERSION "$Revision 1.0 $"
> +#define PROGRAM_VERSION "$Revision 1.0 $"
>  
>  #define _XOPEN_SOURCE 500 /* For pread/pwrite */
>  
> @@ -42,7 +42,7 @@ void display_help(void)
>  
>  void display_version(void)
>  {
> -	printf("%s " VERSION "\n"
> +	printf("%s " PROGRAM_VERSION "\n"
>  			"\n"
>  			"This is free software; see the source for copying conditions.  There is NO\n"
>  			"warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n",
> -- 
> 2.5.0
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
