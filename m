Received: from mail-db9lp0252.outbound.messaging.microsoft.com
 ([213.199.154.252] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vb6xG-00084B-5g
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2013 10:55:23 +0000
From: Fabio Estevam <fabio.estevam@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: gpmi: Remove unused set_geometry_by_ecc_info()
Date: Tue, 29 Oct 2013 08:54:44 -0200
Message-ID: <1383044084-6532-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 031e2777e0 (mtd: gpmi: fix ECC regression) removed the usage of 
set_geometry_by_ecc_info(), which causes the following build warning:

drivers/mtd/nand/gpmi-nand/gpmi-nand.c:123:13: warning: 'set_geometry_by_ecc_info' defined but not used [-Wunused-function]

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 124 ---------------------------------
 1 file changed, 124 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 7ac2280..b13d41a 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -114,130 +114,6 @@ static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
 	return true;
 }
 
-/*
- * If we can get the ECC information from the nand chip, we do not
- * need to calculate them ourselves.
- *
- * We may have available oob space in this case.
- */
-static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
-{
-	struct bch_geometry *geo = &this->bch_geometry;
-	struct mtd_info *mtd = &this->mtd;
-	struct nand_chip *chip = mtd->priv;
-	struct nand_oobfree *of = gpmi_hw_ecclayout.oobfree;
-	unsigned int block_mark_bit_offset;
-
-	if (!(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0))
-		return false;
-
-	switch (chip->ecc_step_ds) {
-	case SZ_512:
-		geo->gf_len = 13;
-		break;
-	case SZ_1K:
-		geo->gf_len = 14;
-		break;
-	default:
-		dev_err(this->dev,
-			"unsupported nand chip. ecc bits : %d, ecc size : %d\n",
-			chip->ecc_strength_ds, chip->ecc_step_ds);
-		return false;
-	}
-	geo->ecc_chunk_size = chip->ecc_step_ds;
-	geo->ecc_strength = round_up(chip->ecc_strength_ds, 2);
-	if (!gpmi_check_ecc(this))
-		return false;
-
-	/* Keep the C >= O */
-	if (geo->ecc_chunk_size < mtd->oobsize) {
-		dev_err(this->dev,
-			"unsupported nand chip. ecc size: %d, oob size : %d\n",
-			chip->ecc_step_ds, mtd->oobsize);
-		return false;
-	}
-
-	/* The default value, see comment in the legacy_set_geometry(). */
-	geo->metadata_size = 10;
-
-	geo->ecc_chunk_count = mtd->writesize / geo->ecc_chunk_size;
-
-	/*
-	 * Now, the NAND chip with 2K page(data chunk is 512byte) shows below:
-	 *
-	 *    |                          P                            |
-	 *    |<----------------------------------------------------->|
-	 *    |                                                       |
-	 *    |                                        (Block Mark)   |
-	 *    |                      P'                      |      | |     |
-	 *    |<-------------------------------------------->|  D   | |  O' |
-	 *    |                                              |<---->| |<--->|
-	 *    V                                              V      V V     V
-	 *    +---+----------+-+----------+-+----------+-+----------+-+-----+
-	 *    | M |   data   |E|   data   |E|   data   |E|   data   |E|     |
-	 *    +---+----------+-+----------+-+----------+-+----------+-+-----+
-	 *                                                   ^              ^
-	 *                                                   |      O       |
-	 *                                                   |<------------>|
-	 *                                                   |              |
-	 *
-	 *	P : the page size for BCH module.
-	 *	E : The ECC strength.
-	 *	G : the length of Galois Field.
-	 *	N : The chunk count of per page.
-	 *	M : the metasize of per page.
-	 *	C : the ecc chunk size, aka the "data" above.
-	 *	P': the nand chip's page size.
-	 *	O : the nand chip's oob size.
-	 *	O': the free oob.
-	 *
-	 *	The formula for P is :
-	 *
-	 *	            E * G * N
-	 *	       P = ------------ + P' + M
-	 *                      8
-	 *
-	 * The position of block mark moves forward in the ECC-based view
-	 * of page, and the delta is:
-	 *
-	 *                   E * G * (N - 1)
-	 *             D = (---------------- + M)
-	 *                          8
-	 *
-	 * Please see the comment in legacy_set_geometry().
-	 * With the condition C >= O , we still can get same result.
-	 * So the bit position of the physical block mark within the ECC-based
-	 * view of the page is :
-	 *             (P' - D) * 8
-	 */
-	geo->page_size = mtd->writesize + geo->metadata_size +
-		(geo->gf_len * geo->ecc_strength * geo->ecc_chunk_count) / 8;
-
-	/* The available oob size we have. */
-	if (geo->page_size < mtd->writesize + mtd->oobsize) {
-		of->offset = geo->page_size - mtd->writesize;
-		of->length = mtd->oobsize - of->offset;
-	}
-
-	geo->payload_size = mtd->writesize;
-
-	geo->auxiliary_status_offset = ALIGN(geo->metadata_size, 4);
-	geo->auxiliary_size = ALIGN(geo->metadata_size, 4)
-				+ ALIGN(geo->ecc_chunk_count, 4);
-
-	if (!this->swap_block_mark)
-		return true;
-
-	/* For bit swap. */
-	block_mark_bit_offset = mtd->writesize * 8 -
-		(geo->ecc_strength * geo->gf_len * (geo->ecc_chunk_count - 1)
-				+ geo->metadata_size * 8);
-
-	geo->block_mark_byte_offset = block_mark_bit_offset / 8;
-	geo->block_mark_bit_offset  = block_mark_bit_offset % 8;
-	return true;
-}
-
 static int legacy_set_geometry(struct gpmi_nand_data *this)
 {
 	struct bch_geometry *geo = &this->bch_geometry;
-- 
1.8.1.2
