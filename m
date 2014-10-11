Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XczJp-000571-7y
 for linux-mtd@lists.infradead.org; Sat, 11 Oct 2014 16:14:57 +0000
From: Vinod Koul <vinod.koul@intel.com>
To: dmaengine@vger.kernel.org
Subject: [PATCH 04/12] mtd: fsmc_nand: use dmaengine_terminate_all() API
Date: Sat, 11 Oct 2014 21:10:32 +0530
Message-Id: <1413042040-28222-4-git-send-email-vinod.koul@intel.com>
In-Reply-To: <1413041973-28146-1-git-send-email-vinod.koul@intel.com>
References: <1413041973-28146-1-git-send-email-vinod.koul@intel.com>
Cc: Mark Brown <broonie@linaro.org>, Vinod Koul <vinod.koul@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
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
 drivers/mtd/nand/fsmc_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 1550692..7a91587 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -605,7 +605,7 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 	wait_for_completion_timeout(&host->dma_access_complete,
 				msecs_to_jiffies(3000));
 	if (ret <= 0) {
-		chan->device->device_control(chan, DMA_TERMINATE_ALL, 0);
+		dmaengine_terminate_all(chan);
 		dev_err(host->dev, "wait_for_completion_timeout\n");
 		if (!ret)
 			ret = -ETIMEDOUT;
-- 
1.7.0.4
