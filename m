Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1feKd1-00074B-Gz
 for linux-mtd@lists.infradead.org; Sat, 14 Jul 2018 13:30:30 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/4] mtd: rawnand: marvell: add a return code to the parsing
 function
Date: Sat, 14 Jul 2018 15:30:01 +0200
Message-Id: <20180714133003.25187-2-miquel.raynal@bootlin.com>
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

Prepare the fact that this function could error out in a future change.
In this patch, just treat the returned value from this function and
error out if needed in the calling functions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 41 ++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index ebb1d141b900..07b8a2677c10 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -1536,9 +1536,9 @@ static int marvell_nfc_hw_ecc_bch_write_oob(struct mtd_info *mtd,
 }
 
 /* NAND framework ->exec_op() hooks and related helpers */
-static void marvell_nfc_parse_instructions(struct nand_chip *chip,
-					   const struct nand_subop *subop,
-					   struct marvell_nfc_op *nfc_op)
+static int marvell_nfc_parse_instructions(struct nand_chip *chip,
+					  const struct nand_subop *subop,
+					  struct marvell_nfc_op *nfc_op)
 {
 	const struct nand_op_instr *instr = NULL;
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
@@ -1622,6 +1622,8 @@ static void marvell_nfc_parse_instructions(struct nand_chip *chip,
 			break;
 		}
 	}
+
+	return 0;
 }
 
 static int marvell_nfc_xfer_data_pio(struct nand_chip *chip,
@@ -1662,7 +1664,10 @@ static int marvell_nfc_monolithic_access_exec(struct nand_chip *chip,
 	bool reading;
 	int ret;
 
-	marvell_nfc_parse_instructions(chip, subop, &nfc_op);
+	ret = marvell_nfc_parse_instructions(chip, subop, &nfc_op);
+	if (ret)
+		return ret;
+
 	reading = (nfc_op.data_instr->type == NAND_OP_DATA_IN_INSTR);
 
 	ret = marvell_nfc_prepare_cmd(chip);
@@ -1725,7 +1730,9 @@ static int marvell_nfc_naked_access_exec(struct nand_chip *chip,
 	struct marvell_nfc_op nfc_op;
 	int ret;
 
-	marvell_nfc_parse_instructions(chip, subop, &nfc_op);
+	ret = marvell_nfc_parse_instructions(chip, subop, &nfc_op);
+	if (ret)
+		return ret;
 
 	/*
 	 * Naked access are different in that they need to be flagged as naked
@@ -1797,7 +1804,9 @@ static int marvell_nfc_naked_waitrdy_exec(struct nand_chip *chip,
 	struct marvell_nfc_op nfc_op;
 	int ret;
 
-	marvell_nfc_parse_instructions(chip, subop, &nfc_op);
+	ret = marvell_nfc_parse_instructions(chip, subop, &nfc_op);
+	if (ret)
+		return ret;
 
 	ret = marvell_nfc_wait_op(chip, nfc_op.rdy_timeout_ms);
 	cond_delay(nfc_op.rdy_delay_ns);
@@ -1811,7 +1820,10 @@ static int marvell_nfc_read_id_type_exec(struct nand_chip *chip,
 	struct marvell_nfc_op nfc_op;
 	int ret;
 
-	marvell_nfc_parse_instructions(chip, subop, &nfc_op);
+	ret = marvell_nfc_parse_instructions(chip, subop, &nfc_op);
+	if (ret)
+		return ret;
+
 	nfc_op.ndcb[0] &= ~NDCB0_CMD_TYPE(TYPE_READ);
 	nfc_op.ndcb[0] |= NDCB0_CMD_TYPE(TYPE_READ_ID);
 
@@ -1851,7 +1863,10 @@ static int marvell_nfc_read_status_exec(struct nand_chip *chip,
 	struct marvell_nfc_op nfc_op;
 	int ret;
 
-	marvell_nfc_parse_instructions(chip, subop, &nfc_op);
+	ret = marvell_nfc_parse_instructions(chip, subop, &nfc_op);
+	if (ret)
+		return ret;
+
 	nfc_op.ndcb[0] &= ~NDCB0_CMD_TYPE(TYPE_READ);
 	nfc_op.ndcb[0] |= NDCB0_CMD_TYPE(TYPE_STATUS);
 
@@ -1891,7 +1906,10 @@ static int marvell_nfc_reset_cmd_type_exec(struct nand_chip *chip,
 	struct marvell_nfc_op nfc_op;
 	int ret;
 
-	marvell_nfc_parse_instructions(chip, subop, &nfc_op);
+	ret = marvell_nfc_parse_instructions(chip, subop, &nfc_op);
+	if (ret)
+		return ret;
+
 	nfc_op.ndcb[0] |= NDCB0_CMD_TYPE(TYPE_RESET);
 
 	ret = marvell_nfc_prepare_cmd(chip);
@@ -1920,7 +1938,10 @@ static int marvell_nfc_erase_cmd_type_exec(struct nand_chip *chip,
 	struct marvell_nfc_op nfc_op;
 	int ret;
 
-	marvell_nfc_parse_instructions(chip, subop, &nfc_op);
+	ret = marvell_nfc_parse_instructions(chip, subop, &nfc_op);
+	if (ret)
+		return ret;
+
 	nfc_op.ndcb[0] |= NDCB0_CMD_TYPE(TYPE_ERASE);
 
 	ret = marvell_nfc_prepare_cmd(chip);
-- 
2.14.1
