Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGnYY-0003MW-OZ
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 09:05:24 +0000
Received: by bkwj4 with SMTP id j4so154613bkw.36
 for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2012 02:05:20 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: sh_flctl: Add device tree support
Date: Wed, 26 Sep 2012 11:05:05 +0200
Message-Id: <1348650306-15492-2-git-send-email-hechtb@gmail.com>
In-Reply-To: <1348650306-15492-1-git-send-email-hechtb@gmail.com>
References: <1348650306-15492-1-git-send-email-hechtb@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The flctl can now be probed via device tree setup in addition to the
existing platform data way.

SoC specific setup data is set in the .data member of the OF match, so
kept within the driver itself, while board/user specific setup - like
partitioning - is taken from the device tree.

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
 drivers/mtd/nand/sh_flctl.c |   84 +++++++++++++++++++++++++++++++++++++++----
 1 files changed, 77 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 8f0bed1..472c27e 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -28,6 +28,9 @@
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_mtd.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
@@ -1020,6 +1023,65 @@ static irqreturn_t flctl_handle_flste(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+#ifdef CONFIG_OF
+struct flctl_soc_config {
+	unsigned long flcmncr_val;
+	unsigned has_hwecc:1;
+	unsigned use_holden:1;
+};
+
+static const struct of_device_id of_flctl_match[] = {
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_flctl_match);
+
+static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
+{
+	const struct of_device_id *match;
+	struct flctl_soc_config *config;
+	struct sh_flctl_platform_data *pdata;
+	struct device_node *dn = dev->of_node;
+	int ret;
+
+	match = of_match_device(of_flctl_match, dev);
+	if (match)
+		config = (struct flctl_soc_config *)match->data;
+	else {
+		dev_err(dev, "%s: no OF configuration attached\n", __func__);
+		return NULL;
+	}
+
+	pdata = devm_kzalloc(dev, sizeof(struct sh_flctl_platform_data),
+								GFP_KERNEL);
+	if (!pdata) {
+		dev_err(dev, "%s: failed to allocate config data\n", __func__);
+		return NULL;
+	}
+
+	/* set SoC specific options */
+	pdata->flcmncr_val = config->flcmncr_val;
+	pdata->has_hwecc = config->has_hwecc;
+	pdata->use_holden = config->use_holden;
+
+	/* parse user defined options */
+	ret = of_get_nand_bus_width(dn);
+	if (ret == 16)
+		pdata->flcmncr_val |= SEL_16BIT;
+	else if (ret != 8) {
+		dev_err(dev, "%s: invalid bus width\n", __func__);
+		return NULL;
+	}
+
+	return pdata;
+}
+#else /* CONFIG_OF */
+#define of_flctl_match NULL
+static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
+{
+	return NULL;
+}
+#endif /* CONFIG_OF */
+
 static int __devinit flctl_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -1029,12 +1091,7 @@ static int __devinit flctl_probe(struct platform_device *pdev)
 	struct sh_flctl_platform_data *pdata;
 	int ret = -ENXIO;
 	int irq;
-
-	pdata = pdev->dev.platform_data;
-	if (pdata == NULL) {
-		dev_err(&pdev->dev, "no platform data defined\n");
-		return -EINVAL;
-	}
+	struct mtd_part_parser_data ppdata = {};
 
 	flctl = kzalloc(sizeof(struct sh_flctl), GFP_KERNEL);
 	if (!flctl) {
@@ -1066,6 +1123,16 @@ static int __devinit flctl_probe(struct platform_device *pdev)
 		goto err_flste;
 	}
 
+	if (pdev->dev.of_node)
+		pdata = flctl_parse_dt(&pdev->dev);
+	else
+		pdata = pdev->dev.platform_data;
+
+	if (!pdata) {
+		dev_err(&pdev->dev, "no setup data defined\n");
+		return -EINVAL;
+	}
+
 	platform_set_drvdata(pdev, flctl);
 	flctl_mtd = &flctl->mtd;
 	nand = &flctl->chip;
@@ -1108,7 +1175,9 @@ static int __devinit flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_chip;
 
-	mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	ppdata.of_node = pdev->dev.of_node;
+	ret = mtd_device_parse_register(flctl_mtd, NULL, &ppdata, pdata->parts,
+			pdata->nr_parts);
 
 	return 0;
 
@@ -1142,6 +1211,7 @@ static struct platform_driver flctl_driver = {
 	.driver = {
 		.name	= "sh_flctl",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_flctl_match,
 	},
 };
 
-- 
1.7.5.4
