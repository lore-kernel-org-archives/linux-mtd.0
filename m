Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oop6e-0005C8-LD
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2010 02:55:53 +0000
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L7S009I1IT13GE0@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 27 Aug 2010 11:55:49 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L7S00N1UIT14S@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 27 Aug 2010 11:55:50 +0900 (KST)
Date: Fri, 27 Aug 2010 11:55:44 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH 3/3] MTD: OneNAND: Fix 2KiB pagesize handling at Samsung	SoCs
To: linux-mtd@lists.infradead.org
Message-id: <20100827025544.GA10702@july>
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

Wrong assumption bufferram can be switched between BufferRAM0 and BufferRAM1

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/samsung.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 69e48d0..7913a92 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -570,13 +570,12 @@ static int s5pc110_read_bufferram(struct mtd_info *mtd, int area,
 		unsigned char *buffer, int offset, size_t count)
 {
 	struct onenand_chip *this = mtd->priv;
-	void __iomem *bufferram;
 	void __iomem *p;
 	void *buf = (void *) buffer;
 	dma_addr_t dma_src, dma_dst;
 	int err;
 
-	p = bufferram = this->base + area;
+	p = this->base + area;
 	if (ONENAND_CURRENT_BUFFERRAM(this)) {
 		if (area == ONENAND_DATARAM)
 			p += this->writesize;
@@ -620,7 +619,7 @@ static int s5pc110_read_bufferram(struct mtd_info *mtd, int area,
 normal:
 	if (count != mtd->writesize) {
 		/* Copy the bufferram to memory to prevent unaligned access */
-		memcpy(this->page_buf, bufferram, mtd->writesize);
+		memcpy(this->page_buf, p, mtd->writesize);
 		p = this->page_buf + offset;
 	}
 
-- 
1.5.3.3
