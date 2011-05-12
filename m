Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKVvO-000297-2O
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 13:27:30 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so1274214wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 06:27:29 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 6/7] mtd/plat_nand: convert to mtd_device_register()
Date: Thu, 12 May 2011 14:26:57 +0100
Message-Id: <1305206818-31752-7-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
References: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 drivers/mtd/nand/plat_nand.c |   14 +++-----------
 1 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index caf5a73..e28bd03 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -21,10 +21,8 @@ struct plat_nand_data {
 	struct nand_chip	chip;
 	struct mtd_info		mtd;
 	void __iomem		*io_base;
-#ifdef CONFIG_MTD_PARTITIONS
 	int			nr_parts;
 	struct mtd_partition	*parts;
-#endif
 };
 
 /*
@@ -101,7 +99,6 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-#ifdef CONFIG_MTD_PARTITIONS
 	if (pdata->chip.part_probe_types) {
 		err = parse_mtd_partitions(&data->mtd,
 					pdata->chip.part_probe_types,
@@ -113,14 +110,11 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 	}
 	if (pdata->chip.set_parts)
 		pdata->chip.set_parts(data->mtd.size, &pdata->chip);
-	if (pdata->chip.partitions) {
+	if (pdata->chip.partitions)
 		data->parts = pdata->chip.partitions;
-		err = add_mtd_partitions(&data->mtd, data->parts,
-			pdata->chip.nr_partitions);
-	} else
-#endif
-	err = add_mtd_device(&data->mtd);
 
+	err = mtd_device_register(&data->mtd, data->parts,
+				  pdata->chip.nr_partitions);
 	if (!err)
 		return err;
 
@@ -149,10 +143,8 @@ static int __devexit plat_nand_remove(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	nand_release(&data->mtd);
-#ifdef CONFIG_MTD_PARTITIONS
 	if (data->parts && data->parts != pdata->chip.partitions)
 		kfree(data->parts);
-#endif
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
 	iounmap(data->io_base);
-- 
1.7.4.4
