Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlI8K-0002ed-FN
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 12:52:52 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: pxa3xx: Use info->use_dma to release DMA resources
Date: Tue, 26 Nov 2013 09:52:24 -0300
Message-Id: <1385470344-2542-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After the driver allocates all DMA resources, it sets "info->use_dma".
Therefore, we need to check that variable to decide which resources
needs to be freed, instead of the global use_dma variable.

Without this change, when the device probe fails, the driver will try
to release unallocated DMA resources, with nasty results.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
This is minor fix, but a fix anyway, so it should be queued for stable.

 drivers/mtd/nand/pxa3xx_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 97c3eb5..8f2104c 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1288,7 +1288,7 @@ static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
 static void pxa3xx_nand_free_buff(struct pxa3xx_nand_info *info)
 {
 	struct platform_device *pdev = info->pdev;
-	if (use_dma) {
+	if (info->use_dma) {
 		pxa_free_dma(info->data_dma_ch);
 		dma_free_coherent(&pdev->dev, info->buf_size,
 				  info->data_buff, info->data_buff_phys);
-- 
1.8.1.5
