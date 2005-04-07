Received: from rdrz.de ([217.160.107.209])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DJVLq-0000IW-C1
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2005 07:39:11 -0400
Date: Thu, 7 Apr 2005 13:39:09 +0200
From: Raphael Zimmerer <killekulla@rdrz.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050407113909.GZ4763@rdrz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline; filename="diskonchip-MTD_PARTITIONS-fix.patch"
Subject: [patch] docmilplus.c, fix compilation error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When CONFIG_MTD_PARTITIONS is defined, docmilplus.c doesn't compile.

Index: mtd/drivers/mtd/nand/diskonchip.c
===================================================================
--- mtd.orig/drivers/mtd/nand/diskonchip.c	2005-04-06 09:48:10.622501508 +0200
+++ mtd/drivers/mtd/nand/diskonchip.c	2005-04-06 10:26:59.702684218 +0200
@@ -109,10 +109,10 @@
 #ifdef CONFIG_MTD_PARTITIONS
 static int no_autopart=0;
 module_param(no_autopart, int, 0);
+#endif
 
 static int show_firmware_partition=0;
 module_param(show_firmware_partition, int, 0);
-#endif
 
 #ifdef MTD_NAND_DISKONCHIP_BBTWRITE
 static int inftl_bbt_write=1;

--
