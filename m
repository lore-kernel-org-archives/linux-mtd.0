Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWOFa-0002b9-Hu
 for linux-mtd@lists.infradead.org; Fri, 13 Mar 2015 11:59:35 +0000
From: Nicholas Mc Guire <hofrat@osadl.org>
To: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 1/2 RESEND] mtd: fsmc_nand: fix handling of
 wait_for_completion_timeout return value
Date: Fri, 13 Mar 2015 07:54:45 -0400
Message-Id: <1426247686-30980-1-git-send-email-hofrat@osadl.org>
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

wait_for_completion_timeout does not return negative values so
result handling here does not need to check for negative return.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

Patch was compile tested with nhk8815_defconfig
(implies CONFIG_MTD_NAND_FSMC=y)

Patch is against 4.0-rc3 (localversion-next is -next-20150313

 drivers/mtd/nand/fsmc_nand.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index edfaa21..7c0508f 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -604,11 +604,10 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 	ret =
 	wait_for_completion_timeout(&host->dma_access_complete,
 				msecs_to_jiffies(3000));
-	if (ret <= 0) {
+	if (ret == 0) {
 		dmaengine_terminate_all(chan);
 		dev_err(host->dev, "wait_for_completion_timeout\n");
-		if (!ret)
-			ret = -ETIMEDOUT;
+		ret = -ETIMEDOUT;
 		goto unmap_dma;
 	}
 
-- 
1.7.10.4
