Received: from mail-ye0-x236.google.com ([2607:f8b0:4002:c04::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V0xoC-0005Gj-Qc
 for linux-mtd@lists.infradead.org; Sun, 21 Jul 2013 17:52:37 +0000
Received: by mail-ye0-f182.google.com with SMTP id m12so1888900yen.41
 for <linux-mtd@lists.infradead.org>; Sun, 21 Jul 2013 10:52:13 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] nand: mxc_nand: Remove unneeded check for
 platform_get_resource()
Date: Sun, 21 Jul 2013 14:52:02 -0300
Message-Id: <1374429122-15514-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, s.hauer@pengutronix.de,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

devm_ioremap_resource() checks its arguments, so there is no need for
explicitly checking the return value from platform_get_resource().

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/mxc_nand.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 18855ad..0581bd3 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1446,8 +1446,6 @@ static int mxcnd_probe(struct platform_device *pdev)
 
 	if (host->devtype_data->needs_ip) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		if (!res)
-			return -ENODEV;
 		host->regs_ip = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(host->regs_ip))
 			return PTR_ERR(host->regs_ip);
@@ -1457,9 +1455,6 @@ static int mxcnd_probe(struct platform_device *pdev)
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	}
 
-	if (!res)
-		return -ENODEV;
-
 	host->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(host->base))
 		return PTR_ERR(host->base);
-- 
1.8.1.2
