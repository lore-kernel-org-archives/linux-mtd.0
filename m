Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoBs3-0003XS-14
 for linux-mtd@lists.infradead.org; Fri, 01 May 2015 14:24:52 +0000
From: Nicholas Mc Guire <hofrat@osadl.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/3] mtd: sh_flctl: remove unused variable and assignment
Date: Fri,  1 May 2015 16:16:03 +0200
Message-Id: <1430489763-18417-3-git-send-email-hofrat@osadl.org>
In-Reply-To: <1430489763-18417-1-git-send-email-hofrat@osadl.org>
References: <1430489763-18417-1-git-send-email-hofrat@osadl.org>
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

Fixes a compile warning [-Wunused-but-set-variable] only.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

This fixes the compile time warning:
drivers/mtd/nand/sh_flctl.c: In function 'flctl_dma_fifo0_transfer':
drivers/mtd/nand/sh_flctl.c:354:15: warning: variable 'cookie' set but not
used [-Wunused-but-set-variable]

as dmaengine_submit only reads and returns desc->tx_submit(desc) which 
is then unused in flctl_dma_fifo0_transfer, this should be side-effect 
free to remove.

Patch was compile tested with ap325rxa_defconfig (implies
CONFIG_MTD_NAND_SH_FLCTL=y)

Patch is against 4.1-rc1 (localversion-next is -next-20150501)

 drivers/mtd/nand/sh_flctl.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index b9f265a..6a5c4f7 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -351,7 +351,6 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 	struct dma_chan *chan;
 	enum dma_transfer_direction tr_dir;
 	dma_addr_t dma_addr;
-	dma_cookie_t cookie = -EINVAL;
 	uint32_t reg;
 	int ret;
 	unsigned long time_left;
@@ -377,7 +376,6 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 
 		desc->callback = flctl_dma_complete;
 		desc->callback_param = flctl;
-		cookie = dmaengine_submit(desc);
 
 		dma_async_issue_pending(chan);
 	} else {
-- 
1.7.10.4
