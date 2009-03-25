Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmQgg-00012C-9X
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 10:50:41 +0000
Message-Id: <20090325105020.607040279@denx.de>
Date: Wed, 25 Mar 2009 11:48:37 +0100
From: Wolfgang Grandegger <wg@grandegger.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] NAND: Add support for oob size 128
References: <20090325104836.325599143@denx.de>
Content-Disposition: inline; filename=0005-NAND-support-for-oob-size-128.patch
Cc: David Woodhouse <dwmw2@infradead.org>,
	Wolfgang Grandegger <wg@grandegger.com>, Ilya Yanok <yanok@emcraft.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
Acked-by: Wolfgang Grandegger <wg@grandegger.com>
---
 drivers/mtd/nand/nand_base.c |   17 +++++++++++++++++
 include/linux/mtd/nand.h     |    2 +-
 2 files changed, 18 insertions(+), 1 deletion(-)

Index: linux-2.6/drivers/mtd/nand/nand_base.c
===================================================================
--- linux-2.6.orig/drivers/mtd/nand/nand_base.c
+++ linux-2.6/drivers/mtd/nand/nand_base.c
@@ -82,6 +82,20 @@ static struct nand_ecclayout nand_oob_64
 		 .length = 38}}
 };
 
+static struct nand_ecclayout nand_oob_128 = {
+	.eccbytes = 48,
+	.eccpos = {
+		    80,  81,  82,  83,  84,  85,  86,  87,
+		    88,  89,  90,  91,  92,  93,  94,  95,
+		    96,  97,  98,  99, 100, 101, 102, 103,
+		   104, 105, 106, 107, 108, 109, 110, 111,
+		   112, 113, 114, 115, 116, 117, 118, 119,
+		   120, 121, 122, 123, 124, 125, 126, 127},
+	.oobfree = {
+		{.offset = 2,
+		 .length = 78}}
+};
+
 static int nand_get_device(struct nand_chip *chip, struct mtd_info *mtd,
 			   int new_state);
 
@@ -2555,6 +2569,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 		case 64:
 			chip->ecc.layout = &nand_oob_64;
 			break;
+		case 128:
+			chip->ecc.layout = &nand_oob_128;
+			break;
 		default:
 			printk(KERN_WARNING "No oob scheme defined for "
 			       "oobsize %d\n", mtd->oobsize);
Index: linux-2.6/include/linux/mtd/nand.h
===================================================================
--- linux-2.6.orig/include/linux/mtd/nand.h
+++ linux-2.6/include/linux/mtd/nand.h
@@ -43,7 +43,7 @@ extern void nand_wait_ready(struct mtd_i
  * is supported now. If you add a chip with bigger oobsize/page
  * adjust this accordingly.
  */
-#define NAND_MAX_OOBSIZE	64
+#define NAND_MAX_OOBSIZE	128
 #define NAND_MAX_PAGESIZE	2048
 
 /*
