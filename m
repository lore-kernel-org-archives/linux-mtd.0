Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNy-0002U4-5W
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:15 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359577wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:13 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 35/62] mtd/cafe_nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:16 +0100
Message-Id: <1306142623-24952-36-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/cafe_nand.c |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index e06c898..87ebb4e 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -90,9 +90,7 @@ static unsigned int numtimings;
 static int timing[3];
 module_param_array(timing, int, &numtimings, 0644);
 
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
-#endif
 
 /* Hrm. Why isn't this already conditional on something in the struct device? */
 #define cafe_dev_dbg(dev, args...) do { if (debug) dev_dbg(dev, ##args); } while(0)
@@ -632,10 +630,8 @@ static int __devinit cafe_nand_probe(struct pci_dev *pdev,
 	struct cafe_priv *cafe;
 	uint32_t ctrl;
 	int err = 0;
-#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *parts;
 	int nr_parts;
-#endif
 
 	/* Very old versions shared the same PCI ident for all three
 	   functions on the chip. Verify the class too... */
@@ -804,9 +800,8 @@ static int __devinit cafe_nand_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, mtd);
 
 	/* We register the whole device first, separate from the partitions */
-	add_mtd_device(mtd);
+	mtd_device_register(mtd, NULL, 0);
 
-#ifdef CONFIG_MTD_PARTITIONS
 #ifdef CONFIG_MTD_CMDLINE_PARTS
 	mtd->name = "cafe_nand";
 #endif
@@ -814,9 +809,8 @@ static int __devinit cafe_nand_probe(struct pci_dev *pdev,
 	if (nr_parts > 0) {
 		cafe->parts = parts;
 		dev_info(&cafe->pdev->dev, "%d partitions found\n", nr_parts);
-		add_mtd_partitions(mtd, parts, nr_parts);
+		mtd_device_register(mtd, parts, nr_parts);
 	}
-#endif
 	goto out;
 
  out_irq:
@@ -838,7 +832,6 @@ static void __devexit cafe_nand_remove(struct pci_dev *pdev)
 	struct mtd_info *mtd = pci_get_drvdata(pdev);
 	struct cafe_priv *cafe = mtd->priv;
 
-	del_mtd_device(mtd);
 	/* Disable NAND IRQ in global IRQ mask register */
 	cafe_writel(cafe, ~1 & cafe_readl(cafe, GLOBAL_IRQ_MASK), GLOBAL_IRQ_MASK);
 	free_irq(pdev->irq, mtd);
-- 
1.7.4.4
