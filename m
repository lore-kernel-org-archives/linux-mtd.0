Received: from mailout5.samsung.com ([203.254.224.35])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KySAg-0001bg-Us
	for linux-mtd@lists.infradead.org; Fri, 07 Nov 2008 14:18:49 +0000
Received: from epmmp1 (mailout5.samsung.com [203.254.224.35])
	by mailout5.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0K9Y005RZVR1BD@mailout5.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 07 Nov 2008 23:18:38 +0900 (KST)
Received: from localhost.localdomain ([107.108.214.120])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0K9Y009SDVQYMU@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 07 Nov 2008 23:18:36 +0900 (KST)
Date: Fri, 07 Nov 2008 19:56:12 +0530
From: Rohit <h.rohit@samsung.com>
Subject: Re: [ANNOUNCE] [PATCH] [MTD] Flex-OneNAND MTD Driver available.
In-reply-to: <49115EC6.9090800@nokia.com>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Message-id: <49145004.9010202@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8BIT
References: <19198934.52871221827459790.JavaMail.weblogic@epml16>
	<9c9fda240809220011w49c0875q804f836550ff3476@mail.gmail.com>
	<000001c91e42$1aa86c50$3dd66c6b@sisodomain.com>
	<9c9fda240809251731y48272a63j988e0001dc50d78@mail.gmail.com>
	<1222404711.5012.5.camel@sauron>
	<A09E9029F2344F78959A3E36179C468E@sisodomain.com>
	<1222417176.5012.17.camel@sauron>
	<000b01c92215$ae62d4e0$3dd66c6b@sisodomain.com>
	<9c9fda240810091557j529495d5q284a8ab0e0d752dd@mail.gmail.com>
	<1224331498.6770.1362.camel@macbook.infradead.org>
	<000001c93271$5c6ab4c0$3dd66c6b@sisodomain.com>
	<1224482040.4466.73.camel@sauron>
	<000301c93411$74627df0$3dd66c6b@sisodomain.com>
	<4901DB27.4020401@nokia.com>
	<000901c93d9f$7c7ed0f0$3dd66c6b@sisodomain.com>
	<49115EC6.9090800@nokia.com>
Cc: 'Kyungmin Park' <kmpark@infradead.org>,
	apgmoorthy <moorthy.apg@samsung.com>,
	'David Woodhouse' <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, amitsharma.9@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian,

Adrian Hunter wrote:
>> +static unsigned flexonenand_get_block(struct onenand_chip *this, loff_t addr,
>> +			   unsigned *isblkslc)
>> +{
>> +	unsigned boundary, blk, die = 0;
>> +
>> +	if (unlikely(this->chipsize == 0))
>> +		/* We have been called by flexonenand_get_boundary.
>> +		 * addr contains die index in this case.
>> +		 */
> 
> This seems to affect only FLEXONENAND_CMD_PI_ACCESS and ONENAND_CMD_READ.
> onenand_command() can be amended to handle FLEXONENAND_CMD_PI_ACCESS,
> and a fake command could be added for the ONENAND_CMD_READ case,
> then this kludge goes away.

Thanks for the suggestion. Fixed.

>> +	/* check if we failed due to uncorrectable error */
>> +	if (status != (-EBADMSG) && status != (ONENAND_BBT_READ_ECC_ERROR))
> 
> Please omit the unnecessary parentheses around -EBADMSG and ONENAND_BBT_READ_ECC_ERROR.

Fixed.

>> +	/* We are attempting to reread, so decrement stats.failed
>> +	 * which was incremented by onenand_wait due to read failure
>> +	 */
>> +	printk(KERN_INFO "Attempting to recover from uncorrectable read\n");
> 
> Message with no source. How about: "onenand_recover_lsb: Attempting to recover from uncorrectable read\n"

Fixed.

>> +	/* Do not allow reads past end of device */
>> +	if ((from + len) > mtd->size) {
> 
> Please omit unnecessary parenthesis

Fixed.

>> +			ret = this->wait(mtd, FL_READING);
>> +			ret = unlikely(ret) ? onenand_recover_lsb(mtd, from, ret) : ret;
> 
> That is unusual syntax.  The following is much more common:

Fixed

>> +	for (die = 0; die < this->dies; die++) {
>> +		this->command(mtd, FLEXONENAND_CMD_PI_ACCESS, die, 0);
>> +		this->wait(mtd, FL_SYNCING);
> 
> Why is the error return not checked?
> 
>> +
>> +		this->command(mtd, ONENAND_CMD_READ, die, 0);
>> +		ret = this->wait(mtd, FL_READING);
> 
> Why is the error return not checked?
> 
>> +
>> +		bdry = this->read_word(this->base + ONENAND_DATARAM);
>> +		locked = bdry >> FLEXONENAND_PI_UNLOCK_SHIFT;
>> +		locked = (locked == 0x3) ? 0 : 1;
>> +		this->boundary[die] = bdry & FLEXONENAND_PI_MASK;
>> +		this->boundary_locked[die] = locked;
>> +		this->command(mtd, ONENAND_CMD_RESET, 0, 0);
>> +		ret = this->wait(mtd, FL_RESETING);
> 
> Why is the error return not checked?

As per datasheet PI_ACCESS, PI_UPDATE, PI_READ and RESET always succeed.
PI_ERASE and PI_WRITE can fail. Added error check for PI_ERASE.

>> +		printk(KERN_ERR "Failed PI update for Die %d\n", die);
>> +	else
>> +		printk(KERN_INFO "Done\n");
>> +out:
>> +	this->write_word(ONENAND_CMD_RESET, this->base + ONENAND_REG_COMMAND);
>> +	this->wait(mtd, FL_RESETING);
>> +	if (!ret)
>> +		/* Recalculate device size on boundary change*/
>> +		flexonenand_get_size(mtd);
>> +	return ret;
>> +}
> 
> The functions above often use 'printk()' but do not identify the message source.
> I suggest adding the function name e.g. "flexonenand_set_boundary: blah blah"
> 
> Also using line continuations for strings results in the string
> containing unwanted tabs and spaces. e.g.
> 
> 				"Invalid boundary value.\
> 					 Boundary not changed.\n"
> 
> results in:
> 
> "Invalid boundary value.					 Boundary not changed.\n"
> 
> Instead you can just close and reopen the string e.g.
> 				"Invalid boundary value."
> 					" Boundary not changed.\n"

Fixed

>> +	if (FLEXONENAND(this)) {
>> +		int boundary[] =
>> +			{FLEXONENAND_DIE0_BOUNDARY, FLEXONENAND_DIE1_BOUNDARY};
>> +		int lock[] =
>> +			{FLEXONENAND_DIE0_ISLOCKED, FLEXONENAND_DIE1_ISLOCKED};
>> +		unsigned die;
>> +
>> +		flexonenand_get_size(mtd);
>> +
>> +		/* Change the device boundaries if required */
>> +		for (die = 0; die < this->dies; die++)
>> +			if ((!this->boundary_locked[die]) &&
>> +			   (boundary[die] >= 0) &&
>> +			   (boundary[die] != this->boundary[die]))
>> +				flexonenand_set_boundary(mtd, die,
>> +						 boundary[die], lock[die]);
> 
> I am not sure how you intend FLEXONENAND_DIEx_BOUNDARY and FLEXONENAND_DIEx_ISLOCKED
> to be used.  Obviously this code presently does nothing.  If you expect the values
> to be configured for the device, then shouldn't they be config options?

Ok. Added config option for boundary and lock settings.
Configuration of boundary / lock is optional. Default value in config is -1
which will not change existing boundary of Flex-OneNAND.

> 
> Also, ideally there should be a way for the platform driver to override them.
> 

Do you mean runtime configuration of boundary. Then we need to add some ioctl.

>> +	if (FLEXONENAND(this))
>> +		kfree(mtd->eraseregions);
> 
> You can drop the "if (FLEXONENAND(this))", since mtd->eraseregions will
> be NULL if it hasn't been allocated.

ok

>> +		if (FLEXONENAND(this)) {
>> +			onenand_get_block(this, from, &slc);
>> +			from += (1 << bbm->bbt_erase_shift) >> 1;
>> +			if (!slc)
>> +				from += (1 << bbm->bbt_erase_shift) >> 1;
> 
> I think the following syntax is clearer:
> 
> 			if (slc)
> 				from += (1 << bbm->bbt_erase_shift) >> 1;
> 			else
> 				from += (1 << bbm->bbt_erase_shift);

ok. Fixed.

>>   * @chipsize:		[INTERN] the size of one chip for multichip arrays
> 
> 'chipsize' was never properly implemented for multichip devices (it was always
> the same as mtd->size) and it now has another meaning.  For Flex-OneNAND, it is
> the maximum device size.  Please update the comments accordingly.  It is really
> a FIXME.

For now it is FIXME. will fix it

Also, onenand_erase is more readable now.

Thanks,
Rohit

 drivers/mtd/onenand/Kconfig        |   62 +++
 drivers/mtd/onenand/onenand_base.c |  735 +++++++++++++++++++++++++++++++++----
 drivers/mtd/onenand/onenand_bbt.c  |   13 
 drivers/mtd/onenand/onenand_sim.c  |  105 ++++-
 include/linux/mtd/onenand.h        |   34 +
 include/linux/mtd/onenand_regs.h   |   20 -
 6 files changed, 883 insertions(+), 86 deletions(-)

Signed-off-by: Vishak G <vishak.g@samsung.com>
Signed-off-by: Rohit Hagargundgi <h.rohit@samsung.com>
---
diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index 79fa79e..0c8fa54 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -71,4 +71,66 @@ config MTD_ONENAND_SIM
 	  The simulator may simulate various OneNAND flash chips for the
 	  OneNAND MTD layer.
 
+config MTD_FLEXONENAND_BOUNDARY
+	bool "Flex-OneNAND Boundary Configuration"
+	depends on MTD_ONENAND
+	default n
+	help
+	  Set SLC and MLC regions of Flex-OneNAND
+
+config MTD_FLEXONENAND_DIE0_BOUNDARY
+	int "Last SLC Block of Flex-OneNAND (min = 0, max = 1023)"
+	depends on MTD_ONENAND && MTD_FLEXONENAND_BOUNDARY
+	default "-1"
+	help
+	  Configure Partition Information (PI) of Flex-OneNAND
+
+	  Entered value indicates index of last SLC block on Flex-OneNAND.
+	  The remaining blocks are configured as MLC blocks.
+
+	  A value of -1 means that PI remains unchanged.
+
+	  This setting applies to :
+		- SDP Flex-OneNAND
+		- Die 1 of DDP Flex-OneNAND.
+
+config MTD_FLEXONENAND_DIE0_ISLOCKED
+	bool "Lock Boundary of Flex-OneNAND"
+	depends on MTD_ONENAND && MTD_FLEXONENAND_BOUNDARY
+	default n
+	help
+	  Configure if Flex-OneNAND boundary should be locked.
+	  Once locked, the boundary cannot be changed.
+
+	  This setting applies to :
+		- SDP Flex-OneNAND
+		- Die 1 of DDP Flex-OneNAND
+
+config MTD_FLEXONENAND_DDP_BOUNDARY
+	bool "Flex-OneNAND DDP Boundary Configuration"
+	depends on MTD_ONENAND && MTD_FLEXONENAND_BOUNDARY
+	default n
+	help
+	  Set SLC and MLC regions of Die 2 of Flex-OneNAND DDP
+
+config MTD_FLEXONENAND_DIE1_BOUNDARY
+	int "Last SLC Block of Flex-OneNAND Die 2 (min = 0, max = 1023)"
+	depends on MTD_ONENAND && MTD_FLEXONENAND_BOUNDARY && MTD_FLEXONENAND_DDP_BOUNDARY
+	default "-1"
+	help
+	  Configure Partition Information (PI) for Die 2 of DDP Flex-OneNAND.
+
+	  Entered value indicates index of last SLC block on Flex-OneNAND.
+	  The remaining blocks are configured as MLC blocks.
+
+	  A value of -1 means that PI remains unchanged.
+
+config MTD_FLEXONENAND_DIE1_ISLOCKED
+	bool "Lock Boundary of Flex-OneNAND Die 2"
+	depends on MTD_ONENAND && MTD_FLEXONENAND_BOUNDARY && MTD_FLEXONENAND_DDP_BOUNDARY
+	default n
+	help
+	  Configure if boundary for Die 2 of DDP Flex-OneNAND should be locked.
+	  Once locked, the boundary cannot be changed.
+
 endif # MTD_ONENAND
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 90ed319..007766d 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
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
@@ -28,6 +32,27 @@
 #include <asm/io.h>
 
 /**
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
+/**
  * onenand_oob_64 - oob info for large (2KB) page
  */
 static struct nand_ecclayout onenand_oob_64 = {
@@ -65,6 +90,14 @@ static const unsigned char ffchars[] = {
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
@@ -171,6 +204,43 @@ static int onenand_buffer_address(int dataram1, int sectors, int count)
 }
 
 /**
+ * flexonenand_get_block- For given address return block number and if slc
+ * @param this         - OneNAND device structure
+ * @param addr		- Address for which block number is needed
+ * @return isblkslc	- Block is an SLC block or not
+ */
+static unsigned flexonenand_get_block(struct onenand_chip *this, loff_t addr,
+			   unsigned *isblkslc)
+{
+	unsigned boundary, blk, die = 0;
+
+	if (addr >= this->diesize[0]) {
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
+	if (isblkslc)
+		*isblkslc = (blk <= boundary) ? 1 : 0;
+
+	blk += die ? this->density_mask : 0;
+	return blk;
+}
+
+inline unsigned onenand_get_block(struct onenand_chip *this, loff_t addr,
+					unsigned *isblkslc)
+{
+	if (!FLEXONENAND(this))
+		return addr >> this->erase_shift;
+	return flexonenand_get_block(this, addr, isblkslc);
+}
+
+/**
  * onenand_get_density - [DEFAULT] Get OneNAND density
  * @param dev_id	OneNAND device ID
  *
@@ -183,6 +253,22 @@ static inline int onenand_get_density(int dev_id)
 }
 
 /**
+ * eraseregion - [Flex-OneNAND] Return erase region of addr
+ * @param mtd		MTD device structure
+ * @param addr		address whose erase region needs to be identified
+ */
+static inline int eraseregion(struct mtd_info *mtd, loff_t addr)
+{
+	int i;
+
+	for (i = 0; i < mtd->numeraseregions &&
+	     addr >= mtd->eraseregions[i].offset; i++)
+		;
+	i--;
+	return i;
+}
+
+/**
  * onenand_command - [DEFAULT] Send command to OneNAND device
  * @param mtd		MTD device structure
  * @param cmd		the command to be sent
@@ -196,6 +282,7 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 {
 	struct onenand_chip *this = mtd->priv;
 	int value, block, page;
+	unsigned slc = 0;
 
 	/* Address translation */
 	switch (cmd) {
@@ -207,15 +294,27 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
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
+		block = onenand_get_block(this, addr, NULL);
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
+		block = onenand_get_block(this, addr, &slc);
 		page = (int) (addr >> this->page_shift);
 
 		if (ONENAND_IS_2PLANE(this)) {
@@ -227,6 +326,8 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 			page >>= 1;
 		}
 		page &= this->page_mask;
+		if (slc)
+			page &= (this->page_mask >> 1);
 		break;
 	}
 
@@ -236,7 +337,7 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 		value = onenand_bufferram_address(this, block);
 		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
 
-		if (ONENAND_IS_2PLANE(this))
+		if (ONENAND_IS_MLC(this) || ONENAND_IS_2PLANE(this))
 			/* It is always BufferRAM0 */
 			ONENAND_SET_BUFFERRAM0(this);
 		else
@@ -258,13 +359,18 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 
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
@@ -293,6 +399,30 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
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
@@ -331,14 +461,14 @@ static int onenand_wait(struct mtd_info *mtd, int state)
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
@@ -656,7 +786,7 @@ static int onenand_check_bufferram(struct mtd_info *mtd, loff_t addr)
 
 	if (found && ONENAND_IS_DDP(this)) {
 		/* Select DataRAM for DDP */
-		int block = (int) (addr >> this->erase_shift);
+		int block = onenand_get_block(this, addr, NULL);
 		int value = onenand_bufferram_address(this, block);
 		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
 	}
@@ -816,6 +946,149 @@ static int onenand_transfer_auto_oob(struct mtd_info *mtd, uint8_t *buf, int col
 }
 
 /**
+ * onenand_recover_lsb - [Flex-OneNAND] Recover LSB page data
+ * @param this		onenand chip device structure
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
+	unsigned slc = 0;
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
+	onenand_get_block(this, addr, &slc);
+	if (slc)
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
@@ -962,7 +1235,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 	size_t len = ops->ooblen;
 	mtd_oob_mode_t mode = ops->mode;
 	u_char *buf = ops->oobbuf;
-	int ret = 0;
+	int ret = 0, readcmd;
 
 	from += ops->ooboffs;
 
@@ -993,17 +1266,22 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 
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
@@ -1053,6 +1331,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	size_t *retlen, u_char *buf)
 {
+	struct onenand_chip *this = mtd->priv;
 	struct mtd_oob_ops ops = {
 		.len	= len,
 		.ooblen	= 0,
@@ -1062,7 +1341,9 @@ static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	int ret;
 
 	onenand_get_device(mtd, FL_READING);
-	ret = onenand_read_ops_nolock(mtd, from, &ops);
+	ret = ONENAND_IS_MLC(this) ?
+		onenand_mlc_read_ops_nolock(mtd, from, &ops) :
+		onenand_read_ops_nolock(mtd, from, &ops);
 	onenand_release_device(mtd);
 
 	*retlen = ops.retlen;
@@ -1080,6 +1361,7 @@ static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
 static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
+	struct onenand_chip *this = mtd->priv;
 	int ret;
 
 	switch (ops->mode) {
@@ -1094,7 +1376,9 @@ static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
 
 	onenand_get_device(mtd, FL_READING);
 	if (ops->datbuf)
-		ret = onenand_read_ops_nolock(mtd, from, ops);
+		ret = ONENAND_IS_MLC(this) ?
+			onenand_mlc_read_ops_nolock(mtd, from, ops) :
+			onenand_read_ops_nolock(mtd, from, ops);
 	else
 		ret = onenand_read_oob_nolock(mtd, from, ops);
 	onenand_release_device(mtd);
@@ -1128,11 +1412,11 @@ static int onenand_bbt_wait(struct mtd_info *mtd, int state)
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
@@ -1163,7 +1447,7 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 {
 	struct onenand_chip *this = mtd->priv;
 	int read = 0, thislen, column;
-	int ret = 0;
+	int ret = 0, readcmd;
 	size_t len = ops->ooblen;
 	u_char *buf = ops->oobbuf;
 
@@ -1183,17 +1467,22 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 
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
 
@@ -1230,9 +1519,11 @@ static int onenand_verify_oob(struct mtd_info *mtd, const u_char *buf, loff_t to
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
@@ -1586,7 +1877,7 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 {
 	struct onenand_chip *this = mtd->priv;
 	int column, ret = 0, oobsize;
-	int written = 0;
+	int written = 0, oobcmd;
 	u_char *oobbuf;
 	size_t len = ops->ooblen;
 	const u_char *buf = ops->oobbuf;
@@ -1628,6 +1919,8 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 
 	oobbuf = this->oob_buf;
 
+	oobcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_PROG : ONENAND_CMD_PROGOOB;
+
 	/* Loop until all data write */
 	while (written < len) {
 		int thislen = min_t(int, oobsize, len - written);
@@ -1645,7 +1938,14 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
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
@@ -1768,29 +2068,48 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct onenand_chip *this = mtd->priv;
 	unsigned int block_size;
-	loff_t addr;
-	int len;
-	int ret = 0;
+	loff_t addr = instr->addr;
+	unsigned int len = instr->len;
+	int ret = 0, i;
+	struct mtd_erase_region_info *region = NULL;
+	unsigned int region_end = 0;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start = 0x%08x, len = %i\n", (unsigned int) instr->addr, (unsigned int) instr->len);
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start = 0x%08x, len = %i\n", (unsigned int) addr, len);
 
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
+	if (mtd->numeraseregions > 1) {
+		/* Find the eraseregion of this address */
+		i = eraseregion(mtd, addr);
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
+		block_size = mtd->erasesize;
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
 
@@ -1800,9 +2119,6 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 	onenand_get_device(mtd, FL_ERASING);
 
 	/* Loop throught the pages */
-	len = instr->len;
-	addr = instr->addr;
-
 	instr->state = MTD_ERASING;
 
 	while (len) {
@@ -1822,7 +2138,8 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 		ret = this->wait(mtd, FL_ERASING);
 		/* Check, if it is write protected */
 		if (ret) {
-			printk(KERN_ERR "onenand_erase: Failed erase, block %d\n", (unsigned) (addr >> this->erase_shift));
+			printk(KERN_ERR "onenand_erase: Failed erase, block %d\n",
+			 (unsigned)onenand_get_block(this, addr, NULL));
 			instr->state = MTD_ERASE_FAILED;
 			instr->fail_addr = addr;
 			goto erase_exit;
@@ -1830,6 +2147,22 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 
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
@@ -1908,13 +2241,17 @@ static int onenand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	int block;
 
 	/* Get block number */
-	block = ((int) ofs) >> bbm->bbt_erase_shift;
+	block = onenand_get_block(this, ofs, NULL);
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
@@ -1958,8 +2295,8 @@ static int onenand_do_lock_cmd(struct mtd_info *mtd, loff_t ofs, size_t len, int
 	int start, end, block, value, status;
 	int wp_status_mask;
 
-	start = ofs >> this->erase_shift;
-	end = len >> this->erase_shift;
+	start = onenand_get_block(this, ofs, NULL);
+	end = onenand_get_block(this, ofs + len, NULL) - 1;
 
 	if (cmd == ONENAND_CMD_LOCK)
 		wp_status_mask = ONENAND_WP_LS;
@@ -1971,7 +2308,7 @@ static int onenand_do_lock_cmd(struct mtd_info *mtd, loff_t ofs, size_t len, int
 		/* Set start block address */
 		this->write_word(start, this->base + ONENAND_REG_START_BLOCK_ADDRESS);
 		/* Set end block address */
-		this->write_word(start + end - 1, this->base + ONENAND_REG_END_BLOCK_ADDRESS);
+		this->write_word(end, this->base +  ONENAND_REG_END_BLOCK_ADDRESS);
 		/* Write lock command */
 		this->command(mtd, cmd, 0, 0);
 
@@ -1992,7 +2329,7 @@ static int onenand_do_lock_cmd(struct mtd_info *mtd, loff_t ofs, size_t len, int
 	}
 
 	/* Block lock scheme */
-	for (block = start; block < start + end; block++) {
+	for (block = start; block < end + 1; block++) {
 		/* Set block address */
 		value = onenand_block_address(this, block);
 		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS1);
@@ -2086,7 +2423,6 @@ static int onenand_check_lock_status(struct onenand_chip *this)
 			return 0;
 		}
 	}
-
 	return 1;
 }
 
@@ -2100,7 +2436,7 @@ static void onenand_unlock_all(struct mtd_info *mtd)
 {
 	struct onenand_chip *this = mtd->priv;
 	loff_t ofs = 0;
-	size_t len = this->chipsize;
+	size_t len = mtd->size;
 
 	if (this->options & ONENAND_HAS_UNLOCK_ALL) {
 		/* Set start block address */
@@ -2122,9 +2458,14 @@ static void onenand_unlock_all(struct mtd_info *mtd)
 
 		/* Workaround for all block unlock in DDP */
 		if (ONENAND_IS_DDP(this)) {
-			/* All blocks on another chip */
-			ofs = this->chipsize >> 1;
-			len = this->chipsize >> 1;
+			/* All blocks on another chip
+			 * For Flex-OneNAND with both slc
+			 * mlc regions, we use diesize
+			 */
+			ofs = FLEXONENAND(this) ? this->diesize[0] :
+							this->chipsize >> 1;
+			len = FLEXONENAND(this) ? this->diesize[1] :
+							this->chipsize >> 1;
 		}
 	}
 
@@ -2163,7 +2504,9 @@ static int do_otp_read(struct mtd_info *mtd, loff_t from, size_t len,
 	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
 	this->wait(mtd, FL_OTPING);
 
-	ret = onenand_read_ops_nolock(mtd, from, &ops);
+	ret = ONENAND_IS_MLC(this) ?
+		onenand_mlc_read_ops_nolock(mtd, from, &ops) :
+		onenand_read_ops_nolock(mtd, from, &ops);
 
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
@@ -2230,21 +2573,32 @@ static int do_otp_lock(struct mtd_info *mtd, loff_t from, size_t len,
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
@@ -2428,27 +2782,34 @@ static int onenand_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
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
@@ -2495,6 +2856,14 @@ static void onenand_check_features(struct mtd_info *mtd)
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
@@ -2512,14 +2881,16 @@ static void onenand_check_features(struct mtd_info *mtd)
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
@@ -2558,6 +2929,182 @@ static int onenand_check_maf(int manuf)
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
+		locked = bdry >> FLEXONENAND_PI_UNLOCK_SHIFT;
+		locked = (locked == 0x3) ? 0 : 1;
+		this->boundary[die] = bdry & FLEXONENAND_PI_MASK;
+		this->boundary_locked[die] = locked;
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
+ * flexonenand_get_size - Fill up fields in onenand_chip
+ * 			  boundary[], diesize[], chipsize,
+ *			  boundary_locked[]
+ * @param mtd		- MTD device structure
+ */
+static void flexonenand_get_size(struct mtd_info *mtd)
+{
+	struct onenand_chip *this = mtd->priv;
+	int die, ofs, i, eraseshift, density;
+	int blksperdie, maxbdry;
+
+	density = onenand_get_density(this->device_id);
+	blksperdie = ((16 << density) << 20) >> (this->erase_shift);
+	blksperdie >>= ONENAND_IS_DDP(this) ? 1 : 0;
+	maxbdry = blksperdie - 1;
+	eraseshift = this->erase_shift - 1;
+
+	/* this->chipsize = 0; */
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
+	mtd->erasesize = 1 << (this->erase_shift);
+	if (mtd->numeraseregions == 1)
+		mtd->erasesize >>= 1;
+
+	printk(KERN_INFO "Device has %d eraseregions\n", mtd->numeraseregions);
+	for (i = 0; i < mtd->numeraseregions; i++)
+		printk(KERN_INFO "[offset: 0x%08x, erasesize: 0x%05x,"
+			 " numblocks: %04u]\n", mtd->eraseregions[i].offset,
+			mtd->eraseregions[i].erasesize,
+			mtd->eraseregions[i].numblocks);
+
+	for (die = 0, mtd->size = 0; die < this->dies; die++) {
+		this->diesize[die] = (blksperdie << this->erase_shift);
+		this->diesize[die] -= (this->boundary[die] + 1)
+						 << (this->erase_shift - 1);
+		mtd->size += this->diesize[die];
+	}
+
+	/* this->chipsize represents maximum possible chip size */
+	this->chipsize = (16 << density) << 20;
+}
+
+/**
+ * flexonenand_set_boundary	- Writes the SLC boundary
+ * @param onenand_info		- onenand info structure
+ */
+static int flexonenand_set_boundary(struct mtd_info *mtd, unsigned die,
+						int boundary, int lock)
+{
+	struct onenand_chip *this = mtd->priv;
+	int ret, density, blksperdie;
+	loff_t addr;
+
+	density = onenand_get_density(this->device_id);
+	blksperdie = ((16 << density) << 20) >> this->erase_shift;
+	blksperdie >>= ONENAND_IS_DDP(this) ? 1 : 0;
+
+	printk(KERN_INFO "flexonenand_set_boundary: Changing die %d boundary: %d%s\n",
+			die, boundary, lock ? "(Locked)" : "(Unlocked)");
+	if (boundary >= blksperdie) {
+		printk(KERN_ERR "flexonenand_set_boundary: Invalid boundary value. "
+				"Boundary not changed.\n");
+		return -1;
+	}
+
+	if (this->boundary_locked[die]) {
+		printk(KERN_ERR "flexonenand_set_boundary: Die boundary is locked. "
+				"Boundary not changed.\n");
+		return -1;
+	}
+
+	addr = die ? this->diesize[0] : 0;
+
+	boundary &= FLEXONENAND_PI_MASK;
+	boundary |= lock ? 0 : (3 << FLEXONENAND_PI_UNLOCK_SHIFT);
+
+	this->command(mtd, FLEXONENAND_CMD_PI_ACCESS, die, 0);
+	this->wait(mtd, FL_SYNCING);
+
+	this->command(mtd, ONENAND_CMD_ERASE, addr, 0);
+	ret = this->wait(mtd, FL_ERASING);
+	if (ret) {
+		printk(KERN_ERR "flexonenand_set_boundary: Failed PI erase for Die %d\n", die);
+		goto out;
+	}
+
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
+	return ret;
+}
+
+/**
  * onenand_probe - [OneNAND Interface] Probe the OneNAND device
  * @param mtd		MTD device structure
  *
@@ -2599,6 +3146,7 @@ static int onenand_probe(struct mtd_info *mtd)
 	maf_id = this->read_word(this->base + ONENAND_REG_MANUFACTURER_ID);
 	dev_id = this->read_word(this->base + ONENAND_REG_DEVICE_ID);
 	ver_id = this->read_word(this->base + ONENAND_REG_VERSION_ID);
+	this->technology = this->read_word(this->base + ONENAND_REG_TECHNOLOGY);
 
 	/* Check OneNAND device */
 	if (maf_id != bram_maf_id || dev_id != bram_dev_id)
@@ -2610,20 +3158,35 @@ static int onenand_probe(struct mtd_info *mtd)
 	this->version_id = ver_id;
 
 	density = onenand_get_density(dev_id);
-	this->chipsize = (16 << density) << 20;
+	if (FLEXONENAND(this)) {
+		this->dies = ONENAND_IS_DDP(this) ? 2 : 1;
+		/* Maximum possible erase regions */
+		mtd->numeraseregions = this->dies << 1;
+		mtd->eraseregions = kzalloc(sizeof(struct mtd_erase_region_info)
+					* (this->dies << 1), GFP_KERNEL);
+		if (!mtd->eraseregions)
+			return -ENOMEM;
+	}
+	this->chipsize = FLEXONENAND(this) ? 0 : (16 << density) << 20;
 	/* Set density mask. it is used for DDP */
 	if (ONENAND_IS_DDP(this))
-		this->density_mask = (1 << (density + 6));
+		this->density_mask = (1 << (density +
+						 (FLEXONENAND(this) ? 4 : 6)));
 	else
 		this->density_mask = 0;
 
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
-
+	/* Flex-OneNAND always has 128 pages per block */
+	mtd->erasesize <<= FLEXONENAND(this) ? 1 : 0;
 	this->erase_shift = ffs(mtd->erasesize) - 1;
 	this->page_shift = ffs(mtd->writesize) - 1;
 	this->page_mask = (1 << (this->erase_shift - this->page_shift)) - 1;
@@ -2632,7 +3195,24 @@ static int onenand_probe(struct mtd_info *mtd)
 
 	/* REVIST: Multichip handling */
 
-	mtd->size = this->chipsize;
+	if (FLEXONENAND(this)) {
+		int boundary[] =
+			{FLEXONENAND_DIE0_BOUNDARY, FLEXONENAND_DIE1_BOUNDARY};
+		int lock[] =
+			{FLEXONENAND_DIE0_ISLOCKED, FLEXONENAND_DIE1_ISLOCKED};
+		unsigned die;
+
+		flexonenand_get_size(mtd);
+
+		/* Change the device boundaries if required */
+		for (die = 0; die < this->dies; die++)
+			if ((!this->boundary_locked[die]) &&
+			   (boundary[die] >= 0) &&
+			   (boundary[die] != this->boundary[die]))
+				flexonenand_set_boundary(mtd, die,
+						 boundary[die], lock[die]);
+	} else
+		mtd->size = this->chipsize;
 
 	/* Check OneNAND features */
 	onenand_check_features(mtd);
@@ -2749,6 +3329,10 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
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
@@ -2768,6 +3352,10 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 		break;
 	}
 
+	/* Don't allow the sub-page write in MLC */
+	if (ONENAND_IS_MLC(this))
+		mtd->subpage_sft = 0;
+
 	this->subpagesize = mtd->writesize >> mtd->subpage_sft;
 
 	/*
@@ -2843,6 +3431,7 @@ void onenand_release(struct mtd_info *mtd)
 		kfree(this->page_buf);
 	if (this->options & ONENAND_OOBBUF_ALLOC)
 		kfree(this->oob_buf);
+	kfree(mtd->eraseregions);
 }
 
 EXPORT_SYMBOL_GPL(onenand_scan);
diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index 2f53b51..20fc070 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -60,6 +60,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 	struct bbm_info *bbm = this->bbm;
 	int i, j, numblocks, len, scanlen;
 	int startblock;
+	unsigned slc = 0;
 	loff_t from;
 	size_t readlen, ooblen;
 	struct mtd_oob_ops ops;
@@ -76,7 +77,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 	/* Note that numblocks is 2 * (real numblocks) here;
 	 * see i += 2 below as it makses shifting and masking less painful
 	 */
-	numblocks = mtd->size >> (bbm->bbt_erase_shift - 1);
+	numblocks = this->chipsize >> (bbm->bbt_erase_shift - 1);
 	startblock = 0;
 	from = 0;
 
@@ -106,7 +107,11 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 			}
 		}
 		i += 2;
-		from += (1 << bbm->bbt_erase_shift);
+		onenand_get_block(this, from, &slc);
+		if (slc)
+			from += (1 << bbm->bbt_erase_shift) >> 1;
+		else
+			from += (1 << bbm->bbt_erase_shift);
 	}
 
 	return 0;
@@ -143,7 +148,7 @@ static int onenand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 	uint8_t res;
 
 	/* Get block number * 2 */
-	block = (int) (offs >> (bbm->bbt_erase_shift - 1));
+	block = (int) (onenand_get_block(this, offs, NULL) << 1);
 	res = (bbm->bbt[block >> 3] >> (block & 0x06)) & 0x03;
 
 	DEBUG(MTD_DEBUG_LEVEL2, "onenand_isbad_bbt: bbt info for offs 0x%08x: (block %d) 0x%02x\n",
@@ -178,7 +183,7 @@ int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	struct bbm_info *bbm = this->bbm;
 	int len, ret = 0;
 
-	len = mtd->size >> (this->erase_shift + 2);
+	len = this->chipsize >> (this->erase_shift + 2);
 	/* Allocate memory (2bit per block) and clear the memory bad block table */
 	bbm->bbt = kzalloc(len, GFP_KERNEL);
 	if (!bbm->bbt) {
diff --git a/drivers/mtd/onenand/onenand_sim.c b/drivers/mtd/onenand/onenand_sim.c
index d64200b..c66946e 100644
--- a/drivers/mtd/onenand/onenand_sim.c
+++ b/drivers/mtd/onenand/onenand_sim.c
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
@@ -104,6 +136,7 @@ static void onenand_lock_handle(struct onenand_chip *this, int cmd)
 
 	switch (cmd) {
 	case ONENAND_CMD_UNLOCK:
+	case ONENAND_CMD_UNLOCK_ALL:
 		if (block_lock_scheme)
 			ONENAND_SET_WP_STATUS(ONENAND_WP_US, this);
 		else
@@ -228,10 +261,11 @@ static void onenand_data_handle(struct onenand_chip *this, int cmd,
 {
 	struct mtd_info *mtd = &info->mtd;
 	struct onenand_flash *flash = this->priv;
-	int main_offset, spare_offset;
+	int main_offset, spare_offset, die = 0;
 	void __iomem *src;
 	void __iomem *dest;
-	unsigned int i;
+	unsigned int i, slc = 0;
+	static int pi_operation;
 
 	if (dataram) {
 		main_offset = mtd->writesize;
@@ -241,10 +275,27 @@ static void onenand_data_handle(struct onenand_chip *this, int cmd,
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
 
@@ -257,6 +308,10 @@ static void onenand_data_handle(struct onenand_chip *this, int cmd,
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
@@ -284,9 +339,16 @@ static void onenand_data_handle(struct onenand_chip *this, int cmd,
 		break;
 
 	case ONENAND_CMD_ERASE:
+		if (pi_operation)
+			break;
+		onenand_get_block(this, offset, &slc);
+		if (slc && (mtd->numeraseregions > 1))
+			mtd->erasesize >>= 1;
 		memset(ONENAND_CORE(flash) + offset, 0xff, mtd->erasesize);
 		memset(ONENAND_CORE_SPARE(flash, this, offset), 0xff,
 		       (mtd->erasesize >> 5));
+		if (slc && (mtd->numeraseregions > 1))
+			mtd->erasesize <<= 1;
 		break;
 
 	default:
@@ -295,6 +357,29 @@ static void onenand_data_handle(struct onenand_chip *this, int cmd,
 }
 
 /**
+ * flexonenand_get_addr - Return address of the block
+ * @block:		Block number on Flex-OneNAND
+ *
+ */
+loff_t flexonenand_get_addr(struct onenand_chip *this, int block)
+{
+	loff_t ofs;
+	int die = 0, boundary;
+
+	ofs = 0;
+	if (ONENAND_IS_DDP(this) && block >= this->density_mask) {
+		block -= this->density_mask;
+		die = 1;
+		ofs = this->diesize[0];
+	}
+	boundary = this->boundary[die];
+	ofs += block << (this->erase_shift - 1);
+	if (block > (boundary + 1))
+		ofs += (block - boundary - 1) << (this->erase_shift - 1);
+	return ofs;
+}
+
+/**
  * onenand_command_handle - Handle command
  * @this:		OneNAND device structure
  * @cmd:		The command to be sent
@@ -338,8 +423,12 @@ static void onenand_command_handle(struct onenand_chip *this, int cmd)
 		break;
 	}
 
-	if (block != -1)
-		offset += block << this->erase_shift;
+	if (block != -1) {
+		if (FLEXONENAND(this))
+			offset = flexonenand_get_addr(this, block);
+		else
+			offset += block << this->erase_shift;
+	}
 
 	if (page != -1)
 		offset += page << this->page_shift;
@@ -390,6 +479,7 @@ static int __init flash_init(struct onenand_flash *flash)
 	}
 
 	density = device_id >> ONENAND_DEVICE_DENSITY_SHIFT;
+	density &= ONENAND_DEVICE_DENSITY_MASK;
 	size = ((16 << 20) << density);
 
 	ONENAND_CORE(flash) = vmalloc(size + (size >> 5));
@@ -405,8 +495,9 @@ static int __init flash_init(struct onenand_flash *flash)
 	writew(manuf_id, flash->base + ONENAND_REG_MANUFACTURER_ID);
 	writew(device_id, flash->base + ONENAND_REG_DEVICE_ID);
 	writew(version_id, flash->base + ONENAND_REG_VERSION_ID);
+	writew(technology_id, flash->base + ONENAND_REG_TECHNOLOGY);
 
-	if (density < 2)
+	if (density < 2 && (!CONFIG_FLEXONENAND))
 		buffer_size = 0x0400;	/* 1KiB page */
 	else
 		buffer_size = 0x0800;	/* 2KiB page */
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 9aa2a91..d23eeef 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -17,8 +17,23 @@
 #include <linux/mtd/onenand_regs.h>
 #include <linux/mtd/bbm.h>
 
+#define MAX_DIES		2
 #define MAX_BUFFERRAM		2
 
+#define FLEXONENAND_DIE0_BOUNDARY	CONFIG_MTD_FLEXONENAND_DIE0_BOUNDARY
+#define FLEXONENAND_DIE1_BOUNDARY	CONFIG_MTD_FLEXONENAND_DIE1_BOUNDARY
+
+#if defined CONFIG_MTD_FLEXONENAND_DIE0_ISLOCKED
+#define FLEXONENAND_DIE0_ISLOCKED	1
+#else
+#define FLEXONENAND_DIE0_ISLOCKED	0
+#endif
+#if defined CONFIG_MTD_FLEXONENAND_DIE1_ISLOCKED
+#define FLEXONENAND_DIE1_ISLOCKED	1
+#else
+#define FLEXONENAND_DIE1_ISLOCKED	0
+#endif
+
 /* Scan and identify a OneNAND device */
 extern int onenand_scan(struct mtd_info *mtd, int max_chips);
 /* Free resources held by the OneNAND device */
@@ -51,7 +66,14 @@ struct onenand_bufferram {
 /**
  * struct onenand_chip - OneNAND Private Flash Chip Data
  * @base:		[BOARDSPECIFIC] address to access OneNAND
+ * @dies:		[INTERN][FLEX-ONENAND] number of dies on chip
+ * @boundary:		[INTERN][FLEX-ONENAND] Boundary of the dies
+ * @boundary_locked:	[INTERN][FLEX-ONENAND] TRUE indicates die boundary
+ * 			is locked and cannot be changed
+ * @diesize:		[INTERN][FLEX-ONENAND] Size of the dies
  * @chipsize:		[INTERN] the size of one chip for multichip arrays
+ *			FIXME For Flex-OneNAND, chipsize holds maximum possible
+ *			device size ie when all blocks are considered MLC
  * @device_id:		[INTERN] device ID
  * @density_mask:	chip density, used for DDP devices
  * @verstion_id:	[INTERN] version ID
@@ -92,9 +114,14 @@ struct onenand_bufferram {
  */
 struct onenand_chip {
 	void __iomem		*base;
+	unsigned		dies;
+	unsigned		boundary[MAX_DIES];
+	unsigned int 		boundary_locked[MAX_DIES];
+	unsigned int		diesize[MAX_DIES];
 	unsigned int		chipsize;
 	unsigned int		device_id;
 	unsigned int		version_id;
+	unsigned int		technology;
 	unsigned int		density_mask;
 	unsigned int		options;
 
@@ -145,6 +172,8 @@ struct onenand_chip {
 #define ONENAND_SET_BUFFERRAM0(this)		(this->bufferram_index = 0)
 #define ONENAND_SET_BUFFERRAM1(this)		(this->bufferram_index = 1)
 
+#define FLEXONENAND(this)						\
+	(this->device_id & DEVICE_IS_FLEXONENAND)
 #define ONENAND_GET_SYS_CFG1(this)					\
 	(this->read_word(this->base + ONENAND_REG_SYS_CFG1))
 #define ONENAND_SET_SYS_CFG1(v, this)					\
@@ -153,6 +182,9 @@ struct onenand_chip {
 #define ONENAND_IS_DDP(this)						\
 	(this->device_id & ONENAND_DEVICE_IS_DDP)
 
+#define ONENAND_IS_MLC(this)						\
+	(this->technology & ONENAND_TECHNOLOGY_IS_MLC)
+
 #ifdef CONFIG_MTD_ONENAND_2X_PROGRAM
 #define ONENAND_IS_2PLANE(this)						\
 	(this->options & ONENAND_HAS_2PLANE)
@@ -189,5 +221,7 @@ struct onenand_manufacturers {
 
 int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 			 struct mtd_oob_ops *ops);
+unsigned onenand_get_block(struct onenand_chip *this, loff_t addr,
+			 unsigned *isblkslc);
 
 #endif	/* __LINUX_MTD_ONENAND_H */
diff --git a/include/linux/mtd/onenand_regs.h b/include/linux/mtd/onenand_regs.h
index 0c6bbe2..86a6bbe 100644
--- a/include/linux/mtd/onenand_regs.h
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
---
