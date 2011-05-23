Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORO9-0002TB-JD
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:27 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:25 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 40/62] mtd/fsl_elbc_nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:21 +0100
Message-Id: <1306142623-24952-41-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/fsl_elbc_nand.c |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 537e380..0bb254c 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -841,12 +841,9 @@ static int __devinit fsl_elbc_nand_probe(struct platform_device *pdev)
 	struct fsl_elbc_mtd *priv;
 	struct resource res;
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl;
-
-#ifdef CONFIG_MTD_PARTITIONS
 	static const char *part_probe_types[]
 		= { "cmdlinepart", "RedBoot", NULL };
 	struct mtd_partition *parts;
-#endif
 	int ret;
 	int bank;
 	struct device *dev;
@@ -935,26 +932,19 @@ static int __devinit fsl_elbc_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
-#ifdef CONFIG_MTD_PARTITIONS
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
 	ret = parse_mtd_partitions(&priv->mtd, part_probe_types, &parts, 0);
 	if (ret < 0)
 		goto err;
 
-#ifdef CONFIG_MTD_OF_PARTS
 	if (ret == 0) {
 		ret = of_mtd_parse_partitions(priv->dev, node, &parts);
 		if (ret < 0)
 			goto err;
 	}
-#endif
 
-	if (ret > 0)
-		add_mtd_partitions(&priv->mtd, parts, ret);
-	else
-#endif
-		add_mtd_device(&priv->mtd);
+	mtd_device_register(&priv->mtd, parts, ret);
 
 	printk(KERN_INFO "eLBC NAND device at 0x%llx, bank %d\n",
 	       (unsigned long long)res.start, priv->bank);
-- 
1.7.4.4
