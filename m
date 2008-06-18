Received: from relay03.pair.com ([209.68.5.17])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8yrd-0003S5-0v
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 14:42:21 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] [MTD-UTILS] Makefile: Add Optional ZLIB and LZO CPPFLAGS
	and LDFLAGS
Date: Wed, 18 Jun 2008 07:35:39 -0700
Message-Id: <1213799739-18632-1-git-send-email-gerickson@nuovations.com>
In-Reply-To: <20080618090124.327efe45@zod.rchland.ibm.com>
References: <20080618090124.327efe45@zod.rchland.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds support for allowing the specification of unique CPPFLAGS and 
LDFLAGS for both LZO and ZLIB. In addition, it allows for independently 
specifying both PREFIX and EXEC_PREFIX.
 
The former is useful in some cross-compilation environments where the 
LZO and ZLIB versions being built against are not those installed in the 
standard locations.

The latter is useful when installing mtd-utils in a multi-architecture 
installation area.

Signed-off-by: Grant Erickson <gerickson@nuovations.com>
---
Makefile |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index c5d1933..32ee917 100644
--- a/Makefile
+++ b/Makefile
@@ -1,15 +1,17 @@
 
 # -*- sh -*-
 
-SBINDIR=/usr/sbin
-MANDIR=/usr/share/man
-INCLUDEDIR=/usr/include
+PREFIX=/usr
+EXEC_PREFIX=$(PREFIX)
+SBINDIR=$(EXEC_PREFIX)/sbin
+MANDIR=$(PREFIX)/share/man
+INCLUDEDIR=$(PREFIX)/include
 
 #CROSS=arm-linux-
 CC := $(CROSS)gcc
 CFLAGS ?= -O2 -g
 CFLAGS += -Wall
-CPPFLAGS += -I./include
+CPPFLAGS += -I./include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
 
 ifeq ($(origin CROSS),undefined)
   BUILDDIR := .
@@ -65,13 +67,13 @@ $(BUILDDIR)/mkfs.jffs2: $(BUILDDIR)/crc32.o \
 			$(BUILDDIR)/compr_lzo.o \
 			$(BUILDDIR)/compr.o \
 			$(BUILDDIR)/rbtree.o
-	$(CC) $(LDFLAGS) -o $@ $^ -lz -llzo2
+	$(CC) $(LDFLAGS) -o $@ $^ $(ZLIBLDFLAGS) -lz $(LZOLDFLAGS) -llzo2
 
 $(BUILDDIR)/flash_eraseall: $(BUILDDIR)/crc32.o $(BUILDDIR)/flash_eraseall.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
 $(BUILDDIR)/jffs2reader: $(BUILDDIR)/jffs2reader.o
-	$(CC) $(LDFLAGS) -o $@ $^ -lz
+	$(CC) $(LDFLAGS) -o $@ $^ $(ZLIBLDFLAGS) -lz
 
 $(BUILDDIR)/jffs2dump: $(BUILDDIR)/jffs2dump.o $(BUILDDIR)/crc32.o
 	$(CC) $(LDFLAGS) -o $@ $^
--
1.5.4.4
