Received: from [210.94.41.89] (helo=party)
	by bombadil.infradead.org with esmtpsa (Exim 4.68 #1 (Red Hat Linux))
	id 1JADZ1-0006OH-Ba
	for linux-mtd@lists.infradead.org; Thu, 03 Jan 2008 00:04:01 +0000
Date: Thu, 3 Jan 2008 09:03:50 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD][OneNAND] Multi Level Chip (MLC) OneNAND support
Message-ID: <20080103000350.GA12237@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch enables the MLC OneNAND support
Now it's basic support. We need to work more.

In MLC, we use the 4KiB BufferRam instead of 2KiB.
With this reason it is changed to read/write data from/to BufferRAM 0 and
we can't use read-while-load.

It passed the nand-tests module and it diffed against the OneNAND MTD tree instead of MTD one.

Any comments are welcome.

Thank you,
Kyungmin Park

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 9d00e0b..27c9dcc 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -235,7 +235,7 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 		value = onenand_bufferram_address(this, block);
 		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
 
-		if (ONENAND_IS_2PLANE(this))
+		if (ONENAND_IS_MLC(this) || ONENAND_IS_2PLANE(this))
 			/* It is always BufferRAM0 */
 			ONENAND_SET_BUFFERRAM0(this);
 		else
@@ -257,13 +257,17 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 
 	if (page != -1) {
 		/* Now we use page size operation */
-		int sectors = 4, count = 4;
+		int sectors = 0, count = 0;
 		int dataram;
 
 		switch (cmd) {
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
@@ -849,6 +853,7 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	stats = mtd->ecc_stats;
 
  	/* Read-while-load method */
+	/* Note: We can't use this feature in MLC */
 
  	/* Do first load to bufferRAM */
  	if (read < len) {
@@ -869,7 +874,8 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
  	while (!ret) {
  		/* If there is more to load then start next load */
  		from += thislen;
- 		if (read + thislen < len) {
+		/* REVISIT: How to handle more fancy both SLC and MLC */
+ 		if (!ONENAND_IS_MLC(this) && read + thislen < len) {
 			this->command(mtd, ONENAND_CMD_READ, from, writesize);
  			/*
  			 * Chip boundary handling in DDP
@@ -901,6 +907,14 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 			oobcolumn = 0;
 		}
 
+		if (ONENAND_IS_MLC(this) && (read + thislen < len)) {
+			this->command(mtd, ONENAND_CMD_READ, from, writesize);
+ 			ret = this->wait(mtd, FL_READING);
+ 			onenand_update_bufferram(mtd, from, !ret);
+			if (ret == -EBADMSG)
+				ret = 0;
+		}
+
  		/* See if we are done */
  		read += thislen;
  		if (read == len)
@@ -908,16 +922,19 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
  		/* Set up for next read from bufferRAM */
  		if (unlikely(boundary))
  			this->write_word(ONENAND_DDP_CHIP1, this->base + ONENAND_REG_START_ADDRESS2);
- 		ONENAND_SET_NEXT_BUFFERRAM(this);
+		if (!ONENAND_IS_MLC(this))
+			ONENAND_SET_NEXT_BUFFERRAM(this);
  		buf += thislen;
 		thislen = min_t(int, writesize, len - read);
  		column = 0;
  		cond_resched();
- 		/* Now wait for load */
- 		ret = this->wait(mtd, FL_READING);
- 		onenand_update_bufferram(mtd, from, !ret);
-		if (ret == -EBADMSG)
-			ret = 0;
+		if (!ONENAND_IS_MLC(this)) {
+ 			/* Now wait for load in SLC */
+			ret = this->wait(mtd, FL_READING);
+			onenand_update_bufferram(mtd, from, !ret);
+			if (ret == -EBADMSG)
+				ret = 0;
+		}
  	}
 
 	/*
@@ -954,7 +971,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 	size_t len = ops->ooblen;
 	mtd_oob_mode_t mode = ops->mode;
 	u_char *buf = ops->oobbuf;
-	int ret = 0;
+	int ret = 0, readcmd;
 
 	from += ops->ooboffs;
 
@@ -985,13 +1002,15 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 
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
 
@@ -1151,7 +1170,7 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 {
 	struct onenand_chip *this = mtd->priv;
 	int read = 0, thislen, column;
-	int ret = 0;
+	int ret = 0, readcmd;
 	size_t len = ops->ooblen;
 	u_char *buf = ops->oobbuf;
 
@@ -1171,13 +1190,15 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 
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
 
@@ -1218,9 +1239,11 @@ static int onenand_verify_oob(struct mtd_info *mtd, const u_char *buf, loff_t to
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
@@ -1471,7 +1494,7 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 {
 	struct onenand_chip *this = mtd->priv;
 	int column, ret = 0, oobsize;
-	int written = 0;
+	int written = 0, oobcmd;
 	u_char *oobbuf;
 	size_t len = ops->ooblen;
 	const u_char *buf = ops->oobbuf;
@@ -1484,6 +1507,8 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 	/* Initialize retlen, in case of early exit */
 	ops->oobretlen = 0;
 
+	WARN_ON_ONCE(ONENAND_IS_MLC(this));
+
 	if (mode == MTD_OOB_AUTO)
 		oobsize = this->ecclayout->oobavail;
 	else
@@ -1513,6 +1538,8 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 
 	oobbuf = this->oob_buf;
 
+	oobcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_PROG : ONENAND_CMD_PROGOOB;
+
 	/* Loop until all data write */
 	while (written < len) {
 		int thislen = min_t(int, oobsize, len - written);
@@ -1530,7 +1557,7 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 			memcpy(oobbuf + column, buf, thislen);
 		this->write_bufferram(mtd, ONENAND_SPARERAM, oobbuf, 0, mtd->oobsize);
 
-		this->command(mtd, ONENAND_CMD_PROGOOB, to, mtd->oobsize);
+		this->command(mtd, oobcmd, to, mtd->oobsize);
 
 		onenand_update_bufferram(mtd, to, 0);
 		if (ONENAND_IS_2PLANE(this)) {
@@ -1999,7 +2026,7 @@ static int onenand_unlock_all(struct mtd_info *mtd)
 		if (ONENAND_IS_DDP(this)) {
 			/* 1st block on another chip */
 			loff_t ofs = this->chipsize >> 1;
-			size_t len = mtd->erasesize;
+			size_t len = this->chipsize >> 1;
 
 			onenand_do_lock_cmd(mtd, ofs, len, ONENAND_CMD_UNLOCK);
 		}
@@ -2378,6 +2405,9 @@ static void onenand_check_features(struct mtd_info *mtd)
 		break;
 	}
 
+	if (ONENAND_IS_MLC(this))
+		this->options &= ~ONENAND_HAS_2PLANE;
+
 	if (this->options & ONENAND_HAS_CONT_LOCK)
 		printk(KERN_DEBUG "Lock scheme is Continuous Lock\n");
 	if (this->options & ONENAND_HAS_UNLOCK_ALL)
@@ -2482,6 +2512,7 @@ static int onenand_probe(struct mtd_info *mtd)
 	maf_id = this->read_word(this->base + ONENAND_REG_MANUFACTURER_ID);
 	dev_id = this->read_word(this->base + ONENAND_REG_DEVICE_ID);
 	ver_id = this->read_word(this->base + ONENAND_REG_VERSION_ID);
+	this->technology = this->read_word(this->base + ONENAND_REG_TECHNOLOGY);
 
 	/* Check OneNAND device */
 	if (maf_id != bram_maf_id || dev_id != bram_dev_id)
@@ -2503,6 +2534,10 @@ static int onenand_probe(struct mtd_info *mtd)
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
@@ -2571,7 +2606,7 @@ static void onenand_resume(struct mtd_info *mtd)
 int onenand_scan(struct mtd_info *mtd, int maxchips)
 {
 	struct onenand_chip *this = mtd->priv;
-	int i, MLC;
+	int i;
 
 	if (!this->read_word)
 		this->read_word = onenand_readw;
@@ -2627,12 +2662,15 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	this->state = FL_READY;
 	init_waitqueue_head(&this->wq);
 	spin_lock_init(&this->chip_lock);
-	MLC = this->read_word(this->base + ONENAND_REG_TECHNOLOGY);
 
 	/*
 	 * Allow subpage writes up to oobsize.
 	 */
 	switch (mtd->oobsize) {
+	case 128:
+		/* REVISIT: Define the onenand_oob_128 */
+		break;
+
 	case 64:
 		this->ecclayout = &onenand_oob_64;
 		mtd->subpage_sft = 2;
@@ -2653,7 +2691,7 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	}
 
 	/* Don't allow the sub-page write in MLC */
-	if (MLC)
+	if (ONENAND_IS_MLC(this))
 		mtd->subpage_sft = 0;
 
 	this->subpagesize = mtd->writesize >> mtd->subpage_sft;
@@ -2674,7 +2712,7 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	/* Fill in remaining MTD driver data */
 	mtd->type = MTD_NANDFLASH;
 	mtd->flags = MTD_CAP_NANDFLASH;
-	if (MLC)
+	if (ONENAND_IS_MLC(this))
 		mtd->flags &= ~MTD_OOB_WRITEABLE;
 	mtd->erase = onenand_erase;
 	mtd->point = NULL;
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index fd0a260..cfc8e88 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -95,6 +95,7 @@ struct onenand_chip {
 	unsigned int		chipsize;
 	unsigned int		device_id;
 	unsigned int		version_id;
+	unsigned int		technology;
 	unsigned int		density_mask;
 	unsigned int		options;
 
@@ -153,6 +154,9 @@ struct onenand_chip {
 #define ONENAND_IS_DDP(this)						\
 	(this->device_id & ONENAND_DEVICE_IS_DDP)
 
+#define ONENAND_IS_MLC(this)						\
+	(this->technology & ONENAND_TECHNOLOGY_IS_MLC)			\
+
 #ifdef CONFIG_MTD_ONENAND_2X_PROGRAM
 #define ONENAND_IS_2PLANE(this)						\
 	(this->options & ONENAND_HAS_2PLANE)
diff --git a/include/linux/mtd/onenand_regs.h b/include/linux/mtd/onenand_regs.h
index d1b310c..2d24a95 100644
--- a/include/linux/mtd/onenand_regs.h
+++ b/include/linux/mtd/onenand_regs.h
@@ -84,6 +84,11 @@
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
@@ -93,7 +98,8 @@
 /*
  * Start Address 8 F107h (R/W)
  */
-#define ONENAND_FPA_MASK		(0x3f)
+/* Note: It's actually 0x3f in case of SLC */
+#define ONENAND_FPA_MASK		(0x7f)
 #define ONENAND_FPA_SHIFT		(2)
 #define ONENAND_FSA_MASK		(0x03)
 
@@ -105,7 +111,8 @@
 #define ONENAND_BSA_BOOTRAM		(0 << 2)
 #define ONENAND_BSA_DATARAM0		(2 << 2)
 #define ONENAND_BSA_DATARAM1		(3 << 2)
-#define ONENAND_BSC_MASK		(0x03)
+/* Note: It's actually 0x03 in case of SLC */
+#define ONENAND_BSC_MASK		(0x07)
 
 /*
  * Command Register F220h (R/W)
