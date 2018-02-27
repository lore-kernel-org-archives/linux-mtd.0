Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eqmnl-0000GD-8C
 for linux-mtd@lists.infradead.org; Tue, 27 Feb 2018 21:28:48 +0000
Date: Tue, 27 Feb 2018 22:28:22 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 marcel.ziswiler@toradex.com, richard@nod.at, bpringlemeir@gmail.com,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com,
 dwmw2@infradead.org
Subject: Re: [PATCH v5 1/3] mtd: nand: vf610_nfc: make use of ->exec_op()
Message-ID: <20180227222822.72018875@bbrezillon>
In-Reply-To: <20180226211855.30015-2-stefan@agner.ch>
References: <20180226211855.30015-1-stefan@agner.ch>
 <20180226211855.30015-2-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 26 Feb 2018 22:18:53 +0100
Stefan Agner <stefan@agner.ch> wrote:

> This reworks the driver to make use of ->exec_op() callback. The
> command sequencer of the VF610 NFC aligns well with the new ops
> interface.
> 
> The operations are translated to a NFC command code while filling
> the necessary registers. Instead of using the special status and
> read ID command codes (which require to read status/ID from
> special registers instead of the regular data area) the driver
> now now uses the main data buffer for all commands. This
> simplifies the driver as no special casing is needed.
> 
> For control data (status byte, id bytes and parameter page) the
> driver needs to reverse byte order for little endian CPUs since
> the controller seems to store the bytes in big endian order in
> the data buffer.
> 
> The current state seems to pass MTD tests on a Colibri VF61.

Nice. If you don't mind, I'd like coding style issues reported by
checkpatch to be fixed (see below diff). If you're happy with the diff,
no need to resend a new version, I'll just fix it when applying.

--->8---
diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9d1fb6df0e22..ae85ae9e3727 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -113,12 +113,12 @@
 /* NFC_COL_ADDR Field */
 #define COL_ADDR_MASK				0x0000FFFF
 #define COL_ADDR_SHIFT				0
-#define COL_ADDR(pos, val)			((val & 0xFF) << (8 * (pos)))
+#define COL_ADDR(pos, val)			(((val) & 0xFF) << (8 * (pos)))
 
 /* NFC_ROW_ADDR Field */
 #define ROW_ADDR_MASK				0x00FFFFFF
 #define ROW_ADDR_SHIFT				0
-#define ROW_ADDR(pos, val)			((val & 0xFF) << (8 * (pos)))
+#define ROW_ADDR(pos, val)			(((val) & 0xFF) << (8 * (pos)))
 
 #define ROW_ADDR_CHIP_SEL_RB_MASK		0xF0000000
 #define ROW_ADDR_CHIP_SEL_RB_SHIFT		28
@@ -280,6 +280,7 @@ static inline void vf610_nfc_rd_from_sram(void *dst, const void __iomem *src,
 
 		for (i = 0; i < len; i += 4) {
 			u32 val = be32_to_cpu(__raw_readl(src + i));
+
 			memcpy(dst + i, &val, min(sizeof(val), len - i));
 		}
 	} else {
@@ -314,6 +315,7 @@ static inline void vf610_nfc_wr_to_sram(void __iomem *dst, const void *src,
 
 		for (i = 0; i < len; i += 4) {
 			u32 val;
+
 			memcpy(&val, src + i, min(sizeof(val), len - i));
 			__raw_writel(cpu_to_be32(val), dst + i);
 		}
@@ -617,8 +619,8 @@ static inline void vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row,
 	vf610_nfc_done(nfc);
 }
 
-static inline const struct nand_op_instr *vf610_get_next_instr(
-	const struct nand_subop *subop, int *op_id)
+static inline const struct nand_op_instr *
+vf610_get_next_instr(const struct nand_subop *subop, int *op_id)
 {
 	if (*op_id + 1 >= subop->ninstrs)
 		return NULL;
@@ -629,7 +631,7 @@ static inline const struct nand_op_instr *vf610_get_next_instr(
 }
 
 static int vf610_nfc_cmd(struct nand_chip *chip,
-				const struct nand_subop *subop)
+			 const struct nand_subop *subop)
 {
 	const struct nand_op_instr *instr;
 	struct vf610_nfc *nfc = chip_to_nfc(chip);
@@ -660,6 +662,7 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 
 		for (; i < naddrs; i++) {
 			u8 val = instr->ctx.addr.addrs[i];
+
 			if (i < 2)
 				col |= COL_ADDR(i, val);
 			else
@@ -732,15 +735,13 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 }
 
 static const struct nand_op_parser vf610_nfc_op_parser = NAND_OP_PARSER(
-	NAND_OP_PARSER_PATTERN(
-		vf610_nfc_cmd,
+	NAND_OP_PARSER_PATTERN(vf610_nfc_cmd,
 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
 		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
 		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, PAGE_2K + OOB_MAX),
 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
 		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
-	NAND_OP_PARSER_PATTERN(
-		vf610_nfc_cmd,
+	NAND_OP_PARSER_PATTERN(vf610_nfc_cmd,
 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
 		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
@@ -752,7 +753,8 @@ static int vf610_nfc_exec_op(struct nand_chip *chip,
 			     const struct nand_operation *op,
 			     bool check_only)
 {
-	return nand_op_parser_exec_op(chip, &vf610_nfc_op_parser, op, check_only);
+	return nand_op_parser_exec_op(chip, &vf610_nfc_op_parser, op,
+				      check_only);
 }
 
 /*
@@ -895,8 +897,9 @@ static int vf610_nfc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	return ret;
 }
 
-static int vf610_nfc_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf, int oob_required, int page)
+static int vf610_nfc_read_page_raw(struct mtd_info *mtd,
+				   struct nand_chip *chip, u8 *buf,
+				   int oob_required, int page)
 {
 	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
 	int ret;
@@ -908,8 +911,9 @@ static int vf610_nfc_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	return ret;
 }
 
-static int vf610_nfc_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-				const uint8_t *buf, int oob_required, int page)
+static int vf610_nfc_write_page_raw(struct mtd_info *mtd,
+				    struct nand_chip *chip, const u8 *buf,
+				    int oob_required, int page)
 {
 	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
 	int ret;
@@ -928,7 +932,7 @@ static int vf610_nfc_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip
 }
 
 static int vf610_nfc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
-			int page)
+			      int page)
 {
 	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
 	int ret;
@@ -941,7 +945,7 @@ static int vf610_nfc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 static int vf610_nfc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
-			int page)
+			       int page)
 {
 	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
 	int ret;
