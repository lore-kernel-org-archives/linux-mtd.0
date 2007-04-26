Received: from [210.94.41.89] (helo=july7)
	by pentafluge.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1HgtXZ-0003Ra-0P
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 03:17:02 +0100
From: "Kyungmin Park" <kmpark@infradead.org>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] OneNAND 2x program support
Date: Thu, 26 Apr 2007 11:16:54 +0900
Message-ID: <000701c787a8$f968a9f0$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
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

Here's new feature of OneNAND, 2X program.

Now you can select the 2x program mode or not.
In 2x program mode, it does not match the previous address scheme, so we need to
change the address translation since it programs the two block with same page
address. It assumes that it has 2 block as a segment and 4KB as a write buffer.
Of course It don't break the previous address translation if don't support it.

It's simple description of 2x program
"The 2X Program is an extension of Program Operation. Since the device is
equipped with two DataRAMs,
and two-plane NAND Flash memory array, these two component enables simultaneous
program of 4KB.
Plane1 has only even blocks such as block0, block2, block4 while Plane2 has only
odd blocks such as block1, block3, block5."

Note: this features is supported with the recent OneNAND chips. please don't try
to use previous chips.

Any comments are welcome.

Thank you,
Kyungmin Park

--

diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index c257d39..a737f82 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -40,4 +40,13 @@ config MTD_ONENAND_OTP
 
 	  OTP block is fully-guaranteed to be a valid block.
 
+config MTD_ONENAND_2X_PROGRAM
+	bool "OneNAND 2X program support"
+	help
+	  The 2X Program is an extension of Program Operation.
+	  Since the device is equipped with two DataRAMs, and two-plane NAND
+	  Flash memory array, these two component enables simultaneous program
+	  of 4KB. Plane1 has only even blocks such as block0, block2, block4
+	  while Plane2 has only odd blocks such as block1, block3, block5.
+
 endif # MTD_ONENAND
diff --git a/drivers/mtd/onenand/onenand_base.c
b/drivers/mtd/onenand/onenand_base.c
index 000794c..891c29c 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -206,6 +206,15 @@ static int onenand_command(struct mtd_info *mtd, int cmd,
loff_t addr, size_t le
 	default:
 		block = (int) (addr >> this->erase_shift);
 		page = (int) (addr >> this->page_shift);
+
+		if (ONENAND_IS_2PLANE(this)) {
+			/* Make the even block number */
+			block &= ~1;
+			/* Is it the odd plane? */
+			if (addr & this->writesize)
+				block++;
+			page >>= 1;
+		}
 		page &= this->page_mask;
 		break;
 	}
@@ -216,8 +225,12 @@ static int onenand_command(struct mtd_info *mtd, int cmd,
loff_t addr, size_t le
 		value = onenand_bufferram_address(this, block);
 		this->write_word(value, this->base +
ONENAND_REG_START_ADDRESS2);
 
-		/* Switch to the next data buffer */
-		ONENAND_SET_NEXT_BUFFERRAM(this);
+		if (ONENAND_IS_2PLANE(this))
+			/* It is always BufferRAM0 */
+			ONENAND_SET_BUFFERRAM0(this);
+		else
+			/* Switch to the next data buffer */
+			ONENAND_SET_NEXT_BUFFERRAM(this);
 
 		return 0;
 	}
@@ -247,6 +260,8 @@ static int onenand_command(struct mtd_info *mtd, int cmd,
loff_t addr, size_t le
 			break;
 
 		default:
+			if (ONENAND_IS_2PLANE(this) && cmd == ONENAND_CMD_PROG)
+				cmd = ONENAND_CMD_2X_PROG;
 			dataram = ONENAND_CURRENT_BUFFERRAM(this);
 			break;
 		}
@@ -445,8 +460,9 @@ static inline int onenand_bufferram_offset(struct mtd_info
*mtd, int area)
 	struct onenand_chip *this = mtd->priv;
 
 	if (ONENAND_CURRENT_BUFFERRAM(this)) {
+		/* Note: the 'this->writesize' is a real page size */
 		if (area == ONENAND_DATARAM)
-			return mtd->writesize;
+			return this->writesize;
 		if (area == ONENAND_SPARERAM)
 			return mtd->oobsize;
 	}
@@ -572,6 +588,30 @@ static int onenand_write_bufferram(struct mtd_info *mtd,
int area,
 }
 
 /**
+ * onenand_get_2x_blockpage - [GENERIC] Get blockpage at 2x program mode
+ * @param mtd		MTD data structure
+ * @param addr		address to check
+ * @return		blockpage address
+ *
+ * Get blockpage address at 2x program mode
+ */
+static int onenand_get_2x_blockpage(struct mtd_info *mtd, loff_t addr)
+{
+	struct onenand_chip *this = mtd->priv;
+	int blockpage, block, page;
+
+	/* Calculate the even block number */
+	block = (int) (addr >> this->erase_shift) & ~1;
+	/* Is it the odd plane? */
+	if (addr & this->writesize)
+		block++;
+	page = (int) (addr >> (this->page_shift + 1)) & this->page_mask;
+	blockpage = (block << 7) | page;
+
+	return blockpage;
+}
+
+/**
  * onenand_check_bufferram - [GENERIC] Check BufferRAM information
  * @param mtd		MTD data structure
  * @param addr		address to check
@@ -585,7 +625,10 @@ static int onenand_check_bufferram(struct mtd_info *mtd,
loff_t addr)
 	int blockpage, found = 0;
 	unsigned int i;
 
-	blockpage = (int) (addr >> this->page_shift);
+	if (ONENAND_IS_2PLANE(this))
+		blockpage = onenand_get_2x_blockpage(mtd, addr);
+	else
+		blockpage = (int) (addr >> this->page_shift);
 
 	/* Is there valid data? */
 	i = ONENAND_CURRENT_BUFFERRAM(this);
@@ -625,7 +668,10 @@ static void onenand_update_bufferram(struct mtd_info *mtd,
loff_t addr,
 	int blockpage;
 	unsigned int i;
 
-	blockpage = (int) (addr >> this->page_shift);
+	if (ONENAND_IS_2PLANE(this))
+		blockpage = onenand_get_2x_blockpage(mtd, addr);
+	else
+		blockpage = (int) (addr >> this->page_shift);
 
 	/* Invalidate another BufferRAM */
 	i = ONENAND_NEXT_BUFFERRAM(this);
@@ -734,6 +780,7 @@ static int onenand_read(struct mtd_info *mtd, loff_t from,
size_t len,
 	int read = 0, column;
 	int thislen;
 	int ret = 0, boundary = 0;
+	int writesize = this->writesize;
 
 	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read: from = 0x%08x, len = %i\n",
(unsigned int) from, (int) len);
 
@@ -754,22 +801,22 @@ static int onenand_read(struct mtd_info *mtd, loff_t from,
size_t len,
  	/* Do first load to bufferRAM */
  	if (read < len) {
  		if (!onenand_check_bufferram(mtd, from)) {
- 			this->command(mtd, ONENAND_CMD_READ, from,
mtd->writesize);
+ 			this->command(mtd, ONENAND_CMD_READ, from, writesize);
  			ret = this->wait(mtd, FL_READING);
  			onenand_update_bufferram(mtd, from, !ret);
  		}
  	}
 
- 	thislen = min_t(int, mtd->writesize, len - read);
- 	column = from & (mtd->writesize - 1);
- 	if (column + thislen > mtd->writesize)
- 		thislen = mtd->writesize - column;
+ 	thislen = min_t(int, writesize, len - read);
+ 	column = from & (writesize - 1);
+ 	if (column + thislen > writesize)
+ 		thislen = writesize - column;
 
  	while (!ret) {
  		/* If there is more to load then start next load */
  		from += thislen;
  		if (read + thislen < len) {
- 			this->command(mtd, ONENAND_CMD_READ, from,
mtd->writesize);
+ 			this->command(mtd, ONENAND_CMD_READ, from, writesize);
  			/*
  			 * Chip boundary handling in DDP
  			 * Now we issued chip 1 read and pointed chip 1
@@ -794,7 +841,7 @@ static int onenand_read(struct mtd_info *mtd, loff_t from,
size_t len,
  			this->write_word(ONENAND_DDP_CHIP1, this->base +
ONENAND_REG_START_ADDRESS2);
  		ONENAND_SET_NEXT_BUFFERRAM(this);
  		buf += thislen;
- 		thislen = min_t(int, mtd->writesize, len - read);
+ 		thislen = min_t(int, writesize, len - read);
  		column = 0;
  		cond_resched();
  		/* Now wait for load */
@@ -1079,7 +1126,7 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t
from,
 		/* Read more? */
 		if (read < len) {
 			/* Update Page size */
-			from += mtd->writesize;
+			from += this->writesize;
 			column = 0;
 		}
 	}
@@ -1135,12 +1182,12 @@ static int onenand_verify(struct mtd_info *mtd, const
u_char *buf, loff_t addr,
 	int thislen, column;
 
 	while (len != 0) {
-		thislen = min_t(int, mtd->writesize, len);
-		column = addr & (mtd->writesize - 1);
-		if (column + thislen > mtd->writesize)
-			thislen = mtd->writesize - column;
+		thislen = min_t(int, this->writesize, len);
+		column = addr & (this->writesize - 1);
+		if (column + thislen > this->writesize)
+			thislen = this->writesize - column;
 
-		this->command(mtd, ONENAND_CMD_READ, addr, mtd->writesize);
+		this->command(mtd, ONENAND_CMD_READ, addr, this->writesize);
 
 		onenand_update_bufferram(mtd, addr, 0);
 
@@ -1236,6 +1283,10 @@ static int onenand_write(struct mtd_info *mtd, loff_t to,
size_t len,
 
 		/* In partial page write we don't update bufferram */
 		onenand_update_bufferram(mtd, to, !ret && !subpage);
+		if (ONENAND_IS_2PLANE(this)) {
+			ONENAND_SET_BUFFERRAM1(this);
+			onenand_update_bufferram(mtd, to + this->writesize, !ret
&& !subpage);
+		}
 
 		if (ret) {
 			printk(KERN_ERR "onenand_write: write filaed %d\n",
ret);
@@ -1384,6 +1435,10 @@ static int onenand_do_write_oob(struct mtd_info *mtd,
loff_t to, size_t len,
 		this->command(mtd, ONENAND_CMD_PROGOOB, to, mtd->oobsize);
 
 		onenand_update_bufferram(mtd, to, 0);
+		if (ONENAND_IS_2PLANE(this)) {
+			ONENAND_SET_BUFFERRAM1(this);
+			onenand_update_bufferram(mtd, to + this->writesize, 0);
+		}
 
 		ret = this->wait(mtd, FL_WRITING);
 		if (ret) {
@@ -2107,6 +2162,7 @@ static int onenand_lock_user_prot_reg(struct mtd_info
*mtd, loff_t from,
  *
  * Check and set OneNAND features
  * - lock scheme
+ * - two plane
  */
 static void onenand_check_features(struct mtd_info *mtd)
 {
@@ -2118,19 +2174,35 @@ static void onenand_check_features(struct mtd_info *mtd)
 	process = this->version_id >> ONENAND_VERSION_PROCESS_SHIFT;
 
 	/* Lock scheme */
-	if (density >= ONENAND_DEVICE_DENSITY_1Gb) {
+	switch (density) {
+	case ONENAND_DEVICE_DENSITY_4Gb:
+		this->options |= ONENAND_HAS_2PLANE;
+
+	case ONENAND_DEVICE_DENSITY_2Gb:
+		/* 2Gb DDP don't have 2 plane */
+		if (!ONENAND_IS_DDP(this))
+			this->options |= ONENAND_HAS_2PLANE;
+		this->options |= ONENAND_HAS_UNLOCK_ALL;
+
+	case ONENAND_DEVICE_DENSITY_1Gb:
 		/* A-Die has all block unlock */
-		if (process) {
-			printk(KERN_DEBUG "Chip support all block unlock\n");
+		if (process)
 			this->options |= ONENAND_HAS_UNLOCK_ALL;
-		}
-	} else {
-		/* Some OneNAND has continues lock scheme */
-		if (!process) {
-			printk(KERN_DEBUG "Lock scheme is Continues Lock\n");
+		break;
+
+	default:
+		/* Some OneNAND has continuous lock scheme */
+		if (!process)
 			this->options |= ONENAND_HAS_CONT_LOCK;
-		}
+		break;
 	}
+
+	if (this->options & ONENAND_HAS_CONT_LOCK)
+		printk(KERN_DEBUG "Lock scheme is Continuous Lock\n");
+	if (this->options & ONENAND_HAS_UNLOCK_ALL)
+		printk(KERN_DEBUG "Chip support all block unlock\n");
+	if (this->options & ONENAND_HAS_2PLANE)
+		printk(KERN_DEBUG "Chip has 2 plane\n");
 }
 
 /**
@@ -2257,6 +2329,8 @@ static int onenand_probe(struct mtd_info *mtd)
 	this->erase_shift = ffs(mtd->erasesize) - 1;
 	this->page_shift = ffs(mtd->writesize) - 1;
 	this->page_mask = (1 << (this->erase_shift - this->page_shift)) - 1;
+	/* It's real page size */
+	this->writesize = mtd->writesize;
 
 	/* REVIST: Multichip handling */
 
@@ -2265,6 +2339,17 @@ static int onenand_probe(struct mtd_info *mtd)
 	/* Check OneNAND features */
 	onenand_check_features(mtd);
 
+	/*
+	 * We emulate the 4KB page and 256KB erase block size
+	 * But oobsize is still 64 bytes.
+	 * It is only valid if you turn on 2X program support,
+	 * Otherwise it will be ignored by compiler.
+	 */
+	if (ONENAND_IS_2PLANE(this)) {
+		mtd->writesize <<= 1;
+		mtd->erasesize <<= 1;
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index a56d24a..fd0a260 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -60,6 +60,7 @@ struct onenand_bufferram {
  * @erase_shift:	[INTERN] number of address bits in a block
  * @page_shift:		[INTERN] number of address bits in a page
  * @page_mask:		[INTERN] a page per block mask
+ * @writesize:		[INTERN] a real page size
  * @bufferram_index:	[INTERN] BufferRAM index
  * @bufferram:		[INTERN] BufferRAM info
  * @readw:		[REPLACEABLE] hardware specific function for read short
@@ -100,6 +101,7 @@ struct onenand_chip {
 	unsigned int		erase_shift;
 	unsigned int		page_shift;
 	unsigned int		page_mask;
+	unsigned int		writesize;
 
 	unsigned int		bufferram_index;
 	struct onenand_bufferram	bufferram[MAX_BUFFERRAM];
@@ -140,6 +142,8 @@ struct onenand_chip {
 #define ONENAND_NEXT_BUFFERRAM(this)		(this->bufferram_index ^ 1)
 #define ONENAND_SET_NEXT_BUFFERRAM(this)	(this->bufferram_index ^= 1)
 #define ONENAND_SET_PREV_BUFFERRAM(this)	(this->bufferram_index ^= 1)
+#define ONENAND_SET_BUFFERRAM0(this)		(this->bufferram_index = 0)
+#define ONENAND_SET_BUFFERRAM1(this)		(this->bufferram_index = 1)
 
 #define ONENAND_GET_SYS_CFG1(this)					\
 	(this->read_word(this->base + ONENAND_REG_SYS_CFG1))
@@ -149,6 +153,13 @@ struct onenand_chip {
 #define ONENAND_IS_DDP(this)						\
 	(this->device_id & ONENAND_DEVICE_IS_DDP)
 
+#ifdef CONFIG_MTD_ONENAND_2X_PROGRAM
+#define ONENAND_IS_2PLANE(this)
\
+	(this->options & ONENAND_HAS_2PLANE)
+#else
+#define ONENAND_IS_2PLANE(this)			(0)
+#endif
+
 /* Check byte access in OneNAND */
 #define ONENAND_CHECK_BYTE_ACCESS(addr)		(addr & 0x1)
 
@@ -157,6 +168,7 @@ struct onenand_chip {
  */
 #define ONENAND_HAS_CONT_LOCK		(0x0001)
 #define ONENAND_HAS_UNLOCK_ALL		(0x0002)
+#define ONENAND_HAS_2PLANE		(0x0004)
 #define ONENAND_PAGEBUF_ALLOC		(0x1000)
 #define ONENAND_OOBBUF_ALLOC		(0x2000)
 
diff --git a/include/linux/mtd/onenand_regs.h b/include/linux/mtd/onenand_regs.h
index af94719..c46161f 100644
--- a/include/linux/mtd/onenand_regs.h
+++ b/include/linux/mtd/onenand_regs.h
@@ -74,6 +74,8 @@
 
 #define ONENAND_DEVICE_DENSITY_512Mb	(0x002)
 #define ONENAND_DEVICE_DENSITY_1Gb	(0x003)
+#define ONENAND_DEVICE_DENSITY_2Gb	(0x004)
+#define ONENAND_DEVICE_DENSITY_4Gb	(0x005)
 
 /*
  * Version ID Register F002h (R)
@@ -111,6 +113,8 @@
 #define ONENAND_CMD_READOOB		(0x13)
 #define ONENAND_CMD_PROG		(0x80)
 #define ONENAND_CMD_PROGOOB		(0x1A)
+#define ONENAND_CMD_2X_PROG		(0x7D)
+#define ONENAND_CMD_2X_CACHE_PROG	(0x7F)
 #define ONENAND_CMD_UNLOCK		(0x23)
 #define ONENAND_CMD_LOCK		(0x2A)
 #define ONENAND_CMD_LOCK_TIGHT		(0x2C)
