Received: from [210.94.41.89] (helo=july7)
	by canuck.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1IG1wn-0003JA-9n
	for linux-mtd@lists.infradead.org; Tue, 31 Jul 2007 20:20:18 -0400
From: "Kyungmin Park" <kyungmin.park@samsung.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH] [MTD] [OneNAND] Cache Read support
Date: Wed, 1 Aug 2007 09:20:09 +0900
Message-ID: <001501c7d3d1$bcf66b40$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch supports the Cache Read feature in OneNAND.
It's similar with read-while-loading except while read it does sensing the page buffer in NAND core.
So it's called Transfer-While-Sensing. you can find it in OneNAND Spec. in detail.

Now there's no big performance gain in our test board, Apollon(OMAP2). But others are maybe different.

Any comments are welcome.

Thank you,
Kyungmin Park

-
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 7d194cf..dfc16c0 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -124,6 +124,28 @@ static int onenand_bufferram_address(struct onenand_chip *this, int block)
 }
 
 /**
+ * onenand_copyback_page_address - [DEFAULT] Get copyback page address
+ * @param page		the page address
+ * @param sector	the sector address
+ * @return		combined page and sector address
+ *
+ * Setup Start Address 4 Register (F103h)
+ */
+static int onenand_copyback_page_address(int page, int sector)
+{
+	/*
+	 * Flash Copy Back Page Address, Flash Copy Back Sector Address
+	 * First Page Address, First Sector Address of Cache Read
+	 */
+	int fcpa, fcsa;
+
+	fcpa = page & ONENAND_FCPA_MASK;
+	fcsa = sector & ONENAND_FCSA_MASK;
+
+	return ((fcpa << ONENAND_FCPA_SHIFT) | fcsa);
+}
+
+/**
  * onenand_page_address - [DEFAULT] Get page address
  * @param page		the page address
  * @param sector	the sector address
@@ -184,6 +206,9 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 	struct onenand_chip *this = mtd->priv;
 	int value, readcmd = 0, block_cmd = 0;
 	int block, page;
+	/* Now we use page size operation */
+	int sectors = 4, count = 4;
+	int dataram = -1;
 
 	/* Address translation */
 	switch (cmd) {
@@ -191,6 +216,8 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 	case ONENAND_CMD_LOCK:
 	case ONENAND_CMD_LOCK_TIGHT:
 	case ONENAND_CMD_UNLOCK_ALL:
+	case ONENAND_CMD_CACHE_READ:
+	case ONENAND_CMD_FINISH_CACHE_READ:
 		block = -1;
 		page = -1;
 		break;
@@ -235,6 +262,33 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 		return 0;
 	}
 
+	if (cmd == ONENAND_CMD_CACHE_READ_FCBA) {
+		/* Write 'FCBA' of Flash */
+		this->write_word(block, this->base + ONENAND_REG_START_ADDRESS3);
+		/* Write 'FCPA, FCSA' of Flash */
+		value = onenand_copyback_page_address(page, sectors);
+		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS4);
+		/* Write 'BSA, BSC' of Flash */
+		dataram = ONENAND_SET_NEXT_BUFFERRAM(this);
+		value = onenand_buffer_address(dataram, sectors, count);
+		this->write_word(value, this->base + ONENAND_REG_START_BUFFER);
+
+		return 0;
+	}
+
+	if (cmd == ONENAND_CMD_CACHE_READ_FBA) {
+		/* Write 'DFS, FBA' of Flash */
+		value = onenand_block_address(this, block);
+		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS1);
+		/* Select DataRAM for DDP */
+		value = onenand_bufferram_address(this, block);
+		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
+		/* Write 'FPA, FSA' of Flash */
+		value = onenand_page_address(page, sectors);
+		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS8);
+		return 0;
+	}
+
 	if (block != -1) {
 		/* Write 'DFS, FBA' of Flash */
 		value = onenand_block_address(this, block);
@@ -248,9 +302,6 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 	}
 
 	if (page != -1) {
-		/* Now we use page size operation */
-		int sectors = 4, count = 4;
-		int dataram;
 
 		switch (cmd) {
 		case ONENAND_CMD_READ:
@@ -270,9 +321,11 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 		value = onenand_page_address(page, sectors);
 		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS8);
 
-		/* Write 'BSA, BSC' of DataRAM */
-		value = onenand_buffer_address(dataram, sectors, count);
-		this->write_word(value, this->base + ONENAND_REG_START_BUFFER);
+		if (dataram >= 0) {
+			/* Write 'BSA, BSC' of DataRAM */
+			value = onenand_buffer_address(dataram, sectors, count);
+			this->write_word(value, this->base + ONENAND_REG_START_BUFFER);
+		}
 
 		if (readcmd) {
 			/* Select DataRAM for DDP */
@@ -763,6 +816,139 @@ static void onenand_release_device(struct mtd_info *mtd)
 }
 
 /**
+ * onenand_cache_read - [MTD Interface] Read data from flash
+ * @param mtd		MTD device structure
+ * @param from		offset to read from
+ * @param len		number of bytes to read
+ * @param retlen	pointer to variable to store the number of read bytes
+ * @param buf		the databuffer to put data
+ *
+ * Read with ecc using cache read command
+*/
+static int onenand_cache_read(struct mtd_info *mtd, loff_t from, size_t len,
+	size_t *retlen, u_char *buf)
+{
+	struct onenand_chip *this = mtd->priv;
+	struct mtd_ecc_stats stats;
+	int read = 0, column = 0;
+	int thislen;
+	int ret = 0, status;
+	int writesize = this->writesize;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_cache_read: from = 0x%08x, len = %i\n", (unsigned int) from, (int) len);
+
+	/* Grab the lock and see if the device is available */
+	onenand_get_device(mtd, FL_READING);
+
+	stats = mtd->ecc_stats;
+
+ 	/* Transfer-While-Sensing method */
+
+	thislen = min_t(int, writesize, len - read);
+	column = from & (writesize - 1);
+	if (column + thislen > writesize)
+		thislen = writesize - column;
+
+ 	/* Setup first page */
+	this->command(mtd, ONENAND_CMD_CACHE_READ_FCBA, from, thislen);
+
+	/*
+	 * Switch the bufferRAM to point the correct one
+	 * It will be switched the bufferRAM at 'n-1'th page read (see below)
+	 */
+	ONENAND_SET_NEXT_BUFFERRAM(this);
+
+	/* Setup second page */
+	this->command(mtd, ONENAND_CMD_CACHE_READ_FBA, from + thislen, writesize);
+
+	/* Issue the first read page */
+	this->command(mtd, ONENAND_CMD_CACHE_READ, from, thislen);
+
+	/* Check the Controller Status */
+	while (1) {
+		status = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
+
+		if ((status & ONENAND_CTRL_ONGO) &&
+		    (status & ONENAND_CTRL_LOAD))
+			break;
+	}
+
+	while (!ret) {
+		/* Is there more pages? */
+		if (read + thislen + writesize >= len)
+			break;
+
+		/* Setup the 'n-2'th page */
+		this->command(mtd, ONENAND_CMD_CACHE_READ_FBA, from + thislen + writesize, writesize);
+
+		/* Update the 'n-3'th page bufferram */
+		ONENAND_SET_NEXT_BUFFERRAM(this);
+
+		/* Wait the 'n-3'th page */
+ 		ret = this->wait(mtd, FL_READING);
+		onenand_update_bufferram(mtd, from, !ret);
+
+		/* Update the 'n-2'th page address */
+		from += thislen;
+
+		/* Issues the 'n-2'th page */
+		this->command(mtd, ONENAND_CMD_CACHE_READ, from, writesize);
+
+		/* Read the 'n-3'th page */
+		this->read_bufferram(mtd, ONENAND_DATARAM, buf, column, thislen);
+		read += thislen;
+		buf += thislen;
+
+		thislen = min_t(int, writesize, len - read);
+ 		column = 0;
+	}
+
+	/* Update the 'n-1'th page bufferram */
+	ONENAND_SET_NEXT_BUFFERRAM(this);
+
+	/* Wait the 'n-1'th page */
+ 	ret = this->wait(mtd, FL_READING);
+ 	onenand_update_bufferram(mtd, from, !ret);
+
+	/* Update the 'n'th page address */
+	from += thislen;
+
+	/* Issue the 'n'th page read command */
+	this->command(mtd, ONENAND_CMD_FINISH_CACHE_READ, from, writesize);
+
+	/* Read the 'n-1'th page */
+ 	this->read_bufferram(mtd, ONENAND_DATARAM, buf, column, thislen);
+	read += thislen;
+	buf += thislen;
+
+	/* Update the 'n'th page bufferram */
+	ONENAND_SET_NEXT_BUFFERRAM(this);
+	thislen = min_t(int, writesize, len - read);
+ 	column = 0;
+
+	/* Wait the 'n'th page */
+	ret = this->wait(mtd, FL_READING);
+ 	onenand_update_bufferram(mtd, from, !ret);
+
+	/* Read the 'n'th page */
+ 	this->read_bufferram(mtd, ONENAND_DATARAM, buf, column, thislen);
+	read += thislen;
+
+	/* Deselect and wake up anyone waiting on the device */
+	onenand_release_device(mtd);
+
+	*retlen = read;
+
+	if (mtd->ecc_stats.failed - stats.failed)
+		return -EBADMSG;
+
+	if (ret)
+		return ret;
+
+	return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+}
+
+/**
  * onenand_read - [MTD Interface] Read data from flash
  * @param mtd		MTD device structure
  * @param from		offset to read from
@@ -791,6 +977,13 @@ static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
 		return -EINVAL;
 	}
 
+	/*
+	 * If the requested reads are more than 2 pages and can cache read,
+	 * we use the cache read command
+	 */
+	if (len >= (this->writesize << 1) && ONENAND_CAN_CACHE_READ(this))
+		return onenand_cache_read(mtd, from, len, retlen, buf);
+
 	/* Grab the lock and see if the device is available */
 	onenand_get_device(mtd, FL_READING);
 
@@ -2163,6 +2356,7 @@ static int onenand_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
  * Check and set OneNAND features
  * - lock scheme
  * - two plane
+ * - cache read
  */
 static void onenand_check_features(struct mtd_info *mtd)
 {
@@ -2183,11 +2377,14 @@ static void onenand_check_features(struct mtd_info *mtd)
 		if (!ONENAND_IS_DDP(this))
 			this->options |= ONENAND_HAS_2PLANE;
 		this->options |= ONENAND_HAS_UNLOCK_ALL;
+		this->options |= ONENAND_HAS_CACHE_READ;
 
 	case ONENAND_DEVICE_DENSITY_1Gb:
-		/* A-Die has all block unlock */
-		if (process)
+		/* A-Die or later */
+		if (process) {
 			this->options |= ONENAND_HAS_UNLOCK_ALL;
+			this->options |= ONENAND_HAS_CACHE_READ;
+		}
 		break;
 
 	default:
@@ -2200,9 +2397,11 @@ static void onenand_check_features(struct mtd_info *mtd)
 	if (this->options & ONENAND_HAS_CONT_LOCK)
 		printk(KERN_DEBUG "Lock scheme is Continuous Lock\n");
 	if (this->options & ONENAND_HAS_UNLOCK_ALL)
-		printk(KERN_DEBUG "Chip support all block unlock\n");
+		printk(KERN_DEBUG "Chip supports all block unlock\n");
 	if (this->options & ONENAND_HAS_2PLANE)
-		printk(KERN_DEBUG "Chip has 2 plane\n");
+		printk(KERN_DEBUG "Chip has 2 planes\n");
+	if (this->options & ONENAND_HAS_CACHE_READ)
+		printk(KERN_DEBUG "Chip supports the cache read\n");
 }
 
 /**
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index fd0a260..6f952dd 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -160,6 +160,9 @@ struct onenand_chip {
 #define ONENAND_IS_2PLANE(this)			(0)
 #endif
 
+#define ONENAND_CAN_CACHE_READ(this)					\
+	(this->options & ONENAND_HAS_CACHE_READ)
+
 /* Check byte access in OneNAND */
 #define ONENAND_CHECK_BYTE_ACCESS(addr)		(addr & 0x1)
 
@@ -169,6 +172,7 @@ struct onenand_chip {
 #define ONENAND_HAS_CONT_LOCK		(0x0001)
 #define ONENAND_HAS_UNLOCK_ALL		(0x0002)
 #define ONENAND_HAS_2PLANE		(0x0004)
+#define ONENAND_HAS_CACHE_READ		(0x0008)
 #define ONENAND_PAGEBUF_ALLOC		(0x1000)
 #define ONENAND_OOBBUF_ALLOC		(0x2000)
 
diff --git a/include/linux/mtd/onenand_regs.h b/include/linux/mtd/onenand_regs.h
index c46161f..a5f20f6 100644
--- a/include/linux/mtd/onenand_regs.h
+++ b/include/linux/mtd/onenand_regs.h
@@ -90,6 +90,13 @@
 #define ONENAND_DDP_CHIP1		(1 << ONENAND_DDP_SHIFT)
 
 /*
+ * Start Address 4 F103h (R/W)
+ */
+#define ONENAND_FCPA_MASK		(0x3f)
+#define ONENAND_FCPA_SHIFT		(2)
+#define ONENAND_FCSA_MASK		(0x03)
+
+/*
  * Start Address 8 F107h (R/W)
  */
 #define ONENAND_FPA_MASK		(0x3f)
@@ -119,6 +126,8 @@
 #define ONENAND_CMD_LOCK		(0x2A)
 #define ONENAND_CMD_LOCK_TIGHT		(0x2C)
 #define ONENAND_CMD_UNLOCK_ALL		(0x27)
+#define ONENAND_CMD_CACHE_READ		(0x0E)
+#define ONENAND_CMD_FINISH_CACHE_READ	(0x0C)
 #define ONENAND_CMD_ERASE		(0x94)
 #define ONENAND_CMD_RESET		(0xF0)
 #define ONENAND_CMD_OTP_ACCESS		(0x65)
@@ -126,6 +135,8 @@
 
 /* NOTE: Those are not *REAL* commands */
 #define ONENAND_CMD_BUFFERRAM		(0x1978)
+#define ONENAND_CMD_CACHE_READ_FCBA	(0xFCBA)
+#define ONENAND_CMD_CACHE_READ_FBA	(0xFBA)
 
 /*
  * System Configuration 1 Register F221h (R, R/W)
