Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0837-00033G-K8
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 07:22:58 +0000
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L9E00IXM9U8TPB0@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 16:22:56 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9E00HJS9U8O2@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 16:22:56 +0900 (KST)
Date: Mon, 27 Sep 2010 16:25:17 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH 4/4] MTD: OneNAND: S5PC110: Add timeout to prevent the	endless
	loop
To: linux-mtd@lists.infradead.org
Message-id: <20100927072517.GA32095@july>
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

There's no case timeout but add it for some H/W problem or
wrong codes implementation

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/samsung.c |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 30eccd7..afdb4c5 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -535,6 +535,7 @@ static int s5pc110_dma_ops(void *dst, void *src, size_t count, int direction)
 {
 	void __iomem *base = onenand->dma_addr;
 	int status;
+	unsigned long timeout;
 
 	writel(src, base + S5PC110_DMA_SRC_ADDR);
 	writel(dst, base + S5PC110_DMA_DST_ADDR);
@@ -552,6 +553,13 @@ static int s5pc110_dma_ops(void *dst, void *src, size_t count, int direction)
 
 	writel(S5PC110_DMA_TRANS_CMD_TR, base + S5PC110_DMA_TRANS_CMD);
 
+	/*
+	 * There's no exact timeout values at Spec.
+	 * In real case it takes under 1 msec.
+	 * So 20 msecs are enough.
+	 */
+	timeout = jiffies + msecs_to_jiffies(20);
+
 	do {
 		status = readl(base + S5PC110_DMA_TRANS_STATUS);
 		if (status & S5PC110_DMA_TRANS_STATUS_TE) {
@@ -559,7 +567,8 @@ static int s5pc110_dma_ops(void *dst, void *src, size_t count, int direction)
 					base + S5PC110_DMA_TRANS_CMD);
 			return -EIO;
 		}
-	} while (!(status & S5PC110_DMA_TRANS_STATUS_TD));
+	} while (!(status & S5PC110_DMA_TRANS_STATUS_TD) &&
+		time_before(jiffies, timeout));
 
 	writel(S5PC110_DMA_TRANS_CMD_TDC, base + S5PC110_DMA_TRANS_CMD);
 
-- 
1.5.3.3
