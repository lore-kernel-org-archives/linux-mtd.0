From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Han Xu <han.xu@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 02/10] mtd: nand: gpmi: Utilize hardware to detect bitflips in
 erased blocks
Date: Wed,  6 Dec 2017 10:19:17 +0100
Message-Id: <20171206091925.5810-3-s.hauer@pengutronix.de>
In-Reply-To: <20171206091925.5810-1-s.hauer@pengutronix.de>
References: <20171206091925.5810-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The GPMI nand has a hardware feature to ignore bitflips in erased pages.
Use this feature rather than the longish code we have now.
Unfortunately the bitflips in erased pages are not corrected, so we have
to memset the read data before passing it to the upper layers.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 77 ++++------------------------------
 1 file changed, 9 insertions(+), 68 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index d4d824ef64e9..09e8ded3f1e2 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1056,6 +1056,8 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	auxiliary_virt = this->auxiliary_virt;
 	auxiliary_phys = this->auxiliary_phys;
 
+	writel(mtd->bitflip_threshold, this->resources.bch_regs + HW_BCH_MODE);
+
 	/* go! */
 	ret = gpmi_read_page(this, payload_phys, auxiliary_phys);
 	read_page_end(this, buf, nfc_geo->payload_size,
@@ -1076,77 +1078,16 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 			   payload_virt, payload_phys);
 
 	for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
-		if ((*status == STATUS_GOOD) || (*status == STATUS_ERASED))
+		if (*status == STATUS_GOOD)
 			continue;
 
-		if (*status == STATUS_UNCORRECTABLE) {
-			int eccbits = nfc_geo->ecc_strength * nfc_geo->gf_len;
-			u8 *eccbuf = this->raw_buffer;
-			int offset, bitoffset;
-			int eccbytes;
-			int flips;
-
-			/* Read ECC bytes into our internal raw_buffer */
-			offset = nfc_geo->metadata_size * 8;
-			offset += ((8 * nfc_geo->ecc_chunk_size) + eccbits) * (i + 1);
-			offset -= eccbits;
-			bitoffset = offset % 8;
-			eccbytes = DIV_ROUND_UP(offset + eccbits, 8);
-			offset /= 8;
-			eccbytes -= offset;
-			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, offset, -1);
-			chip->read_buf(mtd, eccbuf, eccbytes);
-
-			/*
-			 * ECC data are not byte aligned and we may have
-			 * in-band data in the first and last byte of
-			 * eccbuf. Set non-eccbits to one so that
-			 * nand_check_erased_ecc_chunk() does not count them
-			 * as bitflips.
-			 */
-			if (bitoffset)
-				eccbuf[0] |= GENMASK(bitoffset - 1, 0);
-
-			bitoffset = (bitoffset + eccbits) % 8;
-			if (bitoffset)
-				eccbuf[eccbytes - 1] |= GENMASK(7, bitoffset);
-
-			/*
-			 * The ECC hardware has an uncorrectable ECC status
-			 * code in case we have bitflips in an erased page. As
-			 * nothing was written into this subpage the ECC is
-			 * obviously wrong and we can not trust it. We assume
-			 * at this point that we are reading an erased page and
-			 * try to correct the bitflips in buffer up to
-			 * ecc_strength bitflips. If this is a page with random
-			 * data, we exceed this number of bitflips and have a
-			 * ECC failure. Otherwise we use the corrected buffer.
-			 */
-			if (i == 0) {
-				/* The first block includes metadata */
-				flips = nand_check_erased_ecc_chunk(
-						buf + i * nfc_geo->ecc_chunk_size,
-						nfc_geo->ecc_chunk_size,
-						eccbuf, eccbytes,
-						auxiliary_virt,
-						nfc_geo->metadata_size,
-						nfc_geo->ecc_strength);
-			} else {
-				flips = nand_check_erased_ecc_chunk(
-						buf + i * nfc_geo->ecc_chunk_size,
-						nfc_geo->ecc_chunk_size,
-						eccbuf, eccbytes,
-						NULL, 0,
-						nfc_geo->ecc_strength);
-			}
-
-			if (flips > 0) {
-				max_bitflips = max_t(unsigned int, max_bitflips,
-						     flips);
-				mtd->ecc_stats.corrected += flips;
-				continue;
-			}
+		if (*status == STATUS_ERASED) {
+			memset(buf + nfc_geo->ecc_chunk_size * i, 0xff,
+			       nfc_geo->ecc_chunk_size);
+			continue;
+		}
 
+		if (*status == STATUS_UNCORRECTABLE) {
 			mtd->ecc_stats.failed++;
 			continue;
 		}
-- 
2.11.0
