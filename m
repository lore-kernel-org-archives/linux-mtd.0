Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUg8j-0007WI-Ag
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 14:23:18 +0000
Received: by wwi18 with SMTP id 18so4379386wwi.0
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 07:23:15 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/17] mtd: fsl_elbc_nand: use ofpart through generic parsing
Date: Thu,  9 Jun 2011 18:22:53 +0400
Message-Id: <1307629388-24769-5-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/fsl_elbc_nand.c |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index f3384fa..5236840 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -842,7 +842,7 @@ static int __devinit fsl_elbc_nand_probe(struct platform_device *pdev)
 	struct resource res;
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl;
 	static const char *part_probe_types[]
-		= { "cmdlinepart", "RedBoot", NULL };
+		= { "cmdlinepart", "RedBoot", "ofpart", NULL };
 	struct mtd_partition *parts;
 	int ret;
 	int bank;
@@ -910,6 +910,7 @@ static int __devinit fsl_elbc_nand_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	priv->mtd.node = pdev->dev.of_node;
 	priv->mtd.name = kasprintf(GFP_KERNEL, "%x.flash", (unsigned)res.start);
 	if (!priv->mtd.name) {
 		ret = -ENOMEM;
@@ -938,12 +939,6 @@ static int __devinit fsl_elbc_nand_probe(struct platform_device *pdev)
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
