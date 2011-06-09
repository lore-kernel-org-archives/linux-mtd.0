Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUg8l-0007V6-7i
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 14:23:20 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so1555597wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 07:23:18 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/17] mtd: mpc5121_nfc: use ofpart through generic parsing
Date: Thu,  9 Jun 2011 18:22:55 +0400
Message-Id: <1307629388-24769-7-git-send-email-dbaryshkov@gmail.com>
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

Convert the driver to use ofpart partitions parsing through the generic
parse_mtd_partitions().

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/mpc5121_nfc.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index 0b61367..c4e8cb9 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -725,6 +725,7 @@ static int __devinit mpc5121_nfc_probe(struct platform_device *op)
 	}
 
 	mtd->name = "MPC5121 NAND";
+	mtd->node = dn;
 	chip->dev_ready = mpc5121_nfc_dev_ready;
 	chip->cmdfunc = mpc5121_nfc_command;
 	chip->read_byte = mpc5121_nfc_read_byte;
@@ -837,10 +838,6 @@ static int __devinit mpc5121_nfc_probe(struct platform_device *op)
 
 	/* Register device in MTD */
 	retval = parse_mtd_partitions(mtd, NULL, &parts, 0);
-#ifdef CONFIG_MTD_OF_PARTS
-	if (retval == 0)
-		retval = of_mtd_parse_partitions(dev, dn, &parts);
-#endif
 	if (retval < 0) {
 		dev_err(dev, "Error parsing MTD partitions!\n");
 		devm_free_irq(dev, prv->irq, mtd);
-- 
1.7.5.3
