Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMc2-0002DV-FO
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:41 +0000
Received: by mail-wg0-f49.google.com with SMTP id a1so80135wgh.32
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:21:17 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 31/47] mtd: nand: stm_nand_bch: scan block for BBM(s) according
 to specified BBT options
Date: Tue, 25 Mar 2014 08:19:48 +0000
Message-Id: <1395735604-26706-32-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, kernel@stlinux.com, lee.jones@linaro.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Search the specified (first and, second or last) page in a block for
the BBT. Support Hamming or Advanced Flex Mode (AFM) BBMs too.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 62 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 4812431..29eeee8 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -643,6 +643,66 @@ static int bbt_is_block_bad(uint8_t *bbt, uint32_t block)
 	return bbt_get_block_mark(bbt, block) == BBT_MARK_GOOD ? 0 : 1;
 }
 
+/* Scan page for BBM(s), according to specified BBT options */
+static int nandi_scan_bad_block_markers_page(struct nandi_controller *nandi,
+					     uint32_t page)
+{
+	struct mtd_info *mtd = &nandi->info.mtd;
+	struct nand_chip *chip = mtd->priv;
+	uint8_t *oob_buf = nandi->oob_buf;
+	int i, e;
+
+	/* Read the OOB area */
+	flex_read_raw(nandi, page, mtd->writesize, oob_buf, mtd->oobsize);
+
+	if (oob_buf[chip->badblockpos] == 0xff)
+		return 0;
+
+	/* Tolerate 'alien' Hamming Boot Mode ECC */
+	e = 0;
+	for (i = 0; i < mtd->oobsize; i += 16)
+		e += hweight8(oob_buf[i + 3] ^ 'B');
+	if (e <= 1)
+		return 0;
+
+	/* Tolerate 'alien' Hamming AFM ECC */
+	e = 0;
+	for (i = 0; i < mtd->oobsize; i += 16) {
+		e += hweight8(oob_buf[i + 3] ^ 'A');
+		e += hweight8(oob_buf[i + 4] ^ 'F');
+		e += hweight8(oob_buf[i + 5] ^ 'M');
+		if (e <= 1)
+			return 0;
+	}
+
+	return 1;
+}
+
+/* Scan block for BBM(s), according to specified BBT options */
+static int nandi_scan_bad_block_markers_block(struct nandi_controller *nandi,
+					      uint32_t block)
+
+{
+	struct mtd_info *mtd = &nandi->info.mtd;
+	struct nand_chip *chip = mtd->priv;
+	uint32_t pages_per_block = mtd->erasesize >> nandi->page_shift;
+	uint32_t page = block << (nandi->block_shift - nandi->page_shift);
+
+	if (nandi_scan_bad_block_markers_page(nandi, page))
+		return 1;
+
+	if ((chip->bbt_options & NAND_BBT_SCAN2NDPAGE) &&
+	    nandi_scan_bad_block_markers_page(nandi, page + 1))
+		return 1;
+
+	if ((chip->bbt_options & NAND_BBT_SCANLASTPAGE) &&
+	    nandi_scan_bad_block_markers_page(nandi,
+					      page + pages_per_block - 1))
+		return 1;
+
+	return 0;
+}
+
 /* Populate IBBT BCH Header */
 static void bch_fill_ibbt_header(struct nandi_controller *nandi,
 				 struct nand_ibbt_bch_header *ibbt_header,
@@ -957,6 +1017,8 @@ static void nandi_set_mtd_defaults(struct nandi_controller *nandi,
 	chip->priv = nandi;
 	chip->ecc.layout = &info->ecclayout;
 
+	chip->bbt_options |= NAND_BBT_USE_FLASH;
+
 	/* mtd_info */
 	mtd->owner = THIS_MODULE;
 	mtd->type = MTD_NANDFLASH;
-- 
1.8.3.2
