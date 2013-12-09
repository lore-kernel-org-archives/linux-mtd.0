Received: from mail-ea0-x22d.google.com ([2a00:1450:4013:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq6yc-0000NH-1F
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 19:58:47 +0000
Received: by mail-ea0-f173.google.com with SMTP id o10so1813340eaj.4
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2013 11:58:24 -0800 (PST)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: b32955@freescale.com,
	dwmw2@infradead.org,
	dedekind1@gmail.com
Subject: [PATCH v1] mtd: gpmi: Deal with bitflips in erased regions regions
Date: Mon,  9 Dec 2013 20:58:11 +0100
Message-Id: <1386619091-23992-2-git-send-email-eliedebrauwer@gmail.com>
In-Reply-To: <1386619091-23992-1-git-send-email-eliedebrauwer@gmail.com>
References: <1386619091-23992-1-git-send-email-eliedebrauwer@gmail.com>
Cc: Elie De Brauwer <eliedebrauwer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The BCH block typically used with a i.MX28 and GPMI block is only
able to correct bitflips on data actually streamed through the block.
When erasing a block the data does not stream through the BCH block
and therefore not ECC data is written to the NAND chip. This causes
gpmi_ecc_read_page to return failure as soon as a single non-1-bit is
found in an erased page. Typically causing problems at higher levels
(ubifs corrupted empty space warnings).

This patch configures the BCH block to mark a block as 'erased' if
no more than ecc_strength bitflips are found. The result is that
erased blocks are doublechecked by software for bitflips and that
bitflips are corrected and reported, allowing the upper layers to
take proper actions.

Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
---
 drivers/mtd/nand/gpmi-nand/bch-regs.h  |    1 +
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |    7 ++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   40 +++++++++++++++++++++++++++++---
 3 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
index 588f537..b2104de 100644
--- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
+++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
@@ -31,6 +31,7 @@
 
 #define HW_BCH_STATUS0				0x00000010
 #define HW_BCH_MODE				0x00000020
+#define BM_BCH_MODE_ERASE_THRESHOLD_MASK	0xff
 #define HW_BCH_ENCODEPTR			0x00000030
 #define HW_BCH_DATAPTR				0x00000040
 #define HW_BCH_METAPTR				0x00000050
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index aaced29..4236739 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -286,6 +286,13 @@ int bch_set_geometry(struct gpmi_nand_data *this)
 			| BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
 			r->bch_regs + HW_BCH_FLASH0LAYOUT1);
 
+	/*
+	 * Set the tolerance for bitflips when reading erased blocks
+	 * equal to the ecc_strength.
+	 */
+	writel(bch_geo->ecc_strength & BM_BCH_MODE_ERASE_THRESHOLD_MASK,
+		r->bch_regs + HW_BCH_MODE);
+
 	/* Set *all* chip selects to use layout 0. */
 	writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
 
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index dabbc14..766261f 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1012,6 +1012,30 @@ static void block_mark_swapping(struct gpmi_nand_data *this,
 	p[1] = (p[1] & mask) | (from_oob >> (8 - bit));
 }
 
+/*
+ * Count the number of 0 bits in a supposed to be
+ * erased region and correct them. Return the number
+ * of bitflips or zero when the region was correct.
+ */
+static unsigned int erased_sector_bitflips(unsigned char *data,
+					unsigned int chunk,
+					struct bch_geometry *geo)
+{
+	unsigned int flip_bits = 0;
+	int i;
+	int base = geo->ecc_chunk_size * chunk;
+
+	/* Count bitflips */
+	for (i = 0; i < geo->ecc_chunk_size; i++)
+		flip_bits += hweight8(~data[base + i]);
+
+	/* Correct bitflips by 0xFF'ing this chunk. */
+	if (flip_bits)
+		memset(&data[base], 0xFF, geo->ecc_chunk_size);
+
+	return flip_bits;
+}
+
 static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 				uint8_t *buf, int oob_required, int page)
 {
@@ -1023,6 +1047,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	dma_addr_t    auxiliary_phys;
 	unsigned int  i;
 	unsigned char *status;
+	unsigned int  flips;
 	unsigned int  max_bitflips = 0;
 	int           ret;
 
@@ -1057,15 +1082,24 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	status = auxiliary_virt + nfc_geo->auxiliary_status_offset;
 
 	for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
-		if ((*status == STATUS_GOOD) || (*status == STATUS_ERASED))
+		if (*status == STATUS_GOOD)
 			continue;
 
 		if (*status == STATUS_UNCORRECTABLE) {
 			mtd->ecc_stats.failed++;
 			continue;
 		}
-		mtd->ecc_stats.corrected += *status;
-		max_bitflips = max_t(unsigned int, max_bitflips, *status);
+
+		if (*status == STATUS_ERASED)
+			/* Erased block, check/correct bitflips manually. */
+			flips = erased_sector_bitflips(payload_virt, i,
+							nfc_geo);
+		else
+			/* BCH block corrected some errors for us. */
+			flips = *status;
+
+		mtd->ecc_stats.corrected += flips;
+		max_bitflips = max_t(unsigned int, max_bitflips, flips);
 	}
 
 	if (oob_required) {
-- 
1.7.10.4
