Received: from mail-eopbgr40082.outbound.protection.outlook.com ([40.107.4.82]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpjCj-0002mp-CK
 for linux-mtd@lists.infradead.org; Thu, 29 Sep 2016 21:49:22 +0000
From: Han Xu <han.xu@nxp.com>
To: <han.xu@nxp.com>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: fsl-quadspi: QSPI support dynamic LUT change
Date: Thu, 29 Sep 2016 16:49:38 -0500
Message-ID: <1475185778-18252-1-git-send-email-han.xu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

QSPI only support upto 16 LUT slots while the QSPI commands are more
than this number, reserve the last two slots for dynamic change (most
commands used in pairs). Later all extra supported commands will be add
in dynamic lut table, take EVCR/VCR commands as examples.

Also fixed two minor issues
- WR EVCR typo in header file
- RD EVCR command in lut

This patch depends on Yunhui's patch set
https://patchwork.ozlabs.org/patch/660356/

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 111 +++++++++++++++++++++++++++++++++++---
 include/linux/mtd/spi-nor.h       |   6 ++-
 2 files changed, 107 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 193e81b..5ee198f 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -211,10 +211,47 @@
 #define SEQID_BRWR		11
 #define SEQID_RDAR_OR_RD_EVCR	12
 #define SEQID_WRAR		13
-#define SEQID_WD_EVCR           14
+
+/* last two lut slots for dynamic luts*/
+#define SEQID_DYNAMIC_CMD0	14
+#define SEQID_DYNAMIC_CMD1	15
 
 #define QUADSPI_MIN_IOMAP SZ_4M
 
+/* dynamic lut configs */
+#define MAX_LUT_REGS 4
+struct lut_desc {
+	u8 cmd;
+	u32 lut[MAX_LUT_REGS];
+};
+
+/*
+ * define two lut_des in the struct because many commands used in pairs.
+ * To add a single command, just leave the second desc as blank.
+ */
+struct lut_desc_pair {
+	struct lut_desc lut_desc0;
+	struct lut_desc lut_desc1;
+};
+
+struct lut_desc_pair current_lut_pair;
+
+static const struct lut_desc_pair dynamic_lut_table[] = {
+	/* VCR RD/WR pair */
+	{ {SPINOR_OP_RD_VCR, {LUT0(CMD, PAD1, SPINOR_OP_RD_VCR) |
+			     LUT1(FSL_READ, PAD1, 1)} },
+	  {SPINOR_OP_WR_VCR, {LUT0(CMD, PAD1, SPINOR_OP_WR_VCR) |
+			     LUT1(FSL_WRITE, PAD1, 1)} },
+	},
+	/* EVCR RD/WR pair */
+	{ {SPINOR_OP_RD_EVCR, {LUT0(CMD, PAD1, SPINOR_OP_RD_EVCR) |
+			     LUT1(FSL_READ, PAD1, 1)} },
+	  {SPINOR_OP_WR_EVCR, {LUT0(CMD, PAD1, SPINOR_OP_WR_EVCR) |
+			     LUT1(FSL_WRITE, PAD1, 1)} },
+	},
+	{/* sentinel */},
+};
+
 enum fsl_qspi_devtype {
 	FSL_QUADSPI_VYBRID,
 	FSL_QUADSPI_IMX6SX,
@@ -515,7 +552,8 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
 		qspi_writel(q, LUT0(DUMMY, PAD1, 8) | LUT1(FSL_READ, PAD1, 1),
 			    base + QUADSPI_LUT(lut_base + 1));
 	} else {
-		qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RD_EVCR),
+		qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RD_EVCR) |
+				LUT1(FSL_READ, PAD1, 0x1),
 			    base + QUADSPI_LUT(lut_base));
 	}
 
@@ -530,17 +568,72 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
 	qspi_writel(q, LUT0(FSL_WRITE, PAD1, 1),
 			base + QUADSPI_LUT(lut_base + 1));
 
-	/* Write EVCR register */
-	lut_base = SEQID_WD_EVCR * 4;
-	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WD_EVCR),
-		    base + QUADSPI_LUT(lut_base));
+	fsl_qspi_lock_lut(q);
+}
+
+static int fsl_qspi_clk_prep_enable(struct fsl_qspi *q);
+static void fsl_qspi_clk_disable_unprep(struct fsl_qspi *q);
+
+static int fsl_qspi_update_dynamic_lut(struct fsl_qspi *q, int index)
+{
+	void __iomem *base = q->iobase;
+	u32 lut_base;
+	int i;
+	int size;
+
+	fsl_qspi_unlock_lut(q);
+
+	lut_base = SEQID_DYNAMIC_CMD0 * 4;
+	size = ARRAY_SIZE(dynamic_lut_table[index].lut_desc0.lut);
+	for (i = 0; i < size; i++) {
+		qspi_writel(q, dynamic_lut_table[index].lut_desc0.lut[i],
+				base + QUADSPI_LUT(lut_base + i));
+	}
+
+	lut_base = SEQID_DYNAMIC_CMD1 * 4;
+	size = ARRAY_SIZE(dynamic_lut_table[index].lut_desc1.lut);
+	for (i = 0; i < size; i++) {
+		qspi_writel(q, dynamic_lut_table[index].lut_desc1.lut[i],
+				base + QUADSPI_LUT(lut_base + i));
+	}
 
 	fsl_qspi_lock_lut(q);
+
+	return 0;
+}
+
+static int fsl_qspi_search_dynamic_lut(struct fsl_qspi *q, u8 cmd)
+{
+	int i;
+	int ret = 0;
+
+	if (cmd == current_lut_pair.lut_desc0.cmd)
+		return SEQID_DYNAMIC_CMD0;
+	if (cmd == current_lut_pair.lut_desc1.cmd)
+		return SEQID_DYNAMIC_CMD1;
+	for (i = 0; i < ARRAY_SIZE(dynamic_lut_table); i++) {
+		if (cmd == dynamic_lut_table[i].lut_desc0.cmd)
+			ret = SEQID_DYNAMIC_CMD0;
+		if (cmd == dynamic_lut_table[i].lut_desc1.cmd)
+			ret = SEQID_DYNAMIC_CMD1;
+		if (ret) {
+			if (fsl_qspi_update_dynamic_lut(q, i)) {
+				dev_err(q->dev,
+				"failed to update dynamic lut\n");
+				return 0;
+			}
+			current_lut_pair = dynamic_lut_table[i];
+			return ret;
+		}
+	}
+	return ret;
 }
 
 /* Get the SEQID for the command */
 static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
 {
+	int ret;
+
 	switch (cmd) {
 	case SPINOR_OP_READ4_1_1_4:
 	case SPINOR_OP_READ_1_1_4:
@@ -581,11 +674,12 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
 		return SEQID_EN4B;
 	case SPINOR_OP_BRWR:
 		return SEQID_BRWR;
-	case SPINOR_OP_WD_EVCR:
-		return SEQID_WD_EVCR;
 	default:
 		if (cmd == q->nor[0].erase_opcode)
 			return SEQID_SE;
+		ret = fsl_qspi_search_dynamic_lut(q, cmd);
+		if (ret)
+			return ret;
 		dev_err(q->dev, "Unsupported cmd 0x%.2x\n", cmd);
 		break;
 	}
@@ -895,6 +989,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
 
 	/* Init the LUT table again. */
 	fsl_qspi_init_lut(q);
+	fsl_qspi_update_dynamic_lut(q, 0);
 
 	/* Init for AHB read */
 	fsl_qspi_init_abh_read(q);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index db3fe42..cd6111d 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -80,8 +80,10 @@
 #define SPINOR_OP_SPANSION_WRAR	0x71	/* Write any device register */
 
 /* Used for Micron flashes only. */
-#define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
-#define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
+#define SPINOR_OP_RD_EVCR	0x65    /* Read EVCR register */
+#define SPINOR_OP_WR_EVCR	0x61    /* Write EVCR register */
+#define SPINOR_OP_RD_VCR	0x85    /* Read VCR register */
+#define SPINOR_OP_WR_VCR	0x81    /* Write VCR register */
 
 /* Status Register bits. */
 #define SR_WIP			BIT(0)	/* Write in progress */
-- 
1.9.1
