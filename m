Received: from fg-out-1718.google.com ([72.14.220.156])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqc3q-00049M-1c
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 23:15:18 +0000
Received: by fg-out-1718.google.com with SMTP id l26so165587fgb.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Oct 2008 16:15:17 -0700 (PDT)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/6] [MTD] sharpsl_nand: move io addr to struct sharpsl_nand
Date: Fri, 17 Oct 2008 03:15:06 +0400
Message-Id: <1224198909-17568-3-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1224198909-17568-2-git-send-email-dbaryshkov@gmail.com>
References: <20081016231127.GA17131@doriath.ww600.siemens.net>
	<1224198909-17568-1-git-send-email-dbaryshkov@gmail.com>
	<1224198909-17568-2-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, Eric Miao <eric.miao@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/sharpsl.c |   59 +++++++++++++++++++++++--------------------
 1 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 6851806..328e02e 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -29,18 +29,20 @@
 struct sharpsl_nand {
 	struct mtd_info		mtd;
 	struct nand_chip	chip;
+
+	void __iomem		*io;
 };
 
-static void __iomem *sharpsl_io_base;
+#define mtd_to_sharpsl(_mtd)	container_of(_mtd, struct sharpsl_nand, mtd)
 
 /* register offset */
-#define ECCLPLB	 	sharpsl_io_base+0x00	/* line parity 7 - 0 bit */
-#define ECCLPUB	 	sharpsl_io_base+0x04	/* line parity 15 - 8 bit */
-#define ECCCP	   	sharpsl_io_base+0x08	/* column parity 5 - 0 bit */
-#define ECCCNTR	 	sharpsl_io_base+0x0C	/* ECC byte counter */
-#define ECCCLRR	 	sharpsl_io_base+0x10	/* cleare ECC */
-#define FLASHIO	 	sharpsl_io_base+0x14	/* Flash I/O */
-#define FLASHCTL	sharpsl_io_base+0x18	/* Flash Control */
+#define ECCLPLB		0x00	/* line parity 7 - 0 bit */
+#define ECCLPUB		0x04	/* line parity 15 - 8 bit */
+#define ECCCP		0x08	/* column parity 5 - 0 bit */
+#define ECCCNTR		0x0C	/* ECC byte counter */
+#define ECCCLRR		0x10	/* cleare ECC */
+#define FLASHIO		0x14	/* Flash I/O */
+#define FLASHCTL	0x18	/* Flash Control */
 
 /* Flash control bit */
 #define FLRYBY		(1 << 5)
@@ -85,6 +87,7 @@ static struct mtd_partition sharpsl_nand_default_partition_info[] = {
 static void sharpsl_nand_hwcontrol(struct mtd_info *mtd, int cmd,
 				   unsigned int ctrl)
 {
+	struct sharpsl_nand *sharpsl = mtd_to_sharpsl(mtd);
 	struct nand_chip *chip = mtd->priv;
 
 	if (ctrl & NAND_CTRL_CHANGE) {
@@ -94,7 +97,7 @@ static void sharpsl_nand_hwcontrol(struct mtd_info *mtd, int cmd,
 
 		bits ^= 0x11;
 
-		writeb((readb(FLASHCTL) & ~0x17) | bits, FLASHCTL);
+		writeb((readb(sharpsl->io + FLASHCTL) & ~0x17) | bits, sharpsl->io + FLASHCTL);
 	}
 
 	if (cmd != NAND_CMD_NONE)
@@ -128,20 +131,23 @@ static struct nand_ecclayout akita_oobinfo = {
 
 static int sharpsl_nand_dev_ready(struct mtd_info *mtd)
 {
-	return !((readb(FLASHCTL) & FLRYBY) == 0);
+	struct sharpsl_nand *sharpsl = mtd_to_sharpsl(mtd);
+	return !((readb(sharpsl->io + FLASHCTL) & FLRYBY) == 0);
 }
 
 static void sharpsl_nand_enable_hwecc(struct mtd_info *mtd, int mode)
 {
-	writeb(0, ECCCLRR);
+	struct sharpsl_nand *sharpsl = mtd_to_sharpsl(mtd);
+	writeb(0, sharpsl->io + ECCCLRR);
 }
 
 static int sharpsl_nand_calculate_ecc(struct mtd_info *mtd, const u_char * dat, u_char * ecc_code)
 {
-	ecc_code[0] = ~readb(ECCLPUB);
-	ecc_code[1] = ~readb(ECCLPLB);
-	ecc_code[2] = (~readb(ECCCP) << 2) | 0x03;
-	return readb(ECCCNTR) != 0;
+	struct sharpsl_nand *sharpsl = mtd_to_sharpsl(mtd);
+	ecc_code[0] = ~readb(sharpsl->io + ECCLPUB);
+	ecc_code[1] = ~readb(sharpsl->io + ECCLPLB);
+	ecc_code[2] = (~readb(sharpsl->io + ECCCP) << 2) | 0x03;
+	return readb(sharpsl->io + ECCCNTR) != 0;
 }
 
 #ifdef CONFIG_MTD_PARTITIONS
@@ -174,8 +180,8 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 	}
 
 	/* map physical address */
-	sharpsl_io_base = ioremap(r->start, resource_size(r));
-	if (!sharpsl_io_base) {
+	sharpsl->io = ioremap(r->start, resource_size(r));
+	if (!sharpsl->io) {
 		printk("ioremap to access Sharp SL NAND chip failed\n");
 		err = -EIO;
 		goto err_ioremap;
@@ -193,11 +199,11 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 	/*
 	 * PXA initialize
 	 */
-	writeb(readb(FLASHCTL) | FLWP, FLASHCTL);
+	writeb(readb(sharpsl->io + FLASHCTL) | FLWP, sharpsl->io + FLASHCTL);
 
 	/* Set address of NAND IO lines */
-	this->IO_ADDR_R = FLASHIO;
-	this->IO_ADDR_W = FLASHIO;
+	this->IO_ADDR_R = sharpsl->io + FLASHIO;
+	this->IO_ADDR_W = sharpsl->io + FLASHIO;
 	/* Set address of hardware control function */
 	this->cmd_ctrl = sharpsl_nand_hwcontrol;
 	this->dev_ready = sharpsl_nand_dev_ready;
@@ -218,12 +224,8 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 
 	/* Scan to find existence of the device */
 	err = nand_scan(&sharpsl->mtd, 1);
-	if (err) {
-		platform_set_drvdata(pdev, NULL);
-		iounmap(sharpsl_io_base);
-		kfree(sharpsl);
-		return err;
-	}
+	if (err)
+		goto err_scan;
 
 	/* Register the partitions */
 	sharpsl->mtd.name = "sharpsl-nand";
@@ -252,6 +254,9 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 	/* Return happy */
 	return 0;
 
+err_scan:
+	platform_set_drvdata(pdev, NULL);
+	iounmap(sharpsl->io);
 err_ioremap:
 err_get_res:
 	kfree(sharpsl);
@@ -270,7 +275,7 @@ static int __devexit sharpsl_nand_remove(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, NULL);
 
-	iounmap(sharpsl_io_base);
+	iounmap(sharpsl->io);
 
 	/* Free the MTD device structure */
 	kfree(sharpsl);
-- 
1.5.6.5
