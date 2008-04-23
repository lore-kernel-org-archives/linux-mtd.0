Received: from nf-out-0910.google.com ([64.233.182.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Joj7c-00038V-Qj
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 17:51:09 +0000
Received: by nf-out-0910.google.com with SMTP id h3so1954093nfh.22
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 10:51:07 -0700 (PDT)
Subject: Re: [PATCH] NAND hardware ECC controller on at91sam9263 / at91sam9260
From: Richard Genoud <richard.genoud@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1208964556.9212.809.camel@pmac.infradead.org>
References: <47BABA0C.8070500@gmail.com>
	<1208889653.9212.641.camel@pmac.infradead.org>
	<80b317760804230237n188bd989oc28a5ed60e615d88@mail.gmail.com>
	<1208946137.9212.778.camel@pmac.infradead.org>
	<80b317760804230431w46f4f6a2wd761a2949dc3b27c@mail.gmail.com>
	<1208964556.9212.809.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 19:51:14 +0200
Message-Id: <1208973075.7471.6.camel@ubuntu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a patch to use the hardware ECC controller of
the AT91SAM9260 and AT91SAM9263 for the AT91 nand.
On AT91 NAND, there's now a choice between ECC soft,
ECC hard or no ECC (for debug).

It has been tested on AT91SAM9263 with 8 bits large
and small page NAND.


kernel version : 2.6.25 linux-mtd master tree

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

---
 drivers/mtd/nand/Kconfig                 |   41 ++++
 drivers/mtd/nand/at91_nand.c             |  361 +++++++++++++++++++++++++++++-
 2 files changed, 397 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-at91/at91sam9260_devices.c b/arch/arm/mach-at91/at91sam9260_devices.c
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index dcbb0de..5076faf 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -278,6 +278,47 @@ config MTD_NAND_AT91
 	help
 	  Enables support for NAND Flash / Smart Media Card interface
 	  on Atmel AT91 processors.
+choice
+	prompt "ECC management for NAND Flash / SmartMedia on AT91"
+	depends on MTD_NAND_AT91
+
+config MTD_NAND_AT91_ECC_HW
+	bool "Hardware ECC"
+	depends on ARCH_AT91SAM9263 || ARCH_AT91SAM9260
+	help
+	  Uses hardware ECC provided by the at91sam9260/at91sam9263 chip
+	  instead of software ECC.
+	  The hardware ECC controller is capable of single bit error
+	  correction and 2-bit random detection per page.
+
+	  NB : hardware and software ECC schemes are incompatible.
+	  If you switch from one to another, you'll have to erase your
+	  mtd partition.
+
+	  If unsure, say Y
+
+config MTD_NAND_AT91_ECC_SOFT
+	bool "Software ECC"
+	help
+	  Uses software ECC.
+
+	  NB : hardware and software ECC schemes are incompatible.
+	  If you switch from one to another, you'll have to erase your
+	  mtd partition.
+
+config MTD_NAND_AT91_ECC_NONE
+	bool "No ECC (testing only, DANGEROUS)"
+	depends on DEBUG_KERNEL
+	help
+	  No ECC will be used.
+	  It's not a good idea and it should be reserved for testing
+	  purpose only.
+
+	  If unsure, say N
+
+	  endchoice
+
+endchoice
 
 config MTD_NAND_PXA3xx
 	bool "Support for NAND flash devices on PXA3xx"
diff --git a/drivers/mtd/nand/at91_nand.c b/drivers/mtd/nand/at91_nand.c
index 463632e..c3eb203 100644
--- a/drivers/mtd/nand/at91_nand.c
+++ b/drivers/mtd/nand/at91_nand.c
@@ -9,6 +9,15 @@
  *  Derived from drivers/mtd/spia.c
  *	 Copyright (C) 2000 Steven J. Hill (sjhill@cotw.com)
  *
+ *
+ *  Add Hardware ECC support for AT91SAM9260 / AT91SAM9263
+ *     Richard Genoud (richard.genoud@gmail.com), Adeneo Copyright (C) 2007
+ *
+ *     Derived from Das U-Boot source code
+ *     		(u-boot-1.1.5/board/atmel/at91sam9263ek/nand.c)
+ *     (C) Copyright 2006 ATMEL Rousset, Lacressonniere Nicolas
+ *
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
@@ -29,11 +38,59 @@
 #include <asm/arch/board.h>
 #include <asm/arch/gpio.h>
 
+#ifdef CONFIG_MTD_NAND_AT91_ECC_HW
+#define hard_ecc	1
+#else
+#define hard_ecc	0
+#endif
+
+#ifdef CONFIG_MTD_NAND_AT91_ECC_NONE
+#define no_ecc		1
+#else
+#define no_ecc		0
+#endif
+
+/* Register access macros */
+#define ecc_readl(add, reg)				\
+	__raw_readl(add + AT91_ECC_##reg)
+#define ecc_writel(add, reg, value)			\
+	__raw_writel((value), add + AT91_ECC_##reg)
+
+#include <asm/arch/at91_ecc.h> /* AT91SAM9260/3 ECC registers */
+
+/* oob layout for large page size
+ * bad block info is on bytes 0 and 1
+ * the bytes have to be consecutives to avoid
+ * several NAND_CMD_RNDOUT during read
+ */
+static struct nand_ecclayout at91_oobinfo_large = {
+	.eccbytes = 4,
+	.eccpos = {60, 61, 62, 63},
+	.oobfree = {
+		{2, 58}
+	},
+};
+
+/* oob layout for small page size
+ * bad block info is on bytes 4 and 5
+ * the bytes have to be consecutives to avoid
+ * several NAND_CMD_RNDOUT during read
+ */
+static struct nand_ecclayout at91_oobinfo_small = {
+	.eccbytes = 4,
+	.eccpos = {0, 1, 2, 3},
+	.oobfree = {
+		{6, 10}
+	},
+};
+
 struct at91_nand_host {
 	struct nand_chip	nand_chip;
 	struct mtd_info		mtd;
 	void __iomem		*io_base;
 	struct at91_nand_data	*board;
+	struct device		*dev;
+	void __iomem		*ecc;
 };
 
 /*
@@ -82,6 +139,215 @@ static void at91_nand_disable(struct at91_nand_host *host)
 		at91_set_gpio_value(host->board->enable_pin, 1);
 }
 
+/*
+ * write oob for small pages
+ */
+static int at91_nand_write_oob_512(struct mtd_info *mtd,
+		struct nand_chip *chip, int page)
+{
+	int chunk = chip->ecc.bytes + chip->ecc.prepad + chip->ecc.postpad;
+	int eccsize = chip->ecc.size, length = mtd->oobsize;
+	int len, pos, status = 0;
+	const uint8_t *bufpoi = chip->oob_poi;
+
+	pos = eccsize + chunk;
+
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN, pos, page);
+	len = min_t(int, length, chunk);
+	chip->write_buf(mtd, bufpoi, len);
+	bufpoi += len;
+	length -= len;
+	if (length > 0)
+		chip->write_buf(mtd, bufpoi, length);
+
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	status = chip->waitfunc(mtd, chip);
+
+	return status & NAND_STATUS_FAIL ? -EIO : 0;
+
+}
+
+/*
+ * read oob for small pages
+ */
+static int at91_nand_read_oob_512(struct mtd_info *mtd,
+		struct nand_chip *chip,	int page, int sndcmd)
+{
+	if (sndcmd) {
+		chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
+		sndcmd = 0;
+	}
+	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	return sndcmd;
+}
+
+/*
+ * Calculate HW ECC
+ *
+ * function called after a write
+ *
+ * mtd:        MTD block structure
+ * dat:        raw data (unused)
+ * ecc_code:   buffer for ECC
+ */
+static int at91_nand_calculate(struct mtd_info *mtd,
+		const u_char *dat, unsigned char *ecc_code)
+{
+	struct nand_chip *nand_chip = mtd->priv;
+	struct at91_nand_host *host = nand_chip->priv;
+	uint32_t *eccpos = nand_chip->ecc.layout->eccpos;
+	unsigned int ecc_value;
+
+	/* get the first 2 ECC bytes */
+	ecc_value = ecc_readl(host->ecc, PR) & AT91_ECC_PARITY;
+
+	ecc_code[eccpos[0]] = ecc_value & 0xFF;
+	ecc_code[eccpos[1]] = (ecc_value >> 8) & 0xFF;
+
+	/* get the last 2 ECC bytes */
+	ecc_value = ecc_readl(host->ecc, NPR) & AT91_ECC_NPARITY;
+
+	ecc_code[eccpos[2]] = ecc_value & 0xFF;
+	ecc_code[eccpos[3]] = (ecc_value >> 8) & 0xFF;
+
+	return 0;
+}
+
+/*
+ * HW ECC read page function
+ *
+ * mtd:        mtd info structure
+ * chip:       nand chip info structure
+ * buf:        buffer to store read data
+ */
+static int at91_nand_read_page(struct mtd_info *mtd,
+		struct nand_chip *chip, uint8_t *buf)
+{
+	int eccsize = chip->ecc.size;
+	int eccbytes = chip->ecc.bytes;
+	uint32_t *eccpos = chip->ecc.layout->eccpos;
+	uint8_t *p = buf;
+	uint8_t *oob = chip->oob_poi;
+	uint8_t *ecc_pos;
+	int stat;
+
+	/* read the page */
+	chip->read_buf(mtd, p, eccsize);
+
+	/* move to ECC position if needed */
+	if (eccpos[0] != 0) {
+		/* This only works on large pages
+		 * because the ECC controller waits for
+		 * NAND_CMD_RNDOUTSTART after the
+		 * NAND_CMD_RNDOUT.
+		 * anyway, for small pages, the eccpos[0] == 0
+		 */
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT,
+				mtd->writesize + eccpos[0], -1);
+	}
+
+	/* the ECC controller needs to read the ECC just after the data */
+	ecc_pos = oob + eccpos[0];
+	chip->read_buf(mtd, ecc_pos, eccbytes);
+
+	/* check if there's an error */
+	stat = chip->ecc.correct(mtd, p, oob, NULL);
+
+	if (stat < 0)
+		mtd->ecc_stats.failed++;
+	else
+		mtd->ecc_stats.corrected += stat;
+
+	/* get back to oob start (end of page) */
+	chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize, -1);
+
+	/* read the oob */
+	chip->read_buf(mtd, oob, mtd->oobsize);
+
+	return 0;
+}
+
+/*
+ * HW ECC Correction
+ *
+ * function called after a read
+ *
+ * mtd:        MTD block structure
+ * dat:        raw data read from the chip
+ * read_ecc:   ECC from the chip (unused)
+ * isnull:     unused
+ *
+ * Detect and correct a 1 bit error for a page
+ */
+static int at91_nand_correct(struct mtd_info *mtd, u_char *dat,
+		u_char *read_ecc, u_char *isnull)
+{
+	struct nand_chip *nand_chip = mtd->priv;
+	struct at91_nand_host *host = nand_chip->priv;
+	unsigned int ecc_status;
+	unsigned int ecc_word, ecc_bit;
+
+	/* get the status from the Status Register */
+	ecc_status = ecc_readl(host->ecc, SR);
+
+	/* if there's no error */
+	if (likely(!(ecc_status & AT91_ECC_RECERR)))
+		return 0;
+
+	/* get error bit offset (4 bits) */
+	ecc_bit = ecc_readl(host->ecc, PR) & AT91_ECC_BITADDR;
+	/* get word address (12 bits) */
+	ecc_word = ecc_readl(host->ecc, PR) & AT91_ECC_WORDADDR;
+	ecc_word >>= 4;
+
+	/* if there are multiple errors */
+	if (ecc_status & AT91_ECC_MULERR) {
+		/* check if it is a freshly erased block
+		 * (filled with 0xff) */
+		if ((ecc_bit == AT91_ECC_BITADDR)
+				&& (ecc_word == (AT91_ECC_WORDADDR >> 4))) {
+			/* the block has just been erased, return OK */
+			return 0;
+		}
+		/* it doesn't seems to be a freshly
+		 * erased block.
+		 * We can't correct so many errors */
+		dev_dbg(host->dev, "at91_nand : multiple errors detected."
+				" Unable to correct.\n");
+		return -EIO;
+	}
+
+	/* if there's a single bit error : we can correct it */
+	if (ecc_status & AT91_ECC_ECCERR) {
+		/* there's nothing much to do here.
+		 * the bit error is on the ECC itself.
+		 */
+		dev_dbg(host->dev, "at91_nand : one bit error on ECC code."
+				" Nothing to correct\n");
+		return 0;
+	}
+
+	dev_dbg(host->dev, "at91_nand : one bit error on data."
+			" (word offset in the page :"
+			" 0x%x bit offset : 0x%x)\n",
+			ecc_word, ecc_bit);
+	/* correct the error */
+	if (nand_chip->options & NAND_BUSWIDTH_16) {
+		/* 16 bits words */
+		((unsigned short *) dat)[ecc_word] ^= (1 << ecc_bit);
+	} else {
+		/* 8 bits words */
+		dat[ecc_word] ^= (1 << ecc_bit);
+	}
+	dev_dbg(host->dev, "at91_nand : error corrected\n");
+	return 1;
+}
+
+/*
+ * Enable HW ECC : unsused
+ */
+static void at91_nand_hwctl(struct mtd_info *mtd, int mode) { ; }
+
 #ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probes[] = { "cmdlinepart", NULL };
 #endif
@@ -94,6 +360,8 @@ static int __init at91_nand_probe(struct platform_device *pdev)
 	struct at91_nand_host *host;
 	struct mtd_info *mtd;
 	struct nand_chip *nand_chip;
+	struct resource *regs;
+	struct resource *mem;
 	int res;
 
 #ifdef CONFIG_MTD_PARTITIONS
@@ -108,8 +376,13 @@ static int __init at91_nand_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	host->io_base = ioremap(pdev->resource[0].start,
-				pdev->resource[0].end - pdev->resource[0].start + 1);
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem) {
+		printk(KERN_ERR "at91_nand: can't get I/O resource mem\n");
+		return -ENXIO;
+	}
+
+	host->io_base = ioremap(mem->start, mem->end - mem->start + 1);
 	if (host->io_base == NULL) {
 		printk(KERN_ERR "at91_nand: ioremap failed\n");
 		kfree(host);
@@ -119,6 +392,7 @@ static int __init at91_nand_probe(struct platform_device *pdev)
 	mtd = &host->mtd;
 	nand_chip = &host->nand_chip;
 	host->board = pdev->dev.platform_data;
+	host->dev = &pdev->dev;
 
 	nand_chip->priv = host;		/* link the private data structures */
 	mtd->priv = nand_chip;
@@ -132,7 +406,32 @@ static int __init at91_nand_probe(struct platform_device *pdev)
 	if (host->board->rdy_pin)
 		nand_chip->dev_ready = at91_nand_device_ready;
 
+	regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!regs && hard_ecc) {
+		printk(KERN_ERR "at91_nand: can't get I/O resource "
+				"regs\nFalling back on software ECC\n");
+	}
+
 	nand_chip->ecc.mode = NAND_ECC_SOFT;	/* enable ECC */
+	if (no_ecc)
+		nand_chip->ecc.mode = NAND_ECC_NONE;
+	if (hard_ecc && regs) {
+		host->ecc = ioremap(regs->start, regs->end - regs->start + 1);
+		if (host->ecc == NULL) {
+			printk(KERN_ERR "at91_nand: ioremap failed\n");
+			res = -EIO;
+			goto err_ecc_ioremap;
+		}
+		nand_chip->ecc.mode = NAND_ECC_HW_SYNDROME;
+		nand_chip->ecc.calculate = at91_nand_calculate;
+		nand_chip->ecc.correct = at91_nand_correct;
+		nand_chip->ecc.hwctl = at91_nand_hwctl;
+		nand_chip->ecc.read_page = at91_nand_read_page;
+		nand_chip->ecc.bytes = 4;
+		nand_chip->ecc.prepad = 0;
+		nand_chip->ecc.postpad = 0;
+	}
+
 	nand_chip->chip_delay = 20;		/* 20us command delay time */
 
 	if (host->board->bus_width_16)		/* 16-bit bus width */
@@ -149,8 +448,53 @@ static int __init at91_nand_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* Scan to find existance of the device */
-	if (nand_scan(mtd, 1)) {
+	/* first scan to find the device and get the page size */
+	if (nand_scan_ident(mtd, 1)) {
+		res = -ENXIO;
+		goto out;
+	}
+
+	if (nand_chip->ecc.mode == NAND_ECC_HW_SYNDROME) {
+		/* ECC is calculated for the whole page (1 step) */
+		nand_chip->ecc.size = mtd->writesize;
+
+		/* set ECC page size and oob layout */
+		switch (mtd->writesize) {
+		case 512:
+			nand_chip->ecc.layout = &at91_oobinfo_small;
+			nand_chip->ecc.read_oob = at91_nand_read_oob_512;
+			nand_chip->ecc.write_oob = at91_nand_write_oob_512;
+			ecc_writel(host->ecc, MR, AT91_ECC_PAGESIZE_528);
+			break;
+		case 1024:
+			nand_chip->ecc.layout = &at91_oobinfo_large;
+			ecc_writel(host->ecc, MR, AT91_ECC_PAGESIZE_1056);
+			break;
+		case 2048:
+			nand_chip->ecc.layout = &at91_oobinfo_large;
+			ecc_writel(host->ecc, MR, AT91_ECC_PAGESIZE_2112);
+			break;
+		case 4096:
+			nand_chip->ecc.layout = &at91_oobinfo_large;
+			ecc_writel(host->ecc, MR, AT91_ECC_PAGESIZE_4224);
+			break;
+		default:
+			/* page size not handled by HW ECC */
+			/* switching back to soft ECC */
+			nand_chip->ecc.mode = NAND_ECC_SOFT;
+			nand_chip->ecc.calculate = NULL;
+			nand_chip->ecc.correct = NULL;
+			nand_chip->ecc.hwctl = NULL;
+			nand_chip->ecc.read_page = NULL;
+			nand_chip->ecc.postpad = 0;
+			nand_chip->ecc.prepad = 0;
+			nand_chip->ecc.bytes = 0;
+			break;
+		}
+	}
+
+	/* second phase scan */
+	if (nand_scan_tail(mtd)) {
 		res = -ENXIO;
 		goto out;
 	}
@@ -179,9 +523,15 @@ static int __init at91_nand_probe(struct platform_device *pdev)
 	if (!res)
 		return res;
 
+#ifdef CONFIG_MTD_PARTITIONS
 release:
+#endif
 	nand_release(mtd);
+
 out:
+	iounmap(host->ecc);
+
+err_ecc_ioremap:
 	at91_nand_disable(host);
 	platform_set_drvdata(pdev, NULL);
 	iounmap(host->io_base);
@@ -202,6 +552,7 @@ static int __devexit at91_nand_remove(struct platform_device *pdev)
 	at91_nand_disable(host);
 
 	iounmap(host->io_base);
+	iounmap(host->ecc);
 	kfree(host);
 
 	return 0;
@@ -233,5 +584,5 @@ module_exit(at91_nand_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Rick Bronson");
-MODULE_DESCRIPTION("NAND/SmartMedia driver for AT91RM9200");
+MODULE_DESCRIPTION("NAND/SmartMedia driver for AT91RM9200 / AT91SAM9");
 MODULE_ALIAS("platform:at91_nand");
