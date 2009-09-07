Received: from mailout5.samsung.com ([203.254.224.35])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MkamP-0001LW-Gv
	for linux-mtd@lists.infradead.org; Mon, 07 Sep 2009 09:45:02 +0000
Received: from epmmp1 (mailout5.samsung.com [203.254.224.35])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KPL0012HHQT8M@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 07 Sep 2009 18:44:53 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KPL00BYIHQQK9@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 07 Sep 2009 18:44:53 +0900 (KST)
Date: Mon, 07 Sep 2009 15:15:30 +0530
From: Amul Kumar Saha <amul.saha@samsung.com>
Subject: Re: [PATCH] [OneNAND] OTP support re-implementation 1/1
To: dedekind1@gmail.com
Message-id: <E902C77C74C544A3A554DD9881742C04@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <EF4202CC14044212993EE17E6010D5E7@sisodomain.com>
	<87D6E94B11734CE1A253D9AE203F4192@sisodomain.com>
	<4A94CF0A.6060106@gmail.com>
	<6098B9D32DCD48C387EF96034FFFC55D@sisodomain.com>
	<1251466736.3514.10.camel@localhost>
	<A32D4C31541C4D8B9BF6CB4D6EF4B5DC@sisodomain.com>
	<9c9fda240908310234h6cef3afev6a3f6e315321631b@mail.gmail.com>
	<C48D93C7DF3C4F9C96E47BE9D6F51F37@sisodomain.com>
	<4A9E0C47.205@gmail.com>
	<8A3568961C4E4E7495A397D2267B6E37@sisodomain.com>
	<1251958245.5060.6.camel@localhost>
	<FC4F021760EA4F649917598723041422@sisodomain.com>
	<1251976743.5060.13.camel@localhost>
Cc: David Woodhouse <dwmw2@infradead.org>, Kyungmin Park <kmpark@infradead.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

What is OTP in OneNAND?
The device includes,
1. one block-sized OTP (One Time Programmable) area and
2. user-controlled 1st block OTP(Block 0)
that can be used to increase system security or to provide identification capabilities.

What is done?
In OneNAND, one block of the NAND Array is set aside as an OTP memory area, and 1st Block (Block 0)
can be used as OTP area.
This area, available to the user, can be configured and locked with secured user information.
The OTP block can be read, programmed and locked using the same operations as any other NAND Flash
Array
memory block. After issuing an OTP-Lock, OTP block cannot be erased. OTP block is fully-guaranteed
to be a valid block.

Why it is done? (Impact)
Locking the 1st Block OTP has the effect of a 'Write-protect' to guard against accidental
re-programming of data stored in the 1st block and OTP Block.

Which problem it solves?
OTP support is provided in the existing implementation of OneNAND/Flex-OneNAND driver, but it is not
working with OneNAND devices.
Have observed the following in current OTP OneNAND Implmentation,
1. DataSheet specific sequence to lock the OTP Area is not followed.
2. Certain functions are quiet generic to cope with OTP specific activity.
This patch re-implements OTP support for OneNAND device.

How it is done?
For all blocks, 8th word is available to the user.
However,in case of OTP Block, 8th word of sector 0, page 0 is reserved as OTP Locking Bit area.
Therefore, in case of OTP Block, user usage on this area is prohibited.
Condition specific values are entered in the 8th word, sector0, page 0 of the OTP block during the
process of issuing an OTP-Lock.
The possible conditions are:-
1. Only 1st Block Lock
2. Only OTP Block Lock
3. Lock both the 1st Block and the OTP Block

What Other feature additions have been done in this patch?
This patch adds feature for:-
1. Only 1st Block Lock
2. Lock both the 1st Block and the OTP Blocks

Re-implemented OTP support for OneNAND
Added following features to OneNAND
	1. Lock only 1st Block in OneNAND
	2. Lock BOTH 1st Block and OTP Block in OneNAND

Signed-off-by: Amul Kumar Saha <amul.saha@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c |  297 +++++++++++++++++++++++++++++++++----
 include/linux/mtd/onenand.h        |    2
 2 files changed, 267 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 6e82909..43a0963 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -11,7 +11,9 @@
  *
  *	Vishak G <vishak.g at samsung.com>, Rohit Hagargundgi <h.rohit at samsung.com>
  *	Flex-OneNAND support
- *	Copyright (C) Samsung Electronics, 2008
+ *	Amul Kumar Saha <amul.saha@samsung.com>
+ *	OTP support
+ *	Copyright (C) Samsung Electronics, 2009
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -43,6 +45,18 @@ MODULE_PARM_DESC(flex_bdry,	"SLC Boundary information for Flex-OneNAND"
 				"    : 0->Set boundary in unlocked status"
 				"    : 1->Set boundary in locked status");

+/* Default OneNAND/Flex-OneNAND OTP options*/
+static int otp;
+
+module_param(otp, int, 0400);
+MODULE_PARM_DESC(otp,	"Corresponding behaviour of OneNAND in OTP"
+			"Syntax : otp=LOCK_TYPE"
+			"LOCK_TYPE : Keys issued, for specific OTP Lock type"
+			"	   : 0 -> Default (No Blocks Locked)"
+			"	   : 1 -> OTP Block lock"
+			"	   : 2 -> 1st Block lock"
+			"	   : 3 -> BOTH OTP Block and 1st Block lock");
+
 /**
  *  onenand_oob_128 - oob info for Flex-Onenand with 4KB page
  *  For now, we expose only 64 out of 80 ecc bytes
@@ -308,6 +322,81 @@ int flexonenand_region(struct mtd_info *mtd, loff_t addr)
 EXPORT_SYMBOL(flexonenand_region);

 /**
+ * onenand_otp_command - Send OTP specific command to OneNAND device
+ * @param mtd	 MTD device structure
+ * @param cmd	 the command to be sent
+ * @param addr	 offset to read from or write to
+ * @param len	 number of bytes to read or write
+ */
+static int onenand_otp_command(struct mtd_info *mtd, int cmd, loff_t addr,
+				size_t len)
+{
+	struct onenand_chip *this = mtd->priv;
+	int value, block, page;
+
+	/* Address translation */
+	switch (cmd) {
+	case ONENAND_CMD_OTP_ACCESS:
+		block = (int) (addr >> this->erase_shift);
+		page = -1;
+		break;
+
+	default:
+		block = (int) (addr >> this->erase_shift);
+		page = (int) (addr >> this->page_shift);
+
+		if (ONENAND_IS_2PLANE(this)) {
+			/* Make the even block number */
+			block &= ~1;
+			/* Is it the odd plane? */
+			if (addr & this->writesize)
+				block++;
+			page >>= 1;
+		}
+		page &= this->page_mask;
+		break;
+	}
+
+	if (block != -1) {
+		/* Write 'DFS, FBA' of Flash */
+		value = onenand_block_address(this, block);
+		this->write_word(value, this->base +
+				ONENAND_REG_START_ADDRESS1);
+	}
+
+	if (page != -1) {
+		/* Now we use page size operation */
+		int sectors = 4, count = 4;
+		int dataram;
+
+		switch (cmd) {
+		default:
+			if (ONENAND_IS_2PLANE(this) && cmd == ONENAND_CMD_PROG)
+				cmd = ONENAND_CMD_2X_PROG;
+			dataram = ONENAND_CURRENT_BUFFERRAM(this);
+			break;
+		}
+
+		/* Write 'FPA, FSA' of Flash */
+		value = onenand_page_address(page, sectors);
+		this->write_word(value, this->base +
+				ONENAND_REG_START_ADDRESS8);
+
+		/* Write 'BSA, BSC' of DataRAM */
+		value = onenand_buffer_address(dataram, sectors, count);
+		this->write_word(value, this->base + ONENAND_REG_START_BUFFER);
+	}
+
+	/* Interrupt clear */
+	this->write_word(ONENAND_INT_CLEAR, this->base + ONENAND_REG_INTERRUPT);
+
+	/* Write command */
+	this->write_word(cmd, this->base + ONENAND_REG_COMMAND);
+
+	return 0;
+}
+
+/**
  * onenand_command - [DEFAULT] Send command to OneNAND device
  * @param mtd		MTD device structure
  * @param cmd		the command to be sent
@@ -1879,7 +1968,8 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 			onenand_update_bufferram(mtd, prev, !ret && !prev_subpage);
 			if (ret) {
 				written -= prevlen;
-				printk(KERN_ERR "onenand_write_ops_nolock: write filaed %d\n", ret);
+				printk(KERN_ERR "onenand_write_ops_nolock: \
+						write failed %d\n", ret);
 				break;
 			}

@@ -1905,14 +1995,16 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 			/* In partial page write we don't update bufferram */
 			onenand_update_bufferram(mtd, to, !ret && !subpage);
 			if (ret) {
-				printk(KERN_ERR "onenand_write_ops_nolock: write filaed %d\n", ret);
+				printk(KERN_ERR "onenand_write_ops_nolock: \
+						write failed %d\n", ret);
 				break;
 			}

 			/* Only check verify write turn on */
 			ret = onenand_verify(mtd, buf, to, thislen);
 			if (ret) {
-				printk(KERN_ERR "onenand_write_ops_nolock: verify failed %d\n", ret);
+				printk(KERN_ERR "onenand_write_ops_nolock: \
+						verify failed %d\n", ret);
 				break;
 			}

@@ -1945,6 +2037,134 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,


 /**
+ * onenand_otp_write_oob_nolock - [Internal] OneNAND write out-of-band, specific to OTP
+ * @param mtd		MTD device structure
+ * @param to		offset to write to
+ * @param len		number of bytes to write
+ * @param retlen	pointer to variable to store the number of written bytes
+ * @param buf		the data to write
+ *
+ * OneNAND write out-of-band only for OTP
+ */
+static int onenand_otp_write_oob_nolock(struct mtd_info *mtd, loff_t to,
+				    struct mtd_oob_ops *ops)
+{
+	struct onenand_chip *this = mtd->priv;
+	int column, ret = 0, oobsize;
+	int written = 0;
+	u_char *oobbuf;
+	size_t len = ops->ooblen;
+	const u_char *buf = ops->oobbuf;
+	int block, value, status;
+
+	to += ops->ooboffs;
+
+	/* Initialize retlen, in case of early exit */
+	ops->oobretlen = 0;
+
+	oobsize = mtd->oobsize;
+
+	column = to & (mtd->oobsize - 1);
+
+	oobbuf = this->oob_buf;
+
+	/* Loop until all data write */
+	while (written < len) {
+		int thislen = min_t(int, oobsize, len - written);
+
+		cond_resched();
+
+		block = (int) (to >> this->erase_shift);
+		/*
+		 * Write 'DFS, FBA' of Flash
+		 * Add: F100h DQ=DFS, FBA
+		 */
+
+		value = onenand_block_address(this, block);
+		this->write_word(value, this->base +
+				ONENAND_REG_START_ADDRESS1);
+
+		/*
+		 * Select DataRAM for DDP
+		 * Add: F101h DQ=DBS
+		 */
+
+		value = onenand_bufferram_address(this, block);
+		this->write_word(value, this->base +
+				ONENAND_REG_START_ADDRESS2);
+		ONENAND_SET_NEXT_BUFFERRAM(this);
+
+		/*
+		 * Enter OTP access mode
+		 */
+		this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
+		this->wait(mtd, FL_OTPING);
+
+		/* We send data to spare ram with oobsize
+		 * to prevent byte access */
+		memcpy(oobbuf + column, buf, thislen);
+
+		/*
+		 * Write Data into DataRAM
+		 * Add: 8th Word
+		 * in sector0/spare/page0
+		 * DQ=XXFCh
+		 */
+		this->write_bufferram(mtd, ONENAND_SPARERAM,
+					oobbuf, 0, mtd->oobsize);
+
+		onenand_otp_command(mtd, ONENAND_CMD_PROGOOB, to, mtd->oobsize);
+		onenand_update_bufferram(mtd, to, 0);
+		if (ONENAND_IS_2PLANE(this)) {
+			ONENAND_SET_BUFFERRAM1(this);
+			onenand_update_bufferram(mtd, to + this->writesize, 0);
+		}
+
+		ret = this->wait(mtd, FL_WRITING);
+		if (ret) {
+			printk(KERN_ERR "onenand_write_oob_nolock: \
+					write failed %d\n", ret);
+			break;
+		}
+
+		/* Exit OTP access mode */
+		this->command(mtd, ONENAND_CMD_RESET, 0, 0);
+		this->wait(mtd, FL_RESETING);
+
+		status = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
+		status &= 0x60;
+
+		if (status == 0x60) {
+			printk(KERN_DEBUG "\nBLOCK\tSTATUS\n");
+			printk(KERN_DEBUG "1st Block\tLOCKED\n");
+			printk(KERN_DEBUG "OTP Block\tLOCKED\n");
+		} else if (status == 0x20) {
+			printk(KERN_DEBUG "\nBLOCK\tSTATUS\n");
+			printk(KERN_DEBUG "1st Block\tLOCKED\n");
+			printk(KERN_DEBUG "OTP Block\tUN-LOCKED\n");
+		} else if (status == 0x40) {
+			printk(KERN_DEBUG "\nBLOCK\tSTATUS\n");
+			printk(KERN_DEBUG "1st Block\tUN-LOCKED\n");
+			printk(KERN_DEBUG "OTP Block\tLOCKED\n");
+		} else {
+			printk(KERN_DEBUG "Reboot to check\n");
+		}
+
+		written += thislen;
+		if (written == len)
+			break;
+
+		to += mtd->writesize;
+		buf += thislen;
+		column = 0;
+	}
+
+	ops->oobretlen = written;
+
+	return ret;
+}
+
+/**
  * onenand_write_oob_nolock - [Internal] OneNAND write out-of-band
  * @param mtd		MTD device structure
  * @param to		offset to write to
@@ -2659,11 +2879,11 @@ static int do_otp_lock(struct mtd_info *mtd, loff_t from, size_t len,
 	struct mtd_oob_ops ops;
 	int ret;

-	/* Enter OTP access mode */
-	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
-	this->wait(mtd, FL_OTPING);
-
 	if (FLEXONENAND(this)) {
+
+		/* Enter OTP access mode */
+		this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
+		this->wait(mtd, FL_OTPING);
 		/*
 		 * For Flex-OneNAND, we write lock mark to 1st word of sector 4 of
 		 * main area of page 49.
@@ -2674,19 +2894,19 @@ static int do_otp_lock(struct mtd_info *mtd, loff_t from, size_t len,
 		ops.oobbuf = NULL;
 		ret = onenand_write_ops_nolock(mtd, mtd->writesize * 49, &ops);
 		*retlen = ops.retlen;
+
+		/* Exit OTP access mode */
+		this->command(mtd, ONENAND_CMD_RESET, 0, 0);
+		this->wait(mtd, FL_RESETING);
 	} else {
 		ops.mode = MTD_OOB_PLACE;
 		ops.ooblen = len;
 		ops.oobbuf = buf;
 		ops.ooboffs = 0;
-		ret = onenand_write_oob_nolock(mtd, from, &ops);
+		ret = onenand_otp_write_oob_nolock(mtd, from, &ops);
 		*retlen = ops.oobretlen;
 	}

-	/* Exit OTP access mode */
-	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
-	this->wait(mtd, FL_RESETING);
-
 	return ret;
 }

@@ -2717,16 +2937,21 @@ static int onenand_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 	if (density < ONENAND_DEVICE_DENSITY_512Mb)
 		otp_pages = 20;
 	else
-		otp_pages = 10;
+		otp_pages = 50;

 	if (mode == MTD_OTP_FACTORY) {
 		from += mtd->writesize * otp_pages;
-		otp_pages = 64 - otp_pages;
+		otp_pages = ONENAND_PAGES_PER_BLOCK - otp_pages;
 	}

 	/* Check User/Factory boundary */
-	if (((mtd->writesize * otp_pages) - (from + len)) < 0)
-		return 0;
+	if (mode == MTD_OTP_USER) {
+		if (((mtd->writesize * otp_pages) - (from + len)) < 0)
+			return 0;
+	} else {
+		if (((mtd->writesize * otp_pages) - len) < 0)
+			return 0;
+	}

 	onenand_get_device(mtd, FL_OTPING);
 	while (len > 0 && otp_pages > 0) {
@@ -2749,13 +2974,12 @@ static int onenand_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 			*retlen += sizeof(struct otp_info);
 		} else {
 			size_t tmp_retlen;
-			int size = len;

 			ret = action(mtd, from, len, &tmp_retlen, buf);

-			buf += size;
-			len -= size;
-			*retlen += size;
+			buf += tmp_retlen;
+			len -= tmp_retlen;
+			*retlen += tmp_retlen;

 			if (ret)
 				break;
@@ -2868,21 +3092,11 @@ static int onenand_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 	u_char *buf = FLEXONENAND(this) ? this->page_buf : this->oob_buf;
 	size_t retlen;
 	int ret;
+	unsigned int otp_lock_offset = ONENAND_OTP_LOCK_OFFSET;

 	memset(buf, 0xff, FLEXONENAND(this) ? this->writesize
 						 : mtd->oobsize);
 	/*
-	 * Note: OTP lock operation
-	 *       OTP block : 0xXXFC
-	 *       1st block : 0xXXF3 (If chip support)
-	 *       Both      : 0xXXF0 (If chip support)
-	 */
-	if (FLEXONENAND(this))
-		buf[FLEXONENAND_OTP_LOCK_OFFSET] = 0xFC;
-	else
-		buf[ONENAND_OTP_LOCK_OFFSET] = 0xFC;
-
-	/*
 	 * Write lock mark to 8th word of sector0 of page0 of the spare0.
 	 * We write 16 bytes spare area instead of 2 bytes.
 	 * For Flex-OneNAND, we write lock mark to 1st word of sector 4 of
@@ -2892,6 +3106,25 @@ static int onenand_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 	from = 0;
 	len = FLEXONENAND(this) ? mtd->writesize : 16;

+	/*
+	 * Note: OTP lock operation
+	 *       OTP block : 0xXXFC			XX 1111 1100
+	 *       1st block : 0xXXF3 (If chip support)	XX 1111 0011
+	 *       Both      : 0xXXF0 (If chip support)	XX 1111 0000
+	 */
+	if (FLEXONENAND(this))
+		otp_lock_offset = FLEXONENAND_OTP_LOCK_OFFSET;
+
+	/* ONENAND_OTP_AREA | ONENAND_OTP_BLOCK0 | ONENAND_OTP_AREA_BLOCK0 */
+	if (otp == 1)
+		buf[otp_lock_offset] = 0xFC;
+	else if (otp == 2)
+		buf[otp_lock_offset] = 0xF3;
+	else if (otp == 3)
+		buf[otp_lock_offset] = 0xF0;
+	else if (otp != 0)
+		printk(KERN_DEBUG "[OneNAND] Invalid option selected for OTP\n");
+
 	ret = onenand_otp_walk(mtd, from, len, &retlen, buf, do_otp_lock, MTD_OTP_USER);

 	return ret ? : retlen;
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 8ed8733..7bd1512 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -152,6 +152,8 @@ struct onenand_chip {
 /*
  * Helper macros
  */
+#define ONENAND_PAGES_PER_BLOCK        (1<<6)
+
 #define ONENAND_CURRENT_BUFFERRAM(this)		(this->bufferram_index)
 #define ONENAND_NEXT_BUFFERRAM(this)		(this->bufferram_index ^ 1)
 #define ONENAND_SET_NEXT_BUFFERRAM(this)	(this->bufferram_index ^= 1)
