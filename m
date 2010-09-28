Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0XPJ-00087J-RT
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 10:27:34 +0000
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L9G00HE2D1PXXC0@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 19:27:25 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9G005K4D1PAP@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 19:27:25 +0900 (KST)
Date: Tue, 28 Sep 2010 19:27:15 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH v2 3/3] MTD: OneNAND: S5PC110: Implement DMA interrupt	method
To: linux-mtd@lists.infradead.org
Message-id: <20100928102715.GA30190@july>
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

Implement DMA interrupt method. previous time it polls the DMA status.
It can reduce the CPU power but decrease the performance a little.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/samsung.c |   85 ++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 84 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index afdb4c5..214ed1e 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -22,6 +22,7 @@
 #include <linux/mtd/onenand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
 
 #include <asm/mach/flash.h>
 #include <plat/regs-onenand.h>
@@ -81,6 +82,17 @@ enum soc_type {
 #define S5PC110_DMA_TRANS_CMD		0x418
 #define S5PC110_DMA_TRANS_STATUS	0x41C
 #define S5PC110_DMA_TRANS_DIR		0x420
+#define S5PC110_INTC_DMA_CLR		0x1004
+#define S5PC110_INTC_ONENAND_CLR	0x1008
+#define S5PC110_INTC_DMA_MASK		0x1024
+#define S5PC110_INTC_ONENAND_MASK	0x1028
+#define S5PC110_INTC_DMA_PEND		0x1044
+#define S5PC110_INTC_ONENAND_PEND	0x1048
+#define S5PC110_INTC_DMA_STATUS		0x1064
+#define S5PC110_INTC_ONENAND_STATUS	0x1068
+
+#define S5PC110_INTC_DMA_TD		(1 << 24)
+#define S5PC110_INTC_DMA_TE		(1 << 16)
 
 #define S5PC110_DMA_CFG_SINGLE		(0x0 << 16)
 #define S5PC110_DMA_CFG_4BURST		(0x2 << 16)
@@ -134,6 +146,7 @@ struct s3c_onenand {
 	void __iomem	*dma_addr;
 	struct resource *dma_res;
 	unsigned long	phys_base;
+	struct completion	complete;
 #ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *parts;
 #endif
@@ -531,7 +544,9 @@ static int onenand_write_bufferram(struct mtd_info *mtd, int area,
 	return 0;
 }
 
-static int s5pc110_dma_ops(void *dst, void *src, size_t count, int direction)
+static int (*s5pc110_dma_ops)(void *dst, void *src, size_t count, int direction);
+
+static int s5pc110_dma_poll(void *dst, void *src, size_t count, int direction)
 {
 	void __iomem *base = onenand->dma_addr;
 	int status;
@@ -575,6 +590,60 @@ static int s5pc110_dma_ops(void *dst, void *src, size_t count, int direction)
 	return 0;
 }
 
+static irqreturn_t s5pc110_onenand_irq(int irq, void *data)
+{
+	void __iomem *base = onenand->dma_addr;
+	int status, cmd = 0;
+
+	status = readl(base + S5PC110_INTC_DMA_STATUS);
+
+	if (likely(status & S5PC110_INTC_DMA_TD))
+		cmd = S5PC110_DMA_TRANS_CMD_TDC;
+
+	if (unlikely(status & S5PC110_INTC_DMA_TE))
+		cmd = S5PC110_DMA_TRANS_CMD_TEC;
+
+	writel(cmd, base + S5PC110_DMA_TRANS_CMD);
+	writel(status, base + S5PC110_INTC_DMA_CLR);
+
+	if (!onenand->complete.done)
+		complete(&onenand->complete);
+
+	return IRQ_HANDLED;
+}
+
+static int s5pc110_dma_irq(void *dst, void *src, size_t count, int direction)
+{
+	void __iomem *base = onenand->dma_addr;
+	int status;
+
+	status = readl(base + S5PC110_INTC_DMA_MASK);
+	if (status) {
+		status &= ~(S5PC110_INTC_DMA_TD | S5PC110_INTC_DMA_TE);
+		writel(status, base + S5PC110_INTC_DMA_MASK);
+	}
+
+	writel(src, base + S5PC110_DMA_SRC_ADDR);
+	writel(dst, base + S5PC110_DMA_DST_ADDR);
+
+	if (direction == S5PC110_DMA_DIR_READ) {
+		writel(S5PC110_DMA_SRC_CFG_READ, base + S5PC110_DMA_SRC_CFG);
+		writel(S5PC110_DMA_DST_CFG_READ, base + S5PC110_DMA_DST_CFG);
+	} else {
+		writel(S5PC110_DMA_SRC_CFG_WRITE, base + S5PC110_DMA_SRC_CFG);
+		writel(S5PC110_DMA_DST_CFG_WRITE, base + S5PC110_DMA_DST_CFG);
+	}
+
+	writel(count, base + S5PC110_DMA_TRANS_SIZE);
+	writel(direction, base + S5PC110_DMA_TRANS_DIR);
+
+	writel(S5PC110_DMA_TRANS_CMD_TR, base + S5PC110_DMA_TRANS_CMD);
+
+	wait_for_completion_timeout(&onenand->complete, msecs_to_jiffies(20));
+
+	return 0;
+}
+
 static int s5pc110_read_bufferram(struct mtd_info *mtd, int area,
 		unsigned char *buffer, int offset, size_t count)
 {
@@ -919,6 +988,20 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 		}
 
 		onenand->phys_base = onenand->base_res->start;
+
+		s5pc110_dma_ops = s5pc110_dma_poll;
+		/* Interrupt support */
+		r = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+		if (r) {
+			init_completion(&onenand->complete);
+			s5pc110_dma_ops = s5pc110_dma_irq;
+			err = request_irq(r->start, s5pc110_onenand_irq,
+					IRQF_SHARED, "onenand", &onenand);
+			if (err) {
+				dev_err(&pdev->dev, "failed to get irq\n");
+				goto scan_failed;
+			}
+		}
 	}
 
 	if (onenand_scan(mtd, 1)) {
-- 
1.5.3.3
