Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1feKd1-00074C-Gy
 for linux-mtd@lists.infradead.org; Sat, 14 Jul 2018 13:30:29 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 stable@vger.kernel.org
Subject: [PATCH 3/4] mtd: rawnand: marvell: fix error handling of subop helpers
Date: Sat, 14 Jul 2018 15:30:02 +0200
Message-Id: <20180714133003.25187-3-miquel.raynal@bootlin.com>
In-Reply-To: <20180714133003.25187-1-miquel.raynal@bootlin.com>
References: <20180714133003.25187-1-miquel.raynal@bootlin.com>
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

Fix the Marvell NAND controller driver implementation by checking
potential negative error values.

Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 07b8a2677c10..1bb0cf6c945f 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -1554,6 +1554,9 @@ static int marvell_nfc_parse_instructions(struct nand_chip *chip,
 		const u8 *addrs;
 		int len = nand_subop_get_data_len(subop, op_id);
 
+		if (len < 0)
+			return -EINVAL;
+
 		instr = &subop->instrs[op_id];
 
 		switch (instr->type) {
@@ -1573,6 +1576,9 @@ static int marvell_nfc_parse_instructions(struct nand_chip *chip,
 		case NAND_OP_ADDR_INSTR:
 			offset = nand_subop_get_addr_start_off(subop, op_id);
 			naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
+			if (offset < 0 || naddrs < 0)
+				return -EINVAL;
+
 			addrs = &instr->ctx.addr.addrs[offset];
 
 			nfc_op->ndcb[0] |= NDCB0_ADDR_CYC(naddrs);
@@ -1638,6 +1644,9 @@ static int marvell_nfc_xfer_data_pio(struct nand_chip *chip,
 	bool reading = (instr->type == NAND_OP_DATA_IN_INSTR);
 	int ret;
 
+	if (len < 0 || offset < 0)
+		return -EINVAL;
+
 	if (instr->ctx.data.force_8bit)
 		marvell_nfc_force_byte_access(chip, true);
 
-- 
2.14.1
