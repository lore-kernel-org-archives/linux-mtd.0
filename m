Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USVNZ-0000zi-Py
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2013 16:38:42 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 7/7] mtd: nand: pxa3xx: Move buffer release code to its own
 function
Date: Wed, 17 Apr 2013 13:38:14 -0300
Message-Id: <1366216694-2365-8-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1366216694-2365-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1366216694-2365-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Eric Miao <eric.miao@linaro.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Zhangfei Gao <zhangfei.gao@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Create a function to release the buffer and the dma channel, thus undoing
what pxa3xx_nand_init_buff() did. This commit makes the code more readable
and will allow to handle non-DMA capable platforms easier.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index c1b8ec6..a5e60f7 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -912,6 +912,18 @@ static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
 	return 0;
 }
 
+static void pxa3xx_nand_free_buff(struct pxa3xx_nand_info *info)
+{
+	struct platform_device *pdev = info->pdev;
+	if (use_dma) {
+		pxa_free_dma(info->data_dma_ch);
+		dma_free_coherent(&pdev->dev, MAX_BUFF_SIZE,
+				  info->data_buff, info->data_buff_phys);
+	} else {
+		kfree(info->data_buff);
+	}
+}
+
 static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
 {
 	struct mtd_info *mtd;
@@ -1137,12 +1149,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 
 fail_free_buf:
 	free_irq(irq, info);
-	if (use_dma) {
-		pxa_free_dma(info->data_dma_ch);
-		dma_free_coherent(&pdev->dev, MAX_BUFF_SIZE,
-			info->data_buff, info->data_buff_phys);
-	} else
-		kfree(info->data_buff);
+	pxa3xx_nand_free_buff(info);
 fail_disable_clk:
 	clk_disable_unprepare(info->clk);
 	return ret;
@@ -1163,12 +1170,7 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq >= 0)
 		free_irq(irq, info);
-	if (use_dma) {
-		pxa_free_dma(info->data_dma_ch);
-		dma_free_writecombine(&pdev->dev, MAX_BUFF_SIZE,
-				info->data_buff, info->data_buff_phys);
-	} else
-		kfree(info->data_buff);
+	pxa3xx_nand_free_buff(info);
 
 	clk_disable_unprepare(info->clk);
 
-- 
1.8.1.5
