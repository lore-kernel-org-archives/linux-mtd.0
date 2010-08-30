Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqE5e-0006Eh-Dc
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 23:48:39 +0000
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L7Z0071IOS4QO70@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 31 Aug 2010 08:48:04 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L7Z00HELOS49M@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 31 Aug 2010 08:48:04 +0900 (KST)
Date: Tue, 31 Aug 2010 08:48:01 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH v2] MTD: OneNAND: Fix loop hang when DMA error at Samsung	SoCs
To: linux-mtd@lists.infradead.org
Message-id: <20100830234801.GA16862@july>
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

When DMA error occurs. it's loop hang since it can't exit the loop.
and it's the right DMA handling code as Spec.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
Changelog v1
	Add the timeout as Artem comment
	
 drivers/mtd/onenand/samsung.c |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index d604629..bdaa228 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -535,6 +535,7 @@ static int s5pc110_dma_ops(void *dst, void *src, size_t count, int direction)
 {
 	void __iomem *base = onenand->dma_addr;
 	int status;
+	unsigned long timeout;
 
 	writel(src, base + S5PC110_DMA_SRC_ADDR);
 	writel(dst, base + S5PC110_DMA_DST_ADDR);
@@ -552,15 +553,17 @@ static int s5pc110_dma_ops(void *dst, void *src, size_t count, int direction)
 
 	writel(S5PC110_DMA_TRANS_CMD_TR, base + S5PC110_DMA_TRANS_CMD);
 
+	timeout = jiffies + msec_to_jiffies(20);
+
 	do {
 		status = readl(base + S5PC110_DMA_TRANS_STATUS);
-	} while (!(status & S5PC110_DMA_TRANS_STATUS_TD));
-
-	if (status & S5PC110_DMA_TRANS_STATUS_TE) {
-		writel(S5PC110_DMA_TRANS_CMD_TEC, base + S5PC110_DMA_TRANS_CMD);
-		writel(S5PC110_DMA_TRANS_CMD_TDC, base + S5PC110_DMA_TRANS_CMD);
-		return -EIO;
-	}
+		if (status & S5PC110_DMA_TRANS_STATUS_TE) {
+			writel(S5PC110_DMA_TRANS_CMD_TEC,
+					base + S5PC110_DMA_TRANS_CMD);
+			return -EIO;
+		}
+	} while (!(status & S5PC110_DMA_TRANS_STATUS_TD) &&
+		time_before(jiffies, timeout));
 
 	writel(S5PC110_DMA_TRANS_CMD_TDC, base + S5PC110_DMA_TRANS_CMD);
 
-- 
1.5.3.3
