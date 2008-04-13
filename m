Received: from smtp110.sbc.mail.mud.yahoo.com ([68.142.198.209])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jl5v3-0007wW-EF
	for linux-mtd@lists.infradead.org; Sun, 13 Apr 2008 17:23:09 +0000
From: David Brownell <david-b@pacbell.net>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-mtd@lists.infradead.org
Subject: [patch 2.6.25-rc9] mtd nand: fix platform driver hotplug/coldplug
Date: Sun, 13 Apr 2008 10:15:31 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200804131015.32124.david-b@pacbell.net>
Cc: kay@ascent
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kay Sievers <kay.sievers@vrfy.org>

Since 43cc71eed1250755986da4c0f9898f9a635cb3bf, the platform
modalias is prefixed with "platform:". Add MODULE_ALIAS() to the
hotpluggable MTD NAND platform drivers, to re-enable auto loading.

NOTE:  at91_nand for some reason disallows modular builds.  I'm
assuming that's just an oversight that will be fixed.

[ dbrownell@users.sourceforge.net: minor fix ]
Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
 drivers/mtd/nand/at91_nand.c  |    1 +
 drivers/mtd/nand/bf5xx_nand.c |    1 +
 drivers/mtd/nand/ndfc.c       |    2 ++
 drivers/mtd/nand/orion_nand.c |    1 +
 drivers/mtd/nand/plat_nand.c  |    1 +
 drivers/mtd/nand/s3c2410.c    |    3 +++
 6 files changed, 9 insertions(+)

--- g26.orig/drivers/mtd/nand/at91_nand.c	2008-04-13 09:26:02.000000000 -0700
+++ g26/drivers/mtd/nand/at91_nand.c	2008-04-13 09:48:45.000000000 -0700
@@ -234,3 +234,4 @@ module_exit(at91_nand_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Rick Bronson");
 MODULE_DESCRIPTION("NAND/SmartMedia driver for AT91RM9200");
+MODULE_ALIAS("platform:at91_nand");
--- g26.orig/drivers/mtd/nand/bf5xx_nand.c	2008-04-13 09:26:02.000000000 -0700
+++ g26/drivers/mtd/nand/bf5xx_nand.c	2008-04-13 09:53:59.000000000 -0700
@@ -803,3 +803,4 @@ module_exit(bf5xx_nand_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR(DRV_AUTHOR);
 MODULE_DESCRIPTION(DRV_DESC);
+MODULE_ALIAS("platform:" DRV_NAME);
--- g26.orig/drivers/mtd/nand/ndfc.c	2008-04-13 09:26:02.000000000 -0700
+++ g26/drivers/mtd/nand/ndfc.c	2008-04-13 09:48:45.000000000 -0700
@@ -317,3 +317,5 @@ module_exit(ndfc_nand_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Thomas Gleixner <tglx@linutronix.de>");
 MODULE_DESCRIPTION("Platform driver for NDFC");
+MODULE_ALIAS("platform:ndfc-chip");
+MODULE_ALIAS("platform:ndfc-nand");
--- g26.orig/drivers/mtd/nand/orion_nand.c	2008-04-13 09:26:02.000000000 -0700
+++ g26/drivers/mtd/nand/orion_nand.c	2008-04-13 09:48:45.000000000 -0700
@@ -169,3 +169,4 @@ module_exit(orion_nand_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Tzachi Perelstein");
 MODULE_DESCRIPTION("NAND glue for Orion platforms");
+MODULE_ALIAS("platform:orion_nand");
--- g26.orig/drivers/mtd/nand/plat_nand.c	2008-04-13 09:26:02.000000000 -0700
+++ g26/drivers/mtd/nand/plat_nand.c	2008-04-13 09:48:45.000000000 -0700
@@ -150,3 +150,4 @@ module_exit(plat_nand_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Vitaly Wool");
 MODULE_DESCRIPTION("Simple generic NAND driver");
+MODULE_ALIAS("platform:gen_nand");
--- g26.orig/drivers/mtd/nand/s3c2410.c	2008-04-13 09:26:02.000000000 -0700
+++ g26/drivers/mtd/nand/s3c2410.c	2008-04-13 09:48:45.000000000 -0700
@@ -927,3 +927,6 @@ module_exit(s3c2410_nand_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
 MODULE_DESCRIPTION("S3C24XX MTD NAND driver");
+MODULE_ALIAS("platform:s3c2410-nand");
+MODULE_ALIAS("platform:s3c2412-nand");
+MODULE_ALIAS("platform:s3c2440-nand");
