Received: from mail-oi0-f66.google.com ([209.85.218.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arAN4-0004aF-MP
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 20:29:44 +0000
Received: by mail-oi0-f66.google.com with SMTP id v126so15058093oia.3
 for <linux-mtd@lists.infradead.org>; Fri, 15 Apr 2016 13:29:22 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: boris.brezillon@free-electrons.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, tony@atomide.com, rogerq@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: [PATCH 1/2] mtd: nand: omap2: Start dma request before enabling
 prefetch
Date: Fri, 15 Apr 2016 15:28:58 -0500
Message-Id: <1460752139-12742-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1460752139-12742-1-git-send-email-fcooper@ti.com>
References: <1460752139-12742-1-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Cooper Jr., Franklin" <fcooper@ti.com>

The prefetch engine sends a dma request once a FIFO threshold has
been met. No other requests are received until the previous request
is handled.

Starting a dma transfer (dma_async_issue_pending) results in any
previous event for the dma channel to be cleared. Therefore, starting
the prefetch engine before initiating the dma transfer may result in
the prefetch triggering a dma request but instead of it being handled
it can end up being cleared. This will result in a hang since the code
will continue to wait for the dma request to complete.

By initiating the dma request before enabling the prefetch engine this
race condition is avoided and no dma request are missed/cleared.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 drivers/mtd/nand/omap2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 0749ca1..762e0ed 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -497,6 +497,11 @@ static inline int omap_nand_dma_transfer(struct mtd_info *mtd, void *addr,
 	tx->callback_param = &info->comp;
 	dmaengine_submit(tx);
 
+	init_completion(&info->comp);
+
+	/* setup and start DMA using dma_addr */
+	dma_async_issue_pending(info->dma);
+
 	/*  configure and start prefetch transfer */
 	ret = omap_prefetch_enable(info->gpmc_cs,
 		PREFETCH_FIFOTHRESHOLD_MAX, 0x1, len, is_write, info);
@@ -504,10 +509,6 @@ static inline int omap_nand_dma_transfer(struct mtd_info *mtd, void *addr,
 		/* PFPW engine is busy, use cpu copy method */
 		goto out_copy_unmap;
 
-	init_completion(&info->comp);
-	dma_async_issue_pending(info->dma);
-
-	/* setup and start DMA using dma_addr */
 	wait_for_completion(&info->comp);
 	tim = 0;
 	limit = (loops_per_jiffy * msecs_to_jiffies(OMAP_NAND_TIMEOUT_MS));
-- 
2.7.0
