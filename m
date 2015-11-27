Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a2E2j-0001lX-4U
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2015 08:06:10 +0000
Received: by pacdm15 with SMTP id dm15so108143641pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 27 Nov 2015 00:05:48 -0800 (PST)
From: Anup Limbu <anuplimbu14@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anup Limbu <anuplimbu14@gmail.com>
Subject: [PATCH] mtd: nand: davinci: remove unnecessary if cases
Date: Fri, 27 Nov 2015 13:35:34 +0530
Message-Id: <1448611534-21142-1-git-send-email-anuplimbu14@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

remove unnecessary if cases

Signed-off-by: Anup Limbu <anuplimbu14@gmail.com>
---
 drivers/mtd/nand/davinci_nand.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index c72313d..1f86ee1 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -568,21 +568,16 @@ static struct davinci_nand_pdata
 		pdev->dev.platform_data = pdata;
 		if (!pdata)
 			return ERR_PTR(-ENOMEM);
-		if (!of_property_read_u32(pdev->dev.of_node,
-			"ti,davinci-chipselect", &prop))
-			pdev->id = prop;
-		else
+		if (of_property_read_u32(pdev->dev.of_node,
+			"ti,davinci-chipselect", &pdev->id))
 			return ERR_PTR(-EINVAL);
 
-		if (!of_property_read_u32(pdev->dev.of_node,
-			"ti,davinci-mask-ale", &prop))
-			pdata->mask_ale = prop;
-		if (!of_property_read_u32(pdev->dev.of_node,
-			"ti,davinci-mask-cle", &prop))
-			pdata->mask_cle = prop;
-		if (!of_property_read_u32(pdev->dev.of_node,
-			"ti,davinci-mask-chipsel", &prop))
-			pdata->mask_chipsel = prop;
+		of_property_read_u32(pdev->dev.of_node,
+			"ti,davinci-mask-ale", &pdata->mask_ale);
+		of_property_read_u32(pdev->dev.of_node,
+			"ti,davinci-mask-cle", &pdata->mask_cle);
+		of_property_read_u32(pdev->dev.of_node,
+			"ti,davinci-mask-chipsel", &pdata->mask_chipsel);
 		if (!of_property_read_string(pdev->dev.of_node,
 			"nand-ecc-mode", &mode) ||
 		    !of_property_read_string(pdev->dev.of_node,
@@ -594,9 +589,8 @@ static struct davinci_nand_pdata
 			if (!strncmp("hw", mode, 2))
 				pdata->ecc_mode = NAND_ECC_HW;
 		}
-		if (!of_property_read_u32(pdev->dev.of_node,
-			"ti,davinci-ecc-bits", &prop))
-			pdata->ecc_bits = prop;
+		of_property_read_u32(pdev->dev.of_node,
+			"ti,davinci-ecc-bits", &pdata->ecc_bits);
 
 		prop = of_get_nand_bus_width(pdev->dev.of_node);
 		if (0 < prop || !of_property_read_u32(pdev->dev.of_node,
-- 
1.9.1
