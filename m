Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctTs2-0007Dn-Gy
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 06:48:00 +0000
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
Subject: [PATCH v3 04/37] mtd: nand: denali: fix bitflips calculation in
 handle_ecc()
Date: Thu, 30 Mar 2017 15:45:50 +0900
Message-Id: <1490856383-31560-5-git-send-email-yamada.masahiro@socionext.com>
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

This function is wrong in multiple ways:

[1] Counting corrected bytes instead of corrected bits.

The following code is counting the number of corrected _bytes_.

    /* correct the ECC error */
    buf[offset] ^= err_cor_value;
    mtd->ecc_stats.corrected++;
    bitflips++;

What the core framework expects is the number of corrected _bits_.
They can be different if multiple bitflips occur within one byte.

[2] total number of errors instead of max of per-sector errors

The core framework expects that corrected errors are counted per
sector, then the max value should be taken.  The current code simply
iterates over the whole page, i.e. counts the total number of
correction in the page.  This means "too many bitflips" is triggered
earlier than it should be, i.e. the NAND device is worn out sooner.

Besides those bugs, this function is unreadable due to the deep
nesting.  Notice the whole code in this function is wrapped in
if (irq_status & INTR__ECC_ERR), so this conditional can be moved
out of the function.  Also, use shorter names for local variables.

Re-work the function to fix all the issues.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3:
  - Adjust function arguments for the next commit

Changes in v2:
  - Use shorter names for local variables.
  - Fix bugs addressed by [1], [2]

 drivers/mtd/nand/denali.c | 141 +++++++++++++++++++++++-----------------------
 1 file changed, 71 insertions(+), 70 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 65cf7cc..c5c150a 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -836,80 +836,80 @@ static bool is_erased(uint8_t *buf, int len)
 #define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
 #define ECC_BYTE(x)	(((x) & ECC_ERROR_ADDRESS__OFFSET))
 #define ECC_CORRECTION_VALUE(x) ((x) & ERR_CORRECTION_INFO__BYTEMASK)
-#define ECC_ERROR_CORRECTABLE(x) (!((x) & ERR_CORRECTION_INFO__ERROR_TYPE))
+#define ECC_ERROR_UNCORRECTABLE(x) ((x) & ERR_CORRECTION_INFO__ERROR_TYPE)
 #define ECC_ERR_DEVICE(x)	(((x) & ERR_CORRECTION_INFO__DEVICE_NR) >> 8)
 #define ECC_LAST_ERR(x)		((x) & ERR_CORRECTION_INFO__LAST_ERR_INFO)
 
-static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
-		       uint32_t irq_status, unsigned int *max_bitflips)
+static int handle_ecc(struct mtd_info *mtd, struct denali_nand_info *denali,
+		      uint8_t *buf, bool *check_erased_page)
 {
-	bool check_erased_page = false;
 	unsigned int bitflips = 0;
+	unsigned int max_bitflips = 0;
+	uint32_t err_addr, err_cor_info;
+	unsigned int err_byte, err_sector, err_device;
+	uint8_t err_cor_value;
+	unsigned int prev_sector = 0;
 
-	if (irq_status & INTR__ECC_ERR) {
-		/* read the ECC errors. we'll ignore them for now */
-		uint32_t err_address, err_correction_info, err_byte,
-			 err_sector, err_device, err_correction_value;
-		denali_set_intr_modes(denali, false);
-
-		do {
-			err_address = ioread32(denali->flash_reg +
-						ECC_ERROR_ADDRESS);
-			err_sector = ECC_SECTOR(err_address);
-			err_byte = ECC_BYTE(err_address);
-
-			err_correction_info = ioread32(denali->flash_reg +
-						ERR_CORRECTION_INFO);
-			err_correction_value =
-				ECC_CORRECTION_VALUE(err_correction_info);
-			err_device = ECC_ERR_DEVICE(err_correction_info);
-
-			if (ECC_ERROR_CORRECTABLE(err_correction_info)) {
-				/*
-				 * If err_byte is larger than ECC_SECTOR_SIZE,
-				 * means error happened in OOB, so we ignore
-				 * it. It's no need for us to correct it
-				 * err_device is represented the NAND error
-				 * bits are happened in if there are more
-				 * than one NAND connected.
-				 */
-				if (err_byte < ECC_SECTOR_SIZE) {
-					struct mtd_info *mtd =
-						nand_to_mtd(&denali->nand);
-					int offset;
-
-					offset = (err_sector *
-							ECC_SECTOR_SIZE +
-							err_byte) *
-							denali->devnum +
-							err_device;
-					/* correct the ECC error */
-					buf[offset] ^= err_correction_value;
-					mtd->ecc_stats.corrected++;
-					bitflips++;
-				}
-			} else {
-				/*
-				 * if the error is not correctable, need to
-				 * look at the page to see if it is an erased
-				 * page. if so, then it's not a real ECC error
-				 */
-				check_erased_page = true;
-			}
-		} while (!ECC_LAST_ERR(err_correction_info));
-		/*
-		 * Once handle all ecc errors, controller will triger
-		 * a ECC_TRANSACTION_DONE interrupt, so here just wait
-		 * for a while for this interrupt
-		 */
-		while (!(read_interrupt_status(denali) &
-				INTR__ECC_TRANSACTION_DONE))
-			cpu_relax();
-		clear_interrupts(denali);
-		denali_set_intr_modes(denali, true);
-	}
-	*max_bitflips = bitflips;
-	return check_erased_page;
+	/* read the ECC errors. we'll ignore them for now */
+	denali_set_intr_modes(denali, false);
+
+	do {
+		err_addr = ioread32(denali->flash_reg + ECC_ERROR_ADDRESS);
+		err_sector = ECC_SECTOR(err_addr);
+		err_byte = ECC_BYTE(err_addr);
+
+		err_cor_info = ioread32(denali->flash_reg + ERR_CORRECTION_INFO);
+		err_cor_value = ECC_CORRECTION_VALUE(err_cor_info);
+		err_device = ECC_ERR_DEVICE(err_cor_info);
+
+		/* reset the bitflip counter when crossing ECC sector */
+		if (err_sector != prev_sector)
+			bitflips = 0;
+
+		if (ECC_ERROR_UNCORRECTABLE(err_cor_info)) {
+			/*
+			 * if the error is not correctable, need to look at the
+			 * page to see if it is an erased page. if so, then
+			 * it's not a real ECC error
+			 */
+			*check_erased_page = true;
+		} else if (err_byte < ECC_SECTOR_SIZE) {
+			/*
+			 * If err_byte is larger than ECC_SECTOR_SIZE, means error
+			 * happened in OOB, so we ignore it. It's no need for
+			 * us to correct it err_device is represented the NAND
+			 * error bits are happened in if there are more than
+			 * one NAND connected.
+			 */
+			int offset;
+			unsigned int flips_in_byte;
+
+			offset = (err_sector * ECC_SECTOR_SIZE + err_byte) *
+						denali->devnum + err_device;
+
+			/* correct the ECC error */
+			flips_in_byte = hweight8(buf[offset] ^ err_cor_value);
+			buf[offset] ^= err_cor_value;
+			mtd->ecc_stats.corrected += flips_in_byte;
+			bitflips += flips_in_byte;
+
+			max_bitflips = max(max_bitflips, bitflips);
+		}
+
+		prev_sector = err_sector;
+	} while (!ECC_LAST_ERR(err_cor_info));
+
+	/*
+	 * Once handle all ecc errors, controller will trigger a
+	 * ECC_TRANSACTION_DONE interrupt, so here just wait for
+	 * a while for this interrupt
+	 */
+	while (!(read_interrupt_status(denali) & INTR__ECC_TRANSACTION_DONE))
+		cpu_relax();
+	clear_interrupts(denali);
+	denali_set_intr_modes(denali, true);
+
+	return max_bitflips;
 }
 
 /* programs the controller to either enable/disable DMA transfers */
@@ -1045,7 +1045,7 @@ static int denali_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 			    uint8_t *buf, int oob_required, int page)
 {
-	unsigned int max_bitflips;
+	unsigned int max_bitflips = 0;
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
 	dma_addr_t addr = denali->buf.dma_buf;
@@ -1077,7 +1077,8 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 	memcpy(buf, denali->buf.buf, mtd->writesize);
 
-	check_erased_page = handle_ecc(denali, buf, irq_status, &max_bitflips);
+	if (irq_status & INTR__ECC_ERR)
+		max_bitflips = handle_ecc(mtd, denali, buf, &check_erased_page);
 	denali_enable_dma(denali, false);
 
 	if (check_erased_page) {
-- 
2.7.4
