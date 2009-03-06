Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LfejH-0005H0-3F
	for linux-mtd@lists.infradead.org; Fri, 06 Mar 2009 18:25:12 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KG300LQ4KHJLC@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 07 Mar 2009 03:24:56 +0900 (KST)
Received: from rohith.localnet ([107.108.214.120])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KG3009SVKHJF3@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 07 Mar 2009 03:24:56 +0900 (KST)
Date: Fri, 06 Mar 2009 23:56:26 +0530
From: Rohit Hagargundgi <h.rohit@samsung.com>
Subject: [PATCH 1/3 v2] [MTD] Flex-OneNAND support
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Message-id: <200903062356.26294.h.rohit@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable
Content-disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support for Samsung Flex-OneNAND devices.

=46lex-OneNAND combines SLC and MLC technologies into a single device.
SLC area provides increased reliability and speed, suitable
for storing code such as bootloader, kernel and root file system.
MLC area provides high density and is suitable for storing user data.

SLC and MLC regions can be configured through kernel parameter.

Signed-off-by: Vishak G <vishak.g at samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park at samsung.com>
Signed-off-by: Rohit Hagargundgi <h.rohit at samsung.com>
=2D--
 Documentation/kernel-parameters.txt |   10=20
 drivers/mtd/onenand/onenand_base.c  |  855 +++++++++++++++++++++++++++++++=
+----
 drivers/mtd/onenand/onenand_bbt.c   |   14=20
 drivers/mtd/onenand/onenand_sim.c   |   81 +++
 include/linux/mtd/onenand.h         |   18=20
 include/linux/mtd/onenand_regs.h    |   20=20
 6 files changed, 911 insertions(+), 87 deletions(-)

diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-par=
ameters.txt
index 54f21a5..66248aa 100644
=2D-- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -1361,6 +1361,16 @@ and is between 256 and 4096 characters. It is define=
d in the file
 	mtdparts=3D	[MTD]
 			See drivers/mtd/cmdlinepart.c.
=20
+	onenand.bdry=3D	[HW,MTD] Flex-OneNAND Boundary Configuration
+
+			Format: [die0_boundary][,die0_lock][,die1_boundary][,die1_lock]
+
+			boundary - index of last SLC block on Flex-OneNAND.
+				   The remaining blocks are configured as MLC blocks.
+			lock	 - Configure if Flex-OneNAND boundary should be locked.
+				   Once locked, the boundary cannot be changed.
+				   1 indicates lock status, 0 indicates unlock status.
+
 	mtdset=3D		[ARM]
 			ARM/S3C2412 JIVE boot control
=20
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onena=
nd_base.c
index 529af27..0f4fb6e 100644
=2D-- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -9,6 +9,10 @@
  *	auto-placement support, read-while load support, various fixes
  *	Copyright (C) Nokia Corporation, 2007
  *
+ *	Vishak G <vishak.g at samsung.com>, Rohit Hagargundgi <h.rohit at samsu=
ng.com>
+ *	Flex-OneNAND support
+ *	Copyright (C) Samsung Electronics, 2008
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
@@ -27,6 +31,30 @@
=20
 #include <asm/io.h>
=20
+/* Default Flex-OneNAND boundary and lock respectively */
+static int flex_bdry[MAX_DIES * 2] =3D { -1, 0, -1, 0 };
+
+/**
+ *  onenand_oob_128 - oob info for Flex-Onenand with 4KB page
+ *  For now, we expose only 64 out of 80 ecc bytes
+ */
+static struct nand_ecclayout onenand_oob_128 =3D {
+	.eccbytes	=3D 64,
+	.eccpos		=3D {
+		6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
+		22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
+		38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
+		54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
+		70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
+		86, 87, 88, 89, 90, 91, 92, 93, 94, 95,
+		102, 103, 104, 105
+		},
+	.oobfree	=3D {
+		{2, 4}, {18, 4}, {34, 4}, {50, 4},
+		{66, 4}, {82, 4}, {98, 4}, {114, 4}
+	}
+};
+
 /**
  * onenand_oob_64 - oob info for large (2KB) page
  */
@@ -65,6 +93,14 @@ static const unsigned char ffchars[] =3D {
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
=20
 /**
@@ -171,6 +207,69 @@ static int onenand_buffer_address(int dataram1, int se=
ctors, int count)
 }
=20
 /**
+ * flexonenand_block- For given address return block number
+ * @param this         - OneNAND device structure
+ * @param addr		- Address for which block number is needed
+ */
+static unsigned flexonenand_block(struct onenand_chip *this, loff_t addr)
+{
+	unsigned boundary, blk, die =3D 0;
+
+	if (ONENAND_IS_DDP(this) && addr >=3D this->diesize[0]) {
+		die =3D 1;
+		addr -=3D this->diesize[0];
+	}
+
+	boundary =3D this->boundary[die];
+
+	blk =3D addr >> (this->erase_shift - 1);
+	if (blk > boundary)
+		blk =3D (blk + boundary + 1) >> 1;
+
+	blk +=3D die ? this->density_mask : 0;
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
+	loff_t ofs =3D 0;
+	int die =3D 0, boundary;
+
+	if (ONENAND_IS_DDP(this) && block >=3D this->density_mask) {
+		block -=3D this->density_mask;
+		die =3D 1;
+		ofs =3D this->diesize[0];
+	}
+
+	boundary =3D this->boundary[die];
+	ofs +=3D (loff_t)block << (this->erase_shift - 1);
+	if (block > (boundary + 1))
+		ofs +=3D (loff_t)(block - boundary - 1) << (this->erase_shift - 1);
+	return ofs;
+}
+
+inline loff_t onenand_addr(struct onenand_chip *this, int block)
+{
+	if (!FLEXONENAND(this))
+		return (loff_t)block << this->erase_shift;
+	return flexonenand_addr(this, block);
+}
+
+/**
  * onenand_get_density - [DEFAULT] Get OneNAND density
  * @param dev_id	OneNAND device ID
  *
@@ -183,6 +282,21 @@ static inline int onenand_get_density(int dev_id)
 }
=20
 /**
+ * flexonenand_region - [Flex-OneNAND] Return erase region of addr
+ * @param mtd		MTD device structure
+ * @param addr		address whose erase region needs to be identified
+ */
+inline int flexonenand_region(struct mtd_info *mtd, loff_t addr)
+{
+	int i;
+
+	for (i =3D 0; i < mtd->numeraseregions; i++)
+		if (addr < mtd->eraseregions[i].offset)
+			break;
+	return i - 1;
+}
+
+/**
  * onenand_command - [DEFAULT] Send command to OneNAND device
  * @param mtd		MTD device structure
  * @param cmd		the command to be sent
@@ -207,16 +321,28 @@ static int onenand_command(struct mtd_info *mtd, int =
cmd, loff_t addr, size_t le
 		page =3D -1;
 		break;
=20
+	case FLEXONENAND_CMD_PI_ACCESS:
+		/* addr contains die index */
+		block =3D addr * this->density_mask;
+		page =3D -1;
+		break;
+
 	case ONENAND_CMD_ERASE:
 	case ONENAND_CMD_BUFFERRAM:
 	case ONENAND_CMD_OTP_ACCESS:
=2D		block =3D (int) (addr >> this->erase_shift);
+		block =3D onenand_block(this, addr);
 		page =3D -1;
 		break;
=20
+	case FLEXONENAND_CMD_READ_PI:
+		cmd =3D ONENAND_CMD_READ;
+		block =3D addr * this->density_mask;
+		page =3D 0;
+		break;
+
 	default:
=2D		block =3D (int) (addr >> this->erase_shift);
=2D		page =3D (int) (addr >> this->page_shift);
+		block =3D onenand_block(this, addr);
+		page =3D (int) (addr - onenand_addr(this, block)) >> this->page_shift;
=20
 		if (ONENAND_IS_2PLANE(this)) {
 			/* Make the even block number */
@@ -236,7 +362,7 @@ static int onenand_command(struct mtd_info *mtd, int cm=
d, loff_t addr, size_t le
 		value =3D onenand_bufferram_address(this, block);
 		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
=20
=2D		if (ONENAND_IS_2PLANE(this))
+		if (ONENAND_IS_MLC(this) || ONENAND_IS_2PLANE(this))
 			/* It is always BufferRAM0 */
 			ONENAND_SET_BUFFERRAM0(this);
 		else
@@ -258,13 +384,18 @@ static int onenand_command(struct mtd_info *mtd, int =
cmd, loff_t addr, size_t le
=20
 	if (page !=3D -1) {
 		/* Now we use page size operation */
=2D		int sectors =3D 4, count =3D 4;
+		int sectors =3D 0, count =3D 0;
 		int dataram;
=20
 		switch (cmd) {
+		case FLEXONENAND_CMD_RECOVER_LSB:
 		case ONENAND_CMD_READ:
 		case ONENAND_CMD_READOOB:
=2D			dataram =3D ONENAND_SET_NEXT_BUFFERRAM(this);
+			if (ONENAND_IS_MLC(this))
+				/* It is always BufferRAM0 */
+				dataram =3D ONENAND_SET_BUFFERRAM0(this);
+			else
+				dataram =3D ONENAND_SET_NEXT_BUFFERRAM(this);
 			break;
=20
 		default:
@@ -293,6 +424,30 @@ static int onenand_command(struct mtd_info *mtd, int c=
md, loff_t addr, size_t le
 }
=20
 /**
+ * onenand_read_ecc - return ecc status
+ * @param this		onenand chip structure
+ */
+static inline int onenand_read_ecc(struct onenand_chip *this)
+{
+	int ecc, i, result =3D 0;
+
+	if (!FLEXONENAND(this))
+		return this->read_word(this->base + ONENAND_REG_ECC_STATUS);
+
+	for (i =3D 0; i < 4; i++) {
+		ecc =3D this->read_word(this->base + ONENAND_REG_ECC_STATUS + i);
+		if (likely(!ecc))
+			continue;
+		if (ecc & FLEXONENAND_UNCORRECTABLE_ERROR)
+			return ONENAND_ECC_2BIT_ALL;
+		else
+			result =3D ONENAND_ECC_1BIT_ALL;
+	}
+
+	return result;
+}
+
+/**
  * onenand_wait - [DEFAULT] wait until the command is done
  * @param mtd		MTD device structure
  * @param state		state to select the max. timeout value
@@ -331,14 +486,14 @@ static int onenand_wait(struct mtd_info *mtd, int sta=
te)
 	 * power off recovery (POR) test, it should read ECC status first
 	 */
 	if (interrupt & ONENAND_INT_READ) {
=2D		int ecc =3D this->read_word(this->base + ONENAND_REG_ECC_STATUS);
+		int ecc =3D onenand_read_ecc(this);
 		if (ecc) {
 			if (ecc & ONENAND_ECC_2BIT_ALL) {
 				printk(KERN_ERR "onenand_wait: ECC error =3D 0x%04x\n", ecc);
 				mtd->ecc_stats.failed++;
 				return -EBADMSG;
 			} else if (ecc & ONENAND_ECC_1BIT_ALL) {
=2D				printk(KERN_INFO "onenand_wait: correctable ECC error =3D 0x%04x\n",=
 ecc);
+				printk(KERN_DEBUG "onenand_wait: correctable ECC error =3D 0x%04x\n", =
ecc);
 				mtd->ecc_stats.corrected++;
 			}
 		}
@@ -656,7 +811,7 @@ static int onenand_check_bufferram(struct mtd_info *mtd=
, loff_t addr)
=20
 	if (found && ONENAND_IS_DDP(this)) {
 		/* Select DataRAM for DDP */
=2D		int block =3D (int) (addr >> this->erase_shift);
+		int block =3D onenand_block(this, addr);
 		int value =3D onenand_bufferram_address(this, block);
 		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
 	}
@@ -816,6 +971,149 @@ static int onenand_transfer_auto_oob(struct mtd_info =
*mtd, uint8_t *buf, int col
 }
=20
 /**
+ * onenand_recover_lsb - [Flex-OneNAND] Recover LSB page data
+ * @param mtd		MTD device structure
+ * @param addr		address to recover
+ * @param status	return value from onenand_wait / onenand_bbt_wait
+ *
+ * MLC NAND Flash cell has paired pages - LSB page and MSB page. LSB page =
has
+ * lower page address and MSB page has higher page address in paired pages.
+ * If power off occurs during MSB page program, the paired LSB page data c=
an
+ * become corrupt. LSB page recovery read is a way to read LSB page though=
 page
+ * data are corrupted. When uncorrectable error occurs as a result of LSB =
page
+ * read after power up, issue LSB page recovery read.
+ */
+static int onenand_recover_lsb(struct mtd_info *mtd, loff_t addr, int stat=
us)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	int i;
+
+	/* Recovery is only for Flex-OneNAND */
+	if (!FLEXONENAND(this))
+		return status;
+
+	/* check if we failed due to uncorrectable error */
+	if (status !=3D -EBADMSG && status !=3D ONENAND_BBT_READ_ECC_ERROR)
+		return status;
+
+	/* check if address lies in MLC region */
+	i =3D flexonenand_region(mtd, addr);
+	if (mtd->eraseregions[i].erasesize < (1 << this->erase_shift))
+		return status;
+
+	/* We are attempting to reread, so decrement stats.failed
+	 * which was incremented by onenand_wait due to read failure
+	 */
+	printk(KERN_INFO "onenand_recover_lsb: Attempting to recover from uncorre=
ctable read\n");
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
+	struct onenand_chip *this =3D mtd->priv;
+	struct mtd_ecc_stats stats;
+	size_t len =3D ops->len;
+	size_t ooblen =3D ops->ooblen;
+	u_char *buf =3D ops->datbuf;
+	u_char *oobbuf =3D ops->oobbuf;
+	int read =3D 0, column, thislen;
+	int oobread =3D 0, oobcolumn, thisooblen, oobsize;
+	int ret =3D 0;
+	int writesize =3D this->writesize;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_mlc_read_ops_nolock: from =3D 0x%08x, le=
n =3D %i\n", (unsigned int) from, (int) len);
+
+	if (ops->mode =3D=3D MTD_OOB_AUTO)
+		oobsize =3D this->ecclayout->oobavail;
+	else
+		oobsize =3D mtd->oobsize;
+
+	oobcolumn =3D from & (mtd->oobsize - 1);
+
+	/* Do not allow reads past end of device */
+	if (from + len > mtd->size) {
+		printk(KERN_ERR "onenand_mlc_read_ops_nolock: Attempt read beyond end of=
 device\n");
+		ops->retlen =3D 0;
+		ops->oobretlen =3D 0;
+		return -EINVAL;
+	}
+
+	stats =3D mtd->ecc_stats;
+
+	while (read < len) {
+		cond_resched();
+
+		thislen =3D min_t(int, writesize, len - read);
+
+		column =3D from & (writesize - 1);
+		if (column + thislen > writesize)
+			thislen =3D writesize - column;
+
+		if (!onenand_check_bufferram(mtd, from)) {
+			this->command(mtd, ONENAND_CMD_READ, from, writesize);
+
+			ret =3D this->wait(mtd, FL_READING);
+			if (unlikely(ret))
+				ret =3D onenand_recover_lsb(mtd, from, ret);
+			onenand_update_bufferram(mtd, from, !ret);
+			if (ret =3D=3D -EBADMSG)
+				ret =3D 0;
+		}
+
+		this->read_bufferram(mtd, ONENAND_DATARAM, buf, column, thislen);
+		if (oobbuf) {
+			thisooblen =3D oobsize - oobcolumn;
+			thisooblen =3D min_t(int, thisooblen, ooblen - oobread);
+
+			if (ops->mode =3D=3D MTD_OOB_AUTO)
+				onenand_transfer_auto_oob(mtd, oobbuf, oobcolumn, thisooblen);
+			else
+				this->read_bufferram(mtd, ONENAND_SPARERAM, oobbuf, oobcolumn, thisoob=
len);
+			oobread +=3D thisooblen;
+			oobbuf +=3D thisooblen;
+			oobcolumn =3D 0;
+		}
+
+		read +=3D thislen;
+		if (read =3D=3D len)
+			break;
+
+		from +=3D thislen;
+		buf +=3D thislen;
+	}
+
+	/*
+	 * Return success, if no ECC failures, else -EBADMSG
+	 * fs driver will take care of that, because
+	 * retlen =3D=3D desired len and result =3D=3D -EBADMSG
+	 */
+	ops->retlen =3D read;
+	ops->oobretlen =3D oobread;
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
  * onenand_read_ops_nolock - [OneNAND Interface] OneNAND read main and/or =
out-of-band
  * @param mtd		MTD device structure
  * @param from		offset to read from
@@ -962,7 +1260,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mt=
d, loff_t from,
 	size_t len =3D ops->ooblen;
 	mtd_oob_mode_t mode =3D ops->mode;
 	u_char *buf =3D ops->oobbuf;
=2D	int ret =3D 0;
+	int ret =3D 0, readcmd;
=20
 	from +=3D ops->ooboffs;
=20
@@ -993,17 +1291,22 @@ static int onenand_read_oob_nolock(struct mtd_info *=
mtd, loff_t from,
=20
 	stats =3D mtd->ecc_stats;
=20
+	readcmd =3D ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
+
 	while (read < len) {
 		cond_resched();
=20
 		thislen =3D oobsize - column;
 		thislen =3D min_t(int, thislen, len);
=20
=2D		this->command(mtd, ONENAND_CMD_READOOB, from, mtd->oobsize);
+		this->command(mtd, readcmd, from, mtd->oobsize);
=20
 		onenand_update_bufferram(mtd, from, 0);
=20
 		ret =3D this->wait(mtd, FL_READING);
+		if (unlikely(ret))
+			ret =3D onenand_recover_lsb(mtd, from, ret);
+
 		if (ret && ret !=3D -EBADMSG) {
 			printk(KERN_ERR "onenand_read_oob_nolock: read failed =3D 0x%x\n", ret);
 			break;
@@ -1053,6 +1356,7 @@ static int onenand_read_oob_nolock(struct mtd_info *m=
td, loff_t from,
 static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	size_t *retlen, u_char *buf)
 {
+	struct onenand_chip *this =3D mtd->priv;
 	struct mtd_oob_ops ops =3D {
 		.len	=3D len,
 		.ooblen	=3D 0,
@@ -1062,7 +1366,9 @@ static int onenand_read(struct mtd_info *mtd, loff_t =
from, size_t len,
 	int ret;
=20
 	onenand_get_device(mtd, FL_READING);
=2D	ret =3D onenand_read_ops_nolock(mtd, from, &ops);
+	ret =3D ONENAND_IS_MLC(this) ?
+		onenand_mlc_read_ops_nolock(mtd, from, &ops) :
+		onenand_read_ops_nolock(mtd, from, &ops);
 	onenand_release_device(mtd);
=20
 	*retlen =3D ops.retlen;
@@ -1080,6 +1386,7 @@ static int onenand_read(struct mtd_info *mtd, loff_t =
from, size_t len,
 static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
+	struct onenand_chip *this =3D mtd->priv;
 	int ret;
=20
 	switch (ops->mode) {
@@ -1094,7 +1401,9 @@ static int onenand_read_oob(struct mtd_info *mtd, lof=
f_t from,
=20
 	onenand_get_device(mtd, FL_READING);
 	if (ops->datbuf)
=2D		ret =3D onenand_read_ops_nolock(mtd, from, ops);
+		ret =3D ONENAND_IS_MLC(this) ?
+			onenand_mlc_read_ops_nolock(mtd, from, ops) :
+			onenand_read_ops_nolock(mtd, from, ops);
 	else
 		ret =3D onenand_read_oob_nolock(mtd, from, ops);
 	onenand_release_device(mtd);
@@ -1128,11 +1437,11 @@ static int onenand_bbt_wait(struct mtd_info *mtd, i=
nt state)
 	ctrl =3D this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
=20
 	if (interrupt & ONENAND_INT_READ) {
=2D		int ecc =3D this->read_word(this->base + ONENAND_REG_ECC_STATUS);
+		int ecc =3D onenand_read_ecc(this);
 		if (ecc & ONENAND_ECC_2BIT_ALL) {
 			printk(KERN_INFO "onenand_bbt_wait: ecc error =3D 0x%04x"
 				", controller error 0x%04x\n", ecc, ctrl);
=2D			return ONENAND_BBT_READ_ERROR;
+			return ONENAND_BBT_READ_ECC_ERROR;
 		}
 	} else {
 		printk(KERN_ERR "onenand_bbt_wait: read timeout!"
@@ -1163,7 +1472,7 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t=
 from,
 {
 	struct onenand_chip *this =3D mtd->priv;
 	int read =3D 0, thislen, column;
=2D	int ret =3D 0;
+	int ret =3D 0, readcmd;
 	size_t len =3D ops->ooblen;
 	u_char *buf =3D ops->oobbuf;
=20
@@ -1183,17 +1492,22 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff=
_t from,
=20
 	column =3D from & (mtd->oobsize - 1);
=20
+	readcmd =3D ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
+
 	while (read < len) {
 		cond_resched();
=20
 		thislen =3D mtd->oobsize - column;
 		thislen =3D min_t(int, thislen, len);
=20
=2D		this->command(mtd, ONENAND_CMD_READOOB, from, mtd->oobsize);
+		this->command(mtd, readcmd, from, mtd->oobsize);
=20
 		onenand_update_bufferram(mtd, from, 0);
=20
 		ret =3D onenand_bbt_wait(mtd, FL_READING);
+		if (unlikely(ret))
+			ret =3D onenand_recover_lsb(mtd, from, ret);
+
 		if (ret)
 			break;
=20
@@ -1230,9 +1544,11 @@ static int onenand_verify_oob(struct mtd_info *mtd, =
const u_char *buf, loff_t to
 {
 	struct onenand_chip *this =3D mtd->priv;
 	u_char *oob_buf =3D this->oob_buf;
=2D	int status, i;
+	int status, i, readcmd;
=20
=2D	this->command(mtd, ONENAND_CMD_READOOB, to, mtd->oobsize);
+	readcmd =3D ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
+
+	this->command(mtd, readcmd, to, mtd->oobsize);
 	onenand_update_bufferram(mtd, to, 0);
 	status =3D this->wait(mtd, FL_READING);
 	if (status)
@@ -1586,7 +1902,7 @@ static int onenand_write_oob_nolock(struct mtd_info *=
mtd, loff_t to,
 {
 	struct onenand_chip *this =3D mtd->priv;
 	int column, ret =3D 0, oobsize;
=2D	int written =3D 0;
+	int written =3D 0, oobcmd;
 	u_char *oobbuf;
 	size_t len =3D ops->ooblen;
 	const u_char *buf =3D ops->oobbuf;
@@ -1628,6 +1944,8 @@ static int onenand_write_oob_nolock(struct mtd_info *=
mtd, loff_t to,
=20
 	oobbuf =3D this->oob_buf;
=20
+	oobcmd =3D ONENAND_IS_MLC(this) ? ONENAND_CMD_PROG : ONENAND_CMD_PROGOOB;
+
 	/* Loop until all data write */
 	while (written < len) {
 		int thislen =3D min_t(int, oobsize, len - written);
@@ -1645,7 +1963,14 @@ static int onenand_write_oob_nolock(struct mtd_info =
*mtd, loff_t to,
 			memcpy(oobbuf + column, buf, thislen);
 		this->write_bufferram(mtd, ONENAND_SPARERAM, oobbuf, 0, mtd->oobsize);
=20
=2D		this->command(mtd, ONENAND_CMD_PROGOOB, to, mtd->oobsize);
+		if (ONENAND_IS_MLC(this)) {
+			/* Set main area of DataRAM to 0xff*/
+			memset(this->page_buf, 0xff, mtd->writesize);
+			this->write_bufferram(mtd, ONENAND_DATARAM,
+					 this->page_buf, 0, mtd->writesize);
+		}
+
+		this->command(mtd, oobcmd, to, mtd->oobsize);
=20
 		onenand_update_bufferram(mtd, to, 0);
 		if (ONENAND_IS_2PLANE(this)) {
@@ -1768,29 +2093,48 @@ static int onenand_erase(struct mtd_info *mtd, stru=
ct erase_info *instr)
 {
 	struct onenand_chip *this =3D mtd->priv;
 	unsigned int block_size;
=2D	loff_t addr;
=2D	int len;
=2D	int ret =3D 0;
+	loff_t addr =3D instr->addr;
+	loff_t len =3D instr->len;
+	int ret =3D 0, i;
+	struct mtd_erase_region_info *region =3D NULL;
+	loff_t region_end =3D 0;
=20
 	DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start =3D 0x%012llx, len =3D %llu=
\n", (unsigned long long) instr->addr, (unsigned long long) instr->len);
=20
=2D	block_size =3D (1 << this->erase_shift);
=2D
=2D	/* Start address must align on block boundary */
=2D	if (unlikely(instr->addr & (block_size - 1))) {
=2D		printk(KERN_ERR "onenand_erase: Unaligned address\n");
+	/* Do not allow erase past end of device */
+	if (unlikely((len + addr) > mtd->size)) {
+		printk(KERN_ERR "onenand_erase: Erase past end of device\n");
 		return -EINVAL;
 	}
=20
=2D	/* Length must align on block boundary */
=2D	if (unlikely(instr->len & (block_size - 1))) {
=2D		printk(KERN_ERR "onenand_erase: Length not block aligned\n");
=2D		return -EINVAL;
+	if (FLEXONENAND(this)) {
+		/* Find the eraseregion of this address */
+		i =3D flexonenand_region(mtd, addr);
+		region =3D &mtd->eraseregions[i];
+
+		block_size =3D region->erasesize;
+		region_end =3D region->offset + region->erasesize * region->numblocks;
+
+		/* Start address within region must align on block boundary.
+		 * Erase region's start offset is always block start address.
+		 */
+		if (unlikely((addr - region->offset) & (block_size - 1))) {
+			printk(KERN_ERR "onenand_erase: Unaligned address\n");
+			return -EINVAL;
+		}
+	} else {
+		block_size =3D 1 << this->erase_shift;
+
+		/* Start address must align on block boundary */
+		if (unlikely(addr & (block_size - 1))) {
+			printk(KERN_ERR "onenand_erase: Unaligned address\n");
+			return -EINVAL;
+		}
 	}
=20
=2D	/* Do not allow erase past end of device */
=2D	if (unlikely((instr->len + instr->addr) > mtd->size)) {
=2D		printk(KERN_ERR "onenand_erase: Erase past end of device\n");
+	/* Length must align on block boundary */
+	if (unlikely(len & (block_size - 1))) {
+		printk(KERN_ERR "onenand_erase: Length not block aligned\n");
 		return -EINVAL;
 	}
=20
@@ -1800,9 +2144,6 @@ static int onenand_erase(struct mtd_info *mtd, struct=
 erase_info *instr)
 	onenand_get_device(mtd, FL_ERASING);
=20
 	/* Loop throught the pages */
=2D	len =3D instr->len;
=2D	addr =3D instr->addr;
=2D
 	instr->state =3D MTD_ERASING;
=20
 	while (len) {
@@ -1822,7 +2163,8 @@ static int onenand_erase(struct mtd_info *mtd, struct=
 erase_info *instr)
 		ret =3D this->wait(mtd, FL_ERASING);
 		/* Check, if it is write protected */
 		if (ret) {
=2D			printk(KERN_ERR "onenand_erase: Failed erase, block %d\n", (unsigned)=
 (addr >> this->erase_shift));
+			printk(KERN_ERR "onenand_erase: Failed erase, block %d\n",
+						 onenand_block(this, addr));
 			instr->state =3D MTD_ERASE_FAILED;
 			instr->fail_addr =3D addr;
 			goto erase_exit;
@@ -1830,6 +2172,22 @@ static int onenand_erase(struct mtd_info *mtd, struc=
t erase_info *instr)
=20
 		len -=3D block_size;
 		addr +=3D block_size;
+
+		if (addr =3D=3D region_end) {
+			if (!len)
+				break;
+			region++;
+
+			block_size =3D region->erasesize;
+			region_end =3D region->offset + region->erasesize * region->numblocks;
+
+			if (len & (block_size - 1)) {
+				/* FIXME: This should be handled at MTD partitioning level. */
+				printk(KERN_ERR "onenand_erase: Unaligned address\n");
+				goto erase_exit;
+			}
+		}
+
 	}
=20
 	instr->state =3D MTD_ERASE_DONE;
@@ -1908,13 +2266,17 @@ static int onenand_default_block_markbad(struct mtd=
_info *mtd, loff_t ofs)
 	int block;
=20
 	/* Get block number */
=2D	block =3D ((int) ofs) >> bbm->bbt_erase_shift;
+	block =3D onenand_block(this, ofs);
         if (bbm->bbt)
                 bbm->bbt[block >> 2] |=3D 0x01 << ((block & 0x03) << 1);
=20
         /* We write two bytes, so we dont have to mess with 16 bit access =
*/
         ofs +=3D mtd->oobsize + (bbm->badblockpos & ~0x01);
=2D        return onenand_write_oob_nolock(mtd, ofs, &ops);
+	/* FIXME : What to do when marking SLC block in partition
+	 * 	   with MLC erasesize? For now, it is not advisable to
+	 *	   create partitions containing both SLC and MLC regions.
+	 */
+	return onenand_write_oob_nolock(mtd, ofs, &ops);
 }
=20
 /**
@@ -1958,8 +2320,8 @@ static int onenand_do_lock_cmd(struct mtd_info *mtd, =
loff_t ofs, size_t len, int
 	int start, end, block, value, status;
 	int wp_status_mask;
=20
=2D	start =3D ofs >> this->erase_shift;
=2D	end =3D len >> this->erase_shift;
+	start =3D onenand_block(this, ofs);
+	end =3D onenand_block(this, ofs + len) - 1;
=20
 	if (cmd =3D=3D ONENAND_CMD_LOCK)
 		wp_status_mask =3D ONENAND_WP_LS;
@@ -1971,7 +2333,7 @@ static int onenand_do_lock_cmd(struct mtd_info *mtd, =
loff_t ofs, size_t len, int
 		/* Set start block address */
 		this->write_word(start, this->base + ONENAND_REG_START_BLOCK_ADDRESS);
 		/* Set end block address */
=2D		this->write_word(start + end - 1, this->base + ONENAND_REG_END_BLOCK_A=
DDRESS);
+		this->write_word(end, this->base +  ONENAND_REG_END_BLOCK_ADDRESS);
 		/* Write lock command */
 		this->command(mtd, cmd, 0, 0);
=20
@@ -1992,7 +2354,7 @@ static int onenand_do_lock_cmd(struct mtd_info *mtd, =
loff_t ofs, size_t len, int
 	}
=20
 	/* Block lock scheme */
=2D	for (block =3D start; block < start + end; block++) {
+	for (block =3D start; block < end + 1; block++) {
 		/* Set block address */
 		value =3D onenand_block_address(this, block);
 		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS1);
@@ -2100,7 +2462,7 @@ static void onenand_unlock_all(struct mtd_info *mtd)
 {
 	struct onenand_chip *this =3D mtd->priv;
 	loff_t ofs =3D 0;
=2D	size_t len =3D this->chipsize;
+	loff_t len =3D mtd->size;
=20
 	if (this->options & ONENAND_HAS_UNLOCK_ALL) {
 		/* Set start block address */
@@ -2121,7 +2483,7 @@ static void onenand_unlock_all(struct mtd_info *mtd)
 			return;
=20
 		/* Workaround for all block unlock in DDP */
=2D		if (ONENAND_IS_DDP(this)) {
+		if (ONENAND_IS_DDP(this) && !FLEXONENAND(this)) {
 			/* All blocks on another chip */
 			ofs =3D this->chipsize >> 1;
 			len =3D this->chipsize >> 1;
@@ -2163,7 +2525,9 @@ static int do_otp_read(struct mtd_info *mtd, loff_t f=
rom, size_t len,
 	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
 	this->wait(mtd, FL_OTPING);
=20
=2D	ret =3D onenand_read_ops_nolock(mtd, from, &ops);
+	ret =3D ONENAND_IS_MLC(this) ?
+		onenand_mlc_read_ops_nolock(mtd, from, &ops) :
+		onenand_read_ops_nolock(mtd, from, &ops);
=20
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
@@ -2230,21 +2594,32 @@ static int do_otp_lock(struct mtd_info *mtd, loff_t=
 from, size_t len,
 		size_t *retlen, u_char *buf)
 {
 	struct onenand_chip *this =3D mtd->priv;
=2D	struct mtd_oob_ops ops =3D {
=2D		.mode =3D MTD_OOB_PLACE,
=2D		.ooblen =3D len,
=2D		.oobbuf =3D buf,
=2D		.ooboffs =3D 0,
=2D	};
+	struct mtd_oob_ops ops;
 	int ret;
=20
 	/* Enter OTP access mode */
 	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
 	this->wait(mtd, FL_OTPING);
=20
=2D	ret =3D onenand_write_oob_nolock(mtd, from, &ops);
=2D
=2D	*retlen =3D ops.oobretlen;
+	if (FLEXONENAND(this)) {
+		/*
+		 * For Flex-OneNAND, we write lock mark to 1st word of sector 4 of
+		 * main area of page 49.
+		 */
+		ops.len =3D mtd->writesize;
+		ops.ooblen =3D 0;
+		ops.datbuf =3D buf;
+		ops.oobbuf =3D NULL;
+		ret =3D onenand_write_ops_nolock(mtd, mtd->writesize * 49, &ops);
+		*retlen =3D ops.retlen;
+	} else {
+		ops.mode =3D MTD_OOB_PLACE;
+		ops.ooblen =3D len;
+		ops.oobbuf =3D buf;
+		ops.ooboffs =3D 0;
+		ret =3D onenand_write_oob_nolock(mtd, from, &ops);
+		*retlen =3D ops.oobretlen;
+	}
=20
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
@@ -2428,27 +2803,34 @@ static int onenand_lock_user_prot_reg(struct mtd_in=
fo *mtd, loff_t from,
 			size_t len)
 {
 	struct onenand_chip *this =3D mtd->priv;
=2D	u_char *oob_buf =3D this->oob_buf;
+	u_char *buf =3D FLEXONENAND(this) ? this->page_buf : this->oob_buf;
 	size_t retlen;
 	int ret;
=20
=2D	memset(oob_buf, 0xff, mtd->oobsize);
+	memset(buf, 0xff, FLEXONENAND(this) ? this->writesize
+						 : mtd->oobsize);
 	/*
 	 * Note: OTP lock operation
 	 *       OTP block : 0xXXFC
 	 *       1st block : 0xXXF3 (If chip support)
 	 *       Both      : 0xXXF0 (If chip support)
 	 */
=2D	oob_buf[ONENAND_OTP_LOCK_OFFSET] =3D 0xFC;
+	if (FLEXONENAND(this))
+		buf[FLEXONENAND_OTP_LOCK_OFFSET] =3D 0xFC;
+	else
+		buf[ONENAND_OTP_LOCK_OFFSET] =3D 0xFC;
=20
 	/*
 	 * Write lock mark to 8th word of sector0 of page0 of the spare0.
 	 * We write 16 bytes spare area instead of 2 bytes.
+	 * For Flex-OneNAND, we write lock mark to 1st word of sector 4 of
+	 * main area of page 49.
 	 */
+
 	from =3D 0;
=2D	len =3D 16;
+	len =3D FLEXONENAND(this) ? mtd->writesize : 16;
=20
=2D	ret =3D onenand_otp_walk(mtd, from, len, &retlen, oob_buf, do_otp_lock,=
 MTD_OTP_USER);
+	ret =3D onenand_otp_walk(mtd, from, len, &retlen, buf, do_otp_lock, MTD_O=
TP_USER);
=20
 	return ret ? : retlen;
 }
@@ -2495,6 +2877,14 @@ static void onenand_check_features(struct mtd_info *=
mtd)
 		break;
 	}
=20
+	if (ONENAND_IS_MLC(this))
+		this->options &=3D ~ONENAND_HAS_2PLANE;
+
+	if (FLEXONENAND(this)) {
+		this->options &=3D ~ONENAND_HAS_CONT_LOCK;
+		this->options |=3D ONENAND_HAS_UNLOCK_ALL;
+	}
+
 	if (this->options & ONENAND_HAS_CONT_LOCK)
 		printk(KERN_DEBUG "Lock scheme is Continuous Lock\n");
 	if (this->options & ONENAND_HAS_UNLOCK_ALL)
@@ -2512,14 +2902,16 @@ static void onenand_check_features(struct mtd_info =
*mtd)
  */
 static void onenand_print_device_info(int device, int version)
 {
=2D        int vcc, demuxed, ddp, density;
+	int vcc, demuxed, ddp, density, flexonenand;
=20
         vcc =3D device & ONENAND_DEVICE_VCC_MASK;
         demuxed =3D device & ONENAND_DEVICE_IS_DEMUX;
         ddp =3D device & ONENAND_DEVICE_IS_DDP;
         density =3D onenand_get_density(device);
=2D        printk(KERN_INFO "%sOneNAND%s %dMB %sV 16-bit (0x%02x)\n",
=2D                demuxed ? "" : "Muxed ",
+	flexonenand =3D device & DEVICE_IS_FLEXONENAND;
+	printk(KERN_INFO "%s%sOneNAND%s %dMB %sV 16-bit (0x%02x)\n",
+		demuxed ? "" : "Muxed ",
+		flexonenand ? "Flex-" : "",
                 ddp ? "(DDP)" : "",
                 (16 << density),
                 vcc ? "2.65/3.3" : "1.8",
@@ -2558,6 +2950,280 @@ static int onenand_check_maf(int manuf)
 }
=20
 /**
+* flexonenand_get_boundary	- Reads the SLC boundary
+* @param onenand_info		- onenand info structure
+**/
+static int flexonenand_get_boundary(struct mtd_info *mtd)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	unsigned die, bdry;
+	int ret, syscfg, locked;
+
+	/* Disable ECC */
+	syscfg =3D this->read_word(this->base + ONENAND_REG_SYS_CFG1);
+	this->write_word((syscfg | 0x0100), this->base + ONENAND_REG_SYS_CFG1);
+
+	for (die =3D 0; die < this->dies; die++) {
+		this->command(mtd, FLEXONENAND_CMD_PI_ACCESS, die, 0);
+		this->wait(mtd, FL_SYNCING);
+
+		this->command(mtd, FLEXONENAND_CMD_READ_PI, die, 0);
+		ret =3D this->wait(mtd, FL_READING);
+
+		bdry =3D this->read_word(this->base + ONENAND_DATARAM);
+		if ((bdry >> FLEXONENAND_PI_UNLOCK_SHIFT) =3D=3D 3)
+			locked =3D 0;
+		else
+			locked =3D 1;
+		this->boundary[die] =3D bdry & FLEXONENAND_PI_MASK;
+
+		this->command(mtd, ONENAND_CMD_RESET, 0, 0);
+		ret =3D this->wait(mtd, FL_RESETING);
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
+	struct onenand_chip *this =3D mtd->priv;
+	int die, i, eraseshift, density;
+	int blksperdie, maxbdry;
+	loff_t ofs;
+
+	density =3D onenand_get_density(this->device_id);
+	blksperdie =3D ((loff_t)(16 << density) << 20) >> (this->erase_shift);
+	blksperdie >>=3D ONENAND_IS_DDP(this) ? 1 : 0;
+	maxbdry =3D blksperdie - 1;
+	eraseshift =3D this->erase_shift - 1;
+
+	mtd->numeraseregions =3D this->dies << 1;
+
+	/* This fills up the device boundary */
+	flexonenand_get_boundary(mtd);
+	die =3D ofs =3D 0;
+	i =3D -1;
+	for (; die < this->dies; die++) {
+		if (!die || this->boundary[die-1] !=3D maxbdry) {
+			i++;
+			mtd->eraseregions[i].offset =3D ofs;
+			mtd->eraseregions[i].erasesize =3D 1 << eraseshift;
+			mtd->eraseregions[i].numblocks =3D
+							this->boundary[die] + 1;
+			ofs +=3D mtd->eraseregions[i].numblocks << eraseshift;
+			eraseshift++;
+		} else {
+			mtd->numeraseregions -=3D 1;
+			mtd->eraseregions[i].numblocks +=3D
+							this->boundary[die] + 1;
+			ofs +=3D (this->boundary[die] + 1) << (eraseshift - 1);
+		}
+		if (this->boundary[die] !=3D maxbdry) {
+			i++;
+			mtd->eraseregions[i].offset =3D ofs;
+			mtd->eraseregions[i].erasesize =3D 1 << eraseshift;
+			mtd->eraseregions[i].numblocks =3D maxbdry ^
+							 this->boundary[die];
+			ofs +=3D mtd->eraseregions[i].numblocks << eraseshift;
+			eraseshift--;
+		} else
+			mtd->numeraseregions -=3D 1;
+	}
+
+	/* Expose MLC erase size except when all blocks are SLC */
+	mtd->erasesize =3D 1 << this->erase_shift;
+	if (mtd->numeraseregions =3D=3D 1)
+		mtd->erasesize >>=3D 1;
+
+	printk(KERN_INFO "Device has %d eraseregions\n", mtd->numeraseregions);
+	for (i =3D 0; i < mtd->numeraseregions; i++)
+		printk(KERN_INFO "[offset: 0x%08x, erasesize: 0x%05x,"
+			" numblocks: %04u]\n",
+			(unsigned int) mtd->eraseregions[i].offset,
+			mtd->eraseregions[i].erasesize,
+			mtd->eraseregions[i].numblocks);
+
+	for (die =3D 0, mtd->size =3D 0; die < this->dies; die++) {
+		this->diesize[die] =3D (loff_t)blksperdie << this->erase_shift;
+		this->diesize[die] -=3D (loff_t)(this->boundary[die] + 1)
+						 << (this->erase_shift - 1);
+		mtd->size +=3D this->diesize[die];
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
+static int flexonenand_check_blocks_erased(struct mtd_info *mtd, int start=
, int end)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	int i, ret;
+	int block;
+	struct mtd_oob_ops ops =3D {
+		.mode =3D MTD_OOB_PLACE,
+		.ooboffs =3D 0,
+		.ooblen	=3D mtd->oobsize,
+		.datbuf	=3D NULL,
+		.oobbuf	=3D this->oob_buf,
+	};
+	loff_t addr;
+
+	printk(KERN_DEBUG "Check blocks from %d to %d\n", start, end);
+
+	for (block =3D start; block <=3D end; block++) {
+		addr =3D flexonenand_addr(this, block);
+		if (onenand_block_isbad_nolock(mtd, addr, 0))
+			continue;
+
+		/*
+		 * Since main area write results in ECC write to spare,
+		 * it is sufficient to check only ECC bytes for change.
+		 */
+		ret =3D onenand_read_oob_nolock(mtd, addr, &ops);
+		if (ret)
+			return ret;
+
+		for (i =3D 0; i < mtd->oobsize; i++)
+			if (this->oob_buf[i] !=3D 0xff)
+				break;
+
+		if (i !=3D mtd->oobsize) {
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
+	struct onenand_chip *this =3D mtd->priv;
+	int ret, density, blksperdie, old, new, thisboundary;
+	loff_t addr;
+
+	/* Change only once for SDP Flex-OneNAND */
+	if (die && (!ONENAND_IS_DDP(this)))
+		return 0;
+
+	/* boundary value of -1 indicates no required change */
+	if (boundary < 0 || boundary =3D=3D this->boundary[die])
+		return 0;
+
+	density =3D onenand_get_density(this->device_id);
+	blksperdie =3D ((16 << density) << 20) >> this->erase_shift;
+	blksperdie >>=3D ONENAND_IS_DDP(this) ? 1 : 0;
+
+	if (boundary >=3D blksperdie) {
+		printk(KERN_ERR "flexonenand_set_boundary: Invalid boundary value. "
+				"Boundary not changed.\n");
+		return -EINVAL;
+	}
+
+	/* Check if converting blocks are erased */
+	old =3D this->boundary[die] + (die * this->density_mask);
+	new =3D boundary + (die * this->density_mask);
+	ret =3D flexonenand_check_blocks_erased(mtd, min(old, new) + 1, max(old, =
new));
+	if (ret) {
+		printk(KERN_ERR "flexonenand_set_boundary: Please erase blocks before bo=
undary change\n");
+		return ret;
+	}
+
+	this->command(mtd, FLEXONENAND_CMD_PI_ACCESS, die, 0);
+	this->wait(mtd, FL_SYNCING);
+
+	/* Check is boundary is locked */
+	this->command(mtd, FLEXONENAND_CMD_READ_PI, die, 0);
+	ret =3D this->wait(mtd, FL_READING);
+
+	thisboundary =3D this->read_word(this->base + ONENAND_DATARAM);
+	if ((thisboundary >> FLEXONENAND_PI_UNLOCK_SHIFT) !=3D 3) {
+		printk(KERN_ERR "flexonenand_set_boundary: boundary locked\n");
+		ret =3D 1;
+		goto out;
+	}
+
+	printk(KERN_INFO "flexonenand_set_boundary: Changing die %d boundary: %d%=
s\n",
+			die, boundary, lock ? "(Locked)" : "(Unlocked)");
+
+	addr =3D die ? this->diesize[0] : 0;
+
+	boundary &=3D FLEXONENAND_PI_MASK;
+	boundary |=3D lock ? 0 : (3 << FLEXONENAND_PI_UNLOCK_SHIFT);
+
+	this->command(mtd, ONENAND_CMD_ERASE, addr, 0);
+	ret =3D this->wait(mtd, FL_ERASING);
+	if (ret) {
+		printk(KERN_ERR "flexonenand_set_boundary: Failed PI erase for Die %d\n"=
, die);
+		goto out;
+	}
+
+	this->write_word(boundary, this->base + ONENAND_DATARAM);
+	this->command(mtd, ONENAND_CMD_PROG, addr, 0);
+	ret =3D this->wait(mtd, FL_WRITING);
+	if (ret) {
+		printk(KERN_ERR "flexonenand_set_boundary: Failed PI write for Die %d\n"=
, die);
+		goto out;
+	}
+
+	this->command(mtd, FLEXONENAND_CMD_PI_UPDATE, die, 0);
+	ret =3D this->wait(mtd, FL_WRITING);
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
+	s =3D get_options(s, 5, ints);
+
+	for (i =3D 0; i < ints[0]; i++)
+		flex_bdry[i] =3D ints[i + 1];
+
+	return 1;
+}
+
+__setup("onenand.bdry=3D", flexonenand_setup);
+
+/**
  * onenand_probe - [OneNAND Interface] Probe the OneNAND device
  * @param mtd		MTD device structure
  *
@@ -2599,6 +3265,7 @@ static int onenand_probe(struct mtd_info *mtd)
 	maf_id =3D this->read_word(this->base + ONENAND_REG_MANUFACTURER_ID);
 	dev_id =3D this->read_word(this->base + ONENAND_REG_DEVICE_ID);
 	ver_id =3D this->read_word(this->base + ONENAND_REG_VERSION_ID);
+	this->technology =3D this->read_word(this->base + ONENAND_REG_TECHNOLOGY);
=20
 	/* Check OneNAND device */
 	if (maf_id !=3D bram_maf_id || dev_id !=3D bram_dev_id)
@@ -2610,29 +3277,55 @@ static int onenand_probe(struct mtd_info *mtd)
 	this->version_id =3D ver_id;
=20
 	density =3D onenand_get_density(dev_id);
+	if (FLEXONENAND(this)) {
+		this->dies =3D ONENAND_IS_DDP(this) ? 2 : 1;
+		/* Maximum possible erase regions */
+		mtd->numeraseregions =3D this->dies << 1;
+		mtd->eraseregions =3D kzalloc(sizeof(struct mtd_erase_region_info)
+					* (this->dies << 1), GFP_KERNEL);
+		if (!mtd->eraseregions)
+			return -ENOMEM;
+	}
+
+	/*
+	 * For Flex-OneNAND, chipsize represents maximum possible device size.
+	 * mtd->size represents the actual device size.
+	 */
 	this->chipsize =3D (16 << density) << 20;
=2D	/* Set density mask. it is used for DDP */
=2D	if (ONENAND_IS_DDP(this))
=2D		this->density_mask =3D (1 << (density + 6));
=2D	else
=2D		this->density_mask =3D 0;
=20
 	/* OneNAND page size & block size */
 	/* The data buffer size is equal to page size */
 	mtd->writesize =3D this->read_word(this->base + ONENAND_REG_DATA_BUFFER_S=
IZE);
+	/* We use the full BufferRAM */
+	if (ONENAND_IS_MLC(this))
+		mtd->writesize <<=3D 1;
+
 	mtd->oobsize =3D mtd->writesize >> 5;
 	/* Pages per a block are always 64 in OneNAND */
 	mtd->erasesize =3D mtd->writesize << 6;
+	/*
+	 * Flex-OneNAND SLC area has 64 pages per block.
+	 * Flex-OneNAND MLC area has 128 pages per block.
+	 * Expose MLC erase size to find erase_shift and page_mask.
+	 */
+	if (FLEXONENAND(this))
+		mtd->erasesize <<=3D 1;
=20
 	this->erase_shift =3D ffs(mtd->erasesize) - 1;
 	this->page_shift =3D ffs(mtd->writesize) - 1;
 	this->page_mask =3D (1 << (this->erase_shift - this->page_shift)) - 1;
+	/* Set density mask. it is used for DDP */
+	if (ONENAND_IS_DDP(this))
+		this->density_mask =3D this->chipsize >> (this->erase_shift + 1);
 	/* It's real page size */
 	this->writesize =3D mtd->writesize;
=20
 	/* REVIST: Multichip handling */
=20
=2D	mtd->size =3D this->chipsize;
+	if (FLEXONENAND(this))
+		flexonenand_get_size(mtd);
+	else
+		mtd->size =3D this->chipsize;
=20
 	/* Check OneNAND features */
 	onenand_check_features(mtd);
@@ -2687,7 +3380,7 @@ static void onenand_resume(struct mtd_info *mtd)
  */
 int onenand_scan(struct mtd_info *mtd, int maxchips)
 {
=2D	int i;
+	int i, ret;
 	struct onenand_chip *this =3D mtd->priv;
=20
 	if (!this->read_word)
@@ -2749,6 +3442,10 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	 * Allow subpage writes up to oobsize.
 	 */
 	switch (mtd->oobsize) {
+	case 128:
+		this->ecclayout =3D &onenand_oob_128;
+		mtd->subpage_sft =3D 0;
+		break;
 	case 64:
 		this->ecclayout =3D &onenand_oob_64;
 		mtd->subpage_sft =3D 2;
@@ -2814,7 +3511,16 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	/* Unlock whole block */
 	onenand_unlock_all(mtd);
=20
=2D	return this->scan_bbt(mtd);
+	ret =3D this->scan_bbt(mtd);
+	if ((!FLEXONENAND(this)) || ret)
+		return ret;
+
+	/* Change Flex-OneNAND boundaries if required */
+	for (i =3D 0; i < MAX_DIES; i++)
+		flexonenand_set_boundary(mtd, i, flex_bdry[2 * i],
+						 flex_bdry[(2 * i) + 1]);
+
+	return 0;
 }
=20
 /**
@@ -2843,6 +3549,7 @@ void onenand_release(struct mtd_info *mtd)
 		kfree(this->page_buf);
 	if (this->options & ONENAND_OOBBUF_ALLOC)
 		kfree(this->oob_buf);
+	kfree(mtd->eraseregions);
 }
=20
 EXPORT_SYMBOL_GPL(onenand_scan);
diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenan=
d_bbt.c
index 2f53b51..a91fcac 100644
=2D-- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -63,6 +63,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,=
 struct nand_bbt_descr
 	loff_t from;
 	size_t readlen, ooblen;
 	struct mtd_oob_ops ops;
+	int rgn;
=20
 	printk(KERN_INFO "Scanning device for bad blocks\n");
=20
@@ -76,7 +77,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,=
 struct nand_bbt_descr
 	/* Note that numblocks is 2 * (real numblocks) here;
 	 * see i +=3D 2 below as it makses shifting and masking less painful
 	 */
=2D	numblocks =3D mtd->size >> (bbm->bbt_erase_shift - 1);
+	numblocks =3D this->chipsize >> (bbm->bbt_erase_shift - 1);
 	startblock =3D 0;
 	from =3D 0;
=20
@@ -106,7 +107,12 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *b=
uf, struct nand_bbt_descr
 			}
 		}
 		i +=3D 2;
=2D		from +=3D (1 << bbm->bbt_erase_shift);
+
+		if (FLEXONENAND(this)) {
+			rgn =3D flexonenand_region(mtd, from);
+			from +=3D mtd->eraseregions[rgn].erasesize;
+		} else
+			from +=3D (1 << bbm->bbt_erase_shift);
 	}
=20
 	return 0;
@@ -143,7 +149,7 @@ static int onenand_isbad_bbt(struct mtd_info *mtd, loff=
_t offs, int allowbbt)
 	uint8_t res;
=20
 	/* Get block number * 2 */
=2D	block =3D (int) (offs >> (bbm->bbt_erase_shift - 1));
+	block =3D (int) (onenand_block(this, offs) << 1);
 	res =3D (bbm->bbt[block >> 3] >> (block & 0x06)) & 0x03;
=20
 	DEBUG(MTD_DEBUG_LEVEL2, "onenand_isbad_bbt: bbt info for offs 0x%08x: (bl=
ock %d) 0x%02x\n",
@@ -178,7 +184,7 @@ int onenand_scan_bbt(struct mtd_info *mtd, struct nand_=
bbt_descr *bd)
 	struct bbm_info *bbm =3D this->bbm;
 	int len, ret =3D 0;
=20
=2D	len =3D mtd->size >> (this->erase_shift + 2);
+	len =3D this->chipsize >> (this->erase_shift + 2);
 	/* Allocate memory (2bit per block) and clear the memory bad block table =
*/
 	bbm->bbt =3D kzalloc(len, GFP_KERNEL);
 	if (!bbm->bbt) {
diff --git a/drivers/mtd/onenand/onenand_sim.c b/drivers/mtd/onenand/onenan=
d_sim.c
index d64200b..f6e3c8a 100644
=2D-- a/drivers/mtd/onenand/onenand_sim.c
+++ b/drivers/mtd/onenand/onenand_sim.c
@@ -6,6 +6,10 @@
  *  Copyright =A9 2005-2007 Samsung Electronics
  *  Kyungmin Park <kyungmin.park@samsung.com>
  *
+ *  Vishak G <vishak.g at samsung.com>, Rohit Hagargundgi <h.rohit at sams=
ung.com>
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
=20
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
 static int manuf_id	=3D CONFIG_ONENAND_SIM_MANUFACTURER;
 static int device_id	=3D CONFIG_ONENAND_SIM_DEVICE_ID;
 static int version_id	=3D CONFIG_ONENAND_SIM_VERSION_ID;
+static int technology_id =3D CONFIG_ONENAND_SIM_TECHNOLOGY_ID;
+static int boundary[] =3D {
+	CONFIG_FLEXONENAND_SIM_DIE0_BOUNDARY,
+	CONFIG_FLEXONENAND_SIM_DIE1_BOUNDARY,
+};
=20
 struct onenand_flash {
 	void __iomem *base;
@@ -57,12 +83,18 @@ struct onenand_flash {
 	(writew(v, this->base + ONENAND_REG_WP_STATUS))
=20
 /* It has all 0xff chars */
=2D#define MAX_ONENAND_PAGESIZE		(2048 + 64)
+#define MAX_ONENAND_PAGESIZE		(4096 + 128)
 static unsigned char *ffchars;
=20
+#if CONFIG_FLEXONENAND
+#define PARTITION_NAME "Flex-OneNAND simulator partition"
+#else
+#define PARTITION_NAME "OneNAND simulator partition"
+#endif
+
 static struct mtd_partition os_partitions[] =3D {
 	{
=2D		.name		=3D "OneNAND simulator partition",
+		.name		=3D PARTITION_NAME,
 		.offset		=3D 0,
 		.size		=3D MTDPART_SIZ_FULL,
 	},
@@ -104,6 +136,7 @@ static void onenand_lock_handle(struct onenand_chip *th=
is, int cmd)
=20
 	switch (cmd) {
 	case ONENAND_CMD_UNLOCK:
+	case ONENAND_CMD_UNLOCK_ALL:
 		if (block_lock_scheme)
 			ONENAND_SET_WP_STATUS(ONENAND_WP_US, this);
 		else
@@ -228,10 +261,12 @@ static void onenand_data_handle(struct onenand_chip *=
this, int cmd,
 {
 	struct mtd_info *mtd =3D &info->mtd;
 	struct onenand_flash *flash =3D this->priv;
=2D	int main_offset, spare_offset;
+	int main_offset, spare_offset, die =3D 0;
 	void __iomem *src;
 	void __iomem *dest;
 	unsigned int i;
+	static int pi_operation;
+	int erasesize, rgn;
=20
 	if (dataram) {
 		main_offset =3D mtd->writesize;
@@ -241,10 +276,27 @@ static void onenand_data_handle(struct onenand_chip *=
this, int cmd,
 		spare_offset =3D 0;
 	}
=20
+	if (pi_operation) {
+		die =3D readw(this->base + ONENAND_REG_START_ADDRESS2);
+		die >>=3D ONENAND_DDP_SHIFT;
+	}
+
 	switch (cmd) {
+	case FLEXONENAND_CMD_PI_ACCESS:
+		pi_operation =3D 1;
+		break;
+
+	case ONENAND_CMD_RESET:
+		pi_operation =3D 0;
+		break;
+
 	case ONENAND_CMD_READ:
 		src =3D ONENAND_CORE(flash) + offset;
 		dest =3D ONENAND_MAIN_AREA(this, main_offset);
+		if (pi_operation) {
+			writew(boundary[die], this->base + ONENAND_DATARAM);
+			break;
+		}
 		memcpy(dest, src, mtd->writesize);
 		/* Fall through */
=20
@@ -257,6 +309,10 @@ static void onenand_data_handle(struct onenand_chip *t=
his, int cmd,
 	case ONENAND_CMD_PROG:
 		src =3D ONENAND_MAIN_AREA(this, main_offset);
 		dest =3D ONENAND_CORE(flash) + offset;
+		if (pi_operation) {
+			boundary[die] =3D readw(this->base + ONENAND_DATARAM);
+			break;
+		}
 		/* To handle partial write */
 		for (i =3D 0; i < (1 << mtd->subpage_sft); i++) {
 			int off =3D i * this->subpagesize;
@@ -284,9 +340,18 @@ static void onenand_data_handle(struct onenand_chip *t=
his, int cmd,
 		break;
=20
 	case ONENAND_CMD_ERASE:
=2D		memset(ONENAND_CORE(flash) + offset, 0xff, mtd->erasesize);
+		if (pi_operation)
+			break;
+
+		if (FLEXONENAND(this)) {
+			rgn =3D flexonenand_region(mtd, offset);
+			erasesize =3D mtd->eraseregions[rgn].erasesize;
+		} else
+			erasesize =3D mtd->erasesize;
+
+		memset(ONENAND_CORE(flash) + offset, 0xff, erasesize);
 		memset(ONENAND_CORE_SPARE(flash, this, offset), 0xff,
=2D		       (mtd->erasesize >> 5));
+		       (erasesize >> 5));
 		break;
=20
 	default:
@@ -339,7 +404,7 @@ static void onenand_command_handle(struct onenand_chip =
*this, int cmd)
 	}
=20
 	if (block !=3D -1)
=2D		offset +=3D block << this->erase_shift;
+		offset =3D onenand_addr(this, block);
=20
 	if (page !=3D -1)
 		offset +=3D page << this->page_shift;
@@ -390,6 +455,7 @@ static int __init flash_init(struct onenand_flash *flas=
h)
 	}
=20
 	density =3D device_id >> ONENAND_DEVICE_DENSITY_SHIFT;
+	density &=3D ONENAND_DEVICE_DENSITY_MASK;
 	size =3D ((16 << 20) << density);
=20
 	ONENAND_CORE(flash) =3D vmalloc(size + (size >> 5));
@@ -405,8 +471,9 @@ static int __init flash_init(struct onenand_flash *flas=
h)
 	writew(manuf_id, flash->base + ONENAND_REG_MANUFACTURER_ID);
 	writew(device_id, flash->base + ONENAND_REG_DEVICE_ID);
 	writew(version_id, flash->base + ONENAND_REG_VERSION_ID);
+	writew(technology_id, flash->base + ONENAND_REG_TECHNOLOGY);
=20
=2D	if (density < 2)
+	if (density < 2 && (!CONFIG_FLEXONENAND))
 		buffer_size =3D 0x0400;	/* 1KiB page */
 	else
 		buffer_size =3D 0x0800;	/* 2KiB page */
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 9aa2a91..cf43e34 100644
=2D-- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -17,6 +17,7 @@
 #include <linux/mtd/onenand_regs.h>
 #include <linux/mtd/bbm.h>
=20
+#define MAX_DIES		2
 #define MAX_BUFFERRAM		2
=20
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
=20
@@ -145,6 +155,8 @@ struct onenand_chip {
 #define ONENAND_SET_BUFFERRAM0(this)		(this->bufferram_index =3D 0)
 #define ONENAND_SET_BUFFERRAM1(this)		(this->bufferram_index =3D 1)
=20
+#define FLEXONENAND(this)						\
+	(this->device_id & DEVICE_IS_FLEXONENAND)
 #define ONENAND_GET_SYS_CFG1(this)					\
 	(this->read_word(this->base + ONENAND_REG_SYS_CFG1))
 #define ONENAND_SET_SYS_CFG1(v, this)					\
@@ -153,6 +165,9 @@ struct onenand_chip {
 #define ONENAND_IS_DDP(this)						\
 	(this->device_id & ONENAND_DEVICE_IS_DDP)
=20
+#define ONENAND_IS_MLC(this)						\
+	(this->technology & ONENAND_TECHNOLOGY_IS_MLC)
+
 #ifdef CONFIG_MTD_ONENAND_2X_PROGRAM
 #define ONENAND_IS_2PLANE(this)						\
 	(this->options & ONENAND_HAS_2PLANE)
@@ -189,5 +204,8 @@ struct onenand_manufacturers {
=20
 int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 			 struct mtd_oob_ops *ops);
+unsigned onenand_block(struct onenand_chip *this, loff_t addr);
+loff_t onenand_addr(struct onenand_chip *this, int block);
+int flexonenand_region(struct mtd_info *mtd, loff_t addr);
=20
 #endif	/* __LINUX_MTD_ONENAND_H */
diff --git a/include/linux/mtd/onenand_regs.h b/include/linux/mtd/onenand_r=
egs.h
index 0c6bbe2..86a6bbe 100644
=2D-- a/include/linux/mtd/onenand_regs.h
+++ b/include/linux/mtd/onenand_regs.h
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
=20
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
=2D#define ONENAND_FPA_MASK		(0x3f)
+/* Note: It's actually 0x3f in case of SLC */
+#define ONENAND_FPA_MASK		(0x7f)
 #define ONENAND_FPA_SHIFT		(2)
 #define ONENAND_FSA_MASK		(0x03)
=20
@@ -105,7 +114,8 @@
 #define ONENAND_BSA_BOOTRAM		(0 << 2)
 #define ONENAND_BSA_DATARAM0		(2 << 2)
 #define ONENAND_BSA_DATARAM1		(3 << 2)
=2D#define ONENAND_BSC_MASK		(0x03)
+/* Note: It's actually 0x03 in case of SLC */
+#define ONENAND_BSC_MASK		(0x07)
=20
 /*
  * Command Register F220h (R/W)
@@ -124,9 +134,13 @@
 #define ONENAND_CMD_RESET		(0xF0)
 #define ONENAND_CMD_OTP_ACCESS		(0x65)
 #define ONENAND_CMD_READID		(0x90)
+#define FLEXONENAND_CMD_PI_UPDATE	(0x05)
+#define FLEXONENAND_CMD_PI_ACCESS	(0x66)
+#define FLEXONENAND_CMD_RECOVER_LSB	(0x05)
=20
 /* NOTE: Those are not *REAL* commands */
 #define ONENAND_CMD_BUFFERRAM		(0x1978)
+#define FLEXONENAND_CMD_READ_PI		(0x1985)
=20
 /*
  * System Configuration 1 Register F221h (R, R/W)
@@ -192,10 +206,12 @@
 #define ONENAND_ECC_1BIT_ALL		(0x5555)
 #define ONENAND_ECC_2BIT		(1 << 1)
 #define ONENAND_ECC_2BIT_ALL		(0xAAAA)
+#define FLEXONENAND_UNCORRECTABLE_ERROR	(0x1010)
=20
 /*
  * One-Time Programmable (OTP)
  */
+#define FLEXONENAND_OTP_LOCK_OFFSET		(2048)
 #define ONENAND_OTP_LOCK_OFFSET		(14)
=20
 #endif	/* __ONENAND_REG_H */
