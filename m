Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSA9G-000423-9I
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2013 18:30:47 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	Daniel Mack <zonque@gmail.com>
Subject: [PATCH 1/2] mtd: nand: pxa3xx: Move DMA I/O enabling
Date: Fri,  4 Oct 2013 15:30:37 -0300
Message-Id: <1380911438-24240-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1380911438-24240-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1380911438-24240-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of setting info->dma each time a command is prepared,
we can move it after the DMA buffers are allocated.

This is more clear and it's the proper place to enable this, given
DMA cannot be turned on and off during runtime.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index dd03dfd..a47c67f 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -540,7 +540,6 @@ static int prepare_command_pool(struct pxa3xx_nand_info *info, int command,
 	info->oob_size		= 0;
 	info->use_ecc		= 0;
 	info->use_spare		= 1;
-	info->use_dma		= (use_dma) ? 1 : 0;
 	info->is_ready		= 0;
 	info->retcode		= ERR_NONE;
 	if (info->cs != 0)
@@ -950,6 +949,11 @@ static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
 		return info->data_dma_ch;
 	}
 
+	/*
+	 * Now that DMA buffers are allocated we turn on
+	 * DMA proper for I/O operations.
+	 */
+	info->use_dma = 1;
 	return 0;
 }
 
-- 
1.8.1.5
