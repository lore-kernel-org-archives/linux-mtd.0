Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fE8wD-0001m7-Tk
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 07:46:04 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH] mtd: rawnand: fsmc: Make sure we wait tWB before polling the
 STATUS reg
Date: Thu,  3 May 2018 09:45:44 +0200
Message-Id: <20180503074544.19938-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NAND chips require a bit of time to take the NAND operation into account
and set the BUSY bit in the STATUS reg. Make sure we don't poll the
STATUS reg too early.

Fixes: 4da712e70294 ("mtd: nand: fsmc: use ->exec_op()")
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 28c48dcc514e..0960665858b7 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -18,6 +18,7 @@
 
 #include <linux/clk.h>
 #include <linux/completion.h>
+#include <linux/delay.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
@@ -695,6 +696,13 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 			pr_debug("  ->WAITRDY  [max %d ms]\n",
 				 instr->ctx.waitrdy.timeout_ms);
 
+			/*
+			 * Make sure we wait tWB before polling the STATUS
+			 * register.
+			 */
+			if (op_id && op->instrs[op_id - 1].delay_ns)
+				ndelay(op->instrs[op_id - 1].delay_ns);
+
 			ret = nand_soft_waitrdy(chip,
 						instr->ctx.waitrdy.timeout_ms);
 			break;
-- 
2.14.1
