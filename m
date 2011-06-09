Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUg93-0007V6-06
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 14:23:38 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so1555597wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 07:23:36 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 15/17] mtd: mpc5121_nfc.c: use mtd_device_parse_register
Date: Thu,  9 Jun 2011 18:23:06 +0400
Message-Id: <1307629388-24769-18-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
References: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/mpc5121_nfc.c |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index c4e8cb9..e06bde7 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -654,7 +654,6 @@ static int __devinit mpc5121_nfc_probe(struct platform_device *op)
 	struct mpc5121_nfc_prv *prv;
 	struct resource res;
 	struct mtd_info *mtd;
-	struct mtd_partition *parts;
 	struct nand_chip *chip;
 	unsigned long regs_paddr, regs_size;
 	const __be32 *chips_no;
@@ -837,15 +836,7 @@ static int __devinit mpc5121_nfc_probe(struct platform_device *op)
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
-	retval = parse_mtd_partitions(mtd, NULL, &parts, 0);
-	if (retval < 0) {
-		dev_err(dev, "Error parsing MTD partitions!\n");
-		devm_free_irq(dev, prv->irq, mtd);
-		retval = -EINVAL;
-		goto error;
-	}
-
-	retval = mtd_device_register(mtd, parts, retval);
+	retval = mtd_device_parse_register(mtd, NULL, 0, NULL, 0);
 	if (retval) {
 		dev_err(dev, "Error adding MTD device!\n");
 		devm_free_irq(dev, prv->irq, mtd);
-- 
1.7.5.3
