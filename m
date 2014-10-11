Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XczKE-0005Qf-Ij
 for linux-mtd@lists.infradead.org; Sat, 11 Oct 2014 16:15:23 +0000
From: Vinod Koul <vinod.koul@intel.com>
To: dmaengine@vger.kernel.org
Subject: [PATCH 05/12] mtd: sh_flctl: use dmaengine_terminate_all() API
Date: Sat, 11 Oct 2014 21:10:33 +0530
Message-Id: <1413042040-28222-5-git-send-email-vinod.koul@intel.com>
In-Reply-To: <1413041973-28146-1-git-send-email-vinod.koul@intel.com>
References: <1413041973-28146-1-git-send-email-vinod.koul@intel.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Vinod Koul <vinod.koul@intel.com>, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The drivers should use dmaengine_terminate_all() API instead of
accessing the device_control which will be deprecated soon

Signed-off-by: Vinod Koul <vinod.koul@intel.com>
---
 drivers/mtd/nand/sh_flctl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index c067023..0ed7c60 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -395,7 +395,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 				msecs_to_jiffies(3000));
 
 	if (ret <= 0) {
-		chan->device->device_control(chan, DMA_TERMINATE_ALL, 0);
+		dmaengine_terminate_all(chan);
 		dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
 	}
 
-- 
1.7.0.4
