Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoBs3-0003XR-0I
 for linux-mtd@lists.infradead.org; Fri, 01 May 2015 14:24:51 +0000
From: Nicholas Mc Guire <hofrat@osadl.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/3] mtd: sh_flctl: fixup wait_for_completion_timeout return
 handling
Date: Fri,  1 May 2015 16:16:01 +0200
Message-Id: <1430489763-18417-1-git-send-email-hofrat@osadl.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, Wolfram Sang <wsa@the-dreams.de>,
 Vinod Koul <vinod.koul@intel.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Nicholas Mc Guire <hofrat@osadl.org>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

wait_for_completion_timeout() returns unsigned long not int so the check 
for <= should be == and the type unsigned long. This fixes up the return 
value handling and returns -ETIMEDOUT on timeout rather than 0 and 1 on 
on success rather than a more or less random remaining number of jiffies.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

call sites:
read_fiforeg,write_ec_fiforeg assume > 0 == success
and the comment in flctl_dma_fifo0_transfe states
        /* ret > 0 is success */
        return ret;
since it is only checking for > 0 in the call-sites
returning -ETIMEDOUT should be fine.

Patch was compile tested with ap325rxa_defconfig (implies
CONFIG_MTD_NAND_SH_FLCTL=y)

Patch is against 4.1-rc1 (localversion-next is -next-20150501)

 drivers/mtd/nand/sh_flctl.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index c3ce81c..4450864 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -354,6 +354,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 	dma_cookie_t cookie = -EINVAL;
 	uint32_t reg;
 	int ret;
+	unsigned long time_left;
 
 	if (dir == DMA_FROM_DEVICE) {
 		chan = flctl->chan_fifo0_rx;
@@ -388,14 +389,16 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 		goto out;
 	}
 
-	ret =
+	time_left =
 	wait_for_completion_timeout(&flctl->dma_complete,
 				msecs_to_jiffies(3000));
 
-	if (ret <= 0) {
+	if (time_left == 0) {
 		dmaengine_terminate_all(chan);
 		dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
-	}
+		ret = -ETIMEDOUT;
+	} else
+		ret = 1;	/* completion succeeded */
 
 out:
 	reg = readl(FLINTDMACR(flctl));
-- 
1.7.10.4
