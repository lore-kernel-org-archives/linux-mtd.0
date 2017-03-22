Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqgx3-0005xG-OS
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 14:09:28 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: laurent.monat@idquantique.com, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v2 12/53] mtd: nand: denali: support HW_ECC_FIXUP capability
Date: Wed, 22 Mar 2017 23:07:19 +0900
Message-Id: <1490191680-14481-13-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
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
of corrected bit-flips can be read from the ECC_COR_INFO register.
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

Due to this difference, the irq_mask must be fixed too.  The comment
block in handle_ecc() has been moved to the common part because the
comment applies to both cases.  The existing handle_ecc() has been
renamed to denali_sw_ecc_fixup() for clarification.

The U-Boot port of this driver already supports the HW ECC fixup.  I
borrowed the comment "Some versions of ..." in denali.h from U-Boot.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Change the capability prefix DENALI_CAPS_ -> DENALI_CAP_

 drivers/mtd/nand/denali.c | 52 ++++++++++++++++++++++++++++++++++++-----------
 drivers/mtd/nand/denali.h | 14 +++++++++++++
 2 files changed, 54 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 608fe6f..91f0def 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -883,6 +883,32 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 	}
 }
 
+static int denali_hw_ecc_fixup(struct mtd_info *mtd,
+			       struct denali_nand_info *denali)
+{
+	int bank = denali->flash_bank;
+	uint32_t ecc_cor;
+	unsigned int max_bitflips;
+
+	ecc_cor = ioread32(denali->flash_reg + ECC_COR_INFO(bank));
+	ecc_cor >>= ECC_COR_INFO__SHIFT(bank);
+
+	if (ecc_cor & ECC_COR_INFO__UNCOR_ERR)
+		return -EBADMSG;
+
+	max_bitflips = ecc_cor & ECC_COR_INFO__MAX_ERRORS;
+
+	/*
+	 * The register holds the maximum of the number of corrected bitflips
+	 * per sector.  This can be returned from ecc->read_page() as-is.
+	 * Unfortunately, we can not know the total number of corrected bits
+	 * in the page.  mtd->ecc_stats.corrected is compromised here.
+	 */
+	mtd->ecc_stats.corrected += max_bitflips;
+
+	return max_bitflips;
+}
+
 #define ECC_SECTOR_SIZE 512
 
 #define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
@@ -892,8 +918,8 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 #define ECC_ERR_DEVICE(x)	(((x) & ERR_CORRECTION_INFO__DEVICE_NR) >> 8)
 #define ECC_LAST_ERR(x)		((x) & ERR_CORRECTION_INFO__LAST_ERR_INFO)
 
-static int handle_ecc(struct mtd_info *mtd,
-		      struct denali_nand_info *denali, uint8_t *buf)
+static int denali_sw_ecc_fixup(struct mtd_info *mtd,
+			       struct denali_nand_info *denali, uint8_t *buf)
 {
 	unsigned int bitflips = 0;
 	unsigned int max_bitflips = 0;
@@ -921,11 +947,6 @@ static int handle_ecc(struct mtd_info *mtd,
 			bitflips = 0;
 
 		if (ECC_ERROR_UNCORRECTABLE(err_cor_info)) {
-			/*
-			 * if the error is not correctable, need to look at the
-			 * page to see if it is an erased page. if so, then
-			 * it's not a real ECC error
-			 */
 			ret = -EBADMSG;
 		} else if (err_byte < ECC_SECTOR_SIZE) {
 			/*
@@ -1105,12 +1126,12 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
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
 	int stat = 0;
 
 	if (page != denali->page) {
@@ -1135,11 +1156,18 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 	memcpy(buf, denali->buf.buf, mtd->writesize);
 
-	if (irq_status & INTR__ECC_ERR)
-		stat = handle_ecc(mtd, denali, buf);
+	if (denali->caps & DENALI_CAP_HW_ECC_FIXUP)
+		stat = denali_hw_ecc_fixup(mtd, denali);
+	else if (irq_status & INTR__ECC_ERR)
+		stat = denali_sw_ecc_fixup(mtd, denali, buf);
 	denali_enable_dma(denali, false);
 
 	if (stat == -EBADMSG) {
+		/*
+		 * If the error is not correctable, need to look at the page to
+		 * see if it is an erased page. If so, then it's not a real ECC
+		 * error.
+		 */
 		read_oob_data(mtd, chip->oob_poi, denali->page);
 
 		stat = nand_check_erased_ecc_chunk(
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 7b2d785..ed42b16 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -20,6 +20,7 @@
 #ifndef __DENALI_H__
 #define __DENALI_H__
 
+#include <linux/bitops.h>
 #include <linux/mtd/nand.h>
 
 #define DEVICE_RESET				0x0
@@ -218,6 +219,13 @@
 
 #define INTR_STATUS(__bank)	(0x410 + ((__bank) * 0x50))
 #define INTR_EN(__bank)		(0x420 + ((__bank) * 0x50))
+/*
+ * Some versions of the IP have the ECC fixup handled in hardware.  In this
+ * configuration we only get interrupted when the error is uncorrectable.
+ * Unfortunately this bit replaces INTR_STATUS__ECC_TRANSACTION_DONE from the
+ * old IP.
+ */
+#define     INTR__ECC_UNCOR_ERR				0x0001
 #define     INTR__ECC_TRANSACTION_DONE			0x0001
 #define     INTR__ECC_ERR				0x0002
 #define     INTR__DMA_CMD_COMP				0x0004
@@ -259,6 +267,11 @@
 #define     ERR_CORRECTION_INFO__ERROR_TYPE		0x4000
 #define     ERR_CORRECTION_INFO__LAST_ERR_INFO		0x8000
 
+#define ECC_COR_INFO(bank)			(0x650 + (bank) / 2 * 0x10)
+#define     ECC_COR_INFO__SHIFT(bank)			((bank) % 2 * 8)
+#define     ECC_COR_INFO__MAX_ERRORS			0x007f
+#define     ECC_COR_INFO__UNCOR_ERR			0x0080
+
 #define DMA_ENABLE				0x700
 #define     DMA_ENABLE__FLAG				0x0001
 
@@ -339,6 +352,7 @@ struct denali_nand_info {
 	int bbtskipbytes;
 	int max_banks;
 	unsigned int caps;
+#define DENALI_CAP_HW_ECC_FIXUP			BIT(0)
 };
 
 extern int denali_init(struct denali_nand_info *denali);
-- 
2.7.4
