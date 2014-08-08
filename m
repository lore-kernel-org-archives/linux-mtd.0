Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFgFe-00054O-KA
 for linux-mtd@lists.infradead.org; Fri, 08 Aug 2014 09:14:19 +0000
From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: atmel_nand: remove pmecc_bytes_per_sector,
 use chip->ecc.bytes instead
Date: Fri, 8 Aug 2014 17:12:35 +0800
Message-ID: <1407489155-16545-2-git-send-email-josh.wu@atmel.com>
In-Reply-To: <1407489155-16545-1-git-send-email-josh.wu@atmel.com>
References: <1407489155-16545-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Josh Wu <josh.wu@atmel.com>, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For PMECC, the pmecc_bytes_per_sector has same meaning as ecc.bytes.
So remove pmecc_bytes_per_sector and use ecc.bytes instead.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 1dc3988..effa7a29 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -128,7 +128,6 @@ struct atmel_nand_host {
 	u32			pmecc_lookup_table_offset_512;
 	u32			pmecc_lookup_table_offset_1024;
 
-	int			pmecc_bytes_per_sector;
 	int			pmecc_degree;	/* Degree of remainders */
 	int			pmecc_cw_len;	/* Length of codeword */
 
@@ -840,7 +839,7 @@ static void pmecc_correct_data(struct mtd_info *mtd, uint8_t *buf, uint8_t *ecc,
 				pos, bit_pos, err_byte, *(buf + byte_pos));
 		} else {
 			/* Bit flip in OOB area */
-			tmp = sector_num * host->pmecc_bytes_per_sector
+			tmp = sector_num * nand_chip->ecc.bytes
 					+ (byte_pos - sector_size);
 			err_byte = ecc[tmp];
 			ecc[tmp] ^= (1 << bit_pos);
@@ -889,7 +888,7 @@ normal_check:
 				return -EIO;
 			} else {
 				pmecc_correct_data(mtd, buf_pos, ecc, i,
-					host->pmecc_bytes_per_sector, err_nbr);
+					nand_chip->ecc.bytes, err_nbr);
 				mtd->ecc_stats.corrected += err_nbr;
 				total_err += err_nbr;
 			}
@@ -984,10 +983,10 @@ static int atmel_nand_pmecc_write_page(struct mtd_info *mtd,
 	}
 
 	for (i = 0; i < chip->ecc.steps; i++) {
-		for (j = 0; j < host->pmecc_bytes_per_sector; j++) {
+		for (j = 0; j < chip->ecc.bytes; j++) {
 			int pos;
 
-			pos = i * host->pmecc_bytes_per_sector + j;
+			pos = i * chip->ecc.bytes + j;
 			chip->oob_poi[eccpos[pos]] =
 				pmecc_readb_ecc_relaxed(host->ecc, i, j);
 		}
@@ -1183,14 +1182,12 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
 		host->pmecc_degree = (sector_size == 512) ?
 			PMECC_GF_DIMENSION_13 : PMECC_GF_DIMENSION_14;
 		host->pmecc_cw_len = (1 << host->pmecc_degree) - 1;
-		host->pmecc_bytes_per_sector = pmecc_get_ecc_bytes(
-			cap, sector_size);
 		host->pmecc_alpha_to = pmecc_get_alpha_to(host);
 		host->pmecc_index_of = host->pmecc_rom_base +
 			host->pmecc_lookup_table_offset;
 
 		nand_chip->ecc.strength = cap;
-		nand_chip->ecc.bytes = host->pmecc_bytes_per_sector;
+		nand_chip->ecc.bytes = pmecc_get_ecc_bytes(cap, sector_size);
 		nand_chip->ecc.steps = mtd->writesize / sector_size;
 		nand_chip->ecc.total = nand_chip->ecc.bytes *
 			nand_chip->ecc.steps;
-- 
1.9.1
