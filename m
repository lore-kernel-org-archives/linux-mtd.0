Received: from mo-csw1116.securemx.jp ([210.130.202.158]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1flp8e-0005iE-U1
 for linux-mtd@lists.infradead.org; Sat, 04 Aug 2018 05:30:06 +0000
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
To: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Subject: [RFC PATCH v2] mtd: nand: toshiba: Add support for ->exec_op()
Date: Sat,  4 Aug 2018 14:26:18 +0900
Message-Id: <1533360378-2925-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is a patch to support TOSHIBA MEMORY CORPORATION BENAND
memory devices.  This use vendor specific command
(TOSHIBA_NAND_CMD_ECC_STATUS) to know the exact bitflips.  However, I
could not test this patch because I do not have a platform that
supports chip-> exec_op.  Therefore, I post this patch as RFC.

As soon as I get a platform that supports chip-> exec_op, I would like
to test and re-post.

Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
---
 drivers/mtd/nand/raw/nand_toshiba.c | 53 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index 8aec3fa..3f4683b 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -23,14 +23,65 @@
 /* Recommended to rewrite for BENAND */
 #define TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED	BIT(3)
 
+/* ECC Status Read Command for BENAND */
+#define TOSHIBA_NAND_CMD_ECC_STATUS_READ	0x7A
+
+/* ECC Status Mask for BENAND */
+#define TOSHIBA_NAND_ECC_STATUS_MASK		0x0F
+
+/* Uncorrectable Error for BENAND */
+#define TOSHIBA_NAND_ECC_STATUS_UNCORR		0x0F
+
+static int toshiba_nand_benand_read_eccstatus_op(struct nand_chip *chip,
+						 u8 *buf)
+{
+	u8 *ecc_status = buf;
+
+	if (chip->exec_op) {
+		const struct nand_sdr_timings *sdr =
+			nand_get_sdr_timings(&chip->data_interface);
+		struct nand_op_instr instrs[] = {
+			NAND_OP_CMD(TOSHIBA_NAND_CMD_ECC_STATUS_READ,
+				    PSEC_TO_NSEC(sdr->tADL_min)),
+			NAND_OP_8BIT_DATA_IN(chip->ecc.steps, ecc_status, 0),
+		};
+		struct nand_operation op = NAND_OPERATION(instrs);
+
+		return nand_exec_op(chip, &op);
+	}
+
+	return -ENOTSUPP;
+}
+
 static int toshiba_nand_benand_eccstatus(struct mtd_info *mtd,
 					 struct nand_chip *chip)
 {
 	int ret;
 	unsigned int max_bitflips = 0;
-	u8 status;
+	u8 status, ecc_status[8];
 
 	/* Check Status */
+	ret = toshiba_nand_benand_read_eccstatus_op(chip, ecc_status);
+	if (!ret) {
+		unsigned int i, bitflips = 0;
+
+		for (i = 0; i < chip->ecc.steps; i++) {
+			bitflips = ecc_status[i] & TOSHIBA_NAND_ECC_STATUS_MASK;
+			if (bitflips == TOSHIBA_NAND_ECC_STATUS_UNCORR) {
+				mtd->ecc_stats.failed++;
+			} else {
+				mtd->ecc_stats.corrected += bitflips;
+				max_bitflips = max(max_bitflips, bitflips);
+			}
+		}
+
+		return max_bitflips;
+	}
+
+	/*
+	 * Fallback to regular status check if
+	 * toshiba_nand_benand_read_eccstatus_op() failed.
+	 */
 	ret = nand_status_op(chip, &status);
 	if (ret)
 		return ret;
-- 
2.7.4
