Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0XPI-00087J-Uv
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 10:27:33 +0000
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L9G00HDWD1JXXC0@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 19:27:19 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9G005J5D1JAP@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 19:27:19 +0900 (KST)
Date: Tue, 28 Sep 2010 19:27:10 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH v2 2/3] MTD: OneNAND: S5PC110: Fix wrong DMA hanlding when
	HIGHMEM
To: linux-mtd@lists.infradead.org
Message-id: <20100928102710.GA30186@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Cc: Artem.Bityutskiy@nokia.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kyungmin Park <kyungmin.park@samsung.com>

When use HIGHMEM, dma_map_single doesn't get the proper DMA address.
So use the dma_map_page in this case.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/samsung.c |   29 ++++++++++++++++++-----------
 1 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 285085a..afdb4c5 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -582,7 +582,8 @@ static int s5pc110_read_bufferram(struct mtd_info *mtd, int area,
 	void __iomem *p;
 	void *buf = (void *) buffer;
 	dma_addr_t dma_src, dma_dst;
-	int err;
+	int err, page_dma = 0;
+	struct device *dev = &onenand->pdev->dev;
 
 	p = this->base + area;
 	if (ONENAND_CURRENT_BUFFERRAM(this)) {
@@ -606,21 +607,27 @@ static int s5pc110_read_bufferram(struct mtd_info *mtd, int area,
 		page = vmalloc_to_page(buf);
 		if (!page)
 			goto normal;
-		buf = page_address(page) + ((size_t) buf & ~PAGE_MASK);
-	}
 
-	/* DMA routine */
-	dma_src = onenand->phys_base + (p - this->base);
-	dma_dst = dma_map_single(&onenand->pdev->dev,
-			buf, count, DMA_FROM_DEVICE);
-	if (dma_mapping_error(&onenand->pdev->dev, dma_dst)) {
-		dev_err(&onenand->pdev->dev,
-			"Couldn't map a %d byte buffer for DMA\n", count);
+		page_dma = 1;
+		/* DMA routine */
+		dma_src = onenand->phys_base + (p - this->base);
+		dma_dst = dma_map_page(dev, page, 0, count, DMA_FROM_DEVICE);
+	} else {
+		/* DMA routine */
+		dma_src = onenand->phys_base + (p - this->base);
+		dma_dst = dma_map_single(dev, buf, count, DMA_FROM_DEVICE);
+	}
+	if (dma_mapping_error(dev, dma_dst)) {
+		dev_err(dev, "Couldn't map a %d byte buffer for DMA\n", count);
 		goto normal;
 	}
 	err = s5pc110_dma_ops((void *) dma_dst, (void *) dma_src,
 			count, S5PC110_DMA_DIR_READ);
-	dma_unmap_single(&onenand->pdev->dev, dma_dst, count, DMA_FROM_DEVICE);
+
+	if (page_dma)
+		dma_unmap_page(dev, dma_dst, count, DMA_FROM_DEVICE);
+	else
+		dma_unmap_single(dev, dma_dst, count, DMA_FROM_DEVICE);
 
 	if (!err)
 		return 0;
-- 
1.5.3.3
