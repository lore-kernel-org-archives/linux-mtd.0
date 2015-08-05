From: Sheng Yong <shengyong1@huawei.com>
To: <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 1/5] MTD: nandsim: add numchips module parameter
Date: Wed, 5 Aug 2015 08:55:50 +0000
Message-ID: <1438764954-36976-2-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1438764954-36976-1-git-send-email-shengyong1@huawei.com>
References: <1438764954-36976-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some NAND flash consists of multiple chips. numchips supports to simulate
linear chip array.

numchips indicates how many chips are concatenated in the NAND flash. For
now, it supports to simulate up to 16 chips, and 1 chip by default.

In order to simulate multi-chips, we:
* separate the definition of regs and lines from struct nandsim, so that
  each chip could have its own virtual regsiters and pins.
* add a select_chip function to (de)select the request chip.
* change the maxchip parameter of nand_scan_ident() to scan all chips.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 drivers/mtd/nand/nandsim.c | 409 +++++++++++++++++++++++++++------------------
 1 file changed, 242 insertions(+), 167 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 95d0cc4..24a50e5 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -107,6 +107,7 @@ static unsigned int overridesize = 0;
 static char *cache_file = NULL;
 static unsigned int bbt;
 static unsigned int bch;
+static unsigned int numchips = 1;
 static u_char id_bytes[8] = {
 	[0] = CONFIG_NANDSIM_FIRST_ID_BYTE,
 	[1] = CONFIG_NANDSIM_SECOND_ID_BYTE,
@@ -139,6 +140,7 @@ module_param(overridesize,   uint, 0400);
 module_param(cache_file,     charp, 0400);
 module_param(bbt,	     uint, 0400);
 module_param(bch,	     uint, 0400);
+module_param(numchips,	     uint, 0400);
 
 MODULE_PARM_DESC(id_bytes,       "The ID bytes returned by NAND Flash 'read ID' command");
 MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID' command (manufacturer ID) (obsolete)");
@@ -174,6 +176,7 @@ MODULE_PARM_DESC(cache_file,     "File to use to cache nand pages instead of mem
 MODULE_PARM_DESC(bbt,		 "0 OOB, 1 BBT with marker in OOB, 2 BBT with marker in data area");
 MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 				 "be correctable in 512-byte blocks");
+MODULE_PARM_DESC(numchips,	 "Number of chips of the NAND flash (1 by default)");
 
 /* The largest possible page size */
 #define NS_LARGEST_PAGE_SIZE	4096
@@ -203,14 +206,14 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 #define NS_IS_INITIALIZED(ns) ((ns)->geom.totsz != 0)
 
 /* Good operation completion status */
-#define NS_STATUS_OK(ns) (NAND_STATUS_READY | (NAND_STATUS_WP * ((ns)->lines.wp == 0)))
+#define NS_STATUS_OK(ns) (NAND_STATUS_READY | (NAND_STATUS_WP * ((ns)->lines->wp == 0)))
 
 /* Operation failed completion status */
 #define NS_STATUS_FAILED(ns) (NAND_STATUS_FAIL | NS_STATUS_OK(ns))
 
 /* Calculate the page offset in flash RAM image by (row, column) address */
 #define NS_RAW_OFFSET(ns) \
-	(((ns)->regs.row * (ns)->geom.pgszoob) + (ns)->regs.column)
+	(((ns)->regs->row * (ns)->geom.pgszoob) + (ns)->regs->column)
 
 /* Calculate the OOB offset in flash RAM image by (row, column) address */
 #define NS_RAW_OFFSET_OOB(ns) (NS_RAW_OFFSET(ns) + ns->geom.pgsz)
@@ -273,6 +276,8 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 #define OPT_LARGEPAGE    (OPT_PAGE2048 | OPT_PAGE4096) /* 2048 & 4096-byte page chips */
 #define OPT_SMALLPAGE    (OPT_PAGE512) /* 512-byte page chips */
 
+#define NS_MAX_NUM_CHIP	16
+
 /* Remove action bits from state */
 #define NS_STATE(x) ((x) & ~ACTION_MASK)
 
@@ -299,6 +304,27 @@ union ns_mem {
 	uint16_t *word;  /* for 16-bit word access */
 };
 
+/* NAND flash internal registers */
+struct ns_regs {
+	unsigned command; /* the command register */
+	u_char   status;  /* the status register */
+	uint     row;     /* the page number */
+	uint     column;  /* the offset within page */
+	uint     count;   /* internal counter */
+	uint     num;     /* number of bytes which must be processed */
+	uint     off;     /* fixed page offset */
+};
+struct ns_regs *ns_regs;
+
+/* NAND flash lines state */
+struct ns_lines {
+        int ce;  /* chip Enable */
+        int cle; /* command Latch Enable */
+        int ale; /* address Latch Enable */
+        int wp;  /* write Protect */
+};
+struct ns_lines *ns_lines;
+
 /*
  * The structure which describes all the internal simulator data.
  */
@@ -326,6 +352,10 @@ struct nandsim {
 	/* Internal buffer of page + OOB size bytes */
 	union ns_mem buf;
 
+	/* Which chip is selected, protected by sel_lock */
+	spinlock_t sel_lock;
+	int chipselect;
+
 	/* NAND flash "geometry" */
 	struct {
 		uint64_t totsz;     /* total flash size, bytes */
@@ -342,26 +372,12 @@ struct nandsim {
 		uint pgaddrbytes;   /* bytes per page address */
 		uint secaddrbytes;  /* bytes per sector address */
 		uint idbytes;       /* the number ID bytes that this chip outputs */
+		uint numchips;      /* the number of avaliable chips */
 	} geom;
 
-	/* NAND flash internal registers */
-	struct {
-		unsigned command; /* the command register */
-		u_char   status;  /* the status register */
-		uint     row;     /* the page number */
-		uint     column;  /* the offset within page */
-		uint     count;   /* internal counter */
-		uint     num;     /* number of bytes which must be processed */
-		uint     off;     /* fixed page offset */
-	} regs;
-
-	/* NAND flash lines state */
-        struct {
-                int ce;  /* chip Enable */
-                int cle; /* command Latch Enable */
-                int ale; /* address Latch Enable */
-                int wp;  /* write Protect */
-        } lines;
+	/* regs and lines selected */
+	struct ns_regs *regs;
+	struct ns_lines *lines;
 
 	/* Fields needed when using a cache file */
 	struct file *cfile; /* Open file */
@@ -694,6 +710,7 @@ static int init_nandsim(struct mtd_info *mtd)
 	ns->geom.pgshift  = chip->page_shift;
 	ns->geom.pgsec    = ns->geom.secsz / ns->geom.pgsz;
 	ns->geom.secszoob = ns->geom.secsz + ns->geom.oobsz * ns->geom.pgsec;
+	ns->geom.numchips = chip->numchips;
 	ns->options = 0;
 
 	if (ns->geom.pgsz == 512) {
@@ -772,6 +789,7 @@ static int init_nandsim(struct mtd_info *mtd)
 
 	printk("flash size: %llu MiB\n",
 			(unsigned long long)ns->geom.totsz >> 20);
+	printk("chip number: %d\n",             ns->geom.numchips);
 	printk("page size: %u bytes\n",         ns->geom.pgsz);
 	printk("OOB area size: %u bytes\n",     ns->geom.oobsz);
 	printk("sector size: %u KiB\n",         ns->geom.secsz >> 10);
@@ -1178,10 +1196,10 @@ static inline void accept_addr_byte(struct nandsim *ns, u_char bt)
 {
 	uint byte = (uint)bt;
 
-	if (ns->regs.count < (ns->geom.pgaddrbytes - ns->geom.secaddrbytes))
-		ns->regs.column |= (byte << 8 * ns->regs.count);
+	if (ns->regs->count < (ns->geom.pgaddrbytes - ns->geom.secaddrbytes))
+		ns->regs->column |= (byte << 8 * ns->regs->count);
 	else {
-		ns->regs.row |= (byte << 8 * (ns->regs.count -
+		ns->regs->row |= (byte << 8 * (ns->regs->count -
 						ns->geom.pgaddrbytes +
 						ns->geom.secaddrbytes));
 	}
@@ -1196,17 +1214,17 @@ static inline void switch_to_ready_state(struct nandsim *ns, u_char status)
 {
 	NS_DBG("switch_to_ready_state: switch to %s state\n", get_state_name(STATE_READY));
 
-	ns->state       = STATE_READY;
-	ns->nxstate     = STATE_UNKNOWN;
-	ns->op          = NULL;
-	ns->npstates    = 0;
-	ns->stateidx    = 0;
-	ns->regs.num    = 0;
-	ns->regs.count  = 0;
-	ns->regs.off    = 0;
-	ns->regs.row    = 0;
-	ns->regs.column = 0;
-	ns->regs.status = status;
+	ns->state        = STATE_READY;
+	ns->nxstate      = STATE_UNKNOWN;
+	ns->op           = NULL;
+	ns->npstates     = 0;
+	ns->stateidx     = 0;
+	ns->regs->num    = 0;
+	ns->regs->count  = 0;
+	ns->regs->off    = 0;
+	ns->regs->row    = 0;
+	ns->regs->column = 0;
+	ns->regs->status = status;
 }
 
 /*
@@ -1423,7 +1441,7 @@ static ssize_t write_file(struct nandsim *ns, struct file *file, void *buf, size
  */
 static inline union ns_mem *NS_GET_PAGE(struct nandsim *ns)
 {
-	return &(ns->pages[ns->regs.row]);
+	return &(ns->pages[ns->regs->row]);
 }
 
 /*
@@ -1431,12 +1449,12 @@ static inline union ns_mem *NS_GET_PAGE(struct nandsim *ns)
  */
 static inline u_char *NS_PAGE_BYTE_OFF(struct nandsim *ns)
 {
-	return NS_GET_PAGE(ns)->byte + ns->regs.column + ns->regs.off;
+	return NS_GET_PAGE(ns)->byte + ns->regs->column + ns->regs->off;
 }
 
 static int do_read_error(struct nandsim *ns, int num)
 {
-	unsigned int page_no = ns->regs.row;
+	unsigned int page_no = ns->regs->row;
 
 	if (read_error(page_no)) {
 		prandom_bytes(ns->buf.byte, num);
@@ -1457,7 +1475,7 @@ static void do_bit_flips(struct nandsim *ns, int num)
 			ns->buf.byte[pos / 8] ^= (1 << (pos % 8));
 			NS_WARN("read_page: flipping bit %d in page %d "
 				"reading from %d ecc: corrected=%u failed=%u\n",
-				pos, ns->regs.row, ns->regs.column + ns->regs.off,
+				pos, ns->regs->row, ns->regs->column + ns->regs->off,
 				nsmtd->ecc_stats.corrected, nsmtd->ecc_stats.failed);
 		}
 	}
@@ -1471,21 +1489,21 @@ static void read_page(struct nandsim *ns, int num)
 	union ns_mem *mypage;
 
 	if (ns->cfile) {
-		if (!test_bit(ns->regs.row, ns->pages_written)) {
-			NS_DBG("read_page: page %d not written\n", ns->regs.row);
+		if (!test_bit(ns->regs->row, ns->pages_written)) {
+			NS_DBG("read_page: page %d not written\n", ns->regs->row);
 			memset(ns->buf.byte, 0xFF, num);
 		} else {
 			loff_t pos;
 			ssize_t tx;
 
 			NS_DBG("read_page: page %d written, reading from %d\n",
-				ns->regs.row, ns->regs.column + ns->regs.off);
+				ns->regs->row, ns->regs->column + ns->regs->off);
 			if (do_read_error(ns, num))
 				return;
-			pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
+			pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs->off;
 			tx = read_file(ns, ns->cfile, ns->buf.byte, num, pos);
 			if (tx != num) {
-				NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+				NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs->row, (long)tx);
 				return;
 			}
 			do_bit_flips(ns, num);
@@ -1495,11 +1513,11 @@ static void read_page(struct nandsim *ns, int num)
 
 	mypage = NS_GET_PAGE(ns);
 	if (mypage->byte == NULL) {
-		NS_DBG("read_page: page %d not allocated\n", ns->regs.row);
+		NS_DBG("read_page: page %d not allocated\n", ns->regs->row);
 		memset(ns->buf.byte, 0xFF, num);
 	} else {
 		NS_DBG("read_page: page %d allocated, reading from %d\n",
-			ns->regs.row, ns->regs.column + ns->regs.off);
+			ns->regs->row, ns->regs->column + ns->regs->off);
 		if (do_read_error(ns, num))
 			return;
 		memcpy(ns->buf.byte, NS_PAGE_BYTE_OFF(ns), num);
@@ -1517,9 +1535,9 @@ static void erase_sector(struct nandsim *ns)
 
 	if (ns->cfile) {
 		for (i = 0; i < ns->geom.pgsec; i++)
-			if (__test_and_clear_bit(ns->regs.row + i,
+			if (__test_and_clear_bit(ns->regs->row + i,
 						 ns->pages_written)) {
-				NS_DBG("erase_sector: freeing page %d\n", ns->regs.row + i);
+				NS_DBG("erase_sector: freeing page %d\n", ns->regs->row + i);
 			}
 		return;
 	}
@@ -1527,7 +1545,7 @@ static void erase_sector(struct nandsim *ns)
 	mypage = NS_GET_PAGE(ns);
 	for (i = 0; i < ns->geom.pgsec; i++) {
 		if (mypage->byte != NULL) {
-			NS_DBG("erase_sector: freeing page %d\n", ns->regs.row+i);
+			NS_DBG("erase_sector: freeing page %d\n", ns->regs->row+i);
 			kmem_cache_free(ns->nand_pages_slab, mypage->byte);
 			mypage->byte = NULL;
 		}
@@ -1549,34 +1567,34 @@ static int prog_page(struct nandsim *ns, int num)
 		ssize_t tx;
 		int all;
 
-		NS_DBG("prog_page: writing page %d\n", ns->regs.row);
-		pg_off = ns->file_buf + ns->regs.column + ns->regs.off;
-		off = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
-		if (!test_bit(ns->regs.row, ns->pages_written)) {
+		NS_DBG("prog_page: writing page %d\n", ns->regs->row);
+		pg_off = ns->file_buf + ns->regs->column + ns->regs->off;
+		off = (loff_t)NS_RAW_OFFSET(ns) + ns->regs->off;
+		if (!test_bit(ns->regs->row, ns->pages_written)) {
 			all = 1;
 			memset(ns->file_buf, 0xff, ns->geom.pgszoob);
 		} else {
 			all = 0;
 			tx = read_file(ns, ns->cfile, pg_off, num, off);
 			if (tx != num) {
-				NS_ERR("prog_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+				NS_ERR("prog_page: read error for page %d ret %ld\n", ns->regs->row, (long)tx);
 				return -1;
 			}
 		}
 		for (i = 0; i < num; i++)
 			pg_off[i] &= ns->buf.byte[i];
 		if (all) {
-			loff_t pos = (loff_t)ns->regs.row * ns->geom.pgszoob;
+			loff_t pos = (loff_t)ns->regs->row * ns->geom.pgszoob;
 			tx = write_file(ns, ns->cfile, ns->file_buf, ns->geom.pgszoob, pos);
 			if (tx != ns->geom.pgszoob) {
-				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
+				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs->row, (long)tx);
 				return -1;
 			}
-			__set_bit(ns->regs.row, ns->pages_written);
+			__set_bit(ns->regs->row, ns->pages_written);
 		} else {
 			tx = write_file(ns, ns->cfile, pg_off, num, off);
 			if (tx != num) {
-				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
+				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs->row, (long)tx);
 				return -1;
 			}
 		}
@@ -1585,7 +1603,7 @@ static int prog_page(struct nandsim *ns, int num)
 
 	mypage = NS_GET_PAGE(ns);
 	if (mypage->byte == NULL) {
-		NS_DBG("prog_page: allocating page %d\n", ns->regs.row);
+		NS_DBG("prog_page: allocating page %d\n", ns->regs->row);
 		/*
 		 * We allocate memory with GFP_NOFS because a flash FS may
 		 * utilize this. If it is holding an FS lock, then gets here,
@@ -1594,7 +1612,7 @@ static int prog_page(struct nandsim *ns, int num)
 		 */
 		mypage->byte = kmem_cache_alloc(ns->nand_pages_slab, GFP_NOFS);
 		if (mypage->byte == NULL) {
-			NS_ERR("prog_page: error allocating memory for page %d\n", ns->regs.row);
+			NS_ERR("prog_page: error allocating memory for page %d\n", ns->regs->row);
 			return -1;
 		}
 		memset(mypage->byte, 0xFF, ns->geom.pgszoob);
@@ -1621,8 +1639,8 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 	action &= ACTION_MASK;
 
 	/* Check that page address input is correct */
-	if (action != ACTION_SECERASE && ns->regs.row >= ns->geom.pgnum) {
-		NS_WARN("do_state_action: wrong page number (%#x)\n", ns->regs.row);
+	if (action != ACTION_SECERASE && ns->regs->row >= ns->geom.pgnum) {
+		NS_WARN("do_state_action: wrong page number (%#x)\n", ns->regs->row);
 		return -1;
 	}
 
@@ -1634,22 +1652,22 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 		 */
 
 		/* Column shouldn't be very large */
-		if (ns->regs.column >= (ns->geom.pgszoob - ns->regs.off)) {
+		if (ns->regs->column >= (ns->geom.pgszoob - ns->regs->off)) {
 			NS_ERR("do_state_action: column number is too large\n");
 			break;
 		}
-		num = ns->geom.pgszoob - ns->regs.off - ns->regs.column;
+		num = ns->geom.pgszoob - ns->regs->off - ns->regs->column;
 		read_page(ns, num);
 
 		NS_DBG("do_state_action: (ACTION_CPY:) copy %d bytes to int buf, raw offset %d\n",
-			num, NS_RAW_OFFSET(ns) + ns->regs.off);
+			num, NS_RAW_OFFSET(ns) + ns->regs->off);
 
-		if (ns->regs.off == 0)
-			NS_LOG("read page %d\n", ns->regs.row);
-		else if (ns->regs.off < ns->geom.pgsz)
-			NS_LOG("read page %d (second half)\n", ns->regs.row);
+		if (ns->regs->off == 0)
+			NS_LOG("read page %d\n", ns->regs->row);
+		else if (ns->regs->off < ns->geom.pgsz)
+			NS_LOG("read page %d (second half)\n", ns->regs->row);
 		else
-			NS_LOG("read OOB of page %d\n", ns->regs.row);
+			NS_LOG("read OOB of page %d\n", ns->regs->row);
 
 		NS_UDELAY(access_delay);
 		NS_UDELAY(input_cycle * ns->geom.pgsz / 1000 / busdiv);
@@ -1661,25 +1679,25 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 		 * Erase sector.
 		 */
 
-		if (ns->lines.wp) {
+		if (ns->lines->wp) {
 			NS_ERR("do_state_action: device is write-protected, ignore sector erase\n");
 			return -1;
 		}
 
-		if (ns->regs.row >= ns->geom.pgnum - ns->geom.pgsec
-			|| (ns->regs.row & ~(ns->geom.secsz - 1))) {
-			NS_ERR("do_state_action: wrong sector address (%#x)\n", ns->regs.row);
+		if (ns->regs->row >= ns->geom.pgnum - ns->geom.pgsec
+			|| (ns->regs->row & ~(ns->geom.secsz - 1))) {
+			NS_ERR("do_state_action: wrong sector address (%#x)\n", ns->regs->row);
 			return -1;
 		}
 
-		ns->regs.row = (ns->regs.row <<
-				8 * (ns->geom.pgaddrbytes - ns->geom.secaddrbytes)) | ns->regs.column;
-		ns->regs.column = 0;
+		ns->regs->row = (ns->regs->row <<
+				8 * (ns->geom.pgaddrbytes - ns->geom.secaddrbytes)) | ns->regs->column;
+		ns->regs->column = 0;
 
-		erase_block_no = ns->regs.row >> (ns->geom.secshift - ns->geom.pgshift);
+		erase_block_no = ns->regs->row >> (ns->geom.secshift - ns->geom.pgshift);
 
 		NS_DBG("do_state_action: erase sector at address %#x, off = %d\n",
-				ns->regs.row, NS_RAW_OFFSET(ns));
+				ns->regs->row, NS_RAW_OFFSET(ns));
 		NS_LOG("erase sector %u\n", erase_block_no);
 
 		erase_sector(ns);
@@ -1701,26 +1719,26 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 		 * Program page - move internal buffer data to the page.
 		 */
 
-		if (ns->lines.wp) {
+		if (ns->lines->wp) {
 			NS_WARN("do_state_action: device is write-protected, programm\n");
 			return -1;
 		}
 
-		num = ns->geom.pgszoob - ns->regs.off - ns->regs.column;
-		if (num != ns->regs.count) {
+		num = ns->geom.pgszoob - ns->regs->off - ns->regs->column;
+		if (num != ns->regs->count) {
 			NS_ERR("do_state_action: too few bytes were input (%d instead of %d)\n",
-					ns->regs.count, num);
+					ns->regs->count, num);
 			return -1;
 		}
 
 		if (prog_page(ns, num) == -1)
 			return -1;
 
-		page_no = ns->regs.row;
+		page_no = ns->regs->row;
 
 		NS_DBG("do_state_action: copy %d bytes from int buf to (%#x, %#x), raw off = %d\n",
-			num, ns->regs.row, ns->regs.column, NS_RAW_OFFSET(ns) + ns->regs.off);
-		NS_LOG("programm page %d\n", ns->regs.row);
+			num, ns->regs->row, ns->regs->column, NS_RAW_OFFSET(ns) + ns->regs->off);
+		NS_LOG("programm page %d\n", ns->regs->row);
 
 		NS_UDELAY(programm_delay);
 		NS_UDELAY(output_cycle * ns->geom.pgsz / 1000 / busdiv);
@@ -1734,7 +1752,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 
 	case ACTION_ZEROOFF:
 		NS_DBG("do_state_action: set internal offset to 0\n");
-		ns->regs.off = 0;
+		ns->regs->off = 0;
 		break;
 
 	case ACTION_HALFOFF:
@@ -1744,12 +1762,12 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 			return -1;
 		}
 		NS_DBG("do_state_action: set internal offset to %d\n", ns->geom.pgsz/2);
-		ns->regs.off = ns->geom.pgsz/2;
+		ns->regs->off = ns->geom.pgsz/2;
 		break;
 
 	case ACTION_OOBOFF:
 		NS_DBG("do_state_action: set internal offset to %d\n", ns->geom.pgsz);
-		ns->regs.off = ns->geom.pgsz;
+		ns->regs->off = ns->geom.pgsz;
 		break;
 
 	default:
@@ -1794,7 +1812,7 @@ static void switch_state(struct nandsim *ns)
 		 *  The only event causing the switch_state function to
 		 *  be called with yet unknown operation is new command.
 		 */
-		ns->state = get_state_by_command(ns->regs.command);
+		ns->state = get_state_by_command(ns->regs->command);
 
 		NS_DBG("switch_state: operation is unknown, try to find it\n");
 
@@ -1810,7 +1828,7 @@ static void switch_state(struct nandsim *ns)
 	/* For 16x devices column means the page offset in words */
 	if ((ns->nxstate & STATE_ADDR_MASK) && ns->busw == 16) {
 		NS_DBG("switch_state: double the column number for 16x device\n");
-		ns->regs.column <<= 1;
+		ns->regs->column <<= 1;
 	}
 
 	if (NS_STATE(ns->nxstate) == STATE_READY) {
@@ -1822,9 +1840,9 @@ static void switch_state(struct nandsim *ns)
 
 		/* In case of data states, see if all bytes were input/output */
 		if ((ns->state & (STATE_DATAIN_MASK | STATE_DATAOUT_MASK))
-			&& ns->regs.count != ns->regs.num) {
+			&& ns->regs->count != ns->regs->num) {
 			NS_WARN("switch_state: not all bytes were processed, %d left\n",
-					ns->regs.num - ns->regs.count);
+					ns->regs->num - ns->regs->count);
 			status = NS_STATUS_FAILED(ns);
 		}
 
@@ -1840,7 +1858,7 @@ static void switch_state(struct nandsim *ns)
 
 		ns->state      = ns->nxstate;
 		ns->nxstate    = ns->op[++ns->stateidx + 1];
-		ns->regs.num   = ns->regs.count = 0;
+		ns->regs->num  = ns->regs->count = 0;
 
 		NS_DBG("switch_state: the next state is data I/O, switch, "
 			"state: %s, nxstate: %s\n",
@@ -1853,15 +1871,15 @@ static void switch_state(struct nandsim *ns)
 		switch (NS_STATE(ns->state)) {
 			case STATE_DATAIN:
 			case STATE_DATAOUT:
-				ns->regs.num = ns->geom.pgszoob - ns->regs.off - ns->regs.column;
+				ns->regs->num = ns->geom.pgszoob - ns->regs->off - ns->regs->column;
 				break;
 
 			case STATE_DATAOUT_ID:
-				ns->regs.num = ns->geom.idbytes;
+				ns->regs->num = ns->geom.idbytes;
 				break;
 
 			case STATE_DATAOUT_STATUS:
-				ns->regs.count = ns->regs.num = 0;
+				ns->regs->count = ns->regs->num = 0;
 				break;
 
 			default:
@@ -1874,24 +1892,24 @@ static void switch_state(struct nandsim *ns)
 		 * register to the number of expected address bytes
 		 */
 
-		ns->regs.count = 0;
+		ns->regs->count = 0;
 
 		switch (NS_STATE(ns->nxstate)) {
 			case STATE_ADDR_PAGE:
-				ns->regs.num = ns->geom.pgaddrbytes;
+				ns->regs->num = ns->geom.pgaddrbytes;
 
 				break;
 			case STATE_ADDR_SEC:
-				ns->regs.num = ns->geom.secaddrbytes;
+				ns->regs->num = ns->geom.secaddrbytes;
 				break;
 
 			case STATE_ADDR_ZERO:
-				ns->regs.num = 1;
+				ns->regs->num = 1;
 				break;
 
 			case STATE_ADDR_COLUMN:
 				/* Column address is always 2 bytes */
-				ns->regs.num = ns->geom.pgaddrbytes - ns->geom.secaddrbytes;
+				ns->regs->num = ns->geom.pgaddrbytes - ns->geom.secaddrbytes;
 				break;
 
 			default:
@@ -1902,8 +1920,8 @@ static void switch_state(struct nandsim *ns)
 		 * Just reset internal counters.
 		 */
 
-		ns->regs.num = 0;
-		ns->regs.count = 0;
+		ns->regs->num = 0;
+		ns->regs->count = 0;
 	}
 }
 
@@ -1913,11 +1931,11 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
 	u_char outb = 0x00;
 
 	/* Sanity and correctness checks */
-	if (!ns->lines.ce) {
+	if (!ns->lines->ce) {
 		NS_ERR("read_byte: chip is disabled, return %#x\n", (uint)outb);
 		return outb;
 	}
-	if (ns->lines.ale || ns->lines.cle) {
+	if (ns->lines->ale || ns->lines->cle) {
 		NS_ERR("read_byte: ALE or CLE pin is high, return %#x\n", (uint)outb);
 		return outb;
 	}
@@ -1929,12 +1947,12 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
 
 	/* Status register may be read as many times as it is wanted */
 	if (NS_STATE(ns->state) == STATE_DATAOUT_STATUS) {
-		NS_DBG("read_byte: return %#x status\n", ns->regs.status);
-		return ns->regs.status;
+		NS_DBG("read_byte: return %#x status\n", ns->regs->status);
+		return ns->regs->status;
 	}
 
 	/* Check if there is any data in the internal buffer which may be read */
-	if (ns->regs.count == ns->regs.num) {
+	if (ns->regs->count == ns->regs->num) {
 		NS_WARN("read_byte: no more data to output, return %#x\n", (uint)outb);
 		return outb;
 	}
@@ -1942,23 +1960,23 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
 	switch (NS_STATE(ns->state)) {
 		case STATE_DATAOUT:
 			if (ns->busw == 8) {
-				outb = ns->buf.byte[ns->regs.count];
-				ns->regs.count += 1;
+				outb = ns->buf.byte[ns->regs->count];
+				ns->regs->count += 1;
 			} else {
-				outb = (u_char)cpu_to_le16(ns->buf.word[ns->regs.count >> 1]);
-				ns->regs.count += 2;
+				outb = (u_char)cpu_to_le16(ns->buf.word[ns->regs->count >> 1]);
+				ns->regs->count += 2;
 			}
 			break;
 		case STATE_DATAOUT_ID:
-			NS_DBG("read_byte: read ID byte %d, total = %d\n", ns->regs.count, ns->regs.num);
-			outb = ns->ids[ns->regs.count];
-			ns->regs.count += 1;
+			NS_DBG("read_byte: read ID byte %d, total = %d\n", ns->regs->count, ns->regs->num);
+			outb = ns->ids[ns->regs->count];
+			ns->regs->count += 1;
 			break;
 		default:
 			BUG();
 	}
 
-	if (ns->regs.count == ns->regs.num) {
+	if (ns->regs->count == ns->regs->num) {
 		NS_DBG("read_byte: all bytes were read\n");
 
 		if (NS_STATE(ns->nxstate) == STATE_READY)
@@ -1973,16 +1991,16 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 	struct nandsim *ns = ((struct nand_chip *)mtd->priv)->priv;
 
 	/* Sanity and correctness checks */
-	if (!ns->lines.ce) {
+	if (!ns->lines->ce) {
 		NS_ERR("write_byte: chip is disabled, ignore write\n");
 		return;
 	}
-	if (ns->lines.ale && ns->lines.cle) {
+	if (ns->lines->ale && ns->lines->cle) {
 		NS_ERR("write_byte: ALE and CLE pins are high simultaneously, ignore write\n");
 		return;
 	}
 
-	if (ns->lines.cle == 1) {
+	if (ns->lines->cle == 1) {
 		/*
 		 * The byte written is a command.
 		 */
@@ -2001,18 +2019,18 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 		if (NS_STATE(ns->state) == STATE_DATAOUT_STATUS
 			|| NS_STATE(ns->state) == STATE_DATAOUT) {
-			int row = ns->regs.row;
+			int row = ns->regs->row;
 
 			switch_state(ns);
 			if (byte == NAND_CMD_RNDOUT)
-				ns->regs.row = row;
+				ns->regs->row = row;
 		}
 
 		/* Check if chip is expecting command */
 		if (NS_STATE(ns->nxstate) != STATE_UNKNOWN && !(ns->nxstate & STATE_CMD_MASK)) {
 			/* Do not warn if only 2 id bytes are read */
-			if (!(ns->regs.command == NAND_CMD_READID &&
-			    NS_STATE(ns->state) == STATE_DATAOUT_ID && ns->regs.count == 2)) {
+			if (!(ns->regs->command == NAND_CMD_READID &&
+			    NS_STATE(ns->state) == STATE_DATAOUT_ID && ns->regs->count == 2)) {
 				/*
 				 * We are in situation when something else (not command)
 				 * was expected but command was input. In this case ignore
@@ -2026,10 +2044,10 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 		NS_DBG("command byte corresponding to %s state accepted\n",
 			get_state_name(get_state_by_command(byte)));
-		ns->regs.command = byte;
+		ns->regs->command = byte;
 		switch_state(ns);
 
-	} else if (ns->lines.ale == 1) {
+	} else if (ns->lines->ale == 1) {
 		/*
 		 * The byte written is an address.
 		 */
@@ -2046,16 +2064,16 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 				return;
 			}
 
-			ns->regs.count = 0;
+			ns->regs->count = 0;
 			switch (NS_STATE(ns->nxstate)) {
 				case STATE_ADDR_PAGE:
-					ns->regs.num = ns->geom.pgaddrbytes;
+					ns->regs->num = ns->geom.pgaddrbytes;
 					break;
 				case STATE_ADDR_SEC:
-					ns->regs.num = ns->geom.secaddrbytes;
+					ns->regs->num = ns->geom.secaddrbytes;
 					break;
 				case STATE_ADDR_ZERO:
-					ns->regs.num = 1;
+					ns->regs->num = 1;
 					break;
 				default:
 					BUG();
@@ -2071,7 +2089,7 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 		}
 
 		/* Check if this is expected byte */
-		if (ns->regs.count == ns->regs.num) {
+		if (ns->regs->count == ns->regs->num) {
 			NS_ERR("write_byte: no more address bytes expected\n");
 			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 			return;
@@ -2079,13 +2097,13 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 		accept_addr_byte(ns, byte);
 
-		ns->regs.count += 1;
+		ns->regs->count += 1;
 
 		NS_DBG("write_byte: address byte %#x was accepted (%d bytes input, %d expected)\n",
-				(uint)byte, ns->regs.count, ns->regs.num);
+				(uint)byte, ns->regs->count, ns->regs->num);
 
-		if (ns->regs.count == ns->regs.num) {
-			NS_DBG("address (%#x, %#x) is accepted\n", ns->regs.row, ns->regs.column);
+		if (ns->regs->count == ns->regs->num) {
+			NS_DBG("address (%#x, %#x) is accepted\n", ns->regs->row, ns->regs->column);
 			switch_state(ns);
 		}
 
@@ -2104,18 +2122,18 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 		}
 
 		/* Check if this is expected byte */
-		if (ns->regs.count == ns->regs.num) {
+		if (ns->regs->count == ns->regs->num) {
 			NS_WARN("write_byte: %u input bytes has already been accepted, ignore write\n",
-					ns->regs.num);
+					ns->regs->num);
 			return;
 		}
 
 		if (ns->busw == 8) {
-			ns->buf.byte[ns->regs.count] = byte;
-			ns->regs.count += 1;
+			ns->buf.byte[ns->regs->count] = byte;
+			ns->regs->count += 1;
 		} else {
-			ns->buf.word[ns->regs.count >> 1] = cpu_to_le16((uint16_t)byte);
-			ns->regs.count += 2;
+			ns->buf.word[ns->regs->count >> 1] = cpu_to_le16((uint16_t)byte);
+			ns->regs->count += 2;
 		}
 	}
 
@@ -2126,9 +2144,9 @@ static void ns_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int bitmask)
 {
 	struct nandsim *ns = ((struct nand_chip *)mtd->priv)->priv;
 
-	ns->lines.cle = bitmask & NAND_CLE ? 1 : 0;
-	ns->lines.ale = bitmask & NAND_ALE ? 1 : 0;
-	ns->lines.ce = bitmask & NAND_NCE ? 1 : 0;
+	ns->lines->cle = bitmask & NAND_CLE ? 1 : 0;
+	ns->lines->ale = bitmask & NAND_ALE ? 1 : 0;
+	ns->lines->ce = bitmask & NAND_NCE ? 1 : 0;
 
 	if (cmd != NAND_CMD_NONE)
 		ns_nand_write_byte(mtd, cmd);
@@ -2162,17 +2180,17 @@ static void ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 	}
 
 	/* Check if these are expected bytes */
-	if (ns->regs.count + len > ns->regs.num) {
+	if (ns->regs->count + len > ns->regs->num) {
 		NS_ERR("write_buf: too many input bytes\n");
 		switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		return;
 	}
 
-	memcpy(ns->buf.byte + ns->regs.count, buf, len);
-	ns->regs.count += len;
+	memcpy(ns->buf.byte + ns->regs->count, buf, len);
+	ns->regs->count += len;
 
-	if (ns->regs.count == ns->regs.num) {
-		NS_DBG("write_buf: %d bytes were written\n", ns->regs.count);
+	if (ns->regs->count == ns->regs->num) {
+		NS_DBG("write_buf: %d bytes were written\n", ns->regs->count);
 	}
 }
 
@@ -2181,11 +2199,11 @@ static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 	struct nandsim *ns = ((struct nand_chip *)mtd->priv)->priv;
 
 	/* Sanity and correctness checks */
-	if (!ns->lines.ce) {
+	if (!ns->lines->ce) {
 		NS_ERR("read_buf: chip is disabled\n");
 		return;
 	}
-	if (ns->lines.ale || ns->lines.cle) {
+	if (ns->lines->ale || ns->lines->cle) {
 		NS_ERR("read_buf: ALE or CLE pin is high\n");
 		return;
 	}
@@ -2205,16 +2223,16 @@ static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 	}
 
 	/* Check if these are expected bytes */
-	if (ns->regs.count + len > ns->regs.num) {
+	if (ns->regs->count + len > ns->regs->num) {
 		NS_ERR("read_buf: too many bytes to read\n");
 		switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		return;
 	}
 
-	memcpy(buf, ns->buf.byte + ns->regs.count, len);
-	ns->regs.count += len;
+	memcpy(buf, ns->buf.byte + ns->regs->count, len);
+	ns->regs->count += len;
 
-	if (ns->regs.count == ns->regs.num) {
+	if (ns->regs->count == ns->regs->num) {
 		if (NS_STATE(ns->nxstate) == STATE_READY)
 			switch_state(ns);
 	}
@@ -2222,6 +2240,38 @@ static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 	return;
 }
 
+static void ns_select_chip(struct mtd_info *mtd, int chipselect)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct nandsim *ns = chip->priv;
+	int i;
+
+	if (chipselect == -1) {
+		/* disable all chips */
+		for (i = 0; i < numchips; i++) {
+			ns_lines[i].ce    = 0;
+			ns_lines[i].ale   = 0;
+			ns_lines[i].cle   = 0;
+			ns_regs[i].row    = 0;
+			ns_regs[i].column = 0;
+			ns_regs[i].count  = 0;
+			ns_regs[i].num    = 0;
+			ns_regs[i].off    = 0;
+		}
+		if (spin_is_locked(&ns->sel_lock))
+			spin_unlock(&ns->sel_lock);
+	} else if (chipselect >= 0 && chipselect < chip->numchips) {
+		spin_lock(&ns->sel_lock);
+		ns->chipselect = chipselect;
+		ns->regs = &ns_regs[ns->chipselect];
+		ns->lines = &ns_lines[ns->chipselect];
+	} else {
+		ns->chipselect = -1;
+		NS_ERR("chip %d not exist, max numchips is %d, avaliable numchips is %d\n",
+		       chipselect, numchips, chip->numchips);
+	}
+}
+
 /*
  * Module initialization function
  */
@@ -2229,6 +2279,7 @@ static int __init ns_init_module(void)
 {
 	struct nand_chip *chip;
 	struct nandsim *nand;
+	size_t size;
 	int retval = -ENOMEM, i;
 
 	if (bus_width != 8 && bus_width != 16) {
@@ -2236,9 +2287,17 @@ static int __init ns_init_module(void)
 		return -EINVAL;
 	}
 
+	if (numchips > NS_MAX_NUM_CHIP) {
+		NS_ERR("numchips %d is too large, the max value is %d\n",
+			numchips, NS_MAX_NUM_CHIP);
+		return -EINVAL;
+	}
+
 	/* Allocate and initialize mtd_info, nand_chip and nandsim structures */
-	nsmtd = kzalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip)
-				+ sizeof(struct nandsim), GFP_KERNEL);
+	size = sizeof(struct mtd_info) + sizeof(struct nand_chip) +
+		sizeof(struct nandsim) + sizeof(struct ns_regs) * numchips +
+		sizeof(struct ns_lines) * numchips;
+	nsmtd = kzalloc(size, GFP_KERNEL);
 	if (!nsmtd) {
 		NS_ERR("unable to allocate core structures.\n");
 		return -ENOMEM;
@@ -2247,20 +2306,25 @@ static int __init ns_init_module(void)
         nsmtd->priv = (void *)chip;
 	nand        = (struct nandsim *)(chip + 1);
 	chip->priv  = (void *)nand;
+	ns_regs     = (struct ns_regs *)(nand + 1);
+	ns_lines    = (struct ns_lines *)(ns_regs + numchips);
+
+	spin_lock_init(&nand->sel_lock);
 
 	/*
 	 * Register simulator's callbacks.
 	 */
-	chip->cmd_ctrl	 = ns_hwcontrol;
-	chip->read_byte  = ns_nand_read_byte;
-	chip->dev_ready  = ns_device_ready;
-	chip->write_buf  = ns_nand_write_buf;
-	chip->read_buf   = ns_nand_read_buf;
-	chip->read_word  = ns_nand_read_word;
-	chip->ecc.mode   = NAND_ECC_SOFT;
+	chip->select_chip = ns_select_chip;
+	chip->cmd_ctrl	  = ns_hwcontrol;
+	chip->read_byte   = ns_nand_read_byte;
+	chip->dev_ready   = ns_device_ready;
+	chip->write_buf   = ns_nand_write_buf;
+	chip->read_buf    = ns_nand_read_buf;
+	chip->read_word   = ns_nand_read_word;
+	chip->ecc.mode    = NAND_ECC_SOFT;
 	/* The NAND_SKIP_BBTSCAN option is necessary for 'overridesize' */
 	/* and 'badblocks' parameters to work */
-	chip->options   |= NAND_SKIP_BBTSCAN;
+	chip->options    |= NAND_SKIP_BBTSCAN;
 
 	switch (bbt) {
 	case 2:
@@ -2286,7 +2350,18 @@ static int __init ns_init_module(void)
 		nand->geom.idbytes = 4;
 	else
 		nand->geom.idbytes = 2;
-	nand->regs.status = NS_STATUS_OK(nand);
+
+	/* init chip status */
+	/* XXX: chip->numchips will be init and overwrite when
+	 * scan_nand_ident(). Here we init it temporarily, so that
+	 * we can select the correct chip the first time select_chip
+	 * is called.
+	 */
+	chip->numchips = numchips;
+	nand->chipselect = 0;
+	for (i = 0; i < numchips; i++)
+		ns_regs[i].status = NAND_STATUS_READY;
+
 	nand->nxstate = STATE_UNKNOWN;
 	nand->options |= OPT_PAGE512; /* temporary value */
 	memcpy(nand->ids, id_bytes, sizeof(nand->ids));
@@ -2306,7 +2381,7 @@ static int __init ns_init_module(void)
 	if ((retval = parse_gravepages()) != 0)
 		goto error;
 
-	retval = nand_scan_ident(nsmtd, 1, NULL);
+	retval = nand_scan_ident(nsmtd, numchips, NULL);
 	if (retval) {
 		NS_ERR("cannot scan NAND Simulator device\n");
 		if (retval > 0)
@@ -2358,7 +2433,7 @@ static int __init ns_init_module(void)
 			goto err_exit;
 		}
 		/* N.B. This relies on nand_scan not doing anything with the size before we change it */
-		nsmtd->size = new_size;
+		nsmtd->size = new_size * chip->numchips;
 		chip->chipsize = new_size;
 		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
 		chip->pagemask = (chip->chipsize >> chip->page_shift) - 1;
-- 
1.8.3.4
