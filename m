Received: from m12-11.163.com ([220.181.12.11])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1df5dB-0001j4-0v
 for linux-mtd@lists.infradead.org; Tue, 08 Aug 2017 14:37:17 +0000
From: Pan Bian <bianpan2016@163.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pan Bian <bianpan2016@163.com>
Subject: mtd: nand: use dma_mapping_error to check map errors
Date: Tue,  8 Aug 2017 22:35:42 +0800
Message-Id: <1502202942-23984-1-git-send-email-bianpan2016@163.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The return value of dma_map_single() should be checked by
dma_mapping_error(). However, in function flctl_dma_fifo0_transfer(), its
return value is checked against NULL, which could result in failures.

Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/mtd/nand/sh_flctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 891ac7b..2404d66 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -411,7 +411,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 
 	dma_addr = dma_map_single(chan->device->dev, buf, len, dir);
 
-	if (dma_addr)
+	if (!dma_mapping_error(chan->device->dev, dma_addr))
 		desc = dmaengine_prep_slave_single(chan, dma_addr, len,
 			tr_dir, DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 
-- 
1.9.1
