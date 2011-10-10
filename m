Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RDHAH-0001nu-8w
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2011 14:49:17 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Add driver for M-sys / Sandisk diskonchip G4 nand flash
Date: Mon, 10 Oct 2011 07:48:10 -0700
Message-Id: <1318258091-12670-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: robert.jarzmik@free.fr, Mike Dunn <mikedunn@newsguy.com>,
	marek.vasut@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a driver for the diskonchip G4 in my Palm Treo680.  I've tested it
fairly well; it passes the nandtest utility, and I've been able to create a
ubifs using it.

Under the hood, this device has MLC flash.  I understand there are some questions
as to the suitability of ubi on MLC, so I plan to do much more rigorous testing
on a ubifs.

The code may look a little rough around the edges (lots of TODO's in the
comments, some code commented out here and there).  It is the product of
reverse-engineering the device, so a lot of development was trial-and-error.  I
plan to clear up the remaining issues and clean up the code, but I was
encouraged to submit this to the list, so here it is, warts and all.  May also
be some more general things that need to be corrected to make it kernel-worthy,
but nothing too egregious, I don't think.  Integration with the mtd nand code
may also bear reviewing.  Stylistically, it passes the checkpatch.pl script.
Comments, criticisms gratefully received.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/nand/Kconfig  |    8 +
 drivers/mtd/nand/Makefile |    1 +
 drivers/mtd/nand/docg4.c  | 1331 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/docg4.h |   24 +
 4 files changed, 1364 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/nand/docg4.c
 create mode 100644 include/linux/mtd/docg4.h

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 4c34252..726ce63 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -319,6 +319,14 @@ config MTD_NAND_DISKONCHIP_BBTWRITE
 	  load time (assuming you build diskonchip as a module) with the module
 	  parameter "inftl_bbt_write=1".
 
+config MTD_NAND_DOCG4
+	tristate "Support for NAND DOCG4"
+	depends on EXPERIMENTAL && ARCH_PXA
+	select BCH
+	help
+	  Support for diskonchip G4 nand flash, found in several smartphones,
+	  such as the Palm Treo680 and HTC Prophet.
+
 config MTD_NAND_SHARPSL
 	tristate "Support for NAND Flash on Sharp SL Series (C7xx + others)"
 	depends on ARCH_PXA
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 5745d83..70993e7 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_MTD_NAND_PPCHAMELEONEVB)	+= ppchameleonevb.o
 obj-$(CONFIG_MTD_NAND_S3C2410)		+= s3c2410.o
 obj-$(CONFIG_MTD_NAND_DAVINCI)		+= davinci_nand.o
 obj-$(CONFIG_MTD_NAND_DISKONCHIP)	+= diskonchip.o
+obj-$(CONFIG_MTD_NAND_DOCG4)		+= docg4.o
 obj-$(CONFIG_MTD_NAND_FSMC)		+= fsmc_nand.o
 obj-$(CONFIG_MTD_NAND_H1900)		+= h1910.o
 obj-$(CONFIG_MTD_NAND_RTC_FROM4)	+= rtc_from4.o
diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
new file mode 100644
index 0000000..e3442ea
--- /dev/null
+++ b/drivers/mtd/nand/docg4.c
@@ -0,0 +1,1331 @@
+/*
+ * drivers/mtd/nand/docg4.c
+ *
+ *  Copyright (C) 2011 Mike Dunn <mikedunn@newsguy.com>
+ *
+ * Nand mtd driver for M-Systems DiskOnChip G4 device
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ *
+ *
+ * TODO:
+ *
+ *  Resolve timing issue with block erasures.  Currently erasures fail unless
+ *  CONFIG_MTD_NAND_VERIFY_WRITE is enabled.
+ *
+ *  Read factory bad block table (on page 4) and ensure blocks marked bad.
+ *
+ *  Implement power mgmt fns (suspend and resume)
+ *
+ *  Eliminate debug module param; use debugfs
+ *
+ *  Commentary explaining screwy g4 addressing; add commentary above functions
+ *
+ *  Hamming ecc when reading oob only
+ *
+ *  Look into handling of STATUS nand command
+ *  (return a saved status?, read a register?)
+ *
+ *  Support for multiple cascaded g4 devices ("floors") ?
+ *
+ *  Support on big endian host machines ?
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/init.h>
+#include <linux/string.h>
+#include <linux/sched.h>
+#include <linux/delay.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/bitops.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/docg4.h>
+#include <linux/bch.h>
+
+static int debug;
+module_param(debug, int, 0);
+MODULE_PARM_DESC(debug, "enable copious debug messages");
+
+static int ignore_badblocks;
+module_param(ignore_badblocks, int, 0);
+MODULE_PARM_DESC(ignore_badblocks, "no badblock checking performed");
+
+struct docg4_priv {
+	struct mtd_info	*mtd;
+	void __iomem *virtadr;
+	int status;
+	bool status_query;
+	uint8_t oob_buf[16];
+	uint8_t ecc_buf[16];
+	int oob_page;
+	uint8_t *verify_buf;
+	bool page_erased;
+	uint16_t *phi_mod_tables;
+	struct bch_control *bch;
+};
+
+/* registers */
+#define DOCG4_CHIP_ID_0        0x1000
+#define DOCG4_DEV_ID_SELECT    0x100a
+#define DOCG4_CONTROL          0x100c
+#define DOCG4_END_OF_DATA      0x101e
+#define DOCG4_NOP              0x103e
+#define DOCG4_SEQUENCE         0x1032
+#define DOCG4_COMMAND          0x1034
+#define DOCG4_ADDRESS          0x1036
+#define DOCG4_CONTROL_STATUS   0x1038
+#define DOCG4_ECC_CONTROL_0    0x1040
+#define DOCG4_ECC_CONTROL_1    0x1042
+#define DOCG4_HAMMING          0x1046
+#define DOCG4_BCH              0x1048
+#define DOCG4_MYSTERY_REG      0x1050
+#define DOCG4_MYSTERY_REG_2    0x1052
+#define DOCG4_CONTROL_CONFIRM  0x1072
+#define DOCG4_CHIP_ID_1        0x1074
+
+#define DOCG4_IO               0x800
+
+/* DOCG4_CONTROL_STATUS register bits */
+#define DOCG4_FLASH_READY      0x01
+
+/* DOCG4_CONTROL register bits */
+#define DOCG4_RESET            0x04
+#define DOCG4_NORMAL           0x05
+
+/* anatomy of the device */
+#define DOCG4_CHIPSIZE         0x8000000
+#define DOCG4_PAGE_SIZE        0x200
+#define DOCG4_PAGES_PER_BLOCK  0x200
+#define DOCG4_BLOCK_SIZE       (DOCG4_PAGES_PER_BLOCK * DOCG4_PAGE_SIZE)
+#define DOCG4_NUMBLOCKS        (DOCG4_CHIPSIZE / DOCG4_BLOCK_SIZE)
+#define DOCG4_OOB_SIZE         0x10
+
+#define DOCG4_IDREG1_VALUE     0x0400
+#define DOCG4_IDREG2_VALUE     0xfbff
+
+/* primitive polynomial used to build the Galois field used by hw ecc gen */
+#define DOCG4_PRIMITIVE_POLY   0x4443
+
+#define DOCG4_M                14  /* Galois field is of order 2^14 */
+#define DOCG4_T                4   /* BCH alg corrects up to 4 bit errors */
+
+#define DOCG4_DATA_LEN         520 /* ecc covers 512 byte page plus 8 oob */
+
+/* value computed by the HW ecc generator upon reading blank page */
+static uint8_t blank_read_hwecc[8] =  /* 7 ecc bytes; last byte unused */
+	{ 0xcf, 0x72, 0xfc, 0x1b, 0xa9, 0xc7, 0xb9, 0 };
+
+/*
+ * Oob bytes 0 - 6 and byte 15 (the last) are available to the user.
+ * Byte 7 is hamming ecc for first 7 bytes.  Bytes 8 - 14 are hw-generated ecc.
+ */
+static struct nand_ecclayout docg4_oobinfo = {
+	.eccbytes = 8,
+	.eccpos = {7, 8, 9, 10, 11, 12, 13, 14},
+	.oobfree = {{0, 7}, {15, 1} }
+};
+
+/* next two functions copied from nand_base.c verbatem... */
+static void docg4_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
+{
+	int i;
+	struct nand_chip *chip = mtd->priv;
+	u16 *p = (u16 *) buf;
+	len >>= 1;
+
+	for (i = 0; i < len; i++)
+		p[i] = readw(chip->IO_ADDR_R);
+}
+
+static void docg4_write_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
+{
+	int i;
+	struct nand_chip *chip = mtd->priv;
+	u16 *p = (u16 *) buf;
+	len >>= 1;
+
+	for (i = 0; i < len; i++)
+		writew(p[i], chip->IO_ADDR_W);
+}
+
+
+static int docg4_wait(struct mtd_info *mtd, struct nand_chip *nand)
+{
+	uint16_t flash_status;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	unsigned long timeo = jiffies + (HZ * 10);
+
+	if (unlikely(debug))
+		printk(KERN_DEBUG "docg4_wait...\n");
+
+	if (doc->status) {
+		int stat = doc->status;
+		doc->status = 0;
+		return stat;
+	}
+
+	/* hardware quirk of g4 requires reading twice initially */
+	flash_status = readw(docptr + DOCG4_CONTROL_STATUS);
+	flash_status = readw(docptr + DOCG4_CONTROL_STATUS);
+
+	while (!(flash_status & DOCG4_FLASH_READY)) {
+		if (time_after(jiffies, timeo)) {
+			printk(KERN_ERR "docg4: docg4_wait timed out\n");
+			return NAND_STATUS_FAIL;
+		}
+		udelay(1);
+		cond_resched();
+		flash_status = readb(docptr + DOCG4_CONTROL_STATUS);
+	}
+
+	return 0;
+}
+
+static void docg4_reset(struct mtd_info *mtd, struct nand_chip *nand)
+{
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	u16 dummy;
+
+	writew(DOCG4_RESET, docptr + DOCG4_CONTROL);
+	writew(~DOCG4_RESET, docptr + DOCG4_CONTROL_CONFIRM);
+	writew(0, docptr + DOCG4_NOP);
+	writew(DOCG4_NORMAL, docptr + DOCG4_CONTROL);
+	writew(~DOCG4_NORMAL, docptr + DOCG4_CONTROL_CONFIRM);
+
+	/* TODO: this may not be necessary... */
+	dummy = readw(docptr + DOCG4_CHIP_ID_0);
+	dummy = readw(docptr + DOCG4_MYSTERY_REG);
+	writew(0, docptr + DOCG4_NOP);
+	dummy = readw(docptr + DOCG4_CHIP_ID_0);
+	dummy = readw(docptr + DOCG4_MYSTERY_REG);
+	writew(0, docptr + DOCG4_DEV_ID_SELECT);
+
+	/* TODO: enables ecc? Should be done prior to read? */
+	/* writew(0x07, docptr + DOCG4_ECC_CONTROL_1); */
+	writew(0x27, docptr + DOCG4_ECC_CONTROL_1); /* what's the difference? */
+
+	docg4_wait(mtd, nand);
+}
+
+static void docg4_read_hw_ecc(void __iomem *docptr, uint8_t *ecc_buf)
+{
+	/* read the 7 hw-generated ecc bytes */
+	int bch_reg, i;
+	for (i = 0, bch_reg = DOCG4_BCH;  i < 7; bch_reg++, i++) {
+		ecc_buf[i] = readb(docptr + bch_reg);
+		ecc_buf[i] = readb(docptr + bch_reg); /* glitch hw */
+	}
+}
+
+static unsigned int docg4_ecc_mod_phi(uint8_t *ecc_buf, uint16_t *mod_table)
+{
+	/*
+	 * Divide the 56-bit ecc polynomial in ecc_buf by the 14-bit
+	 * polynomial represented by mod_table, and return remainder.
+	 *
+	 * A good reference for this algorithm is the section on cyclic
+	 * redundancy in the book "Numerical Recipes in C".
+	 *
+	 * N.B. The bit order of hw-generated bytes has the LS bit representing
+	 * the highest order term.  However, byte ordering has most significant
+	 * byte in ecc_buf[0].
+	 */
+
+	int i = ecc_buf[0];	        /* initial table index */
+	unsigned int b = mod_table[i];  /* first iteration */
+
+	i = (b & 0xff) ^ ecc_buf[1];
+	b = (b>>8) ^ mod_table[i];
+	i = (b & 0xff) ^ ecc_buf[2];
+	b = (b>>8) ^ mod_table[i];
+	i = (b & 0xff) ^ ecc_buf[3];
+	b = (b>>8) ^ mod_table[i];
+	i = (b & 0xff) ^ ecc_buf[4];
+	b = (b>>8) ^ mod_table[i];
+
+	/* last two bytes tricky because divisor width is not multiple of 8 */
+	b = b ^ (ecc_buf[6]<<8) ^ ecc_buf[5];
+	i = (b<<6) & 0xc0;
+	b = (b>>2) ^ mod_table[i];
+
+	return b;
+}
+
+static unsigned int docg4_eval_poly(struct docg4_priv *doc, unsigned int poly,
+				    unsigned int log_gf_elem)
+{
+	/*
+	 * Evaluate poly(alpha ^ log_gf_elem).  Poly is in the bit order used by
+	 * the ecc hardware (least significant bit is highest order
+	 * coefficient), but the result is in the opposite bit ordering (that
+	 * used by the bch alg).  We borrow the bch alg's power table.
+	 */
+	unsigned int pow, result = 0;
+
+	for (pow = 0; pow < log_gf_elem * 14; pow += log_gf_elem) {
+		if (poly & 0x2000)
+			result ^= doc->bch->a_pow_tab[pow];
+		poly <<= 1;
+	}
+	return result;
+}
+
+static unsigned int docg4_square_poly(struct docg4_priv *doc, unsigned int poly)
+{
+	/* square the polynomial; e.g., passing alpha^3 returns alpha^6 */
+
+	const unsigned int logtimes2 = doc->bch->a_log_tab[poly] * 2;
+
+	if (logtimes2 >= doc->bch->n)    /* modulo check */
+		return doc->bch->a_pow_tab[logtimes2 - doc->bch->n];
+	else
+		return doc->bch->a_pow_tab[logtimes2];
+}
+
+static int docg4_find_errbits(struct docg4_priv *doc, unsigned int errorpos[])
+{
+	/*
+	 * Given the 56 hardware-generated ecc bits, determine the locations of
+	 * the erroneous bits in the page data (and first 8 oob bytes).
+	 *
+	 * The BCH syndrome is calculated from the ecc, and the syndrome is
+	 * passed to the kernel's BCH library, which does the rest.
+	 *
+	 * For i in 1..7, each syndrome value S_i is calculated by dividing the
+	 * ecc polynomial by phi_i (the minimal polynomial of the Galois field
+	 * element alpha ^ i) and taking the remainder, which is then evaluated
+	 * with alpha ^ i.
+	 *
+	 * The classic text on this is "Error Control Coding" by Lin and
+	 * Costello (though I'd like to think there are better ones).
+	 */
+
+	int retval, i;
+	unsigned int b1, b3, b5, b7; /* remainders */
+	unsigned int s[7];       /* syndromes S_1 .. S_7 (S_8 not needed) */
+
+	/* b_i = ecc_polynomial modulo phi_i */
+	b1 = docg4_ecc_mod_phi(doc->ecc_buf, doc->phi_mod_tables);
+	b3 = docg4_ecc_mod_phi(doc->ecc_buf, doc->phi_mod_tables + 256);
+	b5 = docg4_ecc_mod_phi(doc->ecc_buf, doc->phi_mod_tables + 512);
+	b7 = docg4_ecc_mod_phi(doc->ecc_buf, doc->phi_mod_tables + 768);
+
+	/* evaluate remainders with corresponding Galois field elements */
+	s[0] = docg4_eval_poly(doc, b1, 1);  /* S_1 = b_1(alpha) */
+	s[2] = docg4_eval_poly(doc, b3, 3);  /* S_3 = b_3(alpha ^ 3) */
+	s[4] = docg4_eval_poly(doc, b5, 5);  /* S_5 = b_5(alpha ^ 5) */
+	s[6] = docg4_eval_poly(doc, b7, 7);  /* S_7 = b_7(alpha ^ 7) */
+
+	/* S_2, S_4, S_6 obtained by exploiting S_2i = S_i ^ 2 */
+	s[1] = docg4_square_poly(doc, s[0]); /* S_2 = S_1 ^ 2 */
+	s[3] = docg4_square_poly(doc, s[1]); /* S_4 = S_2 ^ 2 */
+	s[5] = docg4_square_poly(doc, s[2]); /* S_6 = S_3 ^ 2 */
+
+	/* pass syndrome to BCH algorithm */
+	retval = decode_bch(doc->bch, NULL, DOCG4_DATA_LEN,
+			    NULL, NULL, s, errorpos);
+	if (retval == -EBADMSG)	   /* more than 4 errors */
+		return 5;
+
+	/* undo last step in BCH alg; currently this is a mystery to me */
+	for (i = 0; i < retval; i++)
+		errorpos[i] = (errorpos[i] & ~7)|(7-(errorpos[i] & 7));
+
+	return retval;
+}
+
+
+static int docg4_correct_data(struct mtd_info *mtd, uint8_t *buf, int page)
+{
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	uint16_t edc_err;
+	int i, numerrs, errpos[5];
+
+	/* hardware quirk: read twice */
+	edc_err = readw(docptr + DOCG4_ECC_CONTROL_1);
+	edc_err = readw(docptr + DOCG4_ECC_CONTROL_1);
+
+	if (unlikely(debug))
+		printk(KERN_DEBUG "docg4_correct_data: "
+		       "status = 0x%02x\n", edc_err);
+
+	if (!(edc_err & 0x80)) { /* no error bits */
+		writew(0, docptr + DOCG4_END_OF_DATA);
+		return 0;
+	}
+
+	/* data contains error(s); read the 7 hw-generated ecc bytes */
+	docg4_read_hw_ecc(docptr, doc->ecc_buf);
+
+	/* check if ecc bytes are those of a blank page */
+	if (!memcmp(doc->ecc_buf, blank_read_hwecc, 7)) {
+		doc->page_erased = true;
+		writew(0, docptr + DOCG4_END_OF_DATA);
+		return 0;	/* blank page; ecc error normal */
+	}
+
+	doc->page_erased = false;
+
+	numerrs = docg4_find_errbits(doc, errpos);
+	if (numerrs > 4) {
+		printk(KERN_WARNING "docg4: "
+		       "uncorrectable errors at offset %08x\n", page * 0x200);
+		writew(0, docptr + DOCG4_END_OF_DATA);
+		return -1;
+	}
+
+	/* fix the errors */
+	for (i = 0; i < numerrs; i++)
+		change_bit(errpos[i], (unsigned long *)buf);
+
+	printk(KERN_NOTICE "docg4: %d errors corrected at offset %08x\n",
+	       numerrs, page * 0x200);
+
+	writew(0, docptr + DOCG4_END_OF_DATA);
+	return numerrs;
+}
+
+
+static uint8_t docg4_read_byte(struct mtd_info *mtd)
+{
+	/*
+	 * As currently written, the nand code gets chip status by calling
+	 * cmdfunc() (set to docg4_command()) with the NAND_CMD_STATUS command,
+	 * then calling read_byte.  This device does not work like standard nand
+	 * chips, so as a work-around hack, set a flag when the command is
+	 * received, so that we know to serve up the status here.
+	 */
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+
+	if (unlikely(debug))
+		printk(KERN_DEBUG "docg4_read_byte\n");
+
+	if (doc->status_query == true) {
+		doc->status_query = false;
+
+		/* TODO: return a saved status? read a register? */
+		return NAND_STATUS_WP; /* why is this inverse logic?? */
+	}
+
+	printk(KERN_WARNING "docg4: unexpectd call to read_byte()\n");
+
+	return 0;
+}
+
+static void docg4_select_chip(struct mtd_info *mtd, int chip)
+{
+#if 0
+	/* TODO: necessary? if so, don't just write 0! */
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	writew(0, docptr + DOCG4_DEV_ID_SELECT);
+	writew(0x50, docptr + DOCG4_CONTROL_STATUS);
+#endif
+	if (unlikely(debug))
+		printk(KERN_DEBUG "docg4_select_chip\n");
+
+}
+
+static void docg4_write_addr(struct docg4_priv *doc, unsigned int docg4_addr)
+{
+	void __iomem *docptr = doc->virtadr;
+
+	writeb(docg4_addr & 0xff, docptr + DOCG4_ADDRESS);
+	docg4_addr >>= 8;
+	writeb(docg4_addr & 0xff, docptr + DOCG4_ADDRESS);
+	docg4_addr >>= 8;
+	writeb(docg4_addr & 0xff, docptr + DOCG4_ADDRESS);
+	docg4_addr >>= 8;
+	writeb(docg4_addr & 0xff, docptr + DOCG4_ADDRESS);
+}
+
+static int docg4_read_progstatus(struct docg4_priv *doc)
+{
+	/* This apparently checks the status of programming.
+	 * Called after an erasure, and after page data is written.
+	 */
+	void __iomem *docptr = doc->virtadr;
+
+	/* status is read from I/O reg */
+	uint16_t status1 = readw(docptr + DOCG4_IO);
+	uint16_t status2 = readw(docptr + DOCG4_IO);
+	uint16_t status3 = readw(docptr + DOCG4_MYSTERY_REG);
+
+	/* TODO: better way to determine failure?
+	   Does CONTROL_STATUS (poll_1038) indicate failure after this?
+	   If so, can read it from docg4_command(NAND_CMD_STATUS) ? */
+	if (status1 != 0x51 || status2 != 0xe0 || status3 != 0xe0) {
+		doc->status = NAND_STATUS_FAIL;
+		printk(KERN_WARNING "docg4_read_progstatus failed: "
+		       "%02x, %02x, %02x\n", status1, status2, status3);
+		return -EIO;
+	}
+	return 0;
+}
+
+static int docg4_pageprog(struct mtd_info *mtd)
+{
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	int retval = 0;
+
+	if (unlikely(debug))
+		printk("docg4_pageprog\n");
+
+	writew(0x1e, docptr + DOCG4_SEQUENCE);
+	writew(0x10, docptr + DOCG4_COMMAND);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	docg4_wait(mtd, nand);
+
+	writew(0x29, docptr + DOCG4_SEQUENCE);
+	writew(0x70, docptr + DOCG4_COMMAND);
+	writew(0x8004, docptr + DOCG4_ECC_CONTROL_0);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+
+	retval = docg4_read_progstatus(doc);
+
+	writew(0, docptr + DOCG4_END_OF_DATA);
+	writew(0, docptr + DOCG4_NOP);
+	docg4_wait(mtd, nand);
+	writew(0, docptr + DOCG4_NOP);
+
+	return retval;
+}
+
+static void docg4_read_page_prologue(struct mtd_info *mtd,
+				     unsigned int docg4_addr)
+{
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+
+	if (unlikely(debug))
+		printk(KERN_DEBUG "docg4_read_page_prologue: %x\n", docg4_addr);
+
+	writew(0x50, docptr + DOCG4_CONTROL_STATUS);
+	writew(0x00, docptr + DOCG4_SEQUENCE);
+	writew(0xff, docptr + DOCG4_COMMAND);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	docg4_wait(mtd, nand);
+
+#if 0
+	/* TODO: sometimes written here by TrueFFS library */
+	writew(0x3f, docptr + DOCG4_SEQUENCE);
+	writew(0xa4, docptr + DOCG4_COMMAND);
+	writew(0, docptr + DOCG4_NOP);
+#endif
+
+	writew(0, docptr + DOCG4_NOP);
+	writew(0x03, docptr + DOCG4_SEQUENCE);
+	writew(0x00, docptr + DOCG4_COMMAND);
+	writew(0, docptr + DOCG4_NOP);
+
+	docg4_write_addr(doc, docg4_addr);
+
+	writew(0, docptr + DOCG4_NOP);
+	writew(0x30, docptr + DOCG4_COMMAND);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+
+	docg4_wait(mtd, nand);
+}
+
+static void docg4_write_page_prologue(struct mtd_info *mtd,
+				      unsigned int docg4_addr)
+{
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+
+	if (unlikely(debug))
+		printk(KERN_DEBUG "docg4_write_page_prologue: %x\n",
+		       docg4_addr);
+
+	writew(0x50, docptr + DOCG4_CONTROL_STATUS);
+	writew(0x00, docptr + DOCG4_SEQUENCE);
+	writew(0xff, docptr + DOCG4_COMMAND);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	docg4_wait(mtd, nand);
+	writew(0, docptr + DOCG4_NOP);
+
+#if 0
+	/* TODO: sometimes written here by TrueFFS library */
+	writew(0x3f, docptr + DOCG4_SEQUENCE);
+	writew(0xa4, docptr + DOCG4_COMMAND);
+	writew(0, docptr + DOCG4_NOP);
+#endif
+
+	writew(0x16, docptr + DOCG4_SEQUENCE);
+	writew(0x80, docptr + DOCG4_COMMAND);
+	writew(0, docptr + DOCG4_NOP);
+
+	docg4_write_addr(doc, docg4_addr);
+
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+
+	docg4_wait(mtd, nand);
+
+}
+
+static void docg4_command(struct mtd_info *mtd, unsigned command, int column,
+			  int page_addr)
+{
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	unsigned int g4_page, g4_col, g4_addr;
+
+	if (unlikely(debug))
+		printk(KERN_DEBUG "docg4_command %x, page_addr=%x, column=%x\n",
+		       command, page_addr, column);
+
+	switch (command) {
+
+	case NAND_CMD_RESET:
+		docg4_reset(mtd, nand);
+		break;
+
+	case NAND_CMD_READ0:
+		/* convert page and column to screwy g4 addressing scheme */
+		g4_page = page_addr / 4;
+		g4_col = (page_addr % 4) * 0x108 + column/2;
+		g4_addr = (g4_page << 16) | g4_col;
+		docg4_read_page_prologue(mtd, g4_addr);
+		break;
+
+	case NAND_CMD_STATUS:
+		/* next call to read_byte() will expect a status */
+		doc->status_query = true;
+		break;
+
+	/* we don't expect these, based on review of nand_base.c */
+	case NAND_CMD_READOOB:
+	case NAND_CMD_SEQIN:
+	case NAND_CMD_PAGEPROG:
+	case NAND_CMD_READID:
+	case NAND_CMD_ERASE1:
+	case NAND_CMD_ERASE2:
+		printk(KERN_WARNING "docg4_command: "
+		       "unexpected command 0x%x\n", command);
+		break;
+
+	}
+}
+
+static int docg4_read_page_syndrome(struct mtd_info *mtd,
+				    struct nand_chip *chip,
+				    uint8_t *buf, int page)
+{
+	struct docg4_priv *doc = chip->priv;
+	void __iomem *docptr = doc->virtadr;
+	uint16_t mystery_byte, *buf16;
+	int bits_corrected;
+
+	if (unlikely(debug))
+		printk(KERN_DEBUG "docg4_read_page_syndrome: page %08x\n",
+		       page);
+
+	/*  TODO: 0x820f, 0xb20f, what's the difference? M512_HAMMING_EN? */
+	/* writew(0x820f, docptr + DOCG4_ECC_CONTROL_0) */
+	writew(0xb20f, docptr + DOCG4_ECC_CONTROL_0);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+
+	/*
+	 * TODO: how to interpret mystery byte? Reads 0x51, 0x73 on error
+	 * return error if not 0x51?
+	 */
+	mystery_byte = readw(docptr + DOCG4_IO);
+	if (unlikely(debug))
+		printk(KERN_DEBUG "data read mystery_byte = 0x%x\n",
+		       mystery_byte);
+
+	docg4_read_buf16(mtd, buf, DOCG4_PAGE_SIZE); /* read the page data */
+
+	/* Now oob is read.  First 14 bytes read from I/O reg */
+	chip->read_buf(mtd, chip->oob_poi, 14);
+
+	/* last 2 read from another reg */
+	buf16 = (uint16_t *)(chip->oob_poi + 14);
+	*buf16 = readw(docptr + DOCG4_MYSTERY_REG);
+
+	writew(0, docptr + DOCG4_NOP);
+
+	bits_corrected = docg4_correct_data(mtd, buf, page);
+	if (bits_corrected < 0)
+		mtd->ecc_stats.failed++;
+	else
+		mtd->ecc_stats.corrected += bits_corrected;
+
+	return 0;	/* always success; same as default fn in nand_base */
+}
+
+static int docg4_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
+				   int page, int sndcmd)
+{
+	struct docg4_priv *doc = chip->priv;
+	void __iomem *docptr = doc->virtadr;
+	uint16_t mystery_byte;
+
+	if (unlikely(debug))
+		printk(KERN_DEBUG "docg4_read_oob_syndrome: page %x\n", page);
+
+	chip->cmdfunc(mtd, NAND_CMD_READ0, chip->ecc.size, page);
+
+	writew(0x8010, docptr + DOCG4_ECC_CONTROL_0);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+
+	/*
+	 * TODO: how to interpret mystery byte?
+	 * Reads 0x51 for oob data read only
+	 */
+	mystery_byte = readw(docptr + DOCG4_IO);
+	if (unlikely(debug))
+		printk(KERN_DEBUG "oob read mystery_byte = 0x%x\n",
+		       mystery_byte);
+
+	chip->read_buf(mtd, chip->oob_poi, 16);
+
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_END_OF_DATA);
+	writew(0, docptr + DOCG4_NOP);
+
+	return 0;
+}
+
+#ifdef CONFIG_MTD_NAND_VERIFY_WRITE
+/*
+ * Read back a written or erased page and verify correct contents.
+ * 'page' arg uses external addressing model; i.e., 512 bytes per page.
+ * nand_base now does this for writes; we only use this to verify erasure.
+ */
+static int docg4_verify(struct mtd_info *mtd, int page, const uint8_t *buf)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct docg4_priv *doc = chip->priv;
+	uint8_t oob_buf[16];
+
+	/* save the oob bytes; will be overwritten during read */
+	memcpy(oob_buf, chip->oob_poi, 16);
+
+	/* read the page data into doc->verify_buf */
+	docg4_command(mtd, NAND_CMD_READ0, 0, page);
+	docg4_read_page_syndrome(mtd, chip, doc->verify_buf, page);
+
+	/* NULL buf indicates verify erasure; check flag set during read */
+	if (buf == NULL) {
+		if (doc->page_erased == false) {
+			printk(KERN_WARNING
+			       "docg4: page 0x%x erase verify failed\n", page);
+			return -1;
+		}
+		return 0;	/* erasure verified */
+	}
+
+	/* not erasure... compare page data buffers */
+	if (memcmp(doc->verify_buf, buf, DOCG4_PAGE_SIZE)) {
+		printk(KERN_WARNING
+		       "docg4: page 0x%x write verify failed\n", page);
+		return -1;
+	}
+
+	/* compare oob data buffers, excluding hw generated ecc bytes */
+	if (memcmp(oob_buf, chip->oob_poi, 7) ||
+	    oob_buf[15] != chip->oob_poi[15]) {
+		printk(KERN_WARNING
+		       "docg4: page 0x%x oob write verify failed\n", page);
+		return -1;
+	}
+
+	return 0;		/* write verified */
+}
+#endif
+
+static void docg4_erase_block(struct mtd_info *mtd, int page)
+{
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	uint16_t g4_page;
+
+	if (unlikely(debug))
+		printk("docg4_erase_block: page %04x\n", page);
+
+	/*
+	 * TODO: this is exactly the same as start of docg4_read_page_prologue()
+	 * if extra 3a > 1032, a3 > 1034 are inserted
+	 */
+	writew(0x50, docptr + DOCG4_CONTROL_STATUS);
+	writew(0x00, docptr + DOCG4_SEQUENCE);
+	writew(0xff, docptr + DOCG4_COMMAND);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	docg4_wait(mtd, nand);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0x3a, docptr + DOCG4_SEQUENCE);
+	writew(0xa3, docptr + DOCG4_COMMAND);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0x24, docptr + DOCG4_SEQUENCE);
+	writew(0x60, docptr + DOCG4_COMMAND);
+	writew(0, docptr + DOCG4_NOP);
+
+	/* only 2 bytes of address are written to specify erase block */
+	g4_page = (uint16_t)(page / 4);  /* to g4's 2k page addressing */
+	writeb(g4_page & 0xff, docptr + DOCG4_ADDRESS);
+	g4_page >>= 8;
+	writeb(g4_page & 0xff, docptr + DOCG4_ADDRESS);
+
+	/* start the erasure */
+	writew(0, docptr + DOCG4_NOP);
+	writew(0xd0, docptr + DOCG4_COMMAND);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	docg4_wait(mtd, nand);	/* long wait for erasure */
+
+	writew(0x29, docptr + DOCG4_SEQUENCE);
+	writew(0x70, docptr + DOCG4_COMMAND);
+	writew(0x8004, docptr + DOCG4_ECC_CONTROL_0);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+
+	docg4_read_progstatus(doc);
+
+	writew(0, docptr + DOCG4_END_OF_DATA);
+	writew(0, docptr + DOCG4_NOP);
+	docg4_wait(mtd, nand);
+	writew(0, docptr + DOCG4_NOP);
+
+#ifdef CONFIG_MTD_NAND_VERIFY_WRITE
+	{
+		int i;
+		/*
+		 * Check kernel log for erase verification failures.  Note that
+		 * occasional failures are reported, but a subsequent dump of
+		 * the page always shows that it is correctly erased.  Might be
+		 * a timing issue.
+		 */
+		for (i = 0; i < DOCG4_PAGES_PER_BLOCK; i++, page++)
+			docg4_verify(mtd, page, NULL);
+	}
+#endif
+}
+
+static void docg4_write_page_syndrome(struct mtd_info *mtd,
+				      struct nand_chip *chip,
+				      const uint8_t *buf)
+{
+	struct docg4_priv *doc = chip->priv;
+	void __iomem *docptr = doc->virtadr;
+	uint8_t hamming;
+	uint8_t ecc_buf[8];
+
+	if (unlikely(debug))
+		printk(KERN_DEBUG "docg4_write_page_syndrome...\n");
+
+	writew(0x320f, docptr + DOCG4_ECC_CONTROL_0);
+	writew(0, docptr + DOCG4_NOP);
+
+	/* write the page data */
+	chip->write_buf(mtd, buf, DOCG4_PAGE_SIZE);
+
+	/* oob bytes 0 through 5 are written to I/O reg */
+	chip->write_buf(mtd, chip->oob_poi, 6);
+
+	/* oob byte 6 written to a separate reg */
+	writew(chip->oob_poi[6], docptr + DOCG4_MYSTERY_REG_2);
+
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+
+	/* oob byte 7 is hamming code */
+	hamming = readb(docptr + DOCG4_HAMMING);
+	hamming = readb(docptr + DOCG4_HAMMING); /* gotta read twice */
+	writew(hamming, docptr + DOCG4_MYSTERY_REG_2);
+	writew(0, docptr + DOCG4_NOP);
+
+	/* read the 7 bytes from ecc regs and write to next oob area */
+	docg4_read_hw_ecc(docptr, ecc_buf);
+	ecc_buf[7] = chip->oob_poi[15]; /* last byte user-programmed */
+	chip->write_buf(mtd, ecc_buf, 8);
+
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_NOP);
+	writew(0, docptr + DOCG4_END_OF_DATA);
+	writew(0, docptr + DOCG4_NOP);
+}
+
+static int docg4_write_page(struct mtd_info *mtd, struct nand_chip *chip,
+			    const uint8_t *buf, int page, int cached, int raw)
+{
+	int status;
+	struct docg4_priv *doc = chip->priv;
+	uint32_t g4_page = page / 4;
+	uint32_t g4_index = (page % 4) * 0x108;
+	uint32_t g4_addr = (g4_page << 16) | g4_index;
+
+	docg4_write_page_prologue(mtd, g4_addr);
+
+	/* hack for deferred write of oob bytes */
+	if (doc->oob_page == page)
+		memcpy(chip->oob_poi, doc->oob_buf, 16);
+
+	if (unlikely(raw)) {
+		printk(KERN_WARNING "docg4: unsupported raw write operation\n");
+		return -EOPNOTSUPP; /* TODO: support "raw" writes? */
+	} else
+		docg4_write_page_syndrome(mtd, chip, buf);
+
+	status = docg4_pageprog(mtd);
+	if (status) {
+		printk(KERN_WARNING "docg4: docg4_write_page failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int docg4_write_oob_syndrome(struct mtd_info *mtd,
+				    struct nand_chip *chip, int page)
+{
+	/*
+	 * This is not really supported, because MLC nand must write oob bytes
+	 * at the same time as page data.  Nonetheless, we save the oob buffer
+	 * contents here, and then write it along with the page data if the same
+	 * page is subsequently written.  This allows user space utilities
+	 * (e.g., nandwrite) that write the oob data prior to the page data to
+	 * work.
+	 */
+
+	/* note that bytes 7..14 are hw generated hamming/ecc and overwritten */
+	struct docg4_priv *doc = chip->priv;
+	doc->oob_page = page;
+	memcpy(doc->oob_buf, chip->oob_poi, 16);
+	return 0;
+}
+
+static int docg4_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+	struct nand_chip *chip = mtd->priv;
+	int block, page, ret, i;
+	uint8_t *buf;
+	struct nand_bbt_descr *bbtd = chip->badblock_pattern;
+
+	if (unlikely(debug))
+		printk(KERN_DEBUG "docg4_block_markbad: %08llx\n", ofs);
+
+	buf = kzalloc(DOCG4_PAGE_SIZE, GFP_KERNEL);
+	if (buf == NULL)
+		return -ENOMEM;
+
+	/* Get block and page numbers */
+	block = (int)(ofs >> chip->bbt_erase_shift);
+	page = (int)(ofs >> chip->page_shift);
+
+	/* update bbt in memory */
+	if (chip->bbt)
+		chip->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);
+
+	/* write bit-wise negation of pattern to oob buffer */
+	memset(chip->oob_poi, 0xff, mtd->oobsize);
+	for (i = 0; i < bbtd->len; i++)
+		chip->oob_poi[bbtd->offs + i] = ~bbtd->pattern[i];
+
+	/* write first 2 pages of block */
+	ret = docg4_write_page(mtd, chip, buf, page, 0, 0);
+	ret = docg4_write_page(mtd, chip, buf, page + 1, 0, 0);
+
+	if (!ret)
+		mtd->ecc_stats.badblocks++;
+
+	kfree(buf);
+
+	return ret;
+}
+
+static int docg4_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
+{
+	int i;
+	struct nand_chip *chip = mtd->priv;
+	int page = (int)(ofs >> chip->page_shift) & chip->pagemask;
+	struct nand_bbt_descr *bbtd = chip->badblock_pattern;
+
+	if (unlikely(debug))
+		printk(KERN_DEBUG "docg4_block_bad: %08llx\n", ofs);
+
+	if (ignore_badblocks)
+		return 0;
+
+	docg4_read_oob_syndrome(mtd, chip, page, 0);
+
+	for (i = 0; i < bbtd->len; i++) {
+		if (chip->oob_poi[bbtd->offs + i] != bbtd->pattern[i])
+			return 1;
+	}
+
+	return 0;
+}
+
+static void __init docg4_build_mod_tables(uint16_t *tables)
+{
+	/*
+	 * Build tables for fast modulo division of the hardware-generated 56
+	 * bit ecc polynomial by the minimal polynomials of the Galois field
+	 * elements alpha, alpha^3, alpha^5, alpha^7.
+	 *
+	 * A good reference for this algorithm is the section on cyclic
+	 * redundancy in the book "Numerical Recipes in C".
+	 *
+	 * N.B. The bit ordering of the table entries has the LS bit
+	 * representing the highest order coefficient, consistent with the
+	 * ordering used by the hardware ecc generator.
+	 */
+
+	/* minimal polynomials, with highest order term (LS bit) removed */
+	const uint16_t phi_1 = 0x3088;
+	const uint16_t phi_3 = 0x39a0;
+	const uint16_t phi_5 = 0x36d8;
+	const uint16_t phi_7 = 0x23f2;
+
+	/* one table of 256 elements for each minimal polynomial */
+	uint16_t *const phi_1_tab = tables;
+	uint16_t *const phi_3_tab = tables + 256;
+	uint16_t *const phi_5_tab = tables + 512;
+	uint16_t *const phi_7_tab = tables + 768;
+
+	int i, j;
+	for (i = 0; i < 256; i++) {
+		phi_1_tab[i] = (uint16_t)i;
+		phi_3_tab[i] = (uint16_t)i;
+		phi_5_tab[i] = (uint16_t)i;
+		phi_7_tab[i] = (uint16_t)i;
+		for (j = 0; j < 8; j++) {
+			if (phi_1_tab[i] & 0x01)
+				phi_1_tab[i] = (phi_1_tab[i] >> 1) ^ phi_1;
+			else
+				phi_1_tab[i] >>= 1;
+			if (phi_3_tab[i] & 0x01)
+				phi_3_tab[i] = (phi_3_tab[i] >> 1) ^ phi_3;
+			else
+				phi_3_tab[i] >>= 1;
+			if (phi_5_tab[i] & 0x01)
+				phi_5_tab[i] = (phi_5_tab[i] >> 1) ^ phi_5;
+			else
+				phi_5_tab[i] >>= 1;
+			if (phi_7_tab[i] & 0x01)
+				phi_7_tab[i] = (phi_7_tab[i] >> 1) ^ phi_7;
+			else
+				phi_7_tab[i] >>= 1;
+		}
+	}
+}
+
+static void docg4_dummy_ecc_write_page(struct mtd_info *mtd,
+				       struct nand_chip *chip,
+				       const uint8_t *buf)
+{
+	/*
+	 * nand_base.c says chip->write_page() is replaceable, and we replace it
+	 * with docg4_write_page(), which obviates the need to define
+	 * chip->ecc.write_page().  But nand_base.c throws a BUG() if this is
+	 * not defined when chip->ecc.mode == NAND_ECC_HW_SYNDROME.
+	 * TODO: patch nand_base.c, or see if nand_write_page() (which calls
+	 * chip->ecc.write_page()) can be used by this code, or lie about mode.
+	 */
+	printk(KERN_WARNING "docg4_dummy_ecc_write_page called\n");
+	BUG();
+}
+
+static void __init docg4_init_datastructs(struct mtd_info *mtd)
+{
+	/*
+	 * Most of the nand functions must be implemented locally.  This is
+	 * because we skip the call to nand_scan_ident(), which contains the
+	 * call to nand_set_defaults().  Most of the default fns are not
+	 * exported from nand_base.c, so we can't assign them from here.  But
+	 * most need to be overridden anyway; only a few short functions (e.g.,
+	 * read/write_buf) are duplicated.  For the same reason, some code from
+	 * nand_set_defaults() is duplicated below.  The call to
+	 * nand_scan_ident() is skipped because on diskonchip the chip id is not
+	 * read the same as on a standard nand device.
+	 */
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+
+	mtd->size = DOCG4_CHIPSIZE;
+	mtd->writesize = DOCG4_PAGE_SIZE;
+	mtd->erasesize = DOCG4_BLOCK_SIZE;
+	mtd->oobsize = DOCG4_OOB_SIZE;
+	mtd->name = "Msys Diskonchip G4";
+
+	nand->page_shift = 9;
+	nand->pagemask = 0x3ffff;
+	nand->chip_shift = 27;
+	nand->badblockpos = NAND_SMALL_BADBLOCK_POS;
+	nand->chipsize = DOCG4_CHIPSIZE;
+	nand->chip_shift = ffs((unsigned)nand->chipsize) - 1;
+	nand->bbt_erase_shift = nand->phys_erase_shift =
+		ffs(mtd->erasesize) - 1;
+	nand->chip_delay = 20;
+
+	nand->cmdfunc = docg4_command;
+	nand->waitfunc = docg4_wait;
+	nand->select_chip = docg4_select_chip;
+	nand->read_byte = docg4_read_byte;
+	nand->block_bad	= docg4_block_bad;
+	nand->block_markbad = docg4_block_markbad;
+	nand->read_buf = docg4_read_buf16;
+	nand->write_buf = docg4_write_buf16;
+	nand->scan_bbt = nand_default_bbt;
+	nand->erase_cmd = docg4_erase_block;
+	nand->ecc.read_page = docg4_read_page_syndrome;
+	nand->ecc.read_oob = docg4_read_oob_syndrome;
+	nand->write_page = docg4_write_page;
+	nand->ecc.write_oob = docg4_write_oob_syndrome;
+
+	/* raw reads don't make sense on this device; hw ecc always on */
+	nand->ecc.read_page_raw = docg4_read_page_syndrome;
+
+	/* see comment in this function */
+	nand->ecc.write_page = docg4_dummy_ecc_write_page;
+
+	nand->ecc.layout = &docg4_oobinfo;
+	nand->ecc.mode = NAND_ECC_HW_SYNDROME;
+	nand->ecc.size = DOCG4_PAGE_SIZE;
+	nand->ecc.prepad = 8;
+	nand->ecc.bytes	= 8;
+
+	if (ignore_badblocks)
+		nand->options = NAND_BUSWIDTH_16 | NAND_NO_SUBPAGE_WRITE |
+			NAND_NO_AUTOINCR | NAND_SKIP_BBTSCAN;
+	else
+		nand->options = NAND_BUSWIDTH_16 | NAND_NO_SUBPAGE_WRITE |
+			NAND_NO_AUTOINCR;
+
+	nand->IO_ADDR_R = nand->IO_ADDR_W = doc->virtadr + DOCG4_IO;
+
+	nand->controller = &nand->hwcontrol;
+	spin_lock_init(&nand->controller->lock);
+	init_waitqueue_head(&nand->controller->wq);
+}
+
+static int __init docg4_read_id_reg(struct mtd_info *mtd,
+				    struct nand_chip *nand)
+{
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	uint16_t id1, id2;
+
+	/* check for presence of g4 chip by reading id registers */
+	id1 = readw(docptr + DOCG4_CHIP_ID_0);
+	id1 = readw(docptr + DOCG4_MYSTERY_REG);
+	id2 = readw(docptr + DOCG4_CHIP_ID_1);
+	id2 = readw(docptr + DOCG4_MYSTERY_REG);
+
+	if (id1 == DOCG4_IDREG1_VALUE && id2 == DOCG4_IDREG2_VALUE) {
+		printk(KERN_INFO "NAND device: 128MiB Diskonchip G4 detected\n");
+		return 0;
+	}
+
+	printk(KERN_WARNING "No diskonchip G4 device found.\n");
+	return -ENODEV;
+}
+
+static int __init docg4_probe(struct platform_device *pdev)
+{
+	struct mtd_info *mtd;
+	struct nand_chip *nand;
+	void __iomem *virtadr;
+	struct docg4_priv *doc;
+	int len, retval;
+	struct resource *r;
+	struct device *dev = &pdev->dev;
+	const struct docg4_nand_platform_data *pdata = dev->platform_data;
+
+	if (pdata == NULL) {
+		dev_err(&pdev->dev, "no platform data!\n");
+		return -EINVAL;
+	}
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (r == NULL) {
+		dev_err(&pdev->dev, "no io memory resource defined!\n");
+		return -ENODEV;
+	}
+
+	virtadr = ioremap(r->start, resource_size(r));
+	if (!virtadr) {
+		printk(KERN_ERR "Diskonchip ioremap failed: "
+		       "0x%x bytes at 0x%x\n",
+		       resource_size(r), r->start);
+		return -EIO;
+	}
+
+	len = sizeof(struct mtd_info) + sizeof(struct nand_chip) +
+		sizeof(struct docg4_priv);
+	mtd = kzalloc(len, GFP_KERNEL);
+	if (mtd == NULL) {
+		retval = -ENOMEM;
+		goto fail;
+	}
+	nand = (struct nand_chip *) (mtd + 1);
+	doc = (struct docg4_priv *) (nand + 1);
+	mtd->priv = nand;
+	nand->priv = doc;
+	mtd->owner = THIS_MODULE;
+	doc->virtadr = virtadr;
+
+	docg4_init_datastructs(mtd);
+
+	/* allocate and initialize the modulo tables */
+	doc->phi_mod_tables =
+		kzalloc(256*4*sizeof(*doc->phi_mod_tables), GFP_KERNEL);
+	if (doc->phi_mod_tables == NULL) {
+		retval = -ENOMEM;
+		goto fail;
+	}
+	docg4_build_mod_tables(doc->phi_mod_tables);
+
+	/* initialize kernel bch algorithm */
+	doc->bch = init_bch(DOCG4_M, DOCG4_T, DOCG4_PRIMITIVE_POLY);
+	if (doc->bch == NULL) {
+		retval = -EINVAL;
+		goto fail;
+	}
+
+	platform_set_drvdata(pdev, doc);
+
+	docg4_reset(mtd, nand);
+	retval = docg4_read_id_reg(mtd, nand);
+	if (retval)
+		goto fail;
+
+	retval = nand_scan_tail(mtd);
+	if (retval)
+		goto fail;
+
+	retval = mtd_device_register(mtd, NULL, 0);
+	if (retval)
+		goto fail;
+
+	if (pdata->nr_partitions > 0) {
+		int i;
+		for (i = 0; i < pdata->nr_partitions; i++)
+			pdata->partitions[i].ecclayout = &docg4_oobinfo;
+		retval = mtd_device_register(mtd, pdata->partitions,
+					     pdata->nr_partitions);
+	}
+	if (retval)
+		goto fail;
+
+#ifdef CONFIG_MTD_NAND_VERIFY_WRITE
+	doc->verify_buf = kmalloc(DOCG4_PAGE_SIZE, GFP_KERNEL);
+	if (!doc->verify_buf) {
+		printk(KERN_ERR "docg4: kmalloc (%d bytes) failed!\n",
+		       DOCG4_PAGE_SIZE);
+		retval = -ENOMEM;
+		goto fail;
+	}
+	printk(KERN_INFO "docg4: MTD_NAND_VERIFY_WRITE enabled\n");
+#endif
+
+	doc->mtd = mtd;
+	return 0;
+
+ fail:
+	iounmap(virtadr);
+	if (mtd) {
+		/* re-declarations avoid compiler warning */
+		struct nand_chip *nand = mtd->priv;
+		struct docg4_priv *doc = nand->priv;
+		kfree(doc->phi_mod_tables);
+		kfree(doc->verify_buf);
+		nand_release(mtd); /* deletes partitions and mtd devices */
+		platform_set_drvdata(pdev, NULL);
+		kfree(mtd);
+	}
+
+	return retval;
+}
+
+static int __exit cleanup_docg4(struct platform_device *pdev)
+{
+	struct docg4_priv *doc = platform_get_drvdata(pdev);
+
+#ifdef CONFIG_MTD_NAND_VERIFY_WRITE
+	kfree(doc->verify_buf);
+#endif
+	nand_release(doc->mtd);
+	iounmap(doc->virtadr);
+	platform_set_drvdata(pdev, NULL);
+	kfree(doc->phi_mod_tables);
+	kfree(doc);
+	return 0;
+}
+
+static struct platform_driver docg4_driver = {
+	.driver		= {
+		.name	= "docg4",
+		.owner	= THIS_MODULE,
+	},
+	.remove		= __exit_p(cleanup_docg4),
+};
+
+static int __init docg4_init(void)
+{
+	return platform_driver_probe(&docg4_driver, docg4_probe);
+}
+
+static void __exit docg4_exit(void)
+{
+	platform_driver_unregister(&docg4_driver);
+}
+
+module_init(docg4_init);
+module_exit(docg4_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mike Dunn");
+MODULE_DESCRIPTION("M-Systems DiskOnChip G4 device driver");
diff --git a/include/linux/mtd/docg4.h b/include/linux/mtd/docg4.h
new file mode 100644
index 0000000..654699c
--- /dev/null
+++ b/include/linux/mtd/docg4.h
@@ -0,0 +1,24 @@
+/*
+ *  Copyright (C) 2011 Mike Dunn <mikedunn@newsguy.com>
+ *
+ * Nand mtd driver for M-Systems DiskOnChip G4 device
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+struct docg4_nand_platform_data {
+	struct mtd_partition *partitions;
+	unsigned int nr_partitions;
+};
-- 
1.7.3.4
