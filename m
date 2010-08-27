Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oop71-0006Ks-V7
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2010 02:56:16 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L7S00D72IST2C00@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 27 Aug 2010 11:55:41 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L7S0008WISUSY@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 27 Aug 2010 11:55:42 +0900 (KST)
Date: Fri, 27 Aug 2010 11:55:37 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH 2/3] MTD: OneNAND: Fix loop hang when DMA error at Samsung	SoCs
To: linux-mtd@lists.infradead.org
Message-id: <20100827025537.GA10698@july>
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
 drivers/mtd/onenand/samsung.c |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 05329ba..69e48d0 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -554,14 +554,13 @@ static int s5pc110_dma_ops(void *dst, void *src, size_t count, int direction)
 
 	do {
 		status = readl(base + S5PC110_DMA_TRANS_STATUS);
+		if (status & S5PC110_DMA_TRANS_STATUS_TE) {
+			writel(S5PC110_DMA_TRANS_CMD_TEC,
+					base + S5PC110_DMA_TRANS_CMD);
+			return -EIO;
+		}
 	} while (!(status & S5PC110_DMA_TRANS_STATUS_TD));
 
-	if (status & S5PC110_DMA_TRANS_STATUS_TE) {
-		writel(S5PC110_DMA_TRANS_CMD_TEC, base + S5PC110_DMA_TRANS_CMD);
-		writel(S5PC110_DMA_TRANS_CMD_TDC, base + S5PC110_DMA_TRANS_CMD);
-		return -EIO;
-	}
-
 	writel(S5PC110_DMA_TRANS_CMD_TDC, base + S5PC110_DMA_TRANS_CMD);
 
 	return 0;
-- 
1.5.3.3
