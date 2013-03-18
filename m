Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHY9O-00007G-Nj
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 11:22:50 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 11/11] mtd: gpmi: set the BCH's geometry with the ecc info
Date: Mon, 18 Mar 2013 19:18:54 +0800
Message-ID: <1363605534-24776-12-git-send-email-b32955@freescale.com>
In-Reply-To: <1363605534-24776-1-git-send-email-b32955@freescale.com>
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, matthieu.castet@parrot.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the nand chip provides us the ECC info, we can use it firstly.
The set_geometry_by_ecc_info() will use the ECC info, and
calculate the parameters we need.

Rename the old code to lagacy_set_geometry() which will takes effect
when there is no ECC info from the nand chip or we fails in the ECC info case.

Signed-off-by: Huang Shijie <b32955@freescale.com>
Signed-off-by: Huang Shijie <shijie8@gmail.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  128 +++++++++++++++++++++++++++++++-
 1 files changed, 127 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 717881a..e085ade 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -113,7 +113,128 @@ static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
 	return true;
 }
 
-int common_nfc_set_geometry(struct gpmi_nand_data *this)
+/*
+ * If we can get the ECC information from the nand chip, we do not
+ * need to calculate them ourselves.
+ *
+ * We may have available oob space in this case.
+ */
+static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
+{
+	struct bch_geometry *geo = &this->bch_geometry;
+	struct mtd_info *mtd = &this->mtd;
+	struct nand_chip *chip = mtd->priv;
+	struct nand_oobfree *of = gpmi_hw_ecclayout.oobfree;
+	unsigned int block_mark_bit_offset;
+
+	if (!(chip->ecc_strength > 0 && chip->ecc_size > 0))
+		return false;
+
+	switch (chip->ecc_size) {
+	case SZ_512:
+		geo->gf_len = 13;
+		break;
+	case SZ_1K:
+		geo->gf_len = 14;
+		break;
+	default:
+		dev_err(this->dev,
+			"unsupported nand chip. ecc bits : %d, ecc size : %d\n",
+			chip->ecc_strength, chip->ecc_size);
+		return false;
+	}
+	geo->ecc_chunk_size = chip->ecc_size;
+	geo->ecc_strength = round_up(chip->ecc_strength, 2);
+	if (!gpmi_check_ecc(this))
+		return false;
+
+	/* Keep the C >= O */
+	if (geo->ecc_chunk_size < mtd->oobsize) {
+		dev_err(this->dev,
+			"unsupported nand chip. ecc size: %d, oob size : %d\n",
+			chip->ecc_size, mtd->oobsize);
+		return false;
+	}
+
+	/* The default value, see comment in the lagacy_set_geometry(). */
+	geo->metadata_size = 10;
+
+	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunk_size;
+
+	/*
+	 * Now, the NAND chip with 2K page(data chunk is 512byte) shows below:
+	 *
+	 *    |                          P                            |
+	 *    |<----------------------------------------------------->|
+	 *    |                                                       |
+	 *    |                                        (Block Mark)   |
+	 *    |                      P'                      |      | |     |
+	 *    |<-------------------------------------------->|  D   | |  O' |
+	 *    |                                              |<---->| |<--->|
+	 *    V                                              V      V V     V
+	 *    +---+----------+-+----------+-+----------+-+----------+-+-----+
+	 *    | M |   data   |E|   data   |E|   data   |E|   data   |E|     |
+	 *    +---+----------+-+----------+-+----------+-+----------+-+-----+
+	 *
+	 *	P : the page size for BCH module.
+	 *	E : The ECC strength.
+	 *	G : the length of Galois Field.
+	 *	N : The chunk count of per page.
+	 *	M : the metasize of per page.
+	 *	C : the ecc chunk size, aka the "data" above.
+	 *	P': the nand chip's page size.
+	 *	O : the nand chip's oob size.
+	 *	O': the free oob.
+	 *
+	 *	The formula for P is :
+	 *
+	 *	            E * G * N
+	 *	       P = ------------ + P' + M
+	 *                      8
+	 *
+	 * The position of block mark moves forward in the ECC-based view
+	 * of page, and the delta is:
+	 *
+	 *                   E * G * (N - 1)
+	 *             D = (---------------- + M)
+	 *                          8
+	 *
+	 * Please see the comment in lagacy_set_geometry().
+	 * With the condition C >= O , we still can get same result.
+	 * So the bit position of the physical block mark within the ECC-based
+	 * view of the page is :
+	 *             (P' - D) * 8
+	 */
+	geo->page_size = mtd->writesize + geo->metadata_size +
+		(geo->gf_len * geo->ecc_strength * geo->ecc_chunk_count) / 8;
+
+	/* The available oob size we have. */
+	if (geo->page_size < mtd->writesize + mtd->oobsize) {
+		of->offset = geo->page_size - mtd->writesize;
+		of->length = mtd->oobsize - of->offset;
+		mtd->oobavail = gpmi_hw_ecclayout.oobavail = of->length;
+	}
+
+	geo->payload_size = mtd->writesize;
+
+	geo->auxiliary_status_offset = ALIGN(geo->metadata_size, 4);
+	geo->auxiliary_size = ALIGN(geo->metadata_size, 4)
+				+ ALIGN(geo->ecc_chunk_count, 4);
+
+	if (!this->swap_block_mark)
+		return true;
+
+	/* For bit swap. */
+	block_mark_bit_offset = mtd->writesize * 8 -
+		(geo->ecc_strength * geo->gf_len * (geo->ecc_chunk_count - 1)
+				+ geo->metadata_size * 8);
+
+	geo->block_mark_byte_offset = block_mark_bit_offset / 8;
+	geo->block_mark_bit_offset  = block_mark_bit_offset % 8;
+	return true;
+}
+
+static int lagacy_set_geometry(struct gpmi_nand_data *this)
 {
 	struct bch_geometry *geo = &this->bch_geometry;
 	struct mtd_info *mtd = &this->mtd;
@@ -225,6 +346,11 @@ int common_nfc_set_geometry(struct gpmi_nand_data *this)
 	return 0;
 }
 
+int common_nfc_set_geometry(struct gpmi_nand_data *this)
+{
+	return set_geometry_by_ecc_info(this) ? 0 : lagacy_set_geometry(this);
+}
+
 struct dma_chan *get_dma_chan(struct gpmi_nand_data *this)
 {
 	int chipnr = this->current_chip;
-- 
1.7.1
