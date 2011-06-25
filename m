Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaWXC-0001r4-BQ
	for linux-mtd@lists.infradead.org; Sat, 25 Jun 2011 17:20:44 +0000
Received: from vapier-m.hsd1.ma.comcast.net. (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 8D3372AC049
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Jun 2011 17:20:38 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2 v3] rewrite build system to avoid recursion
Date: Sat, 25 Jun 2011 13:20:37 -0400
Message-Id: <1309022438-10093-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1308983405-27064-1-git-send-email-vapier@gentoo.org>
References: <1308983405-27064-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ubi-utils/src/ subdir is tossed as it just complicates things for no
real gain.  The dictionary.h header is relocated to the ubi-utils/include/
since other headers in there need it.

The top level clean is replaced with a `find -delete` on objects, so it
might prune more than necessary, but many projects now do this sort of
thing and no one complained there.

A "mkdep" helper generates the actual rule, and the variables are used
with "foreach" to expand these automatically.

The tests subdir is updated only to reflect the ubi-utils source move.
Otherwise, it is left untouched as making that non-recursive isn't really
worth the effort.

While we're gutting things, also through in kbuild style output while
building to make things more legible.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v3
	- fix build failure with dictionary.h by moving it into the include dir
	- update some tests/ dirs to reflect ubi-utils file moving

 Makefile                                |   81 ++++++++++++++++++++++--------
 common.mk                               |   48 ++++++++++++-------
 lib/Makefile                            |   22 --------
 mkfs.ubifs/Makefile                     |   29 -----------
 tests/fs-tests/integrity/Makefile       |    7 +--
 tests/ubi-tests/Makefile                |   10 ++--
 ubi-utils/Makefile                      |   60 -----------------------
 ubi-utils/{src => }/dictionary.c        |    0
 ubi-utils/{src => include}/dictionary.h |    0
 ubi-utils/{src => }/libiniparser.c      |    0
 ubi-utils/{src => }/libscan.c           |    0
 ubi-utils/{src => }/libubi.c            |    0
 ubi-utils/{src => }/libubi_int.h        |    0
 ubi-utils/{src => }/libubigen.c         |    0
 ubi-utils/{src => }/mtdinfo.c           |    0
 ubi-utils/{src => }/ubiattach.c         |    0
 ubi-utils/{src => }/ubicrc32.c          |    0
 ubi-utils/{src => }/ubidetach.c         |    0
 ubi-utils/{src => }/ubiformat.c         |    0
 ubi-utils/{src => }/ubimkvol.c          |    0
 ubi-utils/{src => }/ubinfo.c            |    0
 ubi-utils/{src => }/ubinize.c           |    0
 ubi-utils/{src => }/ubirename.c         |    0
 ubi-utils/{src => }/ubirmvol.c          |    0
 ubi-utils/{src => }/ubirsvol.c          |    0
 ubi-utils/{src => }/ubiupdatevol.c      |    0
 ubi-utils/{src => }/ubiutils-common.c   |    0
 27 files changed, 97 insertions(+), 160 deletions(-)
 delete mode 100644 lib/Makefile
 delete mode 100644 mkfs.ubifs/Makefile
 delete mode 100644 ubi-utils/Makefile
 rename ubi-utils/{src => }/dictionary.c (100%)
 rename ubi-utils/{src => include}/dictionary.h (100%)
 rename ubi-utils/{src => }/libiniparser.c (100%)
 rename ubi-utils/{src => }/libscan.c (100%)
 rename ubi-utils/{src => }/libubi.c (100%)
 rename ubi-utils/{src => }/libubi_int.h (100%)
 rename ubi-utils/{src => }/libubigen.c (100%)
 rename ubi-utils/{src => }/mtdinfo.c (100%)
 rename ubi-utils/{src => }/ubiattach.c (100%)
 rename ubi-utils/{src => }/ubicrc32.c (100%)
 rename ubi-utils/{src => }/ubidetach.c (100%)
 rename ubi-utils/{src => }/ubiformat.c (100%)
 rename ubi-utils/{src => }/ubimkvol.c (100%)
 rename ubi-utils/{src => }/ubinfo.c (100%)
 rename ubi-utils/{src => }/ubinize.c (100%)
 rename ubi-utils/{src => }/ubirename.c (100%)
 rename ubi-utils/{src => }/ubirmvol.c (100%)
 rename ubi-utils/{src => }/ubirsvol.c (100%)
 rename ubi-utils/{src => }/ubiupdatevol.c (100%)
 rename ubi-utils/{src => }/ubiutils-common.c (100%)

diff --git a/Makefile b/Makefile
index d69206a..bd5ada3 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 
 # -*- sh -*-
 
-CPPFLAGS += -I./include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
+CPPFLAGS += -I./include -I./ubi-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
 
 ifeq ($(WITHOUT_XATTR), 1)
   CPPFLAGS += -DWITHOUT_XATTR
@@ -12,10 +12,10 @@ else
   LZOLDLIBS = -llzo2
 endif
 
-SUBDIRS = lib ubi-utils mkfs.ubifs
 TESTS = tests
 
-TARGETS = ftl_format flash_erase nanddump doc_loadbios \
+MTD_BINS = \
+	ftl_format flash_erase nanddump doc_loadbios \
 	ftl_check mkfs.jffs2 flash_lock flash_unlock flash_info \
 	flash_otp_info flash_otp_dump mtd_debug flashcp nandwrite nandtest \
 	jffs2dump \
@@ -23,16 +23,21 @@ TARGETS = ftl_format flash_erase nanddump doc_loadbios \
 	rfddump rfdformat \
 	serve_image recv_image \
 	sumtool #jffs2reader
+UBI_BINS = \
+	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
+	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol
+
+BINS = $(MTD_BINS)
+BINS += mkfs.ubifs/mkfs.ubifs
+BINS += $(addprefix ubi-utils/,$(UBI_BINS))
 SCRIPTS = flash_eraseall
 
-LDLIBS = -L$(BUILDDIR)/lib -lmtd
-LDDEPS = $(BUILDDIR)/lib/libmtd.a
+TARGETS = $(BINS)
+TARGETS += lib/libmtd.a
+TARGETS += ubi-utils/libubi.a
 
 include common.mk
 
-# mkfs.ubifs needs -lubi which is in ubi-utils/
-subdirs_mkfs.ubifs_all: subdirs_ubi-utils_all
-
 clean::
 ifneq ($(BUILDDIR)/.git,)
 ifneq ($(BUILDDIR),.)
@@ -41,23 +46,14 @@ ifneq ($(BUILDDIR),$(CURDIR))
 endif
 endif
 endif
+	find $(BUILDDIR)/ -xdev \
+		'(' -name '*.[ao]' -o -name '.*.c.dep' ')' \
+		-exec rm -f {} +
 	$(MAKE) -C $(TESTS) clean
 
-$(BUILDDIR)/mkfs.jffs2: $(addprefix $(BUILDDIR)/,\
-	compr_rtime.o mkfs.jffs2.o compr_zlib.o compr_lzo.o \
-	compr.o rbtree.o)
-LDFLAGS_mkfs.jffs2 = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
-LDLIBS_mkfs.jffs2  = -lz $(LZOLDLIBS)
-
-$(BUILDDIR)/jffs2reader: $(BUILDDIR)/jffs2reader.o
-LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
-LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
-
-$(BUILDDIR)/lib/libmtd.a: subdirs_lib_all ;
-
-install:: ${TARGETS} ${SCRIPTS}
+install:: ${BINS} ${SCRIPTS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
-	install -m 0755 ${TARGETS} ${SCRIPTS} ${DESTDIR}/${SBINDIR}/
+	install -m 0755 ${BINS} ${SCRIPTS} ${DESTDIR}/${SBINDIR}/
 	mkdir -p ${DESTDIR}/${MANDIR}/man1
 	gzip -9c mkfs.jffs2.1 > ${DESTDIR}/${MANDIR}/man1/mkfs.jffs2.1.gz
 
@@ -66,3 +62,44 @@ tests::
 
 cscope:
 	cscope -bR
+
+#
+# Utils in top level
+#
+obj-mkfs.jffs2 = compr_rtime.o compr_zlib.o compr_lzo.o compr.o rbtree.o
+LDFLAGS_mkfs.jffs2 = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
+LDLIBS_mkfs.jffs2  = -lz $(LZOLDLIBS)
+
+LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
+LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
+
+$(foreach v,$(MTD_BINS),$(eval $(call mkdep,,$(v))))
+
+#
+# Common libmtd
+#
+obj-libmtd.a = libmtd.o libmtd_legacy.o libcrc32.o libfec.o
+$(call _mkdep,lib/,libmtd.a)
+
+#
+# Utils in mkfs.ubifs subdir
+#
+obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o \
+	hashtable/hashtable.o hashtable/hashtable_itr.o
+LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid
+$(call mkdep,mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
+
+#
+# Utils in ubi-utils/ subdir
+#
+obj-libiniparser.a = libiniparser.o dictionary.o
+obj-libscan.a      = libscan.o
+obj-libubi.a       = libubi.o
+obj-libubigen.a    = libubigen.o
+
+obj-mtdinfo   = libubigen.a
+obj-ubinize   = libubigen.a libiniparser.a
+obj-ubiformat = libubigen.a libscan.a
+
+$(foreach v,libubi.a libubigen.a libiniparser.a libscan.a,$(eval $(call _mkdep,ubi-utils/,$(v))))
+$(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-common.o)))
diff --git a/common.mk b/common.mk
index 0f3d447..d0e207d 100644
--- a/common.mk
+++ b/common.mk
@@ -39,34 +39,48 @@ override BUILDDIR := $(patsubst %/,%,$(BUILDDIR))
 
 override TARGETS := $(addprefix $(BUILDDIR)/,$(TARGETS))
 
-SUBDIRS_ALL = $(patsubst %,subdirs_%_all,$(SUBDIRS))
-SUBDIRS_CLEAN = $(patsubst %,subdirs_%_clean,$(SUBDIRS))
-SUBDIRS_INSTALL = $(patsubst %,subdirs_%_install,$(SUBDIRS))
+ifeq ($(V),1)
+XECHO = @:
+XPRINTF = @:
+Q =
+else
+XECHO = @echo
+XPRINTF = @printf
+Q = @
+endif
+define BECHO
+$(XPRINTF) '  %-7s %s\n' "$1" "$(subst $(BUILDDIR)/,,$@)"
+endef
 
-all:: $(TARGETS) $(SUBDIRS_ALL)
+all:: $(TARGETS)
 
-clean:: $(SUBDIRS_CLEAN)
+clean::
 	rm -f $(BUILDDIR)/*.o $(TARGETS) $(BUILDDIR)/.*.c.dep
 
-install:: $(TARGETS) $(SUBDIRS_INSTALL)
+install:: $(TARGETS)
 
-%: %.o $(LDDEPS) $(LDDEPS_$(notdir $@))
-	$(CC) $(CFLAGS) $(LDFLAGS) $(LDFLAGS_$(notdir $@)) -g -o $@ $^ $(LDLIBS) $(LDLIBS_$(notdir $@))
+define _mkdep
+$(BUILDDIR)/$1$2: $(addprefix $(BUILDDIR)/$1,$(obj-$2) $3) $(addprefix $(BUILDDIR)/,$4)
+endef
+define mkdep
+$(call _mkdep,$1,$2,$3 $2.o,$4 lib/libmtd.a)
+endef
+
+%: %.o $(LDDEPS)
+	$(call BECHO,LD)
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(LDFLAGS_$(notdir $@)) -g -o $@ $^ $(LDLIBS) $(LDLIBS_$(notdir $@))
 
 $(BUILDDIR)/%.a:
-	$(AR) crv $@ $^
-	$(RANLIB) $@
+	$(call BECHO,AR)
+	$(Q)$(AR) cr $@ $^
+	$(Q)$(RANLIB) $@
 
 $(BUILDDIR)/%.o: %.c
 ifneq ($(BUILDDIR),$(CURDIR))
-	mkdir -p $(dir $@)
+	$(Q)mkdir -p $(dir $@)
 endif
-	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $< -g -Wp,-MD,$(BUILDDIR)/.$(<F).dep
-
-subdirs_%:
-	d=$(patsubst subdirs_%,%,$@); \
-	t=`echo $$d | sed s:.*_::` d=`echo $$d | sed s:_.*::`; \
-	$(MAKE) BUILDDIR=$(BUILDDIR)/$$d -C $$d $$t
+	$(call BECHO,CC)
+	$(Q)$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $< -g -Wp,-MD,$(BUILDDIR)/.$(<F).dep
 
 .SUFFIXES:
 
diff --git a/lib/Makefile b/lib/Makefile
deleted file mode 100644
index 9b01d32..0000000
--- a/lib/Makefile
+++ /dev/null
@@ -1,22 +0,0 @@
-#
-# Makefile for libmtd
-#
-
-SUBDIRS =
-
-# CFLAGS += -Werror
-CPPFLAGS += -I../include
-LIBS = libmtd
-TARGETS = libmtd.a
-
-include ../common.mk
-
-$(BUILDDIR)/libmtd.a: $(addprefix $(BUILDDIR)/,\
-       libmtd.o libmtd_legacy.o libcrc32.o libfec.o)
-
-clean::
-	rm -f $(addsuffix .a, $(LIBS))
-
-install::
-
-uninstall:
diff --git a/mkfs.ubifs/Makefile b/mkfs.ubifs/Makefile
deleted file mode 100644
index ba21a8c..0000000
--- a/mkfs.ubifs/Makefile
+++ /dev/null
@@ -1,29 +0,0 @@
-
-CPPFLAGS += -I../include -I../ubi-utils/include
-CPPFLAGS += $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
-
-ALL_SOURCES=*.[ch] hashtable/*.[ch]
-
-TARGETS = mkfs.ubifs
-
-LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid -L$(BUILDDIR)/../ubi-utils/ -lubi
-LDLIBS_mkfs.ubifs += -L$(BUILDDIR)/../lib -lmtd
-LDLIBS_mkfs.ubifs += $(ZLIBLDFLAGS) $(LZOLDFLAGS)
-
-include ../common.mk
-
-$(BUILDDIR)/mkfs.ubifs: $(addprefix $(BUILDDIR)/,\
-	crc16.o lpt.o compr.o devtable.o \
-	hashtable/hashtable.o hashtable/hashtable_itr.o)
-
-clean::
-	rm -f $(BUILDDIR)/hashtable/*.o cscope.*
-
-cscope:
-	@echo $(ALL_SOURCES) > cscope.files
-	@cscope -bR
-	@rm cscope.files
-
-install:: ${TARGETS}
-	mkdir -p ${DESTDIR}/${SBINDIR}
-	install -m 0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
diff --git a/tests/fs-tests/integrity/Makefile b/tests/fs-tests/integrity/Makefile
index 509a94e..4d6fc7d 100644
--- a/tests/fs-tests/integrity/Makefile
+++ b/tests/fs-tests/integrity/Makefile
@@ -4,9 +4,8 @@ CC = gcc
 endif
 
 COMMON_HEADERS_DIR := ../../../include
-LIBUBI_PATH=../../../ubi-utils/
-LIBUBI_SRC_PATH=../../../ubi-utils/src/
-LIBUBI_HEADER_PATH=../../../ubi-utils/include
+LIBUBI_PATH = ../../../ubi-utils/
+LIBUBI_HEADER_PATH = $(LIBUBI_PATH)/include
 
 CFLAGS := $(CFLAGS) -Wall -g -O2 -I$(COMMON_HEADERS_DIR) -I$(LIBUBI_HEADER_PATH)
 
@@ -18,7 +17,7 @@ all: $(TARGETS)
 
 # Compile ubilib
 libubi.a:
-	$(CC) $(CFLAGS) -I $(LIBUBI_SRC_PATH) -c $(LIBUBI_SRC_PATH)/libubi.c -o libubi.o
+	$(CC) $(CFLAGS) -c $(LIBUBI_PATH)/libubi.c -o libubi.o
 	ar cr libubi.a libubi.o
 
 $(TARGETS): libubi.a
diff --git a/tests/ubi-tests/Makefile b/tests/ubi-tests/Makefile
index 741a5c2..2c47a9f 100644
--- a/tests/ubi-tests/Makefile
+++ b/tests/ubi-tests/Makefile
@@ -1,9 +1,7 @@
-LIBUBI_PATH=../../ubi-utils/
-LIBUBI_SRC_PATH=../../ubi-utils/src/
-LIBUBI_HEADER_PATH=../../ubi-utils/include
+LIBUBI_PATH = ../../ubi-utils/
+LIBUBI_HEADER_PATH = $(LIBUBI_PATH)/include
 UBIUTILS_PATH=../../ubi-utils/
 
-LIBUBI_PATH=../../ubi-utils/
 KERNELHDR := ../../include
 
 LIBS = libubi
@@ -15,8 +13,8 @@ CFLAGS += -I$(LIBUBI_HEADER_PATH) -I $(KERNELHDR) -lpthread
 include ../../common.mk
 
 # Compile ubilib with the udevsettle hack
-libubi.a: $(LIBUBI_SRC_PATH)/libubi.c  $(LIBUBI_HEADER_PATH)/libubi.h  $(LIBUBI_SRC_PATH)/libubi_int.h
-	$(CC) $(CFLAGS) -I $(LIBUBI_SRC_PATH) -I../../include -DUDEV_SETTLE_HACK -c $(LIBUBI_SRC_PATH)/libubi.c -o libubi.o
+libubi.a: $(LIBUBI_PATH)/libubi.c  $(LIBUBI_HEADER_PATH)/libubi.h  $(LIBUBI_PATH)/libubi_int.h
+	$(CC) $(CFLAGS) -I $(LIBUBI_PATH) -I../../include -DUDEV_SETTLE_HACK -c $(LIBUBI_PATH)/libubi.c -o libubi.o
 	ar cr libubi.a libubi.o
 
 $(TARGETS): $(addprefix $(BUILDDIR)/, common.o) libubi.a
diff --git a/ubi-utils/Makefile b/ubi-utils/Makefile
deleted file mode 100644
index df81cd9..0000000
--- a/ubi-utils/Makefile
+++ /dev/null
@@ -1,60 +0,0 @@
-#
-# Makefile for ubi-utils
-#
-
-KERNELHDR := ../include
-
-# CFLAGS += -Werror
-CPPFLAGS += -Iinclude -Isrc -I$(KERNELHDR)
-
-LIBS = libubi libubigen libiniparser libscan
-TARGETS = ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
-          ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol
-
-VPATH = src
-LDLIBS = -L$(BUILDDIR)/../lib -lmtd
-
-include ../common.mk
-
-# And the below is the rule to get final executable from its .o and ubiutils-common.o
-$(TARGETS): $(addprefix $(BUILDDIR)/,\
-	libubi.a ubiutils-common.o)
-#	$(CC) $(CFLAGS) $(filter %.o, $^) -L. -lubi -o $@
-
-$(BUILDDIR)/ubicrc32: $(addprefix $(BUILDDIR)/,\
-	ubicrc32.o)
-#	$(CC) $(CFLAGS) -o $@ $^
-
-$(BUILDDIR)/ubinize: $(addprefix $(BUILDDIR)/,\
-	ubinize.o ubiutils-common.o libiniparser.a libubigen.a)
-#	$(CC) $(CFLAGS) $(filter %.o, $^) -L. -liniparser -lubigen -o $@
-
-$(BUILDDIR)/mtdinfo: $(addprefix $(BUILDDIR)/,\
-	libubigen.a ubiutils-common.o)
-#	$(CC) $(CFLAGS) $(filter %.o, $^) -L. -lmtd -lubigen -o $@
-
-$(BUILDDIR)/ubiformat: $(addprefix $(BUILDDIR)/,\
-	ubiformat.o ubiutils-common.o libscan.a libubi.a libubigen.a)
-#	$(CC) $(CFLAGS) $(filter %.o, $^) -L. -lmtd -lscan -lubi -lubigen -o $@
-
-$(BUILDDIR)/libubi.a: $(BUILDDIR)/libubi.o
-
-$(BUILDDIR)/libubigen.a: $(BUILDDIR)/libubigen.o
-
-$(BUILDDIR)/libiniparser.a: $(addprefix $(BUILDDIR)/,\
-	libiniparser.o dictionary.o)
-
-$(BUILDDIR)/libscan.a: $(addprefix $(BUILDDIR)/,\
-	libscan.o)
-
-clean::
-	rm -f $(addsuffix .a, $(LIBS))
-
-install::
-	mkdir -p ${DESTDIR}/${SBINDIR}
-	install -m 0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
-
-uninstall:
-	for file in ${TARGETS}; do \
-		$(RM) ${DESTDIR}/${SBINDIR}/$$file; \
-	done
diff --git a/ubi-utils/src/dictionary.c b/ubi-utils/dictionary.c
similarity index 100%
rename from ubi-utils/src/dictionary.c
rename to ubi-utils/dictionary.c
diff --git a/ubi-utils/src/dictionary.h b/ubi-utils/include/dictionary.h
similarity index 100%
rename from ubi-utils/src/dictionary.h
rename to ubi-utils/include/dictionary.h
diff --git a/ubi-utils/src/libiniparser.c b/ubi-utils/libiniparser.c
similarity index 100%
rename from ubi-utils/src/libiniparser.c
rename to ubi-utils/libiniparser.c
diff --git a/ubi-utils/src/libscan.c b/ubi-utils/libscan.c
similarity index 100%
rename from ubi-utils/src/libscan.c
rename to ubi-utils/libscan.c
diff --git a/ubi-utils/src/libubi.c b/ubi-utils/libubi.c
similarity index 100%
rename from ubi-utils/src/libubi.c
rename to ubi-utils/libubi.c
diff --git a/ubi-utils/src/libubi_int.h b/ubi-utils/libubi_int.h
similarity index 100%
rename from ubi-utils/src/libubi_int.h
rename to ubi-utils/libubi_int.h
diff --git a/ubi-utils/src/libubigen.c b/ubi-utils/libubigen.c
similarity index 100%
rename from ubi-utils/src/libubigen.c
rename to ubi-utils/libubigen.c
diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/mtdinfo.c
similarity index 100%
rename from ubi-utils/src/mtdinfo.c
rename to ubi-utils/mtdinfo.c
diff --git a/ubi-utils/src/ubiattach.c b/ubi-utils/ubiattach.c
similarity index 100%
rename from ubi-utils/src/ubiattach.c
rename to ubi-utils/ubiattach.c
diff --git a/ubi-utils/src/ubicrc32.c b/ubi-utils/ubicrc32.c
similarity index 100%
rename from ubi-utils/src/ubicrc32.c
rename to ubi-utils/ubicrc32.c
diff --git a/ubi-utils/src/ubidetach.c b/ubi-utils/ubidetach.c
similarity index 100%
rename from ubi-utils/src/ubidetach.c
rename to ubi-utils/ubidetach.c
diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/ubiformat.c
similarity index 100%
rename from ubi-utils/src/ubiformat.c
rename to ubi-utils/ubiformat.c
diff --git a/ubi-utils/src/ubimkvol.c b/ubi-utils/ubimkvol.c
similarity index 100%
rename from ubi-utils/src/ubimkvol.c
rename to ubi-utils/ubimkvol.c
diff --git a/ubi-utils/src/ubinfo.c b/ubi-utils/ubinfo.c
similarity index 100%
rename from ubi-utils/src/ubinfo.c
rename to ubi-utils/ubinfo.c
diff --git a/ubi-utils/src/ubinize.c b/ubi-utils/ubinize.c
similarity index 100%
rename from ubi-utils/src/ubinize.c
rename to ubi-utils/ubinize.c
diff --git a/ubi-utils/src/ubirename.c b/ubi-utils/ubirename.c
similarity index 100%
rename from ubi-utils/src/ubirename.c
rename to ubi-utils/ubirename.c
diff --git a/ubi-utils/src/ubirmvol.c b/ubi-utils/ubirmvol.c
similarity index 100%
rename from ubi-utils/src/ubirmvol.c
rename to ubi-utils/ubirmvol.c
diff --git a/ubi-utils/src/ubirsvol.c b/ubi-utils/ubirsvol.c
similarity index 100%
rename from ubi-utils/src/ubirsvol.c
rename to ubi-utils/ubirsvol.c
diff --git a/ubi-utils/src/ubiupdatevol.c b/ubi-utils/ubiupdatevol.c
similarity index 100%
rename from ubi-utils/src/ubiupdatevol.c
rename to ubi-utils/ubiupdatevol.c
diff --git a/ubi-utils/src/ubiutils-common.c b/ubi-utils/ubiutils-common.c
similarity index 100%
rename from ubi-utils/src/ubiutils-common.c
rename to ubi-utils/ubiutils-common.c
-- 
1.7.5.3
