Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctTs2-0007Dr-HR
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 06:47:51 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v3 05/37] mtd: nand: denali: fix erased page checking
Date: Thu, 30 Mar 2017 15:45:51 +0900
Message-Id: <1490856383-31560-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This part is wrong in multiple ways:

[1] is_erased() is called against "buf" twice, so the OOB area is
not checked at all.  The second call should check chip->oob_poi.

[2] This code block is nested by double "if (check_erase_page)".
The inner one is redundant.

[3] The ECC_ERROR_ADDRESS register reports which sector(s) had
uncorrectable ECC errors.  It is pointless to check the whole page
if only one sector contains errors.

[4] Unfortunately, the Denali ECC correction engine has already
manipulated the data buffer before it decides the bitflips are
uncorrectable.  That is, not all of the data are 0xFF after an
erased page is processed by the ECC engine.  The current is_erased()
helper could report false-positive ECC errors.  Actually, a certain
mount of bitflips are allowed in an erased page.  The core framework
provides nand_check_erased_ecc_chunk() that takes the threshold into
account.  Let's use this.

This commit reworks the code to solve those problems.

Please note the erased page checking is implemented as a separate
helper function instead of embedding it in the loop in handle_ecc().
The reason is that OOB data are needed for the erased page checking,
but the controller can not start a new transaction until all ECC
error information is read out from the registers.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3:
  - Fix nand_check_erased_ecc_chunk call logic.
    Iterate over only needed ECC chunks.

Changes in v2:
  - Squash some patches into one.
  - Use nand_check_erased_ecc_chunk() with threshold

 drivers/mtd/nand/denali.c | 77 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index c5c150a..64a3bdc 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -818,19 +818,44 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 	}
 }
 
-/*
- * this function examines buffers to see if they contain data that
- * indicate that the buffer is part of an erased region of flash.
- */
-static bool is_erased(uint8_t *buf, int len)
+static int denali_check_erased_page(struct mtd_info *mtd,
+				    struct nand_chip *chip, uint8_t *buf,
+				    unsigned long uncor_ecc_flags,
+				    unsigned int max_bitflips)
 {
-	int i;
+	uint8_t *ecc_code = chip->buffers->ecccode;
+	int ecc_steps = chip->ecc.steps;
+	int ecc_size = chip->ecc.size;
+	int ecc_bytes = chip->ecc.bytes;
+	int i, ret, stat;
+
+	ret = mtd_ooblayout_get_eccbytes(mtd, ecc_code, chip->oob_poi, 0,
+					 chip->ecc.total);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ecc_steps; i++) {
+		if (!(uncor_ecc_flags & BIT(i)))
+			continue;
+
+		stat = nand_check_erased_ecc_chunk(buf, ecc_size,
+						  ecc_code, ecc_bytes,
+						  NULL, 0,
+						  chip->ecc.strength);
+		if (stat < 0) {
+			mtd->ecc_stats.failed++;
+		} else {
+			mtd->ecc_stats.corrected += stat;
+			max_bitflips = max_t(unsigned int, max_bitflips, stat);
+		}
 
-	for (i = 0; i < len; i++)
-		if (buf[i] != 0xFF)
-			return false;
-	return true;
+		buf += ecc_size;
+		ecc_code += ecc_bytes;
+	}
+
+	return max_bitflips;
 }
+
 #define ECC_SECTOR_SIZE 512
 
 #define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
@@ -841,7 +866,7 @@ static bool is_erased(uint8_t *buf, int len)
 #define ECC_LAST_ERR(x)		((x) & ERR_CORRECTION_INFO__LAST_ERR_INFO)
 
 static int handle_ecc(struct mtd_info *mtd, struct denali_nand_info *denali,
-		      uint8_t *buf, bool *check_erased_page)
+		      uint8_t *buf, unsigned long *uncor_ecc_flags)
 {
 	unsigned int bitflips = 0;
 	unsigned int max_bitflips = 0;
@@ -868,11 +893,10 @@ static int handle_ecc(struct mtd_info *mtd, struct denali_nand_info *denali,
 
 		if (ECC_ERROR_UNCORRECTABLE(err_cor_info)) {
 			/*
-			 * if the error is not correctable, need to look at the
-			 * page to see if it is an erased page. if so, then
-			 * it's not a real ECC error
+			 * Check later if this is a real ECC error, or
+			 * an erased sector.
 			 */
-			*check_erased_page = true;
+			*uncor_ecc_flags |= BIT(err_sector);
 		} else if (err_byte < ECC_SECTOR_SIZE) {
 			/*
 			 * If err_byte is larger than ECC_SECTOR_SIZE, means error
@@ -1045,7 +1069,6 @@ static int denali_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 			    uint8_t *buf, int oob_required, int page)
 {
-	unsigned int max_bitflips = 0;
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
 	dma_addr_t addr = denali->buf.dma_buf;
@@ -1053,7 +1076,8 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 	uint32_t irq_status;
 	uint32_t irq_mask = INTR__ECC_TRANSACTION_DONE | INTR__ECC_ERR;
-	bool check_erased_page = false;
+	unsigned long uncor_ecc_flags = 0;
+	int stat = 0;
 
 	if (page != denali->page) {
 		dev_err(denali->dev,
@@ -1078,21 +1102,20 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	memcpy(buf, denali->buf.buf, mtd->writesize);
 
 	if (irq_status & INTR__ECC_ERR)
-		max_bitflips = handle_ecc(mtd, denali, buf, &check_erased_page);
+		stat = handle_ecc(mtd, denali, buf, &uncor_ecc_flags);
 	denali_enable_dma(denali, false);
 
-	if (check_erased_page) {
+	if (stat < 0)
+		return stat;
+
+	if (uncor_ecc_flags) {
 		read_oob_data(mtd, chip->oob_poi, denali->page);
 
-		/* check ECC failures that may have occurred on erased pages */
-		if (check_erased_page) {
-			if (!is_erased(buf, mtd->writesize))
-				mtd->ecc_stats.failed++;
-			if (!is_erased(buf, mtd->oobsize))
-				mtd->ecc_stats.failed++;
-		}
+		stat = denali_check_erased_page(mtd, chip, buf,
+						uncor_ecc_flags, stat);
 	}
-	return max_bitflips;
+
+	return stat;
 }
 
 static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-- 
2.7.4
