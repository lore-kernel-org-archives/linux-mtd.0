Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZJt6-00040t-B3
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 09:38:21 +0000
Received: by mail-wy0-f177.google.com with SMTP id 23so536878wyf.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2011 02:38:20 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/18] mtd: fsl_elbc_nand: use ofpart through generic parsing
Date: Wed, 22 Jun 2011 13:37:39 +0400
Message-Id: <1308735472-32640-6-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1308735472-32640-1-git-send-email-dbaryshkov@gmail.com>
References: <1308735472-32640-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
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
 drivers/mtd/nand/fsl_elbc_nand.c |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index d4ea5fe..4d225ba 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -842,13 +842,15 @@ static int __devinit fsl_elbc_nand_probe(struct platform_device *pdev)
 	struct resource res;
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl;
 	static const char *part_probe_types[]
-		= { "cmdlinepart", "RedBoot", NULL };
+		= { "cmdlinepart", "RedBoot", "ofpart", NULL };
 	struct mtd_partition *parts;
 	int ret;
 	int bank;
 	struct device *dev;
 	struct device_node *node = pdev->dev.of_node;
+	struct mtd_part_parser_data ppdata;
 
+	ppdata.of_node = pdev->dev.of_node;
 	if (!fsl_lbc_ctrl_dev || !fsl_lbc_ctrl_dev->regs)
 		return -ENODEV;
 	lbc = fsl_lbc_ctrl_dev->regs;
@@ -934,16 +936,10 @@ static int __devinit fsl_elbc_nand_probe(struct platform_device *pdev)
 
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
-	ret = parse_mtd_partitions(&priv->mtd, part_probe_types, &parts, 0);
+	ret = parse_mtd_partitions(&priv->mtd, part_probe_types, &parts, &ppdata);
 	if (ret < 0)
 		goto err;
 
-	if (ret == 0) {
-		ret = of_mtd_parse_partitions(priv->dev, node, &parts);
-		if (ret < 0)
-			goto err;
-	}
-
 	mtd_device_register(&priv->mtd, parts, ret);
 
 	printk(KERN_INFO "eLBC NAND device at 0x%llx, bank %d\n",
-- 
1.7.5.3
