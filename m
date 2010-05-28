Received: from mailout5.samsung.com ([203.254.224.35])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OHp72-0006nl-LR
	for linux-mtd@lists.infradead.org; Fri, 28 May 2010 02:15:53 +0000
Received: from epmmp2 (mailout5.samsung.com [203.254.224.35])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0L330086XYACNK@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 28 May 2010 11:15:48 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L3300E3IYA42S@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 28 May 2010 11:15:40 +0900 (KST)
Date: Fri, 28 May 2010 11:15:35 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH] OneNAND: Samsung SoCs use own chip_probe function
To: linux-mtd@lists.infradead.org
Message-id: <20100528021535.GA8117@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Samsung SoCs use own chip_probe function.
Don't touch the memory configuration at probe time.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 2750317..cb443af 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -630,6 +630,12 @@ normal:
 	return 0;
 }
 
+static int s5pc110_chip_probe(struct mtd_info *mtd)
+{
+	/* Now just return 0 */
+	return 0;
+}
+
 static int s3c_onenand_bbt_wait(struct mtd_info *mtd, int state)
 {
 	unsigned int flags = INT_ACT | LOAD_CMP;
@@ -757,6 +763,7 @@ static void s3c_onenand_setup(struct mtd_info *mtd)
 		/* Use generic onenand functions */
 		onenand->cmd_map = s5pc1xx_cmd_map;
 		this->read_bufferram = s5pc110_read_bufferram;
+		this->chip_probe = s5pc110_chip_probe;
 		return;
 	} else {
 		BUG();
@@ -781,7 +788,6 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	struct resource *r;
 	int size, err;
-	unsigned long onenand_ctrl_cfg = 0;
 
 	pdata = pdev->dev.platform_data;
 	/* No need to check pdata. the platform data is optional */
@@ -900,14 +906,6 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 		}
 
 		onenand->phys_base = onenand->base_res->start;
-
-		onenand_ctrl_cfg = readl(onenand->dma_addr + 0x100);
-		if ((onenand_ctrl_cfg & ONENAND_SYS_CFG1_SYNC_WRITE) &&
-		    onenand->dma_addr)
-			writel(onenand_ctrl_cfg & ~ONENAND_SYS_CFG1_SYNC_WRITE,
-					onenand->dma_addr + 0x100);
-		else
-			onenand_ctrl_cfg = 0;
 	}
 
 	if (onenand_scan(mtd, 1)) {
@@ -915,10 +913,7 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 		goto scan_failed;
 	}
 
-	if (onenand->type == TYPE_S5PC110) {
-		if (onenand_ctrl_cfg && onenand->dma_addr)
-			writel(onenand_ctrl_cfg, onenand->dma_addr + 0x100);
-	} else {
+	if (onenand->type != TYPE_S5PC110) {
 		/* S3C doesn't handle subpage write */
 		mtd->subpage_sft = 0;
 		this->subpagesize = mtd->writesize;
