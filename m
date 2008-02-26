Received: from relay02.pair.com ([209.68.5.16])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JU4W3-0005hj-0K
	for linux-mtd@lists.infradead.org; Tue, 26 Feb 2008 18:26:59 +0000
Date: Tue, 26 Feb 2008 10:26:48 -0800
Subject: [PATCH] [MTD-UTILS]: Add Optional ZLIB and LZO CFLAGS and LDFLAGS
From: Grant Erickson <gerickson@nuovations.com>
To: <linux-mtd@lists.infradead.org>
Message-ID: <C3E999E8.D9D2%gerickson@nuovations.com>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support for allowing the specification of unique CFLAGS and
LDFLAGS for both LZO and ZLIB. In addition, it allows for independently
specifying both PREFIX and EXEC_PREFIX.

The former is useful in some cross-compilation environments where the LZO
and ZLIB versions being built against are not those installed in the
standard locations.

The latter is useful when installing mtd-utils in a multi-architecture
installation area.

Compiled, linked and tested successfully in both a i686-unknown-linux to
powerpc-unknown-linux cross-compilation environment as well as a native
i686-unknown-linux environment

Signed-off-by: Grant Erickson <gerickson@nuovations.com>

---
diff -aruN mtd-utils-1.1.0/Makefile mtd-utils-1.1.0.N/Makefile
--- mtd-utils-1.1.0/Makefile    2007-08-03 06:55:51.000000000 -0700
+++ mtd-utils-1.1.0.N/Makefile    2008-02-26 09:51:46.000000000 -0800
@@ -1,12 +1,14 @@
 
 # -*- sh -*-
 
-SBINDIR=/usr/sbin
-MANDIR=/usr/man
-INCLUDEDIR=/usr/include
+PREFIX=/usr
+EXEC_PREFIX=$(PREFIX)
+SBINDIR=$(EXEC_PREFIX)/sbin
+MANDIR=$(PREFIX)/man
+INCLUDEDIR=$(PREFIX)/include
 #CROSS=arm-linux-
 CC := $(CROSS)gcc
-CFLAGS := -I./include -O2 -Wall
+CFLAGS := -I./include $(ZLIBCFLAGS) $(LZOCFLAGS) -O2 -Wall
 
 ifeq ($(origin CROSS),undefined)
   BUILDDIR := .
@@ -58,7 +60,7 @@
             $(BUILDDIR)/compr_zlib.o \
             $(BUILDDIR)/compr_lzo.o \
             $(BUILDDIR)/compr.o
-    $(CC) $(LDFLAGS) -o $@ $^ -lz -llzo2
+    $(CC) $(LDFLAGS) -o $@ $^ $(ZLIBLDFLAGS) -lz $(LZOLDFLAGS) -llzo2
 
 $(BUILDDIR)/flash_eraseall: $(BUILDDIR)/crc32.o
$(BUILDDIR)/flash_eraseall.o
     $(CC) $(LDFLAGS) -o $@ $^
--
