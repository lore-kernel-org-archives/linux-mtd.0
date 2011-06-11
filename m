Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVXLh-00011e-TJ
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 23:12:15 +0000
Received: by mail-ey0-f177.google.com with SMTP id 6so1530638eyh.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jun 2011 16:12:13 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/18] mtd: mpc5121_nfc: use ofpart through generic parsing
Date: Sun, 12 Jun 2011 03:11:51 +0400
Message-Id: <1307833922-21602-8-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
References: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/mpc5121_nfc.c |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index 0b61367..996ee29 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -661,6 +661,7 @@ static int __devinit mpc5121_nfc_probe(struct platform_device *op)
 	int resettime = 0;
 	int retval = 0;
 	int rev, len;
+	struct mtd_part_parser_data ppdata;
 
 	/*
 	 * Check SoC revision. This driver supports only NFC
@@ -725,6 +726,7 @@ static int __devinit mpc5121_nfc_probe(struct platform_device *op)
 	}
 
 	mtd->name = "MPC5121 NAND";
+	ppdata.of_node = dn;
 	chip->dev_ready = mpc5121_nfc_dev_ready;
 	chip->cmdfunc = mpc5121_nfc_command;
 	chip->read_byte = mpc5121_nfc_read_byte;
@@ -836,11 +838,7 @@ static int __devinit mpc5121_nfc_probe(struct platform_device *op)
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
-	retval = parse_mtd_partitions(mtd, NULL, &parts, 0);
-#ifdef CONFIG_MTD_OF_PARTS
-	if (retval == 0)
-		retval = of_mtd_parse_partitions(dev, dn, &parts);
-#endif
+	retval = parse_mtd_partitions(mtd, NULL, &parts, &ppdata);
 	if (retval < 0) {
 		dev_err(dev, "Error parsing MTD partitions!\n");
 		devm_free_irq(dev, prv->irq, mtd);
-- 
1.7.5.3
