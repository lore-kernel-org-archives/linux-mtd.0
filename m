MIME-Version: 1.0
Date: Thu, 6 May 2010 05:12:08 -0400
Message-ID: <l2l771cded01005060212l9012e153g8b9f90552c99a068@mail.gmail.com>
Subject: [PATCH 16/20] pxa3xx_nand: fix reset timeout on mmp2
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	David Woodhouse <david.woodhouse@intel.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 9e68ac30228bd5841b8fed7a56739d401240916b Mon Sep 17 00:00:00 2001
From: Lei Wen <leiwen@marvell.com>
Date: Mon, 29 Mar 2010 17:35:45 +0800
Subject: [PATCH] pxa3xx_nand: fix reset timeout on mmp2

For mmp2 board, reset command would always have timeout when enable
the IRQ processing. The command done would comes after exit the IRQ
processing whatever the timeout value is set.

Change reset command use polling mode fix the issue.

Signed-off-by: Lei Wen <leiwen@marvell.com>
Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 31ebc78..2eebd20 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1099,6 +1099,10 @@ static int prepare_command_pool(struct
pxa3xx_nand *nand, int command,

 		break;
 	case NAND_CMD_RESET:
+		/* on some platform, it is stranger that when issue reset command,
+		 * cmd done would not come till timeout cause irq exit.
+		 * Force polling mode for reset command*/
+		use_polling = 1;
 		cmd = cmdset.reset;
 		info->ndcb0[0] |= NDCB0_CMD_TYPE(5)
 				| cmd;
@@ -1123,7 +1127,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info
*mtd, unsigned command,
 {
 	struct pxa3xx_nand_info *info = mtd->priv;
 	struct pxa3xx_nand *nand = info->nand_data;
-	int ret, exec_cmd;
+	int ret, exec_cmd, polling_mode;

 	/* if this is a x16 device ,then convert the input
 	 * "byte" address into a "word" address appropriate
@@ -1140,6 +1144,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info
*mtd, unsigned command,
 	}

 	DBG_NAND(printk("command %x, page %x\n", command, page_addr));
+	polling_mode = use_polling;
 	exec_cmd = prepare_command_pool(nand, command, column, page_addr);
 	if (exec_cmd) {
 		init_completion(&nand->cmd_complete);
@@ -1160,6 +1165,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info
*mtd, unsigned command,
 		disable_int(nand, NDCR_INT_MASK);
 		nand->state &= ~STATE_CMD_PREPARED;
 	}
+	use_polling = polling_mode;
 }

 static uint8_t pxa3xx_nand_read_byte(struct mtd_info *mtd)
-- 
1.5.6.5
