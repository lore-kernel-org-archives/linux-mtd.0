Received: from [213.86.99.234] (helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19hu6v-00033C-RC
	for <linux-mtd@lists.infradead.org>; Wed, 30 Jul 2003 17:47:33 +0100
Received: from hermes.fachschaften.tu-muenchen.de ([129.187.202.12])
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 19hu6s-000090-00
	for linux-mtd@lists.infradead.org; Wed, 30 Jul 2003 17:47:30 +0100
Date: Wed, 30 Jul 2003 18:47:24 +0200
From: Adrian Bunk <bunk@fs.tum.de>
To: dwmw2@redhat.com
Message-ID: <20030730164724.GA21734@fs.tum.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
cc: linux-kernel@vger.kernel.org
cc: trivial@rustcorp.com.au
Subject: [patch] mtd/ftl.c: remove always false comparison
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[resent with a subject]

gcc 3.3 correctly gives the following warning:

<--  snip  -->

...
  CC      drivers/mtd/ftl.o
drivers/mtd/ftl.c: In function `scan_header':
drivers/mtd/ftl.c:191: warning: comparison is always false due to 
limited range 
...

<--  snip  -->

Looking at the code it seems gcc is correct, a 16bit number can _never_
be > 65536.

The following patch removes this comparison:


--- linux-2.6.0-test2-full/drivers/mtd/ftl.c.old	2003-07-30 13:04:05.000000000 +0200
+++ linux-2.6.0-test2-full/drivers/mtd/ftl.c	2003-07-30 13:04:13.000000000 +0200
@@ -188,7 +188,7 @@
 	printk(KERN_NOTICE "ftl_cs: FTL header not found.\n");
 	return -ENOENT;
     }
-    if ((le16_to_cpu(header.NumEraseUnits) > 65536) || header.BlockSize != 9 ||
+    if (header.BlockSize != 9 ||
 	(header.EraseUnitSize < 10) || (header.EraseUnitSize > 31) ||
 	(header.NumTransferUnits >= le16_to_cpu(header.NumEraseUnits))) {
 	printk(KERN_NOTICE "ftl_cs: FTL header corrupt!\n");



I've tested the compilation with 2.6.0-test2 and 2.4.22-pre9.


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
