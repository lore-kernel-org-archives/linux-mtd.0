Received: from mail-ee0-x231.google.com ([2a00:1450:4013:c00::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0caI-00017g-ID
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 19:45:08 +0000
Received: by mail-ee0-f49.google.com with SMTP id c41so271891eek.36
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2014 11:44:43 -0800 (PST)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: b32955@freescale.com, dwmw2@infradead.org, dedekind1@gmail.com,
 computersforpeace@gmail.com, shijie8@gmail.com
Subject: [PATCH v0] mtd: gpmi: Use cached syndromes to speedup erased region
 bitflip detection.
Date: Tue,  7 Jan 2014 20:44:33 +0100
Message-Id: <1389123873-30663-2-git-send-email-eliedebrauwer@gmail.com>
In-Reply-To: <1389123873-30663-1-git-send-email-eliedebrauwer@gmail.com>
References: <1389123873-30663-1-git-send-email-eliedebrauwer@gmail.com>
Cc: Elie De Brauwer <eliedebrauwer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When reading an erased page detection of bitflips in this page needs
to be done in software. This is currently done by calculating the
hamming weight of each individual byte which scales linearly with
the page size and results in a decreased read speed.

The BCH block has an opion to write the computed syndromes to auxiliary
memory for each transaction (see HW_BCH_CTRL:DEBUGSYNDROME, or also
Figure 16-4 in the i.MX28 reference manual). If the syndromes of
properly erased blocks are known it is possible to distinguish faster
between a properly erased page and an erased page with bitflips. This
compares scales linearly with the ECC strength and number of data blocks
the page is split into (as opposed to page size).

Hence the first time a properly erase block is found its syndromes
are put in a cache, and all successive reads of an erased block
compare the syndromes (rather than the individual bytes). The only
catch here is that the syndromes (SM) of the first block cover the
first datablock and the metadata. And the successive syndromes (SD) cover
the other data blocks. So two sets of syndromes will need to be stored.

+--------------------------------------------+
| Meta | Data0 | Data1 | Data2 | ... | Datan |
+--------------------------------------------+
 <-----SM-----> <--SD-> <--SD->  ...  <--SD->

Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
---
 drivers/mtd/nand/gpmi-nand/bch-regs.h  |  1 +
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  4 ++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 95 ++++++++++++++++++++++++++++++++--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  6 +++
 4 files changed, 101 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
index b2104de..e828c59 100644
--- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
+++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
@@ -26,6 +26,7 @@
 #define HW_BCH_CTRL_CLR				0x00000008
 #define HW_BCH_CTRL_TOG				0x0000000c
 
+#define BM_BCH_CTRL_DEBUGSYNDROME		(1 << 22)
 #define BM_BCH_CTRL_COMPLETE_IRQ_EN		(1 << 8)
 #define BM_BCH_CTRL_COMPLETE_IRQ		(1 << 0)
 
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index b6a7aa8..440cd52 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -307,6 +307,10 @@ int bch_set_geometry(struct gpmi_nand_data *this)
 	writel(erase_threshold & BM_BCH_MODE_ERASE_THRESHOLD_MASK,
 		r->bch_regs + HW_BCH_MODE);
 
+	/* The syndromes should be written to aux mem*/
+	writel(BM_BCH_CTRL_DEBUGSYNDROME,
+		r->bch_regs + HW_BCH_CTRL_SET);
+
 	/* Set *all* chip selects to use layout 0. */
 	writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
 
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index eac6714..f0a8489 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -219,8 +219,21 @@ static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
 	geo->payload_size = mtd->writesize;
 
 	geo->auxiliary_status_offset = ALIGN(geo->metadata_size, 4);
+
+	/*
+	 * The syndromes consist out of 2*t 13-bit symbols each
+	 * stored as a 16 bit halfword, per chunk. Hence 4 byte per
+	 * ECC bit per chunk.
+	 */
+	geo->auxiliary_syndrome_size = 4 * geo->ecc_strength *
+					geo->ecc_chunk_count;
+
 	geo->auxiliary_size = ALIGN(geo->metadata_size, 4)
-				+ ALIGN(geo->ecc_chunk_count, 4);
+				+ ALIGN(geo->ecc_chunk_count, 4)
+				+ geo->auxiliary_syndrome_size;
+
+	geo->auxiliary_syndrome_offset = ALIGN(geo->metadata_size, 4)
+					+ ALIGN(geo->ecc_chunk_count, 4);
 
 	if (!this->swap_block_mark)
 		return true;
@@ -286,8 +299,18 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 	metadata_size = ALIGN(geo->metadata_size, 4);
 	status_size   = ALIGN(geo->ecc_chunk_count, 4);
 
-	geo->auxiliary_size = metadata_size + status_size;
+	/*
+	 * The syndromes consist out of 2*t 13-bit symbols each
+	 * stored as a 16 bit halfword, per chunk. Hence 4 byte per
+	 * ECC bit per chunk.
+	 */
+	geo->auxiliary_syndrome_size = 4 * geo->ecc_strength *
+					geo->ecc_chunk_count;
+
+	geo->auxiliary_size = metadata_size + status_size +
+				geo->auxiliary_syndrome_size;
 	geo->auxiliary_status_offset = metadata_size;
+	geo->auxiliary_syndrome_offset = metadata_size + status_size;
 
 	if (!this->swap_block_mark)
 		return 0;
@@ -761,6 +784,18 @@ static void send_page_end(struct gpmi_nand_data *this,
 		dma_unmap_single(dev, used_phys, length, DMA_TO_DEVICE);
 }
 
+static void gpmi_free_syndrome_buffer(struct gpmi_nand_data *this)
+{
+	if (this->syndrome_data)
+		kfree(this->syndrome_data);
+
+	if (this->syndrome_metadata)
+		kfree(this->syndrome_metadata);
+
+	this->syndrome_data = NULL;
+	this->syndrome_metadata = NULL;
+}
+
 static void gpmi_free_dma_buffer(struct gpmi_nand_data *this)
 {
 	struct device *dev = this->dev;
@@ -959,25 +994,74 @@ static void block_mark_swapping(struct gpmi_nand_data *this,
 }
 
 /*
+ * Count number of zero bits in a region.
+ */
+static unsigned int num_zero_bits(unsigned char *data, int len)
+{
+	int i;
+	int num = 0;
+	for (i = 0; i < len; i++)
+		num += hweight8(~data[i]);
+	return num;
+}
+
+/*
  * Count the number of 0 bits in a supposed to be
  * erased region and correct them. Return the number
  * of bitflips or zero when the region was correct.
  */
 static unsigned int erased_sector_bitflips(unsigned char *data,
+					unsigned char * aux,
 					unsigned int chunk,
-					struct bch_geometry *geo)
+					struct gpmi_nand_data *this)
 {
+	struct bch_geometry *geo = &this->bch_geometry;
 	unsigned int flip_bits = 0;
 	int i;
 	int base = geo->ecc_chunk_size * chunk;
+	int syndrome_size = geo->auxiliary_syndrome_size / geo->ecc_chunk_count;
+	int aux_offset = geo->auxiliary_syndrome_offset + chunk * syndrome_size;
+	char ** syndrome_cache = &this->syndrome_data;
+	if (chunk == 0)
+		syndrome_cache = &this->syndrome_metadata;
+
+	if (*syndrome_cache)
+	{
+		/* Fast path with cached syndromes */
+		if (memcmp(*syndrome_cache, &aux[aux_offset], syndrome_size))
+			goto slow_path;
+		return 0;
+	}
+	else
+	{
+		/*
+		 * Cache the syndromes if the data is valid. For chunk 0
+		 * data and metadata should be all 0xff, for the other chunks
+		 * data should be all 0xff.
+		 */
+		if (num_zero_bits(&data[base], geo->ecc_chunk_size) ||
+		(chunk == 0 && num_zero_bits(&aux[0], geo->metadata_size)))
+			goto slow_path;
+
+		*syndrome_cache = kmalloc(syndrome_size, GFP_KERNEL);
+		if ( !*syndrome_cache)
+			goto slow_path;
+
+		memcpy(*syndrome_cache, &aux[aux_offset], syndrome_size);
+
+		return 0;
+	}
 
+slow_path:
 	/* Count bitflips */
 	for (i = 0; i < geo->ecc_chunk_size; i++)
 		flip_bits += hweight8(~data[base + i]);
+	flip_bits = num_zero_bits(&data[base], geo->ecc_chunk_size);
 
 	/* Correct bitflips by 0xFF'ing this chunk. */
 	if (flip_bits)
 		memset(&data[base], 0xFF, geo->ecc_chunk_size);
+	memset(&data[base], 0xFF, geo->ecc_chunk_size);
 
 	return flip_bits;
 }
@@ -1042,8 +1126,8 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 		 * the BCH block.
 		 */
 		if (*status == STATUS_ERASED)
-			flips = erased_sector_bitflips(payload_virt, i,
-							       nfc_geo);
+			flips = erased_sector_bitflips(payload_virt,
+						auxiliary_virt, i, this);
 		else
 			flips = *status;
 
@@ -1561,6 +1645,7 @@ static int gpmi_set_geometry(struct gpmi_nand_data *this)
 static void gpmi_nand_exit(struct gpmi_nand_data *this)
 {
 	nand_release(&this->mtd);
+	gpmi_free_syndrome_buffer(this);
 	gpmi_free_dma_buffer(this);
 }
 
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index 4c801fa..136f8e9 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -62,6 +62,8 @@ struct bch_geometry {
 	unsigned int  payload_size;
 	unsigned int  auxiliary_size;
 	unsigned int  auxiliary_status_offset;
+	unsigned int  auxiliary_syndrome_offset;
+	unsigned int  auxiliary_syndrome_size;
 	unsigned int  block_mark_byte_offset;
 	unsigned int  block_mark_bit_offset;
 };
@@ -156,6 +158,10 @@ struct gpmi_nand_data {
 	uint8_t			*upper_buf;
 	int			upper_len;
 
+	/* Syndrome caches */
+	char			*syndrome_data;
+	char			*syndrome_metadata;
+
 	/* for DMA operations */
 	bool			direct_dma_map_ok;
 
-- 
1.8.5.2
