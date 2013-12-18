Received: from mail-ee0-x22e.google.com ([2a00:1450:4013:c00::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtMTH-0008Mg-2Z
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2013 19:07:53 +0000
Received: by mail-ee0-f46.google.com with SMTP id d49so29273eek.19
 for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2013 11:07:29 -0800 (PST)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: b32955@freescale.com, dwmw2@infradead.org, dedekind1@gmail.com,
 computersforpeace@gmail.com, shijie8@gmail.com
Subject: [PATCH v6] mtd: gpmi: Deal with bitflips in erased regions regions
Date: Wed, 18 Dec 2013 20:07:12 +0100
Message-Id: <1387393632-5338-2-git-send-email-eliedebrauwer@gmail.com>
In-Reply-To: <1387393632-5338-1-git-send-email-eliedebrauwer@gmail.com>
References: <1387393632-5338-1-git-send-email-eliedebrauwer@gmail.com>
Cc: Elie De Brauwer <eliedebrauwer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The BCH block typically used with a GPMI block on an i.MX28/i.MX6 is only
able to correct bitflips on data actually streamed through the block.
When erasing a block the data does not stream through the BCH block
and therefore no ECC data is written to the NAND chip. This causes
gpmi_ecc_read_page to return failure as soon as a single non-1-bit is
found in an erased page. Typically causing problems at higher levels
(ubifs corrupted empty space warnings). This problem was also observed
when using SLC NAND devices.

This patch configures the BCH block to mark a block as 'erased' if
not too much bitflips are found. Next HW_BCH_STATUS0:ALLONES
is used to check if the data read were all ones, indicating a read of a
properly erased chunk was performed. If this was not the case a slow path
is entered where bitflips are counted and corrected in software,
allowing the upper layers to take proper actions.

Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
Acked-by: Peter Korsgaard <peter@korsgaard.com>
---
 drivers/mtd/nand/gpmi-nand/bch-regs.h  |  2 ++
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 18 ++++++++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 44 +++++++++++++++++++++++++++++++---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  1 +
 4 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
index 588f537..a30502f 100644
--- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
+++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
@@ -30,7 +30,9 @@
 #define BM_BCH_CTRL_COMPLETE_IRQ		(1 << 0)
 
 #define HW_BCH_STATUS0				0x00000010
+#define BM_BCH_STATUS0_ALLONES_MASK		(1 << 4)
 #define HW_BCH_MODE				0x00000020
+#define BM_BCH_MODE_ERASE_THRESHOLD_MASK	0xff
 #define HW_BCH_ENCODEPTR			0x00000030
 #define HW_BCH_DATAPTR				0x00000040
 #define HW_BCH_METAPTR				0x00000050
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index aaced29..24f295f 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -244,6 +244,7 @@ int bch_set_geometry(struct gpmi_nand_data *this)
 	unsigned int ecc_strength;
 	unsigned int page_size;
 	unsigned int gf_len;
+	unsigned int erase_threshold;
 	int ret;
 
 	if (common_nfc_set_geometry(this))
@@ -286,6 +287,14 @@ int bch_set_geometry(struct gpmi_nand_data *this)
 			| BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
 			r->bch_regs + HW_BCH_FLASH0LAYOUT1);
 
+	/* Set the tolerance for bitflips when reading erased blocks. */
+	erase_threshold = gf_len / 2;
+	if (erase_threshold > bch_geo->ecc_strength)
+		erase_threshold = bch_geo->ecc_strength;
+
+	writel(erase_threshold & BM_BCH_MODE_ERASE_THRESHOLD_MASK,
+		r->bch_regs + HW_BCH_MODE);
+
 	/* Set *all* chip selects to use layout 0. */
 	writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
 
@@ -1094,6 +1103,15 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
 	return reg & mask;
 }
 
+/* Returns 1 if the last transaction consisted only out of ones. */
+int gpmi_all_ones(struct gpmi_nand_data *this)
+{
+	struct resources *r = &this->resources;
+	uint32_t reg = readl(r->bch_regs + HW_BCH_STATUS0);
+
+	return reg & BM_BCH_STATUS0_ALLONES_MASK;
+}
+
 static inline void set_dma_type(struct gpmi_nand_data *this,
 					enum dma_ops_type type)
 {
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index dabbc14..81488a0 100644
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
 
@@ -1057,15 +1082,28 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
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
+		if (*status == STATUS_ERASED) {
+			if (gpmi_all_ones(this))
+				break;
+			else
+				/* Erased block with bitflips. */
+				flips = erased_sector_bitflips(payload_virt, i,
+							       nfc_geo);
+		} else {
+			/* BCH block corrected some errors for us. */
+			flips = *status;
+		}
+
+		mtd->ecc_stats.corrected += flips;
+		max_bitflips = max_t(unsigned int, max_bitflips, flips);
 	}
 
 	if (oob_required) {
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index a7685e3..98db09e 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -268,6 +268,7 @@ extern void gpmi_clear_bch(struct gpmi_nand_data *);
 extern void gpmi_dump_info(struct gpmi_nand_data *);
 extern int bch_set_geometry(struct gpmi_nand_data *);
 extern int gpmi_is_ready(struct gpmi_nand_data *, unsigned chip);
+extern int gpmi_all_ones(struct gpmi_nand_data *);
 extern int gpmi_send_command(struct gpmi_nand_data *);
 extern void gpmi_begin(struct gpmi_nand_data *);
 extern void gpmi_end(struct gpmi_nand_data *);
-- 
1.8.5.1
