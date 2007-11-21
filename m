Received: from nf-out-0910.google.com ([64.233.182.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IutnI-0001TC-2H
	for linux-mtd@lists.infradead.org; Wed, 21 Nov 2007 12:55:31 -0500
Received: by nf-out-0910.google.com with SMTP id h3so2194775nfh
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Nov 2007 09:55:22 -0800 (PST)
Message-ID: <47447105.10900@gmail.com>
Date: Wed, 21 Nov 2007 18:55:17 +0100
From: Richard Genoud <richard.genoud@gmail.com>
MIME-Version: 1.0
To: andrew@sanpeople.com
Subject: Re: [PATCH] Hardware ECC controller support on AT91SAM9260/3
References: <1192618825.18434.24.camel@JHARAL.adetel.com>
In-Reply-To: <1192618825.18434.24.camel@JHARAL.adetel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> This is a patch to use the hardware ECC controller of
> the AT91SAM9260 and AT91SAM9263 for the AT91 nand.
> On AT91 NAND, there's now a choice between ECC soft,
> ECC hard or no ECC (for debug).
> 
> It has been tested only on AT91SAM9263-EK for now
> (with 8 bits large page NAND).
> Any comments are welcome.

I had the opportunity to test this driver on a 512B page NAND (8bits).
I had to make some adjustments.
Now it's working on large and small pages.

kernel version : 2.6.23

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

---
diff -pruN a/arch/arm/mach-at91/board-sam9260ek.c b/arch/arm/mach-at91/board-sam9260ek.c
--- a/arch/arm/mach-at91/board-sam9260ek.c	2007-09-11 04:50:29.000000000 +0200
+++ b/arch/arm/mach-at91/board-sam9260ek.c	2007-10-11 15:57:46.000000000 +0200
@@ -158,6 +158,9 @@ static struct at91_nand_data __initdata 
#else
	.bus_width_16	= 0,
#endif
+#if defined(CONFIG_MTD_NAND_AT91_ECC_HW)
+	.ecc_base	= AT91_ECC,
+#endif
};


diff -pruN a/arch/arm/mach-at91/board-sam9263ek.c b/arch/arm/mach-at91/board-sam9263ek.c
--- a/arch/arm/mach-at91/board-sam9263ek.c	2007-09-11 04:50:29.000000000 +0200
+++ b/arch/arm/mach-at91/board-sam9263ek.c	2007-10-11 15:57:31.000000000 +0200
@@ -201,6 +201,9 @@ static struct at91_nand_data __initdata 
#else
	.bus_width_16	= 0,
#endif
+#if defined(CONFIG_MTD_NAND_AT91_ECC_HW)
+	.ecc_base	= AT91_ECC0,
+#endif
};


diff -pruN a/drivers/mtd/nand/at91_nand.c b/drivers/mtd/nand/at91_nand.c
--- a/drivers/mtd/nand/at91_nand.c	2007-10-05 12:50:45.000000000 +0200
+++ b/drivers/mtd/nand/at91_nand.c	2007-11-14 08:13:34.000000000 +0100
@@ -9,6 +9,14 @@
 *  Derived from drivers/mtd/spia.c
 *	 Copyright (C) 2000 Steven J. Hill (sjhill@cotw.com)
 *
+ *
+ *  Add Hardware ECC support for AT91SAM9260 / AT91SAM9263
+ *     Richard Genoud (richard.genoud@gmail.com), Adeneo Copyright (C) 2007
+ *
+ *     Derived from Das U-Boot source code (u-boot-1.1.5/board/atmel/at91sam9263ek/nand.c)
+ *     (C) Copyright 2006 ATMEL Rousset, Lacressonniere Nicolas
+ *
+ *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
@@ -29,6 +37,34 @@
#include <asm/arch/board.h>
#include <asm/arch/gpio.h>

+#ifdef CONFIG_MTD_NAND_AT91_ECC_HW
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
+	.oobfree = {{2, 58}}
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
+	.oobfree = {{6, 10}}
+};
+
+#endif 
+
struct at91_nand_host {
	struct nand_chip	nand_chip;
	struct mtd_info		mtd;
@@ -82,6 +118,223 @@ static void at91_nand_disable(struct at9
		at91_set_gpio_value(host->board->enable_pin, 1);
}

+#ifdef CONFIG_MTD_NAND_AT91_ECC_HW
+/*
+ * write oob for small pages
+ */
+static int at91sam9263_nand_write_oob_512 (struct mtd_info *mtd,
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
+static int at91sam9263_nand_read_oob_512 (struct mtd_info *mtd,
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
+ * @mtd:        MTD block structure
+ * @dat:        raw data (unused)
+ * @ecc_code:   buffer for ECC
+ */
+static int at91sam9263_nand_calculate(struct mtd_info *mtd,
+		const u_char *dat, unsigned char *ecc_code)
+{
+	struct nand_chip *nand_chip = mtd->priv;
+	struct at91_nand_host *host = nand_chip->priv;
+	unsigned int ecc_value;
+
+	/* get the first 2 ECC bytes */
+	ecc_value = at91_sys_read (host->board->ecc_base + AT91_ECC_PR) & AT91_ECC_PARITY;
+
+	ecc_code[nand_chip->ecc.layout->eccpos[0]] = ecc_value & 0xFF;
+	ecc_code[nand_chip->ecc.layout->eccpos[1]] = (ecc_value >> 8) & 0xFF;
+
+	/* get the last 2 ECC bytes */
+	ecc_value = at91_sys_read (host->board->ecc_base + AT91_ECC_NPR) & AT91_ECC_NPARITY;
+
+	ecc_code[nand_chip->ecc.layout->eccpos[2]] = ecc_value & 0xFF;
+	ecc_code[nand_chip->ecc.layout->eccpos[3]] = (ecc_value >> 8) & 0xFF;
+
+	return 0;
+}
+
+/*
+ * HW ECC read page function
+ *
+ * @mtd:        mtd info structure
+ * @chip:       nand chip info structure
+ * @buf:        buffer to store read data
+ */
+static int at91sam9263_nand_read_page(struct mtd_info *mtd,
+		struct nand_chip *chip, uint8_t *buf)
+{
+	int eccsize = chip->ecc.size;
+	int eccbytes = chip->ecc.bytes;
+	uint8_t *p = buf;
+	uint8_t *oob = chip->oob_poi;
+	uint8_t *ecc_pos;
+	int stat;
+
+	/* read the page */
+	chip->read_buf(mtd, p, eccsize);
+
+	/* move to ECC position if needed */
+	if (chip->ecc.layout->eccpos[0] != 0)
+	{
+		/* This only works on large pages
+		 * because the ECC controller waits for
+		 * NAND_CMD_RNDOUTSTART after the
+		 * NAND_CMD_RNDOUT.
+		 * anyway, for small pages, the eccpos[0] == 0
+		 */
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize + chip->ecc.layout->eccpos[0], -1);
+	}
+
+	/* the ECC controller needs to read the ECC just after the data */
+	ecc_pos = oob + chip->ecc.layout->eccpos[0];
+	chip->read_buf(mtd, ecc_pos, eccbytes);
+
+	/* check if there's an error */
+	stat = chip->ecc.correct(mtd, p, oob, NULL);
+
+	if (stat == -1)
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
+ * @mtd:        MTD block structure
+ * @dat:        raw data read from the chip
+ * @read_ecc:   ECC from the chip (unused)
+ * @isnull:     unused
+ *
+ * Detect and correct a 1 bit error for a page
+ */
+static int at91sam9263_nand_correct(struct mtd_info *mtd, u_char *dat,
+		u_char *read_ecc, u_char *isnull)
+{
+	struct nand_chip *nand_chip = mtd->priv;
+	struct at91_nand_host *host = nand_chip->priv;
+	unsigned int ecc_status;
+	unsigned int ecc_word, ecc_bit;
+	int status;
+
+	status = 0;
+
+	/* get the status from the Status Register */
+	ecc_status = at91_sys_read (host->board->ecc_base + AT91_ECC_SR);
+
+	/* if there is an error */
+	if (ecc_status & AT91_ECC_RECERR)
+	{
+		/* get error bit offset (4 bits) */
+		ecc_bit = at91_sys_read (host->board->ecc_base + AT91_ECC_PR)
+			& AT91_ECC_BITADDR;
+		/* get word address (12 bits) */
+		ecc_word = (at91_sys_read (host->board->ecc_base + AT91_ECC_PR)
+				& AT91_ECC_WORDADDR) >> 4;
+
+		/* if there are multiple errors */
+		if (ecc_status & AT91_ECC_MULERR)
+		{
+			/* check if it is a freshly erased block (filled with 0xff) */
+			if ((ecc_bit == AT91_ECC_BITADDR)
+					&& (ecc_word == (AT91_ECC_WORDADDR >> 4)))
+			{
+				/* the block has juste been erase, return OK */
+				status = 0;
+			}
+			else
+			{
+				/* it doesn't seems to be a freshly erased block */
+				/* We can't correct so many errors */
+				printk(KERN_INFO "at91_nand : multiple errors detected. Unable to correct.\n");
+				status = -1;
+			}
+		}
+		else
+		{
+			/* if there's a single bit error : we can correct it */
+			if (ecc_status & AT91_ECC_ECCERR)
+			{
+				/* there's nothing much to do here.
+				 * the bit error is on the ECC itself.
+				 */
+				printk(KERN_INFO "at91_nand : one bit error on ECC code. Nothing to correct\n");
+			}
+			else
+			{
+				printk(KERN_INFO "at91_nand : one bit error on data."
+					       " (word offset in the page : 0x%x bit offset : 0x%x)\n",
+						ecc_word, ecc_bit);
+				/* correct the error */
+				if (nand_chip->options & NAND_BUSWIDTH_16)
+				{
+					/* 16 bits words */
+					((unsigned short *) dat)[ecc_word] ^= (1 << ecc_bit);
+				} 
+				else
+				{
+					/* 8 bits words */
+					dat[ecc_word] ^= (1 << ecc_bit);
+				}
+				printk(KERN_INFO "at91_nand : error corrected\n");
+			}
+		}
+	}
+	return status;
+}
+
+/*
+ * Enable HW ECC : unsused
+ */
+static void at91sam9263_nand_hwctl(struct mtd_info *mtd, int mode) {;}
+
+#endif
+
#ifdef CONFIG_MTD_PARTITIONS
const char *part_probes[] = { "cmdlinepart", NULL };
#endif
@@ -132,7 +385,21 @@ static int __init at91_nand_probe(struct
	if (host->board->rdy_pin)
		nand_chip->dev_ready = at91_nand_device_ready;

+#ifdef CONFIG_MTD_NAND_AT91_ECC_HW
+	nand_chip->ecc.mode = NAND_ECC_HW_SYNDROME;		/* HW SYNDROME ECC */
+	nand_chip->ecc.calculate = at91sam9263_nand_calculate;	/* function called after a write */
+	nand_chip->ecc.correct = at91sam9263_nand_correct;	/* function called after a read */
+	nand_chip->ecc.hwctl = at91sam9263_nand_hwctl;		/* unused */
+	nand_chip->ecc.read_page = at91sam9263_nand_read_page;	/* read page function */
+	nand_chip->ecc.bytes = 4;				/* 4 ECC bytes for any page size */
+	nand_chip->ecc.postpad = 0;
+	nand_chip->ecc.prepad = 0;
+
+#elif defined CONFIG_MTD_NAND_AT91_ECC_SOFT
	nand_chip->ecc.mode = NAND_ECC_SOFT;	/* enable ECC */
+#else
+	nand_chip->ecc.mode = NAND_ECC_NONE;
+#endif
	nand_chip->chip_delay = 20;		/* 20us command delay time */

	if (host->board->bus_width_16)		/* 16-bit bus width */
@@ -149,11 +416,72 @@ static int __init at91_nand_probe(struct
		}
	}

+#ifdef CONFIG_MTD_NAND_AT91_ECC_HW
+	/* first scan to find the device and get the page size */
+	if (nand_scan_ident(mtd, 1))
+	{
+		res = -ENXIO;
+		goto out;
+	}
+
+	/* ECC is calculated for the whole page (1 step) */
+	nand_chip->ecc.size = mtd->writesize;
+
+	/* set ECC page size and oob layout */
+	switch (mtd->writesize)
+	{
+		case 512:
+			nand_chip->ecc.layout = &at91_oobinfo_small;
+			nand_chip->ecc.read_oob = at91sam9263_nand_read_oob_512;
+			nand_chip->ecc.write_oob = at91sam9263_nand_write_oob_512;
+			at91_sys_write (host->board->ecc_base +
+					AT91_ECC_MR,
+					AT91_ECC_PAGESIZE_528 & AT91_ECC_PAGESIZE);
+			break;
+		case 1024:
+			nand_chip->ecc.layout = &at91_oobinfo_large;
+			at91_sys_write (host->board->ecc_base +
+					AT91_ECC_MR,
+					AT91_ECC_PAGESIZE_1056 & AT91_ECC_PAGESIZE);
+			break;
+		case 2048:
+			nand_chip->ecc.layout = &at91_oobinfo_large;
+			at91_sys_write (host->board->ecc_base +
+					AT91_ECC_MR,
+					AT91_ECC_PAGESIZE_2112 & AT91_ECC_PAGESIZE);
+			break;
+		case 4096:
+			nand_chip->ecc.layout = &at91_oobinfo_large;
+			at91_sys_write (host->board->ecc_base +
+					AT91_ECC_MR,
+					AT91_ECC_PAGESIZE_4224 & AT91_ECC_PAGESIZE);
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
+	}
+	/* second phase scan */
+	if (nand_scan_tail(mtd))
+	{
+		res = -ENXIO;
+		goto out;
+	}
+#else
	/* Scan to find existance of the device */
	if (nand_scan(mtd, 1)) {
		res = -ENXIO;
		goto out;
	}
+#endif

#ifdef CONFIG_MTD_PARTITIONS
	if (host->board->partition_info)
@@ -179,7 +507,9 @@ static int __init at91_nand_probe(struct
	if (!res)
		return res;

+#ifdef CONFIG_MTD_PARTITIONS
release:
+#endif
	nand_release(mtd);
out:
	at91_nand_disable(host);
diff -pruN a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
--- a/drivers/mtd/nand/Kconfig	2007-10-05 12:50:45.000000000 +0200
+++ b/drivers/mtd/nand/Kconfig	2007-10-11 14:59:34.000000000 +0200
@@ -259,6 +259,40 @@ config MTD_NAND_AT91
	help
	  Enables support for NAND Flash / Smart Media Card interface
	  on Atmel AT91 processors.
+choice
+	prompt "ECC gestion for NAND Flash / SmartMedia on AT91"
+	depends on MTD_NAND_AT91
+
+config MTD_NAND_AT91_ECC_HW
+	bool "Hardware ECC"
+	depends on MTD_NAND_AT91 && (ARCH_AT91SAM9263 || ARCH_AT91SAM9260)
+	help
+	  Uses hardware ECC provided by the at91sam9260/at91sam9263 chip
+	  instead of software ECC.
+	  The hardware ECC controller is capable of single bit error
+	  correction and 2-bit random detection per page.
+
+	  If unsure, say Y
+
+config MTD_NAND_AT91_ECC_SOFT
+	bool "Software ECC"
+	depends on MTD_NAND_AT91
+	help
+	  Uses software ECC
+
+	  If unsure, say Y
+
+config MTD_NAND_AT91_ECC_NO
+	bool "No ECC (Testing Only)"
+	depends on MTD_NAND_AT91
+	help
+	  No ECC will be used.
+	  It's not a good idea and it should be reserved for testing
+	  purpose only.
+
+	  If unsure, say N
+
+endchoice

config MTD_NAND_CM_X270
	tristate "Support for NAND Flash on CM-X270 modules"
diff -pruN a/include/asm-arm/arch-at91/at91_ecc.h b/include/asm-arm/arch-at91/at91_ecc.h
--- a/include/asm-arm/arch-at91/at91_ecc.h	2007-10-05 12:50:45.000000000 +0200
+++ b/include/asm-arm/arch-at91/at91_ecc.h	2007-10-11 14:59:34.000000000 +0200
@@ -13,26 +13,28 @@
#ifndef AT91_ECC_H
#define AT91_ECC_H

-#define AT91_ECC_CR		(AT91_ECC + 0x00)	/* Control register */
+/* ECC registers offsets */
+#define AT91_ECC_CR		0x00				/* Control register */
#define		AT91_ECC_RST		(1 << 0)		/* Reset parity */

-#define AT91_ECC_MR		(AT91_ECC + 0x04)	/* Mode register */
+#define AT91_ECC_MR		0x04				/* Mode register */
#define		AT91_ECC_PAGESIZE	(3 << 0)		/* Page Size */
#define			AT91_ECC_PAGESIZE_528		(0)
#define			AT91_ECC_PAGESIZE_1056		(1)
#define			AT91_ECC_PAGESIZE_2112		(2)
#define			AT91_ECC_PAGESIZE_4224		(3)

-#define AT91_ECC_SR		(AT91_ECC + 0x08)	/* Status register */
+#define AT91_ECC_SR		0x08				/* Status register */
#define		AT91_ECC_RECERR		(1 << 0)		/* Recoverable Error */
#define		AT91_ECC_ECCERR		(1 << 1)		/* ECC Single Bit Error */
#define		AT91_ECC_MULERR		(1 << 2)		/* Multiple Errors */

-#define AT91_ECC_PR		(AT91_ECC + 0x0c)	/* Parity register */
+#define AT91_ECC_PR		0x0c				/* Parity register */
#define		AT91_ECC_BITADDR	(0xf << 0)		/* Bit Error Address */
#define		AT91_ECC_WORDADDR	(0xfff << 4)		/* Word Error Address */
+#define		AT91_ECC_PARITY		(0xffff << 0)		/* Parity */

-#define AT91_ECC_NPR		(AT91_ECC + 0x10)	/* NParity register */
+#define AT91_ECC_NPR		0x10				/* NParity register */
#define		AT91_ECC_NPARITY	(0xffff << 0)		/* NParity */

#endif
diff -pruN a/include/asm-arm/arch-at91/board.h b/include/asm-arm/arch-at91/board.h
--- a/include/asm-arm/arch-at91/board.h	2007-09-11 04:50:29.000000000 +0200
+++ b/include/asm-arm/arch-at91/board.h	2007-10-11 15:58:18.000000000 +0200
@@ -89,6 +89,9 @@ struct at91_nand_data {
	u8		ale;		/* address line number connected to ALE */
	u8		cle;		/* address line number connected to CLE */
	u8		bus_width_16;	/* buswidth is 16 bit */
+#if defined(CONFIG_MTD_NAND_AT91_ECC_HW)
+	u32		ecc_base;	/* ECC controller (offset from AT91_BASE_SYS) */
+#endif
	struct mtd_partition* (*partition_info)(int, int*);
};
extern void __init at91_add_device_nand(struct at91_nand_data *data);
