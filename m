Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P7FDn-0007J3-UW
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 22:27:25 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: Blackfin NFC: fix badblock location with BootROM OOB
Date: Sat, 16 Oct 2010 18:26:59 -0400
Message-Id: <1287268019-9426-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The bbt structure isn't actually used, just the badblockpos.  This lets
the driver correctly handle badblocks with the different OOB layout with
certain sized flashes.  Previously, the blocks would all be reported as
bad and be completely unusable.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/nand/bf5xx_nand.c |   14 ++++----------
 1 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 6fbeefa..79947be 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -110,15 +110,6 @@ static const unsigned short bfin_nfc_pin_req[] =
 	 0};
 
 #ifdef CONFIG_MTD_NAND_BF5XX_BOOTROM_ECC
-static uint8_t bbt_pattern[] = { 0xff };
-
-static struct nand_bbt_descr bootrom_bbt = {
-	.options = 0,
-	.offs = 63,
-	.len = 1,
-	.pattern = bbt_pattern,
-};
-
 static struct nand_ecclayout bootrom_ecclayout = {
 	.eccbytes = 24,
 	.eccpos = {
@@ -809,7 +800,6 @@ static int __devinit bf5xx_nand_probe(struct platform_device *pdev)
 	/* setup hardware ECC data struct */
 	if (hardware_ecc) {
 #ifdef CONFIG_MTD_NAND_BF5XX_BOOTROM_ECC
-		chip->badblock_pattern = &bootrom_bbt;
 		chip->ecc.layout = &bootrom_ecclayout;
 #endif
 		chip->read_buf      = bf5xx_nand_dma_read_buf;
@@ -830,6 +820,10 @@ static int __devinit bf5xx_nand_probe(struct platform_device *pdev)
 		goto out_err_nand_scan;
 	}
 
+#ifdef CONFIG_MTD_NAND_BF5XX_BOOTROM_ECC
+	chip->badblockpos = 63;
+#endif
+
 	/* add NAND partition */
 	bf5xx_nand_add_partition(info);
 
-- 
1.7.3.1
