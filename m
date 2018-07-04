Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faiT2-0004fR-7x
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 14:09:17 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: hynix: Use ->exec_op() in
 hynix_nand_reg_write_op()
Date: Wed,  4 Jul 2018 16:08:58 +0200
Message-Id: <20180704140858.28424-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Modern NAND controller drivers implement ->exec_op() instead of
->cmdfunc(), make sure we don't end up with a NULL pointer dereference
when hynix_nand_reg_write_op() is called.

Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_hynix.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index 8cbe77f447c7..4ffbb26e76d6 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -100,6 +100,16 @@ static int hynix_nand_reg_write_op(struct nand_chip *chip, u8 addr, u8 val)
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	u16 column = ((u16)addr << 8) | addr;
 
+	if (chip->exec_op) {
+		struct nand_op_instr instrs[] = {
+			NAND_OP_ADDR(1, &addr, 0),
+			NAND_OP_8BIT_DATA_OUT(1, &val, 0),
+		};
+		struct nand_operation op = NAND_OPERATION(instrs);
+
+		return nand_exec_op(chip, &op);
+	}
+
 	chip->cmdfunc(mtd, NAND_CMD_NONE, column, -1);
 	chip->write_byte(mtd, val);
 
-- 
2.14.1
