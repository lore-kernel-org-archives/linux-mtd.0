Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OMLuh-0005D2-KX
	for linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 14:05:52 +0000
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
	by mailout1.w1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0L3R00A5935MU0@mailout1.w1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 15:05:46 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
	by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul
	14 2004)) with ESMTPA id <0L3R00JEE35LAL@spt1.w1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 15:05:46 +0100 (BST)
Date: Wed, 09 Jun 2010 16:05:32 +0200
From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/4] s5pc110: Implement s5pc110 chip_probe for OneNAND probe
In-reply-to: <1276092335-3245-1-git-send-email-m.szyprowski@samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <1276092335-3245-3-git-send-email-m.szyprowski@samsung.com>
MIME-version: 1.0
Content-type: TEXT/PLAIN
Content-transfer-encoding: 7BIT
References: <1276092335-3245-1-git-send-email-m.szyprowski@samsung.com>
Cc: kyungmin.park@samsung.com, m.szyprowski@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kyungmin Park <kyungmin.park@samsung.com>

This patch introduces a noop chip probe callback for OneNAND Samsung
S5PC110 driver. This way the workarounds can be removed from the
onenand_setup function and onenand framework.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

---
 drivers/mtd/onenand/samsung.c |   20 +++++++-------------
 1 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 2750317..fa4b743 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -738,6 +738,11 @@ static void s3c_unlock_all(struct mtd_info *mtd)
 	s3c_onenand_check_lock_status(mtd);
 }
 
+static int s5pc110_chip_probe(struct mtd_info *mtd)
+{
+	return 0;
+}
+
 static void s3c_onenand_setup(struct mtd_info *mtd)
 {
 	struct onenand_chip *this = mtd->priv;
@@ -757,6 +762,7 @@ static void s3c_onenand_setup(struct mtd_info *mtd)
 		/* Use generic onenand functions */
 		onenand->cmd_map = s5pc1xx_cmd_map;
 		this->read_bufferram = s5pc110_read_bufferram;
+		this->chip_probe = s5pc110_chip_probe;
 		return;
 	} else {
 		BUG();
@@ -781,7 +787,6 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	struct resource *r;
 	int size, err;
-	unsigned long onenand_ctrl_cfg = 0;
 
 	pdata = pdev->dev.platform_data;
 	/* No need to check pdata. the platform data is optional */
@@ -900,14 +905,6 @@ static int s3c_onenand_probe(struct platform_device *pdev)
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
@@ -915,10 +912,7 @@ static int s3c_onenand_probe(struct platform_device *pdev)
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
-- 
1.6.4
