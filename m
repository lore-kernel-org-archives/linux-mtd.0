Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eHrdS-0007UP-JV
 for linux-mtd@lists.infradead.org; Thu, 23 Nov 2017 13:33:48 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: denali: rename misleading dma_buf to tmp_buf
Date: Thu, 23 Nov 2017 22:32:28 +0900
Message-Id: <1511443948-18474-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The "dma_buf" is not used for a DMA bounce buffer, but for arranging
the transferred data for the syndrome page layout.  In fact, it is
used in the PIO mode as well, so "dma_buf" is a misleading name.
Rename it to "tmp_buf".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 5124f8a..34008a0 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -710,12 +710,12 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	int ecc_steps = chip->ecc.steps;
 	int ecc_size = chip->ecc.size;
 	int ecc_bytes = chip->ecc.bytes;
-	void *dma_buf = denali->buf;
+	void *tmp_buf = denali->buf;
 	int oob_skip = denali->oob_skip_bytes;
 	size_t size = writesize + oobsize;
 	int ret, i, pos, len;
 
-	ret = denali_data_xfer(denali, dma_buf, size, page, 1, 0);
+	ret = denali_data_xfer(denali, tmp_buf, size, page, 1, 0);
 	if (ret)
 		return ret;
 
@@ -730,11 +730,11 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 			else if (pos + len > writesize)
 				len = writesize - pos;
 
-			memcpy(buf, dma_buf + pos, len);
+			memcpy(buf, tmp_buf + pos, len);
 			buf += len;
 			if (len < ecc_size) {
 				len = ecc_size - len;
-				memcpy(buf, dma_buf + writesize + oob_skip,
+				memcpy(buf, tmp_buf + writesize + oob_skip,
 				       len);
 				buf += len;
 			}
@@ -745,7 +745,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 		uint8_t *oob = chip->oob_poi;
 
 		/* BBM at the beginning of the OOB area */
-		memcpy(oob, dma_buf + writesize, oob_skip);
+		memcpy(oob, tmp_buf + writesize, oob_skip);
 		oob += oob_skip;
 
 		/* OOB ECC */
@@ -758,11 +758,11 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 			else if (pos + len > writesize)
 				len = writesize - pos;
 
-			memcpy(oob, dma_buf + pos, len);
+			memcpy(oob, tmp_buf + pos, len);
 			oob += len;
 			if (len < ecc_bytes) {
 				len = ecc_bytes - len;
-				memcpy(oob, dma_buf + writesize + oob_skip,
+				memcpy(oob, tmp_buf + writesize + oob_skip,
 				       len);
 				oob += len;
 			}
@@ -770,7 +770,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 
 		/* OOB free */
 		len = oobsize - (oob - chip->oob_poi);
-		memcpy(oob, dma_buf + size - len, len);
+		memcpy(oob, tmp_buf + size - len, len);
 	}
 
 	return 0;
@@ -841,7 +841,7 @@ static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	int ecc_steps = chip->ecc.steps;
 	int ecc_size = chip->ecc.size;
 	int ecc_bytes = chip->ecc.bytes;
-	void *dma_buf = denali->buf;
+	void *tmp_buf = denali->buf;
 	int oob_skip = denali->oob_skip_bytes;
 	size_t size = writesize + oobsize;
 	int i, pos, len;
@@ -851,7 +851,7 @@ static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	 * This simplifies the logic.
 	 */
 	if (!buf || !oob_required)
-		memset(dma_buf, 0xff, size);
+		memset(tmp_buf, 0xff, size);
 
 	/* Arrange the buffer for syndrome payload/ecc layout */
 	if (buf) {
@@ -864,11 +864,11 @@ static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 			else if (pos + len > writesize)
 				len = writesize - pos;
 
-			memcpy(dma_buf + pos, buf, len);
+			memcpy(tmp_buf + pos, buf, len);
 			buf += len;
 			if (len < ecc_size) {
 				len = ecc_size - len;
-				memcpy(dma_buf + writesize + oob_skip, buf,
+				memcpy(tmp_buf + writesize + oob_skip, buf,
 				       len);
 				buf += len;
 			}
@@ -879,7 +879,7 @@ static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 		const uint8_t *oob = chip->oob_poi;
 
 		/* BBM at the beginning of the OOB area */
-		memcpy(dma_buf + writesize, oob, oob_skip);
+		memcpy(tmp_buf + writesize, oob, oob_skip);
 		oob += oob_skip;
 
 		/* OOB ECC */
@@ -892,11 +892,11 @@ static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 			else if (pos + len > writesize)
 				len = writesize - pos;
 
-			memcpy(dma_buf + pos, oob, len);
+			memcpy(tmp_buf + pos, oob, len);
 			oob += len;
 			if (len < ecc_bytes) {
 				len = ecc_bytes - len;
-				memcpy(dma_buf + writesize + oob_skip, oob,
+				memcpy(tmp_buf + writesize + oob_skip, oob,
 				       len);
 				oob += len;
 			}
@@ -904,10 +904,10 @@ static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 
 		/* OOB free */
 		len = oobsize - (oob - chip->oob_poi);
-		memcpy(dma_buf + size - len, oob, len);
+		memcpy(tmp_buf + size - len, oob, len);
 	}
 
-	return denali_data_xfer(denali, dma_buf, size, page, 1, 1);
+	return denali_data_xfer(denali, tmp_buf, size, page, 1, 1);
 }
 
 static int denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
-- 
2.7.4
