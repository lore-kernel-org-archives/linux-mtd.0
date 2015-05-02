Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoSQg-0007U4-MD
 for linux-mtd@lists.infradead.org; Sat, 02 May 2015 08:05:43 +0000
From: Nicholas Mc Guire <hofrat@osadl.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/4] mtd: sh_flctl: fix function parameter alignment
Date: Sat,  2 May 2015 09:57:09 +0200
Message-Id: <1430553430-21396-3-git-send-email-hofrat@osadl.org>
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

CodingStyle fix only - align function parameters to opening (.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

Patch was compile tested with ap325rxa_defconfig (implies
CONFIG_MTD_NAND_SH_FLCTL=y)

Patch is against 4.1-rc1 (localversion-next is -next-20150501)

 drivers/mtd/nand/sh_flctl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index d1c46e5..ffda530 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -390,7 +390,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 
 	time_left =
 	wait_for_completion_timeout(&flctl->dma_complete,
-				msecs_to_jiffies(3000));
+				    msecs_to_jiffies(3000));
 
 	if (time_left == 0) {
 		dmaengine_terminate_all(chan);
-- 
1.7.10.4
