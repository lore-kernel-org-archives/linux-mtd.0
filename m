Received: from mail-am5eur03on061e.outbound.protection.outlook.com
 ([2a01:111:f400:fe08::61e]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3fKX-00063L-Fw
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 10:07:50 +0000
From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, han.xu@nxp.com, festevam@gmail.com,
 marek.vasut@gmail.com, frieder.schrempf@exceet.de, suresh.gupta@nxp.com,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [RFC PATCH 1/4] mtd: spi-nor: Add entry for mt35xu512aba flash
Date: Wed,  4 Apr 2018 15:36:08 +0530
Message-Id: <1522836371-2828-2-git-send-email-yogeshnarayan.gaur@nxp.com>
In-Reply-To: <1522836371-2828-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1522836371-2828-1-git-send-email-yogeshnarayan.gaur@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add entry for mt35xu512aba Micron NOR flash. This flash is having uniform
sector erase size of 128KB, have support of FSR(flag status register),
flash size is 64MB and supports 4-byte commands.

Some MICRON related macros in spi-nor domain were ST, actually. Added REAL
micron defination in header/source files.

This flash supports single bit and octal bit mode cmds.

Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 7 ++++++-
 include/linux/mtd/cfi.h       | 1 +
 include/linux/mtd/spi-nor.h   | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d445a4d..a54731b 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -272,6 +272,7 @@ static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
 
 	switch (JEDEC_MFR(info)) {
 	case SNOR_MFR_MICRON:
+	case SNOR_MFR_MICRONO:
 		/* Some Micron need WREN command; all will accept it */
 		need_wren = true;
 	case SNOR_MFR_MACRONIX:
@@ -1091,6 +1092,9 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 
+	/* Micron Flashes with MFR ID as 0x2c */
+	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512, SECT_4K | USE_FSR | SPI_NOR_4B_OPCODES) },
+
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
 	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4, SECT_4K_PMC) },
@@ -2473,6 +2477,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
 			break;
 
 		case SNOR_MFR_MICRON:
+		case SNOR_MFR_MICRONO:
 			break;
 
 		default:
@@ -2835,7 +2840,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	mtd->_resume = spi_nor_resume;
 
 	/* NOR protection support for STmicro/Micron chips and similar */
-	if (JEDEC_MFR(info) == SNOR_MFR_MICRON ||
+	if (JEDEC_MFR(info) == SNOR_MFR_MICRON || SNOR_MFR_MICRONO ||
 			info->flags & SPI_NOR_HAS_LOCK) {
 		nor->flash_lock = stm_lock;
 		nor->flash_unlock = stm_unlock;
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index 9b57a9b..cbf7716 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -377,6 +377,7 @@ struct cfi_fixup {
 #define CFI_MFR_SHARP		0x00B0
 #define CFI_MFR_SST		0x00BF
 #define CFI_MFR_ST		0x0020 /* STMicroelectronics */
+#define CFI_MFR_MICRON		0x002C /* Micron */
 #define CFI_MFR_TOSHIBA		0x0098
 #define CFI_MFR_WINBOND		0x00DA
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index de36969..5589c15 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -24,6 +24,7 @@
 #define SNOR_MFR_GIGADEVICE	0xc8
 #define SNOR_MFR_INTEL		CFI_MFR_INTEL
 #define SNOR_MFR_MICRON		CFI_MFR_ST /* ST Micro <--> Micron */
+#define SNOR_MFR_MICRONO	CFI_MFR_MICRON /* Original Micron */
 #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
 #define SNOR_MFR_SPANSION	CFI_MFR_AMD
 #define SNOR_MFR_SST		CFI_MFR_SST
-- 
1.9.1
