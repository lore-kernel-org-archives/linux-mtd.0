Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu0le-00017U-Py
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 16:18:37 +0000
Received: by qkcn129 with SMTP id n129so22060866qkc.1
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2015 08:18:12 -0800 (PST)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 4/6] mtd: pxa3xx_nand: Remove redundant NAND sensing
Date: Wed,  4 Nov 2015 13:13:44 -0300
Message-Id: <1446653626-14802-5-git-send-email-ezequiel@vanguardiasur.com.ar>
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

Currently, the driver is trying to detect the presence of a chip
by issuing a RESET command before nand_scan_ident. This seems completely
redundant, and is also a layering violation as nand_scan_ident is in charge
of device detection.

This commit removes the RESET command use, and moves the initial
timing configuration to pxa3xx_nand_config_ident.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/pxa3xx_nand.c | 41 ++++++++---------------------------------
 1 file changed, 8 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index fd8658a9281e..89c02f7057fd 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1389,8 +1389,10 @@ static int pxa3xx_nand_waitfunc(struct mtd_info *mtd, struct nand_chip *this)
 
 static int pxa3xx_nand_config_ident(struct pxa3xx_nand_info *info)
 {
+	struct pxa3xx_nand_host *host = info->host[info->cs];
 	struct platform_device *pdev = info->pdev;
 	struct pxa3xx_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	const struct nand_sdr_timings *timings;
 
 	/* Configure default flash values */
 	info->chunk_size = PAGE_CHUNK_SIZE;
@@ -1399,6 +1401,12 @@ static int pxa3xx_nand_config_ident(struct pxa3xx_nand_info *info)
 	info->reg_ndcr |= NDCR_RD_ID_CNT(READ_ID_BYTES);
 	info->reg_ndcr |= NDCR_SPARE_EN;
 
+	/* use the common timing to make a try */
+	timings = onfi_async_timing_mode_to_sdr_timings(0);
+	if (IS_ERR(timings))
+		return PTR_ERR(timings);
+
+	pxa3xx_nand_set_sdr_timing(host, timings);
 	return 0;
 }
 
@@ -1491,32 +1499,6 @@ static void pxa3xx_nand_free_buff(struct pxa3xx_nand_info *info)
 	kfree(info->data_buff);
 }
 
-static int pxa3xx_nand_sensing(struct pxa3xx_nand_host *host)
-{
-	struct pxa3xx_nand_info *info = host->info_data;
-	struct mtd_info *mtd;
-	struct nand_chip *chip;
-	const struct nand_sdr_timings *timings;
-	int ret;
-
-	mtd = info->host[info->cs]->mtd;
-	chip = mtd->priv;
-
-	/* use the common timing to make a try */
-	timings = onfi_async_timing_mode_to_sdr_timings(0);
-	if (IS_ERR(timings))
-		return PTR_ERR(timings);
-
-	pxa3xx_nand_set_sdr_timing(host, timings);
-
-	chip->cmdfunc(mtd, NAND_CMD_RESET, 0, 0);
-	ret = chip->waitfunc(mtd, chip);
-	if (ret & NAND_STATUS_FAIL)
-		return -ENODEV;
-
-	return 0;
-}
-
 static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 			struct nand_ecc_ctrl *ecc,
 			int strength, int ecc_stepsize, int page_size)
@@ -1602,13 +1584,6 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 		ret = pxa3xx_nand_config_ident(info);
 		if (ret)
 			return ret;
-		ret = pxa3xx_nand_sensing(host);
-		if (ret) {
-			dev_info(&info->pdev->dev,
-				 "There is no chip on cs %d!\n",
-				 info->cs);
-			return ret;
-		}
 	}
 
 	if (info->reg_ndcr & NDCR_DWIDTH_M)
-- 
2.5.2
