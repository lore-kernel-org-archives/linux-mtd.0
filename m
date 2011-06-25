Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaKwC-0005gi-JB
	for linux-mtd@lists.infradead.org; Sat, 25 Jun 2011 04:57:45 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 7E2171BC003
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Jun 2011 04:57:38 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] punt redundant libcrc32
Date: Sat, 25 Jun 2011 00:57:37 -0400
Message-Id: <1308977857-3220-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The libcrc32.a is only used in one place: mkfs.ubifs.  But this also
uses libmtd.a, and the only file in libcrc32.a is also in libmtd.a.
So libcrc32.a itself is completely redundant.  Punt!

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 lib/Makefile        |    5 ++---
 mkfs.ubifs/Makefile |    2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/Makefile b/lib/Makefile
index 9de6a7d..9b01d32 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -6,12 +6,11 @@ SUBDIRS =
 
 # CFLAGS += -Werror
 CPPFLAGS += -I../include
-LIBS = libmtd libcrc32
-TARGETS = libmtd.a libcrc32.a
+LIBS = libmtd
+TARGETS = libmtd.a
 
 include ../common.mk
 
-$(BUILDDIR)/libcrc32.a: $(addprefix $(BUILDDIR)/, libcrc32.o)
 $(BUILDDIR)/libmtd.a: $(addprefix $(BUILDDIR)/,\
        libmtd.o libmtd_legacy.o libcrc32.o libfec.o)
 
diff --git a/mkfs.ubifs/Makefile b/mkfs.ubifs/Makefile
index 499f9e5..ba21a8c 100644
--- a/mkfs.ubifs/Makefile
+++ b/mkfs.ubifs/Makefile
@@ -7,7 +7,7 @@ ALL_SOURCES=*.[ch] hashtable/*.[ch]
 TARGETS = mkfs.ubifs
 
 LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid -L$(BUILDDIR)/../ubi-utils/ -lubi
-LDLIBS_mkfs.ubifs += -L$(BUILDDIR)/../lib -lmtd -lcrc32
+LDLIBS_mkfs.ubifs += -L$(BUILDDIR)/../lib -lmtd
 LDLIBS_mkfs.ubifs += $(ZLIBLDFLAGS) $(LZOLDFLAGS)
 
 include ../common.mk
-- 
1.7.5.3
