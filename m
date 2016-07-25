Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRhQ5-0006wV-EZ
 for linux-mtd@lists.infradead.org; Mon, 25 Jul 2016 15:03:56 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, computersforpeace@gmail.com,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 1/5] Change build system to autotools
Date: Mon, 25 Jul 2016 17:02:30 +0200
Message-Id: <20160725150234.5276-2-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20160725150234.5276-1-david.oberhollenzer@sigma-star.at>
References: <20160725150234.5276-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

This patch is largely based on Richards original RFC.

The differences to the RFC patch are as follows:
 - Add missing sumtools & mtdpart targets
 - Fix name of mkfs.jffs2 target
 - Add missing subdir-objects option for non-recursive make
 - Move all automake options to configure.ac
 - Add manpages to install target
 - Make XATTR & LZO support configurable
 - Install binaries to sbin directory like in the old build system
 - Install flash_eraseall wrapper script

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 .gitignore                  |   5 --
 Makefile                    | 133 --------------------------------------------
 Makefile.am                 |  25 +++++++++
 autogen.sh                  |   3 +
 configure.ac                |  47 ++++++++++++++++
 include/common.h            |   1 -
 jffsX-utils/Makemodule.am   |  29 ++++++++++
 lib/Makemodule.am           |   8 +++
 misc-utils/Makemodule.am    |  46 +++++++++++++++
 nand-utils/Makemodule.am    |  19 +++++++
 nor-utils/Makemodule.am     |  10 ++++
 nor-utils/rfddump.c         |   4 +-
 nor-utils/rfdformat.c       |   4 +-
 tests/ubi-tests/Makefile.am |   7 +++
 ubi-utils/Makemodule.am     |  65 ++++++++++++++++++++++
 ubifs-utils/Makemodule.am   |  26 +++++++++
 16 files changed, 289 insertions(+), 143 deletions(-)
 delete mode 100644 Makefile
 create mode 100644 Makefile.am
 create mode 100755 autogen.sh
 create mode 100644 configure.ac
 create mode 100644 jffsX-utils/Makemodule.am
 create mode 100644 lib/Makemodule.am
 create mode 100644 misc-utils/Makemodule.am
 create mode 100644 nand-utils/Makemodule.am
 create mode 100644 nor-utils/Makemodule.am
 create mode 100644 tests/ubi-tests/Makefile.am
 create mode 100644 ubi-utils/Makemodule.am
 create mode 100644 ubifs-utils/Makemodule.am

diff --git a/.gitignore b/.gitignore
index 2aac52c..5548e48 100644
--- a/.gitignore
+++ b/.gitignore
@@ -55,11 +55,6 @@
 #
 !.gitignore
 
-#
-# Generated include files
-#
-/include/version.h
-
 # stgit generated dirs
 patches-*
 *.patch
diff --git a/Makefile b/Makefile
deleted file mode 100644
index 977c9c5..0000000
--- a/Makefile
+++ /dev/null
@@ -1,133 +0,0 @@
-
-# -*- sh -*-
-
-VERSION = 1.5.2
-
-CPPFLAGS += -D_GNU_SOURCE -I./include -I$(BUILDDIR)/include -I./ubi-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS) $(UUIDCPPFLAGS)
-
-ifeq ($(WITHOUT_XATTR), 1)
-  CPPFLAGS += -DWITHOUT_XATTR
-endif
-ifeq ($(WITHOUT_LZO), 1)
-  CPPFLAGS += -DWITHOUT_LZO
-else
-  LZOLDLIBS = -llzo2
-endif
-
-TESTS = tests
-
-MISC_BINS = \
-	ftl_format doc_loadbios ftl_check mtd_debug docfdisk \
-	serve_image recv_image mtdpart flash_erase flash_lock \
-	flash_unlock flash_otp_info flash_otp_dump flash_otp_lock \
-	flash_otp_write flashcp
-UBI_BINS = \
-	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
-	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
-UBIFS_BINS = \
-	mkfs.ubifs/mkfs.ubifs
-JFFSX_BINS = \
-	mkfs.jffs2 sumtool jffs2reader jffs2dump
-NAND_BINS = \
-	nanddump nandwrite nandtest nftldump nftl_format
-NOR_BINS = \
-	rfddump rfdformat
-
-BINS = $(addprefix misc-utils/,$(MISC_BINS))
-BINS += $(addprefix ubi-utils/,$(UBI_BINS))
-BINS += $(addprefix ubifs-utils/,$(UBIFS_BINS))
-BINS += $(addprefix jffsX-utils/,$(JFFSX_BINS))
-BINS += $(addprefix nand-utils/,$(NAND_BINS))
-BINS += $(addprefix nor-utils/,$(NOR_BINS))
-SCRIPTS = $(addprefix misc-utils/,flash_eraseall)
-
-TARGETS = $(BINS)
-TARGETS += lib/libmtd.a
-TARGETS += ubi-utils/libubi.a
-
-OBJDEPS = $(BUILDDIR)/include/version.h
-
-include common.mk
-
-CLEAN_FIND = find "$(BUILDDIR)/" -xdev '(' -name '*.[ao]' -o -name '.*.c.dep' ')'
-
-clean::
-ifneq ($(BUILDDIR)/.git,)
-ifneq ($(BUILDDIR),.)
-ifneq ($(BUILDDIR),$(CURDIR))
-	rm -rf $(BUILDDIR)
-endif
-endif
-endif
-# findutils v4.1.x (RHEL 4) do not have '+' syntax
-	@if test -d "$(BUILDDIR)/"; then \
-		$(CLEAN_FIND) -exec rm -f {} + 2> /dev/null || \
-		$(CLEAN_FIND) -exec rm -f {} \; ; \
-	fi
-	rm -f $(BUILDDIR)/include/version.h
-	$(MAKE) -C $(TESTS) clean
-
-install:: $(addprefix $(BUILDDIR)/,${BINS}) ${SCRIPTS}
-	mkdir -p ${DESTDIR}/${SBINDIR}
-	install -m 0755 $^ ${DESTDIR}/${SBINDIR}/
-	mkdir -p ${DESTDIR}/${MANDIR}/man1
-	install -m 0644 jffsX-utils/mkfs.jffs2.1 ${DESTDIR}/${MANDIR}/man1/
-	-gzip -9f ${DESTDIR}/${MANDIR}/man1/*.1
-
-tests::
-	$(MAKE) -C $(TESTS)
-
-cscope:
-	cscope -bR
-
-$(BUILDDIR)/include/version.h: $(BUILDDIR)/include/version.h.tmp
-	$(call BECHO,CHK)
-	$(Q)cmp -s $@ $@.tmp && rm -f $@.tmp || mv $@.tmp $@
-$(BUILDDIR)/include/version.h.tmp:
-	${Q}mkdir -p $(dir $@)
-	$(Q)echo '#define VERSION "$(VERSION)"' > $@
-
-#
-# Utils in top level
-#
-obj-mkfs.jffs2 = compr_rtime.o compr_zlib.o compr_lzo.o compr.o rbtree.o
-LDFLAGS_mkfs.jffs2 = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(CPPFLAGS)
-LDLIBS_mkfs.jffs2  = -lz $(LZOLDLIBS)
-
-LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
-LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
-
-$(foreach v,$(MISC_BINS),$(eval $(call mkdep,misc-utils/,$(v))))
-$(foreach v,$(JFFSX_BINS),$(eval $(call mkdep,jffsX-utils/,$(v))))
-$(foreach v,$(NAND_BINS),$(eval $(call mkdep,nand-utils/,$(v))))
-$(foreach v,$(NOR_BINS),$(eval $(call mkdep,nor-utils/,$(v))))
-
-#
-# Common libmtd
-#
-obj-libmtd.a = libmtd.o libmtd_legacy.o libcrc32.o libfec.o
-$(call _mkdep,lib/,libmtd.a)
-
-#
-# Utils in ubi-utils/ subdir
-#
-obj-libiniparser.a = libiniparser.o dictionary.o
-obj-libscan.a      = libscan.o
-obj-libubi.a       = libubi.o
-obj-libubigen.a    = libubigen.o
-
-obj-mtdinfo   = libubigen.a
-obj-ubinize   = libubigen.a libiniparser.a
-obj-ubiformat = libubigen.a libscan.a
-
-$(foreach v,libubi.a libubigen.a libiniparser.a libscan.a,$(eval $(call _mkdep,ubi-utils/,$(v))))
-$(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-common.o)))
-
-#
-# Utils in ubifs-utils subdir
-#
-obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o \
-	hashtable/hashtable.o hashtable/hashtable_itr.o
-LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
-LDLIBS_mkfs.ubifs = -lz $(LZOLDLIBS) -lm -luuid
-$(call mkdep,ubifs-utils/mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
diff --git a/Makefile.am b/Makefile.am
new file mode 100644
index 0000000..5d00227
--- /dev/null
+++ b/Makefile.am
@@ -0,0 +1,25 @@
+AM_CPPFLAGS = -D_GNU_SOURCE -I$(top_srcdir)/include
+
+if WITHOUT_XATTR
+AM_CPPFLAGS += -DWITHOUT_XATTR
+endif
+
+if WITHOUT_LZO
+AM_CPPFLAGS += -DWITHOUT_LZO
+endif
+
+sbin_PROGRAMS =
+sbin_SCRIPTS =
+noinst_LIBRARIES =
+noinst_PROGRAMS =
+man1_MANS =
+
+include lib/Makemodule.am
+include ubi-utils/Makemodule.am
+include ubifs-utils/Makemodule.am
+include misc-utils/Makemodule.am
+include nand-utils/Makemodule.am
+include nor-utils/Makemodule.am
+include jffsX-utils/Makemodule.am
+
+SUBDIRS = tests/ubi-tests
diff --git a/autogen.sh b/autogen.sh
new file mode 100755
index 0000000..c08fadf
--- /dev/null
+++ b/autogen.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+autoreconf --force --install --symlink
diff --git a/configure.ac b/configure.ac
new file mode 100644
index 0000000..37675b7
--- /dev/null
+++ b/configure.ac
@@ -0,0 +1,47 @@
+AC_PREREQ([2.60])
+
+AC_INIT([mtd-utils], 1.5.2, [linux-mtd@lists.infradead.org], mtd-utils)
+AM_INIT_AUTOMAKE([foreign subdir-objects dist-bzip2])
+AM_SILENT_RULES([yes])
+AC_PROG_LIBTOOL
+AC_DISABLE_STATIC
+AC_PROG_CC
+AC_PROG_INSTALL
+
+AC_ARG_WITH([xattr],
+	[AS_HELP_STRING([--without-xattr],
+		[Disable support forextended file attributes])],
+	[case "${enableval}" in
+	yes) AM_CONDITIONAL([WITHOUT_XATTR], [false]) ;;
+	no)  AM_CONDITIONAL([WITHOUT_XATTR], [true]) ;;
+	*) AC_MSG_ERROR([bad value ${enableval} for --enable-tests]) ;;
+	esac],
+	[AM_CONDITIONAL([WITHOUT_XATTR], [false])])
+
+
+AC_ARG_WITH([lzo],
+	[AS_HELP_STRING([--without-lzo], [Disable support for LZO compression])],
+	[case "${withval}" in
+	yes) AM_CONDITIONAL([WITHOUT_LZO], [false]) ;;
+	no)  AM_CONDITIONAL([WITHOUT_LZO], [true]) ;;
+	*) AC_MSG_ERROR([bad value ${enableval} for --enable-tests]) ;;
+	esac],
+	[AM_CONDITIONAL([WITHOUT_LZO], [false])])
+
+
+PKG_CHECK_MODULES(ZLIB, [ zlib ])
+PKG_CHECK_MODULES(UUID, [ uuid ])
+
+AM_COND_IF([WITHOUT_LZO], [], [
+	have_lzo="yes"
+	AC_ARG_VAR([LZO_CFLAGS], [C compiler flags for lzo])
+	AC_ARG_VAR([LZO_LIBS], [linker flags for lzo])
+	AC_CHECK_LIB([lzo2], [lzo1x_1_15_compress], [LZO_LIBS="-llzo2"],
+		[AC_CHECK_LIB([lzo],[lzo1x_1_15_compress],[LZO_LIBS="-llzo"],
+			[have_lzo="no"]
+		)]
+	)
+	test "${have_lzo}" != "yes" && AC_MSG_ERROR([lzo missing])
+])
+
+AC_OUTPUT([Makefile])
diff --git a/include/common.h b/include/common.h
index 8cb3142..7c201ed 100644
--- a/include/common.h
+++ b/include/common.h
@@ -29,7 +29,6 @@
 #include <features.h>
 #include <inttypes.h>
 #include <sys/sysmacros.h>
-#include "version.h"
 
 #ifndef PROGRAM_NAME
 # error "You must define PROGRAM_NAME before including this header"
diff --git a/jffsX-utils/Makemodule.am b/jffsX-utils/Makemodule.am
new file mode 100644
index 0000000..6ddf626
--- /dev/null
+++ b/jffsX-utils/Makemodule.am
@@ -0,0 +1,29 @@
+mkfs_jffs2_SOURCES = \
+	jffsX-utils/mkfs.jffs2.c \
+	jffsX-utils/rbtree.h \
+	jffsX-utils/compr_zlib.c \
+	jffsX-utils/compr.h \
+	jffsX-utils/rbtree.c \
+	jffsX-utils/compr_lzo.c \
+	jffsX-utils/compr.c \
+	jffsX-utils/compr_rtime.c
+mkfs_jffs2_LDADD = libmtd.a $(ZLIB_LIBS) $(LZO_LIBS)
+mkfs_jffs2_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS)
+
+jffs2reader_SOURCES = jffsX-utils/jffs2reader.c
+jffs2reader_LDADD = libmtd.a $(ZLIB_LIBS) $(LZO_LIBS)
+
+jffs2dump_SOURCES = jffsX-utils/jffs2dump.c
+jffs2dump_LDADD = libmtd.a $(ZLIB_LIBS) $(LZO_LIBS)
+
+sumtool_SOURCES = jffsX-utils/sumtool.c
+sumtool_LDADD = libmtd.a
+
+JFFSX_BINS = \
+	mkfs.jffs2 jffs2dump jffs2reader sumtool
+
+JFFSX_MANS = \
+	jffsX-utils/mkfs.jffs2.1
+
+man1_MANS += $(JFFSX_MANS)
+sbin_PROGRAMS += $(JFFSX_BINS)
diff --git a/lib/Makemodule.am b/lib/Makemodule.am
new file mode 100644
index 0000000..2fd933d
--- /dev/null
+++ b/lib/Makemodule.am
@@ -0,0 +1,8 @@
+libmtd_a_SOURCES = \
+	lib/libmtd.c \
+	lib/libfec.c \
+	lib/libcrc32.c \
+	lib/libmtd_legacy.c \
+	lib/libmtd_int.h
+
+noinst_LIBRARIES += libmtd.a
diff --git a/misc-utils/Makemodule.am b/misc-utils/Makemodule.am
new file mode 100644
index 0000000..02df360
--- /dev/null
+++ b/misc-utils/Makemodule.am
@@ -0,0 +1,46 @@
+ftl_format_SOURCES = misc-utils/ftl_format.c
+
+doc_loadbios_SOURCES = misc-utils/doc_loadbios.c
+
+ftl_check_SOURCES = misc-utils/ftl_check.c
+
+mtd_debug_SOURCES = misc-utils/mtd_debug.c
+
+mtdpart_SOURCES = misc-utils/mtdpart.c
+
+docfdisk_SOURCES = misc-utils/docfdisk.c
+
+serve_image_SOURCES = misc-utils/serve_image.c
+serve_image_LDADD = libmtd.a
+
+recv_image_SOURCES = misc-utils/recv_image.c
+recv_image_LDADD = libmtd.a
+
+flash_lock_SOURCES = misc-utils/flash_lock.c
+
+flash_unlock_SOURCES = misc-utils/flash_unlock.c
+
+flash_otp_info_SOURCES = misc-utils/flash_otp_info.c
+
+flash_otp_dump_SOURCES = misc-utils/flash_otp_dump.c
+
+flash_otp_lock_SOURCES = misc-utils/flash_otp_lock.c
+
+flash_otp_write_SOURCES = misc-utils/flash_otp_write.c
+
+flashcp_SOURCES = misc-utils/flashcp.c
+
+flash_erase_SOURCES = misc-utils/flash_erase.c
+flash_erase_LDADD = libmtd.a
+
+MISC_BINS = \
+	ftl_format doc_loadbios ftl_check mtd_debug docfdisk \
+	serve_image recv_image flash_erase flash_lock \
+	flash_unlock flash_otp_info flash_otp_dump flash_otp_lock \
+	flash_otp_write flashcp mtdpart
+
+MISC_SH = \
+	misc-utils/flash_eraseall
+
+sbin_PROGRAMS += $(MISC_BINS)
+sbin_SCRIPTS += $(MISC_SH)
diff --git a/nand-utils/Makemodule.am b/nand-utils/Makemodule.am
new file mode 100644
index 0000000..2ef5abd
--- /dev/null
+++ b/nand-utils/Makemodule.am
@@ -0,0 +1,19 @@
+nanddump_SOURCES = nand-utils/nanddump.c
+nanddump_LDADD = libmtd.a
+
+nandwrite_SOURCES = nand-utils/nandwrite.c
+nandwrite_LDADD = libmtd.a
+
+nandtest_SOURCES = nand-utils/nandtest.c
+nandtest_LDADD = libmtd.a
+
+nftldump_SOURCES = nand-utils/nftldump.c
+nftldump_LDADD = libmtd.a
+
+nftl_format_SOURCES = nand-utils/nftl_format.c
+nftl_format_LDADD = libmtd.a
+
+NAND_BINS = \
+	nanddump nandwrite nandtest nftldump nftl_format
+
+sbin_PROGRAMS += $(NAND_BINS)
diff --git a/nor-utils/Makemodule.am b/nor-utils/Makemodule.am
new file mode 100644
index 0000000..a5a0d4d
--- /dev/null
+++ b/nor-utils/Makemodule.am
@@ -0,0 +1,10 @@
+rfddump_SOURCES = nor-utils/rfddump.c
+rfddump_LDADD = libmtd.a
+
+rfdformat_SOURCES = nor-utils/rfdformat.c
+rfdformat_LDADD = libmtd.a
+
+NOR_BINS = \
+	rfddump rfdformat
+
+sbin_PROGRAMS += $(NOR_BINS)
diff --git a/nor-utils/rfddump.c b/nor-utils/rfddump.c
index 0375bac..32810f5 100644
--- a/nor-utils/rfddump.c
+++ b/nor-utils/rfddump.c
@@ -10,7 +10,7 @@
  */
 
 #define PROGRAM_NAME "rfddump"
-#define VERSION "$Revision 1.0 $"
+#define PROGRAM_VERSION "$Revision 1.0 $"
 
 #define _XOPEN_SOURCE 500 /* For pread */
 
@@ -69,7 +69,7 @@ void display_help(void)
 
 void display_version(void)
 {
-	printf("%s " VERSION "\n"
+	printf("%s " PROGRAM_VERSION "\n"
 			"\n"
 			"This is free software; see the source for copying conditions.  There is NO\n"
 			"warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n",
diff --git a/nor-utils/rfdformat.c b/nor-utils/rfdformat.c
index 17d9d2d..a8a44a9 100644
--- a/nor-utils/rfdformat.c
+++ b/nor-utils/rfdformat.c
@@ -13,7 +13,7 @@
  */
 
 #define PROGRAM_NAME "rfdformat"
-#define VERSION "$Revision 1.0 $"
+#define PROGRAM_VERSION "$Revision 1.0 $"
 
 #define _XOPEN_SOURCE 500 /* For pread/pwrite */
 
@@ -42,7 +42,7 @@ void display_help(void)
 
 void display_version(void)
 {
-	printf("%s " VERSION "\n"
+	printf("%s " PROGRAM_VERSION "\n"
 			"\n"
 			"This is free software; see the source for copying conditions.  There is NO\n"
 			"warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n",
diff --git a/tests/ubi-tests/Makefile.am b/tests/ubi-tests/Makefile.am
new file mode 100644
index 0000000..d57316a
--- /dev/null
+++ b/tests/ubi-tests/Makefile.am
@@ -0,0 +1,7 @@
+io_basic_SOURCES = io_basic.c helpers.c
+io_basic_LDADD = libmtd.a libubi.a
+io_basic_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+UBITEST_BINS = io_basic
+
+noinst_PROGRAMS += $(UBITEST_BINS)
diff --git a/ubi-utils/Makemodule.am b/ubi-utils/Makemodule.am
new file mode 100644
index 0000000..10e2f32
--- /dev/null
+++ b/ubi-utils/Makemodule.am
@@ -0,0 +1,65 @@
+libubi_a_SOURCES = ubi-utils/libubi.c ubi-utils/ubiutils-common.c ubi-utils/libubi_int.h
+libubi_a_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+libubigen_a_SOURCES = ubi-utils/libubigen.c
+libubigen_a_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+ubiupdatevol_SOURCES = ubi-utils/ubiupdatevol.c
+ubiupdatevol_LDADD = libmtd.a libubi.a
+ubiupdatevol_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+ubimkvol_SOURCES = ubi-utils/ubimkvol.c
+ubimkvol_LDADD = libmtd.a libubi.a
+ubimkvol_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+ubirmvol_SOURCES = ubi-utils/ubirmvol.c
+ubirmvol_LDADD = libmtd.a libubi.a
+ubirmvol_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+ubicrc32_SOURCES = ubi-utils/ubicrc32.c
+ubicrc32_LDADD = libmtd.a libubi.a
+ubicrc32_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+ubinfo_SOURCES = ubi-utils/ubinfo.c
+ubinfo_LDADD = libmtd.a libubi.a
+ubinfo_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+ubiattach_SOURCES = ubi-utils/ubiattach.c
+ubiattach_LDADD = libmtd.a libubi.a
+ubiattach_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+ubidetach_SOURCES = ubi-utils/ubidetach.c
+ubidetach_LDADD = libmtd.a libubi.a
+ubidetach_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+ubinize_SOURCES = ubi-utils/ubinize.c ubi-utils/libiniparser.c ubi-utils/dictionary.c
+ubinize_LDADD = libubi.a libubigen.a libmtd.a
+ubinize_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+ubiformat_SOURCES = ubi-utils/ubiformat.c ubi-utils/libscan.c
+ubiformat_LDADD = libubi.a libubigen.a libmtd.a
+ubiformat_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+ubirename_SOURCES = ubi-utils/ubirename.c
+ubirename_LDADD = libmtd.a libubi.a
+ubirename_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+mtdinfo_SOURCES = ubi-utils/mtdinfo.c
+mtdinfo_LDADD = libubi.a libubigen.a libmtd.a
+mtdinfo_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+ubirsvol_SOURCES = ubi-utils/ubirsvol.c
+ubirsvol_LDADD = libmtd.a libubi.a
+ubirsvol_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+ubiblock_SOURCES = ubi-utils/ubiblock.c
+ubiblock_LDADD = libmtd.a libubi.a
+ubiblock_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+UBI_BINS = \
+	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
+	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
+
+sbin_PROGRAMS += $(UBI_BINS)
+
+noinst_LIBRARIES += libubi.a libubigen.a
diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
new file mode 100644
index 0000000..78b369e
--- /dev/null
+++ b/ubifs-utils/Makemodule.am
@@ -0,0 +1,26 @@
+mkfs_ubifs_SOURCES = \
+	ubifs-utils/mkfs.ubifs/mkfs.ubifs.c \
+	ubifs-utils/mkfs.ubifs/defs.h \
+	ubifs-utils/mkfs.ubifs/lpt.h \
+	ubifs-utils/mkfs.ubifs/mkfs.ubifs.h \
+	ubifs-utils/mkfs.ubifs/crc16.h \
+	ubifs-utils/mkfs.ubifs/key.h \
+	ubifs-utils/mkfs.ubifs/compr.h \
+	ubifs-utils/mkfs.ubifs/ubifs.h \
+	ubifs-utils/mkfs.ubifs/crc16.c \
+	ubifs-utils/mkfs.ubifs/lpt.c \
+	ubifs-utils/mkfs.ubifs/compr.c \
+	ubifs-utils/mkfs.ubifs/hashtable/hashtable.h \
+	ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h \
+	ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h \
+	ubifs-utils/mkfs.ubifs/hashtable/hashtable.c \
+	ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c \
+	ubifs-utils/mkfs.ubifs/devtable.c
+mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(UUID_LIBS) -lm
+mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(UUID_CFLAGS) \
+	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/mkfs.ubifs/
+
+UBIFS_BINS = \
+	mkfs.ubifs
+
+sbin_PROGRAMS += $(UBIFS_BINS)
-- 
2.9.0
