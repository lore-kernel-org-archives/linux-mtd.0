Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuUQR-0002nd-9P
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 23:26:24 +0000
Received: by pabts4 with SMTP id ts4so171197943pab.3
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 16:26:01 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: plat_nand: use default partition probe
Date: Mon, 18 May 2015 16:25:35 -0700
Message-Id: <1431991535-22522-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's harmless to add 'ofpart' (the only different parser supported in
default mtdpart.c) to plat_nand. That let's us kill off one more custom
partition prober listing.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/plat_nand.c | 4 +---
 drivers/mtd/nand/xway_nand.c | 4 ----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 4535c263fae5..717cf623fcde 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -24,8 +24,6 @@ struct plat_nand_data {
 	void __iomem		*io_base;
 };
 
-static const char *part_probe_types[] = { "cmdlinepart", NULL };
-
 /*
  * Probe for the NAND device.
  */
@@ -95,7 +93,7 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	part_types = pdata->chip.part_probe_types ? : part_probe_types;
+	part_types = pdata->chip.part_probe_types;
 
 	ppdata.of_node = pdev->dev.of_node;
 	err = mtd_device_parse_register(&data->mtd, part_types, &ppdata,
diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 3f81dc8f214c..3b28db458ea0 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -160,14 +160,10 @@ static int xway_nand_probe(struct platform_device *pdev)
 	return 0;
 }
 
-/* allow users to override the partition in DT using the cmdline */
-static const char *part_probes[] = { "cmdlinepart", "ofpart", NULL };
-
 static struct platform_nand_data xway_nand_data = {
 	.chip = {
 		.nr_chips		= 1,
 		.chip_delay		= 30,
-		.part_probe_types	= part_probes,
 	},
 	.ctrl = {
 		.probe		= xway_nand_probe,
-- 
1.9.1
