Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK2yN-0007g8-Fk
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 15:08:56 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v2 18/22] mtd: rawnand: vf610: Stop implementing
 ->select_chip()
Date: Tue,  6 Nov 2018 16:08:06 +0100
Message-Id: <20181106150810.9569-19-boris.brezillon@bootlin.com>
In-Reply-To: <20181106150810.9569-1-boris.brezillon@bootlin.com>
References: <20181106150810.9569-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the CS to be selected is kept in chip->cur_cs and passed
in nand_operation->cs, we can get rid of the ->select_chip()
implementation and replace it by an internal function which is called
from the chip->exec_op() and chip->ecc.read/write_xxx() hooks.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- Use op->cs instead of chip->cur_cs in vf610_nfc_exec_op()
---
 drivers/mtd/nand/raw/vf610_nfc.c | 34 +++++++++++++++++---------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9814fd4a84cf..49a174e30211 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -487,36 +487,35 @@ static const struct nand_op_parser vf610_nfc_op_parser = NAND_OP_PARSER(
 		NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, PAGE_2K + OOB_MAX)),
 	);
 
-static int vf610_nfc_exec_op(struct nand_chip *chip,
-			     const struct nand_operation *op,
-			     bool check_only)
-{
-	return nand_op_parser_exec_op(chip, &vf610_nfc_op_parser, op,
-				      check_only);
-}
-
 /*
  * This function supports Vybrid only (MPC5125 would have full RB and four CS)
  */
-static void vf610_nfc_select_chip(struct nand_chip *chip, int cs)
+static void vf610_nfc_select_target(struct nand_chip *chip, unsigned int cs)
 {
 	struct vf610_nfc *nfc = mtd_to_nfc(nand_to_mtd(chip));
-	u32 tmp = vf610_nfc_read(nfc, NFC_ROW_ADDR);
+	u32 tmp;
 
 	/* Vybrid only (MPC5125 would have full RB and four CS) */
 	if (nfc->variant != NFC_VFC610)
 		return;
 
+	tmp = vf610_nfc_read(nfc, NFC_ROW_ADDR);
 	tmp &= ~(ROW_ADDR_CHIP_SEL_RB_MASK | ROW_ADDR_CHIP_SEL_MASK);
-
-	if (cs >= 0) {
-		tmp |= 1 << ROW_ADDR_CHIP_SEL_RB_SHIFT;
-		tmp |= BIT(cs) << ROW_ADDR_CHIP_SEL_SHIFT;
-	}
+	tmp |= 1 << ROW_ADDR_CHIP_SEL_RB_SHIFT;
+	tmp |= BIT(cs) << ROW_ADDR_CHIP_SEL_SHIFT;
 
 	vf610_nfc_write(nfc, NFC_ROW_ADDR, tmp);
 }
 
+static int vf610_nfc_exec_op(struct nand_chip *chip,
+			     const struct nand_operation *op,
+			     bool check_only)
+{
+	vf610_nfc_select_target(chip, op->cs);
+	return nand_op_parser_exec_op(chip, &vf610_nfc_op_parser, op,
+				      check_only);
+}
+
 static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 					 uint8_t *oob, int page)
 {
@@ -566,6 +565,8 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
 	int stat;
 
+	vf610_nfc_select_target(chip, chip->cur_cs);
+
 	cmd2 |= NAND_CMD_READ0 << CMD_BYTE1_SHIFT;
 	code |= COMMAND_CMD_BYTE1 | COMMAND_CAR_BYTE1 | COMMAND_CAR_BYTE2;
 
@@ -613,6 +614,8 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	u8 status;
 	int ret;
 
+	vf610_nfc_select_target(chip, chip->cur_cs);
+
 	cmd2 |= NAND_CMD_SEQIN << CMD_BYTE1_SHIFT;
 	code |= COMMAND_CMD_BYTE1 | COMMAND_CAR_BYTE1 | COMMAND_CAR_BYTE2;
 
@@ -877,7 +880,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	}
 
 	chip->exec_op = vf610_nfc_exec_op;
-	chip->select_chip = vf610_nfc_select_chip;
 
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
-- 
2.17.1
