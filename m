Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORON-0002TB-Ta
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:40 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:39 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 46/62] mtd/mxc_nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:27 +0100
Message-Id: <1306142623-24952-47-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/mxc_nand.c |   13 ++++---------
 1 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 42a95fb..846f602 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -236,9 +236,7 @@ static struct nand_ecclayout nandv2_hw_eccoob_4k = {
 	}
 };
 
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probes[] = { "RedBoot", "cmdlinepart", NULL };
-#endif
 
 static irqreturn_t mxc_nfc_irq(int irq, void *dev_id)
 {
@@ -1220,18 +1218,15 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	}
 
 	/* Register the partitions */
-#ifdef CONFIG_MTD_PARTITIONS
 	nr_parts =
 	    parse_mtd_partitions(mtd, part_probes, &host->parts, 0);
 	if (nr_parts > 0)
-		add_mtd_partitions(mtd, host->parts, nr_parts);
+		mtd_device_register(mtd, host->parts, nr_parts);
 	else if (pdata->parts)
-		add_mtd_partitions(mtd, pdata->parts, pdata->nr_parts);
-	else
-#endif
-	{
+		mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
+	else {
 		pr_info("Registering %s as whole device\n", mtd->name);
-		add_mtd_device(mtd);
+		mtd_device_register(mtd, NULL, 0);
 	}
 
 	platform_set_drvdata(pdev, host);
-- 
1.7.4.4
