Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaMNc-0006AY-GI
	for linux-mtd@lists.infradead.org; Sat, 25 Jun 2011 06:30:49 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 2DE5D1B4017
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Jun 2011 06:30:06 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] rewrite build system to avoid recursion
Date: Sat, 25 Jun 2011 02:30:04 -0400
Message-Id: <1308983405-27064-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ubi-utils/src/ subdir is tossed as it just complicates things for no
real gain.

The top level clean is replaced with a `find -delete` on objects, so it
might prune more than necessary, but many projects now do this sort of
thing and no one complained there.

A "mkdep" helper generates the actual rule, and the variables are used
with "foreach" to expand these automatically.

While we're gutting things, also through in kbuild style output while
building to make things more legible.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile                        |   81 ++-
 common.mk                       |   46 +-
 lib/Makefile                    |   22 -
 mkfs.ubifs/Makefile             |   29 -
 ubi-utils/Makefile              |   60 --
 ubi-utils/dictionary.c          |  405 ++++++++++++
 ubi-utils/dictionary.h          |  174 +++++
 ubi-utils/libiniparser.c        |  646 ++++++++++++++++++
 ubi-utils/libscan.c             |  225 +++++++
 ubi-utils/libubi.c              | 1372 +++++++++++++++++++++++++++++++++++++++
 ubi-utils/libubi_int.h          |  131 ++++
 ubi-utils/libubigen.c           |  315 +++++++++
 ubi-utils/mtdinfo.c             |  446 +++++++++++++
 ubi-utils/src/dictionary.c      |  405 ------------
 ubi-utils/src/dictionary.h      |  174 -----
 ubi-utils/src/libiniparser.c    |  646 ------------------
 ubi-utils/src/libscan.c         |  225 -------
 ubi-utils/src/libubi.c          | 1372 ---------------------------------------
 ubi-utils/src/libubi_int.h      |  131 ----
 ubi-utils/src/libubigen.c       |  315 ---------
 ubi-utils/src/mtdinfo.c         |  446 -------------
 ubi-utils/src/ubiattach.c       |  225 -------
 ubi-utils/src/ubicrc32.c        |  124 ----
 ubi-utils/src/ubidetach.c       |  208 ------
 ubi-utils/src/ubiformat.c       |  950 ---------------------------
 ubi-utils/src/ubimkvol.c        |  295 ---------
 ubi-utils/src/ubinfo.c          |  434 -------------
 ubi-utils/src/ubinize.c         |  628 ------------------
 ubi-utils/src/ubirename.c       |  147 -----
 ubi-utils/src/ubirmvol.c        |  211 ------
 ubi-utils/src/ubirsvol.c        |  245 -------
 ubi-utils/src/ubiupdatevol.c    |  324 ---------
 ubi-utils/src/ubiutils-common.c |  211 ------
 ubi-utils/ubiattach.c           |  225 +++++++
 ubi-utils/ubicrc32.c            |  124 ++++
 ubi-utils/ubidetach.c           |  208 ++++++
 ubi-utils/ubiformat.c           |  950 +++++++++++++++++++++++++++
 ubi-utils/ubimkvol.c            |  295 +++++++++
 ubi-utils/ubinfo.c              |  434 +++++++++++++
 ubi-utils/ubinize.c             |  628 ++++++++++++++++++
 ubi-utils/ubirename.c           |  147 +++++
 ubi-utils/ubirmvol.c            |  211 ++++++
 ubi-utils/ubirsvol.c            |  245 +++++++
 ubi-utils/ubiupdatevol.c        |  324 +++++++++
 ubi-utils/ubiutils-common.c     |  211 ++++++
 45 files changed, 7804 insertions(+), 7866 deletions(-)
 delete mode 100644 lib/Makefile
 delete mode 100644 mkfs.ubifs/Makefile
 delete mode 100644 ubi-utils/Makefile
 create mode 100644 ubi-utils/dictionary.c
 create mode 100644 ubi-utils/dictionary.h
 create mode 100644 ubi-utils/libiniparser.c
 create mode 100644 ubi-utils/libscan.c
 create mode 100644 ubi-utils/libubi.c
 create mode 100644 ubi-utils/libubi_int.h
 create mode 100644 ubi-utils/libubigen.c
 create mode 100644 ubi-utils/mtdinfo.c
 delete mode 100644 ubi-utils/src/dictionary.c
 delete mode 100644 ubi-utils/src/dictionary.h
 delete mode 100644 ubi-utils/src/libiniparser.c
 delete mode 100644 ubi-utils/src/libscan.c
 delete mode 100644 ubi-utils/src/libubi.c
 delete mode 100644 ubi-utils/src/libubi_int.h
 delete mode 100644 ubi-utils/src/libubigen.c
 delete mode 100644 ubi-utils/src/mtdinfo.c
 delete mode 100644 ubi-utils/src/ubiattach.c
 delete mode 100644 ubi-utils/src/ubicrc32.c
 delete mode 100644 ubi-utils/src/ubidetach.c
 delete mode 100644 ubi-utils/src/ubiformat.c
 delete mode 100644 ubi-utils/src/ubimkvol.c
 delete mode 100644 ubi-utils/src/ubinfo.c
 delete mode 100644 ubi-utils/src/ubinize.c
 delete mode 100644 ubi-utils/src/ubirename.c
 delete mode 100644 ubi-utils/src/ubirmvol.c
 delete mode 100644 ubi-utils/src/ubirsvol.c
 delete mode 100644 ubi-utils/src/ubiupdatevol.c
 delete mode 100644 ubi-utils/src/ubiutils-common.c
 create mode 100644 ubi-utils/ubiattach.c
 create mode 100644 ubi-utils/ubicrc32.c
 create mode 100644 ubi-utils/ubidetach.c
 create mode 100644 ubi-utils/ubiformat.c
 create mode 100644 ubi-utils/ubimkvol.c
 create mode 100644 ubi-utils/ubinfo.c
 create mode 100644 ubi-utils/ubinize.c
 create mode 100644 ubi-utils/ubirename.c
 create mode 100644 ubi-utils/ubirmvol.c
 create mode 100644 ubi-utils/ubirsvol.c
 create mode 100644 ubi-utils/ubiupdatevol.c
 create mode 100644 ubi-utils/ubiutils-common.c

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
index 0f3d447..51231e9 100644
--- a/common.mk
+++ b/common.mk
@@ -39,34 +39,46 @@ override BUILDDIR := $(patsubst %/,%,$(BUILDDIR))
 
 override TARGETS := $(addprefix $(BUILDDIR)/,$(TARGETS))
 
-SUBDIRS_ALL = $(patsubst %,subdirs_%_all,$(SUBDIRS))
-SUBDIRS_CLEAN = $(patsubst %,subdirs_%_clean,$(SUBDIRS))
-SUBDIRS_INSTALL = $(patsubst %,subdirs_%_install,$(SUBDIRS))
+ifeq ($(V),1)
+XECHO = @:
+Q =
+else
+XECHO = @echo
+Q = @
+endif
+define BECHO
+$(XECHO) "  $1      $(subst $(BUILDDIR)/,,$@)"
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
diff --git a/ubi-utils/dictionary.c b/ubi-utils/dictionary.c
new file mode 100644
index 0000000..b7c9ebf
--- /dev/null
+++ b/ubi-utils/dictionary.c
@@ -0,0 +1,405 @@
+/*-------------------------------------------------------------------------*/
+/**
+   @file	dictionary.c
+   @author	N. Devillard
+   @date	Sep 2007
+   @version	$Revision: 1.27 $
+   @brief	Implements a dictionary for string variables.
+
+   This module implements a simple dictionary object, i.e. a list
+   of string/string associations. This object is useful to store e.g.
+   informations retrieved from a configuration file (ini files).
+*/
+/*--------------------------------------------------------------------------*/
+
+/*
+	$Id: dictionary.c,v 1.27 2007-11-23 21:39:18 ndevilla Exp $
+	$Revision: 1.27 $
+*/
+/*---------------------------------------------------------------------------
+   								Includes
+ ---------------------------------------------------------------------------*/
+#include "dictionary.h"
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+/** Maximum value size for integers and doubles. */
+#define MAXVALSZ	1024
+
+/** Minimal allocated number of entries in a dictionary */
+#define DICTMINSZ	128
+
+/** Invalid key token */
+#define DICT_INVALID_KEY    ((char*)-1)
+
+/*---------------------------------------------------------------------------
+  							Private functions
+ ---------------------------------------------------------------------------*/
+
+/* Doubles the allocated size associated to a pointer */
+/* 'size' is the current allocated size. */
+static void * mem_double(void * ptr, int size)
+{
+    void * newptr ;
+ 
+    newptr = calloc(2*size, 1);
+    if (newptr==NULL) {
+        return NULL ;
+    }
+    memcpy(newptr, ptr, size);
+    free(ptr);
+    return newptr ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Duplicate a string
+  @param    s String to duplicate
+  @return   Pointer to a newly allocated string, to be freed with free()
+
+  This is a replacement for strdup(). This implementation is provided
+  for systems that do not have it.
+ */
+/*--------------------------------------------------------------------------*/
+static char * xstrdup(char * s)
+{
+    char * t ;
+    if (!s)
+        return NULL ;
+    t = malloc(strlen(s)+1) ;
+    if (t) {
+        strcpy(t,s);
+    }
+    return t ;
+}
+
+/*---------------------------------------------------------------------------
+  							Function codes
+ ---------------------------------------------------------------------------*/
+/*-------------------------------------------------------------------------*/
+/**
+  @brief	Compute the hash key for a string.
+  @param	key		Character string to use for key.
+  @return	1 unsigned int on at least 32 bits.
+
+  This hash function has been taken from an Article in Dr Dobbs Journal.
+  This is normally a collision-free function, distributing keys evenly.
+  The key is stored anyway in the struct so that collision can be avoided
+  by comparing the key itself in last resort.
+ */
+/*--------------------------------------------------------------------------*/
+unsigned dictionary_hash(char * key)
+{
+	int			len ;
+	unsigned	hash ;
+	int			i ;
+
+	len = strlen(key);
+	for (hash=0, i=0 ; i<len ; i++) {
+		hash += (unsigned)key[i] ;
+		hash += (hash<<10);
+		hash ^= (hash>>6) ;
+	}
+	hash += (hash <<3);
+	hash ^= (hash >>11);
+	hash += (hash <<15);
+	return hash ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief	Create a new dictionary object.
+  @param	size	Optional initial size of the dictionary.
+  @return	1 newly allocated dictionary objet.
+
+  This function allocates a new dictionary object of given size and returns
+  it. If you do not know in advance (roughly) the number of entries in the
+  dictionary, give size=0.
+ */
+/*--------------------------------------------------------------------------*/
+dictionary * dictionary_new(int size)
+{
+	dictionary	*	d ;
+
+	/* If no size was specified, allocate space for DICTMINSZ */
+	if (size<DICTMINSZ) size=DICTMINSZ ;
+
+	if (!(d = (dictionary *)calloc(1, sizeof(dictionary)))) {
+		return NULL;
+	}
+	d->size = size ;
+	d->val  = (char **)calloc(size, sizeof(char*));
+	d->key  = (char **)calloc(size, sizeof(char*));
+	d->hash = (unsigned int *)calloc(size, sizeof(unsigned));
+	return d ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief	Delete a dictionary object
+  @param	d	dictionary object to deallocate.
+  @return	void
+
+  Deallocate a dictionary object and all memory associated to it.
+ */
+/*--------------------------------------------------------------------------*/
+void dictionary_del(dictionary * d)
+{
+	int		i ;
+
+	if (d==NULL) return ;
+	for (i=0 ; i<d->size ; i++) {
+		if (d->key[i]!=NULL)
+			free(d->key[i]);
+		if (d->val[i]!=NULL)
+			free(d->val[i]);
+	}
+	free(d->val);
+	free(d->key);
+	free(d->hash);
+	free(d);
+	return ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief	Get a value from a dictionary.
+  @param	d		dictionary object to search.
+  @param	key		Key to look for in the dictionary.
+  @param    def     Default value to return if key not found.
+  @return	1 pointer to internally allocated character string.
+
+  This function locates a key in a dictionary and returns a pointer to its
+  value, or the passed 'def' pointer if no such key can be found in
+  dictionary. The returned character pointer points to data internal to the
+  dictionary object, you should not try to free it or modify it.
+ */
+/*--------------------------------------------------------------------------*/
+char * dictionary_get(dictionary * d, char * key, char * def)
+{
+	unsigned	hash ;
+	int			i ;
+
+	hash = dictionary_hash(key);
+	for (i=0 ; i<d->size ; i++) {
+        if (d->key[i]==NULL)
+            continue ;
+        /* Compare hash */
+		if (hash==d->hash[i]) {
+            /* Compare string, to avoid hash collisions */
+            if (!strcmp(key, d->key[i])) {
+				return d->val[i] ;
+			}
+		}
+	}
+	return def ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Set a value in a dictionary.
+  @param    d       dictionary object to modify.
+  @param    key     Key to modify or add.
+  @param    val     Value to add.
+  @return   int     0 if Ok, anything else otherwise
+
+  If the given key is found in the dictionary, the associated value is
+  replaced by the provided one. If the key cannot be found in the
+  dictionary, it is added to it.
+
+  It is Ok to provide a NULL value for val, but NULL values for the dictionary
+  or the key are considered as errors: the function will return immediately
+  in such a case.
+
+  Notice that if you dictionary_set a variable to NULL, a call to
+  dictionary_get will return a NULL value: the variable will be found, and
+  its value (NULL) is returned. In other words, setting the variable
+  content to NULL is equivalent to deleting the variable from the
+  dictionary. It is not possible (in this implementation) to have a key in
+  the dictionary without value.
+
+  This function returns non-zero in case of failure.
+ */
+/*--------------------------------------------------------------------------*/
+int dictionary_set(dictionary * d, char * key, char * val)
+{
+	int			i ;
+	unsigned	hash ;
+
+	if (d==NULL || key==NULL) return -1 ;
+	
+	/* Compute hash for this key */
+	hash = dictionary_hash(key) ;
+	/* Find if value is already in dictionary */
+	if (d->n>0) {
+		for (i=0 ; i<d->size ; i++) {
+            if (d->key[i]==NULL)
+                continue ;
+			if (hash==d->hash[i]) { /* Same hash value */
+				if (!strcmp(key, d->key[i])) {	 /* Same key */
+					/* Found a value: modify and return */
+					if (d->val[i]!=NULL)
+						free(d->val[i]);
+                    d->val[i] = val ? xstrdup(val) : NULL ;
+                    /* Value has been modified: return */
+					return 0 ;
+				}
+			}
+		}
+	}
+	/* Add a new value */
+	/* See if dictionary needs to grow */
+	if (d->n==d->size) {
+
+		/* Reached maximum size: reallocate dictionary */
+		d->val  = (char **)mem_double(d->val,  d->size * sizeof(char*)) ;
+		d->key  = (char **)mem_double(d->key,  d->size * sizeof(char*)) ;
+		d->hash = (unsigned int *)mem_double(d->hash, d->size * sizeof(unsigned)) ;
+        if ((d->val==NULL) || (d->key==NULL) || (d->hash==NULL)) {
+            /* Cannot grow dictionary */
+            return -1 ;
+        }
+		/* Double size */
+		d->size *= 2 ;
+	}
+
+    /* Insert key in the first empty slot */
+    for (i=0 ; i<d->size ; i++) {
+        if (d->key[i]==NULL) {
+            /* Add key here */
+            break ;
+        }
+    }
+	/* Copy key */
+	d->key[i]  = xstrdup(key);
+    d->val[i]  = val ? xstrdup(val) : NULL ;
+	d->hash[i] = hash;
+	d->n ++ ;
+	return 0 ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief	Delete a key in a dictionary
+  @param	d		dictionary object to modify.
+  @param	key		Key to remove.
+  @return   void
+
+  This function deletes a key in a dictionary. Nothing is done if the
+  key cannot be found.
+ */
+/*--------------------------------------------------------------------------*/
+void dictionary_unset(dictionary * d, char * key)
+{
+	unsigned	hash ;
+	int			i ;
+
+	if (key == NULL) {
+		return;
+	}
+
+	hash = dictionary_hash(key);
+	for (i=0 ; i<d->size ; i++) {
+        if (d->key[i]==NULL)
+            continue ;
+        /* Compare hash */
+		if (hash==d->hash[i]) {
+            /* Compare string, to avoid hash collisions */
+            if (!strcmp(key, d->key[i])) {
+                /* Found key */
+                break ;
+			}
+		}
+	}
+    if (i>=d->size)
+        /* Key not found */
+        return ;
+
+    free(d->key[i]);
+    d->key[i] = NULL ;
+    if (d->val[i]!=NULL) {
+        free(d->val[i]);
+        d->val[i] = NULL ;
+    }
+    d->hash[i] = 0 ;
+    d->n -- ;
+    return ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief	Dump a dictionary to an opened file pointer.
+  @param	d	Dictionary to dump
+  @param	f	Opened file pointer.
+  @return	void
+
+  Dumps a dictionary onto an opened file pointer. Key pairs are printed out
+  as @c [Key]=[Value], one per line. It is Ok to provide stdout or stderr as
+  output file pointers.
+ */
+/*--------------------------------------------------------------------------*/
+void dictionary_dump(dictionary * d, FILE * out)
+{
+	int		i ;
+
+	if (d==NULL || out==NULL) return ;
+	if (d->n<1) {
+		fprintf(out, "empty dictionary\n");
+		return ;
+	}
+	for (i=0 ; i<d->size ; i++) {
+        if (d->key[i]) {
+            fprintf(out, "%20s\t[%s]\n",
+                    d->key[i],
+                    d->val[i] ? d->val[i] : "UNDEF");
+        }
+	}
+	return ;
+}
+
+
+/* Test code */
+#ifdef TESTDIC
+#define NVALS 20000
+int main(int argc, char *argv[])
+{
+	dictionary	*	d ;
+	char	*	val ;
+	int			i ;
+	char		cval[90] ;
+
+	/* Allocate dictionary */
+	printf("allocating...\n");
+	d = dictionary_new(0);
+	
+	/* Set values in dictionary */
+	printf("setting %d values...\n", NVALS);
+	for (i=0 ; i<NVALS ; i++) {
+		sprintf(cval, "%04d", i);
+		dictionary_set(d, cval, "salut");
+	}
+	printf("getting %d values...\n", NVALS);
+	for (i=0 ; i<NVALS ; i++) {
+		sprintf(cval, "%04d", i);
+		val = dictionary_get(d, cval, DICT_INVALID_KEY);
+		if (val==DICT_INVALID_KEY) {
+			printf("cannot get value for key [%s]\n", cval);
+		}
+	}
+    printf("unsetting %d values...\n", NVALS);
+	for (i=0 ; i<NVALS ; i++) {
+		sprintf(cval, "%04d", i);
+		dictionary_unset(d, cval);
+	}
+    if (d->n != 0) {
+        printf("error deleting values\n");
+    }
+	printf("deallocating...\n");
+	dictionary_del(d);
+	return 0 ;
+}
+#endif
+/* vim: set ts=4 et sw=4 tw=75 */
diff --git a/ubi-utils/dictionary.h b/ubi-utils/dictionary.h
new file mode 100644
index 0000000..c7d1790
--- /dev/null
+++ b/ubi-utils/dictionary.h
@@ -0,0 +1,174 @@
+
+/*-------------------------------------------------------------------------*/
+/**
+   @file    dictionary.h
+   @author  N. Devillard
+   @date    Sep 2007
+   @version $Revision: 1.12 $
+   @brief   Implements a dictionary for string variables.
+
+   This module implements a simple dictionary object, i.e. a list
+   of string/string associations. This object is useful to store e.g.
+   informations retrieved from a configuration file (ini files).
+*/
+/*--------------------------------------------------------------------------*/
+
+/*
+	$Id: dictionary.h,v 1.12 2007-11-23 21:37:00 ndevilla Exp $
+	$Author: ndevilla $
+	$Date: 2007-11-23 21:37:00 $
+	$Revision: 1.12 $
+*/
+
+#ifndef _DICTIONARY_H_
+#define _DICTIONARY_H_
+
+/*---------------------------------------------------------------------------
+   								Includes
+ ---------------------------------------------------------------------------*/
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+/*---------------------------------------------------------------------------
+   								New types
+ ---------------------------------------------------------------------------*/
+
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief	Dictionary object
+
+  This object contains a list of string/string associations. Each
+  association is identified by a unique string key. Looking up values
+  in the dictionary is speeded up by the use of a (hopefully collision-free)
+  hash function.
+ */
+/*-------------------------------------------------------------------------*/
+typedef struct _dictionary_ {
+	int				n ;		/** Number of entries in dictionary */
+	int				size ;	/** Storage size */
+	char 		**	val ;	/** List of string values */
+	char 		**  key ;	/** List of string keys */
+	unsigned	 *	hash ;	/** List of hash values for keys */
+} dictionary ;
+
+
+/*---------------------------------------------------------------------------
+  							Function prototypes
+ ---------------------------------------------------------------------------*/
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Compute the hash key for a string.
+  @param    key     Character string to use for key.
+  @return   1 unsigned int on at least 32 bits.
+
+  This hash function has been taken from an Article in Dr Dobbs Journal.
+  This is normally a collision-free function, distributing keys evenly.
+  The key is stored anyway in the struct so that collision can be avoided
+  by comparing the key itself in last resort.
+ */
+/*--------------------------------------------------------------------------*/
+unsigned dictionary_hash(char * key);
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Create a new dictionary object.
+  @param    size    Optional initial size of the dictionary.
+  @return   1 newly allocated dictionary objet.
+
+  This function allocates a new dictionary object of given size and returns
+  it. If you do not know in advance (roughly) the number of entries in the
+  dictionary, give size=0.
+ */
+/*--------------------------------------------------------------------------*/
+dictionary * dictionary_new(int size);
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Delete a dictionary object
+  @param    d   dictionary object to deallocate.
+  @return   void
+
+  Deallocate a dictionary object and all memory associated to it.
+ */
+/*--------------------------------------------------------------------------*/
+void dictionary_del(dictionary * vd);
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Get a value from a dictionary.
+  @param    d       dictionary object to search.
+  @param    key     Key to look for in the dictionary.
+  @param    def     Default value to return if key not found.
+  @return   1 pointer to internally allocated character string.
+
+  This function locates a key in a dictionary and returns a pointer to its
+  value, or the passed 'def' pointer if no such key can be found in
+  dictionary. The returned character pointer points to data internal to the
+  dictionary object, you should not try to free it or modify it.
+ */
+/*--------------------------------------------------------------------------*/
+char * dictionary_get(dictionary * d, char * key, char * def);
+
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Set a value in a dictionary.
+  @param    d       dictionary object to modify.
+  @param    key     Key to modify or add.
+  @param    val     Value to add.
+  @return   int     0 if Ok, anything else otherwise
+
+  If the given key is found in the dictionary, the associated value is
+  replaced by the provided one. If the key cannot be found in the
+  dictionary, it is added to it.
+
+  It is Ok to provide a NULL value for val, but NULL values for the dictionary
+  or the key are considered as errors: the function will return immediately
+  in such a case.
+
+  Notice that if you dictionary_set a variable to NULL, a call to
+  dictionary_get will return a NULL value: the variable will be found, and
+  its value (NULL) is returned. In other words, setting the variable
+  content to NULL is equivalent to deleting the variable from the
+  dictionary. It is not possible (in this implementation) to have a key in
+  the dictionary without value.
+
+  This function returns non-zero in case of failure.
+ */
+/*--------------------------------------------------------------------------*/
+int dictionary_set(dictionary * vd, char * key, char * val);
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Delete a key in a dictionary
+  @param    d       dictionary object to modify.
+  @param    key     Key to remove.
+  @return   void
+
+  This function deletes a key in a dictionary. Nothing is done if the
+  key cannot be found.
+ */
+/*--------------------------------------------------------------------------*/
+void dictionary_unset(dictionary * d, char * key);
+
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Dump a dictionary to an opened file pointer.
+  @param    d   Dictionary to dump
+  @param    f   Opened file pointer.
+  @return   void
+
+  Dumps a dictionary onto an opened file pointer. Key pairs are printed out
+  as @c [Key]=[Value], one per line. It is Ok to provide stdout or stderr as
+  output file pointers.
+ */
+/*--------------------------------------------------------------------------*/
+void dictionary_dump(dictionary * d, FILE * out);
+
+#endif
diff --git a/ubi-utils/libiniparser.c b/ubi-utils/libiniparser.c
new file mode 100644
index 0000000..3bea51e
--- /dev/null
+++ b/ubi-utils/libiniparser.c
@@ -0,0 +1,646 @@
+
+/*-------------------------------------------------------------------------*/
+/**
+   @file    iniparser.c
+   @author  N. Devillard
+   @date    Sep 2007
+   @version 3.0
+   @brief   Parser for ini files.
+*/
+/*--------------------------------------------------------------------------*/
+/*
+    $Id: iniparser.c,v 2.18 2008-01-03 18:35:39 ndevilla Exp $
+    $Revision: 2.18 $
+    $Date: 2008-01-03 18:35:39 $
+*/
+/*---------------------------- Includes ------------------------------------*/
+#include <ctype.h>
+#include <libiniparser.h>
+
+/*---------------------------- Defines -------------------------------------*/
+#define ASCIILINESZ         (1024)
+#define INI_INVALID_KEY     ((char*)-1)
+
+/*---------------------------------------------------------------------------
+                        Private to this module
+ ---------------------------------------------------------------------------*/
+/**
+ * This enum stores the status for each parsed line (internal use only).
+ */
+typedef enum _line_status_ {
+    LINE_UNPROCESSED,
+    LINE_ERROR,
+    LINE_EMPTY,
+    LINE_COMMENT,
+    LINE_SECTION,
+    LINE_VALUE
+} line_status ;
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief	Convert a string to lowercase.
+  @param	s	String to convert.
+  @return	ptr to statically allocated string.
+
+  This function returns a pointer to a statically allocated string
+  containing a lowercased version of the input string. Do not free
+  or modify the returned string! Since the returned string is statically
+  allocated, it will be modified at each function call (not re-entrant).
+ */
+/*--------------------------------------------------------------------------*/
+static char * strlwc(const char * s)
+{
+    static char l[ASCIILINESZ+1];
+    int i ;
+
+    if (s==NULL) return NULL ;
+    memset(l, 0, ASCIILINESZ+1);
+    i=0 ;
+    while (s[i] && i<ASCIILINESZ) {
+        l[i] = (char)tolower((int)s[i]);
+        i++ ;
+    }
+    l[ASCIILINESZ]=(char)0;
+    return l ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief	Remove blanks at the beginning and the end of a string.
+  @param	s	String to parse.
+  @return	ptr to statically allocated string.
+
+  This function returns a pointer to a statically allocated string,
+  which is identical to the input string, except that all blank
+  characters at the end and the beg. of the string have been removed.
+  Do not free or modify the returned string! Since the returned string
+  is statically allocated, it will be modified at each function call
+  (not re-entrant).
+ */
+/*--------------------------------------------------------------------------*/
+static char * strstrip(char * s)
+{
+    static char l[ASCIILINESZ+1];
+	char * last ;
+	
+    if (s==NULL) return NULL ;
+    
+	while (isspace((int)*s) && *s) s++;
+	memset(l, 0, ASCIILINESZ+1);
+	strcpy(l, s);
+	last = l + strlen(l);
+	while (last > l) {
+		if (!isspace((int)*(last-1)))
+			break ;
+		last -- ;
+	}
+	*last = (char)0;
+	return (char*)l ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Get number of sections in a dictionary
+  @param    d   Dictionary to examine
+  @return   int Number of sections found in dictionary
+
+  This function returns the number of sections found in a dictionary.
+  The test to recognize sections is done on the string stored in the
+  dictionary: a section name is given as "section" whereas a key is
+  stored as "section:key", thus the test looks for entries that do not
+  contain a colon.
+
+  This clearly fails in the case a section name contains a colon, but
+  this should simply be avoided.
+
+  This function returns -1 in case of error.
+ */
+/*--------------------------------------------------------------------------*/
+int iniparser_getnsec(dictionary * d)
+{
+    int i ;
+    int nsec ;
+
+    if (d==NULL) return -1 ;
+    nsec=0 ;
+    for (i=0 ; i<d->size ; i++) {
+        if (d->key[i]==NULL)
+            continue ;
+        if (strchr(d->key[i], ':')==NULL) {
+            nsec ++ ;
+        }
+    }
+    return nsec ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Get name for section n in a dictionary.
+  @param    d   Dictionary to examine
+  @param    n   Section number (from 0 to nsec-1).
+  @return   Pointer to char string
+
+  This function locates the n-th section in a dictionary and returns
+  its name as a pointer to a string statically allocated inside the
+  dictionary. Do not free or modify the returned string!
+
+  This function returns NULL in case of error.
+ */
+/*--------------------------------------------------------------------------*/
+char * iniparser_getsecname(dictionary * d, int n)
+{
+    int i ;
+    int foundsec ;
+
+    if (d==NULL || n<0) return NULL ;
+    foundsec=0 ;
+    for (i=0 ; i<d->size ; i++) {
+        if (d->key[i]==NULL)
+            continue ;
+        if (strchr(d->key[i], ':')==NULL) {
+            foundsec++ ;
+            if (foundsec>n)
+                break ;
+        }
+    }
+    if (foundsec<=n) {
+        return NULL ;
+    }
+    return d->key[i] ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Dump a dictionary to an opened file pointer.
+  @param    d   Dictionary to dump.
+  @param    f   Opened file pointer to dump to.
+  @return   void
+
+  This function prints out the contents of a dictionary, one element by
+  line, onto the provided file pointer. It is OK to specify @c stderr
+  or @c stdout as output files. This function is meant for debugging
+  purposes mostly.
+ */
+/*--------------------------------------------------------------------------*/
+void iniparser_dump(dictionary * d, FILE * f)
+{
+    int     i ;
+
+    if (d==NULL || f==NULL) return ;
+    for (i=0 ; i<d->size ; i++) {
+        if (d->key[i]==NULL)
+            continue ;
+        if (d->val[i]!=NULL) {
+            fprintf(f, "[%s]=[%s]\n", d->key[i], d->val[i]);
+        } else {
+            fprintf(f, "[%s]=UNDEF\n", d->key[i]);
+        }
+    }
+    return ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Save a dictionary to a loadable ini file
+  @param    d   Dictionary to dump
+  @param    f   Opened file pointer to dump to
+  @return   void
+
+  This function dumps a given dictionary into a loadable ini file.
+  It is Ok to specify @c stderr or @c stdout as output files.
+ */
+/*--------------------------------------------------------------------------*/
+void iniparser_dump_ini(dictionary * d, FILE * f)
+{
+    int     i, j ;
+    char    keym[ASCIILINESZ+1];
+    int     nsec ;
+    char *  secname ;
+    int     seclen ;
+
+    if (d==NULL || f==NULL) return ;
+
+    nsec = iniparser_getnsec(d);
+    if (nsec<1) {
+        /* No section in file: dump all keys as they are */
+        for (i=0 ; i<d->size ; i++) {
+            if (d->key[i]==NULL)
+                continue ;
+            fprintf(f, "%s = %s\n", d->key[i], d->val[i]);
+        }
+        return ;
+    }
+    for (i=0 ; i<nsec ; i++) {
+        secname = iniparser_getsecname(d, i) ;
+        seclen  = (int)strlen(secname);
+        fprintf(f, "\n[%s]\n", secname);
+        sprintf(keym, "%s:", secname);
+        for (j=0 ; j<d->size ; j++) {
+            if (d->key[j]==NULL)
+                continue ;
+            if (!strncmp(d->key[j], keym, seclen+1)) {
+                fprintf(f,
+                        "%-30s = %s\n",
+                        d->key[j]+seclen+1,
+                        d->val[j] ? d->val[j] : "");
+            }
+        }
+    }
+    fprintf(f, "\n");
+    return ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Get the string associated to a key
+  @param    d       Dictionary to search
+  @param    key     Key string to look for
+  @param    def     Default value to return if key not found.
+  @return   pointer to statically allocated character string
+
+  This function queries a dictionary for a key. A key as read from an
+  ini file is given as "section:key". If the key cannot be found,
+  the pointer passed as 'def' is returned.
+  The returned char pointer is pointing to a string allocated in
+  the dictionary, do not free or modify it.
+ */
+/*--------------------------------------------------------------------------*/
+char * iniparser_getstring(dictionary * d, const char * key, char * def)
+{
+    char * lc_key ;
+    char * sval ;
+
+    if (d==NULL || key==NULL)
+        return def ;
+
+    lc_key = strlwc(key);
+    sval = dictionary_get(d, lc_key, def);
+    return sval ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Get the string associated to a key, convert to an int
+  @param    d Dictionary to search
+  @param    key Key string to look for
+  @param    notfound Value to return in case of error
+  @return   integer
+
+  This function queries a dictionary for a key. A key as read from an
+  ini file is given as "section:key". If the key cannot be found,
+  the notfound value is returned.
+
+  Supported values for integers include the usual C notation
+  so decimal, octal (starting with 0) and hexadecimal (starting with 0x)
+  are supported. Examples:
+
+  "42"      ->  42
+  "042"     ->  34 (octal -> decimal)
+  "0x42"    ->  66 (hexa  -> decimal)
+
+  Warning: the conversion may overflow in various ways. Conversion is
+  totally outsourced to strtol(), see the associated man page for overflow
+  handling.
+
+  Credits: Thanks to A. Becker for suggesting strtol()
+ */
+/*--------------------------------------------------------------------------*/
+int iniparser_getint(dictionary * d, const char * key, int notfound)
+{
+    char    *   str ;
+
+    str = iniparser_getstring(d, key, INI_INVALID_KEY);
+    if (str==INI_INVALID_KEY) return notfound ;
+    return (int)strtol(str, NULL, 0);
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Get the string associated to a key, convert to a double
+  @param    d Dictionary to search
+  @param    key Key string to look for
+  @param    notfound Value to return in case of error
+  @return   double
+
+  This function queries a dictionary for a key. A key as read from an
+  ini file is given as "section:key". If the key cannot be found,
+  the notfound value is returned.
+ */
+/*--------------------------------------------------------------------------*/
+double iniparser_getdouble(dictionary * d, char * key, double notfound)
+{
+    char    *   str ;
+
+    str = iniparser_getstring(d, key, INI_INVALID_KEY);
+    if (str==INI_INVALID_KEY) return notfound ;
+    return atof(str);
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Get the string associated to a key, convert to a boolean
+  @param    d Dictionary to search
+  @param    key Key string to look for
+  @param    notfound Value to return in case of error
+  @return   integer
+
+  This function queries a dictionary for a key. A key as read from an
+  ini file is given as "section:key". If the key cannot be found,
+  the notfound value is returned.
+
+  A true boolean is found if one of the following is matched:
+
+  - A string starting with 'y'
+  - A string starting with 'Y'
+  - A string starting with 't'
+  - A string starting with 'T'
+  - A string starting with '1'
+
+  A false boolean is found if one of the following is matched:
+
+  - A string starting with 'n'
+  - A string starting with 'N'
+  - A string starting with 'f'
+  - A string starting with 'F'
+  - A string starting with '0'
+
+  The notfound value returned if no boolean is identified, does not
+  necessarily have to be 0 or 1.
+ */
+/*--------------------------------------------------------------------------*/
+int iniparser_getboolean(dictionary * d, const char * key, int notfound)
+{
+    char    *   c ;
+    int         ret ;
+
+    c = iniparser_getstring(d, key, INI_INVALID_KEY);
+    if (c==INI_INVALID_KEY) return notfound ;
+    if (c[0]=='y' || c[0]=='Y' || c[0]=='1' || c[0]=='t' || c[0]=='T') {
+        ret = 1 ;
+    } else if (c[0]=='n' || c[0]=='N' || c[0]=='0' || c[0]=='f' || c[0]=='F') {
+        ret = 0 ;
+    } else {
+        ret = notfound ;
+    }
+    return ret;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Finds out if a given entry exists in a dictionary
+  @param    ini     Dictionary to search
+  @param    entry   Name of the entry to look for
+  @return   integer 1 if entry exists, 0 otherwise
+
+  Finds out if a given entry exists in the dictionary. Since sections
+  are stored as keys with NULL associated values, this is the only way
+  of querying for the presence of sections in a dictionary.
+ */
+/*--------------------------------------------------------------------------*/
+int iniparser_find_entry(
+    dictionary  *   ini,
+    char        *   entry
+)
+{
+    int found=0 ;
+    if (iniparser_getstring(ini, entry, INI_INVALID_KEY)!=INI_INVALID_KEY) {
+        found = 1 ;
+    }
+    return found ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Set an entry in a dictionary.
+  @param    ini     Dictionary to modify.
+  @param    entry   Entry to modify (entry name)
+  @param    val     New value to associate to the entry.
+  @return   int 0 if Ok, -1 otherwise.
+
+  If the given entry can be found in the dictionary, it is modified to
+  contain the provided value. If it cannot be found, -1 is returned.
+  It is Ok to set val to NULL.
+ */
+/*--------------------------------------------------------------------------*/
+int iniparser_set(dictionary * ini, char * entry, char * val)
+{
+    return dictionary_set(ini, strlwc(entry), val) ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Delete an entry in a dictionary
+  @param    ini     Dictionary to modify
+  @param    entry   Entry to delete (entry name)
+  @return   void
+
+  If the given entry can be found, it is deleted from the dictionary.
+ */
+/*--------------------------------------------------------------------------*/
+void iniparser_unset(dictionary * ini, char * entry)
+{
+    dictionary_unset(ini, strlwc(entry));
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief	Load a single line from an INI file
+  @param    input_line  Input line, may be concatenated multi-line input
+  @param    section     Output space to store section
+  @param    key         Output space to store key
+  @param    value       Output space to store value
+  @return   line_status value
+ */
+/*--------------------------------------------------------------------------*/
+static line_status iniparser_line(
+    char * input_line,
+    char * section,
+    char * key,
+    char * value)
+{   
+    line_status sta ;
+    char        line[ASCIILINESZ+1];
+    int         len ;
+
+    strcpy(line, strstrip(input_line));
+    len = (int)strlen(line);
+
+    sta = LINE_UNPROCESSED ;
+    if (len<1) {
+        /* Empty line */
+        sta = LINE_EMPTY ;
+    } else if (line[0]=='#') {
+        /* Comment line */
+        sta = LINE_COMMENT ; 
+    } else if (line[0]=='[' && line[len-1]==']') {
+        /* Section name */
+        sscanf(line, "[%[^]]", section);
+        strcpy(section, strstrip(section));
+        strcpy(section, strlwc(section));
+        sta = LINE_SECTION ;
+    } else if (sscanf (line, "%[^=] = \"%[^\"]\"", key, value) == 2
+           ||  sscanf (line, "%[^=] = '%[^\']'",   key, value) == 2
+           ||  sscanf (line, "%[^=] = %[^;#]",     key, value) == 2) {
+        /* Usual key=value, with or without comments */
+        strcpy(key, strstrip(key));
+        strcpy(key, strlwc(key));
+        strcpy(value, strstrip(value));
+        /*
+         * sscanf cannot handle '' or "" as empty values
+         * this is done here
+         */
+        if (!strcmp(value, "\"\"") || (!strcmp(value, "''"))) {
+            value[0]=0 ;
+        }
+        sta = LINE_VALUE ;
+    } else if (sscanf(line, "%[^=] = %[;#]", key, value)==2
+           ||  sscanf(line, "%[^=] %[=]", key, value) == 2) {
+        /*
+         * Special cases:
+         * key=
+         * key=;
+         * key=#
+         */
+        strcpy(key, strstrip(key));
+        strcpy(key, strlwc(key));
+        value[0]=0 ;
+        sta = LINE_VALUE ;
+    } else {
+        /* Generate syntax error */
+        sta = LINE_ERROR ;
+    }
+    return sta ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Parse an ini file and return an allocated dictionary object
+  @param    ininame Name of the ini file to read.
+  @return   Pointer to newly allocated dictionary
+
+  This is the parser for ini files. This function is called, providing
+  the name of the file to be read. It returns a dictionary object that
+  should not be accessed directly, but through accessor functions
+  instead.
+
+  The returned dictionary must be freed using iniparser_freedict().
+ */
+/*--------------------------------------------------------------------------*/
+dictionary * iniparser_load(const char * ininame)
+{
+    FILE * in ;
+
+    char line    [ASCIILINESZ+1] ;
+    char section [ASCIILINESZ+1] ;
+    char key     [ASCIILINESZ+1] ;
+    char tmp     [ASCIILINESZ+1] ;
+    char val     [ASCIILINESZ+1] ;
+
+    int  last=0 ;
+    int  len ;
+    int  lineno=0 ;
+    int  errs=0;
+
+    dictionary * dict ;
+
+    if ((in=fopen(ininame, "r"))==NULL) {
+        fprintf(stderr, "iniparser: cannot open %s\n", ininame);
+        return NULL ;
+    }
+
+    dict = dictionary_new(0) ;
+    if (!dict) {
+        fclose(in);
+        return NULL ;
+    }
+
+    memset(line,    0, ASCIILINESZ);
+    memset(section, 0, ASCIILINESZ);
+    memset(key,     0, ASCIILINESZ);
+    memset(val,     0, ASCIILINESZ);
+    last=0 ;
+
+    while (fgets(line+last, ASCIILINESZ-last, in)!=NULL) {
+        lineno++ ;
+        len = (int)strlen(line)-1;
+        /* Safety check against buffer overflows */
+        if (line[len]!='\n') {
+            fprintf(stderr,
+                    "iniparser: input line too long in %s (%d)\n",
+                    ininame,
+                    lineno);
+            dictionary_del(dict);
+            fclose(in);
+            return NULL ;
+        }
+        /* Get rid of \n and spaces at end of line */
+        while ((len>=0) &&
+                ((line[len]=='\n') || (isspace(line[len])))) {
+            line[len]=0 ;
+            len-- ;
+        }
+        /* Detect multi-line */
+        if (line[len]=='\\') {
+            /* Multi-line value */
+            last=len ;
+            continue ;
+        } else {
+            last=0 ;
+        }
+        switch (iniparser_line(line, section, key, val)) {
+            case LINE_EMPTY:
+            case LINE_COMMENT:
+            break ;
+
+            case LINE_SECTION:
+            errs = dictionary_set(dict, section, NULL);
+            break ;
+
+            case LINE_VALUE:
+            sprintf(tmp, "%s:%s", section, key);
+            errs = dictionary_set(dict, tmp, val) ;
+            break ;
+
+            case LINE_ERROR:
+            fprintf(stderr, "iniparser: syntax error in %s (%d):\n",
+                    ininame,
+                    lineno);
+            fprintf(stderr, "-> %s\n", line);
+            errs++ ;
+            break;
+
+            default:
+            break ;
+        }
+        memset(line, 0, ASCIILINESZ);
+        last=0;
+        if (errs<0) {
+            fprintf(stderr, "iniparser: memory allocation failure\n");
+            break ;
+        }
+    }
+    if (errs) {
+        dictionary_del(dict);
+        dict = NULL ;
+    }
+    fclose(in);
+    return dict ;
+}
+
+/*-------------------------------------------------------------------------*/
+/**
+  @brief    Free all memory associated to an ini dictionary
+  @param    d Dictionary to free
+  @return   void
+
+  Free all memory associated to an ini dictionary.
+  It is mandatory to call this function before the dictionary object
+  gets out of the current context.
+ */
+/*--------------------------------------------------------------------------*/
+void iniparser_freedict(dictionary * d)
+{
+    dictionary_del(d);
+}
+
+/* vim: set ts=4 et sw=4 tw=75 */
diff --git a/ubi-utils/libscan.c b/ubi-utils/libscan.c
new file mode 100644
index 0000000..dc47a89
--- /dev/null
+++ b/ubi-utils/libscan.c
@@ -0,0 +1,225 @@
+/*
+ * Copyright (C) 2008 Nokia Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * Author: Artem Bityutskiy
+ *
+ * UBI scanning library.
+ */
+
+#define PROGRAM_NAME "libscan"
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <stdint.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <stdlib.h>
+
+#include <mtd_swab.h>
+#include <mtd/ubi-media.h>
+#include <mtd/mtd-user.h>
+#include <libmtd.h>
+#include <libscan.h>
+#include <crc32.h>
+#include "common.h"
+
+static int all_ff(const void *buf, int len)
+{
+	int i;
+	const uint8_t *p = buf;
+
+	for (i = 0; i < len; i++)
+		if (p[i] != 0xFF)
+			return 0;
+	return 1;
+}
+
+int ubi_scan(struct mtd_dev_info *mtd, int fd, struct ubi_scan_info **info,
+	     int verbose)
+{
+	int eb, v = (verbose == 2), pr = (verbose == 1);
+	struct ubi_scan_info *si;
+	unsigned long long sum = 0;
+
+	si = calloc(1, sizeof(struct ubi_scan_info));
+	if (!si)
+		return sys_errmsg("cannot allocate %zd bytes of memory",
+				  sizeof(struct ubi_scan_info));
+
+	si->ec = calloc(mtd->eb_cnt, sizeof(uint32_t));
+	if (!si->ec) {
+		sys_errmsg("cannot allocate %zd bytes of memory",
+			   sizeof(struct ubi_scan_info));
+		goto out_si;
+	}
+
+	si->vid_hdr_offs = si->data_offs = -1;
+
+	verbose(v, "start scanning eraseblocks 0-%d", mtd->eb_cnt);
+	for (eb = 0; eb < mtd->eb_cnt; eb++) {
+		int ret;
+		uint32_t crc;
+		struct ubi_ec_hdr ech;
+		unsigned long long ec;
+
+		if (v) {
+			normsg_cont("scanning eraseblock %d", eb);
+			fflush(stdout);
+		}
+		if (pr) {
+			printf("\r" PROGRAM_NAME ": scanning eraseblock %d -- %2lld %% complete  ",
+			       eb, (long long)(eb + 1) * 100 / mtd->eb_cnt);
+			fflush(stdout);
+		}
+
+		ret = mtd_is_bad(mtd, fd, eb);
+		if (ret == -1)
+			goto out_ec;
+		if (ret) {
+			si->bad_cnt += 1;
+			si->ec[eb] = EB_BAD;
+			if (v)
+				printf(": bad\n");
+			continue;
+		}
+
+		ret = mtd_read(mtd, fd, eb, 0, &ech, sizeof(struct ubi_ec_hdr));
+		if (ret < 0)
+			goto out_ec;
+
+		if (be32_to_cpu(ech.magic) != UBI_EC_HDR_MAGIC) {
+			if (all_ff(&ech, sizeof(struct ubi_ec_hdr))) {
+				si->empty_cnt += 1;
+				si->ec[eb] = EB_EMPTY;
+				if (v)
+					printf(": empty\n");
+			} else {
+				si->alien_cnt += 1;
+				si->ec[eb] = EB_ALIEN;
+				if (v)
+					printf(": alien\n");
+			}
+			continue;
+		}
+
+		crc = mtd_crc32(UBI_CRC32_INIT, &ech, UBI_EC_HDR_SIZE_CRC);
+		if (be32_to_cpu(ech.hdr_crc) != crc) {
+			si->corrupted_cnt += 1;
+			si->ec[eb] = EB_CORRUPTED;
+			if (v)
+				printf(": bad CRC %#08x, should be %#08x\n",
+				       crc, be32_to_cpu(ech.hdr_crc));
+			continue;
+		}
+
+		ec = be64_to_cpu(ech.ec);
+		if (ec > EC_MAX) {
+			if (pr)
+				printf("\n");
+			errmsg("erase counter in EB %d is %llu, while this "
+			       "program expects them to be less than %u",
+			       eb, ec, EC_MAX);
+			goto out_ec;
+		}
+
+		if (si->vid_hdr_offs == -1) {
+			si->vid_hdr_offs = be32_to_cpu(ech.vid_hdr_offset);
+			si->data_offs = be32_to_cpu(ech.data_offset);
+			if (si->data_offs % mtd->min_io_size) {
+				if (pr)
+					printf("\n");
+				if (v)
+					printf(": corrupted because of the below\n");
+				warnmsg("bad data offset %d at eraseblock %d (n"
+					"of multiple of min. I/O unit size %d)",
+					si->data_offs, eb, mtd->min_io_size);
+				warnmsg("treat eraseblock %d as corrupted", eb);
+				si->corrupted_cnt += 1;
+				si->ec[eb] = EB_CORRUPTED;
+				continue;
+
+			}
+		} else {
+			if ((int)be32_to_cpu(ech.vid_hdr_offset) != si->vid_hdr_offs) {
+				if (pr)
+					printf("\n");
+				if (v)
+					printf(": corrupted because of the below\n");
+				warnmsg("inconsistent VID header offset: was "
+					"%d, but is %d in eraseblock %d",
+					si->vid_hdr_offs,
+					be32_to_cpu(ech.vid_hdr_offset), eb);
+				warnmsg("treat eraseblock %d as corrupted", eb);
+				si->corrupted_cnt += 1;
+				si->ec[eb] = EB_CORRUPTED;
+				continue;
+			}
+			if ((int)be32_to_cpu(ech.data_offset) != si->data_offs) {
+				if (pr)
+					printf("\n");
+				if (v)
+					printf(": corrupted because of the below\n");
+				warnmsg("inconsistent data offset: was %d, but"
+					" is %d in eraseblock %d",
+					si->data_offs,
+					be32_to_cpu(ech.data_offset), eb);
+				warnmsg("treat eraseblock %d as corrupted", eb);
+				si->corrupted_cnt += 1;
+				si->ec[eb] = EB_CORRUPTED;
+				continue;
+			}
+		}
+
+		si->ok_cnt += 1;
+		si->ec[eb] = ec;
+		if (v)
+			printf(": OK, erase counter %u\n", si->ec[eb]);
+	}
+
+	if (si->ok_cnt != 0) {
+		/* Calculate mean erase counter */
+		for (eb = 0; eb < mtd->eb_cnt; eb++) {
+			if (si->ec[eb] > EC_MAX)
+				continue;
+			sum += si->ec[eb];
+		}
+		si->mean_ec = sum / si->ok_cnt;
+	}
+
+	si->good_cnt = mtd->eb_cnt - si->bad_cnt;
+	verbose(v, "finished, mean EC %lld, %d OK, %d corrupted, %d empty, %d "
+		"alien, bad %d", si->mean_ec, si->ok_cnt, si->corrupted_cnt,
+		si->empty_cnt, si->alien_cnt, si->bad_cnt);
+
+	*info = si;
+	if (pr)
+		printf("\n");
+	return 0;
+
+out_ec:
+	free(si->ec);
+out_si:
+	free(si);
+	*info = NULL;
+	return -1;
+}
+
+void ubi_scan_free(struct ubi_scan_info *si)
+{
+	free(si->ec);
+	free(si);
+}
diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
new file mode 100644
index 0000000..4d5f316
--- /dev/null
+++ b/ubi-utils/libubi.c
@@ -0,0 +1,1372 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * Author: Artem Bityutskiy
+ *
+ * UBI (Unsorted Block Images) library.
+ */
+
+#define PROGRAM_NAME "libubi"
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <fcntl.h>
+#include <dirent.h>
+#include <unistd.h>
+#include <limits.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <libubi.h>
+#include "libubi_int.h"
+#include "common.h"
+
+/**
+ * mkpath - compose full path from 2 given components.
+ * @path: the first component
+ * @name: the second component
+ *
+ * This function returns the resulting path in case of success and %NULL in
+ * case of failure.
+ */
+static char *mkpath(const char *path, const char *name)
+{
+	char *n;
+	int len1 = strlen(path);
+	int len2 = strlen(name);
+
+	n = malloc(len1 + len2 + 2);
+	if (!n) {
+		sys_errmsg("cannot allocate %d bytes", len1 + len2 + 2);
+		return NULL;
+	}
+
+	memcpy(n, path, len1);
+	if (n[len1 - 1] != '/')
+		n[len1++] = '/';
+
+	memcpy(n + len1, name, len2 + 1);
+	return n;
+}
+
+/**
+ * read_positive_ll - read a positive 'long long' value from a file.
+ * @file: the file to read from
+ * @value: the result is stored here
+ *
+ * This function reads file @file and interprets its contents as a positive
+ * 'long long' integer. If this is not true, it fails with %EINVAL error code.
+ * Returns %0 in case of success and %-1 in case of failure.
+ */
+static int read_positive_ll(const char *file, long long *value)
+{
+	int fd, rd;
+	char buf[50];
+
+	fd = open(file, O_RDONLY);
+	if (fd == -1)
+		return -1;
+
+	rd = read(fd, buf, sizeof(buf));
+	if (rd == -1) {
+		sys_errmsg("cannot read \"%s\"", file);
+		goto out_error;
+	}
+	if (rd == sizeof(buf)) {
+		errmsg("contents of \"%s\" is too long", file);
+		errno = EINVAL;
+		goto out_error;
+	}
+	buf[rd] = '\0';
+
+	if (sscanf(buf, "%lld\n", value) != 1) {
+		errmsg("cannot read integer from \"%s\"\n", file);
+		errno = EINVAL;
+		goto out_error;
+	}
+
+	if (*value < 0) {
+		errmsg("negative value %lld in \"%s\"", *value, file);
+		errno = EINVAL;
+		goto out_error;
+	}
+
+	if (close(fd))
+		return sys_errmsg("close failed on \"%s\"", file);
+
+	return 0;
+
+out_error:
+	close(fd);
+	return -1;
+}
+
+/**
+ * read_positive_int - read a positive 'int' value from a file.
+ * @file: the file to read from
+ * @value: the result is stored here
+ *
+ * This function is the same as 'read_positive_ll()', but it reads an 'int'
+ * value, not 'long long'.
+ */
+static int read_positive_int(const char *file, int *value)
+{
+	long long res;
+
+	if (read_positive_ll(file, &res))
+		return -1;
+
+	/* Make sure the value is not too big */
+	if (res > INT_MAX) {
+		errmsg("value %lld read from file \"%s\" is out of range",
+		       res, file);
+		errno = EINVAL;
+		return -1;
+	}
+
+	*value = res;
+	return 0;
+}
+
+/**
+ * read_data - read data from a file.
+ * @file: the file to read from
+ * @buf: the buffer to read to
+ * @buf_len: buffer length
+ *
+ * This function returns number of read bytes in case of success and %-1 in
+ * case of failure. Note, if the file contains more then @buf_len bytes of
+ * date, this function fails with %EINVAL error code.
+ */
+static int read_data(const char *file, void *buf, int buf_len)
+{
+	int fd, rd, tmp, tmp1;
+
+	fd = open(file, O_RDONLY);
+	if (fd == -1)
+		return -1;
+
+	rd = read(fd, buf, buf_len);
+	if (rd == -1) {
+		sys_errmsg("cannot read \"%s\"", file);
+		goto out_error;
+	}
+
+	if (rd == buf_len) {
+		errmsg("contents of \"%s\" is too long", file);
+		errno = EINVAL;
+		goto out_error;
+	}
+
+	((char *)buf)[rd] = '\0';
+
+	/* Make sure all data is read */
+	tmp1 = read(fd, &tmp, 1);
+	if (tmp1 == 1) {
+		sys_errmsg("cannot read \"%s\"", file);
+		goto out_error;
+	}
+	if (tmp1) {
+		errmsg("file \"%s\" contains too much data (> %d bytes)",
+		       file, buf_len);
+		errno = EINVAL;
+		goto out_error;
+	}
+
+	if (close(fd)) {
+		sys_errmsg("close failed on \"%s\"", file);
+		return -1;
+	}
+
+	return rd;
+
+out_error:
+	close(fd);
+	return -1;
+}
+
+/**
+ * read_major - read major and minor numbers from a file.
+ * @file: name of the file to read from
+ * @major: major number is returned here
+ * @minor: minor number is returned here
+ *
+ * This function returns % in case of succes, and %-1 in case of failure.
+ */
+static int read_major(const char *file, int *major, int *minor)
+{
+	int ret;
+	char buf[50];
+
+	ret = read_data(file, buf, 50);
+	if (ret < 0)
+		return ret;
+
+	ret = sscanf(buf, "%d:%d\n", major, minor);
+	if (ret != 2) {
+		errno = EINVAL;
+		return errmsg("\"%s\" does not have major:minor format", file);
+	}
+
+	if (*major < 0 || *minor < 0) {
+		errno = EINVAL;
+		return errmsg("bad major:minor %d:%d in \"%s\"",
+			      *major, *minor, file);
+	}
+
+	return 0;
+}
+
+/**
+ * dev_read_int - read a positive 'int' value from an UBI device sysfs file.
+ * @patt: file pattern to read from
+ * @dev_num: UBI device number
+ * @value: the result is stored here
+ *
+ * This function returns %0 in case of success and %-1 in case of failure.
+ */
+static int dev_read_int(const char *patt, int dev_num, int *value)
+{
+	char file[strlen(patt) + 50];
+
+	sprintf(file, patt, dev_num);
+	return read_positive_int(file, value);
+}
+
+/**
+ * vol_read_int - read a positive 'int' value from an UBI volume sysfs file.
+ * @patt: file pattern to read from
+ * @dev_num: UBI device number
+ * @vol_id: volume ID
+ * @value: the result is stored here
+ *
+ * This function returns %0 in case of success and %-1 in case of failure.
+ */
+static int vol_read_int(const char *patt, int dev_num, int vol_id, int *value)
+{
+	char file[strlen(patt) + 100];
+
+	sprintf(file, patt, dev_num, vol_id);
+	return read_positive_int(file, value);
+}
+
+/**
+ * dev_read_ll - read a positive 'long long' value from an UBI device sysfs file.
+ * @patt: file pattern to read from
+ * @dev_num: UBI device number
+ * @value: the result is stored here
+ *
+ * This function returns %0 in case of success and %-1 in case of failure.
+ */
+static int dev_read_ll(const char *patt, int dev_num, long long *value)
+{
+	char file[strlen(patt) + 50];
+
+	sprintf(file, patt, dev_num);
+	return read_positive_ll(file, value);
+}
+
+/**
+ * vol_read_ll - read a positive 'long long' value from an UBI volume sysfs file.
+ * @patt: file pattern to read from
+ * @dev_num: UBI device number
+ * @vol_id: volume ID
+ * @value: the result is stored here
+ *
+ * This function returns %0 in case of success and %-1 in case of failure.
+ */
+static int vol_read_ll(const char *patt, int dev_num, int vol_id,
+		       long long *value)
+{
+	char file[strlen(patt) + 100];
+
+	sprintf(file, patt, dev_num, vol_id);
+	return read_positive_ll(file, value);
+}
+
+/**
+ * vol_read_data - read data from an UBI volume's sysfs file.
+ * @patt: file pattern to read from
+ * @dev_num: UBI device number
+ * @vol_id: volume ID
+ * @buf: buffer to read to
+ * @buf_len: buffer length
+ *
+ * This function returns number of read bytes in case of success and %-1 in
+ * case of failure.
+ */
+static int vol_read_data(const char *patt, int dev_num, int vol_id, void *buf,
+			 int buf_len)
+{
+	char file[strlen(patt) + 100];
+
+	sprintf(file, patt, dev_num, vol_id);
+	return read_data(file, buf, buf_len);
+}
+
+/**
+ * dev_get_major - get major and minor numbers of an UBI device.
+ * @lib: libubi descriptor
+ * @dev_num: UBI device number
+ * @major: major number is returned here
+ * @minor: minor number is returned here
+ *
+ * This function returns zero in case of succes and %-1 in case of failure.
+ */
+static int dev_get_major(struct libubi *lib, int dev_num, int *major, int *minor)
+{
+	char file[strlen(lib->dev_dev) + 50];
+
+	sprintf(file, lib->dev_dev, dev_num);
+	return read_major(file, major, minor);
+}
+
+/**
+ * vol_get_major - get major and minor numbers of an UBI volume.
+ * @lib: libubi descriptor
+ * @dev_num: UBI device number
+ * @vol_id: volume ID
+ * @major: major number is returned here
+ * @minor: minor number is returned here
+ *
+ * This function returns zero in case of succes and %-1 in case of failure.
+ */
+static int vol_get_major(struct libubi *lib, int dev_num, int vol_id,
+			 int *major, int *minor)
+{
+	char file[strlen(lib->vol_dev) + 100];
+
+	sprintf(file, lib->vol_dev, dev_num, vol_id);
+	return read_major(file, major, minor);
+}
+
+/**
+ * vol_node2nums - find UBI device number and volume ID by volume device node
+ *                 file.
+ * @lib: UBI library descriptor
+ * @node: UBI character device node name
+ * @dev_num: UBI device number is returned here
+ * @vol_id: volume ID is returned hers
+ *
+ * This function returns zero in case of succes and %-1 in case of failure.
+ */
+static int vol_node2nums(struct libubi *lib, const char *node, int *dev_num,
+			 int *vol_id)
+{
+	struct stat st;
+	struct ubi_info info;
+	int i, fd, major, minor;
+	char file[strlen(lib->ubi_vol) + 100];
+
+	if (stat(node, &st))
+		return sys_errmsg("cannot get information about \"%s\"",
+				  node);
+
+	if (!S_ISCHR(st.st_mode)) {
+		errno = EINVAL;
+		return errmsg("\"%s\" is not a character device", node);
+	}
+
+	major = major(st.st_rdev);
+	minor = minor(st.st_rdev);
+
+	if (minor == 0) {
+		errno = EINVAL;
+		return errmsg("\"%s\" is not a volume character device", node);
+	}
+
+	if (ubi_get_info((libubi_t *)lib, &info))
+		return -1;
+
+	for (i = info.lowest_dev_num; i <= info.highest_dev_num; i++) {
+		int major1, minor1, ret;
+
+		ret = dev_get_major(lib, i, &major1, &minor1);
+		if (ret) {
+			if (errno == ENOENT)
+				continue;
+			return -1;
+		}
+
+		if (major1 == major)
+			break;
+	}
+
+	if (i > info.highest_dev_num) {
+		errno = ENODEV;
+		return -1;
+	}
+
+	/* Make sure this UBI volume exists */
+	sprintf(file, lib->ubi_vol, i, minor - 1);
+	fd = open(file, O_RDONLY);
+	if (fd == -1) {
+		errno = ENODEV;
+		return -1;
+	}
+
+	*dev_num = i;
+	*vol_id = minor - 1;
+	errno = 0;
+	return 0;
+}
+
+/**
+ * dev_node2num - find UBI device number by its character device node.
+ * @lib: UBI library descriptor
+ * @node: UBI character device node name
+ * @dev_num: UBI device number is returned here
+ *
+ * This function returns %0 in case of success and %-1 in case of failure.
+ */
+static int dev_node2num(struct libubi *lib, const char *node, int *dev_num)
+{
+	struct stat st;
+	struct ubi_info info;
+	int i, major, minor;
+
+	if (stat(node, &st))
+		return sys_errmsg("cannot get information about \"%s\"", node);
+
+	if (!S_ISCHR(st.st_mode)) {
+		errno = EINVAL;
+		return errmsg("\"%s\" is not a character device", node);
+	}
+
+	major = major(st.st_rdev);
+	minor = minor(st.st_rdev);
+
+	if (minor != 0) {
+		errno = EINVAL;
+		return errmsg("\"%s\" is not an UBI character device", node);
+	}
+
+	if (ubi_get_info((libubi_t *)lib, &info))
+		return -1;
+
+	for (i = info.lowest_dev_num; i <= info.highest_dev_num; i++) {
+		int major1, minor1, ret;
+
+		ret = dev_get_major(lib, i, &major1, &minor1);
+		if (ret) {
+			if (errno == ENOENT)
+				continue;
+			return -1;
+		}
+
+		if (major1 == major) {
+			if (minor1 != 0) {
+				errmsg("UBI character device minor number is "
+				       "%d, but must be 0", minor1);
+				errno = EINVAL;
+				return -1;
+			}
+			errno = 0;
+			*dev_num = i;
+			return 0;
+		}
+	}
+
+	errno = ENODEV;
+	return -1;
+}
+
+int mtd_num2ubi_dev(libubi_t desc, int mtd_num, int *dev_num)
+{
+	struct ubi_info info;
+	int i, ret, mtd_num1;
+	struct libubi *lib = desc;
+
+	if (ubi_get_info(desc, &info))
+		return -1;
+
+	for (i = info.lowest_dev_num; i <= info.highest_dev_num; i++) {
+		ret = dev_read_int(lib->dev_mtd_num, i, &mtd_num1);
+		if (ret) {
+			if (errno == ENOENT)
+				continue;
+			return -1;
+		}
+
+		if (mtd_num1 == mtd_num) {
+			errno = 0;
+			*dev_num = i;
+			return 0;
+		}
+	}
+
+	errno = 0;
+	return -1;
+}
+
+libubi_t libubi_open(void)
+{
+	int fd, version;
+	struct libubi *lib;
+
+	lib = calloc(1, sizeof(struct libubi));
+	if (!lib)
+		return NULL;
+
+	lib->sysfs_ctrl = mkpath("/sys", SYSFS_CTRL);
+	if (!lib->sysfs_ctrl)
+		goto out_error;
+
+	lib->ctrl_dev = mkpath(lib->sysfs_ctrl, CTRL_DEV);
+	if (!lib->ctrl_dev)
+		goto out_error;
+
+	lib->sysfs_ubi = mkpath("/sys", SYSFS_UBI);
+	if (!lib->sysfs_ubi)
+		goto out_error;
+
+	/* Make sure UBI is present */
+	fd = open(lib->sysfs_ubi, O_RDONLY);
+	if (fd == -1) {
+		errno = 0;
+		goto out_error;
+	}
+
+	if (close(fd)) {
+		sys_errmsg("close failed on \"%s\"", lib->sysfs_ubi);
+		goto out_error;
+	}
+
+	lib->ubi_dev = mkpath(lib->sysfs_ubi, UBI_DEV_NAME_PATT);
+	if (!lib->ubi_dev)
+		goto out_error;
+
+	lib->ubi_version = mkpath(lib->sysfs_ubi, UBI_VER);
+	if (!lib->ubi_version)
+		goto out_error;
+
+	lib->dev_dev = mkpath(lib->ubi_dev, DEV_DEV);
+	if (!lib->dev_dev)
+		goto out_error;
+
+	lib->dev_avail_ebs = mkpath(lib->ubi_dev, DEV_AVAIL_EBS);
+	if (!lib->dev_avail_ebs)
+		goto out_error;
+
+	lib->dev_total_ebs = mkpath(lib->ubi_dev, DEV_TOTAL_EBS);
+	if (!lib->dev_total_ebs)
+		goto out_error;
+
+	lib->dev_bad_count = mkpath(lib->ubi_dev, DEV_BAD_COUNT);
+	if (!lib->dev_bad_count)
+		goto out_error;
+
+	lib->dev_eb_size = mkpath(lib->ubi_dev, DEV_EB_SIZE);
+	if (!lib->dev_eb_size)
+		goto out_error;
+
+	lib->dev_max_ec = mkpath(lib->ubi_dev, DEV_MAX_EC);
+	if (!lib->dev_max_ec)
+		goto out_error;
+
+	lib->dev_bad_rsvd = mkpath(lib->ubi_dev, DEV_MAX_RSVD);
+	if (!lib->dev_bad_rsvd)
+		goto out_error;
+
+	lib->dev_max_vols = mkpath(lib->ubi_dev, DEV_MAX_VOLS);
+	if (!lib->dev_max_vols)
+		goto out_error;
+
+	lib->dev_min_io_size = mkpath(lib->ubi_dev, DEV_MIN_IO_SIZE);
+	if (!lib->dev_min_io_size)
+		goto out_error;
+
+	lib->dev_mtd_num = mkpath(lib->ubi_dev, DEV_MTD_NUM);
+	if (!lib->dev_mtd_num)
+		goto out_error;
+
+	lib->ubi_vol = mkpath(lib->sysfs_ubi, UBI_VOL_NAME_PATT);
+	if (!lib->ubi_vol)
+		goto out_error;
+
+	lib->vol_type = mkpath(lib->ubi_vol, VOL_TYPE);
+	if (!lib->vol_type)
+		goto out_error;
+
+	lib->vol_dev = mkpath(lib->ubi_vol, VOL_DEV);
+	if (!lib->vol_dev)
+		goto out_error;
+
+	lib->vol_alignment = mkpath(lib->ubi_vol, VOL_ALIGNMENT);
+	if (!lib->vol_alignment)
+		goto out_error;
+
+	lib->vol_data_bytes = mkpath(lib->ubi_vol, VOL_DATA_BYTES);
+	if (!lib->vol_data_bytes)
+		goto out_error;
+
+	lib->vol_rsvd_ebs = mkpath(lib->ubi_vol, VOL_RSVD_EBS);
+	if (!lib->vol_rsvd_ebs)
+		goto out_error;
+
+	lib->vol_eb_size = mkpath(lib->ubi_vol, VOL_EB_SIZE);
+	if (!lib->vol_eb_size)
+		goto out_error;
+
+	lib->vol_corrupted = mkpath(lib->ubi_vol, VOL_CORRUPTED);
+	if (!lib->vol_corrupted)
+		goto out_error;
+
+	lib->vol_name = mkpath(lib->ubi_vol, VOL_NAME);
+	if (!lib->vol_name)
+		goto out_error;
+
+	if (read_positive_int(lib->ubi_version, &version))
+		goto out_error;
+	if (version != LIBUBI_UBI_VERSION) {
+		errmsg("this library was made for UBI version %d, but UBI "
+		       "version %d is detected\n", LIBUBI_UBI_VERSION, version);
+		goto out_error;
+	}
+
+	return lib;
+
+out_error:
+	libubi_close((libubi_t)lib);
+	return NULL;
+}
+
+void libubi_close(libubi_t desc)
+{
+	struct libubi *lib = (struct libubi *)desc;
+
+	free(lib->vol_name);
+	free(lib->vol_corrupted);
+	free(lib->vol_eb_size);
+	free(lib->vol_rsvd_ebs);
+	free(lib->vol_data_bytes);
+	free(lib->vol_alignment);
+	free(lib->vol_dev);
+	free(lib->vol_type);
+	free(lib->ubi_vol);
+	free(lib->dev_mtd_num);
+	free(lib->dev_min_io_size);
+	free(lib->dev_max_vols);
+	free(lib->dev_bad_rsvd);
+	free(lib->dev_max_ec);
+	free(lib->dev_eb_size);
+	free(lib->dev_bad_count);
+	free(lib->dev_total_ebs);
+	free(lib->dev_avail_ebs);
+	free(lib->dev_dev);
+	free(lib->ubi_version);
+	free(lib->ubi_dev);
+	free(lib->sysfs_ubi);
+	free(lib->ctrl_dev);
+	free(lib->sysfs_ctrl);
+	free(lib);
+}
+
+/**
+ * do_attach - perform the actual attach operation.
+ * @node: name of the UBI control character device node
+ * @r: attach request
+ *
+ * This function performs the actual UBI attach operation. Returns %0 in case of
+ * success and %-1 in case of failure. @r->ubi_num contains newly created UBI
+ * device number.
+ */
+static int do_attach(const char *node, const struct ubi_attach_req *r)
+{
+	int fd, ret;
+
+	fd = open(node, O_RDONLY);
+	if (fd == -1)
+		return sys_errmsg("cannot open \"%s\"", node);
+
+	ret = ioctl(fd, UBI_IOCATT, r);
+	close(fd);
+	if (ret == -1)
+		return -1;
+
+#ifdef UDEV_SETTLE_HACK
+//	if (system("udevsettle") == -1)
+//		return -1;
+	usleep(100000);
+#endif
+	return ret;
+}
+
+int ubi_attach_mtd(libubi_t desc, const char *node,
+		   struct ubi_attach_request *req)
+{
+	struct ubi_attach_req r;
+	int ret;
+
+	(void)desc;
+
+	memset(&r, 0, sizeof(struct ubi_attach_req));
+	r.ubi_num = req->dev_num;
+	r.mtd_num = req->mtd_num;
+	r.vid_hdr_offset = req->vid_hdr_offset;
+
+	ret = do_attach(node, &r);
+	if (ret == 0)
+		req->dev_num = r.ubi_num;
+
+	return ret;
+}
+
+#ifndef MTD_CHAR_MAJOR
+/*
+ * This is taken from kernel <linux/mtd/mtd.h> and is unlikely to change anytime
+ * soon.
+ */
+#define MTD_CHAR_MAJOR 90
+#endif
+
+/**
+ * mtd_node_to_num - converts device node to MTD number.
+ * @mtd_dev_node: path to device node to convert
+ *
+ * This function converts given @mtd_dev_node to MTD device number.
+ * @mtd_dev_node should contain path to the MTD device node. Returns MTD device
+ * number in case of success and %-1 in case of failure (errno is set).
+ */
+static int mtd_node_to_num(const char *mtd_dev_node)
+{
+	int major, minor;
+	struct stat sb;
+
+	if (stat(mtd_dev_node, &sb) < 0)
+		return sys_errmsg("cannot stat \"%s\"", mtd_dev_node);
+
+	if (!S_ISCHR(sb.st_mode)) {
+		errno = EINVAL;
+		return sys_errmsg("\"%s\" is not a character device",
+				  mtd_dev_node);
+	}
+
+	major = major(sb.st_rdev);
+	minor = minor(sb.st_rdev);
+
+	if (major != MTD_CHAR_MAJOR) {
+		errno = EINVAL;
+		return sys_errmsg("\"%s\" is not an MTD device", mtd_dev_node);
+	}
+
+	return minor / 2;
+}
+
+int ubi_attach(libubi_t desc, const char *node, struct ubi_attach_request *req)
+{
+	struct ubi_attach_req r;
+	int ret;
+
+	if (!req->mtd_dev_node)
+		/* Fallback to opening by mtd_num */
+		return ubi_attach_mtd(desc, node, req);
+
+	memset(&r, 0, sizeof(struct ubi_attach_req));
+	r.ubi_num = req->dev_num;
+	r.vid_hdr_offset = req->vid_hdr_offset;
+
+	/*
+	 * User has passed path to device node. Lets find out MTD device number
+	 * of the device and pass it to the kernel.
+	 */
+	r.mtd_num = mtd_node_to_num(req->mtd_dev_node);
+	if (r.mtd_num == -1)
+		return -1;
+
+	ret = do_attach(node, &r);
+	if (ret == 0)
+		req->dev_num = r.ubi_num;
+
+	return ret;
+}
+
+int ubi_detach_mtd(libubi_t desc, const char *node, int mtd_num)
+{
+	int ret, ubi_dev;
+
+	ret = mtd_num2ubi_dev(desc, mtd_num, &ubi_dev);
+	if (ret == -1) {
+		errno = ENODEV;
+		return ret;
+	}
+
+	return ubi_remove_dev(desc, node, ubi_dev);
+}
+
+int ubi_detach(libubi_t desc, const char *node, const char *mtd_dev_node)
+{
+	int mtd_num;
+
+	if (!mtd_dev_node) {
+		errno = EINVAL;
+		return -1;
+	}
+
+	mtd_num = mtd_node_to_num(mtd_dev_node);
+	if (mtd_num == -1)
+		return -1;
+
+	return ubi_detach_mtd(desc, node, mtd_num);
+}
+
+int ubi_remove_dev(libubi_t desc, const char *node, int ubi_dev)
+{
+	int fd, ret;
+
+	desc = desc;
+
+	fd = open(node, O_RDONLY);
+	if (fd == -1)
+		return sys_errmsg("cannot open \"%s\"", node);
+	ret = ioctl(fd, UBI_IOCDET, &ubi_dev);
+	if (ret == -1)
+		goto out_close;
+
+#ifdef UDEV_SETTLE_HACK
+//	if (system("udevsettle") == -1)
+//		return -1;
+	usleep(100000);
+#endif
+
+out_close:
+	close(fd);
+	return ret;
+}
+
+int ubi_probe_node(libubi_t desc, const char *node)
+{
+	struct stat st;
+	struct ubi_info info;
+	int i, fd, major, minor;
+	struct libubi *lib = (struct libubi *)desc;
+	char file[strlen(lib->ubi_vol) + 100];
+
+	if (stat(node, &st))
+		return sys_errmsg("cannot get information about \"%s\"", node);
+
+	if (!S_ISCHR(st.st_mode)) {
+		errmsg("\"%s\" is not a character device", node);
+		errno = EINVAL;
+		return -1;
+	}
+
+	major = major(st.st_rdev);
+	minor = minor(st.st_rdev);
+
+	if (ubi_get_info((libubi_t *)lib, &info))
+		return -1;
+
+	for (i = info.lowest_dev_num; i <= info.highest_dev_num; i++) {
+		int major1, minor1, ret;
+
+		ret = dev_get_major(lib, i, &major1, &minor1);
+		if (ret) {
+			if (errno == ENOENT)
+				continue;
+			if (!errno)
+				goto out_not_ubi;
+			return -1;
+		}
+
+		if (major1 == major)
+			break;
+	}
+
+	if (i > info.highest_dev_num)
+		goto out_not_ubi;
+
+	if (minor == 0)
+		return 1;
+
+	/* This is supposdely an UBI volume device node */
+	sprintf(file, lib->ubi_vol, i, minor - 1);
+	fd = open(file, O_RDONLY);
+	if (fd == -1)
+		goto out_not_ubi;
+
+	return 2;
+
+out_not_ubi:
+	errmsg("\"%s\" has major:minor %d:%d, but this does not correspond to "
+	       "any existing UBI device or volume", node, major, minor);
+	errno = ENODEV;
+	return -1;
+}
+
+int ubi_get_info(libubi_t desc, struct ubi_info *info)
+{
+	DIR *sysfs_ubi;
+	struct dirent *dirent;
+	struct libubi *lib = (struct libubi *)desc;
+
+	memset(info, 0, sizeof(struct ubi_info));
+
+	if (read_major(lib->ctrl_dev, &info->ctrl_major, &info->ctrl_minor)) {
+		/*
+		 * Older UBI versions did not have control device, so we do not
+		 * panic here for compatibility reasons. May be few years later
+		 * we could return -1 here, but for now just set major:minor to
+		 * -1.
+		 */
+		info->ctrl_major = info->ctrl_minor = -1;
+	}
+
+	/*
+	 * We have to scan the UBI sysfs directory to identify how many UBI
+	 * devices are present.
+	 */
+	sysfs_ubi = opendir(lib->sysfs_ubi);
+	if (!sysfs_ubi)
+		return -1;
+
+	info->lowest_dev_num = INT_MAX;
+	while (1) {
+		int dev_num, ret;
+		char tmp_buf[256];
+
+		errno = 0;
+		dirent = readdir(sysfs_ubi);
+		if (!dirent)
+			break;
+
+		if (strlen(dirent->d_name) >= 255) {
+			errmsg("invalid entry in %s: \"%s\"",
+			       lib->sysfs_ubi, dirent->d_name);
+			errno = EINVAL;
+			goto out_close;
+		}
+
+		ret = sscanf(dirent->d_name, UBI_DEV_NAME_PATT"%s",
+			     &dev_num, tmp_buf);
+		if (ret == 1) {
+			info->dev_count += 1;
+			if (dev_num > info->highest_dev_num)
+				info->highest_dev_num = dev_num;
+			if (dev_num < info->lowest_dev_num)
+				info->lowest_dev_num = dev_num;
+		}
+	}
+
+	if (!dirent && errno) {
+		sys_errmsg("readdir failed on \"%s\"", lib->sysfs_ubi);
+		goto out_close;
+	}
+
+	if (closedir(sysfs_ubi))
+		return sys_errmsg("closedir failed on \"%s\"", lib->sysfs_ubi);
+
+	if (info->lowest_dev_num == INT_MAX)
+		info->lowest_dev_num = 0;
+
+	if (read_positive_int(lib->ubi_version, &info->version))
+		return -1;
+
+	return 0;
+
+out_close:
+	closedir(sysfs_ubi);
+	return -1;
+}
+
+int ubi_mkvol(libubi_t desc, const char *node, struct ubi_mkvol_request *req)
+{
+	int fd, ret;
+	struct ubi_mkvol_req r;
+	size_t n;
+
+	memset(&r, 0, sizeof(struct ubi_mkvol_req));
+
+	desc = desc;
+	r.vol_id = req->vol_id;
+	r.alignment = req->alignment;
+	r.bytes = req->bytes;
+	r.vol_type = req->vol_type;
+
+	n = strlen(req->name);
+	if (n > UBI_MAX_VOLUME_NAME)
+		return -1;
+
+	strncpy(r.name, req->name, UBI_MAX_VOLUME_NAME + 1);
+	r.name_len = n;
+
+	desc = desc;
+	fd = open(node, O_RDONLY);
+	if (fd == -1)
+		return sys_errmsg("cannot open \"%s\"", node);
+
+	ret = ioctl(fd, UBI_IOCMKVOL, &r);
+	if (ret == -1) {
+		close(fd);
+		return ret;
+	}
+
+	close(fd);
+	req->vol_id = r.vol_id;
+
+#ifdef UDEV_SETTLE_HACK
+//	if (system("udevsettle") == -1)
+//		return -1;
+	usleep(100000);
+#endif
+
+	return 0;
+}
+
+int ubi_rmvol(libubi_t desc, const char *node, int vol_id)
+{
+	int fd, ret;
+
+	desc = desc;
+	fd = open(node, O_RDONLY);
+	if (fd == -1)
+		return sys_errmsg("cannot open \"%s\"", node);
+
+	ret = ioctl(fd, UBI_IOCRMVOL, &vol_id);
+	if (ret == -1) {
+		close(fd);
+		return ret;
+	}
+
+	close(fd);
+
+#ifdef UDEV_SETTLE_HACK
+//	if (system("udevsettle") == -1)
+//		return -1;
+	usleep(100000);
+#endif
+
+	return 0;
+}
+
+int ubi_rnvols(libubi_t desc, const char *node, struct ubi_rnvol_req *rnvol)
+{
+	int fd, ret;
+
+	desc = desc;
+	fd = open(node, O_RDONLY);
+	if (fd == -1)
+		return -1;
+
+	ret = ioctl(fd, UBI_IOCRNVOL, rnvol);
+	if (ret == -1) {
+		close(fd);
+		return ret;
+	}
+
+	close(fd);
+
+#ifdef UDEV_SETTLE_HACK
+//	if (system("udevsettle") == -1)
+//		return -1;
+	usleep(100000);
+#endif
+
+	return 0;
+}
+
+int ubi_rsvol(libubi_t desc, const char *node, int vol_id, long long bytes)
+{
+	int fd, ret;
+	struct ubi_rsvol_req req;
+
+	desc = desc;
+	fd = open(node, O_RDONLY);
+	if (fd == -1)
+		return sys_errmsg("cannot open \"%s\"", node);
+
+	req.bytes = bytes;
+	req.vol_id = vol_id;
+
+	ret = ioctl(fd, UBI_IOCRSVOL, &req);
+	close(fd);
+	return ret;
+}
+
+int ubi_update_start(libubi_t desc, int fd, long long bytes)
+{
+	desc = desc;
+	if (ioctl(fd, UBI_IOCVOLUP, &bytes))
+		return -1;
+	return 0;
+}
+
+int ubi_leb_change_start(libubi_t desc, int fd, int lnum, int bytes, int dtype)
+{
+	struct ubi_leb_change_req req;
+
+	desc = desc;
+	memset(&req, 0, sizeof(struct ubi_leb_change_req));
+	req.lnum = lnum;
+	req.bytes = bytes;
+	req.dtype = dtype;
+
+	if (ioctl(fd, UBI_IOCEBCH, &req))
+		return -1;
+	return 0;
+}
+
+/**
+ * dev_present - check whether an UBI device is present.
+ * @lib: libubi descriptor
+ * @dev_num: UBI device number to check
+ *
+ * This function returns %1 if UBI device is present and %0 if not.
+ */
+static int dev_present(struct libubi *lib, int dev_num)
+{
+	struct stat st;
+	char file[strlen(lib->ubi_dev) + 50];
+
+	sprintf(file, lib->ubi_dev, dev_num);
+	return !stat(file, &st);
+}
+
+int ubi_get_dev_info1(libubi_t desc, int dev_num, struct ubi_dev_info *info)
+{
+	DIR *sysfs_ubi;
+	struct dirent *dirent;
+	struct libubi *lib = (struct libubi *)desc;
+
+	memset(info, 0, sizeof(struct ubi_dev_info));
+	info->dev_num = dev_num;
+
+	if (!dev_present(lib, dev_num))
+		return -1;
+
+	sysfs_ubi = opendir(lib->sysfs_ubi);
+	if (!sysfs_ubi)
+		return -1;
+
+	info->lowest_vol_id = INT_MAX;
+
+	while (1) {
+		int vol_id, ret, devno;
+		char tmp_buf[256];
+
+		errno = 0;
+		dirent = readdir(sysfs_ubi);
+		if (!dirent)
+			break;
+
+		if (strlen(dirent->d_name) >= 255) {
+			errmsg("invalid entry in %s: \"%s\"",
+			       lib->sysfs_ubi, dirent->d_name);
+			goto out_close;
+		}
+
+		ret = sscanf(dirent->d_name, UBI_VOL_NAME_PATT"%s", &devno, &vol_id, tmp_buf);
+		if (ret == 2 && devno == dev_num) {
+			info->vol_count += 1;
+			if (vol_id > info->highest_vol_id)
+				info->highest_vol_id = vol_id;
+			if (vol_id < info->lowest_vol_id)
+				info->lowest_vol_id = vol_id;
+		}
+	}
+
+	if (!dirent && errno) {
+		sys_errmsg("readdir failed on \"%s\"", lib->sysfs_ubi);
+		goto out_close;
+	}
+
+	if (closedir(sysfs_ubi))
+		return sys_errmsg("closedir failed on \"%s\"", lib->sysfs_ubi);
+
+	if (info->lowest_vol_id == INT_MAX)
+		info->lowest_vol_id = 0;
+
+	if (dev_get_major(lib, dev_num, &info->major, &info->minor))
+		return -1;
+
+	if (dev_read_int(lib->dev_mtd_num, dev_num, &info->mtd_num))
+		return -1;
+	if (dev_read_int(lib->dev_avail_ebs, dev_num, &info->avail_lebs))
+		return -1;
+	if (dev_read_int(lib->dev_total_ebs, dev_num, &info->total_lebs))
+		return -1;
+	if (dev_read_int(lib->dev_bad_count, dev_num, &info->bad_count))
+		return -1;
+	if (dev_read_int(lib->dev_eb_size, dev_num, &info->leb_size))
+		return -1;
+	if (dev_read_int(lib->dev_bad_rsvd, dev_num, &info->bad_rsvd))
+		return -1;
+	if (dev_read_ll(lib->dev_max_ec, dev_num, &info->max_ec))
+		return -1;
+	if (dev_read_int(lib->dev_max_vols, dev_num, &info->max_vol_count))
+		return -1;
+	if (dev_read_int(lib->dev_min_io_size, dev_num, &info->min_io_size))
+		return -1;
+
+	info->avail_bytes = (long long)info->avail_lebs * info->leb_size;
+	info->total_bytes = (long long)info->total_lebs * info->leb_size;
+
+	return 0;
+
+out_close:
+	closedir(sysfs_ubi);
+	return -1;
+}
+
+int ubi_get_dev_info(libubi_t desc, const char *node, struct ubi_dev_info *info)
+{
+	int err, dev_num;
+	struct libubi *lib = (struct libubi *)desc;
+
+	err = ubi_probe_node(desc, node);
+	if (err != 1) {
+		if (err == 2)
+			errno = ENODEV;
+		return -1;
+	}
+
+	if (dev_node2num(lib, node, &dev_num))
+		return -1;
+
+	return ubi_get_dev_info1(desc, dev_num, info);
+}
+
+int ubi_get_vol_info1(libubi_t desc, int dev_num, int vol_id,
+		      struct ubi_vol_info *info)
+{
+	int ret;
+	struct libubi *lib = (struct libubi *)desc;
+	char buf[50];
+
+	memset(info, 0, sizeof(struct ubi_vol_info));
+	info->dev_num = dev_num;
+	info->vol_id = vol_id;
+
+	if (vol_get_major(lib, dev_num, vol_id, &info->major, &info->minor))
+		return -1;
+
+	ret = vol_read_data(lib->vol_type, dev_num, vol_id, buf, 50);
+	if (ret < 0)
+		return -1;
+
+	if (strncmp(buf, "static\n", ret) == 0)
+		info->type = UBI_STATIC_VOLUME;
+	else if (strncmp(buf, "dynamic\n", ret) == 0)
+		info->type = UBI_DYNAMIC_VOLUME;
+	else {
+		errmsg("bad value at \"%s\"", buf);
+		errno = EINVAL;
+		return -1;
+	}
+
+	ret = vol_read_int(lib->vol_alignment, dev_num, vol_id,
+			   &info->alignment);
+	if (ret)
+		return -1;
+	ret = vol_read_ll(lib->vol_data_bytes, dev_num, vol_id,
+			  &info->data_bytes);
+	if (ret)
+		return -1;
+	ret = vol_read_int(lib->vol_rsvd_ebs, dev_num, vol_id, &info->rsvd_lebs);
+	if (ret)
+		return -1;
+	ret = vol_read_int(lib->vol_eb_size, dev_num, vol_id, &info->leb_size);
+	if (ret)
+		return -1;
+	ret = vol_read_int(lib->vol_corrupted, dev_num, vol_id,
+			   &info->corrupted);
+	if (ret)
+		return -1;
+	info->rsvd_bytes = (long long)info->leb_size * info->rsvd_lebs;
+
+	ret = vol_read_data(lib->vol_name, dev_num, vol_id, &info->name,
+			    UBI_VOL_NAME_MAX + 2);
+	if (ret < 0)
+		return -1;
+
+	info->name[ret - 1] = '\0';
+	return 0;
+}
+
+int ubi_get_vol_info(libubi_t desc, const char *node, struct ubi_vol_info *info)
+{
+	int err, vol_id, dev_num;
+	struct libubi *lib = (struct libubi *)desc;
+
+	err = ubi_probe_node(desc, node);
+	if (err != 2) {
+		if (err == 1)
+			errno = ENODEV;
+		return -1;
+	}
+
+	if (vol_node2nums(lib, node, &dev_num, &vol_id))
+		return -1;
+
+	return ubi_get_vol_info1(desc, dev_num, vol_id, info);
+}
+
+int ubi_get_vol_info1_nm(libubi_t desc, int dev_num, const char *name,
+			 struct ubi_vol_info *info)
+{
+	int i, err;
+	unsigned int nlen = strlen(name);
+	struct ubi_dev_info dev_info;
+
+	if (nlen == 0) {
+		errmsg("bad \"name\" input parameter");
+		errno = EINVAL;
+		return -1;
+	}
+
+	err = ubi_get_dev_info1(desc, dev_num, &dev_info);
+	if (err)
+		return err;
+
+	for (i = dev_info.lowest_vol_id;
+	     i <= dev_info.highest_vol_id; i++) {
+		err = ubi_get_vol_info1(desc, dev_num, i, info);
+		if (err == -1) {
+			if (errno == ENOENT)
+				continue;
+			return -1;
+		}
+
+		if (nlen == strlen(info->name) && !strcmp(name, info->name))
+			return 0;
+	}
+
+	errno = ENOENT;
+	return -1;
+}
+
+int ubi_set_property(int fd, uint8_t property, uint64_t value)
+{
+	struct ubi_set_prop_req r;
+
+	memset(&r, 0, sizeof(struct ubi_set_prop_req));
+	r.property = property;
+	r.value = value;
+
+	return ioctl(fd, UBI_IOCSETPROP, &r);
+}
+
+int ubi_leb_unmap(int fd, int lnum)
+{
+	return ioctl(fd, UBI_IOCEBUNMAP, &lnum);
+}
+
+int ubi_is_mapped(int fd, int lnum)
+{
+	return ioctl(fd, UBI_IOCEBISMAP, &lnum);
+}
diff --git a/ubi-utils/libubi_int.h b/ubi-utils/libubi_int.h
new file mode 100644
index 0000000..c3aa37a
--- /dev/null
+++ b/ubi-utils/libubi_int.h
@@ -0,0 +1,131 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * Author: Artem Bityutskiy
+ *
+ * UBI (Unsorted Block Images) library.
+ */
+
+#ifndef __LIBUBI_INT_H__
+#define __LIBUBI_INT_H__
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/*
+ * The below are pre-define UBI file and directory names.
+ *
+ * Note, older kernels put 'ubiX_Y' directories straight to '/sys/class/ubi/'.
+ * New kernels puts 'ubiX_Y' directories to '/sys/class/ubi/ubiX/', which is
+ * saner. And for compatibility reasons it also puts symlinks to 'ubiX_Y'
+ * directories to '/sys/class/ubi/'. For now libubi assumes old layout.
+ */
+
+#define SYSFS_UBI         "class/ubi"
+#define SYSFS_CTRL        "class/misc/ubi_ctrl/"
+
+#define CTRL_DEV          "dev"
+
+#define UBI_VER           "version"
+#define UBI_DEV_NAME_PATT "ubi%d"
+
+#define DEV_DEV           "dev"
+#define DEV_AVAIL_EBS     "avail_eraseblocks"
+#define DEV_TOTAL_EBS     "total_eraseblocks"
+#define DEV_BAD_COUNT     "bad_peb_count"
+#define DEV_EB_SIZE       "eraseblock_size"
+#define DEV_MAX_EC        "max_ec"
+#define DEV_MAX_RSVD      "reserved_for_bad"
+#define DEV_MAX_VOLS      "max_vol_count"
+#define DEV_MIN_IO_SIZE   "min_io_size"
+#define DEV_MTD_NUM       "mtd_num"
+
+#define UBI_VOL_NAME_PATT "ubi%d_%d"
+#define VOL_TYPE          "type"
+#define VOL_DEV           "dev"
+#define VOL_ALIGNMENT     "alignment"
+#define VOL_DATA_BYTES    "data_bytes"
+#define VOL_RSVD_EBS      "reserved_ebs"
+#define VOL_EB_SIZE       "usable_eb_size"
+#define VOL_CORRUPTED     "corrupted"
+#define VOL_NAME          "name"
+
+/**
+ * libubi - UBI library description data structure.
+ * @sysfs: sysfs file system path
+ * @sysfs_ctrl: UBI control device directory in sysfs
+ * @ctrl_dev: UBI control device major/minor numbers sysfs file
+ * @sysfs_ubi: UBI directory in sysfs
+ * @ubi_dev: UBI device sysfs directory pattern
+ * @ubi_version: UBI version file sysfs path
+ * @dev_dev: UBI device major/minor numbers file pattern
+ * @dev_avail_ebs: count of available eraseblocks sysfs path pattern
+ * @dev_total_ebs: total eraseblocks count sysfs path pattern
+ * @dev_bad_count: count of bad eraseblocks sysfs path pattern
+ * @dev_eb_size: size of UBI device's eraseblocks sysfs path pattern
+ * @dev_max_ec: maximum erase counter sysfs path pattern
+ * @dev_bad_rsvd: count of physical eraseblock reserved for bad eraseblocks
+ *                handling
+ * @dev_max_vols: maximum volumes number count sysfs path pattern
+ * @dev_min_io_size: minimum I/O unit size sysfs path pattern
+ * @dev_mtd_num: MTD device number
+ * @ubi_vol: UBI volume sysfs directory pattern
+ * @vol_type: volume type sysfs path pattern
+ * @vol_dev: volume major/minor numbers file pattern
+ * @vol_alignment: volume alignment sysfs path pattern
+ * @vol_data_bytes: volume data size sysfs path pattern
+ * @vol_rsvd_ebs: volume reserved size sysfs path pattern
+ * @vol_eb_size: volume eraseblock size sysfs path pattern
+ * @vol_corrupted: volume corruption flag sysfs path pattern
+ * @vol_name: volume name sysfs path pattern
+ */
+struct libubi
+{
+	char *sysfs;
+	char *sysfs_ctrl;
+	char *ctrl_dev;
+	char *sysfs_ubi;
+	char *ubi_dev;
+	char *ubi_version;
+	char *dev_dev;
+	char *dev_avail_ebs;
+	char *dev_total_ebs;
+	char *dev_bad_count;
+	char *dev_eb_size;
+	char *dev_max_ec;
+	char *dev_bad_rsvd;
+	char *dev_max_vols;
+	char *dev_min_io_size;
+	char *dev_mtd_num;
+	char *ubi_vol;
+	char *vol_type;
+	char *vol_dev;
+	char *vol_alignment;
+	char *vol_data_bytes;
+	char *vol_rsvd_ebs;
+	char *vol_eb_size;
+	char *vol_corrupted;
+	char *vol_name;
+	char *vol_max_count;
+};
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* !__LIBUBI_INT_H__ */
diff --git a/ubi-utils/libubigen.c b/ubi-utils/libubigen.c
new file mode 100644
index 0000000..9eaa7f5
--- /dev/null
+++ b/ubi-utils/libubigen.c
@@ -0,0 +1,315 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ * Copyright (C) 2008 Nokia Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+/*
+ * Generating UBI images.
+ *
+ * Authors: Oliver Lohmann
+ *          Artem Bityutskiy
+ */
+
+#define PROGRAM_NAME "libubigen"
+
+#include <stdlib.h>
+#include <stdint.h>
+#include <unistd.h>
+#include <string.h>
+
+#include <mtd/ubi-media.h>
+#include <mtd_swab.h>
+#include <libubigen.h>
+#include <crc32.h>
+#include "common.h"
+
+void ubigen_info_init(struct ubigen_info *ui, int peb_size, int min_io_size,
+		      int subpage_size, int vid_hdr_offs, int ubi_ver,
+		      uint32_t image_seq)
+{
+	if (!vid_hdr_offs) {
+		vid_hdr_offs = UBI_EC_HDR_SIZE + subpage_size - 1;
+		vid_hdr_offs /= subpage_size;
+		vid_hdr_offs *= subpage_size;
+	}
+
+	ui->peb_size = peb_size;
+	ui->min_io_size = min_io_size;
+	ui->vid_hdr_offs = vid_hdr_offs;
+	ui->data_offs = vid_hdr_offs + UBI_VID_HDR_SIZE + min_io_size - 1;
+	ui->data_offs /= min_io_size;
+	ui->data_offs *= min_io_size;
+	ui->leb_size = peb_size - ui->data_offs;
+	ui->ubi_ver = ubi_ver;
+	ui->image_seq = image_seq;
+
+	ui->max_volumes = ui->leb_size / UBI_VTBL_RECORD_SIZE;
+	if (ui->max_volumes > UBI_MAX_VOLUMES)
+		ui->max_volumes = UBI_MAX_VOLUMES;
+	ui->vtbl_size = ui->max_volumes * UBI_VTBL_RECORD_SIZE;
+}
+
+struct ubi_vtbl_record *ubigen_create_empty_vtbl(const struct ubigen_info *ui)
+{
+	struct ubi_vtbl_record *vtbl;
+	int i;
+
+	vtbl = calloc(1, ui->vtbl_size);
+	if (!vtbl) {
+		sys_errmsg("cannot allocate %d bytes of memory", ui->vtbl_size);
+		return NULL;
+	}
+
+	for (i = 0; i < ui->max_volumes; i++) {
+		uint32_t crc = mtd_crc32(UBI_CRC32_INIT, &vtbl[i],
+				     UBI_VTBL_RECORD_SIZE_CRC);
+		vtbl[i].crc = cpu_to_be32(crc);
+	}
+
+	return vtbl;
+}
+
+int ubigen_add_volume(const struct ubigen_info *ui,
+		      const struct ubigen_vol_info *vi,
+		      struct ubi_vtbl_record *vtbl)
+{
+	struct ubi_vtbl_record *vtbl_rec = &vtbl[vi->id];
+	uint32_t tmp;
+
+	if (vi->id >= ui->max_volumes) {
+		errmsg("too high volume id %d, max. volumes is %d",
+		       vi->id, ui->max_volumes);
+		errno = EINVAL;
+		return -1;
+	}
+
+	if (vi->alignment >= ui->leb_size) {
+		errmsg("too large alignment %d, max is %d (LEB size)",
+		       vi->alignment, ui->leb_size);
+		errno = EINVAL;
+		return -1;
+	}
+
+	memset(vtbl_rec, 0, sizeof(struct ubi_vtbl_record));
+	tmp = (vi->bytes + ui->leb_size - 1) / ui->leb_size;
+	vtbl_rec->reserved_pebs = cpu_to_be32(tmp);
+	vtbl_rec->alignment = cpu_to_be32(vi->alignment);
+	vtbl_rec->vol_type = vi->type;
+	tmp = ui->leb_size % vi->alignment;
+	vtbl_rec->data_pad = cpu_to_be32(tmp);
+	vtbl_rec->flags = vi->flags;
+
+	memcpy(vtbl_rec->name, vi->name, vi->name_len);
+	vtbl_rec->name[vi->name_len] = '\0';
+	vtbl_rec->name_len = cpu_to_be16(vi->name_len);
+
+	tmp = mtd_crc32(UBI_CRC32_INIT, vtbl_rec, UBI_VTBL_RECORD_SIZE_CRC);
+	vtbl_rec->crc =	 cpu_to_be32(tmp);
+	return 0;
+}
+
+void ubigen_init_ec_hdr(const struct ubigen_info *ui,
+		        struct ubi_ec_hdr *hdr, long long ec)
+{
+	uint32_t crc;
+
+	memset(hdr, 0, sizeof(struct ubi_ec_hdr));
+
+	hdr->magic = cpu_to_be32(UBI_EC_HDR_MAGIC);
+	hdr->version = ui->ubi_ver;
+	hdr->ec = cpu_to_be64(ec);
+	hdr->vid_hdr_offset = cpu_to_be32(ui->vid_hdr_offs);
+	hdr->data_offset = cpu_to_be32(ui->data_offs);
+	hdr->image_seq = cpu_to_be32(ui->image_seq);
+
+	crc = mtd_crc32(UBI_CRC32_INIT, hdr, UBI_EC_HDR_SIZE_CRC);
+	hdr->hdr_crc = cpu_to_be32(crc);
+}
+
+void ubigen_init_vid_hdr(const struct ubigen_info *ui,
+			 const struct ubigen_vol_info *vi,
+			 struct ubi_vid_hdr *hdr, int lnum,
+			 const void *data, int data_size)
+{
+	uint32_t crc;
+
+	memset(hdr, 0, sizeof(struct ubi_vid_hdr));
+
+	hdr->magic = cpu_to_be32(UBI_VID_HDR_MAGIC);
+	hdr->version = ui->ubi_ver;
+	hdr->vol_type = vi->type;
+	hdr->vol_id = cpu_to_be32(vi->id);
+	hdr->lnum = cpu_to_be32(lnum);
+	hdr->data_pad = cpu_to_be32(vi->data_pad);
+	hdr->compat = vi->compat;
+
+	if (vi->type == UBI_VID_STATIC) {
+		hdr->data_size = cpu_to_be32(data_size);
+		hdr->used_ebs = cpu_to_be32(vi->used_ebs);
+		crc = mtd_crc32(UBI_CRC32_INIT, data, data_size);
+		hdr->data_crc = cpu_to_be32(crc);
+	}
+
+	crc = mtd_crc32(UBI_CRC32_INIT, hdr, UBI_VID_HDR_SIZE_CRC);
+	hdr->hdr_crc = cpu_to_be32(crc);
+}
+
+int ubigen_write_volume(const struct ubigen_info *ui,
+			const struct ubigen_vol_info *vi, long long ec,
+			long long bytes, int in, int out)
+{
+	int len = vi->usable_leb_size, rd, lnum = 0;
+	char *inbuf, *outbuf;
+
+	if (vi->id >= ui->max_volumes) {
+		errmsg("too high volume id %d, max. volumes is %d",
+		       vi->id, ui->max_volumes);
+		errno = EINVAL;
+		return -1;
+	}
+
+	if (vi->alignment >= ui->leb_size) {
+		errmsg("too large alignment %d, max is %d (LEB size)",
+		       vi->alignment, ui->leb_size);
+		errno = EINVAL;
+		return -1;
+	}
+
+	inbuf = malloc(ui->leb_size);
+	if (!inbuf)
+		return sys_errmsg("cannot allocate %d bytes of memory",
+				  ui->leb_size);
+	outbuf = malloc(ui->peb_size);
+	if (!outbuf) {
+		sys_errmsg("cannot allocate %d bytes of memory", ui->peb_size);
+		goto out_free;
+	}
+
+	memset(outbuf, 0xFF, ui->data_offs);
+	ubigen_init_ec_hdr(ui, (struct ubi_ec_hdr *)outbuf, ec);
+
+	while (bytes) {
+		int l;
+		struct ubi_vid_hdr *vid_hdr;
+
+		if (bytes < len)
+			len = bytes;
+		bytes -= len;
+
+		l = len;
+		do {
+			rd = read(in, inbuf + len - l, l);
+			if (rd != l) {
+				sys_errmsg("cannot read %d bytes from the input file", l);
+				goto out_free1;
+			}
+
+			l -= rd;
+		} while (l);
+
+		vid_hdr = (struct ubi_vid_hdr *)(&outbuf[ui->vid_hdr_offs]);
+		ubigen_init_vid_hdr(ui, vi, vid_hdr, lnum, inbuf, len);
+
+		memcpy(outbuf + ui->data_offs, inbuf, len);
+		memset(outbuf + ui->data_offs + len, 0xFF,
+		       ui->peb_size - ui->data_offs - len);
+
+		if (write(out, outbuf, ui->peb_size) != ui->peb_size) {
+			sys_errmsg("cannot write %d bytes to the output file", ui->peb_size);
+			goto out_free1;
+		}
+
+		lnum += 1;
+	}
+
+	free(outbuf);
+	free(inbuf);
+	return 0;
+
+out_free1:
+	free(outbuf);
+out_free:
+	free(inbuf);
+	return -1;
+}
+
+int ubigen_write_layout_vol(const struct ubigen_info *ui, int peb1, int peb2,
+			    long long ec1, long long ec2,
+			    struct ubi_vtbl_record *vtbl, int fd)
+{
+	int ret;
+	struct ubigen_vol_info vi;
+	char *outbuf;
+	struct ubi_vid_hdr *vid_hdr;
+	off_t seek;
+
+	vi.bytes = ui->leb_size * UBI_LAYOUT_VOLUME_EBS;
+	vi.id = UBI_LAYOUT_VOLUME_ID;
+	vi.alignment = UBI_LAYOUT_VOLUME_ALIGN;
+	vi.data_pad = ui->leb_size % UBI_LAYOUT_VOLUME_ALIGN;
+	vi.usable_leb_size = ui->leb_size - vi.data_pad;
+	vi.data_pad = ui->leb_size - vi.usable_leb_size;
+	vi.type = UBI_LAYOUT_VOLUME_TYPE;
+	vi.name = UBI_LAYOUT_VOLUME_NAME;
+	vi.name_len = strlen(UBI_LAYOUT_VOLUME_NAME);
+	vi.compat = UBI_LAYOUT_VOLUME_COMPAT;
+
+	outbuf = malloc(ui->peb_size);
+	if (!outbuf)
+		return sys_errmsg("failed to allocate %d bytes",
+				  ui->peb_size);
+
+	memset(outbuf, 0xFF, ui->data_offs);
+	vid_hdr = (struct ubi_vid_hdr *)(&outbuf[ui->vid_hdr_offs]);
+	memcpy(outbuf + ui->data_offs, vtbl, ui->vtbl_size);
+	memset(outbuf + ui->data_offs + ui->vtbl_size, 0xFF,
+	       ui->peb_size - ui->data_offs - ui->vtbl_size);
+
+	seek = peb1 * ui->peb_size;
+	if (lseek(fd, seek, SEEK_SET) != seek) {
+		sys_errmsg("cannot seek output file");
+		goto out_free;
+	}
+
+	ubigen_init_ec_hdr(ui, (struct ubi_ec_hdr *)outbuf, ec1);
+	ubigen_init_vid_hdr(ui, &vi, vid_hdr, 0, NULL, 0);
+	ret = write(fd, outbuf, ui->peb_size);
+	if (ret != ui->peb_size) {
+		sys_errmsg("cannot write %d bytes", ui->peb_size);
+		goto out_free;
+	}
+
+	seek = peb2 * ui->peb_size;
+	if (lseek(fd, seek, SEEK_SET) != seek) {
+		sys_errmsg("cannot seek output file");
+		goto out_free;
+	}
+	ubigen_init_ec_hdr(ui, (struct ubi_ec_hdr *)outbuf, ec2);
+	ubigen_init_vid_hdr(ui, &vi, vid_hdr, 1, NULL, 0);
+	ret = write(fd, outbuf, ui->peb_size);
+	if (ret != ui->peb_size) {
+		sys_errmsg("cannot write %d bytes", ui->peb_size);
+		goto out_free;
+	}
+
+	free(outbuf);
+	return 0;
+
+out_free:
+	free(outbuf);
+	return -1;
+}
diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
new file mode 100644
index 0000000..bfd7e6d
--- /dev/null
+++ b/ubi-utils/mtdinfo.c
@@ -0,0 +1,446 @@
+/*
+ * Copyright (C) 2009 Nokia Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+/*
+ * An utility to get MTD information.
+ *
+ * Author: Artem Bityutskiy
+ */
+
+#define PROGRAM_VERSION "1.1"
+#define PROGRAM_NAME    "mtdinfo"
+
+#include <stdint.h>
+#include <stdio.h>
+#include <getopt.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <mtd/mtd-user.h>
+
+#include <libubigen.h>
+#include <libmtd.h>
+#include "common.h"
+#include "ubiutils-common.h"
+
+/* The variables below are set by command line arguments */
+struct args {
+	int mtdn;
+	unsigned int all:1;
+	unsigned int ubinfo:1;
+	unsigned int map:1;
+	const char *node;
+};
+
+static struct args args = {
+	.mtdn = -1,
+	.ubinfo = 0,
+	.all = 0,
+	.node = NULL,
+};
+
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+			 " - a tool to print MTD information.";
+
+static const char optionsstr[] =
+"-m, --mtdn=<MTD device number>  MTD device number to get information about\n"
+"                                (deprecated option, will be removed, do not use)\n"
+"-u, --ubi-info                  print what would UBI layout be if it was put\n"
+"                                on this MTD device\n"
+"-M, --map                       print eraseblock map\n"
+"-a, --all                       print information about all MTD devices\n"
+"-h, --help                      print help message\n"
+"-V, --version                   print program version";
+
+static const char usage[] =
+"Usage 1: " PROGRAM_NAME " [-m <MTD device number>] [-u] [-M] [-h] [-V] [--mtdn <MTD device number>]\n"
+"\t\t[--ubi-info] [--help] [--version]\n"
+"Usage 2: " PROGRAM_NAME " <MTD device node file name> [-u] [-M] [-h] [-V] [--ubi-info] [--help]\n"
+"\t\t[--version]\n"
+"Example 1: " PROGRAM_NAME " - (no arguments) print general MTD information\n"
+"Example 2: " PROGRAM_NAME " -m 1 - print information about MTD device number 1\n"
+"Example 3: " PROGRAM_NAME " /dev/mtd0 - print information MTD device /dev/mtd0\n"
+"Example 4: " PROGRAM_NAME " /dev/mtd0 -u - print information MTD device /dev/mtd0\n"
+"\t\t\t\tand include UBI layout information\n"
+"Example 5: " PROGRAM_NAME " -a - print information about all MTD devices\n"
+"\t\t\tand include UBI layout information\n";
+
+static const struct option long_options[] = {
+	{ .name = "mtdn",      .has_arg = 1, .flag = NULL, .val = 'm' },
+	{ .name = "ubi-info",  .has_arg = 0, .flag = NULL, .val = 'u' },
+	{ .name = "map",       .has_arg = 0, .flag = NULL, .val = 'M' },
+	{ .name = "all",       .has_arg = 0, .flag = NULL, .val = 'a' },
+	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ NULL, 0, NULL, 0},
+};
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int key, error = 0;
+
+		key = getopt_long(argc, argv, "am:uMhV", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 'a':
+			args.all = 1;
+			break;
+
+		case 'u':
+			args.ubinfo = 1;
+			break;
+
+		case 'm':
+			args.mtdn = simple_strtoul(optarg, &error);
+			if (error || args.mtdn < 0)
+				return errmsg("bad MTD device number: \"%s\"", optarg);
+			warnmsg("-m/--mtdn is depecated, will be removed in mtd-utils-1.4.6");
+			break;
+
+		case 'M':
+			args.map = 1;
+			break;
+
+		case 'h':
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'V':
+			printf("%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
+		case ':':
+			return errmsg("parameter is missing");
+
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+
+	if (optind == argc - 1)
+		args.node = argv[optind];
+	else if (optind < argc)
+		return errmsg("more then one MTD device specified (use -h for help)");
+
+	if (args.all && (args.node || args.mtdn != -1)) {
+		args.mtdn = -1;
+		args.node = NULL;
+	}
+
+	if (args.map && !args.node)
+		return errmsg("-M requires MTD device node name");
+
+	return 0;
+}
+
+static int translate_dev(libmtd_t libmtd, const char *node)
+{
+	int err;
+	struct mtd_dev_info mtd;
+
+	err = mtd_get_dev_info(libmtd, node, &mtd);
+	if (err) {
+		if (errno == ENODEV)
+			return errmsg("\"%s\" does not correspond to any "
+				      "existing MTD device", node);
+		return sys_errmsg("cannot get information about MTD "
+				  "device \"%s\"", node);
+	}
+
+	args.mtdn = mtd.mtd_num;
+	return 0;
+}
+
+static void print_ubi_info(const struct mtd_info *mtd_info,
+			   const struct mtd_dev_info *mtd)
+{
+	struct ubigen_info ui;
+
+	if (!mtd_info->sysfs_supported) {
+		errmsg("cannot provide UBI info, becasue sub-page size is "
+		       "not known");
+		return;
+	}
+
+	ubigen_info_init(&ui, mtd->eb_size, mtd->min_io_size, mtd->subpage_size,
+			 0, 1, 0);
+	printf("Default UBI VID header offset:  %d\n", ui.vid_hdr_offs);
+	printf("Default UBI data offset:        %d\n", ui.data_offs);
+	printf("Default UBI LEB size:           ");
+	ubiutils_print_bytes(ui.leb_size, 0);
+	printf("\n");
+	printf("Maximum UBI volumes count:      %d\n", ui.max_volumes);
+}
+
+static void print_region_map(const struct mtd_dev_info *mtd, int fd,
+			     const region_info_t *reginfo)
+{
+	unsigned long start;
+	int i, width;
+	int ret_locked, errno_locked, ret_bad, errno_bad;
+
+	printf("Eraseblock map:\n");
+
+	/* Figure out the number of spaces to pad w/out libm */
+	for (i = 1, width = 0; i < reginfo->numblocks; i *= 10, ++width)
+		continue;
+
+	/* If we don't have a fd to query, just show the bare map */
+	if (fd == -1) {
+		ret_locked = ret_bad = -1;
+		errno_locked = errno_bad = ENODEV;
+	} else
+		ret_locked = ret_bad = errno_locked = errno_bad = 0;
+
+	for (i = 0; i < reginfo->numblocks; ++i) {
+		start = reginfo->offset + i * reginfo->erasesize;
+		printf(" %*i: %08lx ", width, i, start);
+
+		if (ret_locked != -1) {
+			ret_locked = mtd_is_locked(mtd, fd, i);
+			if (ret_locked == 1)
+				printf("RO ");
+			else
+				errno_locked = errno;
+		}
+		if (ret_locked != 1)
+			printf("   ");
+
+		if (ret_bad != -1) {
+			ret_bad = mtd_is_bad(mtd, fd, i);
+			if (ret_bad == 1)
+				printf("BAD ");
+			else
+				errno_bad = errno;
+		}
+		if (ret_bad != 1)
+			printf("    ");
+
+		if (((i + 1) % 4) == 0)
+			printf("\n");
+	}
+	if (i % 4)
+		printf("\n");
+
+	if (ret_locked == -1 && errno_locked != EOPNOTSUPP) {
+		errno = errno_locked;
+		sys_errmsg("could not read locked block info");
+	}
+
+	if (mtd->bb_allowed && ret_bad == -1 && errno_bad != EOPNOTSUPP) {
+		errno = errno_bad;
+		sys_errmsg("could not read bad block info");
+	}
+}
+
+static void print_region_info(const struct mtd_dev_info *mtd)
+{
+	region_info_t reginfo;
+	int r, fd;
+
+	/* If we don't have any region info, just return */
+	if (!args.map && mtd->region_cnt == 0)
+		return;
+
+	/* First open the device so we can query it */
+	fd = open(args.node, O_RDONLY | O_CLOEXEC);
+	if (fd == -1) {
+		sys_errmsg("couldn't open MTD dev: %s", args.node);
+		if (mtd->region_cnt)
+			return;
+	}
+
+	/* Walk all the regions and show the map for them */
+	if (mtd->region_cnt) {
+		for (r = 0; r < mtd->region_cnt; ++r) {
+			printf("Eraseblock region %i: ", r);
+			if (mtd_regioninfo(fd, r, &reginfo) == 0) {
+				printf(" offset: %#x size: %#x numblocks: %#x\n",
+					reginfo.offset, reginfo.erasesize,
+					reginfo.numblocks);
+				if (args.map)
+					print_region_map(mtd, fd, &reginfo);
+			} else
+				printf(" info is unavailable\n");
+		}
+	} else {
+		reginfo.offset = 0;
+		reginfo.erasesize = mtd->eb_size;
+		reginfo.numblocks = mtd->eb_cnt;
+		reginfo.regionindex = 0;
+		print_region_map(mtd, fd, &reginfo);
+	}
+
+	if (fd != -1)
+		close(fd);
+}
+
+static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int mtdn)
+{
+	int err;
+	struct mtd_dev_info mtd;
+
+	err = mtd_get_dev_info1(libmtd, mtdn, &mtd);
+	if (err) {
+		if (errno == ENODEV)
+			return errmsg("mtd%d does not correspond to any "
+				      "existing MTD device", mtdn);
+		return sys_errmsg("cannot get information about MTD device %d",
+				  mtdn);
+	}
+
+	printf("mtd%d\n", mtd.mtd_num);
+	printf("Name:                           %s\n", mtd.name);
+	printf("Type:                           %s\n", mtd.type_str);
+	printf("Eraseblock size:                ");
+	ubiutils_print_bytes(mtd.eb_size, 0);
+	printf("\n");
+	printf("Amount of eraseblocks:          %d (", mtd.eb_cnt);
+	ubiutils_print_bytes(mtd.size, 0);
+	printf(")\n");
+	printf("Minimum input/output unit size: %d %s\n",
+	       mtd.min_io_size, mtd.min_io_size > 1 ? "bytes" : "byte");
+	if (mtd_info->sysfs_supported)
+		printf("Sub-page size:                  %d %s\n",
+		       mtd.subpage_size,
+		       mtd.subpage_size > 1 ? "bytes" : "byte");
+	else if (mtd.type == MTD_NANDFLASH)
+		printf("Sub-page size:                  unknown\n");
+
+	if (mtd.oob_size > 0)
+		printf("OOB size:                       %d bytes\n",
+		       mtd.oob_size);
+	if (mtd.region_cnt > 0)
+		printf("Additional erase regions:       %d\n", mtd.oob_size);
+	if (mtd_info->sysfs_supported)
+		printf("Character device major/minor:   %d:%d\n",
+		       mtd.major, mtd.minor);
+	printf("Bad blocks are allowed:         %s\n",
+	       mtd.bb_allowed ? "true" : "false");
+	printf("Device is writable:             %s\n",
+	      mtd.writable ? "true" : "false");
+
+	if (args.ubinfo)
+		print_ubi_info(mtd_info, &mtd);
+
+	print_region_info(&mtd);
+
+	printf("\n");
+	return 0;
+}
+
+static int print_general_info(libmtd_t libmtd, const struct mtd_info *mtd_info,
+			      int all)
+{
+	int i, err, first = 1;
+	struct mtd_dev_info mtd;
+
+	printf("Count of MTD devices:           %d\n", mtd_info->mtd_dev_cnt);
+	if (mtd_info->mtd_dev_cnt == 0)
+		return 0;
+
+	for (i = mtd_info->lowest_mtd_num;
+	     i <= mtd_info->highest_mtd_num; i++) {
+		err = mtd_get_dev_info1(libmtd, i, &mtd);
+		if (err == -1) {
+			if (errno == ENODEV)
+				continue;
+			return sys_errmsg("libmtd failed get MTD device %d "
+					  "information", i);
+		}
+
+		if (!first)
+			printf(", mtd%d", i);
+		else {
+			printf("Present MTD devices:            mtd%d", i);
+			first = 0;
+		}
+	}
+	printf("\n");
+	printf("Sysfs interface supported:      %s\n",
+	       mtd_info->sysfs_supported ? "yes" : "no");
+
+	if (!all)
+		return 0;
+
+	first = 1;
+	printf("\n");
+
+	for (i = mtd_info->lowest_mtd_num;
+	     i <= mtd_info->highest_mtd_num; i++) {
+		err = print_dev_info(libmtd, mtd_info, i);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err;
+	libmtd_t libmtd;
+	struct mtd_info mtd_info;
+
+	err = parse_opt(argc, argv);
+	if (err)
+		return -1;
+
+	libmtd = libmtd_open();
+	if (libmtd == NULL) {
+		if (errno == 0)
+			return errmsg("MTD is not present in the system");
+		return sys_errmsg("cannot open libmtd");
+	}
+
+	err = mtd_get_info(libmtd, &mtd_info);
+	if (err) {
+		if (errno == ENODEV)
+			return errmsg("MTD is not present");
+		return sys_errmsg("cannot get MTD information");
+	}
+
+	if (args.node) {
+		/*
+		 * A character device was specified, translate this to MTD
+		 * device number.
+		 */
+		err = translate_dev(libmtd, args.node);
+		if (err)
+			goto out_libmtd;
+	}
+
+	if (args.mtdn == -1)
+		err = print_general_info(libmtd, &mtd_info, args.all);
+	else
+		err = print_dev_info(libmtd, &mtd_info, args.mtdn);
+	if (err)
+		goto out_libmtd;
+
+	libmtd_close(libmtd);
+	return 0;
+
+out_libmtd:
+	libmtd_close(libmtd);
+	return -1;
+}
diff --git a/ubi-utils/src/dictionary.c b/ubi-utils/src/dictionary.c
deleted file mode 100644
index b7c9ebf..0000000
--- a/ubi-utils/src/dictionary.c
+++ /dev/null
@@ -1,405 +0,0 @@
-/*-------------------------------------------------------------------------*/
-/**
-   @file	dictionary.c
-   @author	N. Devillard
-   @date	Sep 2007
-   @version	$Revision: 1.27 $
-   @brief	Implements a dictionary for string variables.
-
-   This module implements a simple dictionary object, i.e. a list
-   of string/string associations. This object is useful to store e.g.
-   informations retrieved from a configuration file (ini files).
-*/
-/*--------------------------------------------------------------------------*/
-
-/*
-	$Id: dictionary.c,v 1.27 2007-11-23 21:39:18 ndevilla Exp $
-	$Revision: 1.27 $
-*/
-/*---------------------------------------------------------------------------
-   								Includes
- ---------------------------------------------------------------------------*/
-#include "dictionary.h"
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-
-/** Maximum value size for integers and doubles. */
-#define MAXVALSZ	1024
-
-/** Minimal allocated number of entries in a dictionary */
-#define DICTMINSZ	128
-
-/** Invalid key token */
-#define DICT_INVALID_KEY    ((char*)-1)
-
-/*---------------------------------------------------------------------------
-  							Private functions
- ---------------------------------------------------------------------------*/
-
-/* Doubles the allocated size associated to a pointer */
-/* 'size' is the current allocated size. */
-static void * mem_double(void * ptr, int size)
-{
-    void * newptr ;
- 
-    newptr = calloc(2*size, 1);
-    if (newptr==NULL) {
-        return NULL ;
-    }
-    memcpy(newptr, ptr, size);
-    free(ptr);
-    return newptr ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Duplicate a string
-  @param    s String to duplicate
-  @return   Pointer to a newly allocated string, to be freed with free()
-
-  This is a replacement for strdup(). This implementation is provided
-  for systems that do not have it.
- */
-/*--------------------------------------------------------------------------*/
-static char * xstrdup(char * s)
-{
-    char * t ;
-    if (!s)
-        return NULL ;
-    t = malloc(strlen(s)+1) ;
-    if (t) {
-        strcpy(t,s);
-    }
-    return t ;
-}
-
-/*---------------------------------------------------------------------------
-  							Function codes
- ---------------------------------------------------------------------------*/
-/*-------------------------------------------------------------------------*/
-/**
-  @brief	Compute the hash key for a string.
-  @param	key		Character string to use for key.
-  @return	1 unsigned int on at least 32 bits.
-
-  This hash function has been taken from an Article in Dr Dobbs Journal.
-  This is normally a collision-free function, distributing keys evenly.
-  The key is stored anyway in the struct so that collision can be avoided
-  by comparing the key itself in last resort.
- */
-/*--------------------------------------------------------------------------*/
-unsigned dictionary_hash(char * key)
-{
-	int			len ;
-	unsigned	hash ;
-	int			i ;
-
-	len = strlen(key);
-	for (hash=0, i=0 ; i<len ; i++) {
-		hash += (unsigned)key[i] ;
-		hash += (hash<<10);
-		hash ^= (hash>>6) ;
-	}
-	hash += (hash <<3);
-	hash ^= (hash >>11);
-	hash += (hash <<15);
-	return hash ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief	Create a new dictionary object.
-  @param	size	Optional initial size of the dictionary.
-  @return	1 newly allocated dictionary objet.
-
-  This function allocates a new dictionary object of given size and returns
-  it. If you do not know in advance (roughly) the number of entries in the
-  dictionary, give size=0.
- */
-/*--------------------------------------------------------------------------*/
-dictionary * dictionary_new(int size)
-{
-	dictionary	*	d ;
-
-	/* If no size was specified, allocate space for DICTMINSZ */
-	if (size<DICTMINSZ) size=DICTMINSZ ;
-
-	if (!(d = (dictionary *)calloc(1, sizeof(dictionary)))) {
-		return NULL;
-	}
-	d->size = size ;
-	d->val  = (char **)calloc(size, sizeof(char*));
-	d->key  = (char **)calloc(size, sizeof(char*));
-	d->hash = (unsigned int *)calloc(size, sizeof(unsigned));
-	return d ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief	Delete a dictionary object
-  @param	d	dictionary object to deallocate.
-  @return	void
-
-  Deallocate a dictionary object and all memory associated to it.
- */
-/*--------------------------------------------------------------------------*/
-void dictionary_del(dictionary * d)
-{
-	int		i ;
-
-	if (d==NULL) return ;
-	for (i=0 ; i<d->size ; i++) {
-		if (d->key[i]!=NULL)
-			free(d->key[i]);
-		if (d->val[i]!=NULL)
-			free(d->val[i]);
-	}
-	free(d->val);
-	free(d->key);
-	free(d->hash);
-	free(d);
-	return ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief	Get a value from a dictionary.
-  @param	d		dictionary object to search.
-  @param	key		Key to look for in the dictionary.
-  @param    def     Default value to return if key not found.
-  @return	1 pointer to internally allocated character string.
-
-  This function locates a key in a dictionary and returns a pointer to its
-  value, or the passed 'def' pointer if no such key can be found in
-  dictionary. The returned character pointer points to data internal to the
-  dictionary object, you should not try to free it or modify it.
- */
-/*--------------------------------------------------------------------------*/
-char * dictionary_get(dictionary * d, char * key, char * def)
-{
-	unsigned	hash ;
-	int			i ;
-
-	hash = dictionary_hash(key);
-	for (i=0 ; i<d->size ; i++) {
-        if (d->key[i]==NULL)
-            continue ;
-        /* Compare hash */
-		if (hash==d->hash[i]) {
-            /* Compare string, to avoid hash collisions */
-            if (!strcmp(key, d->key[i])) {
-				return d->val[i] ;
-			}
-		}
-	}
-	return def ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Set a value in a dictionary.
-  @param    d       dictionary object to modify.
-  @param    key     Key to modify or add.
-  @param    val     Value to add.
-  @return   int     0 if Ok, anything else otherwise
-
-  If the given key is found in the dictionary, the associated value is
-  replaced by the provided one. If the key cannot be found in the
-  dictionary, it is added to it.
-
-  It is Ok to provide a NULL value for val, but NULL values for the dictionary
-  or the key are considered as errors: the function will return immediately
-  in such a case.
-
-  Notice that if you dictionary_set a variable to NULL, a call to
-  dictionary_get will return a NULL value: the variable will be found, and
-  its value (NULL) is returned. In other words, setting the variable
-  content to NULL is equivalent to deleting the variable from the
-  dictionary. It is not possible (in this implementation) to have a key in
-  the dictionary without value.
-
-  This function returns non-zero in case of failure.
- */
-/*--------------------------------------------------------------------------*/
-int dictionary_set(dictionary * d, char * key, char * val)
-{
-	int			i ;
-	unsigned	hash ;
-
-	if (d==NULL || key==NULL) return -1 ;
-	
-	/* Compute hash for this key */
-	hash = dictionary_hash(key) ;
-	/* Find if value is already in dictionary */
-	if (d->n>0) {
-		for (i=0 ; i<d->size ; i++) {
-            if (d->key[i]==NULL)
-                continue ;
-			if (hash==d->hash[i]) { /* Same hash value */
-				if (!strcmp(key, d->key[i])) {	 /* Same key */
-					/* Found a value: modify and return */
-					if (d->val[i]!=NULL)
-						free(d->val[i]);
-                    d->val[i] = val ? xstrdup(val) : NULL ;
-                    /* Value has been modified: return */
-					return 0 ;
-				}
-			}
-		}
-	}
-	/* Add a new value */
-	/* See if dictionary needs to grow */
-	if (d->n==d->size) {
-
-		/* Reached maximum size: reallocate dictionary */
-		d->val  = (char **)mem_double(d->val,  d->size * sizeof(char*)) ;
-		d->key  = (char **)mem_double(d->key,  d->size * sizeof(char*)) ;
-		d->hash = (unsigned int *)mem_double(d->hash, d->size * sizeof(unsigned)) ;
-        if ((d->val==NULL) || (d->key==NULL) || (d->hash==NULL)) {
-            /* Cannot grow dictionary */
-            return -1 ;
-        }
-		/* Double size */
-		d->size *= 2 ;
-	}
-
-    /* Insert key in the first empty slot */
-    for (i=0 ; i<d->size ; i++) {
-        if (d->key[i]==NULL) {
-            /* Add key here */
-            break ;
-        }
-    }
-	/* Copy key */
-	d->key[i]  = xstrdup(key);
-    d->val[i]  = val ? xstrdup(val) : NULL ;
-	d->hash[i] = hash;
-	d->n ++ ;
-	return 0 ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief	Delete a key in a dictionary
-  @param	d		dictionary object to modify.
-  @param	key		Key to remove.
-  @return   void
-
-  This function deletes a key in a dictionary. Nothing is done if the
-  key cannot be found.
- */
-/*--------------------------------------------------------------------------*/
-void dictionary_unset(dictionary * d, char * key)
-{
-	unsigned	hash ;
-	int			i ;
-
-	if (key == NULL) {
-		return;
-	}
-
-	hash = dictionary_hash(key);
-	for (i=0 ; i<d->size ; i++) {
-        if (d->key[i]==NULL)
-            continue ;
-        /* Compare hash */
-		if (hash==d->hash[i]) {
-            /* Compare string, to avoid hash collisions */
-            if (!strcmp(key, d->key[i])) {
-                /* Found key */
-                break ;
-			}
-		}
-	}
-    if (i>=d->size)
-        /* Key not found */
-        return ;
-
-    free(d->key[i]);
-    d->key[i] = NULL ;
-    if (d->val[i]!=NULL) {
-        free(d->val[i]);
-        d->val[i] = NULL ;
-    }
-    d->hash[i] = 0 ;
-    d->n -- ;
-    return ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief	Dump a dictionary to an opened file pointer.
-  @param	d	Dictionary to dump
-  @param	f	Opened file pointer.
-  @return	void
-
-  Dumps a dictionary onto an opened file pointer. Key pairs are printed out
-  as @c [Key]=[Value], one per line. It is Ok to provide stdout or stderr as
-  output file pointers.
- */
-/*--------------------------------------------------------------------------*/
-void dictionary_dump(dictionary * d, FILE * out)
-{
-	int		i ;
-
-	if (d==NULL || out==NULL) return ;
-	if (d->n<1) {
-		fprintf(out, "empty dictionary\n");
-		return ;
-	}
-	for (i=0 ; i<d->size ; i++) {
-        if (d->key[i]) {
-            fprintf(out, "%20s\t[%s]\n",
-                    d->key[i],
-                    d->val[i] ? d->val[i] : "UNDEF");
-        }
-	}
-	return ;
-}
-
-
-/* Test code */
-#ifdef TESTDIC
-#define NVALS 20000
-int main(int argc, char *argv[])
-{
-	dictionary	*	d ;
-	char	*	val ;
-	int			i ;
-	char		cval[90] ;
-
-	/* Allocate dictionary */
-	printf("allocating...\n");
-	d = dictionary_new(0);
-	
-	/* Set values in dictionary */
-	printf("setting %d values...\n", NVALS);
-	for (i=0 ; i<NVALS ; i++) {
-		sprintf(cval, "%04d", i);
-		dictionary_set(d, cval, "salut");
-	}
-	printf("getting %d values...\n", NVALS);
-	for (i=0 ; i<NVALS ; i++) {
-		sprintf(cval, "%04d", i);
-		val = dictionary_get(d, cval, DICT_INVALID_KEY);
-		if (val==DICT_INVALID_KEY) {
-			printf("cannot get value for key [%s]\n", cval);
-		}
-	}
-    printf("unsetting %d values...\n", NVALS);
-	for (i=0 ; i<NVALS ; i++) {
-		sprintf(cval, "%04d", i);
-		dictionary_unset(d, cval);
-	}
-    if (d->n != 0) {
-        printf("error deleting values\n");
-    }
-	printf("deallocating...\n");
-	dictionary_del(d);
-	return 0 ;
-}
-#endif
-/* vim: set ts=4 et sw=4 tw=75 */
diff --git a/ubi-utils/src/dictionary.h b/ubi-utils/src/dictionary.h
deleted file mode 100644
index c7d1790..0000000
--- a/ubi-utils/src/dictionary.h
+++ /dev/null
@@ -1,174 +0,0 @@
-
-/*-------------------------------------------------------------------------*/
-/**
-   @file    dictionary.h
-   @author  N. Devillard
-   @date    Sep 2007
-   @version $Revision: 1.12 $
-   @brief   Implements a dictionary for string variables.
-
-   This module implements a simple dictionary object, i.e. a list
-   of string/string associations. This object is useful to store e.g.
-   informations retrieved from a configuration file (ini files).
-*/
-/*--------------------------------------------------------------------------*/
-
-/*
-	$Id: dictionary.h,v 1.12 2007-11-23 21:37:00 ndevilla Exp $
-	$Author: ndevilla $
-	$Date: 2007-11-23 21:37:00 $
-	$Revision: 1.12 $
-*/
-
-#ifndef _DICTIONARY_H_
-#define _DICTIONARY_H_
-
-/*---------------------------------------------------------------------------
-   								Includes
- ---------------------------------------------------------------------------*/
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-
-/*---------------------------------------------------------------------------
-   								New types
- ---------------------------------------------------------------------------*/
-
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief	Dictionary object
-
-  This object contains a list of string/string associations. Each
-  association is identified by a unique string key. Looking up values
-  in the dictionary is speeded up by the use of a (hopefully collision-free)
-  hash function.
- */
-/*-------------------------------------------------------------------------*/
-typedef struct _dictionary_ {
-	int				n ;		/** Number of entries in dictionary */
-	int				size ;	/** Storage size */
-	char 		**	val ;	/** List of string values */
-	char 		**  key ;	/** List of string keys */
-	unsigned	 *	hash ;	/** List of hash values for keys */
-} dictionary ;
-
-
-/*---------------------------------------------------------------------------
-  							Function prototypes
- ---------------------------------------------------------------------------*/
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Compute the hash key for a string.
-  @param    key     Character string to use for key.
-  @return   1 unsigned int on at least 32 bits.
-
-  This hash function has been taken from an Article in Dr Dobbs Journal.
-  This is normally a collision-free function, distributing keys evenly.
-  The key is stored anyway in the struct so that collision can be avoided
-  by comparing the key itself in last resort.
- */
-/*--------------------------------------------------------------------------*/
-unsigned dictionary_hash(char * key);
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Create a new dictionary object.
-  @param    size    Optional initial size of the dictionary.
-  @return   1 newly allocated dictionary objet.
-
-  This function allocates a new dictionary object of given size and returns
-  it. If you do not know in advance (roughly) the number of entries in the
-  dictionary, give size=0.
- */
-/*--------------------------------------------------------------------------*/
-dictionary * dictionary_new(int size);
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Delete a dictionary object
-  @param    d   dictionary object to deallocate.
-  @return   void
-
-  Deallocate a dictionary object and all memory associated to it.
- */
-/*--------------------------------------------------------------------------*/
-void dictionary_del(dictionary * vd);
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Get a value from a dictionary.
-  @param    d       dictionary object to search.
-  @param    key     Key to look for in the dictionary.
-  @param    def     Default value to return if key not found.
-  @return   1 pointer to internally allocated character string.
-
-  This function locates a key in a dictionary and returns a pointer to its
-  value, or the passed 'def' pointer if no such key can be found in
-  dictionary. The returned character pointer points to data internal to the
-  dictionary object, you should not try to free it or modify it.
- */
-/*--------------------------------------------------------------------------*/
-char * dictionary_get(dictionary * d, char * key, char * def);
-
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Set a value in a dictionary.
-  @param    d       dictionary object to modify.
-  @param    key     Key to modify or add.
-  @param    val     Value to add.
-  @return   int     0 if Ok, anything else otherwise
-
-  If the given key is found in the dictionary, the associated value is
-  replaced by the provided one. If the key cannot be found in the
-  dictionary, it is added to it.
-
-  It is Ok to provide a NULL value for val, but NULL values for the dictionary
-  or the key are considered as errors: the function will return immediately
-  in such a case.
-
-  Notice that if you dictionary_set a variable to NULL, a call to
-  dictionary_get will return a NULL value: the variable will be found, and
-  its value (NULL) is returned. In other words, setting the variable
-  content to NULL is equivalent to deleting the variable from the
-  dictionary. It is not possible (in this implementation) to have a key in
-  the dictionary without value.
-
-  This function returns non-zero in case of failure.
- */
-/*--------------------------------------------------------------------------*/
-int dictionary_set(dictionary * vd, char * key, char * val);
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Delete a key in a dictionary
-  @param    d       dictionary object to modify.
-  @param    key     Key to remove.
-  @return   void
-
-  This function deletes a key in a dictionary. Nothing is done if the
-  key cannot be found.
- */
-/*--------------------------------------------------------------------------*/
-void dictionary_unset(dictionary * d, char * key);
-
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Dump a dictionary to an opened file pointer.
-  @param    d   Dictionary to dump
-  @param    f   Opened file pointer.
-  @return   void
-
-  Dumps a dictionary onto an opened file pointer. Key pairs are printed out
-  as @c [Key]=[Value], one per line. It is Ok to provide stdout or stderr as
-  output file pointers.
- */
-/*--------------------------------------------------------------------------*/
-void dictionary_dump(dictionary * d, FILE * out);
-
-#endif
diff --git a/ubi-utils/src/libiniparser.c b/ubi-utils/src/libiniparser.c
deleted file mode 100644
index 3bea51e..0000000
--- a/ubi-utils/src/libiniparser.c
+++ /dev/null
@@ -1,646 +0,0 @@
-
-/*-------------------------------------------------------------------------*/
-/**
-   @file    iniparser.c
-   @author  N. Devillard
-   @date    Sep 2007
-   @version 3.0
-   @brief   Parser for ini files.
-*/
-/*--------------------------------------------------------------------------*/
-/*
-    $Id: iniparser.c,v 2.18 2008-01-03 18:35:39 ndevilla Exp $
-    $Revision: 2.18 $
-    $Date: 2008-01-03 18:35:39 $
-*/
-/*---------------------------- Includes ------------------------------------*/
-#include <ctype.h>
-#include <libiniparser.h>
-
-/*---------------------------- Defines -------------------------------------*/
-#define ASCIILINESZ         (1024)
-#define INI_INVALID_KEY     ((char*)-1)
-
-/*---------------------------------------------------------------------------
-                        Private to this module
- ---------------------------------------------------------------------------*/
-/**
- * This enum stores the status for each parsed line (internal use only).
- */
-typedef enum _line_status_ {
-    LINE_UNPROCESSED,
-    LINE_ERROR,
-    LINE_EMPTY,
-    LINE_COMMENT,
-    LINE_SECTION,
-    LINE_VALUE
-} line_status ;
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief	Convert a string to lowercase.
-  @param	s	String to convert.
-  @return	ptr to statically allocated string.
-
-  This function returns a pointer to a statically allocated string
-  containing a lowercased version of the input string. Do not free
-  or modify the returned string! Since the returned string is statically
-  allocated, it will be modified at each function call (not re-entrant).
- */
-/*--------------------------------------------------------------------------*/
-static char * strlwc(const char * s)
-{
-    static char l[ASCIILINESZ+1];
-    int i ;
-
-    if (s==NULL) return NULL ;
-    memset(l, 0, ASCIILINESZ+1);
-    i=0 ;
-    while (s[i] && i<ASCIILINESZ) {
-        l[i] = (char)tolower((int)s[i]);
-        i++ ;
-    }
-    l[ASCIILINESZ]=(char)0;
-    return l ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief	Remove blanks at the beginning and the end of a string.
-  @param	s	String to parse.
-  @return	ptr to statically allocated string.
-
-  This function returns a pointer to a statically allocated string,
-  which is identical to the input string, except that all blank
-  characters at the end and the beg. of the string have been removed.
-  Do not free or modify the returned string! Since the returned string
-  is statically allocated, it will be modified at each function call
-  (not re-entrant).
- */
-/*--------------------------------------------------------------------------*/
-static char * strstrip(char * s)
-{
-    static char l[ASCIILINESZ+1];
-	char * last ;
-	
-    if (s==NULL) return NULL ;
-    
-	while (isspace((int)*s) && *s) s++;
-	memset(l, 0, ASCIILINESZ+1);
-	strcpy(l, s);
-	last = l + strlen(l);
-	while (last > l) {
-		if (!isspace((int)*(last-1)))
-			break ;
-		last -- ;
-	}
-	*last = (char)0;
-	return (char*)l ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Get number of sections in a dictionary
-  @param    d   Dictionary to examine
-  @return   int Number of sections found in dictionary
-
-  This function returns the number of sections found in a dictionary.
-  The test to recognize sections is done on the string stored in the
-  dictionary: a section name is given as "section" whereas a key is
-  stored as "section:key", thus the test looks for entries that do not
-  contain a colon.
-
-  This clearly fails in the case a section name contains a colon, but
-  this should simply be avoided.
-
-  This function returns -1 in case of error.
- */
-/*--------------------------------------------------------------------------*/
-int iniparser_getnsec(dictionary * d)
-{
-    int i ;
-    int nsec ;
-
-    if (d==NULL) return -1 ;
-    nsec=0 ;
-    for (i=0 ; i<d->size ; i++) {
-        if (d->key[i]==NULL)
-            continue ;
-        if (strchr(d->key[i], ':')==NULL) {
-            nsec ++ ;
-        }
-    }
-    return nsec ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Get name for section n in a dictionary.
-  @param    d   Dictionary to examine
-  @param    n   Section number (from 0 to nsec-1).
-  @return   Pointer to char string
-
-  This function locates the n-th section in a dictionary and returns
-  its name as a pointer to a string statically allocated inside the
-  dictionary. Do not free or modify the returned string!
-
-  This function returns NULL in case of error.
- */
-/*--------------------------------------------------------------------------*/
-char * iniparser_getsecname(dictionary * d, int n)
-{
-    int i ;
-    int foundsec ;
-
-    if (d==NULL || n<0) return NULL ;
-    foundsec=0 ;
-    for (i=0 ; i<d->size ; i++) {
-        if (d->key[i]==NULL)
-            continue ;
-        if (strchr(d->key[i], ':')==NULL) {
-            foundsec++ ;
-            if (foundsec>n)
-                break ;
-        }
-    }
-    if (foundsec<=n) {
-        return NULL ;
-    }
-    return d->key[i] ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Dump a dictionary to an opened file pointer.
-  @param    d   Dictionary to dump.
-  @param    f   Opened file pointer to dump to.
-  @return   void
-
-  This function prints out the contents of a dictionary, one element by
-  line, onto the provided file pointer. It is OK to specify @c stderr
-  or @c stdout as output files. This function is meant for debugging
-  purposes mostly.
- */
-/*--------------------------------------------------------------------------*/
-void iniparser_dump(dictionary * d, FILE * f)
-{
-    int     i ;
-
-    if (d==NULL || f==NULL) return ;
-    for (i=0 ; i<d->size ; i++) {
-        if (d->key[i]==NULL)
-            continue ;
-        if (d->val[i]!=NULL) {
-            fprintf(f, "[%s]=[%s]\n", d->key[i], d->val[i]);
-        } else {
-            fprintf(f, "[%s]=UNDEF\n", d->key[i]);
-        }
-    }
-    return ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Save a dictionary to a loadable ini file
-  @param    d   Dictionary to dump
-  @param    f   Opened file pointer to dump to
-  @return   void
-
-  This function dumps a given dictionary into a loadable ini file.
-  It is Ok to specify @c stderr or @c stdout as output files.
- */
-/*--------------------------------------------------------------------------*/
-void iniparser_dump_ini(dictionary * d, FILE * f)
-{
-    int     i, j ;
-    char    keym[ASCIILINESZ+1];
-    int     nsec ;
-    char *  secname ;
-    int     seclen ;
-
-    if (d==NULL || f==NULL) return ;
-
-    nsec = iniparser_getnsec(d);
-    if (nsec<1) {
-        /* No section in file: dump all keys as they are */
-        for (i=0 ; i<d->size ; i++) {
-            if (d->key[i]==NULL)
-                continue ;
-            fprintf(f, "%s = %s\n", d->key[i], d->val[i]);
-        }
-        return ;
-    }
-    for (i=0 ; i<nsec ; i++) {
-        secname = iniparser_getsecname(d, i) ;
-        seclen  = (int)strlen(secname);
-        fprintf(f, "\n[%s]\n", secname);
-        sprintf(keym, "%s:", secname);
-        for (j=0 ; j<d->size ; j++) {
-            if (d->key[j]==NULL)
-                continue ;
-            if (!strncmp(d->key[j], keym, seclen+1)) {
-                fprintf(f,
-                        "%-30s = %s\n",
-                        d->key[j]+seclen+1,
-                        d->val[j] ? d->val[j] : "");
-            }
-        }
-    }
-    fprintf(f, "\n");
-    return ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Get the string associated to a key
-  @param    d       Dictionary to search
-  @param    key     Key string to look for
-  @param    def     Default value to return if key not found.
-  @return   pointer to statically allocated character string
-
-  This function queries a dictionary for a key. A key as read from an
-  ini file is given as "section:key". If the key cannot be found,
-  the pointer passed as 'def' is returned.
-  The returned char pointer is pointing to a string allocated in
-  the dictionary, do not free or modify it.
- */
-/*--------------------------------------------------------------------------*/
-char * iniparser_getstring(dictionary * d, const char * key, char * def)
-{
-    char * lc_key ;
-    char * sval ;
-
-    if (d==NULL || key==NULL)
-        return def ;
-
-    lc_key = strlwc(key);
-    sval = dictionary_get(d, lc_key, def);
-    return sval ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Get the string associated to a key, convert to an int
-  @param    d Dictionary to search
-  @param    key Key string to look for
-  @param    notfound Value to return in case of error
-  @return   integer
-
-  This function queries a dictionary for a key. A key as read from an
-  ini file is given as "section:key". If the key cannot be found,
-  the notfound value is returned.
-
-  Supported values for integers include the usual C notation
-  so decimal, octal (starting with 0) and hexadecimal (starting with 0x)
-  are supported. Examples:
-
-  "42"      ->  42
-  "042"     ->  34 (octal -> decimal)
-  "0x42"    ->  66 (hexa  -> decimal)
-
-  Warning: the conversion may overflow in various ways. Conversion is
-  totally outsourced to strtol(), see the associated man page for overflow
-  handling.
-
-  Credits: Thanks to A. Becker for suggesting strtol()
- */
-/*--------------------------------------------------------------------------*/
-int iniparser_getint(dictionary * d, const char * key, int notfound)
-{
-    char    *   str ;
-
-    str = iniparser_getstring(d, key, INI_INVALID_KEY);
-    if (str==INI_INVALID_KEY) return notfound ;
-    return (int)strtol(str, NULL, 0);
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Get the string associated to a key, convert to a double
-  @param    d Dictionary to search
-  @param    key Key string to look for
-  @param    notfound Value to return in case of error
-  @return   double
-
-  This function queries a dictionary for a key. A key as read from an
-  ini file is given as "section:key". If the key cannot be found,
-  the notfound value is returned.
- */
-/*--------------------------------------------------------------------------*/
-double iniparser_getdouble(dictionary * d, char * key, double notfound)
-{
-    char    *   str ;
-
-    str = iniparser_getstring(d, key, INI_INVALID_KEY);
-    if (str==INI_INVALID_KEY) return notfound ;
-    return atof(str);
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Get the string associated to a key, convert to a boolean
-  @param    d Dictionary to search
-  @param    key Key string to look for
-  @param    notfound Value to return in case of error
-  @return   integer
-
-  This function queries a dictionary for a key. A key as read from an
-  ini file is given as "section:key". If the key cannot be found,
-  the notfound value is returned.
-
-  A true boolean is found if one of the following is matched:
-
-  - A string starting with 'y'
-  - A string starting with 'Y'
-  - A string starting with 't'
-  - A string starting with 'T'
-  - A string starting with '1'
-
-  A false boolean is found if one of the following is matched:
-
-  - A string starting with 'n'
-  - A string starting with 'N'
-  - A string starting with 'f'
-  - A string starting with 'F'
-  - A string starting with '0'
-
-  The notfound value returned if no boolean is identified, does not
-  necessarily have to be 0 or 1.
- */
-/*--------------------------------------------------------------------------*/
-int iniparser_getboolean(dictionary * d, const char * key, int notfound)
-{
-    char    *   c ;
-    int         ret ;
-
-    c = iniparser_getstring(d, key, INI_INVALID_KEY);
-    if (c==INI_INVALID_KEY) return notfound ;
-    if (c[0]=='y' || c[0]=='Y' || c[0]=='1' || c[0]=='t' || c[0]=='T') {
-        ret = 1 ;
-    } else if (c[0]=='n' || c[0]=='N' || c[0]=='0' || c[0]=='f' || c[0]=='F') {
-        ret = 0 ;
-    } else {
-        ret = notfound ;
-    }
-    return ret;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Finds out if a given entry exists in a dictionary
-  @param    ini     Dictionary to search
-  @param    entry   Name of the entry to look for
-  @return   integer 1 if entry exists, 0 otherwise
-
-  Finds out if a given entry exists in the dictionary. Since sections
-  are stored as keys with NULL associated values, this is the only way
-  of querying for the presence of sections in a dictionary.
- */
-/*--------------------------------------------------------------------------*/
-int iniparser_find_entry(
-    dictionary  *   ini,
-    char        *   entry
-)
-{
-    int found=0 ;
-    if (iniparser_getstring(ini, entry, INI_INVALID_KEY)!=INI_INVALID_KEY) {
-        found = 1 ;
-    }
-    return found ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Set an entry in a dictionary.
-  @param    ini     Dictionary to modify.
-  @param    entry   Entry to modify (entry name)
-  @param    val     New value to associate to the entry.
-  @return   int 0 if Ok, -1 otherwise.
-
-  If the given entry can be found in the dictionary, it is modified to
-  contain the provided value. If it cannot be found, -1 is returned.
-  It is Ok to set val to NULL.
- */
-/*--------------------------------------------------------------------------*/
-int iniparser_set(dictionary * ini, char * entry, char * val)
-{
-    return dictionary_set(ini, strlwc(entry), val) ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Delete an entry in a dictionary
-  @param    ini     Dictionary to modify
-  @param    entry   Entry to delete (entry name)
-  @return   void
-
-  If the given entry can be found, it is deleted from the dictionary.
- */
-/*--------------------------------------------------------------------------*/
-void iniparser_unset(dictionary * ini, char * entry)
-{
-    dictionary_unset(ini, strlwc(entry));
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief	Load a single line from an INI file
-  @param    input_line  Input line, may be concatenated multi-line input
-  @param    section     Output space to store section
-  @param    key         Output space to store key
-  @param    value       Output space to store value
-  @return   line_status value
- */
-/*--------------------------------------------------------------------------*/
-static line_status iniparser_line(
-    char * input_line,
-    char * section,
-    char * key,
-    char * value)
-{   
-    line_status sta ;
-    char        line[ASCIILINESZ+1];
-    int         len ;
-
-    strcpy(line, strstrip(input_line));
-    len = (int)strlen(line);
-
-    sta = LINE_UNPROCESSED ;
-    if (len<1) {
-        /* Empty line */
-        sta = LINE_EMPTY ;
-    } else if (line[0]=='#') {
-        /* Comment line */
-        sta = LINE_COMMENT ; 
-    } else if (line[0]=='[' && line[len-1]==']') {
-        /* Section name */
-        sscanf(line, "[%[^]]", section);
-        strcpy(section, strstrip(section));
-        strcpy(section, strlwc(section));
-        sta = LINE_SECTION ;
-    } else if (sscanf (line, "%[^=] = \"%[^\"]\"", key, value) == 2
-           ||  sscanf (line, "%[^=] = '%[^\']'",   key, value) == 2
-           ||  sscanf (line, "%[^=] = %[^;#]",     key, value) == 2) {
-        /* Usual key=value, with or without comments */
-        strcpy(key, strstrip(key));
-        strcpy(key, strlwc(key));
-        strcpy(value, strstrip(value));
-        /*
-         * sscanf cannot handle '' or "" as empty values
-         * this is done here
-         */
-        if (!strcmp(value, "\"\"") || (!strcmp(value, "''"))) {
-            value[0]=0 ;
-        }
-        sta = LINE_VALUE ;
-    } else if (sscanf(line, "%[^=] = %[;#]", key, value)==2
-           ||  sscanf(line, "%[^=] %[=]", key, value) == 2) {
-        /*
-         * Special cases:
-         * key=
-         * key=;
-         * key=#
-         */
-        strcpy(key, strstrip(key));
-        strcpy(key, strlwc(key));
-        value[0]=0 ;
-        sta = LINE_VALUE ;
-    } else {
-        /* Generate syntax error */
-        sta = LINE_ERROR ;
-    }
-    return sta ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Parse an ini file and return an allocated dictionary object
-  @param    ininame Name of the ini file to read.
-  @return   Pointer to newly allocated dictionary
-
-  This is the parser for ini files. This function is called, providing
-  the name of the file to be read. It returns a dictionary object that
-  should not be accessed directly, but through accessor functions
-  instead.
-
-  The returned dictionary must be freed using iniparser_freedict().
- */
-/*--------------------------------------------------------------------------*/
-dictionary * iniparser_load(const char * ininame)
-{
-    FILE * in ;
-
-    char line    [ASCIILINESZ+1] ;
-    char section [ASCIILINESZ+1] ;
-    char key     [ASCIILINESZ+1] ;
-    char tmp     [ASCIILINESZ+1] ;
-    char val     [ASCIILINESZ+1] ;
-
-    int  last=0 ;
-    int  len ;
-    int  lineno=0 ;
-    int  errs=0;
-
-    dictionary * dict ;
-
-    if ((in=fopen(ininame, "r"))==NULL) {
-        fprintf(stderr, "iniparser: cannot open %s\n", ininame);
-        return NULL ;
-    }
-
-    dict = dictionary_new(0) ;
-    if (!dict) {
-        fclose(in);
-        return NULL ;
-    }
-
-    memset(line,    0, ASCIILINESZ);
-    memset(section, 0, ASCIILINESZ);
-    memset(key,     0, ASCIILINESZ);
-    memset(val,     0, ASCIILINESZ);
-    last=0 ;
-
-    while (fgets(line+last, ASCIILINESZ-last, in)!=NULL) {
-        lineno++ ;
-        len = (int)strlen(line)-1;
-        /* Safety check against buffer overflows */
-        if (line[len]!='\n') {
-            fprintf(stderr,
-                    "iniparser: input line too long in %s (%d)\n",
-                    ininame,
-                    lineno);
-            dictionary_del(dict);
-            fclose(in);
-            return NULL ;
-        }
-        /* Get rid of \n and spaces at end of line */
-        while ((len>=0) &&
-                ((line[len]=='\n') || (isspace(line[len])))) {
-            line[len]=0 ;
-            len-- ;
-        }
-        /* Detect multi-line */
-        if (line[len]=='\\') {
-            /* Multi-line value */
-            last=len ;
-            continue ;
-        } else {
-            last=0 ;
-        }
-        switch (iniparser_line(line, section, key, val)) {
-            case LINE_EMPTY:
-            case LINE_COMMENT:
-            break ;
-
-            case LINE_SECTION:
-            errs = dictionary_set(dict, section, NULL);
-            break ;
-
-            case LINE_VALUE:
-            sprintf(tmp, "%s:%s", section, key);
-            errs = dictionary_set(dict, tmp, val) ;
-            break ;
-
-            case LINE_ERROR:
-            fprintf(stderr, "iniparser: syntax error in %s (%d):\n",
-                    ininame,
-                    lineno);
-            fprintf(stderr, "-> %s\n", line);
-            errs++ ;
-            break;
-
-            default:
-            break ;
-        }
-        memset(line, 0, ASCIILINESZ);
-        last=0;
-        if (errs<0) {
-            fprintf(stderr, "iniparser: memory allocation failure\n");
-            break ;
-        }
-    }
-    if (errs) {
-        dictionary_del(dict);
-        dict = NULL ;
-    }
-    fclose(in);
-    return dict ;
-}
-
-/*-------------------------------------------------------------------------*/
-/**
-  @brief    Free all memory associated to an ini dictionary
-  @param    d Dictionary to free
-  @return   void
-
-  Free all memory associated to an ini dictionary.
-  It is mandatory to call this function before the dictionary object
-  gets out of the current context.
- */
-/*--------------------------------------------------------------------------*/
-void iniparser_freedict(dictionary * d)
-{
-    dictionary_del(d);
-}
-
-/* vim: set ts=4 et sw=4 tw=75 */
diff --git a/ubi-utils/src/libscan.c b/ubi-utils/src/libscan.c
deleted file mode 100644
index dc47a89..0000000
--- a/ubi-utils/src/libscan.c
+++ /dev/null
@@ -1,225 +0,0 @@
-/*
- * Copyright (C) 2008 Nokia Corporation
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- *
- * Author: Artem Bityutskiy
- *
- * UBI scanning library.
- */
-
-#define PROGRAM_NAME "libscan"
-
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <stdint.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <stdlib.h>
-
-#include <mtd_swab.h>
-#include <mtd/ubi-media.h>
-#include <mtd/mtd-user.h>
-#include <libmtd.h>
-#include <libscan.h>
-#include <crc32.h>
-#include "common.h"
-
-static int all_ff(const void *buf, int len)
-{
-	int i;
-	const uint8_t *p = buf;
-
-	for (i = 0; i < len; i++)
-		if (p[i] != 0xFF)
-			return 0;
-	return 1;
-}
-
-int ubi_scan(struct mtd_dev_info *mtd, int fd, struct ubi_scan_info **info,
-	     int verbose)
-{
-	int eb, v = (verbose == 2), pr = (verbose == 1);
-	struct ubi_scan_info *si;
-	unsigned long long sum = 0;
-
-	si = calloc(1, sizeof(struct ubi_scan_info));
-	if (!si)
-		return sys_errmsg("cannot allocate %zd bytes of memory",
-				  sizeof(struct ubi_scan_info));
-
-	si->ec = calloc(mtd->eb_cnt, sizeof(uint32_t));
-	if (!si->ec) {
-		sys_errmsg("cannot allocate %zd bytes of memory",
-			   sizeof(struct ubi_scan_info));
-		goto out_si;
-	}
-
-	si->vid_hdr_offs = si->data_offs = -1;
-
-	verbose(v, "start scanning eraseblocks 0-%d", mtd->eb_cnt);
-	for (eb = 0; eb < mtd->eb_cnt; eb++) {
-		int ret;
-		uint32_t crc;
-		struct ubi_ec_hdr ech;
-		unsigned long long ec;
-
-		if (v) {
-			normsg_cont("scanning eraseblock %d", eb);
-			fflush(stdout);
-		}
-		if (pr) {
-			printf("\r" PROGRAM_NAME ": scanning eraseblock %d -- %2lld %% complete  ",
-			       eb, (long long)(eb + 1) * 100 / mtd->eb_cnt);
-			fflush(stdout);
-		}
-
-		ret = mtd_is_bad(mtd, fd, eb);
-		if (ret == -1)
-			goto out_ec;
-		if (ret) {
-			si->bad_cnt += 1;
-			si->ec[eb] = EB_BAD;
-			if (v)
-				printf(": bad\n");
-			continue;
-		}
-
-		ret = mtd_read(mtd, fd, eb, 0, &ech, sizeof(struct ubi_ec_hdr));
-		if (ret < 0)
-			goto out_ec;
-
-		if (be32_to_cpu(ech.magic) != UBI_EC_HDR_MAGIC) {
-			if (all_ff(&ech, sizeof(struct ubi_ec_hdr))) {
-				si->empty_cnt += 1;
-				si->ec[eb] = EB_EMPTY;
-				if (v)
-					printf(": empty\n");
-			} else {
-				si->alien_cnt += 1;
-				si->ec[eb] = EB_ALIEN;
-				if (v)
-					printf(": alien\n");
-			}
-			continue;
-		}
-
-		crc = mtd_crc32(UBI_CRC32_INIT, &ech, UBI_EC_HDR_SIZE_CRC);
-		if (be32_to_cpu(ech.hdr_crc) != crc) {
-			si->corrupted_cnt += 1;
-			si->ec[eb] = EB_CORRUPTED;
-			if (v)
-				printf(": bad CRC %#08x, should be %#08x\n",
-				       crc, be32_to_cpu(ech.hdr_crc));
-			continue;
-		}
-
-		ec = be64_to_cpu(ech.ec);
-		if (ec > EC_MAX) {
-			if (pr)
-				printf("\n");
-			errmsg("erase counter in EB %d is %llu, while this "
-			       "program expects them to be less than %u",
-			       eb, ec, EC_MAX);
-			goto out_ec;
-		}
-
-		if (si->vid_hdr_offs == -1) {
-			si->vid_hdr_offs = be32_to_cpu(ech.vid_hdr_offset);
-			si->data_offs = be32_to_cpu(ech.data_offset);
-			if (si->data_offs % mtd->min_io_size) {
-				if (pr)
-					printf("\n");
-				if (v)
-					printf(": corrupted because of the below\n");
-				warnmsg("bad data offset %d at eraseblock %d (n"
-					"of multiple of min. I/O unit size %d)",
-					si->data_offs, eb, mtd->min_io_size);
-				warnmsg("treat eraseblock %d as corrupted", eb);
-				si->corrupted_cnt += 1;
-				si->ec[eb] = EB_CORRUPTED;
-				continue;
-
-			}
-		} else {
-			if ((int)be32_to_cpu(ech.vid_hdr_offset) != si->vid_hdr_offs) {
-				if (pr)
-					printf("\n");
-				if (v)
-					printf(": corrupted because of the below\n");
-				warnmsg("inconsistent VID header offset: was "
-					"%d, but is %d in eraseblock %d",
-					si->vid_hdr_offs,
-					be32_to_cpu(ech.vid_hdr_offset), eb);
-				warnmsg("treat eraseblock %d as corrupted", eb);
-				si->corrupted_cnt += 1;
-				si->ec[eb] = EB_CORRUPTED;
-				continue;
-			}
-			if ((int)be32_to_cpu(ech.data_offset) != si->data_offs) {
-				if (pr)
-					printf("\n");
-				if (v)
-					printf(": corrupted because of the below\n");
-				warnmsg("inconsistent data offset: was %d, but"
-					" is %d in eraseblock %d",
-					si->data_offs,
-					be32_to_cpu(ech.data_offset), eb);
-				warnmsg("treat eraseblock %d as corrupted", eb);
-				si->corrupted_cnt += 1;
-				si->ec[eb] = EB_CORRUPTED;
-				continue;
-			}
-		}
-
-		si->ok_cnt += 1;
-		si->ec[eb] = ec;
-		if (v)
-			printf(": OK, erase counter %u\n", si->ec[eb]);
-	}
-
-	if (si->ok_cnt != 0) {
-		/* Calculate mean erase counter */
-		for (eb = 0; eb < mtd->eb_cnt; eb++) {
-			if (si->ec[eb] > EC_MAX)
-				continue;
-			sum += si->ec[eb];
-		}
-		si->mean_ec = sum / si->ok_cnt;
-	}
-
-	si->good_cnt = mtd->eb_cnt - si->bad_cnt;
-	verbose(v, "finished, mean EC %lld, %d OK, %d corrupted, %d empty, %d "
-		"alien, bad %d", si->mean_ec, si->ok_cnt, si->corrupted_cnt,
-		si->empty_cnt, si->alien_cnt, si->bad_cnt);
-
-	*info = si;
-	if (pr)
-		printf("\n");
-	return 0;
-
-out_ec:
-	free(si->ec);
-out_si:
-	free(si);
-	*info = NULL;
-	return -1;
-}
-
-void ubi_scan_free(struct ubi_scan_info *si)
-{
-	free(si->ec);
-	free(si);
-}
diff --git a/ubi-utils/src/libubi.c b/ubi-utils/src/libubi.c
deleted file mode 100644
index 4d5f316..0000000
--- a/ubi-utils/src/libubi.c
+++ /dev/null
@@ -1,1372 +0,0 @@
-/*
- * Copyright (c) International Business Machines Corp., 2006
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- *
- * Author: Artem Bityutskiy
- *
- * UBI (Unsorted Block Images) library.
- */
-
-#define PROGRAM_NAME "libubi"
-
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <fcntl.h>
-#include <dirent.h>
-#include <unistd.h>
-#include <limits.h>
-#include <sys/ioctl.h>
-#include <sys/stat.h>
-#include <sys/types.h>
-#include <libubi.h>
-#include "libubi_int.h"
-#include "common.h"
-
-/**
- * mkpath - compose full path from 2 given components.
- * @path: the first component
- * @name: the second component
- *
- * This function returns the resulting path in case of success and %NULL in
- * case of failure.
- */
-static char *mkpath(const char *path, const char *name)
-{
-	char *n;
-	int len1 = strlen(path);
-	int len2 = strlen(name);
-
-	n = malloc(len1 + len2 + 2);
-	if (!n) {
-		sys_errmsg("cannot allocate %d bytes", len1 + len2 + 2);
-		return NULL;
-	}
-
-	memcpy(n, path, len1);
-	if (n[len1 - 1] != '/')
-		n[len1++] = '/';
-
-	memcpy(n + len1, name, len2 + 1);
-	return n;
-}
-
-/**
- * read_positive_ll - read a positive 'long long' value from a file.
- * @file: the file to read from
- * @value: the result is stored here
- *
- * This function reads file @file and interprets its contents as a positive
- * 'long long' integer. If this is not true, it fails with %EINVAL error code.
- * Returns %0 in case of success and %-1 in case of failure.
- */
-static int read_positive_ll(const char *file, long long *value)
-{
-	int fd, rd;
-	char buf[50];
-
-	fd = open(file, O_RDONLY);
-	if (fd == -1)
-		return -1;
-
-	rd = read(fd, buf, sizeof(buf));
-	if (rd == -1) {
-		sys_errmsg("cannot read \"%s\"", file);
-		goto out_error;
-	}
-	if (rd == sizeof(buf)) {
-		errmsg("contents of \"%s\" is too long", file);
-		errno = EINVAL;
-		goto out_error;
-	}
-	buf[rd] = '\0';
-
-	if (sscanf(buf, "%lld\n", value) != 1) {
-		errmsg("cannot read integer from \"%s\"\n", file);
-		errno = EINVAL;
-		goto out_error;
-	}
-
-	if (*value < 0) {
-		errmsg("negative value %lld in \"%s\"", *value, file);
-		errno = EINVAL;
-		goto out_error;
-	}
-
-	if (close(fd))
-		return sys_errmsg("close failed on \"%s\"", file);
-
-	return 0;
-
-out_error:
-	close(fd);
-	return -1;
-}
-
-/**
- * read_positive_int - read a positive 'int' value from a file.
- * @file: the file to read from
- * @value: the result is stored here
- *
- * This function is the same as 'read_positive_ll()', but it reads an 'int'
- * value, not 'long long'.
- */
-static int read_positive_int(const char *file, int *value)
-{
-	long long res;
-
-	if (read_positive_ll(file, &res))
-		return -1;
-
-	/* Make sure the value is not too big */
-	if (res > INT_MAX) {
-		errmsg("value %lld read from file \"%s\" is out of range",
-		       res, file);
-		errno = EINVAL;
-		return -1;
-	}
-
-	*value = res;
-	return 0;
-}
-
-/**
- * read_data - read data from a file.
- * @file: the file to read from
- * @buf: the buffer to read to
- * @buf_len: buffer length
- *
- * This function returns number of read bytes in case of success and %-1 in
- * case of failure. Note, if the file contains more then @buf_len bytes of
- * date, this function fails with %EINVAL error code.
- */
-static int read_data(const char *file, void *buf, int buf_len)
-{
-	int fd, rd, tmp, tmp1;
-
-	fd = open(file, O_RDONLY);
-	if (fd == -1)
-		return -1;
-
-	rd = read(fd, buf, buf_len);
-	if (rd == -1) {
-		sys_errmsg("cannot read \"%s\"", file);
-		goto out_error;
-	}
-
-	if (rd == buf_len) {
-		errmsg("contents of \"%s\" is too long", file);
-		errno = EINVAL;
-		goto out_error;
-	}
-
-	((char *)buf)[rd] = '\0';
-
-	/* Make sure all data is read */
-	tmp1 = read(fd, &tmp, 1);
-	if (tmp1 == 1) {
-		sys_errmsg("cannot read \"%s\"", file);
-		goto out_error;
-	}
-	if (tmp1) {
-		errmsg("file \"%s\" contains too much data (> %d bytes)",
-		       file, buf_len);
-		errno = EINVAL;
-		goto out_error;
-	}
-
-	if (close(fd)) {
-		sys_errmsg("close failed on \"%s\"", file);
-		return -1;
-	}
-
-	return rd;
-
-out_error:
-	close(fd);
-	return -1;
-}
-
-/**
- * read_major - read major and minor numbers from a file.
- * @file: name of the file to read from
- * @major: major number is returned here
- * @minor: minor number is returned here
- *
- * This function returns % in case of succes, and %-1 in case of failure.
- */
-static int read_major(const char *file, int *major, int *minor)
-{
-	int ret;
-	char buf[50];
-
-	ret = read_data(file, buf, 50);
-	if (ret < 0)
-		return ret;
-
-	ret = sscanf(buf, "%d:%d\n", major, minor);
-	if (ret != 2) {
-		errno = EINVAL;
-		return errmsg("\"%s\" does not have major:minor format", file);
-	}
-
-	if (*major < 0 || *minor < 0) {
-		errno = EINVAL;
-		return errmsg("bad major:minor %d:%d in \"%s\"",
-			      *major, *minor, file);
-	}
-
-	return 0;
-}
-
-/**
- * dev_read_int - read a positive 'int' value from an UBI device sysfs file.
- * @patt: file pattern to read from
- * @dev_num: UBI device number
- * @value: the result is stored here
- *
- * This function returns %0 in case of success and %-1 in case of failure.
- */
-static int dev_read_int(const char *patt, int dev_num, int *value)
-{
-	char file[strlen(patt) + 50];
-
-	sprintf(file, patt, dev_num);
-	return read_positive_int(file, value);
-}
-
-/**
- * vol_read_int - read a positive 'int' value from an UBI volume sysfs file.
- * @patt: file pattern to read from
- * @dev_num: UBI device number
- * @vol_id: volume ID
- * @value: the result is stored here
- *
- * This function returns %0 in case of success and %-1 in case of failure.
- */
-static int vol_read_int(const char *patt, int dev_num, int vol_id, int *value)
-{
-	char file[strlen(patt) + 100];
-
-	sprintf(file, patt, dev_num, vol_id);
-	return read_positive_int(file, value);
-}
-
-/**
- * dev_read_ll - read a positive 'long long' value from an UBI device sysfs file.
- * @patt: file pattern to read from
- * @dev_num: UBI device number
- * @value: the result is stored here
- *
- * This function returns %0 in case of success and %-1 in case of failure.
- */
-static int dev_read_ll(const char *patt, int dev_num, long long *value)
-{
-	char file[strlen(patt) + 50];
-
-	sprintf(file, patt, dev_num);
-	return read_positive_ll(file, value);
-}
-
-/**
- * vol_read_ll - read a positive 'long long' value from an UBI volume sysfs file.
- * @patt: file pattern to read from
- * @dev_num: UBI device number
- * @vol_id: volume ID
- * @value: the result is stored here
- *
- * This function returns %0 in case of success and %-1 in case of failure.
- */
-static int vol_read_ll(const char *patt, int dev_num, int vol_id,
-		       long long *value)
-{
-	char file[strlen(patt) + 100];
-
-	sprintf(file, patt, dev_num, vol_id);
-	return read_positive_ll(file, value);
-}
-
-/**
- * vol_read_data - read data from an UBI volume's sysfs file.
- * @patt: file pattern to read from
- * @dev_num: UBI device number
- * @vol_id: volume ID
- * @buf: buffer to read to
- * @buf_len: buffer length
- *
- * This function returns number of read bytes in case of success and %-1 in
- * case of failure.
- */
-static int vol_read_data(const char *patt, int dev_num, int vol_id, void *buf,
-			 int buf_len)
-{
-	char file[strlen(patt) + 100];
-
-	sprintf(file, patt, dev_num, vol_id);
-	return read_data(file, buf, buf_len);
-}
-
-/**
- * dev_get_major - get major and minor numbers of an UBI device.
- * @lib: libubi descriptor
- * @dev_num: UBI device number
- * @major: major number is returned here
- * @minor: minor number is returned here
- *
- * This function returns zero in case of succes and %-1 in case of failure.
- */
-static int dev_get_major(struct libubi *lib, int dev_num, int *major, int *minor)
-{
-	char file[strlen(lib->dev_dev) + 50];
-
-	sprintf(file, lib->dev_dev, dev_num);
-	return read_major(file, major, minor);
-}
-
-/**
- * vol_get_major - get major and minor numbers of an UBI volume.
- * @lib: libubi descriptor
- * @dev_num: UBI device number
- * @vol_id: volume ID
- * @major: major number is returned here
- * @minor: minor number is returned here
- *
- * This function returns zero in case of succes and %-1 in case of failure.
- */
-static int vol_get_major(struct libubi *lib, int dev_num, int vol_id,
-			 int *major, int *minor)
-{
-	char file[strlen(lib->vol_dev) + 100];
-
-	sprintf(file, lib->vol_dev, dev_num, vol_id);
-	return read_major(file, major, minor);
-}
-
-/**
- * vol_node2nums - find UBI device number and volume ID by volume device node
- *                 file.
- * @lib: UBI library descriptor
- * @node: UBI character device node name
- * @dev_num: UBI device number is returned here
- * @vol_id: volume ID is returned hers
- *
- * This function returns zero in case of succes and %-1 in case of failure.
- */
-static int vol_node2nums(struct libubi *lib, const char *node, int *dev_num,
-			 int *vol_id)
-{
-	struct stat st;
-	struct ubi_info info;
-	int i, fd, major, minor;
-	char file[strlen(lib->ubi_vol) + 100];
-
-	if (stat(node, &st))
-		return sys_errmsg("cannot get information about \"%s\"",
-				  node);
-
-	if (!S_ISCHR(st.st_mode)) {
-		errno = EINVAL;
-		return errmsg("\"%s\" is not a character device", node);
-	}
-
-	major = major(st.st_rdev);
-	minor = minor(st.st_rdev);
-
-	if (minor == 0) {
-		errno = EINVAL;
-		return errmsg("\"%s\" is not a volume character device", node);
-	}
-
-	if (ubi_get_info((libubi_t *)lib, &info))
-		return -1;
-
-	for (i = info.lowest_dev_num; i <= info.highest_dev_num; i++) {
-		int major1, minor1, ret;
-
-		ret = dev_get_major(lib, i, &major1, &minor1);
-		if (ret) {
-			if (errno == ENOENT)
-				continue;
-			return -1;
-		}
-
-		if (major1 == major)
-			break;
-	}
-
-	if (i > info.highest_dev_num) {
-		errno = ENODEV;
-		return -1;
-	}
-
-	/* Make sure this UBI volume exists */
-	sprintf(file, lib->ubi_vol, i, minor - 1);
-	fd = open(file, O_RDONLY);
-	if (fd == -1) {
-		errno = ENODEV;
-		return -1;
-	}
-
-	*dev_num = i;
-	*vol_id = minor - 1;
-	errno = 0;
-	return 0;
-}
-
-/**
- * dev_node2num - find UBI device number by its character device node.
- * @lib: UBI library descriptor
- * @node: UBI character device node name
- * @dev_num: UBI device number is returned here
- *
- * This function returns %0 in case of success and %-1 in case of failure.
- */
-static int dev_node2num(struct libubi *lib, const char *node, int *dev_num)
-{
-	struct stat st;
-	struct ubi_info info;
-	int i, major, minor;
-
-	if (stat(node, &st))
-		return sys_errmsg("cannot get information about \"%s\"", node);
-
-	if (!S_ISCHR(st.st_mode)) {
-		errno = EINVAL;
-		return errmsg("\"%s\" is not a character device", node);
-	}
-
-	major = major(st.st_rdev);
-	minor = minor(st.st_rdev);
-
-	if (minor != 0) {
-		errno = EINVAL;
-		return errmsg("\"%s\" is not an UBI character device", node);
-	}
-
-	if (ubi_get_info((libubi_t *)lib, &info))
-		return -1;
-
-	for (i = info.lowest_dev_num; i <= info.highest_dev_num; i++) {
-		int major1, minor1, ret;
-
-		ret = dev_get_major(lib, i, &major1, &minor1);
-		if (ret) {
-			if (errno == ENOENT)
-				continue;
-			return -1;
-		}
-
-		if (major1 == major) {
-			if (minor1 != 0) {
-				errmsg("UBI character device minor number is "
-				       "%d, but must be 0", minor1);
-				errno = EINVAL;
-				return -1;
-			}
-			errno = 0;
-			*dev_num = i;
-			return 0;
-		}
-	}
-
-	errno = ENODEV;
-	return -1;
-}
-
-int mtd_num2ubi_dev(libubi_t desc, int mtd_num, int *dev_num)
-{
-	struct ubi_info info;
-	int i, ret, mtd_num1;
-	struct libubi *lib = desc;
-
-	if (ubi_get_info(desc, &info))
-		return -1;
-
-	for (i = info.lowest_dev_num; i <= info.highest_dev_num; i++) {
-		ret = dev_read_int(lib->dev_mtd_num, i, &mtd_num1);
-		if (ret) {
-			if (errno == ENOENT)
-				continue;
-			return -1;
-		}
-
-		if (mtd_num1 == mtd_num) {
-			errno = 0;
-			*dev_num = i;
-			return 0;
-		}
-	}
-
-	errno = 0;
-	return -1;
-}
-
-libubi_t libubi_open(void)
-{
-	int fd, version;
-	struct libubi *lib;
-
-	lib = calloc(1, sizeof(struct libubi));
-	if (!lib)
-		return NULL;
-
-	lib->sysfs_ctrl = mkpath("/sys", SYSFS_CTRL);
-	if (!lib->sysfs_ctrl)
-		goto out_error;
-
-	lib->ctrl_dev = mkpath(lib->sysfs_ctrl, CTRL_DEV);
-	if (!lib->ctrl_dev)
-		goto out_error;
-
-	lib->sysfs_ubi = mkpath("/sys", SYSFS_UBI);
-	if (!lib->sysfs_ubi)
-		goto out_error;
-
-	/* Make sure UBI is present */
-	fd = open(lib->sysfs_ubi, O_RDONLY);
-	if (fd == -1) {
-		errno = 0;
-		goto out_error;
-	}
-
-	if (close(fd)) {
-		sys_errmsg("close failed on \"%s\"", lib->sysfs_ubi);
-		goto out_error;
-	}
-
-	lib->ubi_dev = mkpath(lib->sysfs_ubi, UBI_DEV_NAME_PATT);
-	if (!lib->ubi_dev)
-		goto out_error;
-
-	lib->ubi_version = mkpath(lib->sysfs_ubi, UBI_VER);
-	if (!lib->ubi_version)
-		goto out_error;
-
-	lib->dev_dev = mkpath(lib->ubi_dev, DEV_DEV);
-	if (!lib->dev_dev)
-		goto out_error;
-
-	lib->dev_avail_ebs = mkpath(lib->ubi_dev, DEV_AVAIL_EBS);
-	if (!lib->dev_avail_ebs)
-		goto out_error;
-
-	lib->dev_total_ebs = mkpath(lib->ubi_dev, DEV_TOTAL_EBS);
-	if (!lib->dev_total_ebs)
-		goto out_error;
-
-	lib->dev_bad_count = mkpath(lib->ubi_dev, DEV_BAD_COUNT);
-	if (!lib->dev_bad_count)
-		goto out_error;
-
-	lib->dev_eb_size = mkpath(lib->ubi_dev, DEV_EB_SIZE);
-	if (!lib->dev_eb_size)
-		goto out_error;
-
-	lib->dev_max_ec = mkpath(lib->ubi_dev, DEV_MAX_EC);
-	if (!lib->dev_max_ec)
-		goto out_error;
-
-	lib->dev_bad_rsvd = mkpath(lib->ubi_dev, DEV_MAX_RSVD);
-	if (!lib->dev_bad_rsvd)
-		goto out_error;
-
-	lib->dev_max_vols = mkpath(lib->ubi_dev, DEV_MAX_VOLS);
-	if (!lib->dev_max_vols)
-		goto out_error;
-
-	lib->dev_min_io_size = mkpath(lib->ubi_dev, DEV_MIN_IO_SIZE);
-	if (!lib->dev_min_io_size)
-		goto out_error;
-
-	lib->dev_mtd_num = mkpath(lib->ubi_dev, DEV_MTD_NUM);
-	if (!lib->dev_mtd_num)
-		goto out_error;
-
-	lib->ubi_vol = mkpath(lib->sysfs_ubi, UBI_VOL_NAME_PATT);
-	if (!lib->ubi_vol)
-		goto out_error;
-
-	lib->vol_type = mkpath(lib->ubi_vol, VOL_TYPE);
-	if (!lib->vol_type)
-		goto out_error;
-
-	lib->vol_dev = mkpath(lib->ubi_vol, VOL_DEV);
-	if (!lib->vol_dev)
-		goto out_error;
-
-	lib->vol_alignment = mkpath(lib->ubi_vol, VOL_ALIGNMENT);
-	if (!lib->vol_alignment)
-		goto out_error;
-
-	lib->vol_data_bytes = mkpath(lib->ubi_vol, VOL_DATA_BYTES);
-	if (!lib->vol_data_bytes)
-		goto out_error;
-
-	lib->vol_rsvd_ebs = mkpath(lib->ubi_vol, VOL_RSVD_EBS);
-	if (!lib->vol_rsvd_ebs)
-		goto out_error;
-
-	lib->vol_eb_size = mkpath(lib->ubi_vol, VOL_EB_SIZE);
-	if (!lib->vol_eb_size)
-		goto out_error;
-
-	lib->vol_corrupted = mkpath(lib->ubi_vol, VOL_CORRUPTED);
-	if (!lib->vol_corrupted)
-		goto out_error;
-
-	lib->vol_name = mkpath(lib->ubi_vol, VOL_NAME);
-	if (!lib->vol_name)
-		goto out_error;
-
-	if (read_positive_int(lib->ubi_version, &version))
-		goto out_error;
-	if (version != LIBUBI_UBI_VERSION) {
-		errmsg("this library was made for UBI version %d, but UBI "
-		       "version %d is detected\n", LIBUBI_UBI_VERSION, version);
-		goto out_error;
-	}
-
-	return lib;
-
-out_error:
-	libubi_close((libubi_t)lib);
-	return NULL;
-}
-
-void libubi_close(libubi_t desc)
-{
-	struct libubi *lib = (struct libubi *)desc;
-
-	free(lib->vol_name);
-	free(lib->vol_corrupted);
-	free(lib->vol_eb_size);
-	free(lib->vol_rsvd_ebs);
-	free(lib->vol_data_bytes);
-	free(lib->vol_alignment);
-	free(lib->vol_dev);
-	free(lib->vol_type);
-	free(lib->ubi_vol);
-	free(lib->dev_mtd_num);
-	free(lib->dev_min_io_size);
-	free(lib->dev_max_vols);
-	free(lib->dev_bad_rsvd);
-	free(lib->dev_max_ec);
-	free(lib->dev_eb_size);
-	free(lib->dev_bad_count);
-	free(lib->dev_total_ebs);
-	free(lib->dev_avail_ebs);
-	free(lib->dev_dev);
-	free(lib->ubi_version);
-	free(lib->ubi_dev);
-	free(lib->sysfs_ubi);
-	free(lib->ctrl_dev);
-	free(lib->sysfs_ctrl);
-	free(lib);
-}
-
-/**
- * do_attach - perform the actual attach operation.
- * @node: name of the UBI control character device node
- * @r: attach request
- *
- * This function performs the actual UBI attach operation. Returns %0 in case of
- * success and %-1 in case of failure. @r->ubi_num contains newly created UBI
- * device number.
- */
-static int do_attach(const char *node, const struct ubi_attach_req *r)
-{
-	int fd, ret;
-
-	fd = open(node, O_RDONLY);
-	if (fd == -1)
-		return sys_errmsg("cannot open \"%s\"", node);
-
-	ret = ioctl(fd, UBI_IOCATT, r);
-	close(fd);
-	if (ret == -1)
-		return -1;
-
-#ifdef UDEV_SETTLE_HACK
-//	if (system("udevsettle") == -1)
-//		return -1;
-	usleep(100000);
-#endif
-	return ret;
-}
-
-int ubi_attach_mtd(libubi_t desc, const char *node,
-		   struct ubi_attach_request *req)
-{
-	struct ubi_attach_req r;
-	int ret;
-
-	(void)desc;
-
-	memset(&r, 0, sizeof(struct ubi_attach_req));
-	r.ubi_num = req->dev_num;
-	r.mtd_num = req->mtd_num;
-	r.vid_hdr_offset = req->vid_hdr_offset;
-
-	ret = do_attach(node, &r);
-	if (ret == 0)
-		req->dev_num = r.ubi_num;
-
-	return ret;
-}
-
-#ifndef MTD_CHAR_MAJOR
-/*
- * This is taken from kernel <linux/mtd/mtd.h> and is unlikely to change anytime
- * soon.
- */
-#define MTD_CHAR_MAJOR 90
-#endif
-
-/**
- * mtd_node_to_num - converts device node to MTD number.
- * @mtd_dev_node: path to device node to convert
- *
- * This function converts given @mtd_dev_node to MTD device number.
- * @mtd_dev_node should contain path to the MTD device node. Returns MTD device
- * number in case of success and %-1 in case of failure (errno is set).
- */
-static int mtd_node_to_num(const char *mtd_dev_node)
-{
-	int major, minor;
-	struct stat sb;
-
-	if (stat(mtd_dev_node, &sb) < 0)
-		return sys_errmsg("cannot stat \"%s\"", mtd_dev_node);
-
-	if (!S_ISCHR(sb.st_mode)) {
-		errno = EINVAL;
-		return sys_errmsg("\"%s\" is not a character device",
-				  mtd_dev_node);
-	}
-
-	major = major(sb.st_rdev);
-	minor = minor(sb.st_rdev);
-
-	if (major != MTD_CHAR_MAJOR) {
-		errno = EINVAL;
-		return sys_errmsg("\"%s\" is not an MTD device", mtd_dev_node);
-	}
-
-	return minor / 2;
-}
-
-int ubi_attach(libubi_t desc, const char *node, struct ubi_attach_request *req)
-{
-	struct ubi_attach_req r;
-	int ret;
-
-	if (!req->mtd_dev_node)
-		/* Fallback to opening by mtd_num */
-		return ubi_attach_mtd(desc, node, req);
-
-	memset(&r, 0, sizeof(struct ubi_attach_req));
-	r.ubi_num = req->dev_num;
-	r.vid_hdr_offset = req->vid_hdr_offset;
-
-	/*
-	 * User has passed path to device node. Lets find out MTD device number
-	 * of the device and pass it to the kernel.
-	 */
-	r.mtd_num = mtd_node_to_num(req->mtd_dev_node);
-	if (r.mtd_num == -1)
-		return -1;
-
-	ret = do_attach(node, &r);
-	if (ret == 0)
-		req->dev_num = r.ubi_num;
-
-	return ret;
-}
-
-int ubi_detach_mtd(libubi_t desc, const char *node, int mtd_num)
-{
-	int ret, ubi_dev;
-
-	ret = mtd_num2ubi_dev(desc, mtd_num, &ubi_dev);
-	if (ret == -1) {
-		errno = ENODEV;
-		return ret;
-	}
-
-	return ubi_remove_dev(desc, node, ubi_dev);
-}
-
-int ubi_detach(libubi_t desc, const char *node, const char *mtd_dev_node)
-{
-	int mtd_num;
-
-	if (!mtd_dev_node) {
-		errno = EINVAL;
-		return -1;
-	}
-
-	mtd_num = mtd_node_to_num(mtd_dev_node);
-	if (mtd_num == -1)
-		return -1;
-
-	return ubi_detach_mtd(desc, node, mtd_num);
-}
-
-int ubi_remove_dev(libubi_t desc, const char *node, int ubi_dev)
-{
-	int fd, ret;
-
-	desc = desc;
-
-	fd = open(node, O_RDONLY);
-	if (fd == -1)
-		return sys_errmsg("cannot open \"%s\"", node);
-	ret = ioctl(fd, UBI_IOCDET, &ubi_dev);
-	if (ret == -1)
-		goto out_close;
-
-#ifdef UDEV_SETTLE_HACK
-//	if (system("udevsettle") == -1)
-//		return -1;
-	usleep(100000);
-#endif
-
-out_close:
-	close(fd);
-	return ret;
-}
-
-int ubi_probe_node(libubi_t desc, const char *node)
-{
-	struct stat st;
-	struct ubi_info info;
-	int i, fd, major, minor;
-	struct libubi *lib = (struct libubi *)desc;
-	char file[strlen(lib->ubi_vol) + 100];
-
-	if (stat(node, &st))
-		return sys_errmsg("cannot get information about \"%s\"", node);
-
-	if (!S_ISCHR(st.st_mode)) {
-		errmsg("\"%s\" is not a character device", node);
-		errno = EINVAL;
-		return -1;
-	}
-
-	major = major(st.st_rdev);
-	minor = minor(st.st_rdev);
-
-	if (ubi_get_info((libubi_t *)lib, &info))
-		return -1;
-
-	for (i = info.lowest_dev_num; i <= info.highest_dev_num; i++) {
-		int major1, minor1, ret;
-
-		ret = dev_get_major(lib, i, &major1, &minor1);
-		if (ret) {
-			if (errno == ENOENT)
-				continue;
-			if (!errno)
-				goto out_not_ubi;
-			return -1;
-		}
-
-		if (major1 == major)
-			break;
-	}
-
-	if (i > info.highest_dev_num)
-		goto out_not_ubi;
-
-	if (minor == 0)
-		return 1;
-
-	/* This is supposdely an UBI volume device node */
-	sprintf(file, lib->ubi_vol, i, minor - 1);
-	fd = open(file, O_RDONLY);
-	if (fd == -1)
-		goto out_not_ubi;
-
-	return 2;
-
-out_not_ubi:
-	errmsg("\"%s\" has major:minor %d:%d, but this does not correspond to "
-	       "any existing UBI device or volume", node, major, minor);
-	errno = ENODEV;
-	return -1;
-}
-
-int ubi_get_info(libubi_t desc, struct ubi_info *info)
-{
-	DIR *sysfs_ubi;
-	struct dirent *dirent;
-	struct libubi *lib = (struct libubi *)desc;
-
-	memset(info, 0, sizeof(struct ubi_info));
-
-	if (read_major(lib->ctrl_dev, &info->ctrl_major, &info->ctrl_minor)) {
-		/*
-		 * Older UBI versions did not have control device, so we do not
-		 * panic here for compatibility reasons. May be few years later
-		 * we could return -1 here, but for now just set major:minor to
-		 * -1.
-		 */
-		info->ctrl_major = info->ctrl_minor = -1;
-	}
-
-	/*
-	 * We have to scan the UBI sysfs directory to identify how many UBI
-	 * devices are present.
-	 */
-	sysfs_ubi = opendir(lib->sysfs_ubi);
-	if (!sysfs_ubi)
-		return -1;
-
-	info->lowest_dev_num = INT_MAX;
-	while (1) {
-		int dev_num, ret;
-		char tmp_buf[256];
-
-		errno = 0;
-		dirent = readdir(sysfs_ubi);
-		if (!dirent)
-			break;
-
-		if (strlen(dirent->d_name) >= 255) {
-			errmsg("invalid entry in %s: \"%s\"",
-			       lib->sysfs_ubi, dirent->d_name);
-			errno = EINVAL;
-			goto out_close;
-		}
-
-		ret = sscanf(dirent->d_name, UBI_DEV_NAME_PATT"%s",
-			     &dev_num, tmp_buf);
-		if (ret == 1) {
-			info->dev_count += 1;
-			if (dev_num > info->highest_dev_num)
-				info->highest_dev_num = dev_num;
-			if (dev_num < info->lowest_dev_num)
-				info->lowest_dev_num = dev_num;
-		}
-	}
-
-	if (!dirent && errno) {
-		sys_errmsg("readdir failed on \"%s\"", lib->sysfs_ubi);
-		goto out_close;
-	}
-
-	if (closedir(sysfs_ubi))
-		return sys_errmsg("closedir failed on \"%s\"", lib->sysfs_ubi);
-
-	if (info->lowest_dev_num == INT_MAX)
-		info->lowest_dev_num = 0;
-
-	if (read_positive_int(lib->ubi_version, &info->version))
-		return -1;
-
-	return 0;
-
-out_close:
-	closedir(sysfs_ubi);
-	return -1;
-}
-
-int ubi_mkvol(libubi_t desc, const char *node, struct ubi_mkvol_request *req)
-{
-	int fd, ret;
-	struct ubi_mkvol_req r;
-	size_t n;
-
-	memset(&r, 0, sizeof(struct ubi_mkvol_req));
-
-	desc = desc;
-	r.vol_id = req->vol_id;
-	r.alignment = req->alignment;
-	r.bytes = req->bytes;
-	r.vol_type = req->vol_type;
-
-	n = strlen(req->name);
-	if (n > UBI_MAX_VOLUME_NAME)
-		return -1;
-
-	strncpy(r.name, req->name, UBI_MAX_VOLUME_NAME + 1);
-	r.name_len = n;
-
-	desc = desc;
-	fd = open(node, O_RDONLY);
-	if (fd == -1)
-		return sys_errmsg("cannot open \"%s\"", node);
-
-	ret = ioctl(fd, UBI_IOCMKVOL, &r);
-	if (ret == -1) {
-		close(fd);
-		return ret;
-	}
-
-	close(fd);
-	req->vol_id = r.vol_id;
-
-#ifdef UDEV_SETTLE_HACK
-//	if (system("udevsettle") == -1)
-//		return -1;
-	usleep(100000);
-#endif
-
-	return 0;
-}
-
-int ubi_rmvol(libubi_t desc, const char *node, int vol_id)
-{
-	int fd, ret;
-
-	desc = desc;
-	fd = open(node, O_RDONLY);
-	if (fd == -1)
-		return sys_errmsg("cannot open \"%s\"", node);
-
-	ret = ioctl(fd, UBI_IOCRMVOL, &vol_id);
-	if (ret == -1) {
-		close(fd);
-		return ret;
-	}
-
-	close(fd);
-
-#ifdef UDEV_SETTLE_HACK
-//	if (system("udevsettle") == -1)
-//		return -1;
-	usleep(100000);
-#endif
-
-	return 0;
-}
-
-int ubi_rnvols(libubi_t desc, const char *node, struct ubi_rnvol_req *rnvol)
-{
-	int fd, ret;
-
-	desc = desc;
-	fd = open(node, O_RDONLY);
-	if (fd == -1)
-		return -1;
-
-	ret = ioctl(fd, UBI_IOCRNVOL, rnvol);
-	if (ret == -1) {
-		close(fd);
-		return ret;
-	}
-
-	close(fd);
-
-#ifdef UDEV_SETTLE_HACK
-//	if (system("udevsettle") == -1)
-//		return -1;
-	usleep(100000);
-#endif
-
-	return 0;
-}
-
-int ubi_rsvol(libubi_t desc, const char *node, int vol_id, long long bytes)
-{
-	int fd, ret;
-	struct ubi_rsvol_req req;
-
-	desc = desc;
-	fd = open(node, O_RDONLY);
-	if (fd == -1)
-		return sys_errmsg("cannot open \"%s\"", node);
-
-	req.bytes = bytes;
-	req.vol_id = vol_id;
-
-	ret = ioctl(fd, UBI_IOCRSVOL, &req);
-	close(fd);
-	return ret;
-}
-
-int ubi_update_start(libubi_t desc, int fd, long long bytes)
-{
-	desc = desc;
-	if (ioctl(fd, UBI_IOCVOLUP, &bytes))
-		return -1;
-	return 0;
-}
-
-int ubi_leb_change_start(libubi_t desc, int fd, int lnum, int bytes, int dtype)
-{
-	struct ubi_leb_change_req req;
-
-	desc = desc;
-	memset(&req, 0, sizeof(struct ubi_leb_change_req));
-	req.lnum = lnum;
-	req.bytes = bytes;
-	req.dtype = dtype;
-
-	if (ioctl(fd, UBI_IOCEBCH, &req))
-		return -1;
-	return 0;
-}
-
-/**
- * dev_present - check whether an UBI device is present.
- * @lib: libubi descriptor
- * @dev_num: UBI device number to check
- *
- * This function returns %1 if UBI device is present and %0 if not.
- */
-static int dev_present(struct libubi *lib, int dev_num)
-{
-	struct stat st;
-	char file[strlen(lib->ubi_dev) + 50];
-
-	sprintf(file, lib->ubi_dev, dev_num);
-	return !stat(file, &st);
-}
-
-int ubi_get_dev_info1(libubi_t desc, int dev_num, struct ubi_dev_info *info)
-{
-	DIR *sysfs_ubi;
-	struct dirent *dirent;
-	struct libubi *lib = (struct libubi *)desc;
-
-	memset(info, 0, sizeof(struct ubi_dev_info));
-	info->dev_num = dev_num;
-
-	if (!dev_present(lib, dev_num))
-		return -1;
-
-	sysfs_ubi = opendir(lib->sysfs_ubi);
-	if (!sysfs_ubi)
-		return -1;
-
-	info->lowest_vol_id = INT_MAX;
-
-	while (1) {
-		int vol_id, ret, devno;
-		char tmp_buf[256];
-
-		errno = 0;
-		dirent = readdir(sysfs_ubi);
-		if (!dirent)
-			break;
-
-		if (strlen(dirent->d_name) >= 255) {
-			errmsg("invalid entry in %s: \"%s\"",
-			       lib->sysfs_ubi, dirent->d_name);
-			goto out_close;
-		}
-
-		ret = sscanf(dirent->d_name, UBI_VOL_NAME_PATT"%s", &devno, &vol_id, tmp_buf);
-		if (ret == 2 && devno == dev_num) {
-			info->vol_count += 1;
-			if (vol_id > info->highest_vol_id)
-				info->highest_vol_id = vol_id;
-			if (vol_id < info->lowest_vol_id)
-				info->lowest_vol_id = vol_id;
-		}
-	}
-
-	if (!dirent && errno) {
-		sys_errmsg("readdir failed on \"%s\"", lib->sysfs_ubi);
-		goto out_close;
-	}
-
-	if (closedir(sysfs_ubi))
-		return sys_errmsg("closedir failed on \"%s\"", lib->sysfs_ubi);
-
-	if (info->lowest_vol_id == INT_MAX)
-		info->lowest_vol_id = 0;
-
-	if (dev_get_major(lib, dev_num, &info->major, &info->minor))
-		return -1;
-
-	if (dev_read_int(lib->dev_mtd_num, dev_num, &info->mtd_num))
-		return -1;
-	if (dev_read_int(lib->dev_avail_ebs, dev_num, &info->avail_lebs))
-		return -1;
-	if (dev_read_int(lib->dev_total_ebs, dev_num, &info->total_lebs))
-		return -1;
-	if (dev_read_int(lib->dev_bad_count, dev_num, &info->bad_count))
-		return -1;
-	if (dev_read_int(lib->dev_eb_size, dev_num, &info->leb_size))
-		return -1;
-	if (dev_read_int(lib->dev_bad_rsvd, dev_num, &info->bad_rsvd))
-		return -1;
-	if (dev_read_ll(lib->dev_max_ec, dev_num, &info->max_ec))
-		return -1;
-	if (dev_read_int(lib->dev_max_vols, dev_num, &info->max_vol_count))
-		return -1;
-	if (dev_read_int(lib->dev_min_io_size, dev_num, &info->min_io_size))
-		return -1;
-
-	info->avail_bytes = (long long)info->avail_lebs * info->leb_size;
-	info->total_bytes = (long long)info->total_lebs * info->leb_size;
-
-	return 0;
-
-out_close:
-	closedir(sysfs_ubi);
-	return -1;
-}
-
-int ubi_get_dev_info(libubi_t desc, const char *node, struct ubi_dev_info *info)
-{
-	int err, dev_num;
-	struct libubi *lib = (struct libubi *)desc;
-
-	err = ubi_probe_node(desc, node);
-	if (err != 1) {
-		if (err == 2)
-			errno = ENODEV;
-		return -1;
-	}
-
-	if (dev_node2num(lib, node, &dev_num))
-		return -1;
-
-	return ubi_get_dev_info1(desc, dev_num, info);
-}
-
-int ubi_get_vol_info1(libubi_t desc, int dev_num, int vol_id,
-		      struct ubi_vol_info *info)
-{
-	int ret;
-	struct libubi *lib = (struct libubi *)desc;
-	char buf[50];
-
-	memset(info, 0, sizeof(struct ubi_vol_info));
-	info->dev_num = dev_num;
-	info->vol_id = vol_id;
-
-	if (vol_get_major(lib, dev_num, vol_id, &info->major, &info->minor))
-		return -1;
-
-	ret = vol_read_data(lib->vol_type, dev_num, vol_id, buf, 50);
-	if (ret < 0)
-		return -1;
-
-	if (strncmp(buf, "static\n", ret) == 0)
-		info->type = UBI_STATIC_VOLUME;
-	else if (strncmp(buf, "dynamic\n", ret) == 0)
-		info->type = UBI_DYNAMIC_VOLUME;
-	else {
-		errmsg("bad value at \"%s\"", buf);
-		errno = EINVAL;
-		return -1;
-	}
-
-	ret = vol_read_int(lib->vol_alignment, dev_num, vol_id,
-			   &info->alignment);
-	if (ret)
-		return -1;
-	ret = vol_read_ll(lib->vol_data_bytes, dev_num, vol_id,
-			  &info->data_bytes);
-	if (ret)
-		return -1;
-	ret = vol_read_int(lib->vol_rsvd_ebs, dev_num, vol_id, &info->rsvd_lebs);
-	if (ret)
-		return -1;
-	ret = vol_read_int(lib->vol_eb_size, dev_num, vol_id, &info->leb_size);
-	if (ret)
-		return -1;
-	ret = vol_read_int(lib->vol_corrupted, dev_num, vol_id,
-			   &info->corrupted);
-	if (ret)
-		return -1;
-	info->rsvd_bytes = (long long)info->leb_size * info->rsvd_lebs;
-
-	ret = vol_read_data(lib->vol_name, dev_num, vol_id, &info->name,
-			    UBI_VOL_NAME_MAX + 2);
-	if (ret < 0)
-		return -1;
-
-	info->name[ret - 1] = '\0';
-	return 0;
-}
-
-int ubi_get_vol_info(libubi_t desc, const char *node, struct ubi_vol_info *info)
-{
-	int err, vol_id, dev_num;
-	struct libubi *lib = (struct libubi *)desc;
-
-	err = ubi_probe_node(desc, node);
-	if (err != 2) {
-		if (err == 1)
-			errno = ENODEV;
-		return -1;
-	}
-
-	if (vol_node2nums(lib, node, &dev_num, &vol_id))
-		return -1;
-
-	return ubi_get_vol_info1(desc, dev_num, vol_id, info);
-}
-
-int ubi_get_vol_info1_nm(libubi_t desc, int dev_num, const char *name,
-			 struct ubi_vol_info *info)
-{
-	int i, err;
-	unsigned int nlen = strlen(name);
-	struct ubi_dev_info dev_info;
-
-	if (nlen == 0) {
-		errmsg("bad \"name\" input parameter");
-		errno = EINVAL;
-		return -1;
-	}
-
-	err = ubi_get_dev_info1(desc, dev_num, &dev_info);
-	if (err)
-		return err;
-
-	for (i = dev_info.lowest_vol_id;
-	     i <= dev_info.highest_vol_id; i++) {
-		err = ubi_get_vol_info1(desc, dev_num, i, info);
-		if (err == -1) {
-			if (errno == ENOENT)
-				continue;
-			return -1;
-		}
-
-		if (nlen == strlen(info->name) && !strcmp(name, info->name))
-			return 0;
-	}
-
-	errno = ENOENT;
-	return -1;
-}
-
-int ubi_set_property(int fd, uint8_t property, uint64_t value)
-{
-	struct ubi_set_prop_req r;
-
-	memset(&r, 0, sizeof(struct ubi_set_prop_req));
-	r.property = property;
-	r.value = value;
-
-	return ioctl(fd, UBI_IOCSETPROP, &r);
-}
-
-int ubi_leb_unmap(int fd, int lnum)
-{
-	return ioctl(fd, UBI_IOCEBUNMAP, &lnum);
-}
-
-int ubi_is_mapped(int fd, int lnum)
-{
-	return ioctl(fd, UBI_IOCEBISMAP, &lnum);
-}
diff --git a/ubi-utils/src/libubi_int.h b/ubi-utils/src/libubi_int.h
deleted file mode 100644
index c3aa37a..0000000
--- a/ubi-utils/src/libubi_int.h
+++ /dev/null
@@ -1,131 +0,0 @@
-/*
- * Copyright (c) International Business Machines Corp., 2006
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- *
- * Author: Artem Bityutskiy
- *
- * UBI (Unsorted Block Images) library.
- */
-
-#ifndef __LIBUBI_INT_H__
-#define __LIBUBI_INT_H__
-
-#ifdef __cplusplus
-extern "C" {
-#endif
-
-/*
- * The below are pre-define UBI file and directory names.
- *
- * Note, older kernels put 'ubiX_Y' directories straight to '/sys/class/ubi/'.
- * New kernels puts 'ubiX_Y' directories to '/sys/class/ubi/ubiX/', which is
- * saner. And for compatibility reasons it also puts symlinks to 'ubiX_Y'
- * directories to '/sys/class/ubi/'. For now libubi assumes old layout.
- */
-
-#define SYSFS_UBI         "class/ubi"
-#define SYSFS_CTRL        "class/misc/ubi_ctrl/"
-
-#define CTRL_DEV          "dev"
-
-#define UBI_VER           "version"
-#define UBI_DEV_NAME_PATT "ubi%d"
-
-#define DEV_DEV           "dev"
-#define DEV_AVAIL_EBS     "avail_eraseblocks"
-#define DEV_TOTAL_EBS     "total_eraseblocks"
-#define DEV_BAD_COUNT     "bad_peb_count"
-#define DEV_EB_SIZE       "eraseblock_size"
-#define DEV_MAX_EC        "max_ec"
-#define DEV_MAX_RSVD      "reserved_for_bad"
-#define DEV_MAX_VOLS      "max_vol_count"
-#define DEV_MIN_IO_SIZE   "min_io_size"
-#define DEV_MTD_NUM       "mtd_num"
-
-#define UBI_VOL_NAME_PATT "ubi%d_%d"
-#define VOL_TYPE          "type"
-#define VOL_DEV           "dev"
-#define VOL_ALIGNMENT     "alignment"
-#define VOL_DATA_BYTES    "data_bytes"
-#define VOL_RSVD_EBS      "reserved_ebs"
-#define VOL_EB_SIZE       "usable_eb_size"
-#define VOL_CORRUPTED     "corrupted"
-#define VOL_NAME          "name"
-
-/**
- * libubi - UBI library description data structure.
- * @sysfs: sysfs file system path
- * @sysfs_ctrl: UBI control device directory in sysfs
- * @ctrl_dev: UBI control device major/minor numbers sysfs file
- * @sysfs_ubi: UBI directory in sysfs
- * @ubi_dev: UBI device sysfs directory pattern
- * @ubi_version: UBI version file sysfs path
- * @dev_dev: UBI device major/minor numbers file pattern
- * @dev_avail_ebs: count of available eraseblocks sysfs path pattern
- * @dev_total_ebs: total eraseblocks count sysfs path pattern
- * @dev_bad_count: count of bad eraseblocks sysfs path pattern
- * @dev_eb_size: size of UBI device's eraseblocks sysfs path pattern
- * @dev_max_ec: maximum erase counter sysfs path pattern
- * @dev_bad_rsvd: count of physical eraseblock reserved for bad eraseblocks
- *                handling
- * @dev_max_vols: maximum volumes number count sysfs path pattern
- * @dev_min_io_size: minimum I/O unit size sysfs path pattern
- * @dev_mtd_num: MTD device number
- * @ubi_vol: UBI volume sysfs directory pattern
- * @vol_type: volume type sysfs path pattern
- * @vol_dev: volume major/minor numbers file pattern
- * @vol_alignment: volume alignment sysfs path pattern
- * @vol_data_bytes: volume data size sysfs path pattern
- * @vol_rsvd_ebs: volume reserved size sysfs path pattern
- * @vol_eb_size: volume eraseblock size sysfs path pattern
- * @vol_corrupted: volume corruption flag sysfs path pattern
- * @vol_name: volume name sysfs path pattern
- */
-struct libubi
-{
-	char *sysfs;
-	char *sysfs_ctrl;
-	char *ctrl_dev;
-	char *sysfs_ubi;
-	char *ubi_dev;
-	char *ubi_version;
-	char *dev_dev;
-	char *dev_avail_ebs;
-	char *dev_total_ebs;
-	char *dev_bad_count;
-	char *dev_eb_size;
-	char *dev_max_ec;
-	char *dev_bad_rsvd;
-	char *dev_max_vols;
-	char *dev_min_io_size;
-	char *dev_mtd_num;
-	char *ubi_vol;
-	char *vol_type;
-	char *vol_dev;
-	char *vol_alignment;
-	char *vol_data_bytes;
-	char *vol_rsvd_ebs;
-	char *vol_eb_size;
-	char *vol_corrupted;
-	char *vol_name;
-	char *vol_max_count;
-};
-
-#ifdef __cplusplus
-}
-#endif
-
-#endif /* !__LIBUBI_INT_H__ */
diff --git a/ubi-utils/src/libubigen.c b/ubi-utils/src/libubigen.c
deleted file mode 100644
index 9eaa7f5..0000000
--- a/ubi-utils/src/libubigen.c
+++ /dev/null
@@ -1,315 +0,0 @@
-/*
- * Copyright (c) International Business Machines Corp., 2006
- * Copyright (C) 2008 Nokia Corporation
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- */
-
-/*
- * Generating UBI images.
- *
- * Authors: Oliver Lohmann
- *          Artem Bityutskiy
- */
-
-#define PROGRAM_NAME "libubigen"
-
-#include <stdlib.h>
-#include <stdint.h>
-#include <unistd.h>
-#include <string.h>
-
-#include <mtd/ubi-media.h>
-#include <mtd_swab.h>
-#include <libubigen.h>
-#include <crc32.h>
-#include "common.h"
-
-void ubigen_info_init(struct ubigen_info *ui, int peb_size, int min_io_size,
-		      int subpage_size, int vid_hdr_offs, int ubi_ver,
-		      uint32_t image_seq)
-{
-	if (!vid_hdr_offs) {
-		vid_hdr_offs = UBI_EC_HDR_SIZE + subpage_size - 1;
-		vid_hdr_offs /= subpage_size;
-		vid_hdr_offs *= subpage_size;
-	}
-
-	ui->peb_size = peb_size;
-	ui->min_io_size = min_io_size;
-	ui->vid_hdr_offs = vid_hdr_offs;
-	ui->data_offs = vid_hdr_offs + UBI_VID_HDR_SIZE + min_io_size - 1;
-	ui->data_offs /= min_io_size;
-	ui->data_offs *= min_io_size;
-	ui->leb_size = peb_size - ui->data_offs;
-	ui->ubi_ver = ubi_ver;
-	ui->image_seq = image_seq;
-
-	ui->max_volumes = ui->leb_size / UBI_VTBL_RECORD_SIZE;
-	if (ui->max_volumes > UBI_MAX_VOLUMES)
-		ui->max_volumes = UBI_MAX_VOLUMES;
-	ui->vtbl_size = ui->max_volumes * UBI_VTBL_RECORD_SIZE;
-}
-
-struct ubi_vtbl_record *ubigen_create_empty_vtbl(const struct ubigen_info *ui)
-{
-	struct ubi_vtbl_record *vtbl;
-	int i;
-
-	vtbl = calloc(1, ui->vtbl_size);
-	if (!vtbl) {
-		sys_errmsg("cannot allocate %d bytes of memory", ui->vtbl_size);
-		return NULL;
-	}
-
-	for (i = 0; i < ui->max_volumes; i++) {
-		uint32_t crc = mtd_crc32(UBI_CRC32_INIT, &vtbl[i],
-				     UBI_VTBL_RECORD_SIZE_CRC);
-		vtbl[i].crc = cpu_to_be32(crc);
-	}
-
-	return vtbl;
-}
-
-int ubigen_add_volume(const struct ubigen_info *ui,
-		      const struct ubigen_vol_info *vi,
-		      struct ubi_vtbl_record *vtbl)
-{
-	struct ubi_vtbl_record *vtbl_rec = &vtbl[vi->id];
-	uint32_t tmp;
-
-	if (vi->id >= ui->max_volumes) {
-		errmsg("too high volume id %d, max. volumes is %d",
-		       vi->id, ui->max_volumes);
-		errno = EINVAL;
-		return -1;
-	}
-
-	if (vi->alignment >= ui->leb_size) {
-		errmsg("too large alignment %d, max is %d (LEB size)",
-		       vi->alignment, ui->leb_size);
-		errno = EINVAL;
-		return -1;
-	}
-
-	memset(vtbl_rec, 0, sizeof(struct ubi_vtbl_record));
-	tmp = (vi->bytes + ui->leb_size - 1) / ui->leb_size;
-	vtbl_rec->reserved_pebs = cpu_to_be32(tmp);
-	vtbl_rec->alignment = cpu_to_be32(vi->alignment);
-	vtbl_rec->vol_type = vi->type;
-	tmp = ui->leb_size % vi->alignment;
-	vtbl_rec->data_pad = cpu_to_be32(tmp);
-	vtbl_rec->flags = vi->flags;
-
-	memcpy(vtbl_rec->name, vi->name, vi->name_len);
-	vtbl_rec->name[vi->name_len] = '\0';
-	vtbl_rec->name_len = cpu_to_be16(vi->name_len);
-
-	tmp = mtd_crc32(UBI_CRC32_INIT, vtbl_rec, UBI_VTBL_RECORD_SIZE_CRC);
-	vtbl_rec->crc =	 cpu_to_be32(tmp);
-	return 0;
-}
-
-void ubigen_init_ec_hdr(const struct ubigen_info *ui,
-		        struct ubi_ec_hdr *hdr, long long ec)
-{
-	uint32_t crc;
-
-	memset(hdr, 0, sizeof(struct ubi_ec_hdr));
-
-	hdr->magic = cpu_to_be32(UBI_EC_HDR_MAGIC);
-	hdr->version = ui->ubi_ver;
-	hdr->ec = cpu_to_be64(ec);
-	hdr->vid_hdr_offset = cpu_to_be32(ui->vid_hdr_offs);
-	hdr->data_offset = cpu_to_be32(ui->data_offs);
-	hdr->image_seq = cpu_to_be32(ui->image_seq);
-
-	crc = mtd_crc32(UBI_CRC32_INIT, hdr, UBI_EC_HDR_SIZE_CRC);
-	hdr->hdr_crc = cpu_to_be32(crc);
-}
-
-void ubigen_init_vid_hdr(const struct ubigen_info *ui,
-			 const struct ubigen_vol_info *vi,
-			 struct ubi_vid_hdr *hdr, int lnum,
-			 const void *data, int data_size)
-{
-	uint32_t crc;
-
-	memset(hdr, 0, sizeof(struct ubi_vid_hdr));
-
-	hdr->magic = cpu_to_be32(UBI_VID_HDR_MAGIC);
-	hdr->version = ui->ubi_ver;
-	hdr->vol_type = vi->type;
-	hdr->vol_id = cpu_to_be32(vi->id);
-	hdr->lnum = cpu_to_be32(lnum);
-	hdr->data_pad = cpu_to_be32(vi->data_pad);
-	hdr->compat = vi->compat;
-
-	if (vi->type == UBI_VID_STATIC) {
-		hdr->data_size = cpu_to_be32(data_size);
-		hdr->used_ebs = cpu_to_be32(vi->used_ebs);
-		crc = mtd_crc32(UBI_CRC32_INIT, data, data_size);
-		hdr->data_crc = cpu_to_be32(crc);
-	}
-
-	crc = mtd_crc32(UBI_CRC32_INIT, hdr, UBI_VID_HDR_SIZE_CRC);
-	hdr->hdr_crc = cpu_to_be32(crc);
-}
-
-int ubigen_write_volume(const struct ubigen_info *ui,
-			const struct ubigen_vol_info *vi, long long ec,
-			long long bytes, int in, int out)
-{
-	int len = vi->usable_leb_size, rd, lnum = 0;
-	char *inbuf, *outbuf;
-
-	if (vi->id >= ui->max_volumes) {
-		errmsg("too high volume id %d, max. volumes is %d",
-		       vi->id, ui->max_volumes);
-		errno = EINVAL;
-		return -1;
-	}
-
-	if (vi->alignment >= ui->leb_size) {
-		errmsg("too large alignment %d, max is %d (LEB size)",
-		       vi->alignment, ui->leb_size);
-		errno = EINVAL;
-		return -1;
-	}
-
-	inbuf = malloc(ui->leb_size);
-	if (!inbuf)
-		return sys_errmsg("cannot allocate %d bytes of memory",
-				  ui->leb_size);
-	outbuf = malloc(ui->peb_size);
-	if (!outbuf) {
-		sys_errmsg("cannot allocate %d bytes of memory", ui->peb_size);
-		goto out_free;
-	}
-
-	memset(outbuf, 0xFF, ui->data_offs);
-	ubigen_init_ec_hdr(ui, (struct ubi_ec_hdr *)outbuf, ec);
-
-	while (bytes) {
-		int l;
-		struct ubi_vid_hdr *vid_hdr;
-
-		if (bytes < len)
-			len = bytes;
-		bytes -= len;
-
-		l = len;
-		do {
-			rd = read(in, inbuf + len - l, l);
-			if (rd != l) {
-				sys_errmsg("cannot read %d bytes from the input file", l);
-				goto out_free1;
-			}
-
-			l -= rd;
-		} while (l);
-
-		vid_hdr = (struct ubi_vid_hdr *)(&outbuf[ui->vid_hdr_offs]);
-		ubigen_init_vid_hdr(ui, vi, vid_hdr, lnum, inbuf, len);
-
-		memcpy(outbuf + ui->data_offs, inbuf, len);
-		memset(outbuf + ui->data_offs + len, 0xFF,
-		       ui->peb_size - ui->data_offs - len);
-
-		if (write(out, outbuf, ui->peb_size) != ui->peb_size) {
-			sys_errmsg("cannot write %d bytes to the output file", ui->peb_size);
-			goto out_free1;
-		}
-
-		lnum += 1;
-	}
-
-	free(outbuf);
-	free(inbuf);
-	return 0;
-
-out_free1:
-	free(outbuf);
-out_free:
-	free(inbuf);
-	return -1;
-}
-
-int ubigen_write_layout_vol(const struct ubigen_info *ui, int peb1, int peb2,
-			    long long ec1, long long ec2,
-			    struct ubi_vtbl_record *vtbl, int fd)
-{
-	int ret;
-	struct ubigen_vol_info vi;
-	char *outbuf;
-	struct ubi_vid_hdr *vid_hdr;
-	off_t seek;
-
-	vi.bytes = ui->leb_size * UBI_LAYOUT_VOLUME_EBS;
-	vi.id = UBI_LAYOUT_VOLUME_ID;
-	vi.alignment = UBI_LAYOUT_VOLUME_ALIGN;
-	vi.data_pad = ui->leb_size % UBI_LAYOUT_VOLUME_ALIGN;
-	vi.usable_leb_size = ui->leb_size - vi.data_pad;
-	vi.data_pad = ui->leb_size - vi.usable_leb_size;
-	vi.type = UBI_LAYOUT_VOLUME_TYPE;
-	vi.name = UBI_LAYOUT_VOLUME_NAME;
-	vi.name_len = strlen(UBI_LAYOUT_VOLUME_NAME);
-	vi.compat = UBI_LAYOUT_VOLUME_COMPAT;
-
-	outbuf = malloc(ui->peb_size);
-	if (!outbuf)
-		return sys_errmsg("failed to allocate %d bytes",
-				  ui->peb_size);
-
-	memset(outbuf, 0xFF, ui->data_offs);
-	vid_hdr = (struct ubi_vid_hdr *)(&outbuf[ui->vid_hdr_offs]);
-	memcpy(outbuf + ui->data_offs, vtbl, ui->vtbl_size);
-	memset(outbuf + ui->data_offs + ui->vtbl_size, 0xFF,
-	       ui->peb_size - ui->data_offs - ui->vtbl_size);
-
-	seek = peb1 * ui->peb_size;
-	if (lseek(fd, seek, SEEK_SET) != seek) {
-		sys_errmsg("cannot seek output file");
-		goto out_free;
-	}
-
-	ubigen_init_ec_hdr(ui, (struct ubi_ec_hdr *)outbuf, ec1);
-	ubigen_init_vid_hdr(ui, &vi, vid_hdr, 0, NULL, 0);
-	ret = write(fd, outbuf, ui->peb_size);
-	if (ret != ui->peb_size) {
-		sys_errmsg("cannot write %d bytes", ui->peb_size);
-		goto out_free;
-	}
-
-	seek = peb2 * ui->peb_size;
-	if (lseek(fd, seek, SEEK_SET) != seek) {
-		sys_errmsg("cannot seek output file");
-		goto out_free;
-	}
-	ubigen_init_ec_hdr(ui, (struct ubi_ec_hdr *)outbuf, ec2);
-	ubigen_init_vid_hdr(ui, &vi, vid_hdr, 1, NULL, 0);
-	ret = write(fd, outbuf, ui->peb_size);
-	if (ret != ui->peb_size) {
-		sys_errmsg("cannot write %d bytes", ui->peb_size);
-		goto out_free;
-	}
-
-	free(outbuf);
-	return 0;
-
-out_free:
-	free(outbuf);
-	return -1;
-}
diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/src/mtdinfo.c
deleted file mode 100644
index bfd7e6d..0000000
--- a/ubi-utils/src/mtdinfo.c
+++ /dev/null
@@ -1,446 +0,0 @@
-/*
- * Copyright (C) 2009 Nokia Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc., 51
- * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
- */
-
-/*
- * An utility to get MTD information.
- *
- * Author: Artem Bityutskiy
- */
-
-#define PROGRAM_VERSION "1.1"
-#define PROGRAM_NAME    "mtdinfo"
-
-#include <stdint.h>
-#include <stdio.h>
-#include <getopt.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include <mtd/mtd-user.h>
-
-#include <libubigen.h>
-#include <libmtd.h>
-#include "common.h"
-#include "ubiutils-common.h"
-
-/* The variables below are set by command line arguments */
-struct args {
-	int mtdn;
-	unsigned int all:1;
-	unsigned int ubinfo:1;
-	unsigned int map:1;
-	const char *node;
-};
-
-static struct args args = {
-	.mtdn = -1,
-	.ubinfo = 0,
-	.all = 0,
-	.node = NULL,
-};
-
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-			 " - a tool to print MTD information.";
-
-static const char optionsstr[] =
-"-m, --mtdn=<MTD device number>  MTD device number to get information about\n"
-"                                (deprecated option, will be removed, do not use)\n"
-"-u, --ubi-info                  print what would UBI layout be if it was put\n"
-"                                on this MTD device\n"
-"-M, --map                       print eraseblock map\n"
-"-a, --all                       print information about all MTD devices\n"
-"-h, --help                      print help message\n"
-"-V, --version                   print program version";
-
-static const char usage[] =
-"Usage 1: " PROGRAM_NAME " [-m <MTD device number>] [-u] [-M] [-h] [-V] [--mtdn <MTD device number>]\n"
-"\t\t[--ubi-info] [--help] [--version]\n"
-"Usage 2: " PROGRAM_NAME " <MTD device node file name> [-u] [-M] [-h] [-V] [--ubi-info] [--help]\n"
-"\t\t[--version]\n"
-"Example 1: " PROGRAM_NAME " - (no arguments) print general MTD information\n"
-"Example 2: " PROGRAM_NAME " -m 1 - print information about MTD device number 1\n"
-"Example 3: " PROGRAM_NAME " /dev/mtd0 - print information MTD device /dev/mtd0\n"
-"Example 4: " PROGRAM_NAME " /dev/mtd0 -u - print information MTD device /dev/mtd0\n"
-"\t\t\t\tand include UBI layout information\n"
-"Example 5: " PROGRAM_NAME " -a - print information about all MTD devices\n"
-"\t\t\tand include UBI layout information\n";
-
-static const struct option long_options[] = {
-	{ .name = "mtdn",      .has_arg = 1, .flag = NULL, .val = 'm' },
-	{ .name = "ubi-info",  .has_arg = 0, .flag = NULL, .val = 'u' },
-	{ .name = "map",       .has_arg = 0, .flag = NULL, .val = 'M' },
-	{ .name = "all",       .has_arg = 0, .flag = NULL, .val = 'a' },
-	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
-	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
-	{ NULL, 0, NULL, 0},
-};
-
-static int parse_opt(int argc, char * const argv[])
-{
-	while (1) {
-		int key, error = 0;
-
-		key = getopt_long(argc, argv, "am:uMhV", long_options, NULL);
-		if (key == -1)
-			break;
-
-		switch (key) {
-		case 'a':
-			args.all = 1;
-			break;
-
-		case 'u':
-			args.ubinfo = 1;
-			break;
-
-		case 'm':
-			args.mtdn = simple_strtoul(optarg, &error);
-			if (error || args.mtdn < 0)
-				return errmsg("bad MTD device number: \"%s\"", optarg);
-			warnmsg("-m/--mtdn is depecated, will be removed in mtd-utils-1.4.6");
-			break;
-
-		case 'M':
-			args.map = 1;
-			break;
-
-		case 'h':
-			printf("%s\n\n", doc);
-			printf("%s\n\n", usage);
-			printf("%s\n", optionsstr);
-			exit(EXIT_SUCCESS);
-
-		case 'V':
-			printf("%s\n", PROGRAM_VERSION);
-			exit(EXIT_SUCCESS);
-
-		case ':':
-			return errmsg("parameter is missing");
-
-		default:
-			fprintf(stderr, "Use -h for help\n");
-			return -1;
-		}
-	}
-
-	if (optind == argc - 1)
-		args.node = argv[optind];
-	else if (optind < argc)
-		return errmsg("more then one MTD device specified (use -h for help)");
-
-	if (args.all && (args.node || args.mtdn != -1)) {
-		args.mtdn = -1;
-		args.node = NULL;
-	}
-
-	if (args.map && !args.node)
-		return errmsg("-M requires MTD device node name");
-
-	return 0;
-}
-
-static int translate_dev(libmtd_t libmtd, const char *node)
-{
-	int err;
-	struct mtd_dev_info mtd;
-
-	err = mtd_get_dev_info(libmtd, node, &mtd);
-	if (err) {
-		if (errno == ENODEV)
-			return errmsg("\"%s\" does not correspond to any "
-				      "existing MTD device", node);
-		return sys_errmsg("cannot get information about MTD "
-				  "device \"%s\"", node);
-	}
-
-	args.mtdn = mtd.mtd_num;
-	return 0;
-}
-
-static void print_ubi_info(const struct mtd_info *mtd_info,
-			   const struct mtd_dev_info *mtd)
-{
-	struct ubigen_info ui;
-
-	if (!mtd_info->sysfs_supported) {
-		errmsg("cannot provide UBI info, becasue sub-page size is "
-		       "not known");
-		return;
-	}
-
-	ubigen_info_init(&ui, mtd->eb_size, mtd->min_io_size, mtd->subpage_size,
-			 0, 1, 0);
-	printf("Default UBI VID header offset:  %d\n", ui.vid_hdr_offs);
-	printf("Default UBI data offset:        %d\n", ui.data_offs);
-	printf("Default UBI LEB size:           ");
-	ubiutils_print_bytes(ui.leb_size, 0);
-	printf("\n");
-	printf("Maximum UBI volumes count:      %d\n", ui.max_volumes);
-}
-
-static void print_region_map(const struct mtd_dev_info *mtd, int fd,
-			     const region_info_t *reginfo)
-{
-	unsigned long start;
-	int i, width;
-	int ret_locked, errno_locked, ret_bad, errno_bad;
-
-	printf("Eraseblock map:\n");
-
-	/* Figure out the number of spaces to pad w/out libm */
-	for (i = 1, width = 0; i < reginfo->numblocks; i *= 10, ++width)
-		continue;
-
-	/* If we don't have a fd to query, just show the bare map */
-	if (fd == -1) {
-		ret_locked = ret_bad = -1;
-		errno_locked = errno_bad = ENODEV;
-	} else
-		ret_locked = ret_bad = errno_locked = errno_bad = 0;
-
-	for (i = 0; i < reginfo->numblocks; ++i) {
-		start = reginfo->offset + i * reginfo->erasesize;
-		printf(" %*i: %08lx ", width, i, start);
-
-		if (ret_locked != -1) {
-			ret_locked = mtd_is_locked(mtd, fd, i);
-			if (ret_locked == 1)
-				printf("RO ");
-			else
-				errno_locked = errno;
-		}
-		if (ret_locked != 1)
-			printf("   ");
-
-		if (ret_bad != -1) {
-			ret_bad = mtd_is_bad(mtd, fd, i);
-			if (ret_bad == 1)
-				printf("BAD ");
-			else
-				errno_bad = errno;
-		}
-		if (ret_bad != 1)
-			printf("    ");
-
-		if (((i + 1) % 4) == 0)
-			printf("\n");
-	}
-	if (i % 4)
-		printf("\n");
-
-	if (ret_locked == -1 && errno_locked != EOPNOTSUPP) {
-		errno = errno_locked;
-		sys_errmsg("could not read locked block info");
-	}
-
-	if (mtd->bb_allowed && ret_bad == -1 && errno_bad != EOPNOTSUPP) {
-		errno = errno_bad;
-		sys_errmsg("could not read bad block info");
-	}
-}
-
-static void print_region_info(const struct mtd_dev_info *mtd)
-{
-	region_info_t reginfo;
-	int r, fd;
-
-	/* If we don't have any region info, just return */
-	if (!args.map && mtd->region_cnt == 0)
-		return;
-
-	/* First open the device so we can query it */
-	fd = open(args.node, O_RDONLY | O_CLOEXEC);
-	if (fd == -1) {
-		sys_errmsg("couldn't open MTD dev: %s", args.node);
-		if (mtd->region_cnt)
-			return;
-	}
-
-	/* Walk all the regions and show the map for them */
-	if (mtd->region_cnt) {
-		for (r = 0; r < mtd->region_cnt; ++r) {
-			printf("Eraseblock region %i: ", r);
-			if (mtd_regioninfo(fd, r, &reginfo) == 0) {
-				printf(" offset: %#x size: %#x numblocks: %#x\n",
-					reginfo.offset, reginfo.erasesize,
-					reginfo.numblocks);
-				if (args.map)
-					print_region_map(mtd, fd, &reginfo);
-			} else
-				printf(" info is unavailable\n");
-		}
-	} else {
-		reginfo.offset = 0;
-		reginfo.erasesize = mtd->eb_size;
-		reginfo.numblocks = mtd->eb_cnt;
-		reginfo.regionindex = 0;
-		print_region_map(mtd, fd, &reginfo);
-	}
-
-	if (fd != -1)
-		close(fd);
-}
-
-static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int mtdn)
-{
-	int err;
-	struct mtd_dev_info mtd;
-
-	err = mtd_get_dev_info1(libmtd, mtdn, &mtd);
-	if (err) {
-		if (errno == ENODEV)
-			return errmsg("mtd%d does not correspond to any "
-				      "existing MTD device", mtdn);
-		return sys_errmsg("cannot get information about MTD device %d",
-				  mtdn);
-	}
-
-	printf("mtd%d\n", mtd.mtd_num);
-	printf("Name:                           %s\n", mtd.name);
-	printf("Type:                           %s\n", mtd.type_str);
-	printf("Eraseblock size:                ");
-	ubiutils_print_bytes(mtd.eb_size, 0);
-	printf("\n");
-	printf("Amount of eraseblocks:          %d (", mtd.eb_cnt);
-	ubiutils_print_bytes(mtd.size, 0);
-	printf(")\n");
-	printf("Minimum input/output unit size: %d %s\n",
-	       mtd.min_io_size, mtd.min_io_size > 1 ? "bytes" : "byte");
-	if (mtd_info->sysfs_supported)
-		printf("Sub-page size:                  %d %s\n",
-		       mtd.subpage_size,
-		       mtd.subpage_size > 1 ? "bytes" : "byte");
-	else if (mtd.type == MTD_NANDFLASH)
-		printf("Sub-page size:                  unknown\n");
-
-	if (mtd.oob_size > 0)
-		printf("OOB size:                       %d bytes\n",
-		       mtd.oob_size);
-	if (mtd.region_cnt > 0)
-		printf("Additional erase regions:       %d\n", mtd.oob_size);
-	if (mtd_info->sysfs_supported)
-		printf("Character device major/minor:   %d:%d\n",
-		       mtd.major, mtd.minor);
-	printf("Bad blocks are allowed:         %s\n",
-	       mtd.bb_allowed ? "true" : "false");
-	printf("Device is writable:             %s\n",
-	      mtd.writable ? "true" : "false");
-
-	if (args.ubinfo)
-		print_ubi_info(mtd_info, &mtd);
-
-	print_region_info(&mtd);
-
-	printf("\n");
-	return 0;
-}
-
-static int print_general_info(libmtd_t libmtd, const struct mtd_info *mtd_info,
-			      int all)
-{
-	int i, err, first = 1;
-	struct mtd_dev_info mtd;
-
-	printf("Count of MTD devices:           %d\n", mtd_info->mtd_dev_cnt);
-	if (mtd_info->mtd_dev_cnt == 0)
-		return 0;
-
-	for (i = mtd_info->lowest_mtd_num;
-	     i <= mtd_info->highest_mtd_num; i++) {
-		err = mtd_get_dev_info1(libmtd, i, &mtd);
-		if (err == -1) {
-			if (errno == ENODEV)
-				continue;
-			return sys_errmsg("libmtd failed get MTD device %d "
-					  "information", i);
-		}
-
-		if (!first)
-			printf(", mtd%d", i);
-		else {
-			printf("Present MTD devices:            mtd%d", i);
-			first = 0;
-		}
-	}
-	printf("\n");
-	printf("Sysfs interface supported:      %s\n",
-	       mtd_info->sysfs_supported ? "yes" : "no");
-
-	if (!all)
-		return 0;
-
-	first = 1;
-	printf("\n");
-
-	for (i = mtd_info->lowest_mtd_num;
-	     i <= mtd_info->highest_mtd_num; i++) {
-		err = print_dev_info(libmtd, mtd_info, i);
-		if (err)
-			return err;
-	}
-
-	return 0;
-}
-
-int main(int argc, char * const argv[])
-{
-	int err;
-	libmtd_t libmtd;
-	struct mtd_info mtd_info;
-
-	err = parse_opt(argc, argv);
-	if (err)
-		return -1;
-
-	libmtd = libmtd_open();
-	if (libmtd == NULL) {
-		if (errno == 0)
-			return errmsg("MTD is not present in the system");
-		return sys_errmsg("cannot open libmtd");
-	}
-
-	err = mtd_get_info(libmtd, &mtd_info);
-	if (err) {
-		if (errno == ENODEV)
-			return errmsg("MTD is not present");
-		return sys_errmsg("cannot get MTD information");
-	}
-
-	if (args.node) {
-		/*
-		 * A character device was specified, translate this to MTD
-		 * device number.
-		 */
-		err = translate_dev(libmtd, args.node);
-		if (err)
-			goto out_libmtd;
-	}
-
-	if (args.mtdn == -1)
-		err = print_general_info(libmtd, &mtd_info, args.all);
-	else
-		err = print_dev_info(libmtd, &mtd_info, args.mtdn);
-	if (err)
-		goto out_libmtd;
-
-	libmtd_close(libmtd);
-	return 0;
-
-out_libmtd:
-	libmtd_close(libmtd);
-	return -1;
-}
diff --git a/ubi-utils/src/ubiattach.c b/ubi-utils/src/ubiattach.c
deleted file mode 100644
index 4f18e99..0000000
--- a/ubi-utils/src/ubiattach.c
+++ /dev/null
@@ -1,225 +0,0 @@
-/*
- * Copyright (C) 2007 Nokia Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc., 51
- * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
- */
-
-/*
- * An utility to attach MTD devices to UBI.
- *
- * Author: Artem Bityutskiy
- */
-
-#define PROGRAM_VERSION "1.1"
-#define PROGRAM_NAME    "ubiattach"
-
-#include <stdio.h>
-#include <stdint.h>
-#include <getopt.h>
-#include <stdlib.h>
-#include <string.h>
-
-#include <libubi.h>
-#include "common.h"
-#include "ubiutils-common.h"
-
-#define DEFAULT_CTRL_DEV "/dev/ubi_ctrl"
-
-/* The variables below are set by command line arguments */
-struct args {
-	int devn;
-	int mtdn;
-	int vidoffs;
-	const char *node;
-	const char *dev;
-};
-
-static struct args args = {
-	.devn = UBI_DEV_NUM_AUTO,
-	.mtdn = -1,
-	.vidoffs = 0,
-	.node = NULL,
-	.dev = NULL,
-};
-
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-			 " - a tool to attach MTD device to UBI.";
-
-static const char optionsstr[] =
-"-d, --devn=<number>   the number to assign to the newly created UBI device\n"
-"                      (assigned automatically if this is not specified)\n"
-"-p, --dev-path=<path> path to MTD device node to attach\n"
-"-m, --mtdn=<number>   MTD device number to attach (alternative method, e.g\n"
-"                      if the character device node does not exist)\n"
-"-O, --vid-hdr-offset  VID header offset (do not specify this unless you really\n"
-"                      know what you are doing, the default should be optimal)\n"
-"-h, --help            print help message\n"
-"-V, --version         print program version";
-
-static const char usage[] =
-"Usage: " PROGRAM_NAME " [<UBI control device node file name>]\n"
-"\t[-m <MTD device number>] [-d <UBI device number>] [-p <path to device>]\n"
-"\t[--mtdn=<MTD device number>] [--devn=<UBI device number>]\n"
-"\t[--dev-path=<path to device>]\n"
-"UBI control device defaults to " DEFAULT_CTRL_DEV " if not supplied.\n"
-"Example 1: " PROGRAM_NAME " -p /dev/mtd0 - attach /dev/mtd0 to UBI\n"
-"Example 2: " PROGRAM_NAME " -m 0 - attach MTD device 0 (mtd0) to UBI\n"
-"Example 3: " PROGRAM_NAME " -m 0 -d 3 - attach MTD device 0 (mtd0) to UBI\n"
-"           and create UBI device number 3 (ubi3)";
-
-static const struct option long_options[] = {
-	{ .name = "devn",           .has_arg = 1, .flag = NULL, .val = 'd' },
-	{ .name = "dev-path",       .has_arg = 1, .flag = NULL, .val = 'p' },
-	{ .name = "mtdn",           .has_arg = 1, .flag = NULL, .val = 'm' },
-	{ .name = "vid-hdr-offset", .has_arg = 1, .flag = NULL, .val = 'O' },
-	{ .name = "help",           .has_arg = 0, .flag = NULL, .val = 'h' },
-	{ .name = "version",        .has_arg = 0, .flag = NULL, .val = 'V' },
-	{ NULL, 0, NULL, 0},
-};
-
-static int parse_opt(int argc, char * const argv[])
-{
-	while (1) {
-		int key, error = 0;
-
-		key = getopt_long(argc, argv, "p:m:d:O:hV", long_options, NULL);
-		if (key == -1)
-			break;
-
-		switch (key) {
-		case 'p':
-			args.dev = optarg;
-			break;
-		case 'd':
-			args.devn = simple_strtoul(optarg, &error);
-			if (error || args.devn < 0)
-				return errmsg("bad UBI device number: \"%s\"", optarg);
-
-			break;
-
-		case 'm':
-			args.mtdn = simple_strtoul(optarg, &error);
-			if (error || args.mtdn < 0)
-				return errmsg("bad MTD device number: \"%s\"", optarg);
-
-			break;
-
-		case 'O':
-			args.vidoffs = simple_strtoul(optarg, &error);
-			if (error || args.vidoffs <= 0)
-				return errmsg("bad VID header offset: \"%s\"", optarg);
-
-			break;
-
-		case 'h':
-			printf("%s\n\n", doc);
-			printf("%s\n\n", usage);
-			printf("%s\n", optionsstr);
-			exit(EXIT_SUCCESS);
-
-		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
-			exit(EXIT_SUCCESS);
-
-		case ':':
-			return errmsg("parameter is missing");
-
-		default:
-			fprintf(stderr, "Use -h for help\n");
-			return -1;
-		}
-	}
-
-	if (optind == argc)
-		args.node = DEFAULT_CTRL_DEV;
-	else if (optind != argc - 1)
-		return errmsg("more then one UBI control device specified (use -h for help)");
-	else
-		args.node = argv[optind];
-
-	if (args.mtdn == -1 && args.dev == NULL)
-		return errmsg("MTD device to attach was not specified (use -h for help)");
-
-	return 0;
-}
-
-int main(int argc, char * const argv[])
-{
-	int err;
-	libubi_t libubi;
-	struct ubi_info ubi_info;
-	struct ubi_dev_info dev_info;
-	struct ubi_attach_request req;
-
-	err = parse_opt(argc, argv);
-	if (err)
-		return -1;
-
-	libubi = libubi_open();
-	if (!libubi) {
-		if (errno == 0)
-			return errmsg("UBI is not present in the system");
-		return sys_errmsg("cannot open libubi");
-	}
-
-	/*
-	 * Make sure the kernel is fresh enough and this feature is supported.
-	 */
-	err = ubi_get_info(libubi, &ubi_info);
-	if (err) {
-		sys_errmsg("cannot get UBI information");
-		goto out_libubi;
-	}
-
-	if (ubi_info.ctrl_major == -1) {
-		errmsg("MTD attach/detach feature is not supported by your kernel");
-		goto out_libubi;
-	}
-
-	req.dev_num = args.devn;
-	req.mtd_num = args.mtdn;
-	req.vid_hdr_offset = args.vidoffs;
-	req.mtd_dev_node = args.dev;
-
-	err = ubi_attach(libubi, args.node, &req);
-	if (err) {
-		if (args.dev)
-			sys_errmsg("cannot attach \"%s\"", args.dev);
-		else
-			sys_errmsg("cannot attach mtd%d", args.mtdn);
-		goto out_libubi;
-	}
-
-	/* Print some information about the new UBI device */
-	err = ubi_get_dev_info1(libubi, req.dev_num, &dev_info);
-	if (err) {
-		sys_errmsg("cannot get information about newly created UBI device");
-		goto out_libubi;
-	}
-
-	printf("UBI device number %d, total %d LEBs (", dev_info.dev_num, dev_info.total_lebs);
-	ubiutils_print_bytes(dev_info.total_bytes, 0);
-	printf("), available %d LEBs (", dev_info.avail_lebs);
-	ubiutils_print_bytes(dev_info.avail_bytes, 0);
-	printf("), LEB size ");
-	ubiutils_print_bytes(dev_info.leb_size, 1);
-	printf("\n");
-
-	libubi_close(libubi);
-	return 0;
-
-out_libubi:
-	libubi_close(libubi);
-	return -1;
-}
diff --git a/ubi-utils/src/ubicrc32.c b/ubi-utils/src/ubicrc32.c
deleted file mode 100644
index 73ec595..0000000
--- a/ubi-utils/src/ubicrc32.c
+++ /dev/null
@@ -1,124 +0,0 @@
-/*
- * Copyright (c) International Business Machines Corp., 2006
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- */
-
-/*
- * Calculate CRC32 with UBI start value (0xFFFFFFFF) for a given binary image.
- *
- * Author: Oliver Lohmann
- */
-
-#define PROGRAM_VERSION "1.0"
-#define PROGRAM_NAME    "ubicrc32"
-
-#include <stdio.h>
-#include <stdint.h>
-#include <stdlib.h>
-#include <getopt.h>
-#include <unistd.h>
-#include <mtd/ubi-media.h>
-#include <crc32.h>
-
-#include "common.h"
-
-#define BUFSIZE 4096
-
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-			 " - a tool to calculate CRC32 with UBI start value (0xFFFFFFFF)";
-
-static const char optionsstr[] =
-"-h, --help                    print help message\n"
-"-V, --version                 print program version";
-
-static const char usage[] =
-"Usage: " PROGRAM_NAME " <file to calculate CRC32 for> [-h] [--help]";
-
-static const struct option long_options[] = {
-	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
-	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
-	{ NULL, 0, NULL, 0},
-};
-
-static int parse_opt(int argc, char * const argv[])
-{
-	while (1) {
-		int key;
-
-		key = getopt_long(argc, argv, "hV", long_options, NULL);
-		if (key == -1)
-			break;
-
-		switch (key) {
-		case 'h':
-			printf("%s\n\n", doc);
-			printf("%s\n\n", usage);
-			printf("%s\n", optionsstr);
-			exit(EXIT_SUCCESS);
-
-		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
-			exit(EXIT_SUCCESS);
-
-		case ':':
-			return errmsg("parameter is missing");
-
-		default:
-			fprintf(stderr, "Use -h for help\n");
-			return -1;
-		}
-	}
-
-	return 0;
-}
-
-int main(int argc, char * const argv[])
-{
-	int err = 0;
-	uint32_t crc = UBI_CRC32_INIT;
-	char buf[BUFSIZE];
-	FILE *fp;
-
-	if (argc > 1) {
-		fp = fopen(argv[1], "r");
-		if (!fp)
-			return sys_errmsg("cannot open \"%s\"", argv[1]);
-	} else
-		fp = stdin;
-
-	err = parse_opt(argc, argv);
-	if (err)
-		return err;
-
-	while (!feof(fp)) {
-		size_t read;
-
-		read = fread(buf, 1, BUFSIZE, fp);
-		if (ferror(fp)) {
-			sys_errmsg("cannot read input file");
-			err = -1;
-			goto out_close;
-		}
-		crc = mtd_crc32(crc, buf, read);
-	}
-
-	printf("0x%08x\n", crc);
-
-out_close:
-	if (fp != stdin)
-		fclose(fp);
-	return err;
-}
diff --git a/ubi-utils/src/ubidetach.c b/ubi-utils/src/ubidetach.c
deleted file mode 100644
index 668f1bd..0000000
--- a/ubi-utils/src/ubidetach.c
+++ /dev/null
@@ -1,208 +0,0 @@
-/*
- * Copyright (C) 2007 Nokia Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc., 51
- * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
- */
-
-/*
- * An utility to delete UBI devices (detach MTD devices from UBI).
- *
- * Author: Artem Bityutskiy
- */
-
-#define PROGRAM_VERSION "1.1"
-#define PROGRAM_NAME    "ubidetach"
-
-#include <stdio.h>
-#include <stdint.h>
-#include <getopt.h>
-#include <stdlib.h>
-#include <string.h>
-
-#include <libubi.h>
-#include "common.h"
-
-#define DEFAULT_CTRL_DEV "/dev/ubi_ctrl"
-
-/* The variables below are set by command line arguments */
-struct args {
-	int devn;
-	int mtdn;
-	const char *node;
-	const char *dev;
-};
-
-static struct args args = {
-	.devn = UBI_DEV_NUM_AUTO,
-	.mtdn = -1,
-	.node = NULL,
-	.dev = NULL,
-};
-
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-" - tool to remove UBI devices (detach MTD devices from UBI)";
-
-static const char optionsstr[] =
-"-d, --devn=<UBI device number>  UBI device number to delete\n"
-"-p, --dev-path=<path to device> or alternatively, MTD device node path to detach\n"
-"-m, --mtdn=<MTD device number>  or alternatively, MTD device number to detach\n"
-"-h, --help                      print help message\n"
-"-V, --version                   print program version";
-
-static const char usage[] =
-"Usage: " PROGRAM_NAME " [<UBI control device node file name>]\n"
-"\t[-d <UBI device number>] [-m <MTD device number>] [-p <path to device>]\n"
-"\t[--devn=<UBI device number>] [--mtdn=<MTD device number>]\n"
-"\t[--dev-path=<path to device>]\n"
-"UBI control device defaults to " DEFAULT_CTRL_DEV " if not supplied.\n"
-"Example 1: " PROGRAM_NAME " -p /dev/mtd0 - detach MTD device /dev/mtd0\n"
-"Example 2: " PROGRAM_NAME " -d 2 - delete UBI device 2 (ubi2)\n"
-"Example 3: " PROGRAM_NAME " -m 0 - detach MTD device 0 (mtd0)";
-
-static const struct option long_options[] = {
-	{ .name = "devn",     .has_arg = 1, .flag = NULL, .val = 'd' },
-	{ .name = "dev-path", .has_arg = 1, .flag = NULL, .val = 'p' },
-	{ .name = "mtdn",     .has_arg = 1, .flag = NULL, .val = 'm' },
-	{ .name = "help",     .has_arg = 0, .flag = NULL, .val = 'h' },
-	{ .name = "version",  .has_arg = 0, .flag = NULL, .val = 'V' },
-	{ NULL, 0, NULL, 0},
-};
-
-static int parse_opt(int argc, char * const argv[])
-{
-	while (1) {
-		int key, error = 0;
-
-		key = getopt_long(argc, argv, "p:m:d:hV", long_options, NULL);
-		if (key == -1)
-			break;
-
-		switch (key) {
-		case 'p':
-			args.dev = optarg;
-			break;
-		case 'd':
-			args.devn = simple_strtoul(optarg, &error);
-			if (error || args.devn < 0)
-				return errmsg("bad UBI device number: \"%s\"", optarg);
-
-			break;
-
-		case 'm':
-			args.mtdn = simple_strtoul(optarg, &error);
-			if (error || args.mtdn < 0)
-				return errmsg("bad MTD device number: \"%s\"", optarg);
-
-			break;
-
-		case 'h':
-			printf("%s\n\n", doc);
-			printf("%s\n\n", usage);
-			printf("%s\n", optionsstr);
-			exit(EXIT_SUCCESS);
-
-		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
-			exit(EXIT_SUCCESS);
-
-		case ':':
-			return errmsg("parameter is missing");
-
-		default:
-			fprintf(stderr, "Use -h for help\n");
-			return -1;
-		}
-	}
-
-	if (optind == argc)
-		args.node = DEFAULT_CTRL_DEV;
-	else if (optind != argc - 1)
-		return errmsg("more then one UBI control device specified (use -h for help)");
-	else
-		args.node = argv[optind];
-
-	if (args.mtdn == -1 && args.devn == -1 && args.dev == NULL)
-		return errmsg("neither MTD nor UBI devices were specified (use -h for help)");
-
-	if (args.devn != -1) {
-		if (args.mtdn != -1 || args.dev != NULL)
-			return errmsg("specify either MTD or UBI device (use -h for help)");
-
-	} else if (args.mtdn != -1 && args.dev != NULL)
-		return errmsg("specify either MTD number or device node (use -h for help)");
-
-	return 0;
-}
-
-int main(int argc, char * const argv[])
-{
-	int err;
-	libubi_t libubi;
-	struct ubi_info ubi_info;
-
-	err = parse_opt(argc, argv);
-	if (err)
-		return -1;
-
-	libubi = libubi_open();
-	if (!libubi) {
-		if (errno == 0)
-			return errmsg("UBI is not present in the system");
-		return sys_errmsg("cannot open libubi");
-	}
-
-	/*
-	 * Make sure the kernel is fresh enough and this feature is supported.
-	 */
-	err = ubi_get_info(libubi, &ubi_info);
-	if (err) {
-		sys_errmsg("cannot get UBI information");
-		goto out_libubi;
-	}
-
-	if (ubi_info.ctrl_major == -1) {
-		errmsg("MTD detach/detach feature is not supported by your kernel");
-		goto out_libubi;
-	}
-
-	if (args.devn != -1) {
-		err = ubi_remove_dev(libubi, args.node, args.devn);
-		if (err) {
-			sys_errmsg("cannot remove ubi%d", args.devn);
-			goto out_libubi;
-		}
-	} else {
-		if (args.dev != NULL) {
-			err = ubi_detach(libubi, args.node, args.dev);
-			if (err) {
-				sys_errmsg("cannot detach \"%s\"", args.dev);
-				goto out_libubi;
-			}
-		} else {
-			err = ubi_detach_mtd(libubi, args.node, args.mtdn);
-			if (err) {
-				sys_errmsg("cannot detach mtd%d", args.mtdn);
-				goto out_libubi;
-			}
-		}
-	}
-
-	libubi_close(libubi);
-	return 0;
-
-out_libubi:
-	libubi_close(libubi);
-	return -1;
-}
-
diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
deleted file mode 100644
index c4b944a..0000000
--- a/ubi-utils/src/ubiformat.c
+++ /dev/null
@@ -1,950 +0,0 @@
-/*
- * Copyright (C) 2008 Nokia Corporation
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- */
-
-/*
- * An utility to format MTD devices into UBI and flash UBI images.
- *
- * Author: Artem Bityutskiy
- */
-
-/*
- * Maximum amount of consequtive eraseblocks which are considered as normal by
- * this utility. Otherwise it is assume that something is wrong with the flash
- * or the driver, and eraseblocks are stopped being marked as bad.
- */
-#define MAX_CONSECUTIVE_BAD_BLOCKS 4
-
-#define PROGRAM_VERSION "1.5"
-#define PROGRAM_NAME    "ubiformat"
-
-#include <sys/stat.h>
-#include <unistd.h>
-#include <stdint.h>
-#include <stdlib.h>
-#include <getopt.h>
-#include <fcntl.h>
-
-#include <libubi.h>
-#include <libmtd.h>
-#include <libscan.h>
-#include <libubigen.h>
-#include <mtd_swab.h>
-#include <crc32.h>
-#include "common.h"
-#include "ubiutils-common.h"
-
-/* The variables below are set by command line arguments */
-struct args {
-	unsigned int yes:1;
-	unsigned int quiet:1;
-	unsigned int verbose:1;
-	unsigned int override_ec:1;
-	unsigned int novtbl:1;
-	unsigned int manual_subpage;
-	int subpage_size;
-	int vid_hdr_offs;
-	int ubi_ver;
-	uint32_t image_seq;
-	off_t image_sz;
-	long long ec;
-	const char *image;
-	const char *node;
-	int node_fd;
-};
-
-static struct args args =
-{
-	.ubi_ver   = 1,
-};
-
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-		" - a tool to format MTD devices and flash UBI images";
-
-static const char optionsstr[] =
-"-s, --sub-page-size=<bytes>  minimum input/output unit used for UBI\n"
-"                             headers, e.g. sub-page size in case of NAND\n"
-"                             flash (equivalent to the minimum input/output\n"
-"                             unit size by default)\n"
-"-O, --vid-hdr-offset=<offs>  offset if the VID header from start of the\n"
-"                             physical eraseblock (default is the next\n"
-"                             minimum I/O unit or sub-page after the EC\n"
-"                             header)\n"
-"-n, --no-volume-table        only erase all eraseblock and preserve erase\n"
-"                             counters, do not write empty volume table\n"
-"-f, --flash-image=<file>     flash image file, or '-' for stdin\n"
-"-S, --image-size=<bytes>     bytes in input, if not reading from file\n"
-"-e, --erase-counter=<value>  use <value> as the erase counter value for all\n"
-"                             eraseblocks\n"
-"-x, --ubi-ver=<num>          UBI version number to put to EC headers\n"
-"                             (default is 1)\n"
-"-Q, --image-seq=<num>        32-bit UBI image sequence number to use\n"
-"                             (by default a random number is picked)\n"
-"-y, --yes                    assume the answer is \"yes\" for all question\n"
-"                             this program would otherwise ask\n"
-"-q, --quiet                  suppress progress percentage information\n"
-"-v, --verbose                be verbose\n"
-"-h, -?, --help               print help message\n"
-"-V, --version                print program version\n";
-
-static const char usage[] =
-"Usage: " PROGRAM_NAME " <MTD device node file name> [-s <bytes>] [-O <offs>] [-n]\n"
-"\t\t\t[-f <file>] [-S <bytes>] [-e <value>] [-x <num>] [-y] [-q] [-v] [-h] [-v]\n"
-"\t\t\t[--sub-page-size=<bytes>] [--vid-hdr-offset=<offs>] [--no-volume-table]\n"
-"\t\t\t[--flash-image=<file>] [--image-size=<bytes>] [--erase-counter=<value>]\n"
-"\t\t\t[--ubi-ver=<num>] [--yes] [--quiet] [--verbose] [--help] [--version]\n\n"
-"Example 1: " PROGRAM_NAME " /dev/mtd0 -y - format MTD device number 0 and do\n"
-"           not ask questions.\n"
-"Example 2: " PROGRAM_NAME " /dev/mtd0 -q -e 0 - format MTD device number 0,\n"
-"           be quiet and force erase counter value 0.";
-
-static const struct option long_options[] = {
-	{ .name = "sub-page-size",   .has_arg = 1, .flag = NULL, .val = 's' },
-	{ .name = "vid-hdr-offset",  .has_arg = 1, .flag = NULL, .val = 'O' },
-	{ .name = "no-volume-table", .has_arg = 0, .flag = NULL, .val = 'n' },
-	{ .name = "flash-image",     .has_arg = 1, .flag = NULL, .val = 'f' },
-	{ .name = "image-size",      .has_arg = 1, .flag = NULL, .val = 'S' },
-	{ .name = "yes",             .has_arg = 0, .flag = NULL, .val = 'y' },
-	{ .name = "erase-counter",   .has_arg = 1, .flag = NULL, .val = 'e' },
-	{ .name = "quiet",           .has_arg = 0, .flag = NULL, .val = 'q' },
-	{ .name = "verbose",         .has_arg = 0, .flag = NULL, .val = 'v' },
-	{ .name = "ubi-ver",         .has_arg = 1, .flag = NULL, .val = 'x' },
-	{ .name = "help",            .has_arg = 0, .flag = NULL, .val = 'h' },
-	{ .name = "version",         .has_arg = 0, .flag = NULL, .val = 'V' },
-	{ NULL, 0, NULL, 0},
-};
-
-static int parse_opt(int argc, char * const argv[])
-{
-	ubiutils_srand();
-	args.image_seq = rand();
-
-	while (1) {
-		int key, error = 0;
-		unsigned long int image_seq;
-
-		key = getopt_long(argc, argv, "nh?Vyqve:x:s:O:f:S:", long_options, NULL);
-		if (key == -1)
-			break;
-
-		switch (key) {
-		case 's':
-			args.subpage_size = ubiutils_get_bytes(optarg);
-			if (args.subpage_size <= 0)
-				return errmsg("bad sub-page size: \"%s\"", optarg);
-			if (!is_power_of_2(args.subpage_size))
-				return errmsg("sub-page size should be power of 2");
-			break;
-
-		case 'O':
-			args.vid_hdr_offs = simple_strtoul(optarg, &error);
-			if (error || args.vid_hdr_offs <= 0)
-				return errmsg("bad VID header offset: \"%s\"", optarg);
-			break;
-
-		case 'e':
-			args.ec = simple_strtoull(optarg, &error);
-			if (error || args.ec < 0)
-				return errmsg("bad erase counter value: \"%s\"", optarg);
-			if (args.ec >= EC_MAX)
-				return errmsg("too high erase %llu, counter, max is %u", args.ec, EC_MAX);
-			args.override_ec = 1;
-			break;
-
-		case 'f':
-			args.image = optarg;
-			break;
-
-		case 'S':
-			args.image_sz = ubiutils_get_bytes(optarg);
-			if (args.image_sz <= 0)
-				return errmsg("bad image-size: \"%s\"", optarg);
-			break;
-
-		case 'n':
-			args.novtbl = 1;
-			break;
-
-		case 'y':
-			args.yes = 1;
-			break;
-
-		case 'q':
-			args.quiet = 1;
-			break;
-
-		case 'x':
-			args.ubi_ver = simple_strtoul(optarg, &error);
-			if (error || args.ubi_ver < 0)
-				return errmsg("bad UBI version: \"%s\"", optarg);
-			break;
-
-		case 'Q':
-			image_seq = simple_strtoul(optarg, &error);
-			if (error || image_seq > 0xFFFFFFFF)
-				return errmsg("bad UBI image sequence number: \"%s\"", optarg);
-			args.image_seq = image_seq;
-			break;
-
-
-		case 'v':
-			args.verbose = 1;
-			break;
-
-		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
-			exit(EXIT_SUCCESS);
-
-		case 'h':
-		case '?':
-			printf("%s\n\n", doc);
-			printf("%s\n\n", usage);
-			printf("%s\n", optionsstr);
-			exit(EXIT_SUCCESS);
-
-		case ':':
-			return errmsg("parameter is missing");
-
-		default:
-			fprintf(stderr, "Use -h for help\n");
-			return -1;
-		}
-	}
-
-	if (args.quiet && args.verbose)
-		return errmsg("using \"-q\" and \"-v\" at the same time does not make sense");
-
-	if (optind == argc)
-		return errmsg("MTD device name was not specified (use -h for help)");
-	else if (optind != argc - 1)
-		return errmsg("more then one MTD device specified (use -h for help)");
-
-	if (args.image && args.novtbl)
-		return errmsg("-n cannot be used together with -f");
-
-
-	args.node = argv[optind];
-	return 0;
-}
-
-static int want_exit(void)
-{
-	char buf[4];
-
-	while (1) {
-		normsg_cont("continue? (yes/no)  ");
-		if (scanf("%3s", buf) == EOF) {
-			sys_errmsg("scanf returned unexpected EOF, assume \"yes\"");
-			return 1;
-		}
-		if (!strncmp(buf, "yes", 3) || !strncmp(buf, "y", 1))
-			return 0;
-		if (!strncmp(buf, "no", 2) || !strncmp(buf, "n", 1))
-			return 1;
-	}
-}
-
-static int answer_is_yes(void)
-{
-	char buf[4];
-
-	while (1) {
-		if (scanf("%3s", buf) == EOF) {
-			sys_errmsg("scanf returned unexpected EOF, assume \"no\"");
-			return 0;
-		}
-		if (!strncmp(buf, "yes", 3) || !strncmp(buf, "y", 1))
-			return 1;
-		if (!strncmp(buf, "no", 2) || !strncmp(buf, "n", 1))
-			return 0;
-	}
-}
-
-static void print_bad_eraseblocks(const struct mtd_dev_info *mtd,
-				  const struct ubi_scan_info *si)
-{
-	int first = 1, eb;
-
-	if (si->bad_cnt == 0)
-		return;
-
-	normsg_cont("%d bad eraseblocks found, numbers: ", si->bad_cnt);
-	for (eb = 0; eb < mtd->eb_cnt; eb++) {
-		if (si->ec[eb] != EB_BAD)
-			continue;
-		if (first) {
-			printf("%d", eb);
-			first = 0;
-		} else
-			printf(", %d", eb);
-	}
-	printf("\n");
-}
-
-static int change_ech(struct ubi_ec_hdr *hdr, uint32_t image_seq,
-		      long long ec)
-{
-	uint32_t crc;
-
-	/* Check the EC header */
-	if (be32_to_cpu(hdr->magic) != UBI_EC_HDR_MAGIC)
-		return errmsg("bad UBI magic %#08x, should be %#08x",
-			      be32_to_cpu(hdr->magic), UBI_EC_HDR_MAGIC);
-
-	crc = mtd_crc32(UBI_CRC32_INIT, hdr, UBI_EC_HDR_SIZE_CRC);
-	if (be32_to_cpu(hdr->hdr_crc) != crc)
-		return errmsg("bad CRC %#08x, should be %#08x\n",
-			      crc, be32_to_cpu(hdr->hdr_crc));
-
-	hdr->image_seq = cpu_to_be32(image_seq);
-	hdr->ec = cpu_to_be64(ec);
-	crc = mtd_crc32(UBI_CRC32_INIT, hdr, UBI_EC_HDR_SIZE_CRC);
-	hdr->hdr_crc = cpu_to_be32(crc);
-
-	return 0;
-}
-
-static int drop_ffs(const struct mtd_dev_info *mtd, const void *buf, int len)
-{
-	int i;
-
-        for (i = len - 1; i >= 0; i--)
-		if (((const uint8_t *)buf)[i] != 0xFF)
-		      break;
-
-        /* The resulting length must be aligned to the minimum flash I/O size */
-        len = i + 1;
-	len = (len + mtd->min_io_size - 1) / mtd->min_io_size;
-	len *=  mtd->min_io_size;
-        return len;
-}
-
-static int open_file(off_t *sz)
-{
-	int fd;
-
-	if (!strcmp(args.image, "-")) {
-		if (args.image_sz == 0)
-			return errmsg("must use '-S' with non-zero value when reading from stdin");
-
-		*sz = args.image_sz;
-		fd  = dup(STDIN_FILENO);
-		if (fd < 0)
-			return sys_errmsg("failed to dup stdin");
-	} else {
-		struct stat st;
-
-		if (stat(args.image, &st))
-			return sys_errmsg("cannot open \"%s\"", args.image);
-
-		*sz = st.st_size;
-		fd  = open(args.image, O_RDONLY);
-		if (fd == -1)
-			return sys_errmsg("cannot open \"%s\"", args.image);
-	}
-
-	return fd;
-}
-
-static int read_all(int fd, void *buf, size_t len)
-{
-	while (len > 0) {
-		ssize_t l = read(fd, buf, len);
-		if (l == 0)
-			return errmsg("eof reached; %zu bytes remaining", len);
-		else if (l > 0) {
-			buf += l;
-			len -= l;
-		} else if (errno == EINTR || errno == EAGAIN)
-			continue;
-		else
-			return sys_errmsg("reading failed; %zu bytes remaining", len);
-	}
-
-	return 0;
-}
-
-/*
- * Returns %-1 if consecutive bad blocks exceeds the
- * MAX_CONSECUTIVE_BAD_BLOCKS and returns %0 otherwise.
- */
-static int consecutive_bad_check(int eb)
-{
-	static int consecutive_bad_blocks = 1;
-	static int prev_bb = -1;
-
-	if (prev_bb == -1)
-		prev_bb = eb;
-
-	if (eb == prev_bb + 1)
-		consecutive_bad_blocks += 1;
-	else
-		consecutive_bad_blocks = 1;
-
-	prev_bb = eb;
-
-	if (consecutive_bad_blocks >= MAX_CONSECUTIVE_BAD_BLOCKS) {
-		if (!args.quiet)
-			printf("\n");
-		return errmsg("consecutive bad blocks exceed limit: %d, bad flash?",
-		              MAX_CONSECUTIVE_BAD_BLOCKS);
-	}
-
-	return 0;
-}
-
-/* TODO: we should actually torture the PEB before marking it as bad */
-static int mark_bad(const struct mtd_dev_info *mtd, struct ubi_scan_info *si, int eb)
-{
-	int err;
-
-	if (!args.yes) {
-		normsg_cont("mark it as bad? Continue (yes/no) ");
-		if (!answer_is_yes())
-			return -1;
-	}
-
-	if (!args.quiet)
-		normsg_cont("marking block %d bad", eb);
-
-	if (!args.quiet)
-		printf("\n");
-
-	if (!mtd->bb_allowed) {
-		if (!args.quiet)
-			printf("\n");
-		return errmsg("bad blocks not supported by this flash");
-	}
-
-	err = mtd_mark_bad(mtd, args.node_fd, eb);
-	if (err)
-		return err;
-
-	si->bad_cnt += 1;
-	si->ec[eb] = EB_BAD;
-
-	return consecutive_bad_check(eb);
-}
-
-static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
-		       const struct ubigen_info *ui, struct ubi_scan_info *si)
-{
-	int fd, img_ebs, eb, written_ebs = 0, divisor;
-	off_t st_size;
-
-	fd = open_file(&st_size);
-	if (fd < 0)
-		return fd;
-
-	img_ebs = st_size / mtd->eb_size;
-
-	if (img_ebs > si->good_cnt) {
-		sys_errmsg("file \"%s\" is too large (%lld bytes)",
-			   args.image, (long long)st_size);
-		goto out_close;
-	}
-
-	if (st_size % mtd->eb_size) {
-		return sys_errmsg("file \"%s\" (size %lld bytes) is not multiple of ""eraseblock size (%d bytes)",
-				  args.image, (long long)st_size, mtd->eb_size);
-		goto out_close;
-	}
-
-	verbose(args.verbose, "will write %d eraseblocks", img_ebs);
-	divisor = img_ebs;
-	for (eb = 0; eb < mtd->eb_cnt; eb++) {
-		int err, new_len;
-		char buf[mtd->eb_size];
-		long long ec;
-
-		if (!args.quiet && !args.verbose) {
-			printf("\r" PROGRAM_NAME ": flashing eraseblock %d -- %2lld %% complete  ",
-			       eb, (long long)(eb + 1) * 100 / divisor);
-			fflush(stdout);
-		}
-
-		if (si->ec[eb] == EB_BAD) {
-			divisor += 1;
-			continue;
-		}
-
-		if (args.verbose) {
-			normsg_cont("eraseblock %d: erase", eb);
-			fflush(stdout);
-		}
-
-		err = mtd_erase(libmtd, mtd, args.node_fd, eb);
-		if (err) {
-			if (!args.quiet)
-				printf("\n");
-			sys_errmsg("failed to erase eraseblock %d", eb);
-
-			if (errno != EIO)
-				goto out_close;
-
-			if (mark_bad(mtd, si, eb))
-				goto out_close;
-
-			continue;
-		}
-
-		err = read_all(fd, buf, mtd->eb_size);
-		if (err) {
-			sys_errmsg("failed to read eraseblock %d from \"%s\"",
-				   written_ebs, args.image);
-			goto out_close;
-		}
-
-		if (args.override_ec)
-			ec = args.ec;
-		else if (si->ec[eb] <= EC_MAX)
-			ec = si->ec[eb] + 1;
-		else
-			ec = si->mean_ec;
-
-		if (args.verbose) {
-			printf(", change EC to %lld", ec);
-			fflush(stdout);
-		}
-
-		err = change_ech((struct ubi_ec_hdr *)buf, ui->image_seq, ec);
-		if (err) {
-			errmsg("bad EC header at eraseblock %d of \"%s\"",
-			       written_ebs, args.image);
-			goto out_close;
-		}
-
-		if (args.verbose) {
-			printf(", write data\n");
-			fflush(stdout);
-		}
-
-		new_len = drop_ffs(mtd, buf, mtd->eb_size);
-
-		err = mtd_write(mtd, args.node_fd, eb, 0, buf, new_len);
-		if (err) {
-			sys_errmsg("cannot write eraseblock %d", eb);
-
-			if (errno != EIO)
-				goto out_close;
-
-			err = mtd_torture(libmtd, mtd, args.node_fd, eb);
-			if (err) {
-				if (mark_bad(mtd, si, eb))
-					goto out_close;
-			}
-			continue;
-		}
-		if (++written_ebs >= img_ebs)
-			break;
-	}
-
-	if (!args.quiet && !args.verbose)
-		printf("\n");
-	close(fd);
-	return eb + 1;
-
-out_close:
-	close(fd);
-	return -1;
-}
-
-static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
-		  const struct ubigen_info *ui, struct ubi_scan_info *si,
-		  int start_eb, int novtbl)
-{
-	int eb, err, write_size;
-	struct ubi_ec_hdr *hdr;
-	struct ubi_vtbl_record *vtbl;
-	int eb1 = -1, eb2 = -1;
-	long long ec1 = -1, ec2 = -1;
-
-	write_size = UBI_EC_HDR_SIZE + mtd->subpage_size - 1;
-	write_size /= mtd->subpage_size;
-	write_size *= mtd->subpage_size;
-	hdr = malloc(write_size);
-	if (!hdr)
-		return sys_errmsg("cannot allocate %d bytes of memory", write_size);
-	memset(hdr, 0xFF, write_size);
-
-	for (eb = start_eb; eb < mtd->eb_cnt; eb++) {
-		long long ec;
-
-		if (!args.quiet && !args.verbose) {
-			printf("\r" PROGRAM_NAME ": formatting eraseblock %d -- %2lld %% complete  ",
-			       eb, (long long)(eb + 1 - start_eb) * 100 / (mtd->eb_cnt - start_eb));
-			fflush(stdout);
-		}
-
-		if (si->ec[eb] == EB_BAD)
-			continue;
-
-		if (args.override_ec)
-			ec = args.ec;
-		else if (si->ec[eb] <= EC_MAX)
-			ec = si->ec[eb] + 1;
-		else
-			ec = si->mean_ec;
-		ubigen_init_ec_hdr(ui, hdr, ec);
-
-		if (args.verbose) {
-			normsg_cont("eraseblock %d: erase", eb);
-			fflush(stdout);
-		}
-
-		err = mtd_erase(libmtd, mtd, args.node_fd, eb);
-		if (err) {
-			if (!args.quiet)
-				printf("\n");
-
-			sys_errmsg("failed to erase eraseblock %d", eb);
-			if (errno != EIO)
-				goto out_free;
-
-			if (mark_bad(mtd, si, eb))
-				goto out_free;
-			continue;
-		}
-
-		if ((eb1 == -1 || eb2 == -1) && !novtbl) {
-			if (eb1 == -1) {
-				eb1 = eb;
-				ec1 = ec;
-			} else if (eb2 == -1) {
-				eb2 = eb;
-				ec2 = ec;
-			}
-			if (args.verbose)
-				printf(", do not write EC, leave for vtbl\n");
-			continue;
-		}
-
-		if (args.verbose) {
-			printf(", write EC %lld\n", ec);
-			fflush(stdout);
-		}
-
-		err = mtd_write(mtd, args.node_fd, eb, 0, hdr, write_size);
-		if (err) {
-			if (!args.quiet && !args.verbose)
-				printf("\n");
-			sys_errmsg("cannot write EC header (%d bytes buffer) to eraseblock %d",
-				   write_size, eb);
-
-			if (errno != EIO) {
-				if (!args.subpage_size != mtd->min_io_size)
-					normsg("may be sub-page size is "
-					       "incorrect?");
-				goto out_free;
-			}
-
-			err = mtd_torture(libmtd, mtd, args.node_fd, eb);
-			if (err) {
-				if (mark_bad(mtd, si, eb))
-					goto out_free;
-			}
-			continue;
-
-		}
-	}
-
-	if (!args.quiet && !args.verbose)
-		printf("\n");
-
-	if (!novtbl) {
-		if (eb1 == -1 || eb2 == -1) {
-			errmsg("no eraseblocks for volume table");
-			goto out_free;
-		}
-
-		verbose(args.verbose, "write volume table to eraseblocks %d and %d", eb1, eb2);
-		vtbl = ubigen_create_empty_vtbl(ui);
-		if (!vtbl)
-			goto out_free;
-
-		err = ubigen_write_layout_vol(ui, eb1, eb2, ec1,  ec2, vtbl,
-					      args.node_fd);
-		free(vtbl);
-		if (err) {
-			errmsg("cannot write layout volume");
-			goto out_free;
-		}
-	}
-
-	free(hdr);
-	return 0;
-
-out_free:
-	free(hdr);
-	return -1;
-}
-
-int main(int argc, char * const argv[])
-{
-	int err, verbose;
-	libmtd_t libmtd;
-	struct mtd_info mtd_info;
-	struct mtd_dev_info mtd;
-	libubi_t libubi;
-	struct ubigen_info ui;
-	struct ubi_scan_info *si;
-
-	libmtd = libmtd_open();
-	if (!libmtd)
-		return errmsg("MTD subsystem is not present");
-
-	err = parse_opt(argc, argv);
-	if (err)
-		goto out_close_mtd;
-
-	err = mtd_get_info(libmtd, &mtd_info);
-	if (err) {
-		if (errno == ENODEV)
-			errmsg("MTD is not present");
-		sys_errmsg("cannot get MTD information");
-		goto out_close_mtd;
-	}
-
-	err = mtd_get_dev_info(libmtd, args.node, &mtd);
-	if (err) {
-		sys_errmsg("cannot get information about \"%s\"", args.node);
-		goto out_close_mtd;
-	}
-
-	if (!is_power_of_2(mtd.min_io_size)) {
-		errmsg("min. I/O size is %d, but should be power of 2",
-		       mtd.min_io_size);
-		goto out_close;
-	}
-
-	if (!mtd_info.sysfs_supported) {
-		/*
-		 * Linux kernels older than 2.6.30 did not support sysfs
-		 * interface, and it is impossible to find out sub-page
-		 * size in these kernels. This is why users should
-		 * provide -s option.
-		 */
-		if (args.subpage_size == 0) {
-			warnmsg("your MTD system is old and it is impossible "
-				"to detect sub-page size. Use -s to get rid "
-				"of this warning");
-			normsg("assume sub-page to be %d", mtd.subpage_size);
-		} else {
-			mtd.subpage_size = args.subpage_size;
-			args.manual_subpage = 1;
-		}
-	} else if (args.subpage_size && args.subpage_size != mtd.subpage_size) {
-		mtd.subpage_size = args.subpage_size;
-		args.manual_subpage = 1;
-	}
-
-	if (args.manual_subpage) {
-		/* Do some sanity check */
-		if (args.subpage_size > mtd.min_io_size) {
-			errmsg("sub-page cannot be larger than min. I/O unit");
-			goto out_close;
-		}
-
-		if (mtd.min_io_size % args.subpage_size) {
-			errmsg("min. I/O unit size should be multiple of "
-			       "sub-page size");
-			goto out_close;
-		}
-	}
-
-	args.node_fd = open(args.node, O_RDWR);
-	if (args.node_fd == -1) {
-		sys_errmsg("cannot open \"%s\"", args.node);
-		goto out_close_mtd;
-	}
-
-	/* Validate VID header offset if it was specified */
-	if (args.vid_hdr_offs != 0) {
-		if (args.vid_hdr_offs % 8) {
-			errmsg("VID header offset has to be multiple of min. I/O unit size");
-			goto out_close;
-		}
-		if (args.vid_hdr_offs + (int)UBI_VID_HDR_SIZE > mtd.eb_size) {
-			errmsg("bad VID header offset");
-			goto out_close;
-		}
-	}
-
-	if (!mtd.writable) {
-		errmsg("mtd%d (%s) is a read-only device", mtd.mtd_num, args.node);
-		goto out_close;
-	}
-
-	/* Make sure this MTD device is not attached to UBI */
-	libubi = libubi_open();
-	if (libubi) {
-		int ubi_dev_num;
-
-		err = mtd_num2ubi_dev(libubi, mtd.mtd_num, &ubi_dev_num);
-		libubi_close(libubi);
-		if (!err) {
-			errmsg("please, first detach mtd%d (%s) from ubi%d",
-			       mtd.mtd_num, args.node, ubi_dev_num);
-			goto out_close;
-		}
-	}
-
-	if (!args.quiet) {
-		normsg_cont("mtd%d (%s), size ", mtd.mtd_num, mtd.type_str);
-		ubiutils_print_bytes(mtd.size, 1);
-		printf(", %d eraseblocks of ", mtd.eb_cnt);
-		ubiutils_print_bytes(mtd.eb_size, 1);
-		printf(", min. I/O size %d bytes\n", mtd.min_io_size);
-	}
-
-	if (args.quiet)
-		verbose = 0;
-	else if (args.verbose)
-		verbose = 2;
-	else
-		verbose = 1;
-	err = ubi_scan(&mtd, args.node_fd, &si, verbose);
-	if (err) {
-		errmsg("failed to scan mtd%d (%s)", mtd.mtd_num, args.node);
-		goto out_close;
-	}
-
-	if (si->good_cnt == 0) {
-		errmsg("all %d eraseblocks are bad", si->bad_cnt);
-		goto out_free;
-	}
-
-	if (si->good_cnt < 2 && (!args.novtbl || args.image)) {
-		errmsg("too few non-bad eraseblocks (%d) on mtd%d",
-		       si->good_cnt, mtd.mtd_num);
-		goto out_free;
-	}
-
-	if (!args.quiet) {
-		if (si->ok_cnt)
-			normsg("%d eraseblocks have valid erase counter, mean value is %lld",
-			       si->ok_cnt, si->mean_ec);
-		if (si->empty_cnt)
-			normsg("%d eraseblocks are supposedly empty", si->empty_cnt);
-		if (si->corrupted_cnt)
-			normsg("%d corrupted erase counters", si->corrupted_cnt);
-		print_bad_eraseblocks(&mtd, si);
-	}
-
-	if (si->alien_cnt) {
-		if (!args.yes || !args.quiet)
-			warnmsg("%d of %d eraseblocks contain non-ubifs data",
-				si->alien_cnt, si->good_cnt);
-		if (!args.yes && want_exit()) {
-			if (args.yes && !args.quiet)
-				printf("yes\n");
-			goto out_free;
-		}
-	}
-
-	if (!args.override_ec && si->empty_cnt < si->good_cnt) {
-		int percent = ((double)si->ok_cnt)/si->good_cnt * 100;
-
-		/*
-		 * Make sure the majority of eraseblocks have valid
-		 * erase counters.
-		 */
-		if (percent < 50) {
-			if (!args.yes || !args.quiet)
-				warnmsg("only %d of %d eraseblocks have valid erase counter",
-					si->ok_cnt, si->good_cnt);
-				normsg("erase counter 0 will be used for all eraseblocks");
-				normsg("note, arbitrary erase counter value may be specified using -e option");
-			if (!args.yes && want_exit()) {
-				if (args.yes && !args.quiet)
-					printf("yes\n");
-				goto out_free;
-			}
-			 args.ec = 0;
-			 args.override_ec = 1;
-		} else if (percent < 95) {
-			if (!args.yes || !args.quiet)
-				warnmsg("only %d of %d eraseblocks have valid erase counter",
-					si->ok_cnt, si->good_cnt);
-				normsg("mean erase counter %lld will be used for the rest of eraseblock",
-				       si->mean_ec);
-			if (!args.yes && want_exit()) {
-				if (args.yes && !args.quiet)
-					printf("yes\n");
-				goto out_free;
-			}
-			args.ec = si->mean_ec;
-			args.override_ec = 1;
-		}
-	}
-
-	if (!args.quiet && args.override_ec)
-		normsg("use erase counter %lld for all eraseblocks", args.ec);
-
-	ubigen_info_init(&ui, mtd.eb_size, mtd.min_io_size, mtd.subpage_size,
-			 args.vid_hdr_offs, args.ubi_ver, args.image_seq);
-
-	if (si->vid_hdr_offs != -1 && ui.vid_hdr_offs != si->vid_hdr_offs) {
-		/*
-		 * Hmm, what we read from flash and what we calculated using
-		 * min. I/O unit size and sub-page size differs.
-		 */
-		if (!args.yes || !args.quiet) {
-			warnmsg("VID header and data offsets on flash are %d and %d, "
-				"which is different to requested offsets %d and %d",
-				si->vid_hdr_offs, si->data_offs, ui.vid_hdr_offs,
-				ui.data_offs);
-			normsg_cont("use new offsets %d and %d? (yes/no)  ",
-				    ui.vid_hdr_offs, ui.data_offs);
-		}
-		if (args.yes || answer_is_yes()) {
-			if (args.yes && !args.quiet)
-				printf("yes\n");
-		} else
-			ubigen_info_init(&ui, mtd.eb_size, mtd.min_io_size, 0,
-					 si->vid_hdr_offs, args.ubi_ver,
-					 args.image_seq);
-		normsg("use offsets %d and %d",  ui.vid_hdr_offs, ui.data_offs);
-	}
-
-	if (args.image) {
-		err = flash_image(libmtd, &mtd, &ui, si);
-		if (err < 0)
-			goto out_free;
-
-		err = format(libmtd, &mtd, &ui, si, err, 1);
-		if (err)
-			goto out_free;
-	} else {
-		err = format(libmtd, &mtd, &ui, si, 0, args.novtbl);
-		if (err)
-			goto out_free;
-	}
-
-	ubi_scan_free(si);
-	close(args.node_fd);
-	libmtd_close(libmtd);
-	return 0;
-
-out_free:
-	ubi_scan_free(si);
-out_close:
-	close(args.node_fd);
-out_close_mtd:
-	libmtd_close(libmtd);
-	return -1;
-}
diff --git a/ubi-utils/src/ubimkvol.c b/ubi-utils/src/ubimkvol.c
deleted file mode 100644
index 25065e3..0000000
--- a/ubi-utils/src/ubimkvol.c
+++ /dev/null
@@ -1,295 +0,0 @@
-/*
- * Copyright (c) International Business Machines Corp., 2006
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- */
-
-/*
- * An utility to create UBI volumes.
- *
- * Authors: Artem Bityutskiy <dedekind@infradead.org>
- *          Frank Haverkamp <haver@vnet.ibm.com>
- */
-
-#define PROGRAM_VERSION "1.1"
-#define PROGRAM_NAME    "ubimkvol"
-
-#include <stdio.h>
-#include <stdint.h>
-#include <getopt.h>
-#include <stdlib.h>
-#include <string.h>
-
-#include <libubi.h>
-#include "common.h"
-#include "ubiutils-common.h"
-
-/* The variables below are set by command line arguments */
-struct args {
-	int vol_id;
-	int vol_type;
-	long long bytes;
-	int lebs;
-	int alignment;
-	const char *name;
-	const char *node;
-	int maxavs;
-};
-
-static struct args args = {
-	.vol_type = UBI_DYNAMIC_VOLUME,
-	.bytes = -1,
-	.lebs = -1,
-	.alignment = 1,
-	.vol_id = UBI_VOL_NUM_AUTO,
-};
-
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-			 " - a tool to create UBI volumes.";
-
-static const char optionsstr[] =
-"-a, --alignment=<alignment>   volume alignment (default is 1)\n"
-"-n, --vol_id=<volume ID>      UBI volume ID, if not specified, the volume ID\n"
-"                              will be assigned automatically\n"
-"-N, --name=<name>             volume name\n"
-"-s, --size=<bytes>            volume size volume size in bytes, kilobytes (KiB)\n"
-"                              or megabytes (MiB)\n"
-"-S, --lebs=<LEBs count>       alternative way to give volume size in logical\n"
-"                              eraseblocks\n"
-"-m, --maxavsize               set volume size to maximum available size\n"
-"-t, --type=<static|dynamic>   volume type (dynamic, static), default is dynamic\n"
-"-h, -?, --help                print help message\n"
-"-V, --version                 print program version";
-
-
-static const char usage[] =
-"Usage: " PROGRAM_NAME " <UBI device node file name> [-h] [-a <alignment>] [-n <volume ID>] [-N <name>]\n"
-"\t\t\t[-s <bytes>] [-S <LEBs>] [-t <static|dynamic>] [-V] [-m]\n"
-"\t\t\t[--alignment=<alignment>][--vol_id=<volume ID>] [--name=<name>]\n"
-"\t\t\t[--size=<bytes>] [--lebs=<LEBs>] [--type=<static|dynamic>] [--help]\n"
-"\t\t\t[--version] [--maxavsize]\n\n"
-"Example: " PROGRAM_NAME " /dev/ubi0 -s 20MiB -N config_data - create a 20 Megabytes volume\n"
-"         named \"config_data\" on UBI device /dev/ubi0.";
-
-static const struct option long_options[] = {
-	{ .name = "alignment", .has_arg = 1, .flag = NULL, .val = 'a' },
-	{ .name = "vol_id",    .has_arg = 1, .flag = NULL, .val = 'n' },
-	{ .name = "name",      .has_arg = 1, .flag = NULL, .val = 'N' },
-	{ .name = "size",      .has_arg = 1, .flag = NULL, .val = 's' },
-	{ .name = "lebs",      .has_arg = 1, .flag = NULL, .val = 'S' },
-	{ .name = "type",      .has_arg = 1, .flag = NULL, .val = 't' },
-	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
-	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
-	{ .name = "maxavsize", .has_arg = 0, .flag = NULL, .val = 'm' },
-	{ NULL, 0, NULL, 0},
-};
-
-static int param_sanity_check(void)
-{
-	int len;
-
-	if (args.bytes == -1 && !args.maxavs && args.lebs == -1)
-		return errmsg("volume size was not specified (use -h for help)");
-
-	if ((args.bytes != -1 && (args.maxavs || args.lebs != -1))  ||
-	    (args.lebs != -1  && (args.maxavs || args.bytes != -1)) ||
-	    (args.maxavs && (args.bytes != -1 || args.lebs != -1)))
-		return errmsg("size specified with more then one option");
-
-	if (args.name == NULL)
-		return errmsg("volume name was not specified (use -h for help)");
-
-	len = strlen(args.name);
-	if (len > UBI_MAX_VOLUME_NAME)
-		return errmsg("too long name (%d symbols), max is %d", len, UBI_MAX_VOLUME_NAME);
-
-	return 0;
-}
-
-static int parse_opt(int argc, char * const argv[])
-{
-	while (1) {
-		int key, error = 0;
-
-		key = getopt_long(argc, argv, "a:n:N:s:S:t:h?Vm", long_options, NULL);
-		if (key == -1)
-			break;
-
-		switch (key) {
-		case 't':
-			if (!strcmp(optarg, "dynamic"))
-				args.vol_type = UBI_DYNAMIC_VOLUME;
-			else if (!strcmp(optarg, "static"))
-				args.vol_type = UBI_STATIC_VOLUME;
-			else
-				return errmsg("bad volume type: \"%s\"", optarg);
-			break;
-
-		case 's':
-			args.bytes = ubiutils_get_bytes(optarg);
-			if (args.bytes <= 0)
-				return errmsg("bad volume size: \"%s\"", optarg);
-			break;
-
-		case 'S':
-			args.lebs = simple_strtoull(optarg, &error);
-			if (error || args.lebs <= 0)
-				return errmsg("bad LEB count: \"%s\"", optarg);
-			break;
-
-		case 'a':
-			args.alignment = simple_strtoul(optarg, &error);
-			if (error || args.alignment <= 0)
-				return errmsg("bad volume alignment: \"%s\"", optarg);
-			break;
-
-		case 'n':
-			args.vol_id = simple_strtoul(optarg, &error);
-			if (error || args.vol_id < 0)
-				return errmsg("bad volume ID: " "\"%s\"", optarg);
-			break;
-
-		case 'N':
-			args.name = optarg;
-			break;
-
-		case 'h':
-		case '?':
-			printf("%s\n\n", doc);
-			printf("%s\n\n", usage);
-			printf("%s\n", optionsstr);
-			exit(EXIT_SUCCESS);
-
-		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
-			exit(EXIT_SUCCESS);
-
-		case 'm':
-			args.maxavs = 1;
-			break;
-
-		case ':':
-			return errmsg("parameter is missing");
-
-		default:
-			fprintf(stderr, "Use -h for help\n");
-			return -1;
-		}
-	}
-
-	if (optind == argc)
-		return errmsg("UBI device name was not specified (use -h for help)");
-	else if (optind != argc - 1)
-		return errmsg("more then one UBI device specified (use -h for help)");
-
-	args.node = argv[optind];
-
-	if (param_sanity_check())
-		return -1;
-
-	return 0;
-}
-
-int main(int argc, char * const argv[])
-{
-	int err;
-	libubi_t libubi;
-	struct ubi_dev_info dev_info;
-	struct ubi_vol_info vol_info;
-	struct ubi_mkvol_request req;
-
-	err = parse_opt(argc, argv);
-	if (err)
-		return err;
-
-	libubi = libubi_open();
-	if (!libubi) {
-		if (errno == 0)
-			return errmsg("UBI is not present in the system");
-		return sys_errmsg("cannot open libubi");
-	}
-
-	err = ubi_probe_node(libubi, args.node);
-	if (err == 2) {
-		errmsg("\"%s\" is an UBI volume node, not an UBI device node",
-		       args.node);
-		goto out_libubi;
-	} else if (err < 0) {
-		if (errno == ENODEV)
-			errmsg("\"%s\" is not an UBI device node", args.node);
-		else
-			sys_errmsg("error while probing \"%s\"", args.node);
-		goto out_libubi;
-	}
-
-	err = ubi_get_dev_info(libubi, args.node, &dev_info);
-	if (err) {
-		sys_errmsg("cannot get information about UBI device \"%s\"",
-			   args.node);
-		goto out_libubi;
-	}
-
-	if (dev_info.avail_bytes == 0) {
-		errmsg("UBI device does not have free logical eraseblocks");
-		goto out_libubi;
-	}
-
-	if (args.maxavs) {
-		args.bytes = dev_info.avail_bytes;
-		printf("Set volume size to %lld\n", args.bytes);
-	}
-
-	if (args.lebs != -1) {
-		args.bytes = dev_info.leb_size;
-		args.bytes -= dev_info.leb_size % args.alignment;
-		args.bytes *= args.lebs;
-	}
-
-	req.vol_id = args.vol_id;
-	req.alignment = args.alignment;
-	req.bytes = args.bytes;
-	req.vol_type = args.vol_type;
-	req.name = args.name;
-
-	err = ubi_mkvol(libubi, args.node, &req);
-	if (err < 0) {
-		sys_errmsg("cannot UBI create volume");
-		goto out_libubi;
-	}
-
-	args.vol_id = req.vol_id;
-
-	/* Print information about the created device */
-	err = ubi_get_vol_info1(libubi, dev_info.dev_num, args.vol_id, &vol_info);
-	if (err) {
-		sys_errmsg("cannot get information about newly created UBI volume");
-		goto out_libubi;
-	}
-
-	printf("Volume ID %d, size %d LEBs (", vol_info.vol_id, vol_info.rsvd_lebs);
-	ubiutils_print_bytes(vol_info.rsvd_bytes, 0);
-	printf("), LEB size ");
-	ubiutils_print_bytes(vol_info.leb_size, 1);
-	printf(", %s, name \"%s\", alignment %d\n",
-	       req.vol_type == UBI_DYNAMIC_VOLUME ? "dynamic" : "static",
-	       vol_info.name, vol_info.alignment);
-
-	libubi_close(libubi);
-	return 0;
-
-out_libubi:
-	libubi_close(libubi);
-	return -1;
-}
diff --git a/ubi-utils/src/ubinfo.c b/ubi-utils/src/ubinfo.c
deleted file mode 100644
index 8e14e6e..0000000
--- a/ubi-utils/src/ubinfo.c
+++ /dev/null
@@ -1,434 +0,0 @@
-/*
- * Copyright (C) 2007, 2008 Nokia Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc., 51
- * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
- */
-
-/*
- * An utility to get UBI information.
- *
- * Author: Artem Bityutskiy
- */
-
-#define PROGRAM_VERSION "1.1"
-#define PROGRAM_NAME    "ubinfo"
-
-#include <stdint.h>
-#include <stdio.h>
-#include <getopt.h>
-#include <stdlib.h>
-#include <string.h>
-
-#include <libubi.h>
-#include "common.h"
-#include "ubiutils-common.h"
-
-/* The variables below are set by command line arguments */
-struct args {
-	int devn;
-	int vol_id;
-	int all;
-	const char *node;
-	const char *vol_name;
-};
-
-static struct args args = {
-	.vol_id = -1,
-	.devn = -1,
-	.all = 0,
-	.node = NULL,
-	.vol_name = NULL,
-};
-
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-			 " - a tool to print UBI information.";
-
-static const char optionsstr[] =
-"-d, --devn=<UBI device number>  UBI device number to get information about\n"
-"-n, --vol_id=<volume ID>        ID of UBI volume to print information about\n"
-"-N, --name=<volume name>        name of UBI volume to print information about\n"
-"-a, --all                       print information about all devices and volumes,\n"
-"                                or about all volumes if the UBI device was\n"
-"                                specified\n"
-"-h, --help                      print help message\n"
-"-V, --version                   print program version";
-
-static const char usage[] =
-"Usage 1: " PROGRAM_NAME " [-d <UBI device number>] [-n <volume ID> | -N <volume name>] [-a] [-h] [-V]\n"
-"\t\t[--vol_id=<volume ID> | --name <volume name>] [--devn <UBI device number>] [--all] [--help] [--version]\n"
-"Usage 2: " PROGRAM_NAME " <UBI device node file name> [-a] [-h] [-V] [--all] [--help] [--version]\n"
-"Usage 3: " PROGRAM_NAME " <UBI volume node file name> [-h] [-V] [--help] [--version]\n\n"
-"Example 1: " PROGRAM_NAME " - (no arguments) print general UBI information\n"
-"Example 2: " PROGRAM_NAME " -d 1 - print information about UBI device number 1\n"
-"Example 3: " PROGRAM_NAME " /dev/ubi0 -a - print information about all volumes of UBI\n"
-"           device /dev/ubi0\n"
-"Example 4: " PROGRAM_NAME " /dev/ubi1_0 - print information about UBI volume /dev/ubi1_0\n"
-"Example 5: " PROGRAM_NAME " -a - print all information\n";
-
-static const struct option long_options[] = {
-	{ .name = "devn",      .has_arg = 1, .flag = NULL, .val = 'd' },
-	{ .name = "vol_id",    .has_arg = 1, .flag = NULL, .val = 'n' },
-	{ .name = "name",      .has_arg = 1, .flag = NULL, .val = 'N' },
-	{ .name = "all",       .has_arg = 0, .flag = NULL, .val = 'a' },
-	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
-	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
-	{ NULL, 0, NULL, 0},
-};
-
-static int parse_opt(int argc, char * const argv[])
-{
-	while (1) {
-		int key, error = 0;
-
-		key = getopt_long(argc, argv, "an:N:d:hV", long_options, NULL);
-		if (key == -1)
-			break;
-
-		switch (key) {
-		case 'a':
-			args.all = 1;
-			break;
-
-		case 'n':
-			args.vol_id = simple_strtoul(optarg, &error);
-			if (error || args.vol_id < 0)
-				return errmsg("bad volume ID: " "\"%s\"", optarg);
-			break;
-
-		case 'N':
-			args.vol_name = optarg;
-			break;
-
-		case 'd':
-			args.devn = simple_strtoul(optarg, &error);
-			if (error || args.devn < 0)
-				return errmsg("bad UBI device number: \"%s\"", optarg);
-
-			break;
-
-		case 'h':
-			printf("%s\n\n", doc);
-			printf("%s\n\n", usage);
-			printf("%s\n", optionsstr);
-			exit(EXIT_SUCCESS);
-
-		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
-			exit(EXIT_SUCCESS);
-
-		case ':':
-			return errmsg("parameter is missing");
-
-		default:
-			fprintf(stderr, "Use -h for help\n");
-			return -1;
-		}
-	}
-
-	if (optind == argc - 1)
-		args.node = argv[optind];
-	else if (optind < argc)
-		return errmsg("more then one UBI device specified (use -h for help)");
-
-	return 0;
-}
-
-static int translate_dev(libubi_t libubi, const char *node)
-{
-	int err;
-
-	err = ubi_probe_node(libubi, node);
-	if (err == -1) {
-		if (errno != ENODEV)
-			return sys_errmsg("error while probing \"%s\"", node);
-		return errmsg("\"%s\" does not correspond to any UBI device or volume", node);
-	}
-
-	if (err == 1) {
-		struct ubi_dev_info dev_info;
-
-		err = ubi_get_dev_info(libubi, node, &dev_info);
-		if (err)
-			return sys_errmsg("cannot get information about UBI device \"%s\"", node);
-
-		args.devn = dev_info.dev_num;
-	} else {
-		struct ubi_vol_info vol_info;
-
-		err = ubi_get_vol_info(libubi, node, &vol_info);
-		if (err)
-			return sys_errmsg("cannot get information about UBI volume \"%s\"", node);
-
-		if (args.vol_id != -1)
-			return errmsg("both volume character device node (\"%s\") and "
-				      "volume ID (%d) are specify, use only one of them"
-				      "(use -h for help)", node, args.vol_id);
-
-		args.devn = vol_info.dev_num;
-		args.vol_id = vol_info.vol_id;
-	}
-
-	return 0;
-}
-
-static int get_vol_id_by_name(libubi_t libubi, int dev_num, const char *name)
-{
-	int err;
-	struct ubi_vol_info vol_info;
-
-	err = ubi_get_vol_info1_nm(libubi, dev_num, name, &vol_info);
-	if (err)
-		return sys_errmsg("cannot get information about volume \"%s\" on ubi%d\n", name, dev_num);
-
-	args.vol_id = vol_info.vol_id;
-
-	return 0;
-}
-
-static int print_vol_info(libubi_t libubi, int dev_num, int vol_id)
-{
-	int err;
-	struct ubi_vol_info vol_info;
-
-	err = ubi_get_vol_info1(libubi, dev_num, vol_id, &vol_info);
-	if (err)
-		return sys_errmsg("cannot get information about UBI volume %d on ubi%d",
-				  vol_id, dev_num);
-
-	printf("Volume ID:   %d (on ubi%d)\n", vol_info.vol_id, vol_info.dev_num);
-	printf("Type:        %s\n",
-	       vol_info.type == UBI_DYNAMIC_VOLUME ?  "dynamic" : "static");
-	printf("Alignment:   %d\n", vol_info.alignment);
-
-	printf("Size:        %d LEBs (", vol_info.rsvd_lebs);
-	ubiutils_print_bytes(vol_info.rsvd_bytes, 0);
-	printf(")\n");
-
-	if (vol_info.type == UBI_STATIC_VOLUME) {
-		printf("Data bytes:  ");
-		ubiutils_print_bytes(vol_info.data_bytes, 1);
-		printf("\n");
-	}
-	printf("State:       %s\n", vol_info.corrupted ? "corrupted" : "OK");
-	printf("Name:        %s\n", vol_info.name);
-	printf("Character device major/minor: %d:%d\n",
-	       vol_info.major, vol_info.minor);
-
-	return 0;
-}
-
-static int print_dev_info(libubi_t libubi, int dev_num, int all)
-{
-	int i, err, first = 1;
-	struct ubi_dev_info dev_info;
-	struct ubi_vol_info vol_info;
-
-	err = ubi_get_dev_info1(libubi, dev_num, &dev_info);
-	if (err)
-		return sys_errmsg("cannot get information about UBI device %d", dev_num);
-
-	printf("ubi%d\n", dev_info.dev_num);
-	printf("Volumes count:                           %d\n", dev_info.vol_count);
-	printf("Logical eraseblock size:                 ");
-	ubiutils_print_bytes(dev_info.leb_size, 0);
-	printf("\n");
-
-	printf("Total amount of logical eraseblocks:     %d (", dev_info.total_lebs);
-	ubiutils_print_bytes(dev_info.total_bytes, 0);
-	printf(")\n");
-
-	printf("Amount of available logical eraseblocks: %d (", dev_info.avail_lebs);
-	ubiutils_print_bytes(dev_info.avail_bytes, 0);
-	printf(")\n");
-
-	printf("Maximum count of volumes                 %d\n", dev_info.max_vol_count);
-	printf("Count of bad physical eraseblocks:       %d\n", dev_info.bad_count);
-	printf("Count of reserved physical eraseblocks:  %d\n", dev_info.bad_rsvd);
-	printf("Current maximum erase counter value:     %lld\n", dev_info.max_ec);
-	printf("Minimum input/output unit size:          %d %s\n",
-	       dev_info.min_io_size, dev_info.min_io_size > 1 ? "bytes" : "byte");
-	printf("Character device major/minor:            %d:%d\n",
-	       dev_info.major, dev_info.minor);
-
-	if (dev_info.vol_count == 0)
-		return 0;
-
-	printf("Present volumes:                         ");
-	for (i = dev_info.lowest_vol_id;
-	     i <= dev_info.highest_vol_id; i++) {
-		err = ubi_get_vol_info1(libubi, dev_info.dev_num, i, &vol_info);
-		if (err == -1) {
-			if (errno == ENOENT)
-				continue;
-
-			return sys_errmsg("libubi failed to probe volume %d on ubi%d",
-					  i, dev_info.dev_num);
-		}
-
-		if (!first)
-			printf(", %d", i);
-		else {
-			printf("%d", i);
-			first = 0;
-		}
-	}
-	printf("\n");
-
-	if (!all)
-		return 0;
-
-	first = 1;
-	printf("\n");
-
-	for (i = dev_info.lowest_vol_id;
-	     i <= dev_info.highest_vol_id; i++) {
-		if(!first)
-			printf("-----------------------------------\n");
-		err = ubi_get_vol_info1(libubi, dev_info.dev_num, i, &vol_info);
-		if (err == -1) {
-			if (errno == ENOENT)
-				continue;
-
-			return sys_errmsg("libubi failed to probe volume %d on ubi%d",
-					  i, dev_info.dev_num);
-		}
-		first = 0;
-
-		err = print_vol_info(libubi, dev_info.dev_num, i);
-		if (err)
-			return err;
-	}
-
-	return 0;
-}
-
-static int print_general_info(libubi_t libubi, int all)
-{
-	int i, err, first = 1;
-	struct ubi_info ubi_info;
-	struct ubi_dev_info dev_info;
-
-	err = ubi_get_info(libubi, &ubi_info);
-	if (err)
-		return sys_errmsg("cannot get UBI information");
-
-	printf("UBI version:                    %d\n", ubi_info.version);
-	printf("Count of UBI devices:           %d\n", ubi_info.dev_count);
-	if (ubi_info.ctrl_major != -1)
-		printf("UBI control device major/minor: %d:%d\n",
-		       ubi_info.ctrl_major, ubi_info.ctrl_minor);
-	else
-		printf("UBI control device is not supported by this kernel\n");
-
-	if (ubi_info.dev_count == 0)
-		return 0;
-
-	printf("Present UBI devices:            ");
-	for (i = ubi_info.lowest_dev_num;
-	     i <= ubi_info.highest_dev_num; i++) {
-		err = ubi_get_dev_info1(libubi, i, &dev_info);
-		if (err == -1) {
-			if (errno == ENOENT)
-				continue;
-
-			printf("\n");
-			return sys_errmsg("libubi failed to probe UBI device %d", i);
-		}
-
-		if (!first)
-			printf(", ubi%d", i);
-		else {
-			printf("ubi%d", i);
-			first = 0;
-		}
-	}
-	printf("\n");
-
-	if (!all)
-		return 0;
-
-	first = 1;
-	printf("\n");
-
-	for (i = ubi_info.lowest_dev_num;
-	     i <= ubi_info.highest_dev_num; i++) {
-		if(!first)
-			printf("\n===================================\n\n");
-		first = 0;
-		err = print_dev_info(libubi, i, all);
-		if (err)
-			return err;
-	}
-	return 0;
-}
-
-int main(int argc, char * const argv[])
-{
-	int err;
-	libubi_t libubi;
-
-	err = parse_opt(argc, argv);
-	if (err)
-		return -1;
-
-	libubi = libubi_open();
-	if (!libubi) {
-		if (errno == 0)
-			return errmsg("UBI is not present in the system");
-		return sys_errmsg("cannot open libubi");
-	}
-
-	if (args.node) {
-		/*
-		 * A character device was specified, translate this into UBI
-		 * device number and volume ID.
-		 */
-		err = translate_dev(libubi, args.node);
-		if (err)
-			goto out_libubi;
-	}
-
-	if (args.vol_name) {
-		err = get_vol_id_by_name(libubi, args.devn, args.vol_name);
-		if (err)
-			goto out_libubi;
-	}
-
-	if (args.vol_id != -1 && args.devn == -1) {
-		errmsg("volume ID is specified, but UBI device number is not "
-		       "(use -h for help)\n");
-		goto out_libubi;
-	}
-
-	if (args.devn != -1 && args.vol_id != -1) {
-		print_vol_info(libubi, args.devn, args.vol_id);
-		goto out;
-	}
-
-	if (args.devn == -1 && args.vol_id == -1)
-		err = print_general_info(libubi, args.all);
-	else if (args.devn != -1 && args.vol_id == -1)
-		err = print_dev_info(libubi, args.devn, args.all);
-
-	if (err)
-		goto out_libubi;
-
-out:
-	libubi_close(libubi);
-	return 0;
-
-out_libubi:
-	libubi_close(libubi);
-	return -1;
-}
diff --git a/ubi-utils/src/ubinize.c b/ubi-utils/src/ubinize.c
deleted file mode 100644
index 3085b66..0000000
--- a/ubi-utils/src/ubinize.c
+++ /dev/null
@@ -1,628 +0,0 @@
-/*
- * Copyright (C) 2008 Nokia Corporation
- * Copyright (c) International Business Machines Corp., 2006
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- */
-
-/*
- * Generate UBI images.
- *
- * Authors: Artem Bityutskiy
- *          Oliver Lohmann
- */
-
-#define PROGRAM_VERSION "1.2"
-#define PROGRAM_NAME    "ubinize"
-
-#include <sys/stat.h>
-#include <stdlib.h>
-#include <getopt.h>
-#include <string.h>
-#include <fcntl.h>
-
-#include <mtd/ubi-media.h>
-#include <libubigen.h>
-#include <libiniparser.h>
-#include "common.h"
-#include "ubiutils-common.h"
-
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-" - a tool to generate UBI images. An UBI image may contain one or more UBI "
-"volumes which have to be defined in the input configuration ini-file. The "
-"ini file defines all the UBI volumes - their characteristics and the and the "
-"contents, but it does not define the characteristics of the flash the UBI "
-"image is generated for. Instead, the flash characteristics are defined via "
-"the command-line options. Note, if not sure about some of the command-line "
-"parameters, do not specify them and let the utility to use default values.";
-
-static const char optionsstr[] =
-"-o, --output=<file name>     output file name\n"
-"-p, --peb-size=<bytes>       size of the physical eraseblock of the flash\n"
-"                             this UBI image is created for in bytes,\n"
-"                             kilobytes (KiB), or megabytes (MiB)\n"
-"                             (mandatory parameter)\n"
-"-m, --min-io-size=<bytes>    minimum input/output unit size of the flash\n"
-"                             in bytes\n"
-"-s, --sub-page-size=<bytes>  minimum input/output unit used for UBI\n"
-"                             headers, e.g. sub-page size in case of NAND\n"
-"                             flash (equivalent to the minimum input/output\n"
-"                             unit size by default)\n"
-"-O, --vid-hdr-offset=<num>   offset if the VID header from start of the\n"
-"                             physical eraseblock (default is the next\n"
-"                             minimum I/O unit or sub-page after the EC\n"
-"                             header)\n"
-"-e, --erase-counter=<num>    the erase counter value to put to EC headers\n"
-"                             (default is 0)\n"
-"-x, --ubi-ver=<num>          UBI version number to put to EC headers\n"
-"                             (default is 1)\n"
-"-Q, --image-seq=<num>        32-bit UBI image sequence number to use\n"
-"                             (by default a random number is picked)\n"
-"-v, --verbose                be verbose\n"
-"-h, --help                   print help message\n"
-"-V, --version                print program version";
-
-static const char usage[] =
-"Usage: " PROGRAM_NAME " [-o filename] [-p <bytes>] [-m <bytes>] [-s <bytes>] [-O <num>] [-e <num>]\n"
-"\t\t[-x <num>] [-Q <num>] [-v] [-h] [-V] [--output=<filename>] [--peb-size=<bytes>]\n"
-"\t\t[--min-io-size=<bytes>] [--sub-page-size=<bytes>] [--vid-hdr-offset=<num>]\n"
-"\t\t[--erase-counter=<num>] [--ubi-ver=<num>] [--image-seq=<num>] [--verbose] [--help]\n"
-"\t\t[--version] ini-file\n"
-"Example: " PROGRAM_NAME " -o ubi.img -p 16KiB -m 512 -s 256 cfg.ini - create UBI image\n"
-"         'ubi.img' as described by configuration file 'cfg.ini'";
-
-static const char ini_doc[] = "INI-file format.\n"
-"The input configuration ini-file describes all the volumes which have to\n"
-"be included to the output UBI image. Each volume is described in its own\n"
-"section which may be named arbitrarily. The section consists on\n"
-"\"key=value\" pairs, for example:\n\n"
-"[jffs2-volume]\n"
-"mode=ubi\n"
-"image=../jffs2.img\n"
-"vol_id=1\n"
-"vol_size=30MiB\n"
-"vol_type=dynamic\n"
-"vol_name=jffs2_volume\n"
-"vol_flags=autoresize\n"
-"vol_alignment=1\n\n"
-"This example configuration file tells the utility to create an UBI image\n"
-"with one volume with ID 1, volume size 30MiB, the volume is dynamic, has\n"
-"name \"jffs2_volume\", \"autoresize\" volume flag, and alignment 1. The\n"
-"\"image=../jffs2.img\" line tells the utility to take the contents of the\n"
-"volume from the \"../jffs2.img\" file. The size of the image file has to be\n"
-"less or equivalent to the volume size (30MiB). The \"mode=ubi\" line is\n"
-"mandatory and just tells that the section describes an UBI volume - other\n"
-"section modes may be added in the future.\n"
-"Notes:\n"
-"  * size in vol_size might be specified kilobytes (KiB), megabytes (MiB),\n"
-"    gigabytes (GiB) or bytes (no modifier);\n"
-"  * if \"vol_size\" key is absent, the volume size is assumed to be\n"
-"    equivalent to the size of the image file (defined by \"image\" key);\n"
-"  * if the \"image\" is absent, the volume is assumed to be empty;\n"
-"  * volume alignment must not be greater than the logical eraseblock size;\n"
-"  * one ini file may contain arbitrary number of sections, the utility will\n"
-"    put all the volumes which are described by these section to the output\n"
-"    UBI image file.";
-
-static const struct option long_options[] = {
-	{ .name = "output",         .has_arg = 1, .flag = NULL, .val = 'o' },
-	{ .name = "peb-size",       .has_arg = 1, .flag = NULL, .val = 'p' },
-	{ .name = "min-io-size",    .has_arg = 1, .flag = NULL, .val = 'm' },
-	{ .name = "sub-page-size",  .has_arg = 1, .flag = NULL, .val = 's' },
-	{ .name = "vid-hdr-offset", .has_arg = 1, .flag = NULL, .val = 'O' },
-	{ .name = "erase-counter",  .has_arg = 1, .flag = NULL, .val = 'e' },
-	{ .name = "ubi-ver",        .has_arg = 1, .flag = NULL, .val = 'x' },
-	{ .name = "image-seq",      .has_arg = 1, .flag = NULL, .val = 'Q' },
-	{ .name = "verbose",        .has_arg = 0, .flag = NULL, .val = 'v' },
-	{ .name = "help",           .has_arg = 0, .flag = NULL, .val = 'h' },
-	{ .name = "version",        .has_arg = 0, .flag = NULL, .val = 'V' },
-	{ NULL, 0, NULL, 0}
-};
-
-struct args {
-	const char *f_in;
-	const char *f_out;
-	int out_fd;
-	int peb_size;
-	int min_io_size;
-	int subpage_size;
-	int vid_hdr_offs;
-	int ec;
-	int ubi_ver;
-	uint32_t image_seq;
-	int verbose;
-	dictionary *dict;
-};
-
-static struct args args = {
-	.peb_size     = -1,
-	.min_io_size  = -1,
-	.subpage_size = -1,
-	.ubi_ver      = 1,
-};
-
-static int parse_opt(int argc, char * const argv[])
-{
-	ubiutils_srand();
-	args.image_seq = rand();
-
-	while (1) {
-		int key, error = 0;
-		unsigned long int image_seq;
-
-		key = getopt_long(argc, argv, "o:p:m:s:O:e:x:Q:vhV", long_options, NULL);
-		if (key == -1)
-			break;
-
-		switch (key) {
-		case 'o':
-			args.out_fd = open(optarg, O_CREAT | O_TRUNC | O_WRONLY,
-					   S_IWUSR | S_IRUSR | S_IRGRP | S_IWGRP | S_IROTH);
-			if (args.out_fd == -1)
-				return sys_errmsg("cannot open file \"%s\"", optarg);
-			args.f_out = optarg;
-			break;
-
-		case 'p':
-			args.peb_size = ubiutils_get_bytes(optarg);
-			if (args.peb_size <= 0)
-				return errmsg("bad physical eraseblock size: \"%s\"", optarg);
-			break;
-
-		case 'm':
-			args.min_io_size = ubiutils_get_bytes(optarg);
-			if (args.min_io_size <= 0)
-				return errmsg("bad min. I/O unit size: \"%s\"", optarg);
-			if (!is_power_of_2(args.min_io_size))
-				return errmsg("min. I/O unit size should be power of 2");
-			break;
-
-		case 's':
-			args.subpage_size = ubiutils_get_bytes(optarg);
-			if (args.subpage_size <= 0)
-				return errmsg("bad sub-page size: \"%s\"", optarg);
-			if (!is_power_of_2(args.subpage_size))
-				return errmsg("sub-page size should be power of 2");
-			break;
-
-		case 'O':
-			args.vid_hdr_offs = simple_strtoul(optarg, &error);
-			if (error || args.vid_hdr_offs < 0)
-				return errmsg("bad VID header offset: \"%s\"", optarg);
-			break;
-
-		case 'e':
-			args.ec = simple_strtoul(optarg, &error);
-			if (error || args.ec < 0)
-				return errmsg("bad erase counter value: \"%s\"", optarg);
-			break;
-
-		case 'x':
-			args.ubi_ver = simple_strtoul(optarg, &error);
-			if (error || args.ubi_ver < 0)
-				return errmsg("bad UBI version: \"%s\"", optarg);
-			break;
-
-		case 'Q':
-			image_seq = simple_strtoul(optarg, &error);
-			if (error || image_seq > 0xFFFFFFFF)
-				return errmsg("bad UBI image sequence number: \"%s\"", optarg);
-			args.image_seq = image_seq;
-			break;
-
-		case 'v':
-			args.verbose = 1;
-			break;
-
-		case 'h':
-			ubiutils_print_text(stdout, doc, 80);
-			printf("\n%s\n\n", ini_doc);
-			printf("%s\n\n", usage);
-			printf("%s\n", optionsstr);
-			exit(EXIT_SUCCESS);
-
-		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
-			exit(EXIT_SUCCESS);
-
-		default:
-			fprintf(stderr, "Use -h for help\n");
-			return -1;
-		}
-	}
-
-	if (optind == argc)
-		return errmsg("input configuration file was not specified (use -h for help)");
-
-	if (optind != argc - 1)
-		return errmsg("more then one configuration file was specified (use -h for help)");
-
-	args.f_in = argv[optind];
-
-	if (args.peb_size < 0)
-		return errmsg("physical eraseblock size was not specified (use -h for help)");
-
-	if (args.peb_size > 1024*1024)
-		return errmsg("too high physical eraseblock size %d", args.peb_size);
-
-	if (args.min_io_size < 0)
-		return errmsg("min. I/O unit size was not specified (use -h for help)");
-
-	if (args.subpage_size < 0)
-		args.subpage_size = args.min_io_size;
-
-	if (args.subpage_size > args.min_io_size)
-		return errmsg("sub-page cannot be larger then min. I/O unit");
-
-	if (args.peb_size % args.min_io_size)
-		return errmsg("physical eraseblock should be multiple of min. I/O units");
-
-	if (args.min_io_size % args.subpage_size)
-		return errmsg("min. I/O unit size should be multiple of sub-page size");
-
-	if (!args.f_out)
-		return errmsg("output file was not specified (use -h for help)");
-
-	if (args.vid_hdr_offs) {
-		if (args.vid_hdr_offs + (int)UBI_VID_HDR_SIZE >= args.peb_size)
-			return errmsg("bad VID header position");
-		if (args.vid_hdr_offs % 8)
-			return errmsg("VID header offset has to be multiple of min. I/O unit size");
-	}
-
-	return 0;
-}
-
-static int read_section(const struct ubigen_info *ui, const char *sname,
-			struct ubigen_vol_info *vi, const char **img,
-			struct stat *st)
-{
-	char buf[256];
-	const char *p;
-
-	*img = NULL;
-
-	if (strlen(sname) > 128)
-		return errmsg("too long section name \"%s\"", sname);
-
-	/* Make sure mode is UBI, otherwise ignore this section */
-	sprintf(buf, "%s:mode", sname);
-	p = iniparser_getstring(args.dict, buf, NULL);
-	if (!p) {
-		errmsg("\"mode\" key not found in section \"%s\"", sname);
-		errmsg("the \"mode\" key is mandatory and has to be "
-		       "\"mode=ubi\" if the section describes an UBI volume");
-		return -1;
-	}
-
-	/* If mode is not UBI, skip this section */
-	if (strcmp(p, "ubi")) {
-		verbose(args.verbose, "skip non-ubi section \"%s\"", sname);
-		return 1;
-	}
-
-	verbose(args.verbose, "mode=ubi, keep parsing");
-
-	/* Fetch volume type */
-	sprintf(buf, "%s:vol_type", sname);
-	p = iniparser_getstring(args.dict, buf, NULL);
-	if (!p) {
-		normsg("volume type was not specified in "
-		       "section \"%s\", assume \"dynamic\"\n", sname);
-		vi->type = UBI_VID_DYNAMIC;
-	} else {
-		if (!strcmp(p, "static"))
-			vi->type = UBI_VID_STATIC;
-		else if (!strcmp(p, "dynamic"))
-			vi->type = UBI_VID_DYNAMIC;
-		else
-			return errmsg("invalid volume type \"%s\" in section  \"%s\"",
-				      p, sname);
-	}
-
-	verbose(args.verbose, "volume type: %s",
-		vi->type == UBI_VID_DYNAMIC ? "dynamic" : "static");
-
-	/* Fetch the name of the volume image file */
-	sprintf(buf, "%s:image", sname);
-	p = iniparser_getstring(args.dict, buf, NULL);
-	if (p) {
-		*img = p;
-		if (stat(p, st))
-			return sys_errmsg("cannot stat \"%s\" referred from section \"%s\"",
-					  p, sname);
-		if (st->st_size == 0)
-			return errmsg("empty file \"%s\" referred from section \"%s\"",
-				       p, sname);
-	} else if (vi->type == UBI_VID_STATIC)
-		return errmsg("image is not specified for static volume in section \"%s\"",
-			      sname);
-
-	/* Fetch volume id */
-	sprintf(buf, "%s:vol_id", sname);
-	vi->id = iniparser_getint(args.dict, buf, -1);
-	if (vi->id == -1)
-		return errmsg("\"vol_id\" key not found in section  \"%s\"", sname);
-	if (vi->id < 0)
-		return errmsg("negative volume ID %d in section \"%s\"",
-			      vi->id, sname);
-	if (vi->id >= ui->max_volumes)
-		return errmsg("too high volume ID %d in section \"%s\", max. is %d",
-			      vi->id, sname, ui->max_volumes);
-
-	verbose(args.verbose, "volume ID: %d", vi->id);
-
-	/* Fetch volume size */
-	sprintf(buf, "%s:vol_size", sname);
-	p = iniparser_getstring(args.dict, buf, NULL);
-	if (p) {
-		vi->bytes = ubiutils_get_bytes(p);
-		if (vi->bytes <= 0)
-			return errmsg("bad \"vol_size\" key value \"%s\" (section \"%s\")",
-				      p, sname);
-
-		/* Make sure the image size is not larger than volume size */
-		if (*img && st->st_size > vi->bytes)
-			return errmsg("error in section \"%s\": size of the image file "
-				      "\"%s\" is %lld, which is larger than volume size %lld",
-				      sname, *img, (long long)st->st_size, vi->bytes);
-		verbose(args.verbose, "volume size: %lld bytes", vi->bytes);
-	} else {
-		struct stat st;
-
-		if (!*img)
-			return errmsg("neither image file (\"image=\") nor volume size "
-				      "(\"vol_size=\") specified in section \"%s\"", sname);
-
-		if (stat(*img, &st))
-			return sys_errmsg("cannot stat \"%s\"", *img);
-
-		vi->bytes = st.st_size;
-
-		if (vi->bytes == 0)
-			return errmsg("file \"%s\" referred from section \"%s\" is empty",
-				      *img, sname);
-
-		normsg_cont("volume size was not specified in section \"%s\", assume"
-			    " minimum to fit image \"%s\"", sname, *img);
-		ubiutils_print_bytes(vi->bytes, 1);
-		printf("\n");
-	}
-
-	/* Fetch volume name */
-	sprintf(buf, "%s:vol_name", sname);
-	p = iniparser_getstring(args.dict, buf, NULL);
-	if (!p)
-		return errmsg("\"vol_name\" key not found in section \"%s\"", sname);
-
-	vi->name = p;
-	vi->name_len = strlen(p);
-	if (vi->name_len > UBI_VOL_NAME_MAX)
-		return errmsg("too long volume name in section \"%s\", max. is %d characters",
-			      vi->name, UBI_VOL_NAME_MAX);
-
-	verbose(args.verbose, "volume name: %s", p);
-
-	/* Fetch volume alignment */
-	sprintf(buf, "%s:vol_alignment", sname);
-	vi->alignment = iniparser_getint(args.dict, buf, -1);
-	if (vi->alignment == -1)
-		vi->alignment = 1;
-	else if (vi->id < 0)
-		return errmsg("negative volume alignement %d in section \"%s\"",
-			      vi->alignment, sname);
-
-	verbose(args.verbose, "volume alignment: %d", vi->alignment);
-
-	/* Fetch volume flags */
-	sprintf(buf, "%s:vol_flags", sname);
-	p = iniparser_getstring(args.dict, buf, NULL);
-	if (p) {
-		if (!strcmp(p, "autoresize")) {
-			verbose(args.verbose, "autoresize flags found");
-			vi->flags |= UBI_VTBL_AUTORESIZE_FLG;
-		} else {
-			return errmsg("unknown flags \"%s\" in section \"%s\"",
-				      p, sname);
-		}
-	}
-
-	/* Initialize the rest of the volume information */
-	vi->data_pad = ui->leb_size % vi->alignment;
-	vi->usable_leb_size = ui->leb_size - vi->data_pad;
-	if (vi->type == UBI_VID_DYNAMIC)
-		vi->used_ebs = (vi->bytes + vi->usable_leb_size - 1) / vi->usable_leb_size;
-	else
-		vi->used_ebs = (st->st_size + vi->usable_leb_size - 1) / vi->usable_leb_size;
-	vi->compat = 0;
-	return 0;
-}
-
-int main(int argc, char * const argv[])
-{
-	int err = -1, sects, i, autoresize_was_already = 0;
-	struct ubigen_info ui;
-	struct ubi_vtbl_record *vtbl;
-	struct ubigen_vol_info *vi;
-	off_t seek;
-
-	err = parse_opt(argc, argv);
-	if (err)
-		return -1;
-
-	ubigen_info_init(&ui, args.peb_size, args.min_io_size,
-			 args.subpage_size, args.vid_hdr_offs,
-			 args.ubi_ver, args.image_seq);
-
-	verbose(args.verbose, "LEB size:                  %d", ui.leb_size);
-	verbose(args.verbose, "PEB size:                  %d", ui.peb_size);
-	verbose(args.verbose, "min. I/O size:             %d", ui.min_io_size);
-	verbose(args.verbose, "sub-page size:             %d", args.subpage_size);
-	verbose(args.verbose, "VID offset:                %d", ui.vid_hdr_offs);
-	verbose(args.verbose, "data offset:               %d", ui.data_offs);
-	verbose(args.verbose, "UBI image sequence number: %u", ui.image_seq);
-
-	vtbl = ubigen_create_empty_vtbl(&ui);
-	if (!vtbl)
-		goto out;
-
-	args.dict = iniparser_load(args.f_in);
-	if (!args.dict) {
-		errmsg("cannot load the input ini file \"%s\"", args.f_in);
-		goto out_vtbl;
-	}
-
-	verbose(args.verbose, "loaded the ini-file \"%s\"", args.f_in);
-
-	/* Each section describes one volume */
-	sects = iniparser_getnsec(args.dict);
-	if (sects == -1) {
-		errmsg("ini-file parsing error (iniparser_getnsec)");
-		goto out_dict;
-	}
-
-	verbose(args.verbose, "count of sections: %d", sects);
-	if (sects == 0) {
-		errmsg("no sections found the ini-file \"%s\"", args.f_in);
-		goto out_dict;
-	}
-
-	if (sects > ui.max_volumes) {
-		errmsg("too many sections (%d) in the ini-file \"%s\"",
-		       sects, args.f_in);
-		normsg("each section corresponds to an UBI volume, maximum "
-		       "count of volumes is %d", ui.max_volumes);
-		goto out_dict;
-	}
-
-	vi = calloc(sizeof(struct ubigen_vol_info), sects);
-	if (!vi) {
-		errmsg("cannot allocate memory");
-		goto out_dict;
-	}
-
-	/*
-	 * Skip 2 PEBs at the beginning of the file for the volume table which
-	 * will be written later.
-	 */
-	seek = ui.peb_size * 2;
-	if (lseek(args.out_fd, seek, SEEK_SET) != seek) {
-		sys_errmsg("cannot seek file \"%s\"", args.f_out);
-		goto out_free;
-	}
-
-	for (i = 0; i < sects; i++) {
-		const char *sname = iniparser_getsecname(args.dict, i);
-		const char *img = NULL;
-		struct stat st;
-		int fd, j;
-
-		if (!sname) {
-			errmsg("ini-file parsing error (iniparser_getsecname)");
-			goto out_free;
-		}
-
-		if (args.verbose)
-			printf("\n");
-		verbose(args.verbose, "parsing section \"%s\"", sname);
-
-		err = read_section(&ui, sname, &vi[i], &img, &st);
-		if (err == -1)
-			goto out_free;
-
-		verbose(args.verbose, "adding volume %d", vi[i].id);
-
-		/*
-		 * Make sure that volume ID and name is unique and that only
-		 * one volume has auto-resize flag
-		 */
-		for (j = 0; j < i; j++) {
-			if (vi[i].id == vi[j].id) {
-				errmsg("volume IDs must be unique, but ID %d "
-				       "in section \"%s\" is not",
-				       vi[i].id, sname);
-				goto out_free;
-			}
-
-			if (!strcmp(vi[i].name, vi[j].name)) {
-				errmsg("volume name must be unique, but name "
-				       "\"%s\" in section \"%s\" is not",
-				       vi[i].name, sname);
-				goto out_free;
-			}
-		}
-
-		if (vi[i].flags & UBI_VTBL_AUTORESIZE_FLG) {
-			if (autoresize_was_already)
-				return errmsg("only one volume is allowed "
-					      "to have auto-resize flag");
-			autoresize_was_already = 1;
-		}
-
-		err = ubigen_add_volume(&ui, &vi[i], vtbl);
-		if (err) {
-			errmsg("cannot add volume for section \"%s\"", sname);
-			goto out_free;
-		}
-
-		if (img) {
-			fd = open(img, O_RDONLY);
-			if (fd == -1) {
-				sys_errmsg("cannot open \"%s\"", img);
-				goto out_free;
-			}
-
-			verbose(args.verbose, "writing volume %d", vi[i].id);
-			verbose(args.verbose, "image file: %s", img);
-
-			err = ubigen_write_volume(&ui, &vi[i], args.ec, st.st_size, fd, args.out_fd);
-			close(fd);
-			if (err) {
-				errmsg("cannot write volume for section \"%s\"", sname);
-				goto out_free;
-			}
-		}
-
-		if (args.verbose)
-			printf("\n");
-	}
-
-	verbose(args.verbose, "writing layout volume");
-
-	err = ubigen_write_layout_vol(&ui, 0, 1, args.ec, args.ec, vtbl, args.out_fd);
-	if (err) {
-		errmsg("cannot write layout volume");
-		goto out_free;
-	}
-
-	verbose(args.verbose, "done");
-
-	free(vi);
-	iniparser_freedict(args.dict);
-	free(vtbl);
-	close(args.out_fd);
-	return 0;
-
-out_free:
-	free(vi);
-out_dict:
-	iniparser_freedict(args.dict);
-out_vtbl:
-	free(vtbl);
-out:
-	close(args.out_fd);
-	remove(args.f_out);
-	return err;
-}
diff --git a/ubi-utils/src/ubirename.c b/ubi-utils/src/ubirename.c
deleted file mode 100644
index 070e32e..0000000
--- a/ubi-utils/src/ubirename.c
+++ /dev/null
@@ -1,147 +0,0 @@
-/*
- * Copyright (C) 2008 Logitech.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc., 51
- * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
- */
-
-/*
- * An utility to get rename UBI volumes.
- *
- * Author: Richard Titmuss
- */
-
-#define PROGRAM_VERSION "1.0"
-#define PROGRAM_NAME    "ubirename"
-
-#include <stdio.h>
-#include <stdint.h>
-#include <getopt.h>
-#include <stdlib.h>
-#include <string.h>
-
-#include <libubi.h>
-#include "common.h"
-
-static const char usage[] =
-"Usage: " PROGRAM_NAME " <UBI device node file name> [<old name> <new name>|...]\n\n"
-"Example: " PROGRAM_NAME "/dev/ubi0 A B C D - rename volume A to B, and C to D\n\n"
-"This utility allows re-naming several volumes in one go atomically.\n"
-"For example, if you have volumes A and B, then you may rename A into B\n"
-"and B into A at one go, and the operation will be atomic. This allows\n"
-"implementing atomic UBI volumes upgrades. E.g., if you have volume A\n"
-"and want to upgrade it atomically, you create a temporary volume B,\n"
-"put your new data to B, then rename A to B and B to A, and then you\n"
-"may remove old volume B.\n"
-"It is also allowed to re-name multiple volumes at a time, but 16 max.\n"
-"renames at once, which means you may specify up to 32 volume names.\n"
-"If you have volumes A and B, and re-name A to B, bud do not re-name\n"
-"B to something else in the same request, old volume B will be removed\n"
-"and A will be renamed into B.\n";
-
-static int get_vol_id(libubi_t libubi, struct ubi_dev_info *dev_info,
-		       char *name)
-{
-	int err, i;
-	struct ubi_vol_info vol_info;
-
-	for (i=dev_info->lowest_vol_id; i<=dev_info->highest_vol_id; i++) {
-		err = ubi_get_vol_info1(libubi, dev_info->dev_num, i, &vol_info);
-		if (err == -1) {
-			if (errno == ENOENT)
-				continue;
-			return -1;
-		}
-
-		if (strcmp(name, vol_info.name) == 0)
-			return vol_info.vol_id;
-	}
-
-	return -1;
-}
-
-int main(int argc, char * const argv[])
-{
-	int i, err;
-	int count = 0;
-	libubi_t libubi;
-	struct ubi_dev_info dev_info;
-	struct ubi_rnvol_req rnvol;
-	const char *node;
-
-	if (argc < 3 || (argc & 1) == 1) {
-		errmsg("too few arguments");
-		fprintf(stderr, "%s\n", usage);
-		return -1;
-	}
-
-	if (argc > UBI_MAX_RNVOL + 2) {
-		errmsg("too many volumes to re-name, max. is %d",
-		       UBI_MAX_RNVOL);
-		return -1;
-	}
-
-	node = argv[1];
-	libubi = libubi_open();
-	if (!libubi) {
-		if (errno == 0)
-			return errmsg("UBI is not present in the system");
-		return sys_errmsg("cannot open libubi");
-	}
-
-	err = ubi_probe_node(libubi, node);
-	if (err == 2) {
-		errmsg("\"%s\" is an UBI volume node, not an UBI device node",
-		       node);
-		goto out_libubi;
-	} else if (err < 0) {
-		if (errno == ENODEV)
-			errmsg("\"%s\" is not an UBI device node", node);
-		else
-			sys_errmsg("error while probing \"%s\"", node);
-		goto out_libubi;
-	}
-
-	err = ubi_get_dev_info(libubi, node, &dev_info);
-	if (err == -1) {
-		sys_errmsg("cannot get information about UBI device \"%s\"", node);
-		goto out_libubi;
-	}
-
-	for (i = 2; i < argc; i += 2) {
-		err = get_vol_id(libubi, &dev_info, argv[i]);
-		if (err == -1) {
-			errmsg("\"%s\" volume not found", argv[i]);
-			goto out_libubi;
-		}
-
-		rnvol.ents[count].vol_id = err;
-		rnvol.ents[count].name_len = strlen(argv[i + 1]);
-		strcpy(rnvol.ents[count++].name, argv[i + 1]);
-	}
-
-	rnvol.count = count;
-
-	err = ubi_rnvols(libubi, node, &rnvol);
-	if (err == -1) {
-		sys_errmsg("cannot rename volumes");
-		goto out_libubi;
-	}
-
-	libubi_close(libubi);
-	return 0;
-
-out_libubi:
-	libubi_close(libubi);
-	return -1;
-}
diff --git a/ubi-utils/src/ubirmvol.c b/ubi-utils/src/ubirmvol.c
deleted file mode 100644
index 5725d90..0000000
--- a/ubi-utils/src/ubirmvol.c
+++ /dev/null
@@ -1,211 +0,0 @@
-/*
- * Copyright (c) International Business Machines Corp., 2006
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- */
-
-/*
- * An utility to remove UBI volumes.
- *
- * Authors: Artem Bityutskiy <dedekind@infradead.org>
- *          Frank Haverkamp <haver@vnet.ibm.com>
- */
-
-#define PROGRAM_VERSION "1.1"
-#define PROGRAM_NAME    "ubirmvol"
-
-#include <stdio.h>
-#include <stdint.h>
-#include <getopt.h>
-#include <stdlib.h>
-#include <string.h>
-
-#include <libubi.h>
-#include "common.h"
-
-/* The variables below are set by command line arguments */
-struct args {
-	int vol_id;
-	const char *node;
-	const char *name;
-};
-
-static struct args args = {
-	.vol_id = -1,
-};
-
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-				 " - a tool to remove UBI volumes.";
-
-static const char optionsstr[] =
-"-n, --vol_id=<volume id>   volume ID to remove\n"
-"-N, --name=<volume name>   volume name to remove\n"
-"-h, -?, --help             print help message\n"
-"-V, --version              print program version";
-
-static const char usage[] =
-"Usage: " PROGRAM_NAME " <UBI device node file name> [-n <volume id>] [--vol_id=<volume id>]\n\n"
-"         [-N <volume name>] [--name=<volume name>] [-h] [--help]\n\n"
-"Example: " PROGRAM_NAME "/dev/ubi0 -n 1 - remove UBI volume 1 from UBI device corresponding\n"
-"         to /dev/ubi0\n"
-"         " PROGRAM_NAME "/dev/ubi0 -N my_vol - remove UBI named \"my_vol\" from UBI device\n"
-"         corresponding to /dev/ubi0";
-
-static const struct option long_options[] = {
-	{ .name = "vol_id",  .has_arg = 1, .flag = NULL, .val = 'n' },
-	{ .name = "name",    .has_arg = 1, .flag = NULL, .val = 'N' },
-	{ .name = "help",    .has_arg = 0, .flag = NULL, .val = 'h' },
-	{ .name = "version", .has_arg = 0, .flag = NULL, .val = 'V' },
-	{ NULL, 0, NULL, 0},
-};
-
-static int param_sanity_check(void)
-{
-	if (args.vol_id == -1 && !args.name) {
-		errmsg("please, specify either volume ID or volume name");
-		return -1;
-	}
-
-	if (args.vol_id != -1 && args.name) {
-		errmsg("please, specify either volume ID or volume name, not both");
-		return -1;
-	}
-
-	return 0;
-}
-
-static int parse_opt(int argc, char * const argv[])
-{
-	while (1) {
-		int key, error = 0;
-
-		key = getopt_long(argc, argv, "n:N:h?V", long_options, NULL);
-		if (key == -1)
-			break;
-
-		switch (key) {
-
-		case 'n':
-			args.vol_id = simple_strtoul(optarg, &error);
-			if (error || args.vol_id < 0) {
-				errmsg("bad volume ID: " "\"%s\"", optarg);
-				return -1;
-			}
-			break;
-
-		case 'N':
-			args.name = optarg;
-			break;
-
-		case 'h':
-		case '?':
-			printf("%s\n\n", doc);
-			printf("%s\n\n", usage);
-			printf("%s\n", optionsstr);
-			exit(EXIT_SUCCESS);
-
-		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
-			exit(EXIT_SUCCESS);
-
-		case ':':
-			errmsg("parameter is missing");
-			return -1;
-
-		default:
-			fprintf(stderr, "Use -h for help\n");
-			return -1;
-		}
-	}
-
-	if (optind == argc) {
-		errmsg("UBI device name was not specified (use -h for help)");
-		return -1;
-	} else if (optind != argc - 1) {
-		errmsg("more then one UBI device specified (use -h for help)");
-		return -1;
-	}
-
-	args.node = argv[optind];
-
-	if (param_sanity_check())
-		return -1;
-
-	return 0;
-}
-
-int main(int argc, char * const argv[])
-{
-	int err;
-	libubi_t libubi;
-
-	err = parse_opt(argc, argv);
-	if (err)
-		return -1;
-
-	libubi = libubi_open();
-	if (!libubi) {
-		if (errno == 0)
-			return errmsg("UBI is not present in the system");
-		return sys_errmsg("cannot open libubi");
-	}
-
-	err = ubi_probe_node(libubi, args.node);
-	if (err == 2) {
-		errmsg("\"%s\" is an UBI volume node, not an UBI device node",
-		       args.node);
-		goto out_libubi;
-	} else if (err < 0) {
-		if (errno == ENODEV)
-			errmsg("\"%s\" is not an UBI device node", args.node);
-		else
-			sys_errmsg("error while probing \"%s\"", args.node);
-		goto out_libubi;
-	}
-
-	if (args.name) {
-		struct ubi_dev_info dev_info;
-		struct ubi_vol_info vol_info;
-
-		err = ubi_get_dev_info(libubi, args.node, &dev_info);
-		if (err) {
-			sys_errmsg("cannot get information about UBI device \"%s\"",
-				   args.node);
-			goto out_libubi;
-		}
-
-		err = ubi_get_vol_info1_nm(libubi, dev_info.dev_num,
-					   args.name, &vol_info);
-		if (err) {
-			sys_errmsg("cannot find UBI volume \"%s\"", args.name);
-			goto out_libubi;
-		}
-
-		args.vol_id = vol_info.vol_id;
-	}
-
-	err = ubi_rmvol(libubi, args.node, args.vol_id);
-	if (err) {
-		sys_errmsg("cannot UBI remove volume");
-		goto out_libubi;
-	}
-
-	libubi_close(libubi);
-	return 0;
-
-out_libubi:
-	libubi_close(libubi);
-	return -1;
-}
diff --git a/ubi-utils/src/ubirsvol.c b/ubi-utils/src/ubirsvol.c
deleted file mode 100644
index 65f579c..0000000
--- a/ubi-utils/src/ubirsvol.c
+++ /dev/null
@@ -1,245 +0,0 @@
-/*
- * Copyright (c) International Business Machines Corp., 2006
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- */
-
-/*
- * An utility to resize UBI volumes.
- *
- * Authors: Artem Bityutskiy <dedekind@infradead.org>
- *          Frank Haverkamp <haver@vnet.ibm.com>
- */
-
-#define PROGRAM_VERSION "1.1"
-#define PROGRAM_NAME    "ubirsvol"
-
-#include <stdio.h>
-#include <stdint.h>
-#include <getopt.h>
-#include <stdlib.h>
-#include <string.h>
-
-#include <libubi.h>
-#include "common.h"
-#include "ubiutils-common.h"
-
-/* The variables below are set by command line arguments */
-struct args {
-	int vol_id;
-	const char *node;
-	const char *name;
-	long long bytes;
-	int lebs;
-};
-
-static struct args args = {
-	.vol_id = -1,
-	.bytes = -1,
-	.lebs = -1,
-};
-
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-				 " - a tool to resize UBI volumes.";
-
-static const char optionsstr[] =
-"-n, --vol_id=<volume id>   volume ID to resize\n"
-"-N, --name=<volume name>   volume name to resize\n"
-"-s, --size=<bytes>         volume size volume size in bytes, kilobytes (KiB)\n"
-"                           or megabytes (MiB)\n"
-"-S, --lebs=<LEBs count>    alternative way to give volume size in logical\n"
-"                           eraseblocks\n"
-"-h, -?, --help             print help message\n"
-"-V, --version              print program version";
-
-
-static const char usage[] =
-"Usage: " PROGRAM_NAME " <UBI device node file name> [-n <volume id>] [--vol_id=<volume id>]\n\n"
-"         [-N <volume name>] [--name=<volume name>] [-s <bytes>] [-S <LEBs>] [-h] [--help]\n\n"
-"Example: " PROGRAM_NAME " /dev/ubi0 -n 1 -s 1MiB resize UBI volume 1 to 1 MiB on\n"
-"         UBI device corresponding to /dev/ubi0\n"
-"         " PROGRAM_NAME " /dev/ubi0 -N my_vol -s 1MiB - resize UBI volume named \"my_vol\" to 1 MiB\n"
-"	  on UBI device corresponding to /dev/ubi0";
-
-static const struct option long_options[] = {
-	{ .name = "vol_id",  .has_arg = 1, .flag = NULL, .val = 'n' },
-	{ .name = "name",    .has_arg = 1, .flag = NULL, .val = 'N' },
-	{ .name = "help",    .has_arg = 0, .flag = NULL, .val = 'h' },
-	{ .name = "version", .has_arg = 0, .flag = NULL, .val = 'V' },
-	{ .name = "size",    .has_arg = 1, .flag = NULL, .val = 's' },
-	{ .name = "lebs",    .has_arg = 1, .flag = NULL, .val = 'S' },
-	{ NULL, 0, NULL, 0},
-};
-
-static int param_sanity_check(void)
-{
-	if (args.vol_id == -1 && !args.name) {
-		errmsg("please, specify either volume ID or volume name");
-		return -1;
-	}
-
-	if (args.vol_id != -1 && args.name) {
-		errmsg("please, specify either volume ID or volume name, not both");
-		return -1;
-	}
-
-	if (args.bytes == -1 && args.lebs == -1)
-		return errmsg("volume size was not specified (use -h for help)");
-
-	if (args.bytes != -1 && args.lebs != -1)
-		return errmsg("size specified with more then one option");
-
-	return 0;
-}
-
-static int parse_opt(int argc, char * const argv[])
-{
-	while (1) {
-		int key, error = 0;
-
-		key = getopt_long(argc, argv, "s:S:n:N:h?V", long_options, NULL);
-		if (key == -1)
-			break;
-
-		switch (key) {
-		case 's':
-			args.bytes = ubiutils_get_bytes(optarg);
-			if (args.bytes <= 0)
-				return errmsg("bad volume size: \"%s\"", optarg);
-			break;
-
-		case 'S':
-			args.lebs = simple_strtoull(optarg, &error);
-			if (error || args.lebs <= 0)
-				return errmsg("bad LEB count: \"%s\"", optarg);
-			break;
-
-		case 'n':
-			args.vol_id = simple_strtoul(optarg, &error);
-			if (error || args.vol_id < 0) {
-				errmsg("bad volume ID: " "\"%s\"", optarg);
-				return -1;
-			}
-			break;
-
-		case 'N':
-			args.name = optarg;
-			break;
-
-		case 'h':
-		case '?':
-			printf("%s\n\n", doc);
-			printf("%s\n\n", usage);
-			printf("%s\n", optionsstr);
-			exit(EXIT_SUCCESS);
-
-		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
-			exit(EXIT_SUCCESS);
-
-		case ':':
-			errmsg("parameter is missing");
-			return -1;
-
-		default:
-			fprintf(stderr, "Use -h for help\n");
-			return -1;
-		}
-	}
-
-	if (optind == argc) {
-		errmsg("UBI device name was not specified (use -h for help)");
-		return -1;
-	} else if (optind != argc - 1) {
-		errmsg("more then one UBI device specified (use -h for help)");
-		return -1;
-	}
-
-	args.node = argv[optind];
-
-	if (param_sanity_check())
-		return -1;
-
-	return 0;
-}
-
-int main(int argc, char * const argv[])
-{
-	int err;
-	libubi_t libubi;
-	struct ubi_dev_info dev_info;
-	struct ubi_vol_info vol_info;
-
-	err = parse_opt(argc, argv);
-	if (err)
-		return -1;
-
-	libubi = libubi_open();
-	if (!libubi)
-		return sys_errmsg("cannot open libubi");
-
-	err = ubi_probe_node(libubi, args.node);
-	if (err == 2) {
-		errmsg("\"%s\" is an UBI volume node, not an UBI device node",
-		       args.node);
-		goto out_libubi;
-	} else if (err < 0) {
-		if (errno == ENODEV)
-			errmsg("\"%s\" is not an UBI device node", args.node);
-		else
-			sys_errmsg("error while probing \"%s\"", args.node);
-	}
-
-	err = ubi_get_dev_info(libubi, args.node, &dev_info);
-	if (err) {
-		sys_errmsg("cannot get information about UBI device \"%s\"",
-			   args.node);
-		goto out_libubi;
-	}
-
-	if (args.name) {
-		err = ubi_get_vol_info1_nm(libubi, dev_info.dev_num,
-					   args.name, &vol_info);
-		if (err) {
-			sys_errmsg("cannot find UBI volume \"%s\"", args.name);
-			goto out_libubi;
-		}
-
-		args.vol_id = vol_info.vol_id;
-	} else {
-		err = ubi_get_vol_info1(libubi, dev_info.dev_num,
-					   args.vol_id, &vol_info);
-		if (err) {
-			sys_errmsg("cannot find UBI volume ID %d", args.vol_id);
-			goto out_libubi;
-		}
-	}
-
-	if (args.lebs != -1)
-		args.bytes = vol_info.leb_size * args.lebs;
-
-	err = ubi_rsvol(libubi, args.node, args.vol_id, args.bytes);
-	if (err) {
-		sys_errmsg("cannot UBI resize volume");
-		goto out_libubi;
-	}
-
-	libubi_close(libubi);
-	return 0;
-
-out_libubi:
-	libubi_close(libubi);
-	return -1;
-}
diff --git a/ubi-utils/src/ubiupdatevol.c b/ubi-utils/src/ubiupdatevol.c
deleted file mode 100644
index 24f38fe..0000000
--- a/ubi-utils/src/ubiupdatevol.c
+++ /dev/null
@@ -1,324 +0,0 @@
-/*
- * Copyright (c) International Business Machines Corp., 2006
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- */
-
-/*
- * An utility to update UBI volumes.
- *
- * Authors: Frank Haverkamp
- *          Joshua W. Boyer
- *          Artem Bityutskiy
- */
-
-#define PROGRAM_VERSION "1.2"
-#define PROGRAM_NAME    "ubiupdatevol"
-
-#include <fcntl.h>
-#include <stdio.h>
-#include <stdint.h>
-#include <getopt.h>
-#include <stdarg.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include <sys/stat.h>
-
-#include <libubi.h>
-#include "common.h"
-
-struct args {
-	int truncate;
-	const char *node;
-	const char *img;
-	/* For deprecated -d and -B options handling */
-	char dev_name[256];
-	int size;
-	int use_stdin;
-};
-
-static struct args args;
-
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-			 " - a tool to write data to UBI volumes.";
-
-static const char optionsstr[] =
-"-t, --truncate             truncate volume (wipe it out)\n"
-"-s, --size=<bytes>         bytes in input, if not reading from file\n"
-"-h, --help                 print help message\n"
-"-V, --version              print program version";
-
-static const char usage[] =
-"Usage: " PROGRAM_NAME " <UBI volume node file name> [-t] [-s <size>] [-h] [-V] [--truncate]\n"
-"\t\t\t[--size=<size>] [--help] [--version] <image file>\n\n"
-"Example 1: " PROGRAM_NAME " /dev/ubi0_1 fs.img - write file \"fs.img\" to UBI volume /dev/ubi0_1\n"
-"Example 2: " PROGRAM_NAME " /dev/ubi0_1 -t - wipe out UBI volume /dev/ubi0_1";
-
-static const struct option long_options[] = {
-	{ .name = "truncate", .has_arg = 0, .flag = NULL, .val = 't' },
-	{ .name = "help",     .has_arg = 0, .flag = NULL, .val = 'h' },
-	{ .name = "version",  .has_arg = 0, .flag = NULL, .val = 'V' },
-	{ .name = "size",     .has_arg = 1, .flag = NULL, .val = 's' },
-	{ NULL, 0, NULL, 0}
-};
-
-static int parse_opt(int argc, char * const argv[])
-{
-	while (1) {
-		int key, error = 0;
-
-		key = getopt_long(argc, argv, "ts:h?V", long_options, NULL);
-		if (key == -1)
-			break;
-
-		switch (key) {
-		case 't':
-			args.truncate = 1;
-			break;
-
-		case 's':
-			args.size = simple_strtoul(optarg, &error);
-			if (error || args.size < 0)
-				return errmsg("bad size: " "\"%s\"", optarg);
-			break;
-
-		case 'h':
-		case '?':
-			printf("%s\n\n", doc);
-			printf("%s\n\n", usage);
-			printf("%s\n", optionsstr);
-			exit(EXIT_SUCCESS);
-
-		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
-			exit(EXIT_SUCCESS);
-
-		case ':':
-			return errmsg("parameter is missing");
-
-		default:
-			fprintf(stderr, "Use -h for help\n");
-			return -1;
-		}
-	}
-
-	if (optind == argc)
-		return errmsg("UBI device name was not specified (use -h for help)");
-	else if (optind != argc - 2 && !args.truncate)
-		return errmsg("specify UBI device name and image file name as first 2 "
-			      "parameters (use -h for help)");
-
-	args.node = argv[optind];
-	args.img  = argv[optind + 1];
-
-	if (args.img && args.truncate)
-		return errmsg("You can't truncate and specify an image (use -h for help)");
-
-	if (args.img && !args.truncate) {
-		if (strcmp(args.img, "-") == 0)
-			args.use_stdin = 1;
-		if (args.use_stdin && !args.size)
-			return errmsg("file size must be specified if input is stdin");
-	}
-
-	return 0;
-}
-
-static int truncate_volume(libubi_t libubi)
-{
-	int err, fd;
-
-	fd = open(args.node, O_RDWR);
-	if (fd == -1)
-		return sys_errmsg("cannot open \"%s\"", args.node);
-
-	err = ubi_update_start(libubi, fd, 0);
-	if (err) {
-		sys_errmsg("cannot truncate volume \"%s\"", args.node);
-		close(fd);
-		return -1;
-	}
-
-	close(fd);
-	return 0;
-}
-
-static int ubi_write(int fd, const void *buf, int len)
-{
-	int ret;
-
-	while (len) {
-		ret = write(fd, buf, len);
-		if (ret < 0) {
-			if (errno == EINTR) {
-				warnmsg("do not interrupt me!");
-				continue;
-			}
-			return sys_errmsg("cannot write %d bytes to volume \"%s\"",
-					  len, args.node);
-		}
-
-		if (ret == 0)
-			return errmsg("cannot write %d bytes to volume \"%s\"", len, args.node);
-
-		len -= ret;
-		buf += ret;
-	}
-
-	return 0;
-}
-
-static int update_volume(libubi_t libubi, struct ubi_vol_info *vol_info)
-{
-	int err, fd, ifd;
-	long long bytes;
-	char *buf;
-
-	buf = malloc(vol_info->leb_size);
-	if (!buf)
-		return errmsg("cannot allocate %d bytes of memory", vol_info->leb_size);
-
-	if (!args.size) {
-		struct stat st;
-		err = stat(args.img, &st);
-		if (err < 0) {
-			errmsg("stat failed on \"%s\"", args.img);
-			goto out_free;
-		}
-
-		bytes = st.st_size;
-	} else
-		bytes = args.size;
-
-	if (bytes > vol_info->rsvd_bytes) {
-		errmsg("\"%s\" (size %lld) will not fit volume \"%s\" (size %lld)",
-		       args.img, bytes, args.node, vol_info->rsvd_bytes);
-		goto out_free;
-	}
-
-	fd = open(args.node, O_RDWR);
-	if (fd == -1) {
-		sys_errmsg("cannot open UBI volume \"%s\"", args.node);
-		goto out_free;
-	}
-
-	if (args.use_stdin)
-		ifd = STDIN_FILENO;
-	else {
-		ifd = open(args.img, O_RDONLY);
-		if (ifd == -1) {
-			sys_errmsg("cannot open \"%s\"", args.img);
-			goto out_close1;
-		}
-	}
-
-	err = ubi_update_start(libubi, fd, bytes);
-	if (err) {
-		sys_errmsg("cannot start volume \"%s\" update", args.node);
-		goto out_close;
-	}
-
-	while (bytes) {
-		int ret, to_copy = vol_info->leb_size;
-
-		if (to_copy > bytes)
-			to_copy = bytes;
-
-		ret = read(ifd, buf, to_copy);
-		if (ret <= 0) {
-			if (errno == EINTR) {
-				warnmsg("do not interrupt me!");
-				continue;
-			} else {
-				sys_errmsg("cannot read %d bytes from \"%s\"",
-						to_copy, args.img);
-				goto out_close;
-			}
-		}
-
-		err = ubi_write(fd, buf, ret);
-		if (err)
-			goto out_close;
-		bytes -= ret;
-	}
-
-	close(ifd);
-	close(fd);
-	free(buf);
-	return 0;
-
-out_close:
-	close(ifd);
-out_close1:
-	close(fd);
-out_free:
-	free(buf);
-	return -1;
-}
-
-int main(int argc, char * const argv[])
-{
-	int err;
-	libubi_t libubi;
-	struct ubi_vol_info vol_info;
-
-	err = parse_opt(argc, argv);
-	if (err)
-		return -1;
-
-	libubi = libubi_open();
-	if (!libubi) {
-		if (errno == 0)
-			errmsg("UBI is not present in the system");
-		else
-			sys_errmsg("cannot open libubi");
-		goto out_libubi;
-	}
-
-	err = ubi_probe_node(libubi, args.node);
-	if (err == 1) {
-		errmsg("\"%s\" is an UBI device node, not an UBI volume node",
-		       args.node);
-		goto out_libubi;
-	} else if (err < 0) {
-		if (errno == ENODEV)
-			errmsg("\"%s\" is not an UBI volume node", args.node);
-		else
-			sys_errmsg("error while probing \"%s\"", args.node);
-		goto out_libubi;
-	}
-
-	err = ubi_get_vol_info(libubi, args.node, &vol_info);
-	if (err) {
-		sys_errmsg("cannot get information about UBI volume \"%s\"",
-			   args.node);
-		goto out_libubi;
-	}
-
-	if (args.truncate)
-		err = truncate_volume(libubi);
-	else
-		err = update_volume(libubi, &vol_info);
-	if (err)
-		goto out_libubi;
-
-	libubi_close(libubi);
-	return 0;
-
-out_libubi:
-	libubi_close(libubi);
-	return -1;
-}
diff --git a/ubi-utils/src/ubiutils-common.c b/ubi-utils/src/ubiutils-common.c
deleted file mode 100644
index 6609a6b..0000000
--- a/ubi-utils/src/ubiutils-common.c
+++ /dev/null
@@ -1,211 +0,0 @@
-/*
- * Copyright (C) 2007, 2008 Nokia Corporation
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- */
-
-/*
- * This file contains various common stuff used by UBI utilities.
- *
- * Authors: Artem Bityutskiy
- *          Adrian Hunter
- */
-
-#define PROGRAM_NAME "ubiutils"
-
-#include <sys/time.h>
-#include <sys/types.h>
-#include <stdio.h>
-#include <string.h>
-#include <ctype.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include "common.h"
-
-/**
- * get_multiplier - convert size specifier to an integer multiplier.
- * @str: the size specifier string
- *
- * This function parses the @str size specifier, which may be one of
- * 'KiB', 'MiB', or 'GiB' into an integer multiplier. Returns positive
- * size multiplier in case of success and %-1 in case of failure.
- */
-static int get_multiplier(const char *str)
-{
-	if (!str)
-		return 1;
-
-	/* Remove spaces before the specifier */
-	while (*str == ' ' || *str == '\t')
-		str += 1;
-
-	if (!strcmp(str, "KiB"))
-		return 1024;
-	if (!strcmp(str, "MiB"))
-		return 1024 * 1024;
-	if (!strcmp(str, "GiB"))
-		return 1024 * 1024 * 1024;
-
-	return -1;
-}
-
-/**
- * ubiutils_get_bytes - convert a string containing amount of bytes into an
- * integer
- * @str: string to convert
- *
- * This function parses @str which may have one of 'KiB', 'MiB', or 'GiB'
- * size specifiers. Returns positive amount of bytes in case of success and %-1
- * in case of failure.
- */
-long long ubiutils_get_bytes(const char *str)
-{
-	char *endp;
-	long long bytes = strtoull(str, &endp, 0);
-
-	if (endp == str || bytes < 0) {
-		fprintf(stderr, "incorrect amount of bytes: \"%s\"\n", str);
-		return -1;
-	}
-
-	if (*endp != '\0') {
-		int mult = get_multiplier(endp);
-
-		if (mult == -1) {
-			fprintf(stderr, "bad size specifier: \"%s\" - "
-			        "should be 'KiB', 'MiB' or 'GiB'\n", endp);
-			return -1;
-		}
-		bytes *= mult;
-	}
-
-	return bytes;
-}
-
-/**
- * ubiutils_print_bytes - print bytes.
- * @bytes: variable to print
- * @bracket: whether brackets have to be put or not
- *
- * This is a helper function which prints amount of bytes in a human-readable
- * form, i.e., it prints the exact amount of bytes following by the approximate
- * amount of Kilobytes, Megabytes, or Gigabytes, depending on how big @bytes
- * is.
- */
-void ubiutils_print_bytes(long long bytes, int bracket)
-{
-	const char *p;
-
-	if (bracket)
-		p = " (";
-	else
-		p = ", ";
-
-	printf("%lld bytes", bytes);
-
-	if (bytes > 1024 * 1024 * 1024)
-		printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 1024));
-	else if (bytes > 1024 * 1024)
-		printf("%s%.1f MiB", p, (double)bytes / (1024 * 1024));
-	else if (bytes > 1024 && bytes != 0)
-		printf("%s%.1f KiB", p, (double)bytes / 1024);
-	else
-		return;
-
-	if (bracket)
-		printf(")");
-}
-
-/**
- * ubiutils_print_text - print text and fold it.
- * @stream: file stream to print to
- * @text: text to print
- * @width: maximum allowed text width
- *
- * Print text and fold it so that each line would not have more then @width
- * characters.
- */
-void ubiutils_print_text(FILE *stream, const char *text, int width)
-{
-	int pos, bpos = 0;
-	const char *p;
-	char line[1024];
-
-	if (width > 1023) {
-		fprintf(stream, "%s\n", text);
-		return;
-	}
-	p = text;
-	pos = 0;
-	while (p[pos]) {
-		while (!isspace(p[pos])) {
-			line[pos] = p[pos];
-			if (!p[pos])
-				break;
-			++pos;
-			if (pos == width) {
-				line[pos] = '\0';
-				fprintf(stream, "%s\n", line);
-				p += pos;
-				pos = 0;
-			}
-		}
-		while (pos < width) {
-			line[pos] = p[pos];
-			if (!p[pos]) {
-				bpos = pos;
-				break;
-			}
-			if (isspace(p[pos]))
-				bpos = pos;
-			++pos;
-		}
-		line[bpos] = '\0';
-		fprintf(stream, "%s\n", line);
-		p += bpos;
-		pos = 0;
-		while (p[pos] && isspace(p[pos]))
-			++p;
-	}
-}
-
-/**
- * ubiutils_srand - randomly seed the standard pseudo-random generator.
- *
- * This helper function seeds the standard libc pseudo-random generator with a
- * more or less random value to make sure the 'rand()' call does not return the
- * same sequence every time UBI utilities run. Returns zero in case of success
- * and a %-1 in case of error.
- */
-int ubiutils_srand(void)
-{
-	struct timeval tv;
-	struct timezone tz;
-	unsigned int seed;
-
-	/*
-	 * Just assume that a combination of the PID + current time is a
-	 * reasonably random number.
-	 */
-	if (gettimeofday(&tv, &tz))
-		return -1;
-
-	seed = (unsigned int)tv.tv_sec;
-	seed += (unsigned int)tv.tv_usec;
-	seed *= getpid();
-	seed %= RAND_MAX;
-	srand(seed);
-	return 0;
-}
diff --git a/ubi-utils/ubiattach.c b/ubi-utils/ubiattach.c
new file mode 100644
index 0000000..4f18e99
--- /dev/null
+++ b/ubi-utils/ubiattach.c
@@ -0,0 +1,225 @@
+/*
+ * Copyright (C) 2007 Nokia Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+/*
+ * An utility to attach MTD devices to UBI.
+ *
+ * Author: Artem Bityutskiy
+ */
+
+#define PROGRAM_VERSION "1.1"
+#define PROGRAM_NAME    "ubiattach"
+
+#include <stdio.h>
+#include <stdint.h>
+#include <getopt.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <libubi.h>
+#include "common.h"
+#include "ubiutils-common.h"
+
+#define DEFAULT_CTRL_DEV "/dev/ubi_ctrl"
+
+/* The variables below are set by command line arguments */
+struct args {
+	int devn;
+	int mtdn;
+	int vidoffs;
+	const char *node;
+	const char *dev;
+};
+
+static struct args args = {
+	.devn = UBI_DEV_NUM_AUTO,
+	.mtdn = -1,
+	.vidoffs = 0,
+	.node = NULL,
+	.dev = NULL,
+};
+
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+			 " - a tool to attach MTD device to UBI.";
+
+static const char optionsstr[] =
+"-d, --devn=<number>   the number to assign to the newly created UBI device\n"
+"                      (assigned automatically if this is not specified)\n"
+"-p, --dev-path=<path> path to MTD device node to attach\n"
+"-m, --mtdn=<number>   MTD device number to attach (alternative method, e.g\n"
+"                      if the character device node does not exist)\n"
+"-O, --vid-hdr-offset  VID header offset (do not specify this unless you really\n"
+"                      know what you are doing, the default should be optimal)\n"
+"-h, --help            print help message\n"
+"-V, --version         print program version";
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " [<UBI control device node file name>]\n"
+"\t[-m <MTD device number>] [-d <UBI device number>] [-p <path to device>]\n"
+"\t[--mtdn=<MTD device number>] [--devn=<UBI device number>]\n"
+"\t[--dev-path=<path to device>]\n"
+"UBI control device defaults to " DEFAULT_CTRL_DEV " if not supplied.\n"
+"Example 1: " PROGRAM_NAME " -p /dev/mtd0 - attach /dev/mtd0 to UBI\n"
+"Example 2: " PROGRAM_NAME " -m 0 - attach MTD device 0 (mtd0) to UBI\n"
+"Example 3: " PROGRAM_NAME " -m 0 -d 3 - attach MTD device 0 (mtd0) to UBI\n"
+"           and create UBI device number 3 (ubi3)";
+
+static const struct option long_options[] = {
+	{ .name = "devn",           .has_arg = 1, .flag = NULL, .val = 'd' },
+	{ .name = "dev-path",       .has_arg = 1, .flag = NULL, .val = 'p' },
+	{ .name = "mtdn",           .has_arg = 1, .flag = NULL, .val = 'm' },
+	{ .name = "vid-hdr-offset", .has_arg = 1, .flag = NULL, .val = 'O' },
+	{ .name = "help",           .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",        .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ NULL, 0, NULL, 0},
+};
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int key, error = 0;
+
+		key = getopt_long(argc, argv, "p:m:d:O:hV", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 'p':
+			args.dev = optarg;
+			break;
+		case 'd':
+			args.devn = simple_strtoul(optarg, &error);
+			if (error || args.devn < 0)
+				return errmsg("bad UBI device number: \"%s\"", optarg);
+
+			break;
+
+		case 'm':
+			args.mtdn = simple_strtoul(optarg, &error);
+			if (error || args.mtdn < 0)
+				return errmsg("bad MTD device number: \"%s\"", optarg);
+
+			break;
+
+		case 'O':
+			args.vidoffs = simple_strtoul(optarg, &error);
+			if (error || args.vidoffs <= 0)
+				return errmsg("bad VID header offset: \"%s\"", optarg);
+
+			break;
+
+		case 'h':
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'V':
+			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
+		case ':':
+			return errmsg("parameter is missing");
+
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+
+	if (optind == argc)
+		args.node = DEFAULT_CTRL_DEV;
+	else if (optind != argc - 1)
+		return errmsg("more then one UBI control device specified (use -h for help)");
+	else
+		args.node = argv[optind];
+
+	if (args.mtdn == -1 && args.dev == NULL)
+		return errmsg("MTD device to attach was not specified (use -h for help)");
+
+	return 0;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err;
+	libubi_t libubi;
+	struct ubi_info ubi_info;
+	struct ubi_dev_info dev_info;
+	struct ubi_attach_request req;
+
+	err = parse_opt(argc, argv);
+	if (err)
+		return -1;
+
+	libubi = libubi_open();
+	if (!libubi) {
+		if (errno == 0)
+			return errmsg("UBI is not present in the system");
+		return sys_errmsg("cannot open libubi");
+	}
+
+	/*
+	 * Make sure the kernel is fresh enough and this feature is supported.
+	 */
+	err = ubi_get_info(libubi, &ubi_info);
+	if (err) {
+		sys_errmsg("cannot get UBI information");
+		goto out_libubi;
+	}
+
+	if (ubi_info.ctrl_major == -1) {
+		errmsg("MTD attach/detach feature is not supported by your kernel");
+		goto out_libubi;
+	}
+
+	req.dev_num = args.devn;
+	req.mtd_num = args.mtdn;
+	req.vid_hdr_offset = args.vidoffs;
+	req.mtd_dev_node = args.dev;
+
+	err = ubi_attach(libubi, args.node, &req);
+	if (err) {
+		if (args.dev)
+			sys_errmsg("cannot attach \"%s\"", args.dev);
+		else
+			sys_errmsg("cannot attach mtd%d", args.mtdn);
+		goto out_libubi;
+	}
+
+	/* Print some information about the new UBI device */
+	err = ubi_get_dev_info1(libubi, req.dev_num, &dev_info);
+	if (err) {
+		sys_errmsg("cannot get information about newly created UBI device");
+		goto out_libubi;
+	}
+
+	printf("UBI device number %d, total %d LEBs (", dev_info.dev_num, dev_info.total_lebs);
+	ubiutils_print_bytes(dev_info.total_bytes, 0);
+	printf("), available %d LEBs (", dev_info.avail_lebs);
+	ubiutils_print_bytes(dev_info.avail_bytes, 0);
+	printf("), LEB size ");
+	ubiutils_print_bytes(dev_info.leb_size, 1);
+	printf("\n");
+
+	libubi_close(libubi);
+	return 0;
+
+out_libubi:
+	libubi_close(libubi);
+	return -1;
+}
diff --git a/ubi-utils/ubicrc32.c b/ubi-utils/ubicrc32.c
new file mode 100644
index 0000000..73ec595
--- /dev/null
+++ b/ubi-utils/ubicrc32.c
@@ -0,0 +1,124 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+/*
+ * Calculate CRC32 with UBI start value (0xFFFFFFFF) for a given binary image.
+ *
+ * Author: Oliver Lohmann
+ */
+
+#define PROGRAM_VERSION "1.0"
+#define PROGRAM_NAME    "ubicrc32"
+
+#include <stdio.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <getopt.h>
+#include <unistd.h>
+#include <mtd/ubi-media.h>
+#include <crc32.h>
+
+#include "common.h"
+
+#define BUFSIZE 4096
+
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+			 " - a tool to calculate CRC32 with UBI start value (0xFFFFFFFF)";
+
+static const char optionsstr[] =
+"-h, --help                    print help message\n"
+"-V, --version                 print program version";
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " <file to calculate CRC32 for> [-h] [--help]";
+
+static const struct option long_options[] = {
+	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ NULL, 0, NULL, 0},
+};
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int key;
+
+		key = getopt_long(argc, argv, "hV", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 'h':
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'V':
+			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
+		case ':':
+			return errmsg("parameter is missing");
+
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+
+	return 0;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err = 0;
+	uint32_t crc = UBI_CRC32_INIT;
+	char buf[BUFSIZE];
+	FILE *fp;
+
+	if (argc > 1) {
+		fp = fopen(argv[1], "r");
+		if (!fp)
+			return sys_errmsg("cannot open \"%s\"", argv[1]);
+	} else
+		fp = stdin;
+
+	err = parse_opt(argc, argv);
+	if (err)
+		return err;
+
+	while (!feof(fp)) {
+		size_t read;
+
+		read = fread(buf, 1, BUFSIZE, fp);
+		if (ferror(fp)) {
+			sys_errmsg("cannot read input file");
+			err = -1;
+			goto out_close;
+		}
+		crc = mtd_crc32(crc, buf, read);
+	}
+
+	printf("0x%08x\n", crc);
+
+out_close:
+	if (fp != stdin)
+		fclose(fp);
+	return err;
+}
diff --git a/ubi-utils/ubidetach.c b/ubi-utils/ubidetach.c
new file mode 100644
index 0000000..668f1bd
--- /dev/null
+++ b/ubi-utils/ubidetach.c
@@ -0,0 +1,208 @@
+/*
+ * Copyright (C) 2007 Nokia Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+/*
+ * An utility to delete UBI devices (detach MTD devices from UBI).
+ *
+ * Author: Artem Bityutskiy
+ */
+
+#define PROGRAM_VERSION "1.1"
+#define PROGRAM_NAME    "ubidetach"
+
+#include <stdio.h>
+#include <stdint.h>
+#include <getopt.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <libubi.h>
+#include "common.h"
+
+#define DEFAULT_CTRL_DEV "/dev/ubi_ctrl"
+
+/* The variables below are set by command line arguments */
+struct args {
+	int devn;
+	int mtdn;
+	const char *node;
+	const char *dev;
+};
+
+static struct args args = {
+	.devn = UBI_DEV_NUM_AUTO,
+	.mtdn = -1,
+	.node = NULL,
+	.dev = NULL,
+};
+
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+" - tool to remove UBI devices (detach MTD devices from UBI)";
+
+static const char optionsstr[] =
+"-d, --devn=<UBI device number>  UBI device number to delete\n"
+"-p, --dev-path=<path to device> or alternatively, MTD device node path to detach\n"
+"-m, --mtdn=<MTD device number>  or alternatively, MTD device number to detach\n"
+"-h, --help                      print help message\n"
+"-V, --version                   print program version";
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " [<UBI control device node file name>]\n"
+"\t[-d <UBI device number>] [-m <MTD device number>] [-p <path to device>]\n"
+"\t[--devn=<UBI device number>] [--mtdn=<MTD device number>]\n"
+"\t[--dev-path=<path to device>]\n"
+"UBI control device defaults to " DEFAULT_CTRL_DEV " if not supplied.\n"
+"Example 1: " PROGRAM_NAME " -p /dev/mtd0 - detach MTD device /dev/mtd0\n"
+"Example 2: " PROGRAM_NAME " -d 2 - delete UBI device 2 (ubi2)\n"
+"Example 3: " PROGRAM_NAME " -m 0 - detach MTD device 0 (mtd0)";
+
+static const struct option long_options[] = {
+	{ .name = "devn",     .has_arg = 1, .flag = NULL, .val = 'd' },
+	{ .name = "dev-path", .has_arg = 1, .flag = NULL, .val = 'p' },
+	{ .name = "mtdn",     .has_arg = 1, .flag = NULL, .val = 'm' },
+	{ .name = "help",     .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",  .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ NULL, 0, NULL, 0},
+};
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int key, error = 0;
+
+		key = getopt_long(argc, argv, "p:m:d:hV", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 'p':
+			args.dev = optarg;
+			break;
+		case 'd':
+			args.devn = simple_strtoul(optarg, &error);
+			if (error || args.devn < 0)
+				return errmsg("bad UBI device number: \"%s\"", optarg);
+
+			break;
+
+		case 'm':
+			args.mtdn = simple_strtoul(optarg, &error);
+			if (error || args.mtdn < 0)
+				return errmsg("bad MTD device number: \"%s\"", optarg);
+
+			break;
+
+		case 'h':
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'V':
+			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
+		case ':':
+			return errmsg("parameter is missing");
+
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+
+	if (optind == argc)
+		args.node = DEFAULT_CTRL_DEV;
+	else if (optind != argc - 1)
+		return errmsg("more then one UBI control device specified (use -h for help)");
+	else
+		args.node = argv[optind];
+
+	if (args.mtdn == -1 && args.devn == -1 && args.dev == NULL)
+		return errmsg("neither MTD nor UBI devices were specified (use -h for help)");
+
+	if (args.devn != -1) {
+		if (args.mtdn != -1 || args.dev != NULL)
+			return errmsg("specify either MTD or UBI device (use -h for help)");
+
+	} else if (args.mtdn != -1 && args.dev != NULL)
+		return errmsg("specify either MTD number or device node (use -h for help)");
+
+	return 0;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err;
+	libubi_t libubi;
+	struct ubi_info ubi_info;
+
+	err = parse_opt(argc, argv);
+	if (err)
+		return -1;
+
+	libubi = libubi_open();
+	if (!libubi) {
+		if (errno == 0)
+			return errmsg("UBI is not present in the system");
+		return sys_errmsg("cannot open libubi");
+	}
+
+	/*
+	 * Make sure the kernel is fresh enough and this feature is supported.
+	 */
+	err = ubi_get_info(libubi, &ubi_info);
+	if (err) {
+		sys_errmsg("cannot get UBI information");
+		goto out_libubi;
+	}
+
+	if (ubi_info.ctrl_major == -1) {
+		errmsg("MTD detach/detach feature is not supported by your kernel");
+		goto out_libubi;
+	}
+
+	if (args.devn != -1) {
+		err = ubi_remove_dev(libubi, args.node, args.devn);
+		if (err) {
+			sys_errmsg("cannot remove ubi%d", args.devn);
+			goto out_libubi;
+		}
+	} else {
+		if (args.dev != NULL) {
+			err = ubi_detach(libubi, args.node, args.dev);
+			if (err) {
+				sys_errmsg("cannot detach \"%s\"", args.dev);
+				goto out_libubi;
+			}
+		} else {
+			err = ubi_detach_mtd(libubi, args.node, args.mtdn);
+			if (err) {
+				sys_errmsg("cannot detach mtd%d", args.mtdn);
+				goto out_libubi;
+			}
+		}
+	}
+
+	libubi_close(libubi);
+	return 0;
+
+out_libubi:
+	libubi_close(libubi);
+	return -1;
+}
+
diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
new file mode 100644
index 0000000..c4b944a
--- /dev/null
+++ b/ubi-utils/ubiformat.c
@@ -0,0 +1,950 @@
+/*
+ * Copyright (C) 2008 Nokia Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+/*
+ * An utility to format MTD devices into UBI and flash UBI images.
+ *
+ * Author: Artem Bityutskiy
+ */
+
+/*
+ * Maximum amount of consequtive eraseblocks which are considered as normal by
+ * this utility. Otherwise it is assume that something is wrong with the flash
+ * or the driver, and eraseblocks are stopped being marked as bad.
+ */
+#define MAX_CONSECUTIVE_BAD_BLOCKS 4
+
+#define PROGRAM_VERSION "1.5"
+#define PROGRAM_NAME    "ubiformat"
+
+#include <sys/stat.h>
+#include <unistd.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <getopt.h>
+#include <fcntl.h>
+
+#include <libubi.h>
+#include <libmtd.h>
+#include <libscan.h>
+#include <libubigen.h>
+#include <mtd_swab.h>
+#include <crc32.h>
+#include "common.h"
+#include "ubiutils-common.h"
+
+/* The variables below are set by command line arguments */
+struct args {
+	unsigned int yes:1;
+	unsigned int quiet:1;
+	unsigned int verbose:1;
+	unsigned int override_ec:1;
+	unsigned int novtbl:1;
+	unsigned int manual_subpage;
+	int subpage_size;
+	int vid_hdr_offs;
+	int ubi_ver;
+	uint32_t image_seq;
+	off_t image_sz;
+	long long ec;
+	const char *image;
+	const char *node;
+	int node_fd;
+};
+
+static struct args args =
+{
+	.ubi_ver   = 1,
+};
+
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+		" - a tool to format MTD devices and flash UBI images";
+
+static const char optionsstr[] =
+"-s, --sub-page-size=<bytes>  minimum input/output unit used for UBI\n"
+"                             headers, e.g. sub-page size in case of NAND\n"
+"                             flash (equivalent to the minimum input/output\n"
+"                             unit size by default)\n"
+"-O, --vid-hdr-offset=<offs>  offset if the VID header from start of the\n"
+"                             physical eraseblock (default is the next\n"
+"                             minimum I/O unit or sub-page after the EC\n"
+"                             header)\n"
+"-n, --no-volume-table        only erase all eraseblock and preserve erase\n"
+"                             counters, do not write empty volume table\n"
+"-f, --flash-image=<file>     flash image file, or '-' for stdin\n"
+"-S, --image-size=<bytes>     bytes in input, if not reading from file\n"
+"-e, --erase-counter=<value>  use <value> as the erase counter value for all\n"
+"                             eraseblocks\n"
+"-x, --ubi-ver=<num>          UBI version number to put to EC headers\n"
+"                             (default is 1)\n"
+"-Q, --image-seq=<num>        32-bit UBI image sequence number to use\n"
+"                             (by default a random number is picked)\n"
+"-y, --yes                    assume the answer is \"yes\" for all question\n"
+"                             this program would otherwise ask\n"
+"-q, --quiet                  suppress progress percentage information\n"
+"-v, --verbose                be verbose\n"
+"-h, -?, --help               print help message\n"
+"-V, --version                print program version\n";
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " <MTD device node file name> [-s <bytes>] [-O <offs>] [-n]\n"
+"\t\t\t[-f <file>] [-S <bytes>] [-e <value>] [-x <num>] [-y] [-q] [-v] [-h] [-v]\n"
+"\t\t\t[--sub-page-size=<bytes>] [--vid-hdr-offset=<offs>] [--no-volume-table]\n"
+"\t\t\t[--flash-image=<file>] [--image-size=<bytes>] [--erase-counter=<value>]\n"
+"\t\t\t[--ubi-ver=<num>] [--yes] [--quiet] [--verbose] [--help] [--version]\n\n"
+"Example 1: " PROGRAM_NAME " /dev/mtd0 -y - format MTD device number 0 and do\n"
+"           not ask questions.\n"
+"Example 2: " PROGRAM_NAME " /dev/mtd0 -q -e 0 - format MTD device number 0,\n"
+"           be quiet and force erase counter value 0.";
+
+static const struct option long_options[] = {
+	{ .name = "sub-page-size",   .has_arg = 1, .flag = NULL, .val = 's' },
+	{ .name = "vid-hdr-offset",  .has_arg = 1, .flag = NULL, .val = 'O' },
+	{ .name = "no-volume-table", .has_arg = 0, .flag = NULL, .val = 'n' },
+	{ .name = "flash-image",     .has_arg = 1, .flag = NULL, .val = 'f' },
+	{ .name = "image-size",      .has_arg = 1, .flag = NULL, .val = 'S' },
+	{ .name = "yes",             .has_arg = 0, .flag = NULL, .val = 'y' },
+	{ .name = "erase-counter",   .has_arg = 1, .flag = NULL, .val = 'e' },
+	{ .name = "quiet",           .has_arg = 0, .flag = NULL, .val = 'q' },
+	{ .name = "verbose",         .has_arg = 0, .flag = NULL, .val = 'v' },
+	{ .name = "ubi-ver",         .has_arg = 1, .flag = NULL, .val = 'x' },
+	{ .name = "help",            .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",         .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ NULL, 0, NULL, 0},
+};
+
+static int parse_opt(int argc, char * const argv[])
+{
+	ubiutils_srand();
+	args.image_seq = rand();
+
+	while (1) {
+		int key, error = 0;
+		unsigned long int image_seq;
+
+		key = getopt_long(argc, argv, "nh?Vyqve:x:s:O:f:S:", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 's':
+			args.subpage_size = ubiutils_get_bytes(optarg);
+			if (args.subpage_size <= 0)
+				return errmsg("bad sub-page size: \"%s\"", optarg);
+			if (!is_power_of_2(args.subpage_size))
+				return errmsg("sub-page size should be power of 2");
+			break;
+
+		case 'O':
+			args.vid_hdr_offs = simple_strtoul(optarg, &error);
+			if (error || args.vid_hdr_offs <= 0)
+				return errmsg("bad VID header offset: \"%s\"", optarg);
+			break;
+
+		case 'e':
+			args.ec = simple_strtoull(optarg, &error);
+			if (error || args.ec < 0)
+				return errmsg("bad erase counter value: \"%s\"", optarg);
+			if (args.ec >= EC_MAX)
+				return errmsg("too high erase %llu, counter, max is %u", args.ec, EC_MAX);
+			args.override_ec = 1;
+			break;
+
+		case 'f':
+			args.image = optarg;
+			break;
+
+		case 'S':
+			args.image_sz = ubiutils_get_bytes(optarg);
+			if (args.image_sz <= 0)
+				return errmsg("bad image-size: \"%s\"", optarg);
+			break;
+
+		case 'n':
+			args.novtbl = 1;
+			break;
+
+		case 'y':
+			args.yes = 1;
+			break;
+
+		case 'q':
+			args.quiet = 1;
+			break;
+
+		case 'x':
+			args.ubi_ver = simple_strtoul(optarg, &error);
+			if (error || args.ubi_ver < 0)
+				return errmsg("bad UBI version: \"%s\"", optarg);
+			break;
+
+		case 'Q':
+			image_seq = simple_strtoul(optarg, &error);
+			if (error || image_seq > 0xFFFFFFFF)
+				return errmsg("bad UBI image sequence number: \"%s\"", optarg);
+			args.image_seq = image_seq;
+			break;
+
+
+		case 'v':
+			args.verbose = 1;
+			break;
+
+		case 'V':
+			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
+		case 'h':
+		case '?':
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case ':':
+			return errmsg("parameter is missing");
+
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+
+	if (args.quiet && args.verbose)
+		return errmsg("using \"-q\" and \"-v\" at the same time does not make sense");
+
+	if (optind == argc)
+		return errmsg("MTD device name was not specified (use -h for help)");
+	else if (optind != argc - 1)
+		return errmsg("more then one MTD device specified (use -h for help)");
+
+	if (args.image && args.novtbl)
+		return errmsg("-n cannot be used together with -f");
+
+
+	args.node = argv[optind];
+	return 0;
+}
+
+static int want_exit(void)
+{
+	char buf[4];
+
+	while (1) {
+		normsg_cont("continue? (yes/no)  ");
+		if (scanf("%3s", buf) == EOF) {
+			sys_errmsg("scanf returned unexpected EOF, assume \"yes\"");
+			return 1;
+		}
+		if (!strncmp(buf, "yes", 3) || !strncmp(buf, "y", 1))
+			return 0;
+		if (!strncmp(buf, "no", 2) || !strncmp(buf, "n", 1))
+			return 1;
+	}
+}
+
+static int answer_is_yes(void)
+{
+	char buf[4];
+
+	while (1) {
+		if (scanf("%3s", buf) == EOF) {
+			sys_errmsg("scanf returned unexpected EOF, assume \"no\"");
+			return 0;
+		}
+		if (!strncmp(buf, "yes", 3) || !strncmp(buf, "y", 1))
+			return 1;
+		if (!strncmp(buf, "no", 2) || !strncmp(buf, "n", 1))
+			return 0;
+	}
+}
+
+static void print_bad_eraseblocks(const struct mtd_dev_info *mtd,
+				  const struct ubi_scan_info *si)
+{
+	int first = 1, eb;
+
+	if (si->bad_cnt == 0)
+		return;
+
+	normsg_cont("%d bad eraseblocks found, numbers: ", si->bad_cnt);
+	for (eb = 0; eb < mtd->eb_cnt; eb++) {
+		if (si->ec[eb] != EB_BAD)
+			continue;
+		if (first) {
+			printf("%d", eb);
+			first = 0;
+		} else
+			printf(", %d", eb);
+	}
+	printf("\n");
+}
+
+static int change_ech(struct ubi_ec_hdr *hdr, uint32_t image_seq,
+		      long long ec)
+{
+	uint32_t crc;
+
+	/* Check the EC header */
+	if (be32_to_cpu(hdr->magic) != UBI_EC_HDR_MAGIC)
+		return errmsg("bad UBI magic %#08x, should be %#08x",
+			      be32_to_cpu(hdr->magic), UBI_EC_HDR_MAGIC);
+
+	crc = mtd_crc32(UBI_CRC32_INIT, hdr, UBI_EC_HDR_SIZE_CRC);
+	if (be32_to_cpu(hdr->hdr_crc) != crc)
+		return errmsg("bad CRC %#08x, should be %#08x\n",
+			      crc, be32_to_cpu(hdr->hdr_crc));
+
+	hdr->image_seq = cpu_to_be32(image_seq);
+	hdr->ec = cpu_to_be64(ec);
+	crc = mtd_crc32(UBI_CRC32_INIT, hdr, UBI_EC_HDR_SIZE_CRC);
+	hdr->hdr_crc = cpu_to_be32(crc);
+
+	return 0;
+}
+
+static int drop_ffs(const struct mtd_dev_info *mtd, const void *buf, int len)
+{
+	int i;
+
+        for (i = len - 1; i >= 0; i--)
+		if (((const uint8_t *)buf)[i] != 0xFF)
+		      break;
+
+        /* The resulting length must be aligned to the minimum flash I/O size */
+        len = i + 1;
+	len = (len + mtd->min_io_size - 1) / mtd->min_io_size;
+	len *=  mtd->min_io_size;
+        return len;
+}
+
+static int open_file(off_t *sz)
+{
+	int fd;
+
+	if (!strcmp(args.image, "-")) {
+		if (args.image_sz == 0)
+			return errmsg("must use '-S' with non-zero value when reading from stdin");
+
+		*sz = args.image_sz;
+		fd  = dup(STDIN_FILENO);
+		if (fd < 0)
+			return sys_errmsg("failed to dup stdin");
+	} else {
+		struct stat st;
+
+		if (stat(args.image, &st))
+			return sys_errmsg("cannot open \"%s\"", args.image);
+
+		*sz = st.st_size;
+		fd  = open(args.image, O_RDONLY);
+		if (fd == -1)
+			return sys_errmsg("cannot open \"%s\"", args.image);
+	}
+
+	return fd;
+}
+
+static int read_all(int fd, void *buf, size_t len)
+{
+	while (len > 0) {
+		ssize_t l = read(fd, buf, len);
+		if (l == 0)
+			return errmsg("eof reached; %zu bytes remaining", len);
+		else if (l > 0) {
+			buf += l;
+			len -= l;
+		} else if (errno == EINTR || errno == EAGAIN)
+			continue;
+		else
+			return sys_errmsg("reading failed; %zu bytes remaining", len);
+	}
+
+	return 0;
+}
+
+/*
+ * Returns %-1 if consecutive bad blocks exceeds the
+ * MAX_CONSECUTIVE_BAD_BLOCKS and returns %0 otherwise.
+ */
+static int consecutive_bad_check(int eb)
+{
+	static int consecutive_bad_blocks = 1;
+	static int prev_bb = -1;
+
+	if (prev_bb == -1)
+		prev_bb = eb;
+
+	if (eb == prev_bb + 1)
+		consecutive_bad_blocks += 1;
+	else
+		consecutive_bad_blocks = 1;
+
+	prev_bb = eb;
+
+	if (consecutive_bad_blocks >= MAX_CONSECUTIVE_BAD_BLOCKS) {
+		if (!args.quiet)
+			printf("\n");
+		return errmsg("consecutive bad blocks exceed limit: %d, bad flash?",
+		              MAX_CONSECUTIVE_BAD_BLOCKS);
+	}
+
+	return 0;
+}
+
+/* TODO: we should actually torture the PEB before marking it as bad */
+static int mark_bad(const struct mtd_dev_info *mtd, struct ubi_scan_info *si, int eb)
+{
+	int err;
+
+	if (!args.yes) {
+		normsg_cont("mark it as bad? Continue (yes/no) ");
+		if (!answer_is_yes())
+			return -1;
+	}
+
+	if (!args.quiet)
+		normsg_cont("marking block %d bad", eb);
+
+	if (!args.quiet)
+		printf("\n");
+
+	if (!mtd->bb_allowed) {
+		if (!args.quiet)
+			printf("\n");
+		return errmsg("bad blocks not supported by this flash");
+	}
+
+	err = mtd_mark_bad(mtd, args.node_fd, eb);
+	if (err)
+		return err;
+
+	si->bad_cnt += 1;
+	si->ec[eb] = EB_BAD;
+
+	return consecutive_bad_check(eb);
+}
+
+static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
+		       const struct ubigen_info *ui, struct ubi_scan_info *si)
+{
+	int fd, img_ebs, eb, written_ebs = 0, divisor;
+	off_t st_size;
+
+	fd = open_file(&st_size);
+	if (fd < 0)
+		return fd;
+
+	img_ebs = st_size / mtd->eb_size;
+
+	if (img_ebs > si->good_cnt) {
+		sys_errmsg("file \"%s\" is too large (%lld bytes)",
+			   args.image, (long long)st_size);
+		goto out_close;
+	}
+
+	if (st_size % mtd->eb_size) {
+		return sys_errmsg("file \"%s\" (size %lld bytes) is not multiple of ""eraseblock size (%d bytes)",
+				  args.image, (long long)st_size, mtd->eb_size);
+		goto out_close;
+	}
+
+	verbose(args.verbose, "will write %d eraseblocks", img_ebs);
+	divisor = img_ebs;
+	for (eb = 0; eb < mtd->eb_cnt; eb++) {
+		int err, new_len;
+		char buf[mtd->eb_size];
+		long long ec;
+
+		if (!args.quiet && !args.verbose) {
+			printf("\r" PROGRAM_NAME ": flashing eraseblock %d -- %2lld %% complete  ",
+			       eb, (long long)(eb + 1) * 100 / divisor);
+			fflush(stdout);
+		}
+
+		if (si->ec[eb] == EB_BAD) {
+			divisor += 1;
+			continue;
+		}
+
+		if (args.verbose) {
+			normsg_cont("eraseblock %d: erase", eb);
+			fflush(stdout);
+		}
+
+		err = mtd_erase(libmtd, mtd, args.node_fd, eb);
+		if (err) {
+			if (!args.quiet)
+				printf("\n");
+			sys_errmsg("failed to erase eraseblock %d", eb);
+
+			if (errno != EIO)
+				goto out_close;
+
+			if (mark_bad(mtd, si, eb))
+				goto out_close;
+
+			continue;
+		}
+
+		err = read_all(fd, buf, mtd->eb_size);
+		if (err) {
+			sys_errmsg("failed to read eraseblock %d from \"%s\"",
+				   written_ebs, args.image);
+			goto out_close;
+		}
+
+		if (args.override_ec)
+			ec = args.ec;
+		else if (si->ec[eb] <= EC_MAX)
+			ec = si->ec[eb] + 1;
+		else
+			ec = si->mean_ec;
+
+		if (args.verbose) {
+			printf(", change EC to %lld", ec);
+			fflush(stdout);
+		}
+
+		err = change_ech((struct ubi_ec_hdr *)buf, ui->image_seq, ec);
+		if (err) {
+			errmsg("bad EC header at eraseblock %d of \"%s\"",
+			       written_ebs, args.image);
+			goto out_close;
+		}
+
+		if (args.verbose) {
+			printf(", write data\n");
+			fflush(stdout);
+		}
+
+		new_len = drop_ffs(mtd, buf, mtd->eb_size);
+
+		err = mtd_write(mtd, args.node_fd, eb, 0, buf, new_len);
+		if (err) {
+			sys_errmsg("cannot write eraseblock %d", eb);
+
+			if (errno != EIO)
+				goto out_close;
+
+			err = mtd_torture(libmtd, mtd, args.node_fd, eb);
+			if (err) {
+				if (mark_bad(mtd, si, eb))
+					goto out_close;
+			}
+			continue;
+		}
+		if (++written_ebs >= img_ebs)
+			break;
+	}
+
+	if (!args.quiet && !args.verbose)
+		printf("\n");
+	close(fd);
+	return eb + 1;
+
+out_close:
+	close(fd);
+	return -1;
+}
+
+static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
+		  const struct ubigen_info *ui, struct ubi_scan_info *si,
+		  int start_eb, int novtbl)
+{
+	int eb, err, write_size;
+	struct ubi_ec_hdr *hdr;
+	struct ubi_vtbl_record *vtbl;
+	int eb1 = -1, eb2 = -1;
+	long long ec1 = -1, ec2 = -1;
+
+	write_size = UBI_EC_HDR_SIZE + mtd->subpage_size - 1;
+	write_size /= mtd->subpage_size;
+	write_size *= mtd->subpage_size;
+	hdr = malloc(write_size);
+	if (!hdr)
+		return sys_errmsg("cannot allocate %d bytes of memory", write_size);
+	memset(hdr, 0xFF, write_size);
+
+	for (eb = start_eb; eb < mtd->eb_cnt; eb++) {
+		long long ec;
+
+		if (!args.quiet && !args.verbose) {
+			printf("\r" PROGRAM_NAME ": formatting eraseblock %d -- %2lld %% complete  ",
+			       eb, (long long)(eb + 1 - start_eb) * 100 / (mtd->eb_cnt - start_eb));
+			fflush(stdout);
+		}
+
+		if (si->ec[eb] == EB_BAD)
+			continue;
+
+		if (args.override_ec)
+			ec = args.ec;
+		else if (si->ec[eb] <= EC_MAX)
+			ec = si->ec[eb] + 1;
+		else
+			ec = si->mean_ec;
+		ubigen_init_ec_hdr(ui, hdr, ec);
+
+		if (args.verbose) {
+			normsg_cont("eraseblock %d: erase", eb);
+			fflush(stdout);
+		}
+
+		err = mtd_erase(libmtd, mtd, args.node_fd, eb);
+		if (err) {
+			if (!args.quiet)
+				printf("\n");
+
+			sys_errmsg("failed to erase eraseblock %d", eb);
+			if (errno != EIO)
+				goto out_free;
+
+			if (mark_bad(mtd, si, eb))
+				goto out_free;
+			continue;
+		}
+
+		if ((eb1 == -1 || eb2 == -1) && !novtbl) {
+			if (eb1 == -1) {
+				eb1 = eb;
+				ec1 = ec;
+			} else if (eb2 == -1) {
+				eb2 = eb;
+				ec2 = ec;
+			}
+			if (args.verbose)
+				printf(", do not write EC, leave for vtbl\n");
+			continue;
+		}
+
+		if (args.verbose) {
+			printf(", write EC %lld\n", ec);
+			fflush(stdout);
+		}
+
+		err = mtd_write(mtd, args.node_fd, eb, 0, hdr, write_size);
+		if (err) {
+			if (!args.quiet && !args.verbose)
+				printf("\n");
+			sys_errmsg("cannot write EC header (%d bytes buffer) to eraseblock %d",
+				   write_size, eb);
+
+			if (errno != EIO) {
+				if (!args.subpage_size != mtd->min_io_size)
+					normsg("may be sub-page size is "
+					       "incorrect?");
+				goto out_free;
+			}
+
+			err = mtd_torture(libmtd, mtd, args.node_fd, eb);
+			if (err) {
+				if (mark_bad(mtd, si, eb))
+					goto out_free;
+			}
+			continue;
+
+		}
+	}
+
+	if (!args.quiet && !args.verbose)
+		printf("\n");
+
+	if (!novtbl) {
+		if (eb1 == -1 || eb2 == -1) {
+			errmsg("no eraseblocks for volume table");
+			goto out_free;
+		}
+
+		verbose(args.verbose, "write volume table to eraseblocks %d and %d", eb1, eb2);
+		vtbl = ubigen_create_empty_vtbl(ui);
+		if (!vtbl)
+			goto out_free;
+
+		err = ubigen_write_layout_vol(ui, eb1, eb2, ec1,  ec2, vtbl,
+					      args.node_fd);
+		free(vtbl);
+		if (err) {
+			errmsg("cannot write layout volume");
+			goto out_free;
+		}
+	}
+
+	free(hdr);
+	return 0;
+
+out_free:
+	free(hdr);
+	return -1;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err, verbose;
+	libmtd_t libmtd;
+	struct mtd_info mtd_info;
+	struct mtd_dev_info mtd;
+	libubi_t libubi;
+	struct ubigen_info ui;
+	struct ubi_scan_info *si;
+
+	libmtd = libmtd_open();
+	if (!libmtd)
+		return errmsg("MTD subsystem is not present");
+
+	err = parse_opt(argc, argv);
+	if (err)
+		goto out_close_mtd;
+
+	err = mtd_get_info(libmtd, &mtd_info);
+	if (err) {
+		if (errno == ENODEV)
+			errmsg("MTD is not present");
+		sys_errmsg("cannot get MTD information");
+		goto out_close_mtd;
+	}
+
+	err = mtd_get_dev_info(libmtd, args.node, &mtd);
+	if (err) {
+		sys_errmsg("cannot get information about \"%s\"", args.node);
+		goto out_close_mtd;
+	}
+
+	if (!is_power_of_2(mtd.min_io_size)) {
+		errmsg("min. I/O size is %d, but should be power of 2",
+		       mtd.min_io_size);
+		goto out_close;
+	}
+
+	if (!mtd_info.sysfs_supported) {
+		/*
+		 * Linux kernels older than 2.6.30 did not support sysfs
+		 * interface, and it is impossible to find out sub-page
+		 * size in these kernels. This is why users should
+		 * provide -s option.
+		 */
+		if (args.subpage_size == 0) {
+			warnmsg("your MTD system is old and it is impossible "
+				"to detect sub-page size. Use -s to get rid "
+				"of this warning");
+			normsg("assume sub-page to be %d", mtd.subpage_size);
+		} else {
+			mtd.subpage_size = args.subpage_size;
+			args.manual_subpage = 1;
+		}
+	} else if (args.subpage_size && args.subpage_size != mtd.subpage_size) {
+		mtd.subpage_size = args.subpage_size;
+		args.manual_subpage = 1;
+	}
+
+	if (args.manual_subpage) {
+		/* Do some sanity check */
+		if (args.subpage_size > mtd.min_io_size) {
+			errmsg("sub-page cannot be larger than min. I/O unit");
+			goto out_close;
+		}
+
+		if (mtd.min_io_size % args.subpage_size) {
+			errmsg("min. I/O unit size should be multiple of "
+			       "sub-page size");
+			goto out_close;
+		}
+	}
+
+	args.node_fd = open(args.node, O_RDWR);
+	if (args.node_fd == -1) {
+		sys_errmsg("cannot open \"%s\"", args.node);
+		goto out_close_mtd;
+	}
+
+	/* Validate VID header offset if it was specified */
+	if (args.vid_hdr_offs != 0) {
+		if (args.vid_hdr_offs % 8) {
+			errmsg("VID header offset has to be multiple of min. I/O unit size");
+			goto out_close;
+		}
+		if (args.vid_hdr_offs + (int)UBI_VID_HDR_SIZE > mtd.eb_size) {
+			errmsg("bad VID header offset");
+			goto out_close;
+		}
+	}
+
+	if (!mtd.writable) {
+		errmsg("mtd%d (%s) is a read-only device", mtd.mtd_num, args.node);
+		goto out_close;
+	}
+
+	/* Make sure this MTD device is not attached to UBI */
+	libubi = libubi_open();
+	if (libubi) {
+		int ubi_dev_num;
+
+		err = mtd_num2ubi_dev(libubi, mtd.mtd_num, &ubi_dev_num);
+		libubi_close(libubi);
+		if (!err) {
+			errmsg("please, first detach mtd%d (%s) from ubi%d",
+			       mtd.mtd_num, args.node, ubi_dev_num);
+			goto out_close;
+		}
+	}
+
+	if (!args.quiet) {
+		normsg_cont("mtd%d (%s), size ", mtd.mtd_num, mtd.type_str);
+		ubiutils_print_bytes(mtd.size, 1);
+		printf(", %d eraseblocks of ", mtd.eb_cnt);
+		ubiutils_print_bytes(mtd.eb_size, 1);
+		printf(", min. I/O size %d bytes\n", mtd.min_io_size);
+	}
+
+	if (args.quiet)
+		verbose = 0;
+	else if (args.verbose)
+		verbose = 2;
+	else
+		verbose = 1;
+	err = ubi_scan(&mtd, args.node_fd, &si, verbose);
+	if (err) {
+		errmsg("failed to scan mtd%d (%s)", mtd.mtd_num, args.node);
+		goto out_close;
+	}
+
+	if (si->good_cnt == 0) {
+		errmsg("all %d eraseblocks are bad", si->bad_cnt);
+		goto out_free;
+	}
+
+	if (si->good_cnt < 2 && (!args.novtbl || args.image)) {
+		errmsg("too few non-bad eraseblocks (%d) on mtd%d",
+		       si->good_cnt, mtd.mtd_num);
+		goto out_free;
+	}
+
+	if (!args.quiet) {
+		if (si->ok_cnt)
+			normsg("%d eraseblocks have valid erase counter, mean value is %lld",
+			       si->ok_cnt, si->mean_ec);
+		if (si->empty_cnt)
+			normsg("%d eraseblocks are supposedly empty", si->empty_cnt);
+		if (si->corrupted_cnt)
+			normsg("%d corrupted erase counters", si->corrupted_cnt);
+		print_bad_eraseblocks(&mtd, si);
+	}
+
+	if (si->alien_cnt) {
+		if (!args.yes || !args.quiet)
+			warnmsg("%d of %d eraseblocks contain non-ubifs data",
+				si->alien_cnt, si->good_cnt);
+		if (!args.yes && want_exit()) {
+			if (args.yes && !args.quiet)
+				printf("yes\n");
+			goto out_free;
+		}
+	}
+
+	if (!args.override_ec && si->empty_cnt < si->good_cnt) {
+		int percent = ((double)si->ok_cnt)/si->good_cnt * 100;
+
+		/*
+		 * Make sure the majority of eraseblocks have valid
+		 * erase counters.
+		 */
+		if (percent < 50) {
+			if (!args.yes || !args.quiet)
+				warnmsg("only %d of %d eraseblocks have valid erase counter",
+					si->ok_cnt, si->good_cnt);
+				normsg("erase counter 0 will be used for all eraseblocks");
+				normsg("note, arbitrary erase counter value may be specified using -e option");
+			if (!args.yes && want_exit()) {
+				if (args.yes && !args.quiet)
+					printf("yes\n");
+				goto out_free;
+			}
+			 args.ec = 0;
+			 args.override_ec = 1;
+		} else if (percent < 95) {
+			if (!args.yes || !args.quiet)
+				warnmsg("only %d of %d eraseblocks have valid erase counter",
+					si->ok_cnt, si->good_cnt);
+				normsg("mean erase counter %lld will be used for the rest of eraseblock",
+				       si->mean_ec);
+			if (!args.yes && want_exit()) {
+				if (args.yes && !args.quiet)
+					printf("yes\n");
+				goto out_free;
+			}
+			args.ec = si->mean_ec;
+			args.override_ec = 1;
+		}
+	}
+
+	if (!args.quiet && args.override_ec)
+		normsg("use erase counter %lld for all eraseblocks", args.ec);
+
+	ubigen_info_init(&ui, mtd.eb_size, mtd.min_io_size, mtd.subpage_size,
+			 args.vid_hdr_offs, args.ubi_ver, args.image_seq);
+
+	if (si->vid_hdr_offs != -1 && ui.vid_hdr_offs != si->vid_hdr_offs) {
+		/*
+		 * Hmm, what we read from flash and what we calculated using
+		 * min. I/O unit size and sub-page size differs.
+		 */
+		if (!args.yes || !args.quiet) {
+			warnmsg("VID header and data offsets on flash are %d and %d, "
+				"which is different to requested offsets %d and %d",
+				si->vid_hdr_offs, si->data_offs, ui.vid_hdr_offs,
+				ui.data_offs);
+			normsg_cont("use new offsets %d and %d? (yes/no)  ",
+				    ui.vid_hdr_offs, ui.data_offs);
+		}
+		if (args.yes || answer_is_yes()) {
+			if (args.yes && !args.quiet)
+				printf("yes\n");
+		} else
+			ubigen_info_init(&ui, mtd.eb_size, mtd.min_io_size, 0,
+					 si->vid_hdr_offs, args.ubi_ver,
+					 args.image_seq);
+		normsg("use offsets %d and %d",  ui.vid_hdr_offs, ui.data_offs);
+	}
+
+	if (args.image) {
+		err = flash_image(libmtd, &mtd, &ui, si);
+		if (err < 0)
+			goto out_free;
+
+		err = format(libmtd, &mtd, &ui, si, err, 1);
+		if (err)
+			goto out_free;
+	} else {
+		err = format(libmtd, &mtd, &ui, si, 0, args.novtbl);
+		if (err)
+			goto out_free;
+	}
+
+	ubi_scan_free(si);
+	close(args.node_fd);
+	libmtd_close(libmtd);
+	return 0;
+
+out_free:
+	ubi_scan_free(si);
+out_close:
+	close(args.node_fd);
+out_close_mtd:
+	libmtd_close(libmtd);
+	return -1;
+}
diff --git a/ubi-utils/ubimkvol.c b/ubi-utils/ubimkvol.c
new file mode 100644
index 0000000..25065e3
--- /dev/null
+++ b/ubi-utils/ubimkvol.c
@@ -0,0 +1,295 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+/*
+ * An utility to create UBI volumes.
+ *
+ * Authors: Artem Bityutskiy <dedekind@infradead.org>
+ *          Frank Haverkamp <haver@vnet.ibm.com>
+ */
+
+#define PROGRAM_VERSION "1.1"
+#define PROGRAM_NAME    "ubimkvol"
+
+#include <stdio.h>
+#include <stdint.h>
+#include <getopt.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <libubi.h>
+#include "common.h"
+#include "ubiutils-common.h"
+
+/* The variables below are set by command line arguments */
+struct args {
+	int vol_id;
+	int vol_type;
+	long long bytes;
+	int lebs;
+	int alignment;
+	const char *name;
+	const char *node;
+	int maxavs;
+};
+
+static struct args args = {
+	.vol_type = UBI_DYNAMIC_VOLUME,
+	.bytes = -1,
+	.lebs = -1,
+	.alignment = 1,
+	.vol_id = UBI_VOL_NUM_AUTO,
+};
+
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+			 " - a tool to create UBI volumes.";
+
+static const char optionsstr[] =
+"-a, --alignment=<alignment>   volume alignment (default is 1)\n"
+"-n, --vol_id=<volume ID>      UBI volume ID, if not specified, the volume ID\n"
+"                              will be assigned automatically\n"
+"-N, --name=<name>             volume name\n"
+"-s, --size=<bytes>            volume size volume size in bytes, kilobytes (KiB)\n"
+"                              or megabytes (MiB)\n"
+"-S, --lebs=<LEBs count>       alternative way to give volume size in logical\n"
+"                              eraseblocks\n"
+"-m, --maxavsize               set volume size to maximum available size\n"
+"-t, --type=<static|dynamic>   volume type (dynamic, static), default is dynamic\n"
+"-h, -?, --help                print help message\n"
+"-V, --version                 print program version";
+
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " <UBI device node file name> [-h] [-a <alignment>] [-n <volume ID>] [-N <name>]\n"
+"\t\t\t[-s <bytes>] [-S <LEBs>] [-t <static|dynamic>] [-V] [-m]\n"
+"\t\t\t[--alignment=<alignment>][--vol_id=<volume ID>] [--name=<name>]\n"
+"\t\t\t[--size=<bytes>] [--lebs=<LEBs>] [--type=<static|dynamic>] [--help]\n"
+"\t\t\t[--version] [--maxavsize]\n\n"
+"Example: " PROGRAM_NAME " /dev/ubi0 -s 20MiB -N config_data - create a 20 Megabytes volume\n"
+"         named \"config_data\" on UBI device /dev/ubi0.";
+
+static const struct option long_options[] = {
+	{ .name = "alignment", .has_arg = 1, .flag = NULL, .val = 'a' },
+	{ .name = "vol_id",    .has_arg = 1, .flag = NULL, .val = 'n' },
+	{ .name = "name",      .has_arg = 1, .flag = NULL, .val = 'N' },
+	{ .name = "size",      .has_arg = 1, .flag = NULL, .val = 's' },
+	{ .name = "lebs",      .has_arg = 1, .flag = NULL, .val = 'S' },
+	{ .name = "type",      .has_arg = 1, .flag = NULL, .val = 't' },
+	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ .name = "maxavsize", .has_arg = 0, .flag = NULL, .val = 'm' },
+	{ NULL, 0, NULL, 0},
+};
+
+static int param_sanity_check(void)
+{
+	int len;
+
+	if (args.bytes == -1 && !args.maxavs && args.lebs == -1)
+		return errmsg("volume size was not specified (use -h for help)");
+
+	if ((args.bytes != -1 && (args.maxavs || args.lebs != -1))  ||
+	    (args.lebs != -1  && (args.maxavs || args.bytes != -1)) ||
+	    (args.maxavs && (args.bytes != -1 || args.lebs != -1)))
+		return errmsg("size specified with more then one option");
+
+	if (args.name == NULL)
+		return errmsg("volume name was not specified (use -h for help)");
+
+	len = strlen(args.name);
+	if (len > UBI_MAX_VOLUME_NAME)
+		return errmsg("too long name (%d symbols), max is %d", len, UBI_MAX_VOLUME_NAME);
+
+	return 0;
+}
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int key, error = 0;
+
+		key = getopt_long(argc, argv, "a:n:N:s:S:t:h?Vm", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 't':
+			if (!strcmp(optarg, "dynamic"))
+				args.vol_type = UBI_DYNAMIC_VOLUME;
+			else if (!strcmp(optarg, "static"))
+				args.vol_type = UBI_STATIC_VOLUME;
+			else
+				return errmsg("bad volume type: \"%s\"", optarg);
+			break;
+
+		case 's':
+			args.bytes = ubiutils_get_bytes(optarg);
+			if (args.bytes <= 0)
+				return errmsg("bad volume size: \"%s\"", optarg);
+			break;
+
+		case 'S':
+			args.lebs = simple_strtoull(optarg, &error);
+			if (error || args.lebs <= 0)
+				return errmsg("bad LEB count: \"%s\"", optarg);
+			break;
+
+		case 'a':
+			args.alignment = simple_strtoul(optarg, &error);
+			if (error || args.alignment <= 0)
+				return errmsg("bad volume alignment: \"%s\"", optarg);
+			break;
+
+		case 'n':
+			args.vol_id = simple_strtoul(optarg, &error);
+			if (error || args.vol_id < 0)
+				return errmsg("bad volume ID: " "\"%s\"", optarg);
+			break;
+
+		case 'N':
+			args.name = optarg;
+			break;
+
+		case 'h':
+		case '?':
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'V':
+			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
+		case 'm':
+			args.maxavs = 1;
+			break;
+
+		case ':':
+			return errmsg("parameter is missing");
+
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+
+	if (optind == argc)
+		return errmsg("UBI device name was not specified (use -h for help)");
+	else if (optind != argc - 1)
+		return errmsg("more then one UBI device specified (use -h for help)");
+
+	args.node = argv[optind];
+
+	if (param_sanity_check())
+		return -1;
+
+	return 0;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err;
+	libubi_t libubi;
+	struct ubi_dev_info dev_info;
+	struct ubi_vol_info vol_info;
+	struct ubi_mkvol_request req;
+
+	err = parse_opt(argc, argv);
+	if (err)
+		return err;
+
+	libubi = libubi_open();
+	if (!libubi) {
+		if (errno == 0)
+			return errmsg("UBI is not present in the system");
+		return sys_errmsg("cannot open libubi");
+	}
+
+	err = ubi_probe_node(libubi, args.node);
+	if (err == 2) {
+		errmsg("\"%s\" is an UBI volume node, not an UBI device node",
+		       args.node);
+		goto out_libubi;
+	} else if (err < 0) {
+		if (errno == ENODEV)
+			errmsg("\"%s\" is not an UBI device node", args.node);
+		else
+			sys_errmsg("error while probing \"%s\"", args.node);
+		goto out_libubi;
+	}
+
+	err = ubi_get_dev_info(libubi, args.node, &dev_info);
+	if (err) {
+		sys_errmsg("cannot get information about UBI device \"%s\"",
+			   args.node);
+		goto out_libubi;
+	}
+
+	if (dev_info.avail_bytes == 0) {
+		errmsg("UBI device does not have free logical eraseblocks");
+		goto out_libubi;
+	}
+
+	if (args.maxavs) {
+		args.bytes = dev_info.avail_bytes;
+		printf("Set volume size to %lld\n", args.bytes);
+	}
+
+	if (args.lebs != -1) {
+		args.bytes = dev_info.leb_size;
+		args.bytes -= dev_info.leb_size % args.alignment;
+		args.bytes *= args.lebs;
+	}
+
+	req.vol_id = args.vol_id;
+	req.alignment = args.alignment;
+	req.bytes = args.bytes;
+	req.vol_type = args.vol_type;
+	req.name = args.name;
+
+	err = ubi_mkvol(libubi, args.node, &req);
+	if (err < 0) {
+		sys_errmsg("cannot UBI create volume");
+		goto out_libubi;
+	}
+
+	args.vol_id = req.vol_id;
+
+	/* Print information about the created device */
+	err = ubi_get_vol_info1(libubi, dev_info.dev_num, args.vol_id, &vol_info);
+	if (err) {
+		sys_errmsg("cannot get information about newly created UBI volume");
+		goto out_libubi;
+	}
+
+	printf("Volume ID %d, size %d LEBs (", vol_info.vol_id, vol_info.rsvd_lebs);
+	ubiutils_print_bytes(vol_info.rsvd_bytes, 0);
+	printf("), LEB size ");
+	ubiutils_print_bytes(vol_info.leb_size, 1);
+	printf(", %s, name \"%s\", alignment %d\n",
+	       req.vol_type == UBI_DYNAMIC_VOLUME ? "dynamic" : "static",
+	       vol_info.name, vol_info.alignment);
+
+	libubi_close(libubi);
+	return 0;
+
+out_libubi:
+	libubi_close(libubi);
+	return -1;
+}
diff --git a/ubi-utils/ubinfo.c b/ubi-utils/ubinfo.c
new file mode 100644
index 0000000..8e14e6e
--- /dev/null
+++ b/ubi-utils/ubinfo.c
@@ -0,0 +1,434 @@
+/*
+ * Copyright (C) 2007, 2008 Nokia Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+/*
+ * An utility to get UBI information.
+ *
+ * Author: Artem Bityutskiy
+ */
+
+#define PROGRAM_VERSION "1.1"
+#define PROGRAM_NAME    "ubinfo"
+
+#include <stdint.h>
+#include <stdio.h>
+#include <getopt.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <libubi.h>
+#include "common.h"
+#include "ubiutils-common.h"
+
+/* The variables below are set by command line arguments */
+struct args {
+	int devn;
+	int vol_id;
+	int all;
+	const char *node;
+	const char *vol_name;
+};
+
+static struct args args = {
+	.vol_id = -1,
+	.devn = -1,
+	.all = 0,
+	.node = NULL,
+	.vol_name = NULL,
+};
+
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+			 " - a tool to print UBI information.";
+
+static const char optionsstr[] =
+"-d, --devn=<UBI device number>  UBI device number to get information about\n"
+"-n, --vol_id=<volume ID>        ID of UBI volume to print information about\n"
+"-N, --name=<volume name>        name of UBI volume to print information about\n"
+"-a, --all                       print information about all devices and volumes,\n"
+"                                or about all volumes if the UBI device was\n"
+"                                specified\n"
+"-h, --help                      print help message\n"
+"-V, --version                   print program version";
+
+static const char usage[] =
+"Usage 1: " PROGRAM_NAME " [-d <UBI device number>] [-n <volume ID> | -N <volume name>] [-a] [-h] [-V]\n"
+"\t\t[--vol_id=<volume ID> | --name <volume name>] [--devn <UBI device number>] [--all] [--help] [--version]\n"
+"Usage 2: " PROGRAM_NAME " <UBI device node file name> [-a] [-h] [-V] [--all] [--help] [--version]\n"
+"Usage 3: " PROGRAM_NAME " <UBI volume node file name> [-h] [-V] [--help] [--version]\n\n"
+"Example 1: " PROGRAM_NAME " - (no arguments) print general UBI information\n"
+"Example 2: " PROGRAM_NAME " -d 1 - print information about UBI device number 1\n"
+"Example 3: " PROGRAM_NAME " /dev/ubi0 -a - print information about all volumes of UBI\n"
+"           device /dev/ubi0\n"
+"Example 4: " PROGRAM_NAME " /dev/ubi1_0 - print information about UBI volume /dev/ubi1_0\n"
+"Example 5: " PROGRAM_NAME " -a - print all information\n";
+
+static const struct option long_options[] = {
+	{ .name = "devn",      .has_arg = 1, .flag = NULL, .val = 'd' },
+	{ .name = "vol_id",    .has_arg = 1, .flag = NULL, .val = 'n' },
+	{ .name = "name",      .has_arg = 1, .flag = NULL, .val = 'N' },
+	{ .name = "all",       .has_arg = 0, .flag = NULL, .val = 'a' },
+	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ NULL, 0, NULL, 0},
+};
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int key, error = 0;
+
+		key = getopt_long(argc, argv, "an:N:d:hV", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 'a':
+			args.all = 1;
+			break;
+
+		case 'n':
+			args.vol_id = simple_strtoul(optarg, &error);
+			if (error || args.vol_id < 0)
+				return errmsg("bad volume ID: " "\"%s\"", optarg);
+			break;
+
+		case 'N':
+			args.vol_name = optarg;
+			break;
+
+		case 'd':
+			args.devn = simple_strtoul(optarg, &error);
+			if (error || args.devn < 0)
+				return errmsg("bad UBI device number: \"%s\"", optarg);
+
+			break;
+
+		case 'h':
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'V':
+			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
+		case ':':
+			return errmsg("parameter is missing");
+
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+
+	if (optind == argc - 1)
+		args.node = argv[optind];
+	else if (optind < argc)
+		return errmsg("more then one UBI device specified (use -h for help)");
+
+	return 0;
+}
+
+static int translate_dev(libubi_t libubi, const char *node)
+{
+	int err;
+
+	err = ubi_probe_node(libubi, node);
+	if (err == -1) {
+		if (errno != ENODEV)
+			return sys_errmsg("error while probing \"%s\"", node);
+		return errmsg("\"%s\" does not correspond to any UBI device or volume", node);
+	}
+
+	if (err == 1) {
+		struct ubi_dev_info dev_info;
+
+		err = ubi_get_dev_info(libubi, node, &dev_info);
+		if (err)
+			return sys_errmsg("cannot get information about UBI device \"%s\"", node);
+
+		args.devn = dev_info.dev_num;
+	} else {
+		struct ubi_vol_info vol_info;
+
+		err = ubi_get_vol_info(libubi, node, &vol_info);
+		if (err)
+			return sys_errmsg("cannot get information about UBI volume \"%s\"", node);
+
+		if (args.vol_id != -1)
+			return errmsg("both volume character device node (\"%s\") and "
+				      "volume ID (%d) are specify, use only one of them"
+				      "(use -h for help)", node, args.vol_id);
+
+		args.devn = vol_info.dev_num;
+		args.vol_id = vol_info.vol_id;
+	}
+
+	return 0;
+}
+
+static int get_vol_id_by_name(libubi_t libubi, int dev_num, const char *name)
+{
+	int err;
+	struct ubi_vol_info vol_info;
+
+	err = ubi_get_vol_info1_nm(libubi, dev_num, name, &vol_info);
+	if (err)
+		return sys_errmsg("cannot get information about volume \"%s\" on ubi%d\n", name, dev_num);
+
+	args.vol_id = vol_info.vol_id;
+
+	return 0;
+}
+
+static int print_vol_info(libubi_t libubi, int dev_num, int vol_id)
+{
+	int err;
+	struct ubi_vol_info vol_info;
+
+	err = ubi_get_vol_info1(libubi, dev_num, vol_id, &vol_info);
+	if (err)
+		return sys_errmsg("cannot get information about UBI volume %d on ubi%d",
+				  vol_id, dev_num);
+
+	printf("Volume ID:   %d (on ubi%d)\n", vol_info.vol_id, vol_info.dev_num);
+	printf("Type:        %s\n",
+	       vol_info.type == UBI_DYNAMIC_VOLUME ?  "dynamic" : "static");
+	printf("Alignment:   %d\n", vol_info.alignment);
+
+	printf("Size:        %d LEBs (", vol_info.rsvd_lebs);
+	ubiutils_print_bytes(vol_info.rsvd_bytes, 0);
+	printf(")\n");
+
+	if (vol_info.type == UBI_STATIC_VOLUME) {
+		printf("Data bytes:  ");
+		ubiutils_print_bytes(vol_info.data_bytes, 1);
+		printf("\n");
+	}
+	printf("State:       %s\n", vol_info.corrupted ? "corrupted" : "OK");
+	printf("Name:        %s\n", vol_info.name);
+	printf("Character device major/minor: %d:%d\n",
+	       vol_info.major, vol_info.minor);
+
+	return 0;
+}
+
+static int print_dev_info(libubi_t libubi, int dev_num, int all)
+{
+	int i, err, first = 1;
+	struct ubi_dev_info dev_info;
+	struct ubi_vol_info vol_info;
+
+	err = ubi_get_dev_info1(libubi, dev_num, &dev_info);
+	if (err)
+		return sys_errmsg("cannot get information about UBI device %d", dev_num);
+
+	printf("ubi%d\n", dev_info.dev_num);
+	printf("Volumes count:                           %d\n", dev_info.vol_count);
+	printf("Logical eraseblock size:                 ");
+	ubiutils_print_bytes(dev_info.leb_size, 0);
+	printf("\n");
+
+	printf("Total amount of logical eraseblocks:     %d (", dev_info.total_lebs);
+	ubiutils_print_bytes(dev_info.total_bytes, 0);
+	printf(")\n");
+
+	printf("Amount of available logical eraseblocks: %d (", dev_info.avail_lebs);
+	ubiutils_print_bytes(dev_info.avail_bytes, 0);
+	printf(")\n");
+
+	printf("Maximum count of volumes                 %d\n", dev_info.max_vol_count);
+	printf("Count of bad physical eraseblocks:       %d\n", dev_info.bad_count);
+	printf("Count of reserved physical eraseblocks:  %d\n", dev_info.bad_rsvd);
+	printf("Current maximum erase counter value:     %lld\n", dev_info.max_ec);
+	printf("Minimum input/output unit size:          %d %s\n",
+	       dev_info.min_io_size, dev_info.min_io_size > 1 ? "bytes" : "byte");
+	printf("Character device major/minor:            %d:%d\n",
+	       dev_info.major, dev_info.minor);
+
+	if (dev_info.vol_count == 0)
+		return 0;
+
+	printf("Present volumes:                         ");
+	for (i = dev_info.lowest_vol_id;
+	     i <= dev_info.highest_vol_id; i++) {
+		err = ubi_get_vol_info1(libubi, dev_info.dev_num, i, &vol_info);
+		if (err == -1) {
+			if (errno == ENOENT)
+				continue;
+
+			return sys_errmsg("libubi failed to probe volume %d on ubi%d",
+					  i, dev_info.dev_num);
+		}
+
+		if (!first)
+			printf(", %d", i);
+		else {
+			printf("%d", i);
+			first = 0;
+		}
+	}
+	printf("\n");
+
+	if (!all)
+		return 0;
+
+	first = 1;
+	printf("\n");
+
+	for (i = dev_info.lowest_vol_id;
+	     i <= dev_info.highest_vol_id; i++) {
+		if(!first)
+			printf("-----------------------------------\n");
+		err = ubi_get_vol_info1(libubi, dev_info.dev_num, i, &vol_info);
+		if (err == -1) {
+			if (errno == ENOENT)
+				continue;
+
+			return sys_errmsg("libubi failed to probe volume %d on ubi%d",
+					  i, dev_info.dev_num);
+		}
+		first = 0;
+
+		err = print_vol_info(libubi, dev_info.dev_num, i);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int print_general_info(libubi_t libubi, int all)
+{
+	int i, err, first = 1;
+	struct ubi_info ubi_info;
+	struct ubi_dev_info dev_info;
+
+	err = ubi_get_info(libubi, &ubi_info);
+	if (err)
+		return sys_errmsg("cannot get UBI information");
+
+	printf("UBI version:                    %d\n", ubi_info.version);
+	printf("Count of UBI devices:           %d\n", ubi_info.dev_count);
+	if (ubi_info.ctrl_major != -1)
+		printf("UBI control device major/minor: %d:%d\n",
+		       ubi_info.ctrl_major, ubi_info.ctrl_minor);
+	else
+		printf("UBI control device is not supported by this kernel\n");
+
+	if (ubi_info.dev_count == 0)
+		return 0;
+
+	printf("Present UBI devices:            ");
+	for (i = ubi_info.lowest_dev_num;
+	     i <= ubi_info.highest_dev_num; i++) {
+		err = ubi_get_dev_info1(libubi, i, &dev_info);
+		if (err == -1) {
+			if (errno == ENOENT)
+				continue;
+
+			printf("\n");
+			return sys_errmsg("libubi failed to probe UBI device %d", i);
+		}
+
+		if (!first)
+			printf(", ubi%d", i);
+		else {
+			printf("ubi%d", i);
+			first = 0;
+		}
+	}
+	printf("\n");
+
+	if (!all)
+		return 0;
+
+	first = 1;
+	printf("\n");
+
+	for (i = ubi_info.lowest_dev_num;
+	     i <= ubi_info.highest_dev_num; i++) {
+		if(!first)
+			printf("\n===================================\n\n");
+		first = 0;
+		err = print_dev_info(libubi, i, all);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err;
+	libubi_t libubi;
+
+	err = parse_opt(argc, argv);
+	if (err)
+		return -1;
+
+	libubi = libubi_open();
+	if (!libubi) {
+		if (errno == 0)
+			return errmsg("UBI is not present in the system");
+		return sys_errmsg("cannot open libubi");
+	}
+
+	if (args.node) {
+		/*
+		 * A character device was specified, translate this into UBI
+		 * device number and volume ID.
+		 */
+		err = translate_dev(libubi, args.node);
+		if (err)
+			goto out_libubi;
+	}
+
+	if (args.vol_name) {
+		err = get_vol_id_by_name(libubi, args.devn, args.vol_name);
+		if (err)
+			goto out_libubi;
+	}
+
+	if (args.vol_id != -1 && args.devn == -1) {
+		errmsg("volume ID is specified, but UBI device number is not "
+		       "(use -h for help)\n");
+		goto out_libubi;
+	}
+
+	if (args.devn != -1 && args.vol_id != -1) {
+		print_vol_info(libubi, args.devn, args.vol_id);
+		goto out;
+	}
+
+	if (args.devn == -1 && args.vol_id == -1)
+		err = print_general_info(libubi, args.all);
+	else if (args.devn != -1 && args.vol_id == -1)
+		err = print_dev_info(libubi, args.devn, args.all);
+
+	if (err)
+		goto out_libubi;
+
+out:
+	libubi_close(libubi);
+	return 0;
+
+out_libubi:
+	libubi_close(libubi);
+	return -1;
+}
diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
new file mode 100644
index 0000000..3085b66
--- /dev/null
+++ b/ubi-utils/ubinize.c
@@ -0,0 +1,628 @@
+/*
+ * Copyright (C) 2008 Nokia Corporation
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+/*
+ * Generate UBI images.
+ *
+ * Authors: Artem Bityutskiy
+ *          Oliver Lohmann
+ */
+
+#define PROGRAM_VERSION "1.2"
+#define PROGRAM_NAME    "ubinize"
+
+#include <sys/stat.h>
+#include <stdlib.h>
+#include <getopt.h>
+#include <string.h>
+#include <fcntl.h>
+
+#include <mtd/ubi-media.h>
+#include <libubigen.h>
+#include <libiniparser.h>
+#include "common.h"
+#include "ubiutils-common.h"
+
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+" - a tool to generate UBI images. An UBI image may contain one or more UBI "
+"volumes which have to be defined in the input configuration ini-file. The "
+"ini file defines all the UBI volumes - their characteristics and the and the "
+"contents, but it does not define the characteristics of the flash the UBI "
+"image is generated for. Instead, the flash characteristics are defined via "
+"the command-line options. Note, if not sure about some of the command-line "
+"parameters, do not specify them and let the utility to use default values.";
+
+static const char optionsstr[] =
+"-o, --output=<file name>     output file name\n"
+"-p, --peb-size=<bytes>       size of the physical eraseblock of the flash\n"
+"                             this UBI image is created for in bytes,\n"
+"                             kilobytes (KiB), or megabytes (MiB)\n"
+"                             (mandatory parameter)\n"
+"-m, --min-io-size=<bytes>    minimum input/output unit size of the flash\n"
+"                             in bytes\n"
+"-s, --sub-page-size=<bytes>  minimum input/output unit used for UBI\n"
+"                             headers, e.g. sub-page size in case of NAND\n"
+"                             flash (equivalent to the minimum input/output\n"
+"                             unit size by default)\n"
+"-O, --vid-hdr-offset=<num>   offset if the VID header from start of the\n"
+"                             physical eraseblock (default is the next\n"
+"                             minimum I/O unit or sub-page after the EC\n"
+"                             header)\n"
+"-e, --erase-counter=<num>    the erase counter value to put to EC headers\n"
+"                             (default is 0)\n"
+"-x, --ubi-ver=<num>          UBI version number to put to EC headers\n"
+"                             (default is 1)\n"
+"-Q, --image-seq=<num>        32-bit UBI image sequence number to use\n"
+"                             (by default a random number is picked)\n"
+"-v, --verbose                be verbose\n"
+"-h, --help                   print help message\n"
+"-V, --version                print program version";
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " [-o filename] [-p <bytes>] [-m <bytes>] [-s <bytes>] [-O <num>] [-e <num>]\n"
+"\t\t[-x <num>] [-Q <num>] [-v] [-h] [-V] [--output=<filename>] [--peb-size=<bytes>]\n"
+"\t\t[--min-io-size=<bytes>] [--sub-page-size=<bytes>] [--vid-hdr-offset=<num>]\n"
+"\t\t[--erase-counter=<num>] [--ubi-ver=<num>] [--image-seq=<num>] [--verbose] [--help]\n"
+"\t\t[--version] ini-file\n"
+"Example: " PROGRAM_NAME " -o ubi.img -p 16KiB -m 512 -s 256 cfg.ini - create UBI image\n"
+"         'ubi.img' as described by configuration file 'cfg.ini'";
+
+static const char ini_doc[] = "INI-file format.\n"
+"The input configuration ini-file describes all the volumes which have to\n"
+"be included to the output UBI image. Each volume is described in its own\n"
+"section which may be named arbitrarily. The section consists on\n"
+"\"key=value\" pairs, for example:\n\n"
+"[jffs2-volume]\n"
+"mode=ubi\n"
+"image=../jffs2.img\n"
+"vol_id=1\n"
+"vol_size=30MiB\n"
+"vol_type=dynamic\n"
+"vol_name=jffs2_volume\n"
+"vol_flags=autoresize\n"
+"vol_alignment=1\n\n"
+"This example configuration file tells the utility to create an UBI image\n"
+"with one volume with ID 1, volume size 30MiB, the volume is dynamic, has\n"
+"name \"jffs2_volume\", \"autoresize\" volume flag, and alignment 1. The\n"
+"\"image=../jffs2.img\" line tells the utility to take the contents of the\n"
+"volume from the \"../jffs2.img\" file. The size of the image file has to be\n"
+"less or equivalent to the volume size (30MiB). The \"mode=ubi\" line is\n"
+"mandatory and just tells that the section describes an UBI volume - other\n"
+"section modes may be added in the future.\n"
+"Notes:\n"
+"  * size in vol_size might be specified kilobytes (KiB), megabytes (MiB),\n"
+"    gigabytes (GiB) or bytes (no modifier);\n"
+"  * if \"vol_size\" key is absent, the volume size is assumed to be\n"
+"    equivalent to the size of the image file (defined by \"image\" key);\n"
+"  * if the \"image\" is absent, the volume is assumed to be empty;\n"
+"  * volume alignment must not be greater than the logical eraseblock size;\n"
+"  * one ini file may contain arbitrary number of sections, the utility will\n"
+"    put all the volumes which are described by these section to the output\n"
+"    UBI image file.";
+
+static const struct option long_options[] = {
+	{ .name = "output",         .has_arg = 1, .flag = NULL, .val = 'o' },
+	{ .name = "peb-size",       .has_arg = 1, .flag = NULL, .val = 'p' },
+	{ .name = "min-io-size",    .has_arg = 1, .flag = NULL, .val = 'm' },
+	{ .name = "sub-page-size",  .has_arg = 1, .flag = NULL, .val = 's' },
+	{ .name = "vid-hdr-offset", .has_arg = 1, .flag = NULL, .val = 'O' },
+	{ .name = "erase-counter",  .has_arg = 1, .flag = NULL, .val = 'e' },
+	{ .name = "ubi-ver",        .has_arg = 1, .flag = NULL, .val = 'x' },
+	{ .name = "image-seq",      .has_arg = 1, .flag = NULL, .val = 'Q' },
+	{ .name = "verbose",        .has_arg = 0, .flag = NULL, .val = 'v' },
+	{ .name = "help",           .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",        .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ NULL, 0, NULL, 0}
+};
+
+struct args {
+	const char *f_in;
+	const char *f_out;
+	int out_fd;
+	int peb_size;
+	int min_io_size;
+	int subpage_size;
+	int vid_hdr_offs;
+	int ec;
+	int ubi_ver;
+	uint32_t image_seq;
+	int verbose;
+	dictionary *dict;
+};
+
+static struct args args = {
+	.peb_size     = -1,
+	.min_io_size  = -1,
+	.subpage_size = -1,
+	.ubi_ver      = 1,
+};
+
+static int parse_opt(int argc, char * const argv[])
+{
+	ubiutils_srand();
+	args.image_seq = rand();
+
+	while (1) {
+		int key, error = 0;
+		unsigned long int image_seq;
+
+		key = getopt_long(argc, argv, "o:p:m:s:O:e:x:Q:vhV", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 'o':
+			args.out_fd = open(optarg, O_CREAT | O_TRUNC | O_WRONLY,
+					   S_IWUSR | S_IRUSR | S_IRGRP | S_IWGRP | S_IROTH);
+			if (args.out_fd == -1)
+				return sys_errmsg("cannot open file \"%s\"", optarg);
+			args.f_out = optarg;
+			break;
+
+		case 'p':
+			args.peb_size = ubiutils_get_bytes(optarg);
+			if (args.peb_size <= 0)
+				return errmsg("bad physical eraseblock size: \"%s\"", optarg);
+			break;
+
+		case 'm':
+			args.min_io_size = ubiutils_get_bytes(optarg);
+			if (args.min_io_size <= 0)
+				return errmsg("bad min. I/O unit size: \"%s\"", optarg);
+			if (!is_power_of_2(args.min_io_size))
+				return errmsg("min. I/O unit size should be power of 2");
+			break;
+
+		case 's':
+			args.subpage_size = ubiutils_get_bytes(optarg);
+			if (args.subpage_size <= 0)
+				return errmsg("bad sub-page size: \"%s\"", optarg);
+			if (!is_power_of_2(args.subpage_size))
+				return errmsg("sub-page size should be power of 2");
+			break;
+
+		case 'O':
+			args.vid_hdr_offs = simple_strtoul(optarg, &error);
+			if (error || args.vid_hdr_offs < 0)
+				return errmsg("bad VID header offset: \"%s\"", optarg);
+			break;
+
+		case 'e':
+			args.ec = simple_strtoul(optarg, &error);
+			if (error || args.ec < 0)
+				return errmsg("bad erase counter value: \"%s\"", optarg);
+			break;
+
+		case 'x':
+			args.ubi_ver = simple_strtoul(optarg, &error);
+			if (error || args.ubi_ver < 0)
+				return errmsg("bad UBI version: \"%s\"", optarg);
+			break;
+
+		case 'Q':
+			image_seq = simple_strtoul(optarg, &error);
+			if (error || image_seq > 0xFFFFFFFF)
+				return errmsg("bad UBI image sequence number: \"%s\"", optarg);
+			args.image_seq = image_seq;
+			break;
+
+		case 'v':
+			args.verbose = 1;
+			break;
+
+		case 'h':
+			ubiutils_print_text(stdout, doc, 80);
+			printf("\n%s\n\n", ini_doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'V':
+			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+
+	if (optind == argc)
+		return errmsg("input configuration file was not specified (use -h for help)");
+
+	if (optind != argc - 1)
+		return errmsg("more then one configuration file was specified (use -h for help)");
+
+	args.f_in = argv[optind];
+
+	if (args.peb_size < 0)
+		return errmsg("physical eraseblock size was not specified (use -h for help)");
+
+	if (args.peb_size > 1024*1024)
+		return errmsg("too high physical eraseblock size %d", args.peb_size);
+
+	if (args.min_io_size < 0)
+		return errmsg("min. I/O unit size was not specified (use -h for help)");
+
+	if (args.subpage_size < 0)
+		args.subpage_size = args.min_io_size;
+
+	if (args.subpage_size > args.min_io_size)
+		return errmsg("sub-page cannot be larger then min. I/O unit");
+
+	if (args.peb_size % args.min_io_size)
+		return errmsg("physical eraseblock should be multiple of min. I/O units");
+
+	if (args.min_io_size % args.subpage_size)
+		return errmsg("min. I/O unit size should be multiple of sub-page size");
+
+	if (!args.f_out)
+		return errmsg("output file was not specified (use -h for help)");
+
+	if (args.vid_hdr_offs) {
+		if (args.vid_hdr_offs + (int)UBI_VID_HDR_SIZE >= args.peb_size)
+			return errmsg("bad VID header position");
+		if (args.vid_hdr_offs % 8)
+			return errmsg("VID header offset has to be multiple of min. I/O unit size");
+	}
+
+	return 0;
+}
+
+static int read_section(const struct ubigen_info *ui, const char *sname,
+			struct ubigen_vol_info *vi, const char **img,
+			struct stat *st)
+{
+	char buf[256];
+	const char *p;
+
+	*img = NULL;
+
+	if (strlen(sname) > 128)
+		return errmsg("too long section name \"%s\"", sname);
+
+	/* Make sure mode is UBI, otherwise ignore this section */
+	sprintf(buf, "%s:mode", sname);
+	p = iniparser_getstring(args.dict, buf, NULL);
+	if (!p) {
+		errmsg("\"mode\" key not found in section \"%s\"", sname);
+		errmsg("the \"mode\" key is mandatory and has to be "
+		       "\"mode=ubi\" if the section describes an UBI volume");
+		return -1;
+	}
+
+	/* If mode is not UBI, skip this section */
+	if (strcmp(p, "ubi")) {
+		verbose(args.verbose, "skip non-ubi section \"%s\"", sname);
+		return 1;
+	}
+
+	verbose(args.verbose, "mode=ubi, keep parsing");
+
+	/* Fetch volume type */
+	sprintf(buf, "%s:vol_type", sname);
+	p = iniparser_getstring(args.dict, buf, NULL);
+	if (!p) {
+		normsg("volume type was not specified in "
+		       "section \"%s\", assume \"dynamic\"\n", sname);
+		vi->type = UBI_VID_DYNAMIC;
+	} else {
+		if (!strcmp(p, "static"))
+			vi->type = UBI_VID_STATIC;
+		else if (!strcmp(p, "dynamic"))
+			vi->type = UBI_VID_DYNAMIC;
+		else
+			return errmsg("invalid volume type \"%s\" in section  \"%s\"",
+				      p, sname);
+	}
+
+	verbose(args.verbose, "volume type: %s",
+		vi->type == UBI_VID_DYNAMIC ? "dynamic" : "static");
+
+	/* Fetch the name of the volume image file */
+	sprintf(buf, "%s:image", sname);
+	p = iniparser_getstring(args.dict, buf, NULL);
+	if (p) {
+		*img = p;
+		if (stat(p, st))
+			return sys_errmsg("cannot stat \"%s\" referred from section \"%s\"",
+					  p, sname);
+		if (st->st_size == 0)
+			return errmsg("empty file \"%s\" referred from section \"%s\"",
+				       p, sname);
+	} else if (vi->type == UBI_VID_STATIC)
+		return errmsg("image is not specified for static volume in section \"%s\"",
+			      sname);
+
+	/* Fetch volume id */
+	sprintf(buf, "%s:vol_id", sname);
+	vi->id = iniparser_getint(args.dict, buf, -1);
+	if (vi->id == -1)
+		return errmsg("\"vol_id\" key not found in section  \"%s\"", sname);
+	if (vi->id < 0)
+		return errmsg("negative volume ID %d in section \"%s\"",
+			      vi->id, sname);
+	if (vi->id >= ui->max_volumes)
+		return errmsg("too high volume ID %d in section \"%s\", max. is %d",
+			      vi->id, sname, ui->max_volumes);
+
+	verbose(args.verbose, "volume ID: %d", vi->id);
+
+	/* Fetch volume size */
+	sprintf(buf, "%s:vol_size", sname);
+	p = iniparser_getstring(args.dict, buf, NULL);
+	if (p) {
+		vi->bytes = ubiutils_get_bytes(p);
+		if (vi->bytes <= 0)
+			return errmsg("bad \"vol_size\" key value \"%s\" (section \"%s\")",
+				      p, sname);
+
+		/* Make sure the image size is not larger than volume size */
+		if (*img && st->st_size > vi->bytes)
+			return errmsg("error in section \"%s\": size of the image file "
+				      "\"%s\" is %lld, which is larger than volume size %lld",
+				      sname, *img, (long long)st->st_size, vi->bytes);
+		verbose(args.verbose, "volume size: %lld bytes", vi->bytes);
+	} else {
+		struct stat st;
+
+		if (!*img)
+			return errmsg("neither image file (\"image=\") nor volume size "
+				      "(\"vol_size=\") specified in section \"%s\"", sname);
+
+		if (stat(*img, &st))
+			return sys_errmsg("cannot stat \"%s\"", *img);
+
+		vi->bytes = st.st_size;
+
+		if (vi->bytes == 0)
+			return errmsg("file \"%s\" referred from section \"%s\" is empty",
+				      *img, sname);
+
+		normsg_cont("volume size was not specified in section \"%s\", assume"
+			    " minimum to fit image \"%s\"", sname, *img);
+		ubiutils_print_bytes(vi->bytes, 1);
+		printf("\n");
+	}
+
+	/* Fetch volume name */
+	sprintf(buf, "%s:vol_name", sname);
+	p = iniparser_getstring(args.dict, buf, NULL);
+	if (!p)
+		return errmsg("\"vol_name\" key not found in section \"%s\"", sname);
+
+	vi->name = p;
+	vi->name_len = strlen(p);
+	if (vi->name_len > UBI_VOL_NAME_MAX)
+		return errmsg("too long volume name in section \"%s\", max. is %d characters",
+			      vi->name, UBI_VOL_NAME_MAX);
+
+	verbose(args.verbose, "volume name: %s", p);
+
+	/* Fetch volume alignment */
+	sprintf(buf, "%s:vol_alignment", sname);
+	vi->alignment = iniparser_getint(args.dict, buf, -1);
+	if (vi->alignment == -1)
+		vi->alignment = 1;
+	else if (vi->id < 0)
+		return errmsg("negative volume alignement %d in section \"%s\"",
+			      vi->alignment, sname);
+
+	verbose(args.verbose, "volume alignment: %d", vi->alignment);
+
+	/* Fetch volume flags */
+	sprintf(buf, "%s:vol_flags", sname);
+	p = iniparser_getstring(args.dict, buf, NULL);
+	if (p) {
+		if (!strcmp(p, "autoresize")) {
+			verbose(args.verbose, "autoresize flags found");
+			vi->flags |= UBI_VTBL_AUTORESIZE_FLG;
+		} else {
+			return errmsg("unknown flags \"%s\" in section \"%s\"",
+				      p, sname);
+		}
+	}
+
+	/* Initialize the rest of the volume information */
+	vi->data_pad = ui->leb_size % vi->alignment;
+	vi->usable_leb_size = ui->leb_size - vi->data_pad;
+	if (vi->type == UBI_VID_DYNAMIC)
+		vi->used_ebs = (vi->bytes + vi->usable_leb_size - 1) / vi->usable_leb_size;
+	else
+		vi->used_ebs = (st->st_size + vi->usable_leb_size - 1) / vi->usable_leb_size;
+	vi->compat = 0;
+	return 0;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err = -1, sects, i, autoresize_was_already = 0;
+	struct ubigen_info ui;
+	struct ubi_vtbl_record *vtbl;
+	struct ubigen_vol_info *vi;
+	off_t seek;
+
+	err = parse_opt(argc, argv);
+	if (err)
+		return -1;
+
+	ubigen_info_init(&ui, args.peb_size, args.min_io_size,
+			 args.subpage_size, args.vid_hdr_offs,
+			 args.ubi_ver, args.image_seq);
+
+	verbose(args.verbose, "LEB size:                  %d", ui.leb_size);
+	verbose(args.verbose, "PEB size:                  %d", ui.peb_size);
+	verbose(args.verbose, "min. I/O size:             %d", ui.min_io_size);
+	verbose(args.verbose, "sub-page size:             %d", args.subpage_size);
+	verbose(args.verbose, "VID offset:                %d", ui.vid_hdr_offs);
+	verbose(args.verbose, "data offset:               %d", ui.data_offs);
+	verbose(args.verbose, "UBI image sequence number: %u", ui.image_seq);
+
+	vtbl = ubigen_create_empty_vtbl(&ui);
+	if (!vtbl)
+		goto out;
+
+	args.dict = iniparser_load(args.f_in);
+	if (!args.dict) {
+		errmsg("cannot load the input ini file \"%s\"", args.f_in);
+		goto out_vtbl;
+	}
+
+	verbose(args.verbose, "loaded the ini-file \"%s\"", args.f_in);
+
+	/* Each section describes one volume */
+	sects = iniparser_getnsec(args.dict);
+	if (sects == -1) {
+		errmsg("ini-file parsing error (iniparser_getnsec)");
+		goto out_dict;
+	}
+
+	verbose(args.verbose, "count of sections: %d", sects);
+	if (sects == 0) {
+		errmsg("no sections found the ini-file \"%s\"", args.f_in);
+		goto out_dict;
+	}
+
+	if (sects > ui.max_volumes) {
+		errmsg("too many sections (%d) in the ini-file \"%s\"",
+		       sects, args.f_in);
+		normsg("each section corresponds to an UBI volume, maximum "
+		       "count of volumes is %d", ui.max_volumes);
+		goto out_dict;
+	}
+
+	vi = calloc(sizeof(struct ubigen_vol_info), sects);
+	if (!vi) {
+		errmsg("cannot allocate memory");
+		goto out_dict;
+	}
+
+	/*
+	 * Skip 2 PEBs at the beginning of the file for the volume table which
+	 * will be written later.
+	 */
+	seek = ui.peb_size * 2;
+	if (lseek(args.out_fd, seek, SEEK_SET) != seek) {
+		sys_errmsg("cannot seek file \"%s\"", args.f_out);
+		goto out_free;
+	}
+
+	for (i = 0; i < sects; i++) {
+		const char *sname = iniparser_getsecname(args.dict, i);
+		const char *img = NULL;
+		struct stat st;
+		int fd, j;
+
+		if (!sname) {
+			errmsg("ini-file parsing error (iniparser_getsecname)");
+			goto out_free;
+		}
+
+		if (args.verbose)
+			printf("\n");
+		verbose(args.verbose, "parsing section \"%s\"", sname);
+
+		err = read_section(&ui, sname, &vi[i], &img, &st);
+		if (err == -1)
+			goto out_free;
+
+		verbose(args.verbose, "adding volume %d", vi[i].id);
+
+		/*
+		 * Make sure that volume ID and name is unique and that only
+		 * one volume has auto-resize flag
+		 */
+		for (j = 0; j < i; j++) {
+			if (vi[i].id == vi[j].id) {
+				errmsg("volume IDs must be unique, but ID %d "
+				       "in section \"%s\" is not",
+				       vi[i].id, sname);
+				goto out_free;
+			}
+
+			if (!strcmp(vi[i].name, vi[j].name)) {
+				errmsg("volume name must be unique, but name "
+				       "\"%s\" in section \"%s\" is not",
+				       vi[i].name, sname);
+				goto out_free;
+			}
+		}
+
+		if (vi[i].flags & UBI_VTBL_AUTORESIZE_FLG) {
+			if (autoresize_was_already)
+				return errmsg("only one volume is allowed "
+					      "to have auto-resize flag");
+			autoresize_was_already = 1;
+		}
+
+		err = ubigen_add_volume(&ui, &vi[i], vtbl);
+		if (err) {
+			errmsg("cannot add volume for section \"%s\"", sname);
+			goto out_free;
+		}
+
+		if (img) {
+			fd = open(img, O_RDONLY);
+			if (fd == -1) {
+				sys_errmsg("cannot open \"%s\"", img);
+				goto out_free;
+			}
+
+			verbose(args.verbose, "writing volume %d", vi[i].id);
+			verbose(args.verbose, "image file: %s", img);
+
+			err = ubigen_write_volume(&ui, &vi[i], args.ec, st.st_size, fd, args.out_fd);
+			close(fd);
+			if (err) {
+				errmsg("cannot write volume for section \"%s\"", sname);
+				goto out_free;
+			}
+		}
+
+		if (args.verbose)
+			printf("\n");
+	}
+
+	verbose(args.verbose, "writing layout volume");
+
+	err = ubigen_write_layout_vol(&ui, 0, 1, args.ec, args.ec, vtbl, args.out_fd);
+	if (err) {
+		errmsg("cannot write layout volume");
+		goto out_free;
+	}
+
+	verbose(args.verbose, "done");
+
+	free(vi);
+	iniparser_freedict(args.dict);
+	free(vtbl);
+	close(args.out_fd);
+	return 0;
+
+out_free:
+	free(vi);
+out_dict:
+	iniparser_freedict(args.dict);
+out_vtbl:
+	free(vtbl);
+out:
+	close(args.out_fd);
+	remove(args.f_out);
+	return err;
+}
diff --git a/ubi-utils/ubirename.c b/ubi-utils/ubirename.c
new file mode 100644
index 0000000..070e32e
--- /dev/null
+++ b/ubi-utils/ubirename.c
@@ -0,0 +1,147 @@
+/*
+ * Copyright (C) 2008 Logitech.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+/*
+ * An utility to get rename UBI volumes.
+ *
+ * Author: Richard Titmuss
+ */
+
+#define PROGRAM_VERSION "1.0"
+#define PROGRAM_NAME    "ubirename"
+
+#include <stdio.h>
+#include <stdint.h>
+#include <getopt.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <libubi.h>
+#include "common.h"
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " <UBI device node file name> [<old name> <new name>|...]\n\n"
+"Example: " PROGRAM_NAME "/dev/ubi0 A B C D - rename volume A to B, and C to D\n\n"
+"This utility allows re-naming several volumes in one go atomically.\n"
+"For example, if you have volumes A and B, then you may rename A into B\n"
+"and B into A at one go, and the operation will be atomic. This allows\n"
+"implementing atomic UBI volumes upgrades. E.g., if you have volume A\n"
+"and want to upgrade it atomically, you create a temporary volume B,\n"
+"put your new data to B, then rename A to B and B to A, and then you\n"
+"may remove old volume B.\n"
+"It is also allowed to re-name multiple volumes at a time, but 16 max.\n"
+"renames at once, which means you may specify up to 32 volume names.\n"
+"If you have volumes A and B, and re-name A to B, bud do not re-name\n"
+"B to something else in the same request, old volume B will be removed\n"
+"and A will be renamed into B.\n";
+
+static int get_vol_id(libubi_t libubi, struct ubi_dev_info *dev_info,
+		       char *name)
+{
+	int err, i;
+	struct ubi_vol_info vol_info;
+
+	for (i=dev_info->lowest_vol_id; i<=dev_info->highest_vol_id; i++) {
+		err = ubi_get_vol_info1(libubi, dev_info->dev_num, i, &vol_info);
+		if (err == -1) {
+			if (errno == ENOENT)
+				continue;
+			return -1;
+		}
+
+		if (strcmp(name, vol_info.name) == 0)
+			return vol_info.vol_id;
+	}
+
+	return -1;
+}
+
+int main(int argc, char * const argv[])
+{
+	int i, err;
+	int count = 0;
+	libubi_t libubi;
+	struct ubi_dev_info dev_info;
+	struct ubi_rnvol_req rnvol;
+	const char *node;
+
+	if (argc < 3 || (argc & 1) == 1) {
+		errmsg("too few arguments");
+		fprintf(stderr, "%s\n", usage);
+		return -1;
+	}
+
+	if (argc > UBI_MAX_RNVOL + 2) {
+		errmsg("too many volumes to re-name, max. is %d",
+		       UBI_MAX_RNVOL);
+		return -1;
+	}
+
+	node = argv[1];
+	libubi = libubi_open();
+	if (!libubi) {
+		if (errno == 0)
+			return errmsg("UBI is not present in the system");
+		return sys_errmsg("cannot open libubi");
+	}
+
+	err = ubi_probe_node(libubi, node);
+	if (err == 2) {
+		errmsg("\"%s\" is an UBI volume node, not an UBI device node",
+		       node);
+		goto out_libubi;
+	} else if (err < 0) {
+		if (errno == ENODEV)
+			errmsg("\"%s\" is not an UBI device node", node);
+		else
+			sys_errmsg("error while probing \"%s\"", node);
+		goto out_libubi;
+	}
+
+	err = ubi_get_dev_info(libubi, node, &dev_info);
+	if (err == -1) {
+		sys_errmsg("cannot get information about UBI device \"%s\"", node);
+		goto out_libubi;
+	}
+
+	for (i = 2; i < argc; i += 2) {
+		err = get_vol_id(libubi, &dev_info, argv[i]);
+		if (err == -1) {
+			errmsg("\"%s\" volume not found", argv[i]);
+			goto out_libubi;
+		}
+
+		rnvol.ents[count].vol_id = err;
+		rnvol.ents[count].name_len = strlen(argv[i + 1]);
+		strcpy(rnvol.ents[count++].name, argv[i + 1]);
+	}
+
+	rnvol.count = count;
+
+	err = ubi_rnvols(libubi, node, &rnvol);
+	if (err == -1) {
+		sys_errmsg("cannot rename volumes");
+		goto out_libubi;
+	}
+
+	libubi_close(libubi);
+	return 0;
+
+out_libubi:
+	libubi_close(libubi);
+	return -1;
+}
diff --git a/ubi-utils/ubirmvol.c b/ubi-utils/ubirmvol.c
new file mode 100644
index 0000000..5725d90
--- /dev/null
+++ b/ubi-utils/ubirmvol.c
@@ -0,0 +1,211 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+/*
+ * An utility to remove UBI volumes.
+ *
+ * Authors: Artem Bityutskiy <dedekind@infradead.org>
+ *          Frank Haverkamp <haver@vnet.ibm.com>
+ */
+
+#define PROGRAM_VERSION "1.1"
+#define PROGRAM_NAME    "ubirmvol"
+
+#include <stdio.h>
+#include <stdint.h>
+#include <getopt.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <libubi.h>
+#include "common.h"
+
+/* The variables below are set by command line arguments */
+struct args {
+	int vol_id;
+	const char *node;
+	const char *name;
+};
+
+static struct args args = {
+	.vol_id = -1,
+};
+
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+				 " - a tool to remove UBI volumes.";
+
+static const char optionsstr[] =
+"-n, --vol_id=<volume id>   volume ID to remove\n"
+"-N, --name=<volume name>   volume name to remove\n"
+"-h, -?, --help             print help message\n"
+"-V, --version              print program version";
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " <UBI device node file name> [-n <volume id>] [--vol_id=<volume id>]\n\n"
+"         [-N <volume name>] [--name=<volume name>] [-h] [--help]\n\n"
+"Example: " PROGRAM_NAME "/dev/ubi0 -n 1 - remove UBI volume 1 from UBI device corresponding\n"
+"         to /dev/ubi0\n"
+"         " PROGRAM_NAME "/dev/ubi0 -N my_vol - remove UBI named \"my_vol\" from UBI device\n"
+"         corresponding to /dev/ubi0";
+
+static const struct option long_options[] = {
+	{ .name = "vol_id",  .has_arg = 1, .flag = NULL, .val = 'n' },
+	{ .name = "name",    .has_arg = 1, .flag = NULL, .val = 'N' },
+	{ .name = "help",    .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version", .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ NULL, 0, NULL, 0},
+};
+
+static int param_sanity_check(void)
+{
+	if (args.vol_id == -1 && !args.name) {
+		errmsg("please, specify either volume ID or volume name");
+		return -1;
+	}
+
+	if (args.vol_id != -1 && args.name) {
+		errmsg("please, specify either volume ID or volume name, not both");
+		return -1;
+	}
+
+	return 0;
+}
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int key, error = 0;
+
+		key = getopt_long(argc, argv, "n:N:h?V", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+
+		case 'n':
+			args.vol_id = simple_strtoul(optarg, &error);
+			if (error || args.vol_id < 0) {
+				errmsg("bad volume ID: " "\"%s\"", optarg);
+				return -1;
+			}
+			break;
+
+		case 'N':
+			args.name = optarg;
+			break;
+
+		case 'h':
+		case '?':
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'V':
+			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
+		case ':':
+			errmsg("parameter is missing");
+			return -1;
+
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+
+	if (optind == argc) {
+		errmsg("UBI device name was not specified (use -h for help)");
+		return -1;
+	} else if (optind != argc - 1) {
+		errmsg("more then one UBI device specified (use -h for help)");
+		return -1;
+	}
+
+	args.node = argv[optind];
+
+	if (param_sanity_check())
+		return -1;
+
+	return 0;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err;
+	libubi_t libubi;
+
+	err = parse_opt(argc, argv);
+	if (err)
+		return -1;
+
+	libubi = libubi_open();
+	if (!libubi) {
+		if (errno == 0)
+			return errmsg("UBI is not present in the system");
+		return sys_errmsg("cannot open libubi");
+	}
+
+	err = ubi_probe_node(libubi, args.node);
+	if (err == 2) {
+		errmsg("\"%s\" is an UBI volume node, not an UBI device node",
+		       args.node);
+		goto out_libubi;
+	} else if (err < 0) {
+		if (errno == ENODEV)
+			errmsg("\"%s\" is not an UBI device node", args.node);
+		else
+			sys_errmsg("error while probing \"%s\"", args.node);
+		goto out_libubi;
+	}
+
+	if (args.name) {
+		struct ubi_dev_info dev_info;
+		struct ubi_vol_info vol_info;
+
+		err = ubi_get_dev_info(libubi, args.node, &dev_info);
+		if (err) {
+			sys_errmsg("cannot get information about UBI device \"%s\"",
+				   args.node);
+			goto out_libubi;
+		}
+
+		err = ubi_get_vol_info1_nm(libubi, dev_info.dev_num,
+					   args.name, &vol_info);
+		if (err) {
+			sys_errmsg("cannot find UBI volume \"%s\"", args.name);
+			goto out_libubi;
+		}
+
+		args.vol_id = vol_info.vol_id;
+	}
+
+	err = ubi_rmvol(libubi, args.node, args.vol_id);
+	if (err) {
+		sys_errmsg("cannot UBI remove volume");
+		goto out_libubi;
+	}
+
+	libubi_close(libubi);
+	return 0;
+
+out_libubi:
+	libubi_close(libubi);
+	return -1;
+}
diff --git a/ubi-utils/ubirsvol.c b/ubi-utils/ubirsvol.c
new file mode 100644
index 0000000..65f579c
--- /dev/null
+++ b/ubi-utils/ubirsvol.c
@@ -0,0 +1,245 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+/*
+ * An utility to resize UBI volumes.
+ *
+ * Authors: Artem Bityutskiy <dedekind@infradead.org>
+ *          Frank Haverkamp <haver@vnet.ibm.com>
+ */
+
+#define PROGRAM_VERSION "1.1"
+#define PROGRAM_NAME    "ubirsvol"
+
+#include <stdio.h>
+#include <stdint.h>
+#include <getopt.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <libubi.h>
+#include "common.h"
+#include "ubiutils-common.h"
+
+/* The variables below are set by command line arguments */
+struct args {
+	int vol_id;
+	const char *node;
+	const char *name;
+	long long bytes;
+	int lebs;
+};
+
+static struct args args = {
+	.vol_id = -1,
+	.bytes = -1,
+	.lebs = -1,
+};
+
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+				 " - a tool to resize UBI volumes.";
+
+static const char optionsstr[] =
+"-n, --vol_id=<volume id>   volume ID to resize\n"
+"-N, --name=<volume name>   volume name to resize\n"
+"-s, --size=<bytes>         volume size volume size in bytes, kilobytes (KiB)\n"
+"                           or megabytes (MiB)\n"
+"-S, --lebs=<LEBs count>    alternative way to give volume size in logical\n"
+"                           eraseblocks\n"
+"-h, -?, --help             print help message\n"
+"-V, --version              print program version";
+
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " <UBI device node file name> [-n <volume id>] [--vol_id=<volume id>]\n\n"
+"         [-N <volume name>] [--name=<volume name>] [-s <bytes>] [-S <LEBs>] [-h] [--help]\n\n"
+"Example: " PROGRAM_NAME " /dev/ubi0 -n 1 -s 1MiB resize UBI volume 1 to 1 MiB on\n"
+"         UBI device corresponding to /dev/ubi0\n"
+"         " PROGRAM_NAME " /dev/ubi0 -N my_vol -s 1MiB - resize UBI volume named \"my_vol\" to 1 MiB\n"
+"	  on UBI device corresponding to /dev/ubi0";
+
+static const struct option long_options[] = {
+	{ .name = "vol_id",  .has_arg = 1, .flag = NULL, .val = 'n' },
+	{ .name = "name",    .has_arg = 1, .flag = NULL, .val = 'N' },
+	{ .name = "help",    .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version", .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ .name = "size",    .has_arg = 1, .flag = NULL, .val = 's' },
+	{ .name = "lebs",    .has_arg = 1, .flag = NULL, .val = 'S' },
+	{ NULL, 0, NULL, 0},
+};
+
+static int param_sanity_check(void)
+{
+	if (args.vol_id == -1 && !args.name) {
+		errmsg("please, specify either volume ID or volume name");
+		return -1;
+	}
+
+	if (args.vol_id != -1 && args.name) {
+		errmsg("please, specify either volume ID or volume name, not both");
+		return -1;
+	}
+
+	if (args.bytes == -1 && args.lebs == -1)
+		return errmsg("volume size was not specified (use -h for help)");
+
+	if (args.bytes != -1 && args.lebs != -1)
+		return errmsg("size specified with more then one option");
+
+	return 0;
+}
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int key, error = 0;
+
+		key = getopt_long(argc, argv, "s:S:n:N:h?V", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 's':
+			args.bytes = ubiutils_get_bytes(optarg);
+			if (args.bytes <= 0)
+				return errmsg("bad volume size: \"%s\"", optarg);
+			break;
+
+		case 'S':
+			args.lebs = simple_strtoull(optarg, &error);
+			if (error || args.lebs <= 0)
+				return errmsg("bad LEB count: \"%s\"", optarg);
+			break;
+
+		case 'n':
+			args.vol_id = simple_strtoul(optarg, &error);
+			if (error || args.vol_id < 0) {
+				errmsg("bad volume ID: " "\"%s\"", optarg);
+				return -1;
+			}
+			break;
+
+		case 'N':
+			args.name = optarg;
+			break;
+
+		case 'h':
+		case '?':
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'V':
+			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
+		case ':':
+			errmsg("parameter is missing");
+			return -1;
+
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+
+	if (optind == argc) {
+		errmsg("UBI device name was not specified (use -h for help)");
+		return -1;
+	} else if (optind != argc - 1) {
+		errmsg("more then one UBI device specified (use -h for help)");
+		return -1;
+	}
+
+	args.node = argv[optind];
+
+	if (param_sanity_check())
+		return -1;
+
+	return 0;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err;
+	libubi_t libubi;
+	struct ubi_dev_info dev_info;
+	struct ubi_vol_info vol_info;
+
+	err = parse_opt(argc, argv);
+	if (err)
+		return -1;
+
+	libubi = libubi_open();
+	if (!libubi)
+		return sys_errmsg("cannot open libubi");
+
+	err = ubi_probe_node(libubi, args.node);
+	if (err == 2) {
+		errmsg("\"%s\" is an UBI volume node, not an UBI device node",
+		       args.node);
+		goto out_libubi;
+	} else if (err < 0) {
+		if (errno == ENODEV)
+			errmsg("\"%s\" is not an UBI device node", args.node);
+		else
+			sys_errmsg("error while probing \"%s\"", args.node);
+	}
+
+	err = ubi_get_dev_info(libubi, args.node, &dev_info);
+	if (err) {
+		sys_errmsg("cannot get information about UBI device \"%s\"",
+			   args.node);
+		goto out_libubi;
+	}
+
+	if (args.name) {
+		err = ubi_get_vol_info1_nm(libubi, dev_info.dev_num,
+					   args.name, &vol_info);
+		if (err) {
+			sys_errmsg("cannot find UBI volume \"%s\"", args.name);
+			goto out_libubi;
+		}
+
+		args.vol_id = vol_info.vol_id;
+	} else {
+		err = ubi_get_vol_info1(libubi, dev_info.dev_num,
+					   args.vol_id, &vol_info);
+		if (err) {
+			sys_errmsg("cannot find UBI volume ID %d", args.vol_id);
+			goto out_libubi;
+		}
+	}
+
+	if (args.lebs != -1)
+		args.bytes = vol_info.leb_size * args.lebs;
+
+	err = ubi_rsvol(libubi, args.node, args.vol_id, args.bytes);
+	if (err) {
+		sys_errmsg("cannot UBI resize volume");
+		goto out_libubi;
+	}
+
+	libubi_close(libubi);
+	return 0;
+
+out_libubi:
+	libubi_close(libubi);
+	return -1;
+}
diff --git a/ubi-utils/ubiupdatevol.c b/ubi-utils/ubiupdatevol.c
new file mode 100644
index 0000000..24f38fe
--- /dev/null
+++ b/ubi-utils/ubiupdatevol.c
@@ -0,0 +1,324 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+/*
+ * An utility to update UBI volumes.
+ *
+ * Authors: Frank Haverkamp
+ *          Joshua W. Boyer
+ *          Artem Bityutskiy
+ */
+
+#define PROGRAM_VERSION "1.2"
+#define PROGRAM_NAME    "ubiupdatevol"
+
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdint.h>
+#include <getopt.h>
+#include <stdarg.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/stat.h>
+
+#include <libubi.h>
+#include "common.h"
+
+struct args {
+	int truncate;
+	const char *node;
+	const char *img;
+	/* For deprecated -d and -B options handling */
+	char dev_name[256];
+	int size;
+	int use_stdin;
+};
+
+static struct args args;
+
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
+			 " - a tool to write data to UBI volumes.";
+
+static const char optionsstr[] =
+"-t, --truncate             truncate volume (wipe it out)\n"
+"-s, --size=<bytes>         bytes in input, if not reading from file\n"
+"-h, --help                 print help message\n"
+"-V, --version              print program version";
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " <UBI volume node file name> [-t] [-s <size>] [-h] [-V] [--truncate]\n"
+"\t\t\t[--size=<size>] [--help] [--version] <image file>\n\n"
+"Example 1: " PROGRAM_NAME " /dev/ubi0_1 fs.img - write file \"fs.img\" to UBI volume /dev/ubi0_1\n"
+"Example 2: " PROGRAM_NAME " /dev/ubi0_1 -t - wipe out UBI volume /dev/ubi0_1";
+
+static const struct option long_options[] = {
+	{ .name = "truncate", .has_arg = 0, .flag = NULL, .val = 't' },
+	{ .name = "help",     .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",  .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ .name = "size",     .has_arg = 1, .flag = NULL, .val = 's' },
+	{ NULL, 0, NULL, 0}
+};
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int key, error = 0;
+
+		key = getopt_long(argc, argv, "ts:h?V", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 't':
+			args.truncate = 1;
+			break;
+
+		case 's':
+			args.size = simple_strtoul(optarg, &error);
+			if (error || args.size < 0)
+				return errmsg("bad size: " "\"%s\"", optarg);
+			break;
+
+		case 'h':
+		case '?':
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'V':
+			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
+		case ':':
+			return errmsg("parameter is missing");
+
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+
+	if (optind == argc)
+		return errmsg("UBI device name was not specified (use -h for help)");
+	else if (optind != argc - 2 && !args.truncate)
+		return errmsg("specify UBI device name and image file name as first 2 "
+			      "parameters (use -h for help)");
+
+	args.node = argv[optind];
+	args.img  = argv[optind + 1];
+
+	if (args.img && args.truncate)
+		return errmsg("You can't truncate and specify an image (use -h for help)");
+
+	if (args.img && !args.truncate) {
+		if (strcmp(args.img, "-") == 0)
+			args.use_stdin = 1;
+		if (args.use_stdin && !args.size)
+			return errmsg("file size must be specified if input is stdin");
+	}
+
+	return 0;
+}
+
+static int truncate_volume(libubi_t libubi)
+{
+	int err, fd;
+
+	fd = open(args.node, O_RDWR);
+	if (fd == -1)
+		return sys_errmsg("cannot open \"%s\"", args.node);
+
+	err = ubi_update_start(libubi, fd, 0);
+	if (err) {
+		sys_errmsg("cannot truncate volume \"%s\"", args.node);
+		close(fd);
+		return -1;
+	}
+
+	close(fd);
+	return 0;
+}
+
+static int ubi_write(int fd, const void *buf, int len)
+{
+	int ret;
+
+	while (len) {
+		ret = write(fd, buf, len);
+		if (ret < 0) {
+			if (errno == EINTR) {
+				warnmsg("do not interrupt me!");
+				continue;
+			}
+			return sys_errmsg("cannot write %d bytes to volume \"%s\"",
+					  len, args.node);
+		}
+
+		if (ret == 0)
+			return errmsg("cannot write %d bytes to volume \"%s\"", len, args.node);
+
+		len -= ret;
+		buf += ret;
+	}
+
+	return 0;
+}
+
+static int update_volume(libubi_t libubi, struct ubi_vol_info *vol_info)
+{
+	int err, fd, ifd;
+	long long bytes;
+	char *buf;
+
+	buf = malloc(vol_info->leb_size);
+	if (!buf)
+		return errmsg("cannot allocate %d bytes of memory", vol_info->leb_size);
+
+	if (!args.size) {
+		struct stat st;
+		err = stat(args.img, &st);
+		if (err < 0) {
+			errmsg("stat failed on \"%s\"", args.img);
+			goto out_free;
+		}
+
+		bytes = st.st_size;
+	} else
+		bytes = args.size;
+
+	if (bytes > vol_info->rsvd_bytes) {
+		errmsg("\"%s\" (size %lld) will not fit volume \"%s\" (size %lld)",
+		       args.img, bytes, args.node, vol_info->rsvd_bytes);
+		goto out_free;
+	}
+
+	fd = open(args.node, O_RDWR);
+	if (fd == -1) {
+		sys_errmsg("cannot open UBI volume \"%s\"", args.node);
+		goto out_free;
+	}
+
+	if (args.use_stdin)
+		ifd = STDIN_FILENO;
+	else {
+		ifd = open(args.img, O_RDONLY);
+		if (ifd == -1) {
+			sys_errmsg("cannot open \"%s\"", args.img);
+			goto out_close1;
+		}
+	}
+
+	err = ubi_update_start(libubi, fd, bytes);
+	if (err) {
+		sys_errmsg("cannot start volume \"%s\" update", args.node);
+		goto out_close;
+	}
+
+	while (bytes) {
+		int ret, to_copy = vol_info->leb_size;
+
+		if (to_copy > bytes)
+			to_copy = bytes;
+
+		ret = read(ifd, buf, to_copy);
+		if (ret <= 0) {
+			if (errno == EINTR) {
+				warnmsg("do not interrupt me!");
+				continue;
+			} else {
+				sys_errmsg("cannot read %d bytes from \"%s\"",
+						to_copy, args.img);
+				goto out_close;
+			}
+		}
+
+		err = ubi_write(fd, buf, ret);
+		if (err)
+			goto out_close;
+		bytes -= ret;
+	}
+
+	close(ifd);
+	close(fd);
+	free(buf);
+	return 0;
+
+out_close:
+	close(ifd);
+out_close1:
+	close(fd);
+out_free:
+	free(buf);
+	return -1;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err;
+	libubi_t libubi;
+	struct ubi_vol_info vol_info;
+
+	err = parse_opt(argc, argv);
+	if (err)
+		return -1;
+
+	libubi = libubi_open();
+	if (!libubi) {
+		if (errno == 0)
+			errmsg("UBI is not present in the system");
+		else
+			sys_errmsg("cannot open libubi");
+		goto out_libubi;
+	}
+
+	err = ubi_probe_node(libubi, args.node);
+	if (err == 1) {
+		errmsg("\"%s\" is an UBI device node, not an UBI volume node",
+		       args.node);
+		goto out_libubi;
+	} else if (err < 0) {
+		if (errno == ENODEV)
+			errmsg("\"%s\" is not an UBI volume node", args.node);
+		else
+			sys_errmsg("error while probing \"%s\"", args.node);
+		goto out_libubi;
+	}
+
+	err = ubi_get_vol_info(libubi, args.node, &vol_info);
+	if (err) {
+		sys_errmsg("cannot get information about UBI volume \"%s\"",
+			   args.node);
+		goto out_libubi;
+	}
+
+	if (args.truncate)
+		err = truncate_volume(libubi);
+	else
+		err = update_volume(libubi, &vol_info);
+	if (err)
+		goto out_libubi;
+
+	libubi_close(libubi);
+	return 0;
+
+out_libubi:
+	libubi_close(libubi);
+	return -1;
+}
diff --git a/ubi-utils/ubiutils-common.c b/ubi-utils/ubiutils-common.c
new file mode 100644
index 0000000..6609a6b
--- /dev/null
+++ b/ubi-utils/ubiutils-common.c
@@ -0,0 +1,211 @@
+/*
+ * Copyright (C) 2007, 2008 Nokia Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+/*
+ * This file contains various common stuff used by UBI utilities.
+ *
+ * Authors: Artem Bityutskiy
+ *          Adrian Hunter
+ */
+
+#define PROGRAM_NAME "ubiutils"
+
+#include <sys/time.h>
+#include <sys/types.h>
+#include <stdio.h>
+#include <string.h>
+#include <ctype.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include "common.h"
+
+/**
+ * get_multiplier - convert size specifier to an integer multiplier.
+ * @str: the size specifier string
+ *
+ * This function parses the @str size specifier, which may be one of
+ * 'KiB', 'MiB', or 'GiB' into an integer multiplier. Returns positive
+ * size multiplier in case of success and %-1 in case of failure.
+ */
+static int get_multiplier(const char *str)
+{
+	if (!str)
+		return 1;
+
+	/* Remove spaces before the specifier */
+	while (*str == ' ' || *str == '\t')
+		str += 1;
+
+	if (!strcmp(str, "KiB"))
+		return 1024;
+	if (!strcmp(str, "MiB"))
+		return 1024 * 1024;
+	if (!strcmp(str, "GiB"))
+		return 1024 * 1024 * 1024;
+
+	return -1;
+}
+
+/**
+ * ubiutils_get_bytes - convert a string containing amount of bytes into an
+ * integer
+ * @str: string to convert
+ *
+ * This function parses @str which may have one of 'KiB', 'MiB', or 'GiB'
+ * size specifiers. Returns positive amount of bytes in case of success and %-1
+ * in case of failure.
+ */
+long long ubiutils_get_bytes(const char *str)
+{
+	char *endp;
+	long long bytes = strtoull(str, &endp, 0);
+
+	if (endp == str || bytes < 0) {
+		fprintf(stderr, "incorrect amount of bytes: \"%s\"\n", str);
+		return -1;
+	}
+
+	if (*endp != '\0') {
+		int mult = get_multiplier(endp);
+
+		if (mult == -1) {
+			fprintf(stderr, "bad size specifier: \"%s\" - "
+			        "should be 'KiB', 'MiB' or 'GiB'\n", endp);
+			return -1;
+		}
+		bytes *= mult;
+	}
+
+	return bytes;
+}
+
+/**
+ * ubiutils_print_bytes - print bytes.
+ * @bytes: variable to print
+ * @bracket: whether brackets have to be put or not
+ *
+ * This is a helper function which prints amount of bytes in a human-readable
+ * form, i.e., it prints the exact amount of bytes following by the approximate
+ * amount of Kilobytes, Megabytes, or Gigabytes, depending on how big @bytes
+ * is.
+ */
+void ubiutils_print_bytes(long long bytes, int bracket)
+{
+	const char *p;
+
+	if (bracket)
+		p = " (";
+	else
+		p = ", ";
+
+	printf("%lld bytes", bytes);
+
+	if (bytes > 1024 * 1024 * 1024)
+		printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 1024));
+	else if (bytes > 1024 * 1024)
+		printf("%s%.1f MiB", p, (double)bytes / (1024 * 1024));
+	else if (bytes > 1024 && bytes != 0)
+		printf("%s%.1f KiB", p, (double)bytes / 1024);
+	else
+		return;
+
+	if (bracket)
+		printf(")");
+}
+
+/**
+ * ubiutils_print_text - print text and fold it.
+ * @stream: file stream to print to
+ * @text: text to print
+ * @width: maximum allowed text width
+ *
+ * Print text and fold it so that each line would not have more then @width
+ * characters.
+ */
+void ubiutils_print_text(FILE *stream, const char *text, int width)
+{
+	int pos, bpos = 0;
+	const char *p;
+	char line[1024];
+
+	if (width > 1023) {
+		fprintf(stream, "%s\n", text);
+		return;
+	}
+	p = text;
+	pos = 0;
+	while (p[pos]) {
+		while (!isspace(p[pos])) {
+			line[pos] = p[pos];
+			if (!p[pos])
+				break;
+			++pos;
+			if (pos == width) {
+				line[pos] = '\0';
+				fprintf(stream, "%s\n", line);
+				p += pos;
+				pos = 0;
+			}
+		}
+		while (pos < width) {
+			line[pos] = p[pos];
+			if (!p[pos]) {
+				bpos = pos;
+				break;
+			}
+			if (isspace(p[pos]))
+				bpos = pos;
+			++pos;
+		}
+		line[bpos] = '\0';
+		fprintf(stream, "%s\n", line);
+		p += bpos;
+		pos = 0;
+		while (p[pos] && isspace(p[pos]))
+			++p;
+	}
+}
+
+/**
+ * ubiutils_srand - randomly seed the standard pseudo-random generator.
+ *
+ * This helper function seeds the standard libc pseudo-random generator with a
+ * more or less random value to make sure the 'rand()' call does not return the
+ * same sequence every time UBI utilities run. Returns zero in case of success
+ * and a %-1 in case of error.
+ */
+int ubiutils_srand(void)
+{
+	struct timeval tv;
+	struct timezone tz;
+	unsigned int seed;
+
+	/*
+	 * Just assume that a combination of the PID + current time is a
+	 * reasonably random number.
+	 */
+	if (gettimeofday(&tv, &tz))
+		return -1;
+
+	seed = (unsigned int)tv.tv_sec;
+	seed += (unsigned int)tv.tv_usec;
+	seed *= getpid();
+	seed %= RAND_MAX;
+	srand(seed);
+	return 0;
+}
-- 
1.7.5.3
