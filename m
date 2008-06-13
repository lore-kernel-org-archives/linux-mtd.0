Received: from relay01.pair.com ([209.68.5.15])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K7BTs-0005mT-TY
	for linux-mtd@lists.infradead.org; Fri, 13 Jun 2008 15:46:25 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD-UTILS] Makefile: Add Optional ZLIB and LZO CFLAGS and
	LDFLAGS
Date: Fri, 13 Jun 2008 08:46:20 -0700
Message-Id: <1213371980-23414-1-git-send-email-gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds support for allowing the specification of unique CFLAGS and 
LDFLAGS for both LZO and ZLIB. In addition, it allows for independently 
specifying both PREFIX and EXEC_PREFIX.

The former is useful in some cross-compilation environments where the 
LZO and ZLIB versions being built against are not those installed in the 
standard locations.

The latter is useful when installing mtd-utils in a multi-architecture 
installation area.

Signed-off-by: Grant Erickson <gerickson@nuovations.com>
---
 Makefile |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 9f5ef6c..9d1c73d 100644
--- a/Makefile
+++ b/Makefile
@@ -2,12 +2,15 @@
 # -*- sh -*-
 
 OPTFLAGS := -O2 -Wall
-SBINDIR=/usr/sbin
-MANDIR=/usr/share/man
-INCLUDEDIR=/usr/include
+
+PREFIX=/usr
+EXEC_PREFIX=$(PREFIX)
+SBINDIR=$(EXEC_PREFIX)/sbin
+MANDIR=$(PREFIX)/share/man
+INCLUDEDIR=$(PREFIX)/include
 #CROSS=arm-linux-
 CC := $(CROSS)gcc
-CFLAGS := -I./include $(OPTFLAGS)
+CFLAGS := -I./include $(ZLIBCFLAGS) $(LZOCFLAGS) $(OPTFLAGS)
 
 ifeq ($(origin CROSS),undefined)
   BUILDDIR := .
@@ -63,7 +66,7 @@ $(BUILDDIR)/mkfs.jffs2: $(BUILDDIR)/crc32.o \
 			$(BUILDDIR)/compr_lzo.o \
 			$(BUILDDIR)/compr.o \
 			$(BUILDDIR)/rbtree.o
-	$(CC) $(LDFLAGS) -o $@ $^ -lz -llzo2
+	$(CC) $(LDFLAGS) -o $@ $^ $(ZLIBLDFLAGS) -lz $(LZOLDFLAGS) -llzo2
 
 $(BUILDDIR)/flash_eraseall: $(BUILDDIR)/crc32.o $(BUILDDIR)/flash_eraseall.o
 	$(CC) $(LDFLAGS) -o $@ $^
-- 
1.5.4.3
