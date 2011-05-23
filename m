Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROL-0002U4-IX
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:38 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359577wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:37 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 45/62] mtd/mpc5121_nfc: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:26 +0100
Message-Id: <1306142623-24952-46-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
preprocessor conditionals as partitioning is always available.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/mpc5121_nfc.c |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index 0b81b5b..2f7c930 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -131,9 +131,7 @@ struct mpc5121_nfc_prv {
 
 static void mpc5121_nfc_done(struct mtd_info *mtd);
 
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *mpc5121_nfc_pprobes[] = { "cmdlinepart", NULL };
-#endif
 
 /* Read NFC register */
 static inline u16 nfc_read(struct mtd_info *mtd, uint reg)
@@ -658,9 +656,7 @@ static int __devinit mpc5121_nfc_probe(struct platform_device *op)
 	struct mpc5121_nfc_prv *prv;
 	struct resource res;
 	struct mtd_info *mtd;
-#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *parts;
-#endif
 	struct nand_chip *chip;
 	unsigned long regs_paddr, regs_size;
 	const __be32 *chips_no;
@@ -841,7 +837,6 @@ static int __devinit mpc5121_nfc_probe(struct platform_device *op)
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
-#ifdef CONFIG_MTD_PARTITIONS
 	retval = parse_mtd_partitions(mtd, mpc5121_nfc_pprobes, &parts, 0);
 #ifdef CONFIG_MTD_OF_PARTS
 	if (retval == 0)
@@ -854,12 +849,7 @@ static int __devinit mpc5121_nfc_probe(struct platform_device *op)
 		goto error;
 	}
 
-	if (retval > 0)
-		retval = add_mtd_partitions(mtd, parts, retval);
-	else
-#endif
-		retval = add_mtd_device(mtd);
-
+	retval = mtd_device_register(mtd, parts, retval);
 	if (retval) {
 		dev_err(dev, "Error adding MTD device!\n");
 		devm_free_irq(dev, prv->irq, mtd);
-- 
1.7.4.4
