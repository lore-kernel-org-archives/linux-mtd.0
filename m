Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ck8r-0002n7-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 09:31:25 +0000
Date: Mon, 18 Feb 2002 10:42:13 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: [patch] make clean fixed for utils
Message-ID: <20020218104213.A11798@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

Make clean left a symlink. I fixed this and the cause - holding the
same information in two places.
Is it ok to check this in?

Jörn

-- 
Good warriors cause others to come to them and do not go to others.
-- Sun Tzu


--- Makefile.old	Mon Feb 18 09:22:48 2002
+++ Makefile	Mon Feb 18 09:25:09 2002
@@ -9,7 +9,7 @@
 nftl_format mkfs.jffs ftl_check nandtest nandwrite mkfs.jffs2 lock unlock \
 einfo mtd_debug fcp jffs2reader
 
-SYMLINKS = crc32.h crc32.c compr_rtime.c compr_rubin.c compr.c pushpull.h histo_mips.h compr_rubin.h
+SYMLINKS = crc32.h crc32.c compr_rtime.c compr_rubin.c compr.c pushpull.h histo_mips.h compr_rubin.h compr_zlib.c
 
 all: $(TARGETS)
 
@@ -19,7 +19,7 @@
 mkfs.jffs2.o crc32.o: crc32.h
 compr_rubin.o: pushpull.h histo_mips.h compr_rubin.h
 
-crc32.h crc32.c compr_rtime.c compr_rubin.c compr.c pushpull.h histo_mips.h compr_rubin.h compr_zlib.c:
+$(SYMLINKS):
 	ln -sf ../fs/jffs2/$@ $@
 
 mkfs.jffs2: crc32.o compr_rtime.o compr_rubin.o compr.o mkfs.jffs2.o compr_zlib.o
