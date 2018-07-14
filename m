Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1feKd1-00074D-Gx
 for linux-mtd@lists.infradead.org; Sat, 14 Jul 2018 13:30:30 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 stable@vger.kernel.org
Subject: [PATCH 4/4] mtd: rawnand: vf610: fix error handling of subop helpers
Date: Sat, 14 Jul 2018 15:30:03 +0200
Message-Id: <20180714133003.25187-4-miquel.raynal@bootlin.com>
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

Fix the VF610 NAND controller driver implementation by checking
potential negative error values coming from these helpers.

Fixes: 1cbe30b0ddc7 ("mtd: rawnand: vf610_nfc: make use of ->exec_op()")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index d5a22fc96878..cc88ed758685 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -398,6 +398,9 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 		int naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
 		int i = nand_subop_get_addr_start_off(subop, op_id);
 
+		if (naddrs < 0 || i < 0)
+			return -EINVAL;
+
 		for (; i < naddrs; i++) {
 			u8 val = instr->ctx.addr.addrs[i];
 
@@ -414,6 +417,9 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 	if (instr && instr->type == NAND_OP_DATA_OUT_INSTR) {
 		trfr_sz = nand_subop_get_data_len(subop, op_id);
 		offset = nand_subop_get_data_start_off(subop, op_id);
+		if (trfr_sz < 0 || offset < 0)
+			return -EINVAL;
+
 		force8bit = instr->ctx.data.force_8bit;
 
 		/*
@@ -444,6 +450,9 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 	if (instr && instr->type == NAND_OP_DATA_IN_INSTR) {
 		trfr_sz = nand_subop_get_data_len(subop, op_id);
 		offset = nand_subop_get_data_start_off(subop, op_id);
+		if (trfr_sz < 0 || offset < 0)
+			return -EINVAL;
+
 		force8bit = instr->ctx.data.force_8bit;
 
 		code |= COMMAND_READ_DATA;
-- 
2.14.1
