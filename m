Received: from mail-qg0-x235.google.com ([2607:f8b0:400d:c04::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu0lb-00017P-U7
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 16:18:33 +0000
Received: by qgeo38 with SMTP id o38so44608539qge.0
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2015 08:18:10 -0800 (PST)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 3/6] nand: pxa3xx: Simplify pxa3xx_nand_scan
Date: Wed,  4 Nov 2015 13:13:43 -0300
Message-Id: <1446653626-14802-4-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit simplifies the initial configuration performed
by pxa3xx_nand_scan. No functionality change is intended.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/pxa3xx_nand.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index a82f52d150f8..fd8658a9281e 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1413,7 +1413,7 @@ static void pxa3xx_nand_config_tail(struct pxa3xx_nand_info *info)
 	info->reg_ndcr |= (mtd->writesize == 2048) ? NDCR_PAGE_SZ : 0;
 }
 
-static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
+static void pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 {
 	struct platform_device *pdev = info->pdev;
 	struct pxa3xx_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -1426,7 +1426,6 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 	info->reg_ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
 	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
 	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
-	return 0;
 }
 
 static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
@@ -1597,22 +1596,21 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	int ret;
 	uint16_t ecc_strength, ecc_step;
 
-	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
-		goto KEEP_CONFIG;
-
-	ret = pxa3xx_nand_config_ident(info);
-	if (ret)
-		return ret;
-
-	ret = pxa3xx_nand_sensing(host);
-	if (ret) {
-		dev_info(&info->pdev->dev, "There is no chip on cs %d!\n",
-			 info->cs);
-
-		return ret;
+	if (pdata->keep_config) {
+		pxa3xx_nand_detect_config(info);
+	} else {
+		ret = pxa3xx_nand_config_ident(info);
+		if (ret)
+			return ret;
+		ret = pxa3xx_nand_sensing(host);
+		if (ret) {
+			dev_info(&info->pdev->dev,
+				 "There is no chip on cs %d!\n",
+				 info->cs);
+			return ret;
+		}
 	}
 
-KEEP_CONFIG:
 	if (info->reg_ndcr & NDCR_DWIDTH_M)
 		chip->options |= NAND_BUSWIDTH_16;
 
-- 
2.5.2
