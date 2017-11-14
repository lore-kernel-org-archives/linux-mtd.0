Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEdQS-0002Sk-3G
 for linux-mtd@lists.infradead.org; Tue, 14 Nov 2017 15:47:02 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH 2/3] mtd: nand: add the infrastructure to retrieve the ONFI
 unique ID
Date: Tue, 14 Nov 2017 16:46:21 +0100
Message-Id: <20171114154622.5493-3-miquel.raynal@free-electrons.com>
In-Reply-To: <20171114154622.5493-1-miquel.raynal@free-electrons.com>
References: <20171114154622.5493-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the infrastructure in the NAND core to retrieve the ONFI unique ID.
The controller driver must support ->exec_op(), the NAND chip must be
ONFI and support the feature.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 85 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h  | 19 +++++++++-
 2 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 44574a226980..0bbc1fc04e01 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -5418,6 +5418,85 @@ static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type)
 }
 
 /*
+ * Read the ONFI unique ID and write it to the given *dest pointer.
+ * The ID is 16 bytes wide, repeated with its XORed counterpart, 16 times.
+ *
+ * This function does not select/unselect the CS line.
+ *
+ * Returns 0 if the ID was read a written to dest, an error otherwise.
+ */
+static int nand_read_unique_id(struct nand_chip *chip, char *dest)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	u8 id[ONFI_UNIQUEID_LEN * 2];
+	int string_len = ONFI_FULL_UNIQUEID_STRING_LEN;
+	int ret, i, j, pos;
+
+	/* ->exec_op related definitions */
+	const struct nand_sdr_timings *sdr =
+		nand_get_sdr_timings(&chip->data_interface);
+	u8 addr = 0;
+	struct nand_op_instr instrs[] = {
+		NAND_OP_CMD(NAND_CMD_READ_UNIQUEID, 0),
+		NAND_OP_ADDR(1, &addr, PSEC_TO_NSEC(sdr->tWB_max)),
+		NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tR_max),
+				 PSEC_TO_NSEC(sdr->tRR_min)),
+	};
+	struct nand_operation op = NAND_OPERATION(instrs);
+
+	if (!chip->exec_op)
+		return -ENOTSUPP;
+
+	if (!dest)
+		return -EINVAL;
+
+	if (!(onfi_opt_cmd(chip) & ONFI_OPT_CMD_READ_UNIQUEID))
+		return -ENOTSUPP;
+
+	ret = nand_exec_op(chip, &op);
+	if (ret)
+		return ret;
+
+	/* Pattern is repeated 16 times */
+	for (i = 0; i < ONFI_UNIQUEID_REPETITIONS; i++) {
+		/* Each pattern is 32B wide (the ID + the ID XORed) */
+		if (chip->exec_op) {
+			struct nand_op_instr instrs[] = {
+				NAND_OP_8BIT_DATA_IN(sizeof(id), id, 0),
+			};
+			struct nand_operation op = NAND_OPERATION(instrs);
+
+			ret = nand_exec_op(chip, &op);
+			if (ret)
+				return ret;
+		} else {
+			chip->read_buf(mtd, id, sizeof(id));
+		}
+
+		/* The ID (16B) must be checked with its XORed counterpart */
+		for (j = 0; j < ONFI_UNIQUEID_LEN; j++)
+			if ((id[j] ^ id[j + ONFI_UNIQUEID_LEN]) != 0xFF)
+				break;
+
+		/* ID is correct if the inner 'for' loop went until the end */
+		if (j == ONFI_UNIQUEID_LEN)
+			break;
+	}
+
+	/* A successful read would have break'ed the outer 'for' loop */
+	if (i == ONFI_UNIQUEID_REPETITIONS)
+		return -EINVAL;
+
+	pos = snprintf(dest, string_len, "%02x-", chip->id.data[0]);
+	for (i = 0; i < ONFI_UNIQUEID_LEN; i++)
+		pos += snprintf(dest + pos, string_len - pos, "%02x", id[i]);
+
+	pr_info("chip has unique ID: %s\n", dest);
+
+	return 0;
+}
+
+/*
  * Set the bad block marker/indicator (BBM/BBI) patterns according to some
  * heuristic patterns using various detected parameters (e.g., manufacturer,
  * page size, cell-type information).
@@ -6289,6 +6368,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	struct nand_buffers *nbuf = NULL;
+	char unique_id[ONFI_FULL_UNIQUEID_STRING_LEN];
 	int ret, i;
 
 	/* New bad blocks should be marked in OOB, flash-based BBT, or both */
@@ -6585,6 +6665,11 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->_max_bad_blocks = nand_max_bad_blocks;
 	mtd->writebufsize = mtd->writesize;
 
+	/* Read the unique ID from the first die if available */
+	chip->select_chip(mtd, 0);
+	nand_read_unique_id(chip, unique_id);
+	chip->select_chip(mtd, -1);
+
 	/*
 	 * Initialize bitflip_threshold to its default prior scan_bbt() call.
 	 * scan_bbt() might invoke mtd_read(), thus bitflip_threshold must be
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index a5d73919cddb..9e584c95bc3e 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -85,6 +85,7 @@ void nand_wait_ready(struct mtd_info *mtd);
 #define NAND_CMD_READSTART	0x30
 #define NAND_CMD_RNDOUTSTART	0xE0
 #define NAND_CMD_CACHEDPROG	0x15
+#define NAND_CMD_READ_UNIQUEID	0xED
 
 #define NAND_CMD_NONE		-1
 
@@ -251,8 +252,18 @@ struct nand_chip;
 /* ONFI subfeature parameters length */
 #define ONFI_SUBFEATURE_PARAM_LEN	4
 
-/* ONFI optional commands SET/GET FEATURES supported? */
+/* ONFI optional commands supported */
 #define ONFI_OPT_CMD_SET_GET_FEATURES	(1 << 2)
+#define ONFI_OPT_CMD_READ_UNIQUEID	(1 << 5)
+
+/*
+ * ONFI unique ID length and number of repetitions. The full unique ID is the
+ * manufacturer ID (1B) plus the unique device ID (16B). Also count the '-'
+ * between both IDs and the '\0' at the end in the 'STRING_LEN'.
+ */
+#define ONFI_UNIQUEID_LEN		16
+#define ONFI_UNIQUEID_REPETITIONS	16
+#define ONFI_FULL_UNIQUEID_STRING_LEN	((1 + ONFI_UNIQUEID_LEN) * 2 + 2)
 
 struct nand_onfi_params {
 	/* rev info and features block */
@@ -1556,6 +1567,12 @@ static inline int onfi_feature(struct nand_chip *chip)
 	return chip->onfi_version ? le16_to_cpu(chip->onfi_params.features) : 0;
 }
 
+/* return the supported optional commands */
+static inline int onfi_opt_cmd(struct nand_chip *chip)
+{
+	return chip->onfi_version ? le16_to_cpu(chip->onfi_params.opt_cmd) : 0;
+}
+
 /* return the supported asynchronous timing mode. */
 static inline int onfi_get_async_timing_mode(struct nand_chip *chip)
 {
-- 
2.11.0
