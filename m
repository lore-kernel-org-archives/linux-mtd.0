Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PD5gd-0000oV-Hz
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2010 01:29:21 +0000
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0LB800A7VHGBMB80@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 02 Nov 2010 10:28:59 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0LB8007QSHGC0D@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 02 Nov 2010 10:29:00 +0900 (KST)
Date: Tue, 02 Nov 2010 10:28:46 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH] mtd: OneNAND: Fix page offset handling at 2KiB pagesize
To: linux-mtd@lists.infradead.org
Message-id: <20101102012846.GA2470@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Cc: dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kyungmin Park <kyungmin.park@samsung.com>

When use the 2KiB pagesize, it should be set the correct page offset.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 0de7a05..a4c74a9 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -651,7 +651,7 @@ static int s5pc110_read_bufferram(struct mtd_info *mtd, int area,
 	void __iomem *p;
 	void *buf = (void *) buffer;
 	dma_addr_t dma_src, dma_dst;
-	int err, page_dma = 0;
+	int err, ofs, page_dma = 0;
 	struct device *dev = &onenand->pdev->dev;
 
 	p = this->base + area;
@@ -677,10 +677,13 @@ static int s5pc110_read_bufferram(struct mtd_info *mtd, int area,
 		if (!page)
 			goto normal;
 
+		/* Page offset */
+		ofs = ((size_t) buf & ~PAGE_MASK);
 		page_dma = 1;
+
 		/* DMA routine */
 		dma_src = onenand->phys_base + (p - this->base);
-		dma_dst = dma_map_page(dev, page, 0, count, DMA_FROM_DEVICE);
+		dma_dst = dma_map_page(dev, page, ofs, count, DMA_FROM_DEVICE);
 	} else {
 		/* DMA routine */
 		dma_src = onenand->phys_base + (p - this->base);
