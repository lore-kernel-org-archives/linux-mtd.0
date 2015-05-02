Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoSQg-0007Tw-MO
 for linux-mtd@lists.infradead.org; Sat, 02 May 2015 08:05:43 +0000
From: Nicholas Mc Guire <hofrat@osadl.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/4] mtd: sh_flctl: drop unused variable
Date: Sat,  2 May 2015 09:57:08 +0200
Message-Id: <1430553430-21396-2-git-send-email-hofrat@osadl.org>
In-Reply-To: <1430553430-21396-1-git-send-email-hofrat@osadl.org>
References: <1430553430-21396-1-git-send-email-hofrat@osadl.org>
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

shdma_tx_submit() called via dmaengine_submit() returns the assigned 
cookie but this is not used here so the variable and assignment can 
be dropped.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

V2: As pointed out by Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    the variable and assignment can be dropped but not the call to 
    dmaengine_submit(desc) - fixed up 

Patch was compile tested with ap325rxa_defconfig (implies
CONFIG_MTD_NAND_SH_FLCTL=y)

Patch is against 4.1-rc1 (localversion-next is -next-20150501)

 drivers/mtd/nand/sh_flctl.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 9b032dd..d1c46e5 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -351,7 +351,6 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 	struct dma_chan *chan;
 	enum dma_transfer_direction tr_dir;
 	dma_addr_t dma_addr;
-	dma_cookie_t cookie = -EINVAL;
 	uint32_t reg;
 	int ret = 0;
 	unsigned long time_left;
@@ -377,7 +376,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 
 		desc->callback = flctl_dma_complete;
 		desc->callback_param = flctl;
-		cookie = dmaengine_submit(desc);
+		dmaengine_submit(desc);
 
 		dma_async_issue_pending(chan);
 	} else {
-- 
1.7.10.4
