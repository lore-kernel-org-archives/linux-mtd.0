Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctTs2-0007E1-HK
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
Subject: [PATCH v3 06/37] mtd: nand: denali: support HW_ECC_FIXUP capability
Date: Thu, 30 Mar 2017 15:45:52 +0900
Message-Id: <1490856383-31560-7-git-send-email-yamada.masahiro@socionext.com>
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

Some old versions of the Denali IP (perhaps used only for Intel?)
detects ECC errors and provides correct data via a register, but
does not touch the transferred data.  So, the software must fixup
the data in the buffer according to the provided ECC correction
information.

Newer versions perform ECC correction before transferring the data.
No more software intervention is needed.  The ECC_ERROR_ADDRESS and
ECC_CORRECTION_INFO registers were deprecated.  Instead, the number
of corrected bit-flips are reported via the ECC_COR_INFO register.
When an uncorrectable ECC error happens, a status flag is set to the
INTR_STATUS and ECC_COR_INFO registers.

As is often the case with this IP, the register view of INTR_STATUS
had broken compatibility.

For older versions (SW ECC fixup):
  bit 0:  ECC_TRANSACTION_DONE
  bit 1:  ECC_ERR

For newer versions (HW ECC fixup):
  bit 0:  ECC_UNCOR_ERR
  bit 1:  Reserved

Due to this difference, the irq_mask must be fixed too.

The existing handle_ecc() has been renamed to denali_sw_ecc_fixup()
for clarification.

What is unfortunate with this feature is we can not know the total
number of corrected/uncorrected errors in a page.  The register
ECC_COR_INFO reports the maximum of per-sector bitflips.  This is
useful for ->read_page return value, but ecc_stats.{corrected,failed}
increments may not be precise.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3:
  - Adjusted for the correct erased page check.
  - Move DENALI_CAP_ define out of struct denali_nand_info

Changes in v2:
  - Change the capability prefix DENALI_CAPS_ -> DENALI_CAP_

 drivers/mtd/nand/denali.c | 52 ++++++++++++++++++++++++++++++++++++++++-------
 drivers/mtd/nand/denali.h | 14 +++++++++++--
 2 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 64a3bdc..b95e33a 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -856,6 +856,41 @@ static int denali_check_erased_page(struct mtd_info *mtd,
 	return max_bitflips;
 }
 
+static int denali_hw_ecc_fixup(struct mtd_info *mtd,
+			       struct denali_nand_info *denali,
+			       unsigned long *uncor_ecc_flags)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	int bank = denali->flash_bank;
+	uint32_t ecc_cor;
+	unsigned int max_bitflips;
+
+	ecc_cor = ioread32(denali->flash_reg + ECC_COR_INFO(bank));
+	ecc_cor >>= ECC_COR_INFO__SHIFT(bank);
+
+	if (ecc_cor & ECC_COR_INFO__UNCOR_ERR) {
+		/*
+		 * This flag is set when uncorrectable error occurs at least in
+		 * one ECC sector.  We can not know "how many sectors", or
+		 * "which sector(s)".  We need erase-page check for all sectors.
+		 */
+		*uncor_ecc_flags = GENMASK(chip->ecc.steps - 1, 0);
+		return 0;
+	}
+
+	max_bitflips = ecc_cor & ECC_COR_INFO__MAX_ERRORS;
+
+	/*
+	 * The register holds the maximum of per-sector corrected bitflips.
+	 * This is suitable for the return value of the ->read_page() callback.
+	 * Unfortunately, we can not know the total number of corrected bits in
+	 * the page.  Increase the stats by max_bitflips. (compromised solution)
+	 */
+	mtd->ecc_stats.corrected += max_bitflips;
+
+	return max_bitflips;
+}
+
 #define ECC_SECTOR_SIZE 512
 
 #define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
@@ -865,8 +900,9 @@ static int denali_check_erased_page(struct mtd_info *mtd,
 #define ECC_ERR_DEVICE(x)	(((x) & ERR_CORRECTION_INFO__DEVICE_NR) >> 8)
 #define ECC_LAST_ERR(x)		((x) & ERR_CORRECTION_INFO__LAST_ERR_INFO)
 
-static int handle_ecc(struct mtd_info *mtd, struct denali_nand_info *denali,
-		      uint8_t *buf, unsigned long *uncor_ecc_flags)
+static int denali_sw_ecc_fixup(struct mtd_info *mtd,
+			       struct denali_nand_info *denali,
+			       unsigned long *uncor_ecc_flags, uint8_t *buf)
 {
 	unsigned int bitflips = 0;
 	unsigned int max_bitflips = 0;
@@ -1070,12 +1106,12 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 			    uint8_t *buf, int oob_required, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-
 	dma_addr_t addr = denali->buf.dma_buf;
 	size_t size = mtd->writesize + mtd->oobsize;
-
 	uint32_t irq_status;
-	uint32_t irq_mask = INTR__ECC_TRANSACTION_DONE | INTR__ECC_ERR;
+	uint32_t irq_mask = denali->caps & DENALI_CAP_HW_ECC_FIXUP ?
+				INTR__DMA_CMD_COMP | INTR__ECC_UNCOR_ERR :
+				INTR__ECC_TRANSACTION_DONE | INTR__ECC_ERR;
 	unsigned long uncor_ecc_flags = 0;
 	int stat = 0;
 
@@ -1101,8 +1137,10 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 	memcpy(buf, denali->buf.buf, mtd->writesize);
 
-	if (irq_status & INTR__ECC_ERR)
-		stat = handle_ecc(mtd, denali, buf, &uncor_ecc_flags);
+	if (denali->caps & DENALI_CAP_HW_ECC_FIXUP)
+		stat = denali_hw_ecc_fixup(mtd, denali, &uncor_ecc_flags);
+	else if (irq_status & INTR__ECC_ERR)
+		stat = denali_sw_ecc_fixup(mtd, denali, &uncor_ecc_flags, buf);
 	denali_enable_dma(denali, false);
 
 	if (stat < 0)
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 483c0e9..e532956 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -20,6 +20,7 @@
 #ifndef __DENALI_H__
 #define __DENALI_H__
 
+#include <linux/bitops.h>
 #include <linux/mtd/nand.h>
 
 #define DEVICE_RESET				0x0
@@ -218,8 +219,10 @@
 
 #define INTR_STATUS(__bank)	(0x410 + ((__bank) * 0x50))
 #define INTR_EN(__bank)		(0x420 + ((__bank) * 0x50))
-#define     INTR__ECC_TRANSACTION_DONE			0x0001
-#define     INTR__ECC_ERR				0x0002
+/* bit[1:0] is used differently depending on IP version */
+#define     INTR__ECC_UNCOR_ERR				0x0001	/* new IP */
+#define     INTR__ECC_TRANSACTION_DONE			0x0001	/* old IP */
+#define     INTR__ECC_ERR				0x0002	/* old IP */
 #define     INTR__DMA_CMD_COMP				0x0004
 #define     INTR__TIME_OUT				0x0008
 #define     INTR__PROGRAM_FAIL				0x0010
@@ -259,6 +262,11 @@
 #define     ERR_CORRECTION_INFO__ERROR_TYPE		0x4000
 #define     ERR_CORRECTION_INFO__LAST_ERR_INFO		0x8000
 
+#define ECC_COR_INFO(bank)			(0x650 + (bank) / 2 * 0x10)
+#define     ECC_COR_INFO__SHIFT(bank)			((bank) % 2 * 8)
+#define     ECC_COR_INFO__MAX_ERRORS			0x007f
+#define     ECC_COR_INFO__UNCOR_ERR			0x0080
+
 #define DMA_ENABLE				0x700
 #define     DMA_ENABLE__FLAG				0x0001
 
@@ -338,6 +346,8 @@ struct denali_nand_info {
 	unsigned int caps;
 };
 
+#define DENALI_CAP_HW_ECC_FIXUP			BIT(0)
+
 extern int denali_init(struct denali_nand_info *denali);
 extern void denali_remove(struct denali_nand_info *denali);
 
-- 
2.7.4
