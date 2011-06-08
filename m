Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUFq7-0008Nk-9M
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 10:18:20 +0000
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built
	Sep 7
	2010)) with ESMTP id <0LMG00JVZVAEN0P0@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 19:18:14 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net
	(unknown [165.213.149.150])
	by mmp1.samsung.com (Oracle Communications Messaging Exchange Server
	7u4-19.01 64bit (built Sep 7 2010)) with ESMTPA id
	<0LMG0054CVAEO670@mmp1.samsung.com>
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 19:18:14 +0900 (KST)
Date: Wed, 08 Jun 2011 19:18:04 +0900
From: Kyungmin Park <kmpark@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: OneNAND: samsung: Write DMA support
Message-id: <20110608101804.GA5527@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
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

Implement the write DMA feature. It can reduce the CPU usage when write.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 3306b5b..f24cb6f 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -712,6 +712,74 @@ normal:
 	return 0;
 }
 
+static int s5pc110_write_bufferram(struct mtd_info *mtd, int area,
+		const unsigned char *buffer, int offset, size_t count)
+{
+	struct onenand_chip *this = mtd->priv;
+	struct device *dev = &onenand->pdev->dev;
+	void __iomem *p;
+	void *buf = (void *) buffer;
+	dma_addr_t dma_src, dma_dst;
+	int err, ofs, page_dma = 0;
+
+	p = this->base + area;
+	if (ONENAND_CURRENT_BUFFERRAM(this)) {
+		if (area == ONENAND_DATARAM)
+			p += this->writesize;
+		else
+			p += mtd->oobsize;
+	}
+
+	if (count != mtd->writesize || offset & 3 || (size_t) buf & 3)
+		goto normal;
+
+	/* Handle vmalloc address */
+	if (buf >= high_memory) {
+		struct page *page;
+
+		if (((size_t) buf & PAGE_MASK) !=
+		    ((size_t) (buf + count - 1) & PAGE_MASK))
+			goto normal;
+
+		page = vmalloc_to_page(buf);
+		if (unlikely(!page))
+			goto normal;
+
+		/* Page offset */
+		ofs = ((size_t) buf & ~PAGE_MASK);
+		page_dma = 1;
+
+		/* DMA routine */
+		dma_src = dma_map_page(dev, page, ofs, count, DMA_TO_DEVICE);
+		dma_dst = onenand->phys_base + (p - this->base);
+	} else {
+		/* DMA routine */
+		dma_src = dma_map_single(dev, buf, count, DMA_TO_DEVICE);
+		dma_dst = onenand->phys_base + (p - this->base);
+	}
+
+	if (dma_mapping_error(dev, dma_src)) {
+		dev_err(dev, "Couldn't map a %d byte buffer for DMA\n", count);
+		goto normal;
+	}
+
+	err = s5pc110_dma_ops((void *) dma_dst, (void *) dma_src,
+			count, S5PC110_DMA_DIR_WRITE);
+
+	if (page_dma)
+		dma_unmap_page(dev, dma_src, count, DMA_TO_DEVICE);
+	else
+		dma_unmap_single(dev, dma_src, count, DMA_TO_DEVICE);
+
+	if (!err)
+		return 0;
+
+normal:
+	memcpy(p + offset, buffer, count);
+
+	return 0;
+}
+
 static int s5pc110_chip_probe(struct mtd_info *mtd)
 {
 	/* Now just return 0 */
@@ -844,6 +912,7 @@ static void s3c_onenand_setup(struct mtd_info *mtd)
 	} else if (onenand->type == TYPE_S5PC110) {
 		/* Use generic onenand functions */
 		this->read_bufferram = s5pc110_read_bufferram;
+		this->write_bufferram = s5pc110_write_bufferram;
 		this->chip_probe = s5pc110_chip_probe;
 		return;
 	} else {
