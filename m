Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqMsV-0006rH-FB
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 12:57:32 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH for v3.13 1/2] mtd: nand: pxa3xx: Use info->use_dma to release
 DMA resources
Date: Tue, 10 Dec 2013 09:57:15 -0300
Message-Id: <1386680236-21698-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1386680236-21698-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1386680236-21698-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Arnaud Ebalard <arno@natisbad.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In commit:

  commit 62e8b851783138a11da63285be0fbf69530ff73d
  Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
  Date:   Fri Oct 4 15:30:38 2013 -0300

  mtd: nand: pxa3xx: Allocate data buffer on detected flash size

the way the buffer is allocated was changed: the first READ_ID is issued
with a small kmalloc'ed buffer. Only once the flash page size is detected
the DMA buffers are allocated, and info->use_dma is set.

Currently, if the device detection fails, the driver checks the 'use_dma'
module parameter and tries to release unallocated DMA resources.

Fix this by checking the proper indicator of the DMA allocation, which
is 'info->use_dma'.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 3d143fe..4cdc134 100644
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
