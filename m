Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RMRH0-00033J-Ep
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2011 21:26:07 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3] mtd: nand: Add driver for M-sys / Sandisk diskonchip G4
Date: Fri,  4 Nov 2011 14:25:08 -0700
Message-Id: <1320441908-9684-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a nand driver for the diskonchip G4 in my Palm Treo680.  It's been
fairly well tested; it passes the nandtest utility in mtd-utils, and also the
kernel tests mtd_pagetest and mtd_readtest.  Common mtd-utils work as well
(nanddump, nandwrite, flash_erase, ...).  A ubifs was created on it and seems
to be working well, though more stress testing is needed.

Since version 2:

 - Replace DEBUG macros defined in mtd.h with dev_dbg (intended for V2).
   Compiles against l2-mtd kernel (tested against mtd-2.6 kernel).

 - Fix oversight I noticed which would cause read errors in user oob bytes not
   to be corrected (and array out-of-bounds to occur)

 - Implement Ivan's suggestion for detecting bit flips on read of a blank page.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---

Still hoping for some comments ragarding suitability of the nand interface for
these devices.

 drivers/mtd/nand/Kconfig  |   12 +
 drivers/mtd/nand/Makefile |    1 +
 drivers/mtd/nand/docg4.c  | 1220 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/docg4.h |   24 +
 4 files changed, 1257 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/nand/docg4.c
 create mode 100644 include/linux/mtd/docg4.h

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 4c34252..abb5a33 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -319,6 +319,18 @@ config MTD_NAND_DISKONCHIP_BBTWRITE
 	  load time (assuming you build diskonchip as a module) with the module
 	  parameter "inftl_bbt_write=1".
 
+config MTD_NAND_DOCG4
+	tristate "Support for DiskOnChip G4 (EXPERIMENTAL)"
+	depends on EXPERIMENTAL
+	select BCH
+	select BITREVERSE
+	help
+	  Support for diskonchip G4 nand flash, found in several smartphones,
+	  such as the Palm Treo680 and HTC Prophet.
+
+	  There is currently no support for the saftl filesystem; however a
+	  ubifs has been succesfully tested on the device.
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
index 0000000..9f733b2
--- /dev/null
+++ b/drivers/mtd/nand/docg4.c
@@ -0,0 +1,1220 @@
+/*
+ * drivers/mtd/nand/docg4.c
+ *
+ *  Copyright (C) 2011 Mike Dunn <mikedunn@newsguy.com>
+ *
+ * mtd nand driver for M-Systems DiskOnChip G4 device
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
+ *  Read factory bad block table (on page 4) during initialization and update
+ *  the memory bbt accordingly.
+ *
+ *  Implement power mgmt fns (suspend and resume)
+ *
+ *  Support cmd-line partitions?
+ *
+ *  Support raw reads / writes?
+ *
+ *  Hamming ecc when reading oob only
+ *
+ *  Support for multiple cascaded devices ("floors") ?
+ *
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
+#include <linux/bitrev.h>
+
+static int ignore_badblocks;
+module_param(ignore_badblocks, int, 0);
+MODULE_PARM_DESC(ignore_badblocks, "no badblock checking performed");
+
+struct docg4_priv {
+	struct mtd_info	*mtd;
+	struct device *dev;
+	void __iomem *virtadr;
+	int status;
+	struct {
+		unsigned int command;
+		int column;
+		int page;
+	} last_command;
+	uint8_t oob_buf[16];
+	uint8_t ecc_buf[7];
+	int oob_page;
+	struct bch_control *bch;
+};
+
+/*
+ * Defines prefixed with DOCG4 are unique to the diskonchip G4.
+ * All others are shared with other diskonchip devices (e.g., P3, G3).
+ *
+ * Functions with names prefixed with docg4_ are mtd / nand interface functions
+ * (though they may also be called internally).  All others are internal.
+ */
+
+#define DOC_IOSPACE_DATA		0x0800
+
+/* register offsets */
+#define DOC_CHIPID			0x1000
+#define DOC_DEVICESELECT		0x100a
+#define DOC_ASICMODE			0x100c
+#define DOC_DATAEND			0x101e
+#define DOC_NOP				0x103e
+
+#define DOC_FLASHSEQUENCE		0x1032
+#define DOC_FLASHCOMMAND		0x1034
+#define DOC_FLASHADDRESS		0x1036
+#define DOC_FLASHCONTROL		0x1038
+#define DOC_ECCCONF0			0x1040
+#define DOC_ECCCONF1			0x1042
+#define DOC_HAMMINGPARITY		0x1046
+#define DOC_BCH_SYNDROM(idx)		(0x1048 + idx)
+
+#define DOC_ASICMODECONFIRM		0x1072
+#define DOC_CHIPID_INV			0x1074
+
+#define DOCG4_MYSTERY_REG		0x1050
+#define DOCG4_MYSTERY_REG_2		0x1052
+
+/* DOC_FLASHSEQUENCE register commands */
+#define DOC_SEQ_RESET			0x00
+#define DOC_SEQ_PAGE_SIZE_532		0x03
+#define DOCG4_SEQ_FLUSH			0x29
+#define DOCG4_SEQ_PAGEWRITE		0x16
+#define DOCG4_SEQ_PAGEPROG		0x1e
+#define DOCG4_SEQ_BLOCKERASE		0x24
+
+/* DOC_FLASHCOMMAND register commands */
+#define DOC_CMD_READ_PLANE1		0x00
+#define DOC_CMD_ERASECYCLE2		0xd0
+#define DOC_CMD_READ_STATUS		0x70
+#define DOC_CMD_READ_ALL_PLANES		0x30
+#define DOC_CMD_PROG_BLOCK_ADDR		0x60
+#define DOC_CMD_PROG_CYCLE1		0x80
+#define DOC_CMD_PROG_CYCLE2		0x10
+#define DOC_CMD_RESET			0xff
+
+/* DOC_FLASHCONTROL register bits */
+#define DOC_CTRL_CE			0x10
+#define DOC_CTRL_UNKNOWN		0x40
+#define DOC_CTRL_FLASHREADY		0x01
+
+/* DOC_ECCCONF0 register bits */
+#define DOC_ECCCONF0_READ_MODE		0x8000
+#define DOC_ECCCONF0_AUTO_ECC_ENABLE	0x4000
+#define DOC_ECCCONF0_HAMMING_ENABLE	0x1000
+#define DOC_ECCCONF0_UNKNOWN		0x2000
+#define DOC_ECCCONF0_DATA_BYTES_MASK	0x07ff
+
+/* DOC_ECCCONF1 register bits */
+#define DOC_ECCCONF1_BCH_SYNDROM_ERR	0x80
+#define DOC_ECCCONF1_ECC_ENABLE         0x07
+
+/* DOC_ASICMODE register bits */
+#define DOCG4_RESET            0x04 /* TODO: these two should apply... */
+#define DOCG4_NORMAL           0x05 /* ...to the G3 as well */
+
+/* good status values read after read/write/erase operations */
+#define DOCG4_PROGSTATUS_GOOD          0x51
+#define DOCG4_PROGSTATUS_GOOD_2        0xe0
+
+/*
+ * On read operations (page and oob-only), the first byte read from I/O reg is a
+ * status.  On error, it reads 0x73; otherwise, it reads either 0x71 (first read
+ * after reset only) or 0x51, so bit 1 is presumed to be an error indicator.
+ */
+#define DOCG4_READ_ERROR           0x02 /* bit 1 indicates read error */
+
+/* anatomy of the device */
+#define DOCG4_CHIP_SIZE        0x8000000
+#define DOCG4_PAGE_SIZE        0x200
+#define DOCG4_PAGES_PER_BLOCK  0x200
+#define DOCG4_BLOCK_SIZE       (DOCG4_PAGES_PER_BLOCK * DOCG4_PAGE_SIZE)
+#define DOCG4_NUMBLOCKS        (DOCG4_CHIP_SIZE / DOCG4_BLOCK_SIZE)
+#define DOCG4_OOB_SIZE         0x10
+#define DOCG4_CHIP_SHIFT       27    /* log_2(DOCG4_CHIP_SIZE) */
+#define DOCG4_PAGE_SHIFT       9     /* log_2(DOCG4_PAGE_SIZE) */
+#define DOCG4_ERASE_SHIFT      18    /* log_2(DOCG4_BLOCK_SIZE) */
+
+/* all but the last byte is included in ecc calculation */
+#define DOCG4_BCH_SIZE         (DOCG4_PAGE_SIZE + DOCG4_OOB_SIZE - 1)
+
+#define DOCG4_USERDATA_LEN     520 /* 512 byte page plus 8 oob avail to user */
+
+/* expected values from the ID registers */
+#define DOCG4_IDREG1_VALUE     0x0400
+#define DOCG4_IDREG2_VALUE     0xfbff
+
+/* primitive polynomial used to build the Galois field used by hw ecc gen */
+#define DOCG4_PRIMITIVE_POLY   0x4443
+
+#define DOCG4_M                14  /* Galois field is of order 2^14 */
+#define DOCG4_T                4   /* BCH alg corrects up to 4 bit errors */
+
+
+/* value generated by the HW ecc generator upon reading blank page */
+static uint8_t blank_read_hwecc[7] = {
+	0xcf, 0x72, 0xfc, 0x1b, 0xa9, 0xc7, 0xb9 };
+
+/*
+ * Oob bytes 0 - 6 are available to the user.
+ * Byte 7 is hamming ecc for first 7 bytes.  Bytes 8 - 14 are hw-generated ecc.
+ * Byte 15 (the last) is used by the driver as a "page programmed" flag.
+ */
+static struct nand_ecclayout docg4_oobinfo = {
+	.eccbytes = 9,
+	.eccpos = {7, 8, 9, 10, 11, 12, 13, 14, 15},
+	.oobavail = 7,
+	.oobfree = { {0, 7} }
+};
+
+/* the device has a nop register used to insert precise delays */
+static inline void doc_nop(void __iomem *docptr)
+{
+	writew(0, docptr + DOC_NOP);
+}
+
+static void docg4_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
+{
+	int i;
+	struct nand_chip *nand = mtd->priv;
+	uint16_t *p = (uint16_t *) buf;
+	len >>= 1;
+
+	for (i = 0; i < len; i++)
+		p[i] = readw(nand->IO_ADDR_R);
+}
+
+static void docg4_write_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
+{
+	int i;
+	struct nand_chip *nand = mtd->priv;
+	uint16_t *p = (uint16_t *) buf;
+	len >>= 1;
+
+	for (i = 0; i < len; i++)
+		writew(p[i], nand->IO_ADDR_W);
+}
+
+static int docg4_wait(struct mtd_info *mtd, struct nand_chip *nand)
+{
+	/* polls the doc status register waiting for device ready */
+
+	uint16_t flash_status;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	unsigned long timeo = jiffies + (HZ * 10);
+
+	dev_dbg(doc->dev, "%s...\n", __func__);
+
+	/* report any previously unreported error */
+	if (doc->status) {
+		int stat = doc->status;
+		doc->status = 0;
+		return stat;
+	}
+
+	/* hardware quirk of g4 requires reading twice initially */
+	flash_status = readw(docptr + DOC_FLASHCONTROL);
+	flash_status = readw(docptr + DOC_FLASHCONTROL);
+
+	while (!(flash_status & DOC_CTRL_FLASHREADY)) {
+		if (time_after(jiffies, timeo)) {
+			dev_err(doc->dev, "docg4_wait timed out\n");
+			return NAND_STATUS_FAIL;
+		}
+		cpu_relax();
+		flash_status = readb(docptr + DOC_FLASHCONTROL);
+	}
+
+	return NAND_STATUS_READY;
+}
+
+static void docg4_select_chip(struct mtd_info *mtd, int chip)
+{
+	/*
+	 * Select among multiple cascaded chips ("floors").  Multiple floors are
+	 * not yet supported, so the only valid positive value is 0.
+	 */
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+
+	dev_dbg(doc->dev, "%s: chip %d\n", __func__, chip);
+
+	if (chip < 0)
+		return;		/* deselected */
+
+	if (chip > 0)
+		dev_warn(doc->dev, "multiple floors currently unsupported\n");
+
+	writew(0, docptr + DOC_DEVICESELECT);
+}
+
+static void reset(struct mtd_info *mtd, struct nand_chip *nand)
+{
+	/* full device reset */
+
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+
+	writew(DOCG4_RESET, docptr + DOC_ASICMODE);
+	writew(~DOCG4_RESET, docptr + DOC_ASICMODECONFIRM);
+	doc_nop(docptr);
+	writew(DOCG4_NORMAL, docptr + DOC_ASICMODE);
+	writew(~DOCG4_NORMAL, docptr + DOC_ASICMODECONFIRM);
+
+	writew(DOC_ECCCONF1_ECC_ENABLE, docptr + DOC_ECCCONF1);
+
+	docg4_wait(mtd, nand);
+}
+
+static void read_hw_ecc(void __iomem *docptr, uint8_t *ecc_buf)
+{
+	/* read the 7 hw-generated ecc bytes */
+
+	int i;
+	for (i = 0; i < 7; i++) { /* hw quirk; read twice */
+		ecc_buf[i] = readb(docptr + DOC_BCH_SYNDROM(i));
+		ecc_buf[i] = readb(docptr + DOC_BCH_SYNDROM(i));
+	}
+}
+
+static int correct_data(struct mtd_info *mtd, uint8_t *buf, int page)
+{
+	/*
+	 * Called after a page read to check for bit errors, and correct them if
+	 * so.  Up to four bits can be corrected.
+	 */
+
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	uint16_t edc_err;
+	int i, numerrs, errpos[4];
+
+	/* read the register that tells us if a read error was detected  */
+	edc_err = readw(docptr + DOC_ECCCONF1);
+	edc_err = readw(docptr + DOC_ECCCONF1);   /* hw quirk: read twice */
+
+	dev_dbg(doc->dev, "%s: edc_err = 0x%02x\n", __func__, edc_err);
+
+	if (!(edc_err & DOC_ECCCONF1_BCH_SYNDROM_ERR))
+		return 0;     /* no error bits */
+
+	/* data contains error(s); read the 7 hw-generated ecc bytes */
+	read_hw_ecc(docptr, doc->ecc_buf);
+
+	/* check if ecc bytes are those of a blank page */
+	if (!memcmp(doc->ecc_buf, blank_read_hwecc, 7))
+		return 0;	/* blank page; ecc error normal */
+
+	/*
+	 * If the hw ecc bytes are not those of a blank page, there's still a
+	 * chance that the page is blank, but was read with errors.  Check the
+	 * programmed flag in last oob byte, which is set to zero when a page is
+	 * programmed.  If more than half the bits are set, assume a blank
+	 * page.  Unfortunately, the read error(s) are not reported in stats.
+	 */
+	if (doc->oob_buf[15]) {
+		int bit, numsetbits = 0;
+		unsigned long programmed_flag = doc->oob_buf[15];
+		for_each_set_bit(bit, &programmed_flag, 8)
+			numsetbits++;
+		if (numsetbits > 4) { /* assume blank page */
+			dev_warn(doc->dev,
+				 "error(s) in blank page at offset %08x\n",
+				 page * DOCG4_PAGE_SIZE);
+			memset(buf, 0xff, DOCG4_PAGE_SIZE);
+			memset(doc->oob_buf, 0xff, DOCG4_OOB_SIZE);
+			return 0;
+		}
+	}
+
+	/*
+	 * The hardware ecc unit produces oob_ecc ^ calc_ecc.  The kernel's bch
+	 * algorithm is used to decode this.  However the hw operates on page
+	 * data in a bit order that is the reverse of that of the bch alg,
+	 * requiring that the bits be reversed on the result.  Thanks to Ivan
+	 * Djelic for his analysis!
+	 */
+	for (i = 0; i < 7; i++)
+		doc->ecc_buf[i] = bitrev8(doc->ecc_buf[i]);
+
+	numerrs = decode_bch(doc->bch, NULL, DOCG4_USERDATA_LEN, NULL,
+			     doc->ecc_buf, NULL, errpos);
+
+	if (numerrs == -EBADMSG) {
+		dev_warn(doc->dev, "uncorrectable errors at offset %08x\n",
+			 page * DOCG4_PAGE_SIZE);
+		return -1;
+	}
+
+	BUG_ON(numerrs < 0);	/* -EINVAL, or anything other than -EBADMSG */
+
+	/* undo last step in BCH alg (modulo mirroring not needed) */
+	for (i = 0; i < numerrs; i++)
+		errpos[i] = (errpos[i] & ~7)|(7-(errpos[i] & 7));
+
+	/* fix the errors */
+	for (i = 0; i < numerrs; i++) {
+
+		/* ignore if error within oob ecc bytes */
+		if (errpos[i] > DOCG4_USERDATA_LEN * 8)
+			continue;
+
+		/* if error within oob area preceeding ecc bytes */
+		if (errpos[i] > DOCG4_PAGE_SIZE * 8)
+			change_bit(errpos[i] - DOCG4_PAGE_SIZE * 8,
+				   (unsigned long *)doc->oob_buf);
+
+		else    /* error in page data */
+			change_bit(errpos[i], (unsigned long *)buf);
+	}
+
+	dev_notice(doc->dev, "%d error(s) corrected at offset %08x\n",
+		   numerrs, page * DOCG4_PAGE_SIZE);
+
+	return numerrs;
+}
+
+static uint8_t docg4_read_byte(struct mtd_info *mtd)
+{
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+
+	dev_dbg(doc->dev, "%s\n", __func__);
+
+	if (doc->last_command.command == NAND_CMD_STATUS) {
+		int status;
+
+		/*
+		 * Previous nand command was status request, so nand
+		 * infrastructure code expects to read the status here.  If an
+		 * error occurred in a previous operation, report it.
+		 */
+		doc->last_command.command = 0;
+
+		if (doc->status) {
+			status = doc->status;
+			doc->status = 0;
+		}
+
+		/* why is NAND_STATUS_WP inverse logic?? */
+		else
+			status = NAND_STATUS_WP | NAND_STATUS_READY;
+
+		return status;
+	}
+
+	dev_warn(doc->dev, "unexpectd call to read_byte()\n");
+
+	return 0;
+}
+
+static void write_addr(struct docg4_priv *doc, uint32_t docg4_addr)
+{
+	/* write the four address bytes packed in docg4_addr to the device */
+
+	void __iomem *docptr = doc->virtadr;
+	writeb(docg4_addr & 0xff, docptr + DOC_FLASHADDRESS);
+	docg4_addr >>= 8;
+	writeb(docg4_addr & 0xff, docptr + DOC_FLASHADDRESS);
+	docg4_addr >>= 8;
+	writeb(docg4_addr & 0xff, docptr + DOC_FLASHADDRESS);
+	docg4_addr >>= 8;
+	writeb(docg4_addr & 0xff, docptr + DOC_FLASHADDRESS);
+}
+
+static int read_progstatus(struct docg4_priv *doc)
+{
+	/*
+	 * This apparently checks the status of programming.
+	 * Called after an erasure, and after page data is written.
+	 */
+	void __iomem *docptr = doc->virtadr;
+
+	/* status is read from the I/O reg */
+	uint16_t status1 = readw(docptr + DOC_IOSPACE_DATA);
+	uint16_t status2 = readw(docptr + DOC_IOSPACE_DATA);
+	uint16_t status3 = readw(docptr + DOCG4_MYSTERY_REG);
+
+	dev_dbg(doc->dev, "docg4: %s: %02x %02x %02x\n",
+	      __func__, status1, status2, status3);
+
+	if (status1 != DOCG4_PROGSTATUS_GOOD
+	    || status2 != DOCG4_PROGSTATUS_GOOD_2
+	    || status3 != DOCG4_PROGSTATUS_GOOD_2) {
+		doc->status = NAND_STATUS_FAIL;
+		dev_warn(doc->dev, "read_progstatus failed: "
+			 "%02x, %02x, %02x\n", status1, status2, status3);
+		return -EIO;
+	}
+	return 0;
+}
+
+static int pageprog(struct mtd_info *mtd)
+{
+	/*
+	 * Final step in writing a page.  Writes the contents of its
+	 * internal buffer out the flash array, or some such.
+	 */
+
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	int retval = 0;
+
+	dev_dbg(doc->dev, "docg4: %s\n", __func__);
+
+	writew(DOCG4_SEQ_PAGEPROG, docptr + DOC_FLASHSEQUENCE);
+	writew(DOC_CMD_PROG_CYCLE2, docptr + DOC_FLASHCOMMAND);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	docg4_wait(mtd, nand);
+	writew(DOCG4_SEQ_FLUSH, docptr + DOC_FLASHSEQUENCE);
+	writew(DOC_CMD_READ_STATUS, docptr + DOC_FLASHCOMMAND);
+	writew(DOC_ECCCONF0_READ_MODE | 4, docptr + DOC_ECCCONF0);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	retval = read_progstatus(doc); /* read status from device */
+	writew(0, docptr + DOC_DATAEND);
+	doc_nop(docptr);
+	docg4_wait(mtd, nand);
+	doc_nop(docptr);
+
+	return retval;
+}
+
+static void sequence_reset(struct mtd_info *mtd)
+{
+	/* common starting sequence for all operations */
+
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+
+	writew(DOC_CTRL_UNKNOWN | DOC_CTRL_CE, docptr + DOC_FLASHCONTROL);
+	writew(DOC_SEQ_RESET, docptr + DOC_FLASHSEQUENCE);
+	writew(DOC_CMD_RESET, docptr + DOC_FLASHCOMMAND);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	docg4_wait(mtd, nand);
+	doc_nop(docptr);
+}
+
+static void read_page_prologue(struct mtd_info *mtd, uint32_t docg4_addr)
+{
+	/* first step in reading a page */
+
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+
+	dev_dbg(doc->dev,
+	      "docg4: %s: g4 page %08x\n", __func__, docg4_addr);
+
+	sequence_reset(mtd);
+
+	writew(DOC_SEQ_PAGE_SIZE_532, docptr + DOC_FLASHSEQUENCE);
+	writew(DOC_CMD_READ_PLANE1, docptr + DOC_FLASHCOMMAND);
+	doc_nop(docptr);
+
+	write_addr(doc, docg4_addr);
+
+	doc_nop(docptr);
+	writew(DOC_CMD_READ_ALL_PLANES, docptr + DOC_FLASHCOMMAND);
+	doc_nop(docptr);
+	doc_nop(docptr);
+
+	docg4_wait(mtd, nand);
+}
+
+static void write_page_prologue(struct mtd_info *mtd, uint32_t docg4_addr)
+{
+	/* first step in writing a page */
+
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+
+	dev_dbg(doc->dev,
+	      "docg4: %s: g4 addr: %x\n", __func__, docg4_addr);
+	sequence_reset(mtd);
+	writew(DOCG4_SEQ_PAGEWRITE, docptr + DOC_FLASHSEQUENCE);
+	writew(DOC_CMD_PROG_CYCLE1, docptr + DOC_FLASHCOMMAND);
+	doc_nop(docptr);
+	write_addr(doc, docg4_addr);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	docg4_wait(mtd, nand);
+}
+
+static uint32_t mtd_to_docg4_address(int page, int column)
+{
+	/*
+	 * Convert mtd address to format used by the device, 32 bit packed.
+	 *
+	 * Some notes on G4 addressing... The M-Sys documentation on this device
+	 * claims that pages are 2K in length, and indeed, the format of the
+	 * address used by the device reflects that.  But within each page are
+	 * four 512 byte "sub-pages", each with its own oob data that is
+	 * read/written immediately after the 512 bytes of page data.  This oob
+	 * data contains the ecc bytes for the preceeding 512 bytes.
+	 *
+	 * Rather than tell the mtd nand infrastructure that page size is 2k,
+	 * with four sub-pages each, we engage in a little subterfuge and tell
+	 * the infrastructure code that pages are 512 bytes in size.  This is
+	 * done because during the course of reverse-engineering the device, I
+	 * never observed an instance where an entire 2K "page" was read or
+	 * written as a unit.  Each "sub-page" is always addressed individually,
+	 * its data read/written, and ecc handled before the next "sub-page" is
+	 * addressed.  Also, MLC nand devices are reported to not have
+	 * sub-pages, so they're probably not sub-pages in the mtd sense.
+	 *
+	 * This requires us to convert addresses passed by the mtd nand
+	 * infrastructure code to those used by the device.
+	 *
+	 * The address that is written to the device consists of four bytes: the
+	 * first two are the 2k page number, and the second is the index into
+	 * the page.  The index is in terms of 16-bit half-words and includes
+	 * the preceeding oob data, so e.g., the index into the second
+	 * "sub-page" is 0x108, and the full device address of the start of mtd
+	 * page 0x201 is 0x00800108.  Note that the only valid index values are
+	 * those for the start of a 512-byte page, or the start of the oob for
+	 * one of those pages (oob-only reads).
+	 */
+	int g4_page = page / 4;	                      /* device's 2K page */
+	int g4_index = (page % 4) * 0x108 + column/2; /* offset into page */
+	return (g4_page << 16) | g4_index;
+}
+
+static void docg4_command(struct mtd_info *mtd, unsigned command, int column,
+			  int page_addr)
+{
+	/* handle standard nand commands */
+
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	uint32_t g4_addr = mtd_to_docg4_address(page_addr, column);
+
+	dev_dbg(doc->dev, "%s %x, page_addr=%x, column=%x\n",
+	      __func__, command, page_addr, column);
+
+	/*
+	 * Save the command and its arguments.  This enables emulation of
+	 * standard flash devices, and also some optimizations.
+	 */
+	doc->last_command.command = command;
+	doc->last_command.column = column;
+	doc->last_command.page = page_addr;
+
+	switch (command) {
+
+	case NAND_CMD_RESET:
+		reset(mtd, nand);
+		break;
+
+	case NAND_CMD_READ0:
+		read_page_prologue(mtd, g4_addr);
+		break;
+
+	case NAND_CMD_STATUS:
+		/* next call to read_byte() will expect a status */
+		break;
+
+	case NAND_CMD_SEQIN:
+		write_page_prologue(mtd, g4_addr);
+
+		/* hack for deferred write of oob bytes */
+		if (doc->oob_page == page_addr)
+			memcpy(nand->oob_poi, doc->oob_buf, 16);
+		break;
+
+	case NAND_CMD_PAGEPROG:
+		pageprog(mtd);
+		break;
+
+	/* we don't expect these, based on review of nand_base.c */
+	case NAND_CMD_READOOB:
+	case NAND_CMD_READID:
+	case NAND_CMD_ERASE1:
+	case NAND_CMD_ERASE2:
+		dev_warn(doc->dev, "docg4_command: "
+			 "unexpected command 0x%x\n", command);
+		break;
+
+	}
+}
+
+static int docg4_read_page_raw(struct mtd_info *mtd, struct nand_chip *nand,
+			       uint8_t *buf, int page)
+{
+	/* TODO: support raw read? */
+	return -ENOTSUPP;
+}
+
+static int docg4_read_page(struct mtd_info *mtd, struct nand_chip *nand,
+			   uint8_t *buf, int page)
+{
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	uint16_t status, *buf16;
+	int bits_corrected;
+
+	dev_dbg(doc->dev, "%s: page %08x\n", __func__, page);
+
+	writew(DOC_ECCCONF0_READ_MODE |
+	       DOC_ECCCONF0_HAMMING_ENABLE |
+	       DOC_ECCCONF0_UNKNOWN |
+	       DOCG4_BCH_SIZE,
+	       docptr + DOC_ECCCONF0);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	doc_nop(docptr);
+
+	/* the 1st byte from the I/O reg is a status; the rest is page data */
+	status = readw(docptr + DOC_IOSPACE_DATA);
+	if (status & DOCG4_READ_ERROR) {
+		dev_err(doc->dev,
+			"docg4_read_page: bad status: 0x%02x\n", status);
+		doc->status = NAND_STATUS_FAIL;
+		return -EIO;
+	}
+
+	dev_dbg(doc->dev, "%s: status = 0x%x\n", __func__, status);
+
+	docg4_read_buf(mtd, buf, DOCG4_PAGE_SIZE); /* read the page data */
+
+	/*
+	 * Diskonchips read oob immediately after a page read.  Mtd
+	 * infrastructure issues a separate command for reading oob after the
+	 * page is read.  So we save the oob bytes in a local buffer and just
+	 * copy it when the command for reading oob arrives.
+	 */
+
+	/* first 14 oob bytes read from I/O reg */
+	docg4_read_buf(mtd, doc->oob_buf, 14);
+
+	/* last 2 read from another reg */
+	buf16 = (uint16_t *)(doc->oob_buf + 14);
+	*buf16 = readw(docptr + DOCG4_MYSTERY_REG);
+
+	doc_nop(docptr);
+
+	bits_corrected = correct_data(mtd, buf, page);
+	if (bits_corrected < 0)
+		mtd->ecc_stats.failed++;
+	else
+		mtd->ecc_stats.corrected += bits_corrected;
+
+	writew(0, docptr + DOC_DATAEND);
+
+	return 0;
+}
+
+static int docg4_read_oob(struct mtd_info *mtd, struct nand_chip *nand,
+			  int page, int sndcmd)
+{
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	uint16_t status;
+
+	dev_dbg(doc->dev, "%s: page %x\n", __func__, page);
+
+	/*
+	 * Oob bytes are read as part of a normal page read.  If the last nand
+	 * command was a read of the page whose oob is now being read, just copy
+	 * the oob bytes that we saved in a local buffer and avoid a separate
+	 * oob read.
+	 */
+	if (doc->last_command.command == NAND_CMD_READ0 &&
+	    doc->last_command.page == page) {
+		memcpy(nand->oob_poi, doc->oob_buf, 16);
+		return 0;
+	}
+
+	/*
+	 * Separate read of oob data only.
+	 */
+	docg4_command(mtd, NAND_CMD_READ0, nand->ecc.size, page);
+
+	writew(DOC_ECCCONF0_READ_MODE | DOCG4_OOB_SIZE, docptr + DOC_ECCCONF0);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	doc_nop(docptr);
+
+	/* the 1st byte from the I/O reg is a status; the rest is oob data */
+	status = readw(docptr + DOC_IOSPACE_DATA);
+	if (status & DOCG4_READ_ERROR) {
+		doc->status = NAND_STATUS_FAIL;
+		dev_warn(doc->dev,
+			 "docg4_read_oob failed: status = 0x%02x\n", status);
+		return -EIO;
+	}
+
+	dev_dbg(doc->dev, "%s: status = 0x%x\n", __func__, status);
+
+	docg4_read_buf(mtd, nand->oob_poi, 16);
+
+	doc_nop(docptr);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	writew(0, docptr + DOC_DATAEND);
+	doc_nop(docptr);
+
+	return 0;
+}
+
+static void docg4_erase_block(struct mtd_info *mtd, int page)
+{
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	uint16_t g4_page;
+
+	dev_dbg(doc->dev, "%s: page %04x\n", __func__, page);
+
+	sequence_reset(mtd);
+
+	writew(DOCG4_SEQ_BLOCKERASE, docptr + DOC_FLASHSEQUENCE);
+	writew(DOC_CMD_PROG_BLOCK_ADDR, docptr + DOC_FLASHCOMMAND);
+	doc_nop(docptr);
+
+	/* only 2 bytes of address are written to specify erase block */
+	g4_page = (uint16_t)(page / 4);  /* to g4's 2k page addressing */
+	writeb(g4_page & 0xff, docptr + DOC_FLASHADDRESS);
+	g4_page >>= 8;
+	writeb(g4_page & 0xff, docptr + DOC_FLASHADDRESS);
+	doc_nop(docptr);
+
+	/* start the erasure */
+	writew(DOC_CMD_ERASECYCLE2, docptr + DOC_FLASHCOMMAND);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	docg4_wait(mtd, nand);	/* long wait for erasure */
+
+	writew(DOCG4_SEQ_FLUSH, docptr + DOC_FLASHSEQUENCE);
+	writew(DOC_CMD_READ_STATUS, docptr + DOC_FLASHCOMMAND);
+	writew(DOC_ECCCONF0_READ_MODE | 4, docptr + DOC_ECCCONF0);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	doc_nop(docptr);
+	doc_nop(docptr);
+
+	read_progstatus(doc);
+
+	writew(0, docptr + DOC_DATAEND);
+	doc_nop(docptr);
+	docg4_wait(mtd, nand);
+	doc_nop(docptr);
+}
+
+static void docg4_write_page_raw(struct mtd_info *mtd, struct nand_chip *nand,
+				 const uint8_t *buf)
+{
+	/* TODO: support raw write? */
+}
+
+static void docg4_write_page(struct mtd_info *mtd, struct nand_chip *nand,
+			     const uint8_t *buf)
+{
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	uint8_t hamming;
+	uint8_t ecc_buf[8];
+
+	dev_dbg(doc->dev, "%s...\n", __func__);
+
+	writew(DOC_ECCCONF0_HAMMING_ENABLE |
+	       DOC_ECCCONF0_UNKNOWN |
+	       DOCG4_BCH_SIZE,
+	       docptr + DOC_ECCCONF0);
+	doc_nop(docptr);
+
+	/* write the page data */
+	docg4_write_buf16(mtd, buf, DOCG4_PAGE_SIZE);
+
+	/* oob bytes 0 through 5 are written to I/O reg */
+	docg4_write_buf16(mtd, nand->oob_poi, 6);
+
+	/* oob byte 6 written to a separate reg */
+	writew(nand->oob_poi[6], docptr + DOCG4_MYSTERY_REG_2);
+
+	doc_nop(docptr);
+	doc_nop(docptr);
+
+	/* oob byte 7 is hamming code */
+	hamming = readb(docptr + DOC_HAMMINGPARITY);
+	hamming = readb(docptr + DOC_HAMMINGPARITY); /* gotta read twice */
+	writew(hamming, docptr + DOCG4_MYSTERY_REG_2);
+	doc_nop(docptr);
+
+	/* read the 7 bytes from ecc regs and write to next oob area */
+	read_hw_ecc(docptr, ecc_buf);
+	ecc_buf[7] = 0;         /* clear the "page programmed" byte */
+	docg4_write_buf16(mtd, ecc_buf, 8);
+
+	doc_nop(docptr);
+	doc_nop(docptr);
+	writew(0, docptr + DOC_DATAEND);
+	doc_nop(docptr);
+}
+
+static int docg4_write_oob(struct mtd_info *mtd, struct nand_chip *nand,
+			   int page)
+{
+	/*
+	 * This is not really supported, because MLC nand must write oob bytes
+	 * at the same time as page data.  Nonetheless, we save the oob buffer
+	 * contents here, and then write it along with the page data if the same
+	 * page is subsequently written.  This allows user space utilities that
+	 * write the oob data prior to the page data to work (e.g., nandwrite).
+	 * The disdvantage is that, if the intention was to write oob only, the
+	 * operation is quietly ignored.  As the nand infrastructure code is
+	 * currently written, this scenario has been carefully avoided.
+	 */
+
+	/* note that bytes 7..14 are hw generated hamming/ecc and overwritten */
+	struct docg4_priv *doc = nand->priv;
+	doc->oob_page = page;
+	memcpy(doc->oob_buf, nand->oob_poi, 16);
+	return 0;
+}
+
+static int __init read_factory_bbt(struct mtd_info *mtd)
+{
+	/*
+	 * The device contains a factory bad block table on page 4, but the
+	 * table is not updated by this driver.  Instead, this function is
+	 * called during initialization to read it and update the memory-based
+	 * bbt accordingly.
+	 */
+
+	/* TODO: figure out how to interpret the table; mine is all ff's */
+	return 0;
+}
+
+static int docg4_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+	/*
+	 * Bad blocks are marked in the oob area of the first page of the block.
+	 * The default scan_bbt() in the nand infrastructure code works fine for
+	 * building the memory-based bbt during initialization.  Likewise, the
+	 * nand infrastructure function that checks if a block is bad works when
+	 * a memory-based bbt is used.  This function for marking a block as bad
+	 * must replace the nand default because this device does not support
+	 * writing only to the oob area (whole page must be written along with
+	 * oob).
+	 */
+	int ret, i;
+	uint8_t *buf;
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+	struct nand_bbt_descr *bbtd = nand->badblock_pattern;
+	int block = (int)(ofs >> nand->bbt_erase_shift);
+	int page = (int)(ofs >> nand->page_shift);
+	uint32_t g4_addr = mtd_to_docg4_address(page, 0);
+
+	dev_dbg(doc->dev, "%s: %08llx\n", __func__, ofs);
+
+	buf = kzalloc(DOCG4_PAGE_SIZE, GFP_KERNEL);
+	if (buf == NULL)
+		return -ENOMEM;
+
+	/* update bbt in memory */
+	nand->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);
+
+	/* write bit-wise negation of pattern to oob buffer */
+	memset(nand->oob_poi, 0xff, mtd->oobsize);
+	for (i = 0; i < bbtd->len; i++)
+		nand->oob_poi[bbtd->offs + i] = ~bbtd->pattern[i];
+
+	/* write first page of block */
+	write_page_prologue(mtd, g4_addr);
+	docg4_write_page(mtd, nand, buf);
+	ret = pageprog(mtd);
+	if (!ret)
+		mtd->ecc_stats.badblocks++;
+
+	kfree(buf);
+
+	return ret;
+}
+
+static int docg4_block_neverbad(struct mtd_info *mtd, loff_t ofs, int getchip)
+{
+	/* only called when ignore_badblocks option is set */
+	return 0;
+}
+
+static void __init init_mtd_structs(struct mtd_info *mtd)
+{
+	/* initialize mtd and nand data structures */
+
+	/*
+	 * Note that some of the following initializations are not usually
+	 * required within a nand driver because they are performed by the nand
+	 * infrastructure code as part of nand_scan().  In this case they need
+	 * to be initialized here because we skip call to nand_scan_ident() (the
+	 * first half of nand_scan()).  The call to nand_scan_ident() is skipped
+	 * because for this device the chip id is not read in the manner of a
+	 * standard nand device.  Unfortunately, nand_scan_ident() does other
+	 * things as well, such as call nand_set_defaults().
+	 */
+
+	struct nand_chip *nand = mtd->priv;
+	struct docg4_priv *doc = nand->priv;
+
+	mtd->size = DOCG4_CHIP_SIZE;
+	mtd->name = "Msys Diskonchip G4";
+	mtd->writesize = DOCG4_PAGE_SIZE;
+	mtd->erasesize = DOCG4_BLOCK_SIZE;
+	mtd->oobsize = DOCG4_OOB_SIZE;
+	nand->chipsize = DOCG4_CHIP_SIZE;
+	nand->chip_shift = DOCG4_CHIP_SHIFT;
+	nand->bbt_erase_shift = nand->phys_erase_shift = DOCG4_ERASE_SHIFT;
+	nand->chip_delay = 20;
+	nand->page_shift = DOCG4_PAGE_SHIFT;
+	nand->pagemask = 0x3ffff;
+	nand->badblockpos = NAND_LARGE_BADBLOCK_POS;
+	nand->badblockbits = 8;
+	nand->ecc.layout = &docg4_oobinfo;
+	nand->ecc.mode = NAND_ECC_HW_SYNDROME;
+	nand->ecc.size = DOCG4_PAGE_SIZE;
+	nand->ecc.prepad = 8;
+	nand->ecc.bytes	= 8;
+	nand->options =
+		NAND_BUSWIDTH_16 | NAND_NO_SUBPAGE_WRITE | NAND_NO_AUTOINCR;
+	nand->IO_ADDR_R = nand->IO_ADDR_W = doc->virtadr + DOC_IOSPACE_DATA;
+	nand->controller = &nand->hwcontrol;
+	spin_lock_init(&nand->controller->lock);
+	init_waitqueue_head(&nand->controller->wq);
+
+	/* methods */
+	nand->cmdfunc = docg4_command;
+	nand->waitfunc = docg4_wait;
+	nand->select_chip = docg4_select_chip;
+	nand->read_byte = docg4_read_byte;
+	nand->block_markbad = docg4_block_markbad;
+	nand->read_buf = docg4_read_buf;
+	nand->write_buf = docg4_write_buf16;
+	nand->scan_bbt = nand_default_bbt;
+	nand->erase_cmd = docg4_erase_block;
+	nand->ecc.read_page = docg4_read_page;
+	nand->ecc.write_page = docg4_write_page;
+	nand->ecc.read_page_raw = docg4_read_page_raw;
+	nand->ecc.write_page_raw = docg4_write_page_raw;
+	nand->ecc.read_oob = docg4_read_oob;
+	nand->ecc.write_oob = docg4_write_oob;
+
+	/*
+	 * The way the nand infrastructure code is written, a memory-based bbt
+	 * is not created if NAND_SKIP_BBTSCAN is set.  With no memory bbt,
+	 * nand->block_bad() is called.  So when ignoring bad blocks, we skip
+	 * the scan and define a dummy block_bad() which always returns 0.
+	 */
+	if (ignore_badblocks) {
+		nand->options |= NAND_SKIP_BBTSCAN;
+		nand->block_bad	= docg4_block_neverbad;
+	}
+
+}
+
+static int __init read_id_reg(struct mtd_info *mtd, struct nand_chip *nand)
+{
+	struct docg4_priv *doc = nand->priv;
+	void __iomem *docptr = doc->virtadr;
+	uint16_t id1, id2;
+
+	/* check for presence of g4 chip by reading id registers */
+	id1 = readw(docptr + DOC_CHIPID);
+	id1 = readw(docptr + DOCG4_MYSTERY_REG);
+	id2 = readw(docptr + DOC_CHIPID_INV);
+	id2 = readw(docptr + DOCG4_MYSTERY_REG);
+
+	if (id1 == DOCG4_IDREG1_VALUE && id2 == DOCG4_IDREG2_VALUE) {
+		dev_info(doc->dev,
+			 "NAND device: 128MiB Diskonchip G4 detected\n");
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
+static int __init probe_docg4(struct platform_device *pdev)
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
+		dev_err(dev, "no io memory resource defined!\n");
+		return -ENODEV;
+	}
+
+	virtadr = ioremap(r->start, resource_size(r));
+	if (!virtadr) {
+		dev_err(dev, "Diskonchip ioremap failed: "
+			"0x%x bytes at 0x%x\n",
+			resource_size(r), r->start);
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
+	doc->dev = dev;
+
+	init_mtd_structs(mtd);
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
+	reset(mtd, nand);
+	retval = read_id_reg(mtd, nand);
+	if (retval == -ENODEV) {
+		dev_warn(dev, "No diskonchip G4 device found.\n");
+		goto fail;
+	}
+
+	retval = nand_scan_tail(mtd);
+	if (retval)
+		goto fail;
+
+	retval = read_factory_bbt(mtd);
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
+	doc->mtd = mtd;
+	return 0;
+
+ fail:
+	iounmap(virtadr);
+	if (mtd) {
+		/* re-declarations avoid compiler warning */
+		struct nand_chip *nand = mtd->priv;
+		struct docg4_priv *doc = nand->priv;
+		nand_release(mtd); /* deletes partitions and mtd devices */
+		platform_set_drvdata(pdev, NULL);
+		free_bch(doc->bch);
+		kfree(mtd);
+	}
+
+	return retval;
+}
+
+static int __exit cleanup_docg4(struct platform_device *pdev)
+{
+	struct docg4_priv *doc = platform_get_drvdata(pdev);
+	nand_release(doc->mtd);
+	iounmap(doc->virtadr);
+	platform_set_drvdata(pdev, NULL);
+	free_bch(doc->bch);
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
+	return platform_driver_probe(&docg4_driver, probe_docg4);
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
