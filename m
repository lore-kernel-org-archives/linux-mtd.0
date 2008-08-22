Received: from rv-out-0708.google.com ([209.85.198.240])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWMsE-00084p-Ih
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 02:59:39 +0000
Received: by rv-out-0708.google.com with SMTP id b17so229211rvf.42
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 19:59:37 -0700 (PDT)
Message-ID: <1516faed0808211959w793d22a0xeea14cf1096012be@mail.gmail.com>
Date: Fri, 22 Aug 2008 10:59:36 +0800
From: "Hong Xu" <hongxu.cn@gmail.com>
To: dwmw2@infradead.org, linux-arm-kernel@lists.arm.linux.org.uk,
	linux-mtd@lists.infradead.org
Subject: [PATCH] [NAND] This patch add support for HW ECC (HSIAO code) on
	AT91SAM9G20.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: linux@arm.linux.org.uk, nicolas.ferre@atmel.com, "Lin,
	JM" <JM.Lin@atmel.com>, patrice.vilchez@atmel.com,
	dan.liang@atmel.com, linux@maxim.org.za
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From ce6b68cf009a94ab12a31d7f007003173b6cad2c Mon Sep 17 00:00:00 2001
From: Hong Xu <hong.xu@atmel.com>
Date: Fri, 22 Aug 2008 10:29:10 +0800
Subject: [PATCH] This patch add support for HW ECC on AT91SAM9G20.

AT91SAM9G20 ECC controller is capable of 1-bits error correction
and 2-bit random detection for every 256 bytes of data. And this
patch chooses a working mode which can be compatible with software
ECC.

Signed-off-by: Hong Xu <hong.xu@atmel.com>
---
 drivers/mtd/nand/Kconfig          |   16 ++++-
 drivers/mtd/nand/atmel_nand.c     |  147 ++++++++++++++++++++++++++++++++++---
 drivers/mtd/nand/atmel_nand_ecc.h |   26 +++++++
 3 files changed, 177 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 41f361c..045b702 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -310,6 +310,20 @@ config MTD_NAND_ATMEL_ECC_HW

 	  If unsure, say Y

+config MTD_NAND_ATMEL_ECC_HW_HSIAO
+	bool "Hardware ECC HSIAO Code"
+	depends on ARCH_AT91SAM9G20
+	help
+	  Use hardware ECC(HSIAO Code) instead of software ECC when the
+	  chip supports it.
+
+	  The hardware ECC controller is capable of single bit error
+	  correction and 2-bit random detection per 256 bytes.
+
+	  NB : hardware and software ECC schemes are compatible.
+
+	  If unsure, say Y
+
 config MTD_NAND_ATMEL_ECC_SOFT
 	bool "Software ECC"
 	help
@@ -329,8 +343,6 @@ config MTD_NAND_ATMEL_ECC_NONE

 	  If unsure, say N

-	  endchoice
-
 endchoice

 config MTD_NAND_PXA3xx
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 3387e0d..198ff4c 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -27,6 +27,7 @@
 #include <linux/platform_device.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
+#include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>

 #include <linux/gpio.h>
@@ -35,7 +36,8 @@
 #include <mach/board.h>
 #include <mach/cpu.h>

-#ifdef CONFIG_MTD_NAND_ATMEL_ECC_HW
+#if defined(CONFIG_MTD_NAND_ATMEL_ECC_HW) || \
+	defined(CONFIG_MTD_NAND_ATMEL_ECC_HW_HSIAO)
 #define hard_ecc	1
 #else
 #define hard_ecc	0
@@ -81,6 +83,41 @@ static struct nand_ecclayout atmel_oobinfo_small = {
 	},
 };

+#ifdef CONFIG_MTD_NAND_ATMEL_ECC_HW_HSIAO
+static struct nand_ecclayout nand_oob_16 = {
+	.eccbytes = 6,
+	.eccpos = {0, 1, 2, 3, 6, 7},
+	.oobfree = {
+		{.offset = 8,
+		 . length = 8} }
+};
+
+static struct nand_ecclayout nand_oob_64 = {
+	.eccbytes = 24,
+	.eccpos = {
+		   40, 41, 42, 43, 44, 45, 46, 47,
+		   48, 49, 50, 51, 52, 53, 54, 55,
+		   56, 57, 58, 59, 60, 61, 62, 63 },
+	.oobfree = {
+	        {.offset = 2,
+		 .length = 38} }
+};
+
+static struct nand_ecclayout nand_oob_128 = {
+	.eccbytes = 48,
+	.eccpos = {
+		    80,  81,  82,  83,  84,  85,  86,  87,
+		    88,  89,  90,  91,  92,  93,  94,  95,
+		    96,  97,  98,  99, 100, 101, 102, 103,
+		   104, 105, 106, 107, 108, 109, 110, 111,
+		   112, 113, 114, 115, 116, 117, 118, 119,
+	           120, 121, 122, 123, 124, 125, 126, 127},
+	.oobfree = {
+		{.offset = 2,
+		 .length = 38} }
+};
+#endif
+
 struct atmel_nand_host {
 	struct nand_chip	nand_chip;
 	struct mtd_info		mtd;
@@ -215,6 +252,38 @@ static int atmel_nand_read_oob_512(struct mtd_info *mtd,
 	return sndcmd;
 }

+#ifdef CONFIG_MTD_NAND_ATMEL_ECC_HW_HSIAO
+static unsigned int Hsiao2Hamming(unsigned int input)
+{
+	unsigned int output = 0;
+
+	output |= ((input & (1 << 2))  << 21);
+	output |= ((input & (1 << 14)) << 8);
+	output |= ((input & (1 << 1))  << 20);
+	output |= ((input & (1 << 13)) << 7);
+	output |= ((input & (1 << 0))  << 19);
+	output |= ((input & (1 << 12)) << 6);
+	output |= ((input & (1 << 7))  << 8);
+	output |= ((input & (1 << 19)) >> 5);
+	output |= ((input & (1 << 6))  << 7);
+	output |= ((input & (1 << 18)) >> 6);
+	output |= ((input & (1 << 5))  << 6);
+	output |= ((input & (1 << 17)) >> 7);
+	output |= ((input & (1 << 4))  << 5);
+	output |= ((input & (1 << 16)) >> 8);
+	output |= ((input & (1 << 11)) >> 4);
+	output |= ((input & (1 << 23)) >> 17);
+	output |= ((input & (1 << 10)) >> 5);
+	output |= ((input & (1 << 22)) >> 18);
+	output |= ((input & (1 << 9))  >> 6);
+	output |= ((input & (1 << 21)) >> 19);
+	output |= ((input & (1 << 8))  >> 7);
+	output |= ((input & (1 << 20)) >> 20);
+	output ^= 0xFFFFFF;
+
+	return output;
+}
+
 /*
  * Calculate HW ECC
  *
@@ -229,6 +298,25 @@ static int atmel_nand_calculate(struct mtd_info *mtd,
 {
 	struct nand_chip *nand_chip = mtd->priv;
 	struct atmel_nand_host *host = nand_chip->priv;
+	uint32_t hamming;
+
+	hamming = Hsiao2Hamming(ecc_readl(host->ecc, PR0));
+
+	ecc_writel(host->ecc, CR, 1);
+	ecc_code[0] = hamming & 0xFF;
+	ecc_code[1] = (hamming >> 8) & 0xFF;
+	ecc_code[2] = (hamming >> 16) & 0xFF;
+
+	return 0;
+}
+
+#else  /* CONFIG_MTD_NAND_ATMEL_ECC_HW_HSIAO */
+
+static int atmel_nand_calculate(struct mtd_info *mtd,
+		const u_char *dat, unsigned char *ecc_code)
+{
+	struct nand_chip *nand_chip = mtd->priv;
+	struct atmel_nand_host *host = nand_chip->priv;
 	uint32_t *eccpos = nand_chip->ecc.layout->eccpos;
 	unsigned int ecc_value;

@@ -389,6 +477,7 @@ static int atmel_nand_correct(struct mtd_info
*mtd, u_char *dat,
 	dev_dbg(host->dev, "atmel_nand : error corrected\n");
 	return 1;
 }
+#endif /* CONFIG_MTD_NAND_ATMEL_ECC_HW_HSIAO */

 /*
  * Enable HW ECC : unused on most chips
@@ -476,14 +565,22 @@ static int __init atmel_nand_probe(struct
platform_device *pdev)
 			res = -EIO;
 			goto err_ecc_ioremap;
 		}
-		nand_chip->ecc.mode = NAND_ECC_HW_SYNDROME;
 		nand_chip->ecc.calculate = atmel_nand_calculate;
-		nand_chip->ecc.correct = atmel_nand_correct;
 		nand_chip->ecc.hwctl = atmel_nand_hwctl;
+#ifdef CONFIG_MTD_NAND_ATMEL_ECC_HW_HSIAO
+		nand_chip->ecc.mode = NAND_ECC_HW;
+		nand_chip->ecc.correct = nand_correct_data;
+		nand_chip->ecc.bytes = 3;
+		nand_chip->ecc.prepad = 0;
+		nand_chip->ecc.postpad = 0;
+#else
+		nand_chip->ecc.mode = NAND_ECC_HW_SYNDROME;
+		nand_chip->ecc.correct = atmel_nand_correct;
 		nand_chip->ecc.read_page = atmel_nand_read_page;
 		nand_chip->ecc.bytes = 4;
 		nand_chip->ecc.prepad = 0;
 		nand_chip->ecc.postpad = 0;
+#endif
 	}

 	nand_chip->chip_delay = 20;		/* 20us command delay time */
@@ -542,17 +639,47 @@ static int __init atmel_nand_probe(struct
platform_device *pdev)
 			/* page size not handled by HW ECC */
 			/* switching back to soft ECC */
 			nand_chip->ecc.mode = NAND_ECC_SOFT;
-			nand_chip->ecc.calculate = NULL;
-			nand_chip->ecc.correct = NULL;
-			nand_chip->ecc.hwctl = NULL;
-			nand_chip->ecc.read_page = NULL;
-			nand_chip->ecc.postpad = 0;
-			nand_chip->ecc.prepad = 0;
-			nand_chip->ecc.bytes = 0;
 			break;
 		}
 	}

+	if (nand_chip->ecc.mode == NAND_ECC_HW) {
+		nand_chip->ecc.size = 256;
+		switch (mtd->writesize) {
+		case 512:
+			nand_chip->ecc.layout = &nand_oob_16;
+			ecc_writel(host->ecc, MR,
+				ATMEL_ECC_PAGESIZE_528 | ATMEL_ECC_PER_256);
+			break;
+		case 2048:
+			nand_chip->ecc.layout = &nand_oob_64;
+			ecc_writel(host->ecc, MR,
+				ATMEL_ECC_PAGESIZE_2112 | ATMEL_ECC_PER_256);
+			break;
+		case 4096:
+			nand_chip->ecc.layout = &nand_oob_128;
+			ecc_writel(host->ecc, MR,
+				ATMEL_ECC_PAGESIZE_4224 | ATMEL_ECC_PER_256);
+			break;
+		default:
+			/* page size which is not supported by HW */
+			/* Switch back to software ECC */
+			nand_chip->ecc.mode = NAND_ECC_SOFT;
+			break;
+		}
+	}
+
+	if (nand_chip->ecc.mode == NAND_ECC_SOFT)
+	{
+		nand_chip->ecc.calculate = NULL;
+		nand_chip->ecc.correct = NULL;
+		nand_chip->ecc.hwctl = NULL;
+		nand_chip->ecc.read_page = NULL;
+		nand_chip->ecc.postpad = 0;
+		nand_chip->ecc.prepad = 0;
+		nand_chip->ecc.bytes = 0;
+	}
+
 	/* second phase scan */
 	if (nand_scan_tail(mtd)) {
 		res = -ENXIO;
diff --git a/drivers/mtd/nand/atmel_nand_ecc.h
b/drivers/mtd/nand/atmel_nand_ecc.h
index 1ee7f99..41e072e 100644
--- a/drivers/mtd/nand/atmel_nand_ecc.h
+++ b/drivers/mtd/nand/atmel_nand_ecc.h
@@ -26,6 +26,30 @@
 #define		ATMEL_ECC_ECCERR		(1 << 1)		/* ECC Single Bit Error */
 #define		ATMEL_ECC_MULERR		(1 << 2)		/* Multiple Errors */

+#ifdef CONFIG_MTD_NAND_ATMEL_ECC_HW_HSIAO
+
+#define ATMEL_ECC_PER_256	(1 << 4)
+
+#define ATMEL_ECC_PR0		0x0c
+#define ATMEL_ECC_PR1		0x10
+#define ATMEL_ECC_SR2		0x14
+#define ATMEL_ECC_PR2		0x18
+#define ATMEL_ECC_PR3		0x1c
+#define ATMEL_ECC_PR4		0x20
+#define ATMEL_ECC_PR5		0x24
+#define ATMEL_ECC_PR6		0x28
+#define ATMEL_ECC_PR7		0x2c
+#define ATMEL_ECC_PR8		0x30
+#define ATMEL_ECC_PR9		0x34
+#define ATMEL_ECC_PR10		0x38
+#define ATMEL_ECC_PR11		0x3c
+#define ATMEL_ECC_PR12		0x40
+#define ATMEL_ECC_PR13		0x44
+#define ATMEL_ECC_PR14		0x48
+#define ATMEL_ECC_PR15		0x4c
+
+#else
+
 #define ATMEL_ECC_PR		0x0c			/* Parity register */
 #define		ATMEL_ECC_BITADDR	(0xf << 0)		/* Bit Error Address */
 #define		ATMEL_ECC_WORDADDR	(0xfff << 4)		/* Word Error Address */
@@ -33,4 +57,6 @@
 #define ATMEL_ECC_NPR		0x10			/* NParity register */
 #define		ATMEL_ECC_NPARITY	(0xffff << 0)		/* NParity */

+#endif /* CONFIG_MTD_NAND_ATMEL_ECC_HW_HSIAO */
+
 #endif
-- 
1.5.2.2
