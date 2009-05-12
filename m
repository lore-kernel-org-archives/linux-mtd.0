Message-Id: <200905122106.n4CL6DYn009450@imap1.linux-foundation.org>
Subject: [patch 01/14] mtd: Flex-OneNAND support
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 12 May 2009 13:46:57 -0700
Cc: h.rohit@samsung.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org, kyungmin.park@samsung.com,
	vishak.g@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rohit Hagargundgi <h.rohit@samsung.com>

Add support for Samsung Flex-OneNAND devices.

Flex-OneNAND combines SLC and MLC technologies into a single device. 
SLC area provides increased reliability and speed, suitable for storing
code such as bootloader, kernel and root file system.  MLC area
provides high density and is suitable for storing user data.

SLC and MLC regions can be configured through kernel parameter.

[akpm@linux-foundation.org: export flexoand_region and onenand_addr]
Signed-off-by: Rohit Hagargundgi <h.rohit@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Vishak G <vishak.g@samsung.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 Documentation/kernel-parameters.txt |   10 
 drivers/mtd/onenand/onenand_base.c  |  857 +++++++++++++++++++++++---
 drivers/mtd/onenand/onenand_bbt.c   |   14 
 drivers/mtd/onenand/onenand_sim.c   |   81 ++
 include/linux/mtd/onenand.h         |   18 
 include/linux/mtd/onenand_regs.h    |   20 
 6 files changed, 913 insertions(+), 87 deletions(-)

diff -puN Documentation/kernel-parameters.txt~mtd-flex-onenand-support Documentation/kernel-parameters.txt
--- a/Documentation/kernel-parameters.txt~mtd-flex-onenand-support
+++ a/Documentation/kernel-parameters.txt
@@ -1385,6 +1385,16 @@ and is between 256 and 4096 characters. 
 	mtdparts=	[MTD]
 			See drivers/mtd/cmdlinepart.c.
 
+	onenand.bdry=	[HW,MTD] Flex-OneNAND Boundary Configuration
+
+			Format: [die0_boundary][,die0_lock][,die1_boundary][,die1_lock]
+
+			boundary - index of last SLC block on Flex-OneNAND.
+				   The remaining blocks are configured as MLC blocks.
+			lock	 - Configure if Flex-OneNAND boundary should be locked.
+				   Once locked, the boundary cannot be changed.
+				   1 indicates lock status, 0 indicates unlock status.
+
 	mtdset=		[ARM]
 			ARM/S3C2412 JIVE boot control
 
diff -puN drivers/mtd/onenand/onenand_base.c~mtd-flex-onenand-support drivers/mtd/onenand/onenand_base.c
--- a/drivers/mtd/onenand/onenand_base.c~mtd-flex-onenand-support
+++ a/drivers/mtd/onenand/onenand_base.c
@@ -9,6 +9,10 @@
  *	auto-placement support, read-while load support, various fixes
  *	Copyright (C) Nokia Corporation, 2007
  *
+ *	Vishak G <vishak.g at samsung.com>, Rohit Hagargundgi <h.rohit at samsung.com>
+ *	Flex-OneNAND support
+ *	Copyright (C) Samsung Electronics, 2008
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
@@ -27,6 +31,30 @@
 
 #include <asm/io.h>
 
+/* Default Flex-OneNAND boundary and lock respectively */
+static int flex_bdry[MAX_DIES * 2] = { -1, 0, -1, 0 };
+
+/**
+ *  onenand_oob_128 - oob info for Flex-Onenand with 4KB page
+ *  For now, we expose only 64 out of 80 ecc bytes
+ */
+static struct nand_ecclayout onenand_oob_128 = {
+	.eccbytes	= 64,
+	.eccpos		= {
+		6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
+		22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
+		38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
+		54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
+		70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
+		86, 87, 88, 89, 90, 91, 92, 93, 94, 95,
+		102, 103, 104, 105
+		},
+	.oobfree	= {
+		{2, 4}, {18, 4}, {34, 4}, {50, 4},
+		{66, 4}, {82, 4}, {98, 4}, {114, 4}
+	}
+};
+
 /**
  * onenand_oob_64 - oob info for large (2KB) page
  */
@@ -65,6 +93,14 @@ static const unsigned char ffchars[] = {
 	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,	/* 48 */
 	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
 	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,	/* 64 */
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,	/* 80 */
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,	/* 96 */
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,	/* 112 */
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,	/* 128 */
 };
 
 /**
@@ -171,6 +207,70 @@ static int onenand_buffer_address(int da
 }
 
 /**
+ * flexonenand_block- For given address return block number
+ * @param this         - OneNAND device structure
+ * @param addr		- Address for which block number is needed
+ */
+static unsigned flexonenand_block(struct onenand_chip *this, loff_t addr)
+{
+	unsigned boundary, blk, die = 0;
+
+	if (ONENAND_IS_DDP(this) && addr >= this->diesize[0]) {
+		die = 1;
+		addr -= this->diesize[0];
+	}
+
+	boundary = this->boundary[die];
+
+	blk = addr >> (this->erase_shift - 1);
+	if (blk > boundary)
+		blk = (blk + boundary + 1) >> 1;
+
+	blk += die ? this->density_mask : 0;
+	return blk;
+}
+
+inline unsigned onenand_block(struct onenand_chip *this, loff_t addr)
+{
+	if (!FLEXONENAND(this))
+		return addr >> this->erase_shift;
+	return flexonenand_block(this, addr);
+}
+
+/**
+ * flexonenand_addr - Return address of the block
+ * @this:		OneNAND device structure
+ * @block:		Block number on Flex-OneNAND
+ *
+ * Return address of the block
+ */
+static loff_t flexonenand_addr(struct onenand_chip *this, int block)
+{
+	loff_t ofs = 0;
+	int die = 0, boundary;
+
+	if (ONENAND_IS_DDP(this) && block >= this->density_mask) {
+		block -= this->density_mask;
+		die = 1;
+		ofs = this->diesize[0];
+	}
+
+	boundary = this->boundary[die];
+	ofs += (loff_t)block << (this->erase_shift - 1);
+	if (block > (boundary + 1))
+		ofs += (loff_t)(block - boundary - 1) << (this->erase_shift - 1);
+	return ofs;
+}
+
+loff_t onenand_addr(struct onenand_chip *this, int block)
+{
+	if (!FLEXONENAND(this))
+		return (loff_t)block << this->erase_shift;
+	return flexonenand_addr(this, block);
+}
+EXPORT_SYMBOL(onenand_addr);
+
+/**
  * onenand_get_density - [DEFAULT] Get OneNAND density
  * @param dev_id	OneNAND device ID
  *
@@ -183,6 +283,22 @@ static inline int onenand_get_density(in
 }
 
 /**
+ * flexonenand_region - [Flex-OneNAND] Return erase region of addr
+ * @param mtd		MTD device structure
+ * @param addr		address whose erase region needs to be identified
+ */
+int flexonenand_region(struct mtd_info *mtd, loff_t addr)
+{
+	int i;
+
+	for (i = 0; i < mtd->numeraseregions; i++)
+		if (addr < mtd->eraseregions[i].offset)
+			break;
+	return i - 1;
+}
+EXPORT_SYMBOL(flexonenand_region);
+
+/**
  * onenand_command - [DEFAULT] Send command to OneNAND device
  * @param mtd		MTD device structure
  * @param cmd		the command to be sent
@@ -207,16 +323,28 @@ static int onenand_command(struct mtd_in
 		page = -1;
 		break;
 
+	case FLEXONENAND_CMD_PI_ACCESS:
+		/* addr contains die index */
+		block = addr * this->density_mask;
+		page = -1;
+		break;
+
 	case ONENAND_CMD_ERASE:
 	case ONENAND_CMD_BUFFERRAM:
 	case ONENAND_CMD_OTP_ACCESS:
-		block = (int) (addr >> this->erase_shift);
+		block = onenand_block(this, addr);
 		page = -1;
 		break;
 
+	case FLEXONENAND_CMD_READ_PI:
+		cmd = ONENAND_CMD_READ;
+		block = addr * this->density_mask;
+		page = 0;
+		break;
+
 	default:
-		block = (int) (addr >> this->erase_shift);
-		page = (int) (addr >> this->page_shift);
+		block = onenand_block(this, addr);
+		page = (int) (addr - onenand_addr(this, block)) >> this->page_shift;
 
 		if (ONENAND_IS_2PLANE(this)) {
 			/* Make the even block number */
@@ -236,7 +364,7 @@ static int onenand_command(struct mtd_in
 		value = onenand_bufferram_address(this, block);
 		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
 
-		if (ONENAND_IS_2PLANE(this))
+		if (ONENAND_IS_MLC(this) || ONENAND_IS_2PLANE(this))
 			/* It is always BufferRAM0 */
 			ONENAND_SET_BUFFERRAM0(this);
 		else
@@ -258,13 +386,18 @@ static int onenand_command(struct mtd_in
 
 	if (page != -1) {
 		/* Now we use page size operation */
-		int sectors = 4, count = 4;
+		int sectors = 0, count = 0;
 		int dataram;
 
 		switch (cmd) {
+		case FLEXONENAND_CMD_RECOVER_LSB:
 		case ONENAND_CMD_READ:
 		case ONENAND_CMD_READOOB:
-			dataram = ONENAND_SET_NEXT_BUFFERRAM(this);
+			if (ONENAND_IS_MLC(this))
+				/* It is always BufferRAM0 */
+				dataram = ONENAND_SET_BUFFERRAM0(this);
+			else
+				dataram = ONENAND_SET_NEXT_BUFFERRAM(this);
 			break;
 
 		default:
@@ -293,6 +426,30 @@ static int onenand_command(struct mtd_in
 }
 
 /**
+ * onenand_read_ecc - return ecc status
+ * @param this		onenand chip structure
+ */
+static inline int onenand_read_ecc(struct onenand_chip *this)
+{
+	int ecc, i, result = 0;
+
+	if (!FLEXONENAND(this))
+		return this->read_word(this->base + ONENAND_REG_ECC_STATUS);
+
+	for (i = 0; i < 4; i++) {
+		ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS + i);
+		if (likely(!ecc))
+			continue;
+		if (ecc & FLEXONENAND_UNCORRECTABLE_ERROR)
+			return ONENAND_ECC_2BIT_ALL;
+		else
+			result = ONENAND_ECC_1BIT_ALL;
+	}
+
+	return result;
+}
+
+/**
  * onenand_wait - [DEFAULT] wait until the command is done
  * @param mtd		MTD device structure
  * @param state		state to select the max. timeout value
@@ -331,14 +488,14 @@ static int onenand_wait(struct mtd_info 
 	 * power off recovery (POR) test, it should read ECC status first
 	 */
 	if (interrupt & ONENAND_INT_READ) {
-		int ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS);
+		int ecc = onenand_read_ecc(this);
 		if (ecc) {
 			if (ecc & ONENAND_ECC_2BIT_ALL) {
 				printk(KERN_ERR "onenand_wait: ECC error = 0x%04x\n", ecc);
 				mtd->ecc_stats.failed++;
 				return -EBADMSG;
 			} else if (ecc & ONENAND_ECC_1BIT_ALL) {
-				printk(KERN_INFO "onenand_wait: correctable ECC error = 0x%04x\n", ecc);
+				printk(KERN_DEBUG "onenand_wait: correctable ECC error = 0x%04x\n", ecc);
 				mtd->ecc_stats.corrected++;
 			}
 		}
@@ -656,7 +813,7 @@ static int onenand_check_bufferram(struc
 
 	if (found && ONENAND_IS_DDP(this)) {
 		/* Select DataRAM for DDP */
-		int block = (int) (addr >> this->erase_shift);
+		int block = onenand_block(this, addr);
 		int value = onenand_bufferram_address(this, block);
 		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
 	}
@@ -816,6 +973,149 @@ static int onenand_transfer_auto_oob(str
 }
 
 /**
+ * onenand_recover_lsb - [Flex-OneNAND] Recover LSB page data
+ * @param mtd		MTD device structure
+ * @param addr		address to recover
+ * @param status	return value from onenand_wait / onenand_bbt_wait
+ *
+ * MLC NAND Flash cell has paired pages - LSB page and MSB page. LSB page has
+ * lower page address and MSB page has higher page address in paired pages.
+ * If power off occurs during MSB page program, the paired LSB page data can
+ * become corrupt. LSB page recovery read is a way to read LSB page though page
+ * data are corrupted. When uncorrectable error occurs as a result of LSB page
+ * read after power up, issue LSB page recovery read.
+ */
+static int onenand_recover_lsb(struct mtd_info *mtd, loff_t addr, int status)
+{
+	struct onenand_chip *this = mtd->priv;
+	int i;
+
+	/* Recovery is only for Flex-OneNAND */
+	if (!FLEXONENAND(this))
+		return status;
+
+	/* check if we failed due to uncorrectable error */
+	if (status != -EBADMSG && status != ONENAND_BBT_READ_ECC_ERROR)
+		return status;
+
+	/* check if address lies in MLC region */
+	i = flexonenand_region(mtd, addr);
+	if (mtd->eraseregions[i].erasesize < (1 << this->erase_shift))
+		return status;
+
+	/* We are attempting to reread, so decrement stats.failed
+	 * which was incremented by onenand_wait due to read failure
+	 */
+	printk(KERN_INFO "onenand_recover_lsb: Attempting to recover from uncorrectable read\n");
+	mtd->ecc_stats.failed--;
+
+	/* Issue the LSB page recovery command */
+	this->command(mtd, FLEXONENAND_CMD_RECOVER_LSB, addr, this->writesize);
+	return this->wait(mtd, FL_READING);
+}
+
+/**
+ * onenand_mlc_read_ops_nolock - MLC OneNAND read main and/or out-of-band
+ * @param mtd		MTD device structure
+ * @param from		offset to read from
+ * @param ops:		oob operation description structure
+ *
+ * MLC OneNAND / Flex-OneNAND has 4KB page size and 4KB dataram.
+ * So, read-while-load is not present.
+ */
+static int onenand_mlc_read_ops_nolock(struct mtd_info *mtd, loff_t from,
+				struct mtd_oob_ops *ops)
+{
+	struct onenand_chip *this = mtd->priv;
+	struct mtd_ecc_stats stats;
+	size_t len = ops->len;
+	size_t ooblen = ops->ooblen;
+	u_char *buf = ops->datbuf;
+	u_char *oobbuf = ops->oobbuf;
+	int read = 0, column, thislen;
+	int oobread = 0, oobcolumn, thisooblen, oobsize;
+	int ret = 0;
+	int writesize = this->writesize;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_mlc_read_ops_nolock: from = 0x%08x, len = %i\n", (unsigned int) from, (int) len);
+
+	if (ops->mode == MTD_OOB_AUTO)
+		oobsize = this->ecclayout->oobavail;
+	else
+		oobsize = mtd->oobsize;
+
+	oobcolumn = from & (mtd->oobsize - 1);
+
+	/* Do not allow reads past end of device */
+	if (from + len > mtd->size) {
+		printk(KERN_ERR "onenand_mlc_read_ops_nolock: Attempt read beyond end of device\n");
+		ops->retlen = 0;
+		ops->oobretlen = 0;
+		return -EINVAL;
+	}
+
+	stats = mtd->ecc_stats;
+
+	while (read < len) {
+		cond_resched();
+
+		thislen = min_t(int, writesize, len - read);
+
+		column = from & (writesize - 1);
+		if (column + thislen > writesize)
+			thislen = writesize - column;
+
+		if (!onenand_check_bufferram(mtd, from)) {
+			this->command(mtd, ONENAND_CMD_READ, from, writesize);
+
+			ret = this->wait(mtd, FL_READING);
+			if (unlikely(ret))
+				ret = onenand_recover_lsb(mtd, from, ret);
+			onenand_update_bufferram(mtd, from, !ret);
+			if (ret == -EBADMSG)
+				ret = 0;
+		}
+
+		this->read_bufferram(mtd, ONENAND_DATARAM, buf, column, thislen);
+		if (oobbuf) {
+			thisooblen = oobsize - oobcolumn;
+			thisooblen = min_t(int, thisooblen, ooblen - oobread);
+
+			if (ops->mode == MTD_OOB_AUTO)
+				onenand_transfer_auto_oob(mtd, oobbuf, oobcolumn, thisooblen);
+			else
+				this->read_bufferram(mtd, ONENAND_SPARERAM, oobbuf, oobcolumn, thisooblen);
+			oobread += thisooblen;
+			oobbuf += thisooblen;
+			oobcolumn = 0;
+		}
+
+		read += thislen;
+		if (read == len)
+			break;
+
+		from += thislen;
+		buf += thislen;
+	}
+
+	/*
+	 * Return success, if no ECC failures, else -EBADMSG
+	 * fs driver will take care of that, because
+	 * retlen == desired len and result == -EBADMSG
+	 */
+	ops->retlen = read;
+	ops->oobretlen = oobread;
+
+	if (ret)
+		return ret;
+
+	if (mtd->ecc_stats.failed - stats.failed)
+		return -EBADMSG;
+
+	return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+}
+
+/**
  * onenand_read_ops_nolock - [OneNAND Interface] OneNAND read main and/or out-of-band
  * @param mtd		MTD device structure
  * @param from		offset to read from
@@ -962,7 +1262,7 @@ static int onenand_read_oob_nolock(struc
 	size_t len = ops->ooblen;
 	mtd_oob_mode_t mode = ops->mode;
 	u_char *buf = ops->oobbuf;
-	int ret = 0;
+	int ret = 0, readcmd;
 
 	from += ops->ooboffs;
 
@@ -993,17 +1293,22 @@ static int onenand_read_oob_nolock(struc
 
 	stats = mtd->ecc_stats;
 
+	readcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
+
 	while (read < len) {
 		cond_resched();
 
 		thislen = oobsize - column;
 		thislen = min_t(int, thislen, len);
 
-		this->command(mtd, ONENAND_CMD_READOOB, from, mtd->oobsize);
+		this->command(mtd, readcmd, from, mtd->oobsize);
 
 		onenand_update_bufferram(mtd, from, 0);
 
 		ret = this->wait(mtd, FL_READING);
+		if (unlikely(ret))
+			ret = onenand_recover_lsb(mtd, from, ret);
+
 		if (ret && ret != -EBADMSG) {
 			printk(KERN_ERR "onenand_read_oob_nolock: read failed = 0x%x\n", ret);
 			break;
@@ -1053,6 +1358,7 @@ static int onenand_read_oob_nolock(struc
 static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	size_t *retlen, u_char *buf)
 {
+	struct onenand_chip *this = mtd->priv;
 	struct mtd_oob_ops ops = {
 		.len	= len,
 		.ooblen	= 0,
@@ -1062,7 +1368,9 @@ static int onenand_read(struct mtd_info 
 	int ret;
 
 	onenand_get_device(mtd, FL_READING);
-	ret = onenand_read_ops_nolock(mtd, from, &ops);
+	ret = ONENAND_IS_MLC(this) ?
+		onenand_mlc_read_ops_nolock(mtd, from, &ops) :
+		onenand_read_ops_nolock(mtd, from, &ops);
 	onenand_release_device(mtd);
 
 	*retlen = ops.retlen;
@@ -1080,6 +1388,7 @@ static int onenand_read(struct mtd_info 
 static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
+	struct onenand_chip *this = mtd->priv;
 	int ret;
 
 	switch (ops->mode) {
@@ -1094,7 +1403,9 @@ static int onenand_read_oob(struct mtd_i
 
 	onenand_get_device(mtd, FL_READING);
 	if (ops->datbuf)
-		ret = onenand_read_ops_nolock(mtd, from, ops);
+		ret = ONENAND_IS_MLC(this) ?
+			onenand_mlc_read_ops_nolock(mtd, from, ops) :
+			onenand_read_ops_nolock(mtd, from, ops);
 	else
 		ret = onenand_read_oob_nolock(mtd, from, ops);
 	onenand_release_device(mtd);
@@ -1128,11 +1439,11 @@ static int onenand_bbt_wait(struct mtd_i
 	ctrl = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
 
 	if (interrupt & ONENAND_INT_READ) {
-		int ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS);
+		int ecc = onenand_read_ecc(this);
 		if (ecc & ONENAND_ECC_2BIT_ALL) {
 			printk(KERN_INFO "onenand_bbt_wait: ecc error = 0x%04x"
 				", controller error 0x%04x\n", ecc, ctrl);
-			return ONENAND_BBT_READ_ERROR;
+			return ONENAND_BBT_READ_ECC_ERROR;
 		}
 	} else {
 		printk(KERN_ERR "onenand_bbt_wait: read timeout!"
@@ -1163,7 +1474,7 @@ int onenand_bbt_read_oob(struct mtd_info
 {
 	struct onenand_chip *this = mtd->priv;
 	int read = 0, thislen, column;
-	int ret = 0;
+	int ret = 0, readcmd;
 	size_t len = ops->ooblen;
 	u_char *buf = ops->oobbuf;
 
@@ -1183,17 +1494,22 @@ int onenand_bbt_read_oob(struct mtd_info
 
 	column = from & (mtd->oobsize - 1);
 
+	readcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
+
 	while (read < len) {
 		cond_resched();
 
 		thislen = mtd->oobsize - column;
 		thislen = min_t(int, thislen, len);
 
-		this->command(mtd, ONENAND_CMD_READOOB, from, mtd->oobsize);
+		this->command(mtd, readcmd, from, mtd->oobsize);
 
 		onenand_update_bufferram(mtd, from, 0);
 
 		ret = onenand_bbt_wait(mtd, FL_READING);
+		if (unlikely(ret))
+			ret = onenand_recover_lsb(mtd, from, ret);
+
 		if (ret)
 			break;
 
@@ -1230,9 +1546,11 @@ static int onenand_verify_oob(struct mtd
 {
 	struct onenand_chip *this = mtd->priv;
 	u_char *oob_buf = this->oob_buf;
-	int status, i;
+	int status, i, readcmd;
 
-	this->command(mtd, ONENAND_CMD_READOOB, to, mtd->oobsize);
+	readcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
+
+	this->command(mtd, readcmd, to, mtd->oobsize);
 	onenand_update_bufferram(mtd, to, 0);
 	status = this->wait(mtd, FL_READING);
 	if (status)
@@ -1633,7 +1951,7 @@ static int onenand_write_oob_nolock(stru
 {
 	struct onenand_chip *this = mtd->priv;
 	int column, ret = 0, oobsize;
-	int written = 0;
+	int written = 0, oobcmd;
 	u_char *oobbuf;
 	size_t len = ops->ooblen;
 	const u_char *buf = ops->oobbuf;
@@ -1675,6 +1993,8 @@ static int onenand_write_oob_nolock(stru
 
 	oobbuf = this->oob_buf;
 
+	oobcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_PROG : ONENAND_CMD_PROGOOB;
+
 	/* Loop until all data write */
 	while (written < len) {
 		int thislen = min_t(int, oobsize, len - written);
@@ -1692,7 +2012,14 @@ static int onenand_write_oob_nolock(stru
 			memcpy(oobbuf + column, buf, thislen);
 		this->write_bufferram(mtd, ONENAND_SPARERAM, oobbuf, 0, mtd->oobsize);
 
-		this->command(mtd, ONENAND_CMD_PROGOOB, to, mtd->oobsize);
+		if (ONENAND_IS_MLC(this)) {
+			/* Set main area of DataRAM to 0xff*/
+			memset(this->page_buf, 0xff, mtd->writesize);
+			this->write_bufferram(mtd, ONENAND_DATARAM,
+					 this->page_buf, 0, mtd->writesize);
+		}
+
+		this->command(mtd, oobcmd, to, mtd->oobsize);
 
 		onenand_update_bufferram(mtd, to, 0);
 		if (ONENAND_IS_2PLANE(this)) {
@@ -1815,29 +2142,48 @@ static int onenand_erase(struct mtd_info
 {
 	struct onenand_chip *this = mtd->priv;
 	unsigned int block_size;
-	loff_t addr;
-	int len;
-	int ret = 0;
+	loff_t addr = instr->addr;
+	loff_t len = instr->len;
+	int ret = 0, i;
+	struct mtd_erase_region_info *region = NULL;
+	loff_t region_end = 0;
 
 	DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start = 0x%012llx, len = %llu\n", (unsigned long long) instr->addr, (unsigned long long) instr->len);
 
-	block_size = (1 << this->erase_shift);
-
-	/* Start address must align on block boundary */
-	if (unlikely(instr->addr & (block_size - 1))) {
-		printk(KERN_ERR "onenand_erase: Unaligned address\n");
+	/* Do not allow erase past end of device */
+	if (unlikely((len + addr) > mtd->size)) {
+		printk(KERN_ERR "onenand_erase: Erase past end of device\n");
 		return -EINVAL;
 	}
 
-	/* Length must align on block boundary */
-	if (unlikely(instr->len & (block_size - 1))) {
-		printk(KERN_ERR "onenand_erase: Length not block aligned\n");
-		return -EINVAL;
+	if (FLEXONENAND(this)) {
+		/* Find the eraseregion of this address */
+		i = flexonenand_region(mtd, addr);
+		region = &mtd->eraseregions[i];
+
+		block_size = region->erasesize;
+		region_end = region->offset + region->erasesize * region->numblocks;
+
+		/* Start address within region must align on block boundary.
+		 * Erase region's start offset is always block start address.
+		 */
+		if (unlikely((addr - region->offset) & (block_size - 1))) {
+			printk(KERN_ERR "onenand_erase: Unaligned address\n");
+			return -EINVAL;
+		}
+	} else {
+		block_size = 1 << this->erase_shift;
+
+		/* Start address must align on block boundary */
+		if (unlikely(addr & (block_size - 1))) {
+			printk(KERN_ERR "onenand_erase: Unaligned address\n");
+			return -EINVAL;
+		}
 	}
 
-	/* Do not allow erase past end of device */
-	if (unlikely((instr->len + instr->addr) > mtd->size)) {
-		printk(KERN_ERR "onenand_erase: Erase past end of device\n");
+	/* Length must align on block boundary */
+	if (unlikely(len & (block_size - 1))) {
+		printk(KERN_ERR "onenand_erase: Length not block aligned\n");
 		return -EINVAL;
 	}
 
@@ -1847,9 +2193,6 @@ static int onenand_erase(struct mtd_info
 	onenand_get_device(mtd, FL_ERASING);
 
 	/* Loop throught the pages */
-	len = instr->len;
-	addr = instr->addr;
-
 	instr->state = MTD_ERASING;
 
 	while (len) {
@@ -1869,7 +2212,8 @@ static int onenand_erase(struct mtd_info
 		ret = this->wait(mtd, FL_ERASING);
 		/* Check, if it is write protected */
 		if (ret) {
-			printk(KERN_ERR "onenand_erase: Failed erase, block %d\n", (unsigned) (addr >> this->erase_shift));
+			printk(KERN_ERR "onenand_erase: Failed erase, block %d\n",
+						 onenand_block(this, addr));
 			instr->state = MTD_ERASE_FAILED;
 			instr->fail_addr = addr;
 			goto erase_exit;
@@ -1877,6 +2221,22 @@ static int onenand_erase(struct mtd_info
 
 		len -= block_size;
 		addr += block_size;
+
+		if (addr == region_end) {
+			if (!len)
+				break;
+			region++;
+
+			block_size = region->erasesize;
+			region_end = region->offset + region->erasesize * region->numblocks;
+
+			if (len & (block_size - 1)) {
+				/* FIXME: This should be handled at MTD partitioning level. */
+				printk(KERN_ERR "onenand_erase: Unaligned address\n");
+				goto erase_exit;
+			}
+		}
+
 	}
 
 	instr->state = MTD_ERASE_DONE;
@@ -1955,13 +2315,17 @@ static int onenand_default_block_markbad
 	int block;
 
 	/* Get block number */
-	block = ((int) ofs) >> bbm->bbt_erase_shift;
+	block = onenand_block(this, ofs);
         if (bbm->bbt)
                 bbm->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);
 
         /* We write two bytes, so we dont have to mess with 16 bit access */
         ofs += mtd->oobsize + (bbm->badblockpos & ~0x01);
-        return onenand_write_oob_nolock(mtd, ofs, &ops);
+	/* FIXME : What to do when marking SLC block in partition
+	 * 	   with MLC erasesize? For now, it is not advisable to
+	 *	   create partitions containing both SLC and MLC regions.
+	 */
+	return onenand_write_oob_nolock(mtd, ofs, &ops);
 }
 
 /**
@@ -2005,8 +2369,8 @@ static int onenand_do_lock_cmd(struct mt
 	int start, end, block, value, status;
 	int wp_status_mask;
 
-	start = ofs >> this->erase_shift;
-	end = len >> this->erase_shift;
+	start = onenand_block(this, ofs);
+	end = onenand_block(this, ofs + len) - 1;
 
 	if (cmd == ONENAND_CMD_LOCK)
 		wp_status_mask = ONENAND_WP_LS;
@@ -2018,7 +2382,7 @@ static int onenand_do_lock_cmd(struct mt
 		/* Set start block address */
 		this->write_word(start, this->base + ONENAND_REG_START_BLOCK_ADDRESS);
 		/* Set end block address */
-		this->write_word(start + end - 1, this->base + ONENAND_REG_END_BLOCK_ADDRESS);
+		this->write_word(end, this->base +  ONENAND_REG_END_BLOCK_ADDRESS);
 		/* Write lock command */
 		this->command(mtd, cmd, 0, 0);
 
@@ -2039,7 +2403,7 @@ static int onenand_do_lock_cmd(struct mt
 	}
 
 	/* Block lock scheme */
-	for (block = start; block < start + end; block++) {
+	for (block = start; block < end + 1; block++) {
 		/* Set block address */
 		value = onenand_block_address(this, block);
 		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS1);
@@ -2147,7 +2511,7 @@ static void onenand_unlock_all(struct mt
 {
 	struct onenand_chip *this = mtd->priv;
 	loff_t ofs = 0;
-	size_t len = this->chipsize;
+	loff_t len = mtd->size;
 
 	if (this->options & ONENAND_HAS_UNLOCK_ALL) {
 		/* Set start block address */
@@ -2168,7 +2532,7 @@ static void onenand_unlock_all(struct mt
 			return;
 
 		/* Workaround for all block unlock in DDP */
-		if (ONENAND_IS_DDP(this)) {
+		if (ONENAND_IS_DDP(this) && !FLEXONENAND(this)) {
 			/* All blocks on another chip */
 			ofs = this->chipsize >> 1;
 			len = this->chipsize >> 1;
@@ -2210,7 +2574,9 @@ static int do_otp_read(struct mtd_info *
 	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
 	this->wait(mtd, FL_OTPING);
 
-	ret = onenand_read_ops_nolock(mtd, from, &ops);
+	ret = ONENAND_IS_MLC(this) ?
+		onenand_mlc_read_ops_nolock(mtd, from, &ops) :
+		onenand_read_ops_nolock(mtd, from, &ops);
 
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
@@ -2277,21 +2643,32 @@ static int do_otp_lock(struct mtd_info *
 		size_t *retlen, u_char *buf)
 {
 	struct onenand_chip *this = mtd->priv;
-	struct mtd_oob_ops ops = {
-		.mode = MTD_OOB_PLACE,
-		.ooblen = len,
-		.oobbuf = buf,
-		.ooboffs = 0,
-	};
+	struct mtd_oob_ops ops;
 	int ret;
 
 	/* Enter OTP access mode */
 	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
 	this->wait(mtd, FL_OTPING);
 
-	ret = onenand_write_oob_nolock(mtd, from, &ops);
-
-	*retlen = ops.oobretlen;
+	if (FLEXONENAND(this)) {
+		/*
+		 * For Flex-OneNAND, we write lock mark to 1st word of sector 4 of
+		 * main area of page 49.
+		 */
+		ops.len = mtd->writesize;
+		ops.ooblen = 0;
+		ops.datbuf = buf;
+		ops.oobbuf = NULL;
+		ret = onenand_write_ops_nolock(mtd, mtd->writesize * 49, &ops);
+		*retlen = ops.retlen;
+	} else {
+		ops.mode = MTD_OOB_PLACE;
+		ops.ooblen = len;
+		ops.oobbuf = buf;
+		ops.ooboffs = 0;
+		ret = onenand_write_oob_nolock(mtd, from, &ops);
+		*retlen = ops.oobretlen;
+	}
 
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
@@ -2475,27 +2852,34 @@ static int onenand_lock_user_prot_reg(st
 			size_t len)
 {
 	struct onenand_chip *this = mtd->priv;
-	u_char *oob_buf = this->oob_buf;
+	u_char *buf = FLEXONENAND(this) ? this->page_buf : this->oob_buf;
 	size_t retlen;
 	int ret;
 
-	memset(oob_buf, 0xff, mtd->oobsize);
+	memset(buf, 0xff, FLEXONENAND(this) ? this->writesize
+						 : mtd->oobsize);
 	/*
 	 * Note: OTP lock operation
 	 *       OTP block : 0xXXFC
 	 *       1st block : 0xXXF3 (If chip support)
 	 *       Both      : 0xXXF0 (If chip support)
 	 */
-	oob_buf[ONENAND_OTP_LOCK_OFFSET] = 0xFC;
+	if (FLEXONENAND(this))
+		buf[FLEXONENAND_OTP_LOCK_OFFSET] = 0xFC;
+	else
+		buf[ONENAND_OTP_LOCK_OFFSET] = 0xFC;
 
 	/*
 	 * Write lock mark to 8th word of sector0 of page0 of the spare0.
 	 * We write 16 bytes spare area instead of 2 bytes.
+	 * For Flex-OneNAND, we write lock mark to 1st word of sector 4 of
+	 * main area of page 49.
 	 */
+
 	from = 0;
-	len = 16;
+	len = FLEXONENAND(this) ? mtd->writesize : 16;
 
-	ret = onenand_otp_walk(mtd, from, len, &retlen, oob_buf, do_otp_lock, MTD_OTP_USER);
+	ret = onenand_otp_walk(mtd, from, len, &retlen, buf, do_otp_lock, MTD_OTP_USER);
 
 	return ret ? : retlen;
 }
@@ -2542,6 +2926,14 @@ static void onenand_check_features(struc
 		break;
 	}
 
+	if (ONENAND_IS_MLC(this))
+		this->options &= ~ONENAND_HAS_2PLANE;
+
+	if (FLEXONENAND(this)) {
+		this->options &= ~ONENAND_HAS_CONT_LOCK;
+		this->options |= ONENAND_HAS_UNLOCK_ALL;
+	}
+
 	if (this->options & ONENAND_HAS_CONT_LOCK)
 		printk(KERN_DEBUG "Lock scheme is Continuous Lock\n");
 	if (this->options & ONENAND_HAS_UNLOCK_ALL)
@@ -2559,14 +2951,16 @@ static void onenand_check_features(struc
  */
 static void onenand_print_device_info(int device, int version)
 {
-        int vcc, demuxed, ddp, density;
+	int vcc, demuxed, ddp, density, flexonenand;
 
         vcc = device & ONENAND_DEVICE_VCC_MASK;
         demuxed = device & ONENAND_DEVICE_IS_DEMUX;
         ddp = device & ONENAND_DEVICE_IS_DDP;
         density = onenand_get_density(device);
-        printk(KERN_INFO "%sOneNAND%s %dMB %sV 16-bit (0x%02x)\n",
-                demuxed ? "" : "Muxed ",
+	flexonenand = device & DEVICE_IS_FLEXONENAND;
+	printk(KERN_INFO "%s%sOneNAND%s %dMB %sV 16-bit (0x%02x)\n",
+		demuxed ? "" : "Muxed ",
+		flexonenand ? "Flex-" : "",
                 ddp ? "(DDP)" : "",
                 (16 << density),
                 vcc ? "2.65/3.3" : "1.8",
@@ -2605,6 +2999,280 @@ static int onenand_check_maf(int manuf)
 }
 
 /**
+* flexonenand_get_boundary	- Reads the SLC boundary
+* @param onenand_info		- onenand info structure
+**/
+static int flexonenand_get_boundary(struct mtd_info *mtd)
+{
+	struct onenand_chip *this = mtd->priv;
+	unsigned die, bdry;
+	int ret, syscfg, locked;
+
+	/* Disable ECC */
+	syscfg = this->read_word(this->base + ONENAND_REG_SYS_CFG1);
+	this->write_word((syscfg | 0x0100), this->base + ONENAND_REG_SYS_CFG1);
+
+	for (die = 0; die < this->dies; die++) {
+		this->command(mtd, FLEXONENAND_CMD_PI_ACCESS, die, 0);
+		this->wait(mtd, FL_SYNCING);
+
+		this->command(mtd, FLEXONENAND_CMD_READ_PI, die, 0);
+		ret = this->wait(mtd, FL_READING);
+
+		bdry = this->read_word(this->base + ONENAND_DATARAM);
+		if ((bdry >> FLEXONENAND_PI_UNLOCK_SHIFT) == 3)
+			locked = 0;
+		else
+			locked = 1;
+		this->boundary[die] = bdry & FLEXONENAND_PI_MASK;
+
+		this->command(mtd, ONENAND_CMD_RESET, 0, 0);
+		ret = this->wait(mtd, FL_RESETING);
+
+		printk(KERN_INFO "Die %d boundary: %d%s\n", die,
+		       this->boundary[die], locked ? "(Locked)" : "(Unlocked)");
+	}
+
+	/* Enable ECC */
+	this->write_word(syscfg, this->base + ONENAND_REG_SYS_CFG1);
+	return 0;
+}
+
+/**
+ * flexonenand_get_size - Fill up fields in onenand_chip and mtd_info
+ * 			  boundary[], diesize[], mtd->size, mtd->erasesize
+ * @param mtd		- MTD device structure
+ */
+static void flexonenand_get_size(struct mtd_info *mtd)
+{
+	struct onenand_chip *this = mtd->priv;
+	int die, i, eraseshift, density;
+	int blksperdie, maxbdry;
+	loff_t ofs;
+
+	density = onenand_get_density(this->device_id);
+	blksperdie = ((loff_t)(16 << density) << 20) >> (this->erase_shift);
+	blksperdie >>= ONENAND_IS_DDP(this) ? 1 : 0;
+	maxbdry = blksperdie - 1;
+	eraseshift = this->erase_shift - 1;
+
+	mtd->numeraseregions = this->dies << 1;
+
+	/* This fills up the device boundary */
+	flexonenand_get_boundary(mtd);
+	die = ofs = 0;
+	i = -1;
+	for (; die < this->dies; die++) {
+		if (!die || this->boundary[die-1] != maxbdry) {
+			i++;
+			mtd->eraseregions[i].offset = ofs;
+			mtd->eraseregions[i].erasesize = 1 << eraseshift;
+			mtd->eraseregions[i].numblocks =
+							this->boundary[die] + 1;
+			ofs += mtd->eraseregions[i].numblocks << eraseshift;
+			eraseshift++;
+		} else {
+			mtd->numeraseregions -= 1;
+			mtd->eraseregions[i].numblocks +=
+							this->boundary[die] + 1;
+			ofs += (this->boundary[die] + 1) << (eraseshift - 1);
+		}
+		if (this->boundary[die] != maxbdry) {
+			i++;
+			mtd->eraseregions[i].offset = ofs;
+			mtd->eraseregions[i].erasesize = 1 << eraseshift;
+			mtd->eraseregions[i].numblocks = maxbdry ^
+							 this->boundary[die];
+			ofs += mtd->eraseregions[i].numblocks << eraseshift;
+			eraseshift--;
+		} else
+			mtd->numeraseregions -= 1;
+	}
+
+	/* Expose MLC erase size except when all blocks are SLC */
+	mtd->erasesize = 1 << this->erase_shift;
+	if (mtd->numeraseregions == 1)
+		mtd->erasesize >>= 1;
+
+	printk(KERN_INFO "Device has %d eraseregions\n", mtd->numeraseregions);
+	for (i = 0; i < mtd->numeraseregions; i++)
+		printk(KERN_INFO "[offset: 0x%08x, erasesize: 0x%05x,"
+			" numblocks: %04u]\n",
+			(unsigned int) mtd->eraseregions[i].offset,
+			mtd->eraseregions[i].erasesize,
+			mtd->eraseregions[i].numblocks);
+
+	for (die = 0, mtd->size = 0; die < this->dies; die++) {
+		this->diesize[die] = (loff_t)blksperdie << this->erase_shift;
+		this->diesize[die] -= (loff_t)(this->boundary[die] + 1)
+						 << (this->erase_shift - 1);
+		mtd->size += this->diesize[die];
+	}
+}
+
+/**
+ * flexonenand_check_blocks_erased - Check if blocks are erased
+ * @param mtd_info	- mtd info structure
+ * @param start		- first erase block to check
+ * @param end		- last erase block to check
+ *
+ * Converting an unerased block from MLC to SLC
+ * causes byte values to change. Since both data and its ECC
+ * have changed, reads on the block give uncorrectable error.
+ * This might lead to the block being detected as bad.
+ *
+ * Avoid this by ensuring that the block to be converted is
+ * erased.
+ */
+static int flexonenand_check_blocks_erased(struct mtd_info *mtd, int start, int end)
+{
+	struct onenand_chip *this = mtd->priv;
+	int i, ret;
+	int block;
+	struct mtd_oob_ops ops = {
+		.mode = MTD_OOB_PLACE,
+		.ooboffs = 0,
+		.ooblen	= mtd->oobsize,
+		.datbuf	= NULL,
+		.oobbuf	= this->oob_buf,
+	};
+	loff_t addr;
+
+	printk(KERN_DEBUG "Check blocks from %d to %d\n", start, end);
+
+	for (block = start; block <= end; block++) {
+		addr = flexonenand_addr(this, block);
+		if (onenand_block_isbad_nolock(mtd, addr, 0))
+			continue;
+
+		/*
+		 * Since main area write results in ECC write to spare,
+		 * it is sufficient to check only ECC bytes for change.
+		 */
+		ret = onenand_read_oob_nolock(mtd, addr, &ops);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < mtd->oobsize; i++)
+			if (this->oob_buf[i] != 0xff)
+				break;
+
+		if (i != mtd->oobsize) {
+			printk(KERN_WARNING "Block %d not erased.\n", block);
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * flexonenand_set_boundary	- Writes the SLC boundary
+ * @param mtd			- mtd info structure
+ */
+int flexonenand_set_boundary(struct mtd_info *mtd, int die,
+				    int boundary, int lock)
+{
+	struct onenand_chip *this = mtd->priv;
+	int ret, density, blksperdie, old, new, thisboundary;
+	loff_t addr;
+
+	/* Change only once for SDP Flex-OneNAND */
+	if (die && (!ONENAND_IS_DDP(this)))
+		return 0;
+
+	/* boundary value of -1 indicates no required change */
+	if (boundary < 0 || boundary == this->boundary[die])
+		return 0;
+
+	density = onenand_get_density(this->device_id);
+	blksperdie = ((16 << density) << 20) >> this->erase_shift;
+	blksperdie >>= ONENAND_IS_DDP(this) ? 1 : 0;
+
+	if (boundary >= blksperdie) {
+		printk(KERN_ERR "flexonenand_set_boundary: Invalid boundary value. "
+				"Boundary not changed.\n");
+		return -EINVAL;
+	}
+
+	/* Check if converting blocks are erased */
+	old = this->boundary[die] + (die * this->density_mask);
+	new = boundary + (die * this->density_mask);
+	ret = flexonenand_check_blocks_erased(mtd, min(old, new) + 1, max(old, new));
+	if (ret) {
+		printk(KERN_ERR "flexonenand_set_boundary: Please erase blocks before boundary change\n");
+		return ret;
+	}
+
+	this->command(mtd, FLEXONENAND_CMD_PI_ACCESS, die, 0);
+	this->wait(mtd, FL_SYNCING);
+
+	/* Check is boundary is locked */
+	this->command(mtd, FLEXONENAND_CMD_READ_PI, die, 0);
+	ret = this->wait(mtd, FL_READING);
+
+	thisboundary = this->read_word(this->base + ONENAND_DATARAM);
+	if ((thisboundary >> FLEXONENAND_PI_UNLOCK_SHIFT) != 3) {
+		printk(KERN_ERR "flexonenand_set_boundary: boundary locked\n");
+		ret = 1;
+		goto out;
+	}
+
+	printk(KERN_INFO "flexonenand_set_boundary: Changing die %d boundary: %d%s\n",
+			die, boundary, lock ? "(Locked)" : "(Unlocked)");
+
+	addr = die ? this->diesize[0] : 0;
+
+	boundary &= FLEXONENAND_PI_MASK;
+	boundary |= lock ? 0 : (3 << FLEXONENAND_PI_UNLOCK_SHIFT);
+
+	this->command(mtd, ONENAND_CMD_ERASE, addr, 0);
+	ret = this->wait(mtd, FL_ERASING);
+	if (ret) {
+		printk(KERN_ERR "flexonenand_set_boundary: Failed PI erase for Die %d\n", die);
+		goto out;
+	}
+
+	this->write_word(boundary, this->base + ONENAND_DATARAM);
+	this->command(mtd, ONENAND_CMD_PROG, addr, 0);
+	ret = this->wait(mtd, FL_WRITING);
+	if (ret) {
+		printk(KERN_ERR "flexonenand_set_boundary: Failed PI write for Die %d\n", die);
+		goto out;
+	}
+
+	this->command(mtd, FLEXONENAND_CMD_PI_UPDATE, die, 0);
+	ret = this->wait(mtd, FL_WRITING);
+out:
+	this->write_word(ONENAND_CMD_RESET, this->base + ONENAND_REG_COMMAND);
+	this->wait(mtd, FL_RESETING);
+	if (!ret)
+		/* Recalculate device size on boundary change*/
+		flexonenand_get_size(mtd);
+
+	return ret;
+}
+
+/**
+ * flexonenand_setup - 	capture Flex-OneNAND boundary and lock
+ * 			values  passed as kernel parameters
+ * @param s	kernel parameter string
+ */
+static int flexonenand_setup(char *s)
+{
+	int ints[5], i;
+
+	s = get_options(s, 5, ints);
+
+	for (i = 0; i < ints[0]; i++)
+		flex_bdry[i] = ints[i + 1];
+
+	return 1;
+}
+
+__setup("onenand.bdry=", flexonenand_setup);
+
+/**
  * onenand_probe - [OneNAND Interface] Probe the OneNAND device
  * @param mtd		MTD device structure
  *
@@ -2646,6 +3314,7 @@ static int onenand_probe(struct mtd_info
 	maf_id = this->read_word(this->base + ONENAND_REG_MANUFACTURER_ID);
 	dev_id = this->read_word(this->base + ONENAND_REG_DEVICE_ID);
 	ver_id = this->read_word(this->base + ONENAND_REG_VERSION_ID);
+	this->technology = this->read_word(this->base + ONENAND_REG_TECHNOLOGY);
 
 	/* Check OneNAND device */
 	if (maf_id != bram_maf_id || dev_id != bram_dev_id)
@@ -2657,29 +3326,55 @@ static int onenand_probe(struct mtd_info
 	this->version_id = ver_id;
 
 	density = onenand_get_density(dev_id);
+	if (FLEXONENAND(this)) {
+		this->dies = ONENAND_IS_DDP(this) ? 2 : 1;
+		/* Maximum possible erase regions */
+		mtd->numeraseregions = this->dies << 1;
+		mtd->eraseregions = kzalloc(sizeof(struct mtd_erase_region_info)
+					* (this->dies << 1), GFP_KERNEL);
+		if (!mtd->eraseregions)
+			return -ENOMEM;
+	}
+
+	/*
+	 * For Flex-OneNAND, chipsize represents maximum possible device size.
+	 * mtd->size represents the actual device size.
+	 */
 	this->chipsize = (16 << density) << 20;
-	/* Set density mask. it is used for DDP */
-	if (ONENAND_IS_DDP(this))
-		this->density_mask = (1 << (density + 6));
-	else
-		this->density_mask = 0;
 
 	/* OneNAND page size & block size */
 	/* The data buffer size is equal to page size */
 	mtd->writesize = this->read_word(this->base + ONENAND_REG_DATA_BUFFER_SIZE);
+	/* We use the full BufferRAM */
+	if (ONENAND_IS_MLC(this))
+		mtd->writesize <<= 1;
+
 	mtd->oobsize = mtd->writesize >> 5;
 	/* Pages per a block are always 64 in OneNAND */
 	mtd->erasesize = mtd->writesize << 6;
+	/*
+	 * Flex-OneNAND SLC area has 64 pages per block.
+	 * Flex-OneNAND MLC area has 128 pages per block.
+	 * Expose MLC erase size to find erase_shift and page_mask.
+	 */
+	if (FLEXONENAND(this))
+		mtd->erasesize <<= 1;
 
 	this->erase_shift = ffs(mtd->erasesize) - 1;
 	this->page_shift = ffs(mtd->writesize) - 1;
 	this->page_mask = (1 << (this->erase_shift - this->page_shift)) - 1;
+	/* Set density mask. it is used for DDP */
+	if (ONENAND_IS_DDP(this))
+		this->density_mask = this->chipsize >> (this->erase_shift + 1);
 	/* It's real page size */
 	this->writesize = mtd->writesize;
 
 	/* REVIST: Multichip handling */
 
-	mtd->size = this->chipsize;
+	if (FLEXONENAND(this))
+		flexonenand_get_size(mtd);
+	else
+		mtd->size = this->chipsize;
 
 	/* Check OneNAND features */
 	onenand_check_features(mtd);
@@ -2734,7 +3429,7 @@ static void onenand_resume(struct mtd_in
  */
 int onenand_scan(struct mtd_info *mtd, int maxchips)
 {
-	int i;
+	int i, ret;
 	struct onenand_chip *this = mtd->priv;
 
 	if (!this->read_word)
@@ -2796,6 +3491,10 @@ int onenand_scan(struct mtd_info *mtd, i
 	 * Allow subpage writes up to oobsize.
 	 */
 	switch (mtd->oobsize) {
+	case 128:
+		this->ecclayout = &onenand_oob_128;
+		mtd->subpage_sft = 0;
+		break;
 	case 64:
 		this->ecclayout = &onenand_oob_64;
 		mtd->subpage_sft = 2;
@@ -2861,7 +3560,16 @@ int onenand_scan(struct mtd_info *mtd, i
 	/* Unlock whole block */
 	onenand_unlock_all(mtd);
 
-	return this->scan_bbt(mtd);
+	ret = this->scan_bbt(mtd);
+	if ((!FLEXONENAND(this)) || ret)
+		return ret;
+
+	/* Change Flex-OneNAND boundaries if required */
+	for (i = 0; i < MAX_DIES; i++)
+		flexonenand_set_boundary(mtd, i, flex_bdry[2 * i],
+						 flex_bdry[(2 * i) + 1]);
+
+	return 0;
 }
 
 /**
@@ -2890,6 +3598,7 @@ void onenand_release(struct mtd_info *mt
 		kfree(this->page_buf);
 	if (this->options & ONENAND_OOBBUF_ALLOC)
 		kfree(this->oob_buf);
+	kfree(mtd->eraseregions);
 }
 
 EXPORT_SYMBOL_GPL(onenand_scan);
diff -puN drivers/mtd/onenand/onenand_bbt.c~mtd-flex-onenand-support drivers/mtd/onenand/onenand_bbt.c
--- a/drivers/mtd/onenand/onenand_bbt.c~mtd-flex-onenand-support
+++ a/drivers/mtd/onenand/onenand_bbt.c
@@ -63,6 +63,7 @@ static int create_bbt(struct mtd_info *m
 	loff_t from;
 	size_t readlen, ooblen;
 	struct mtd_oob_ops ops;
+	int rgn;
 
 	printk(KERN_INFO "Scanning device for bad blocks\n");
 
@@ -76,7 +77,7 @@ static int create_bbt(struct mtd_info *m
 	/* Note that numblocks is 2 * (real numblocks) here;
 	 * see i += 2 below as it makses shifting and masking less painful
 	 */
-	numblocks = mtd->size >> (bbm->bbt_erase_shift - 1);
+	numblocks = this->chipsize >> (bbm->bbt_erase_shift - 1);
 	startblock = 0;
 	from = 0;
 
@@ -106,7 +107,12 @@ static int create_bbt(struct mtd_info *m
 			}
 		}
 		i += 2;
-		from += (1 << bbm->bbt_erase_shift);
+
+		if (FLEXONENAND(this)) {
+			rgn = flexonenand_region(mtd, from);
+			from += mtd->eraseregions[rgn].erasesize;
+		} else
+			from += (1 << bbm->bbt_erase_shift);
 	}
 
 	return 0;
@@ -143,7 +149,7 @@ static int onenand_isbad_bbt(struct mtd_
 	uint8_t res;
 
 	/* Get block number * 2 */
-	block = (int) (offs >> (bbm->bbt_erase_shift - 1));
+	block = (int) (onenand_block(this, offs) << 1);
 	res = (bbm->bbt[block >> 3] >> (block & 0x06)) & 0x03;
 
 	DEBUG(MTD_DEBUG_LEVEL2, "onenand_isbad_bbt: bbt info for offs 0x%08x: (block %d) 0x%02x\n",
@@ -178,7 +184,7 @@ int onenand_scan_bbt(struct mtd_info *mt
 	struct bbm_info *bbm = this->bbm;
 	int len, ret = 0;
 
-	len = mtd->size >> (this->erase_shift + 2);
+	len = this->chipsize >> (this->erase_shift + 2);
 	/* Allocate memory (2bit per block) and clear the memory bad block table */
 	bbm->bbt = kzalloc(len, GFP_KERNEL);
 	if (!bbm->bbt) {
diff -puN drivers/mtd/onenand/onenand_sim.c~mtd-flex-onenand-support drivers/mtd/onenand/onenand_sim.c
--- a/drivers/mtd/onenand/onenand_sim.c~mtd-flex-onenand-support
+++ a/drivers/mtd/onenand/onenand_sim.c
@@ -6,6 +6,10 @@
  *  Copyright © 2005-2007 Samsung Electronics
  *  Kyungmin Park <kyungmin.park@samsung.com>
  *
+ *  Vishak G <vishak.g at samsung.com>, Rohit Hagargundgi <h.rohit at samsung.com>
+ *  Flex-OneNAND simulator support
+ *  Copyright (C) Samsung Electronics, 2008
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
@@ -24,16 +28,38 @@
 #ifndef CONFIG_ONENAND_SIM_MANUFACTURER
 #define CONFIG_ONENAND_SIM_MANUFACTURER         0xec
 #endif
+
 #ifndef CONFIG_ONENAND_SIM_DEVICE_ID
 #define CONFIG_ONENAND_SIM_DEVICE_ID            0x04
 #endif
+
+#define CONFIG_FLEXONENAND ((CONFIG_ONENAND_SIM_DEVICE_ID >> 9) & 1)
+
 #ifndef CONFIG_ONENAND_SIM_VERSION_ID
 #define CONFIG_ONENAND_SIM_VERSION_ID           0x1e
 #endif
 
+#ifndef CONFIG_ONENAND_SIM_TECHNOLOGY_ID
+#define CONFIG_ONENAND_SIM_TECHNOLOGY_ID CONFIG_FLEXONENAND
+#endif
+
+/* Initial boundary values for Flex-OneNAND Simulator */
+#ifndef CONFIG_FLEXONENAND_SIM_DIE0_BOUNDARY
+#define CONFIG_FLEXONENAND_SIM_DIE0_BOUNDARY	0x01
+#endif
+
+#ifndef CONFIG_FLEXONENAND_SIM_DIE1_BOUNDARY
+#define CONFIG_FLEXONENAND_SIM_DIE1_BOUNDARY	0x01
+#endif
+
 static int manuf_id	= CONFIG_ONENAND_SIM_MANUFACTURER;
 static int device_id	= CONFIG_ONENAND_SIM_DEVICE_ID;
 static int version_id	= CONFIG_ONENAND_SIM_VERSION_ID;
+static int technology_id = CONFIG_ONENAND_SIM_TECHNOLOGY_ID;
+static int boundary[] = {
+	CONFIG_FLEXONENAND_SIM_DIE0_BOUNDARY,
+	CONFIG_FLEXONENAND_SIM_DIE1_BOUNDARY,
+};
 
 struct onenand_flash {
 	void __iomem *base;
@@ -57,12 +83,18 @@ struct onenand_flash {
 	(writew(v, this->base + ONENAND_REG_WP_STATUS))
 
 /* It has all 0xff chars */
-#define MAX_ONENAND_PAGESIZE		(2048 + 64)
+#define MAX_ONENAND_PAGESIZE		(4096 + 128)
 static unsigned char *ffchars;
 
+#if CONFIG_FLEXONENAND
+#define PARTITION_NAME "Flex-OneNAND simulator partition"
+#else
+#define PARTITION_NAME "OneNAND simulator partition"
+#endif
+
 static struct mtd_partition os_partitions[] = {
 	{
-		.name		= "OneNAND simulator partition",
+		.name		= PARTITION_NAME,
 		.offset		= 0,
 		.size		= MTDPART_SIZ_FULL,
 	},
@@ -104,6 +136,7 @@ static void onenand_lock_handle(struct o
 
 	switch (cmd) {
 	case ONENAND_CMD_UNLOCK:
+	case ONENAND_CMD_UNLOCK_ALL:
 		if (block_lock_scheme)
 			ONENAND_SET_WP_STATUS(ONENAND_WP_US, this);
 		else
@@ -228,10 +261,12 @@ static void onenand_data_handle(struct o
 {
 	struct mtd_info *mtd = &info->mtd;
 	struct onenand_flash *flash = this->priv;
-	int main_offset, spare_offset;
+	int main_offset, spare_offset, die = 0;
 	void __iomem *src;
 	void __iomem *dest;
 	unsigned int i;
+	static int pi_operation;
+	int erasesize, rgn;
 
 	if (dataram) {
 		main_offset = mtd->writesize;
@@ -241,10 +276,27 @@ static void onenand_data_handle(struct o
 		spare_offset = 0;
 	}
 
+	if (pi_operation) {
+		die = readw(this->base + ONENAND_REG_START_ADDRESS2);
+		die >>= ONENAND_DDP_SHIFT;
+	}
+
 	switch (cmd) {
+	case FLEXONENAND_CMD_PI_ACCESS:
+		pi_operation = 1;
+		break;
+
+	case ONENAND_CMD_RESET:
+		pi_operation = 0;
+		break;
+
 	case ONENAND_CMD_READ:
 		src = ONENAND_CORE(flash) + offset;
 		dest = ONENAND_MAIN_AREA(this, main_offset);
+		if (pi_operation) {
+			writew(boundary[die], this->base + ONENAND_DATARAM);
+			break;
+		}
 		memcpy(dest, src, mtd->writesize);
 		/* Fall through */
 
@@ -257,6 +309,10 @@ static void onenand_data_handle(struct o
 	case ONENAND_CMD_PROG:
 		src = ONENAND_MAIN_AREA(this, main_offset);
 		dest = ONENAND_CORE(flash) + offset;
+		if (pi_operation) {
+			boundary[die] = readw(this->base + ONENAND_DATARAM);
+			break;
+		}
 		/* To handle partial write */
 		for (i = 0; i < (1 << mtd->subpage_sft); i++) {
 			int off = i * this->subpagesize;
@@ -284,9 +340,18 @@ static void onenand_data_handle(struct o
 		break;
 
 	case ONENAND_CMD_ERASE:
-		memset(ONENAND_CORE(flash) + offset, 0xff, mtd->erasesize);
+		if (pi_operation)
+			break;
+
+		if (FLEXONENAND(this)) {
+			rgn = flexonenand_region(mtd, offset);
+			erasesize = mtd->eraseregions[rgn].erasesize;
+		} else
+			erasesize = mtd->erasesize;
+
+		memset(ONENAND_CORE(flash) + offset, 0xff, erasesize);
 		memset(ONENAND_CORE_SPARE(flash, this, offset), 0xff,
-		       (mtd->erasesize >> 5));
+		       (erasesize >> 5));
 		break;
 
 	default:
@@ -339,7 +404,7 @@ static void onenand_command_handle(struc
 	}
 
 	if (block != -1)
-		offset += block << this->erase_shift;
+		offset = onenand_addr(this, block);
 
 	if (page != -1)
 		offset += page << this->page_shift;
@@ -390,6 +455,7 @@ static int __init flash_init(struct onen
 	}
 
 	density = device_id >> ONENAND_DEVICE_DENSITY_SHIFT;
+	density &= ONENAND_DEVICE_DENSITY_MASK;
 	size = ((16 << 20) << density);
 
 	ONENAND_CORE(flash) = vmalloc(size + (size >> 5));
@@ -405,8 +471,9 @@ static int __init flash_init(struct onen
 	writew(manuf_id, flash->base + ONENAND_REG_MANUFACTURER_ID);
 	writew(device_id, flash->base + ONENAND_REG_DEVICE_ID);
 	writew(version_id, flash->base + ONENAND_REG_VERSION_ID);
+	writew(technology_id, flash->base + ONENAND_REG_TECHNOLOGY);
 
-	if (density < 2)
+	if (density < 2 && (!CONFIG_FLEXONENAND))
 		buffer_size = 0x0400;	/* 1KiB page */
 	else
 		buffer_size = 0x0800;	/* 2KiB page */
diff -puN include/linux/mtd/onenand.h~mtd-flex-onenand-support include/linux/mtd/onenand.h
--- a/include/linux/mtd/onenand.h~mtd-flex-onenand-support
+++ a/include/linux/mtd/onenand.h
@@ -17,6 +17,7 @@
 #include <linux/mtd/onenand_regs.h>
 #include <linux/mtd/bbm.h>
 
+#define MAX_DIES		2
 #define MAX_BUFFERRAM		2
 
 /* Scan and identify a OneNAND device */
@@ -51,7 +52,12 @@ struct onenand_bufferram {
 /**
  * struct onenand_chip - OneNAND Private Flash Chip Data
  * @base:		[BOARDSPECIFIC] address to access OneNAND
+ * @dies:		[INTERN][FLEX-ONENAND] number of dies on chip
+ * @boundary:		[INTERN][FLEX-ONENAND] Boundary of the dies
+ * @diesize:		[INTERN][FLEX-ONENAND] Size of the dies
  * @chipsize:		[INTERN] the size of one chip for multichip arrays
+ *			FIXME For Flex-OneNAND, chipsize holds maximum possible
+ *			device size ie when all blocks are considered MLC
  * @device_id:		[INTERN] device ID
  * @density_mask:	chip density, used for DDP devices
  * @verstion_id:	[INTERN] version ID
@@ -92,9 +98,13 @@ struct onenand_bufferram {
  */
 struct onenand_chip {
 	void __iomem		*base;
+	unsigned		dies;
+	unsigned		boundary[MAX_DIES];
+	loff_t			diesize[MAX_DIES];
 	unsigned int		chipsize;
 	unsigned int		device_id;
 	unsigned int		version_id;
+	unsigned int		technology;
 	unsigned int		density_mask;
 	unsigned int		options;
 
@@ -145,6 +155,8 @@ struct onenand_chip {
 #define ONENAND_SET_BUFFERRAM0(this)		(this->bufferram_index = 0)
 #define ONENAND_SET_BUFFERRAM1(this)		(this->bufferram_index = 1)
 
+#define FLEXONENAND(this)						\
+	(this->device_id & DEVICE_IS_FLEXONENAND)
 #define ONENAND_GET_SYS_CFG1(this)					\
 	(this->read_word(this->base + ONENAND_REG_SYS_CFG1))
 #define ONENAND_SET_SYS_CFG1(v, this)					\
@@ -153,6 +165,9 @@ struct onenand_chip {
 #define ONENAND_IS_DDP(this)						\
 	(this->device_id & ONENAND_DEVICE_IS_DDP)
 
+#define ONENAND_IS_MLC(this)						\
+	(this->technology & ONENAND_TECHNOLOGY_IS_MLC)
+
 #ifdef CONFIG_MTD_ONENAND_2X_PROGRAM
 #define ONENAND_IS_2PLANE(this)						\
 	(this->options & ONENAND_HAS_2PLANE)
@@ -189,5 +204,8 @@ struct onenand_manufacturers {
 
 int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 			 struct mtd_oob_ops *ops);
+unsigned onenand_block(struct onenand_chip *this, loff_t addr);
+loff_t onenand_addr(struct onenand_chip *this, int block);
+int flexonenand_region(struct mtd_info *mtd, loff_t addr);
 
 #endif	/* __LINUX_MTD_ONENAND_H */
diff -puN include/linux/mtd/onenand_regs.h~mtd-flex-onenand-support include/linux/mtd/onenand_regs.h
--- a/include/linux/mtd/onenand_regs.h~mtd-flex-onenand-support
+++ a/include/linux/mtd/onenand_regs.h
@@ -67,6 +67,9 @@
 /*
  * Device ID Register F001h (R)
  */
+#define DEVICE_IS_FLEXONENAND		(1 << 9)
+#define FLEXONENAND_PI_MASK		(0x3ff)
+#define FLEXONENAND_PI_UNLOCK_SHIFT	(14)
 #define ONENAND_DEVICE_DENSITY_MASK	(0xf)
 #define ONENAND_DEVICE_DENSITY_SHIFT	(4)
 #define ONENAND_DEVICE_IS_DDP		(1 << 3)
@@ -84,6 +87,11 @@
 #define ONENAND_VERSION_PROCESS_SHIFT	(8)
 
 /*
+ * Technology Register F006h (R)
+ */
+#define ONENAND_TECHNOLOGY_IS_MLC	(1 << 0)
+
+/*
  * Start Address 1 F100h (R/W) & Start Address 2 F101h (R/W)
  */
 #define ONENAND_DDP_SHIFT		(15)
@@ -93,7 +101,8 @@
 /*
  * Start Address 8 F107h (R/W)
  */
-#define ONENAND_FPA_MASK		(0x3f)
+/* Note: It's actually 0x3f in case of SLC */
+#define ONENAND_FPA_MASK		(0x7f)
 #define ONENAND_FPA_SHIFT		(2)
 #define ONENAND_FSA_MASK		(0x03)
 
@@ -105,7 +114,8 @@
 #define ONENAND_BSA_BOOTRAM		(0 << 2)
 #define ONENAND_BSA_DATARAM0		(2 << 2)
 #define ONENAND_BSA_DATARAM1		(3 << 2)
-#define ONENAND_BSC_MASK		(0x03)
+/* Note: It's actually 0x03 in case of SLC */
+#define ONENAND_BSC_MASK		(0x07)
 
 /*
  * Command Register F220h (R/W)
@@ -124,9 +134,13 @@
 #define ONENAND_CMD_RESET		(0xF0)
 #define ONENAND_CMD_OTP_ACCESS		(0x65)
 #define ONENAND_CMD_READID		(0x90)
+#define FLEXONENAND_CMD_PI_UPDATE	(0x05)
+#define FLEXONENAND_CMD_PI_ACCESS	(0x66)
+#define FLEXONENAND_CMD_RECOVER_LSB	(0x05)
 
 /* NOTE: Those are not *REAL* commands */
 #define ONENAND_CMD_BUFFERRAM		(0x1978)
+#define FLEXONENAND_CMD_READ_PI		(0x1985)
 
 /*
  * System Configuration 1 Register F221h (R, R/W)
@@ -192,10 +206,12 @@
 #define ONENAND_ECC_1BIT_ALL		(0x5555)
 #define ONENAND_ECC_2BIT		(1 << 1)
 #define ONENAND_ECC_2BIT_ALL		(0xAAAA)
+#define FLEXONENAND_UNCORRECTABLE_ERROR	(0x1010)
 
 /*
  * One-Time Programmable (OTP)
  */
+#define FLEXONENAND_OTP_LOCK_OFFSET		(2048)
 #define ONENAND_OTP_LOCK_OFFSET		(14)
 
 #endif	/* __ONENAND_REG_H */
_
