Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWOFa-0002bi-Hs
 for linux-mtd@lists.infradead.org; Fri, 13 Mar 2015 11:59:35 +0000
From: Nicholas Mc Guire <hofrat@osadl.org>
To: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 2/2] mtd: fsmc_nand: match wait_for_completion_timeout return
 type
Date: Fri, 13 Mar 2015 07:54:46 -0400
Message-Id: <1426247686-30980-2-git-send-email-hofrat@osadl.org>
In-Reply-To: <1426247686-30980-1-git-send-email-hofrat@osadl.org>
References: <1426247686-30980-1-git-send-email-hofrat@osadl.org>
Cc: Vinod Koul <vinod.koul@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicholas Mc Guire <hofrat@osadl.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

return type of wait_for_completion_timeout is unsigned long not int. An
appropriately named unsigned long is added and the assignment fixed up.
This not only should help readability but also handles corner cases 
properly.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

Patch was compile tested with nhk8815_defconfig
(implies CONFIG_MTD_NAND_FSMC=y)

Patch is against 4.0-rc3 (localversion-next is -next-20150313

 drivers/mtd/nand/fsmc_nand.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 7c0508f..523ad65 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -562,6 +562,7 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 	dma_cookie_t cookie;
 	unsigned long flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
 	int ret;
+	unsigned long time_left;
 
 	if (direction == DMA_TO_DEVICE)
 		chan = host->write_dma_chan;
@@ -601,10 +602,10 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 
 	dma_async_issue_pending(chan);
 
-	ret =
+	time_left =
 	wait_for_completion_timeout(&host->dma_access_complete,
 				msecs_to_jiffies(3000));
-	if (ret == 0) {
+	if (time_left == 0) {
 		dmaengine_terminate_all(chan);
 		dev_err(host->dev, "wait_for_completion_timeout\n");
 		ret = -ETIMEDOUT;
-- 
1.7.10.4
