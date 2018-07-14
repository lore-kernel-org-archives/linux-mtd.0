Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1feKd1-000747-H0
 for linux-mtd@lists.infradead.org; Sat, 14 Jul 2018 13:30:29 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 stable@vger.kernel.org
Subject: [PATCH 1/4] mtd: rawnand: add missing error handling in subop helpers
Date: Sat, 14 Jul 2018 15:30:00 +0200
Message-Id: <20180714133003.25187-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A report from Colin Ian King pointed a CoverityScan issue where error
values on these helpers where not checked in the drivers. These
helpers could error out only in case of a software bug in driver code,
not because of a runtime/hardware error but in any cases it is safer
to handle these errors properly.

Before fixing the drivers, let's add some consistency and fix these
helpers error handling.

Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 10c4f9919850..51f68203aa63 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2720,6 +2720,8 @@ int nand_subop_get_num_addr_cyc(const struct nand_subop *subop,
 		return -EINVAL;
 
 	start_off = nand_subop_get_addr_start_off(subop, instr_idx);
+	if (start_off < 0)
+		return start_off;
 
 	if (instr_idx == subop->ninstrs - 1 &&
 	    subop->last_instr_end_off)
@@ -2774,6 +2776,8 @@ int nand_subop_get_data_len(const struct nand_subop *subop,
 		return -EINVAL;
 
 	start_off = nand_subop_get_data_start_off(subop, instr_idx);
+	if (start_off < 0)
+		return start_off;
 
 	if (instr_idx == subop->ninstrs - 1 &&
 	    subop->last_instr_end_off)
-- 
2.14.1
