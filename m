Received: from mail-ob0-f169.google.com ([209.85.214.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZloZ7-0006By-4W
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 01:39:46 +0000
Received: by obbda8 with SMTP id da8so2594649obb.1
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2015 18:39:24 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: linux-kernel@vger.kernel.org, rogerq@ti.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org, nsekhar@ti.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, tony@atomide.com
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 2/5] mtd: nand: omap2: Start dma request before enabling
 prefetch
Date: Mon, 12 Oct 2015 20:38:55 -0500
Message-Id: <1444700338-27582-3-git-send-email-fcooper@ti.com>
In-Reply-To: <1444700338-27582-1-git-send-email-fcooper@ti.com>
References: <1444700338-27582-1-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The prefetch engine sends a dma request once a FIFO threshold has
been met. No other requests are received until the previous request
is handled.

Starting an edma transfer (dma_async_issue_pending) results in any
previous event for the dma channel to be cleared. Therefore, starting
the prefetch engine before initiating the dma transfer may result in
the prefetch triggering a dma request but instead of it being handled
it can end up being cleared. This will result in a hang since the code
will continue to wait for the dma request to complete.

By initiating the dma request before enabling the prefetch engine this
race condition is avoided and no dma request are missed/cleared.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 drivers/mtd/nand/omap2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 957c32f..94d11de 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -509,6 +509,9 @@ static inline int omap_nand_dma_transfer(struct mtd_info *mtd, void *addr,
 	tx->callback_param = &info->comp;
 	dmaengine_submit(tx);
 
+	init_completion(&info->comp);
+	dma_async_issue_pending(info->dma);
+
 	/*  configure and start prefetch transfer */
 	ret = omap_prefetch_enable(info->gpmc_cs,
 		PREFETCH_FIFOTHRESHOLD_MAX, 0x1, len, is_write, info);
@@ -516,9 +519,6 @@ static inline int omap_nand_dma_transfer(struct mtd_info *mtd, void *addr,
 		/* PFPW engine is busy, use cpu copy method */
 		goto out_copy_unmap;
 
-	init_completion(&info->comp);
-	dma_async_issue_pending(info->dma);
-
 	/* setup and start DMA using dma_addr */
 	wait_for_completion(&info->comp);
 	tim = 0;
-- 
2.6.1
