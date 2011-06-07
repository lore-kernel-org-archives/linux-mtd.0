Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTpd7-0002S5-Qr
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 06:19:11 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 002F21B400C
	for <linux-mtd@lists.infradead.org>;
	Tue,  7 Jun 2011 06:19:05 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/6] jffs2: make lzo optional at build time
Date: Tue,  7 Jun 2011 02:19:03 -0400
Message-Id: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The external lzo dep can be a pain to deal with when cross-compiling,
so make it optional for jffs2.  This is useful if people aren't even
using the functionality, or for quicker development.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile    |    9 +++++++--
 compr_lzo.c |   15 +++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 6a65258..8bdba8e 100644
--- a/Makefile
+++ b/Makefile
@@ -6,6 +6,11 @@ CPPFLAGS += -I./include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
 ifeq ($(WITHOUT_XATTR), 1)
   CPPFLAGS += -DWITHOUT_XATTR
 endif
+ifeq ($(WITHOUT_LZO), 1)
+  CPPFLAGS += -DWITHOUT_LZO
+else
+  LZOLDLIBS = -llzo2
+endif
 
 SUBDIRS = lib ubi-utils mkfs.ubifs
 TESTS = tests
@@ -48,11 +53,11 @@ $(BUILDDIR)/mkfs.jffs2: $(addprefix $(BUILDDIR)/,\
 	compr_rtime.o mkfs.jffs2.o compr_zlib.o compr_lzo.o \
 	compr.o rbtree.o)
 LDFLAGS_mkfs.jffs2 = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
-LDLIBS_mkfs.jffs2  = -lz -llzo2
+LDLIBS_mkfs.jffs2  = -lz $(LZOLDLIBS)
 
 $(BUILDDIR)/jffs2reader: $(BUILDDIR)/jffs2reader.o
 LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
-LDLIBS_jffs2reader  = -lz -llzo2
+LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
 
 $(BUILDDIR)/lib/libmtd.a: subdirs_lib_all ;
 
diff --git a/compr_lzo.c b/compr_lzo.c
index d0f0ed7..d2e2afc 100644
--- a/compr_lzo.c
+++ b/compr_lzo.c
@@ -24,6 +24,8 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
+
+#ifndef WITHOUT_LZO
 #include <asm/types.h>
 #include <linux/jffs2.h>
 #include <lzo/lzo1x.h>
@@ -118,3 +120,16 @@ void jffs2_lzo_exit(void)
 	free(lzo_compress_buf);
 	free(lzo_mem);
 }
+
+#else
+
+int jffs2_lzo_init(void)
+{
+	return 0;
+}
+
+void jffs2_lzo_exit(void)
+{
+}
+
+#endif
-- 
1.7.5.3
