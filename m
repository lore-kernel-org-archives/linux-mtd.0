Message-Id: <20100420092725.309616905@fluff.org.uk>
Date: Tue, 20 Apr 2010 10:26:18 +0100
From: Ben Dooks <ben@simtec.co.uk>
To: linux-arm-kernel@lists.infradead.org
Subject: [patch 1/4] orion/kirkwood: add RnB line support to orion mtd driver
References: <20100420092617.075835456@fluff.org.uk>
Content-Disposition: inline;
	filename=slinux/arm/kirkwood/mtd-ready-not-busy-support.patch
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for a board to register a callback to get the state of the
RnB line if it has it attached.

Signed-off-by: Ben Dooks <ben@simtec.co.uk>
Cc: Linux MTD <linux-mtd@lists.infradead.org>

Index: linux-2.6-2.6.32.9/arch/arm/plat-orion/include/plat/orion_nand.h
===================================================================
--- linux-2.6-2.6.32.9.orig/arch/arm/plat-orion/include/plat/orion_nand.h	2010-02-23 15:38:51.%N +0000
+++ linux-2.6-2.6.32.9/arch/arm/plat-orion/include/plat/orion_nand.h	2010-03-11 13:24:27.%N +0000
@@ -14,6 +14,7 @@
  */
 struct orion_nand_data {
 	struct mtd_partition *parts;
+	int (*dev_ready)(struct mtd_info *mtd);
 	u32 nr_parts;
 	u8 ale;		/* address line number connected to ALE */
 	u8 cle;		/* address line number connected to CLE */
Index: linux-2.6-2.6.32.9/drivers/mtd/nand/orion_nand.c
===================================================================
--- linux-2.6-2.6.32.9.orig/drivers/mtd/nand/orion_nand.c	2010-02-23 15:38:51.%N +0000
+++ linux-2.6-2.6.32.9/drivers/mtd/nand/orion_nand.c	2010-03-11 13:24:27.%N +0000
@@ -114,6 +114,9 @@
 	if (board->width == 16)
 		nc->options |= NAND_BUSWIDTH_16;
 
+	if (board->dev_ready)
+		nc->dev_ready = board->dev_ready;
+
 	platform_set_drvdata(pdev, mtd);
 
 	if (nand_scan(mtd, 1)) {
