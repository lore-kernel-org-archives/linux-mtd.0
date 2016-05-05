Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayPB1-0007aB-VV
 for linux-mtd@lists.infradead.org; Thu, 05 May 2016 19:43:12 +0000
Received: by mail-pf0-x22c.google.com with SMTP id c189so42301114pfb.3
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 12:42:51 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: sh_flctl: handle dma_submit() errors
Date: Thu,  5 May 2016 12:42:44 -0700
Message-Id: <1462477364-19529-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some build tools noticed that 'cookie' is being set but not used. Might
as well catch the errors here and handle them the same way we handle
other DMA prep steps.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Compile tested only

 drivers/mtd/nand/sh_flctl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 6fa3bcd59769..442ce619b3b6 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -397,7 +397,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 	struct dma_chan *chan;
 	enum dma_transfer_direction tr_dir;
 	dma_addr_t dma_addr;
-	dma_cookie_t cookie = -EINVAL;
+	dma_cookie_t cookie;
 	uint32_t reg;
 	int ret;
 
@@ -423,6 +423,12 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 		desc->callback = flctl_dma_complete;
 		desc->callback_param = flctl;
 		cookie = dmaengine_submit(desc);
+		if (dma_submit_error(cookie)) {
+			ret = dma_submit_error(cookie);
+			dev_warn(&flctl->pdev->dev,
+				 "DMA submit failed, falling back to PIO\n");
+			goto out;
+		}
 
 		dma_async_issue_pending(chan);
 	} else {
-- 
2.8.0.rc3.226.g39d4020
