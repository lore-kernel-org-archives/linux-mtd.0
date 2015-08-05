From: Sheng Yong <shengyong1@huawei.com>
To: <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 5/5] MTD: nandsim: extent outprint messages
Date: Wed, 5 Aug 2015 08:55:54 +0000
Message-ID: <1438764954-36976-6-git-send-email-shengyong1@huawei.com>
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

* Replace printk with pr_{devel|info|warn|err}.
* Add NS_{DBG|INFO|WARN|ERR}_CHIP to print chip number, e.g.
  [nandsim] chip0: error: do_state_action: too few bytes were input (512 instead of 528)

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 drivers/mtd/nand/nandsim.c | 244 ++++++++++++++++++++++++---------------------
 1 file changed, 132 insertions(+), 112 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 5406ea7..b1cbc7e 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -182,19 +182,37 @@ MODULE_PARM_DESC(numchips,	 "Number of chips of the NAND flash (1 by default)");
 #define NS_LARGEST_PAGE_SIZE	4096
 
 /* The prefix for simulator output */
-#define NS_OUTPUT_PREFIX "[nandsim]"
+#define NS_PREFIX "[nandsim]"
+
+/* Get selected chip */
+#define CHIP_SEL_PREFIX "chip%d:"
+#define CHIP_SEL (((struct nandsim *) ((struct nand_chip *) nsmtd->priv)->priv)->chipselect)
 
 /* Simulator's output macros (logging, debugging, warning, error) */
 #define NS_LOG(args...) \
-	do { if (log) printk(KERN_DEBUG NS_OUTPUT_PREFIX " log: " args); } while(0)
+        do { if (log) pr_devel(NS_PREFIX " log: " args); } while(0)
 #define NS_DBG(args...) \
-	do { if (dbg) printk(KERN_DEBUG NS_OUTPUT_PREFIX " debug: " args); } while(0)
-#define NS_WARN(args...) \
-	do { printk(KERN_WARNING NS_OUTPUT_PREFIX " warning: " args); } while(0)
-#define NS_ERR(args...) \
-	do { printk(KERN_ERR NS_OUTPUT_PREFIX " error: " args); } while(0)
-#define NS_INFO(args...) \
-	do { printk(KERN_INFO NS_OUTPUT_PREFIX " " args); } while(0)
+        do { if (dbg) pr_devel(NS_PREFIX " debug: " args); } while(0)
+#define NS_WARN(args...) pr_warn(NS_PREFIX " warning: " args)
+#define NS_ERR(args...) pr_err(NS_PREFIX " error: " args)
+#define NS_INFO(args...) pr_info(NS_PREFIX " " args)
+
+#define NS_LOG_CHIP(fmt, ...) do { \
+	if (log) \
+		pr_devel(NS_PREFIX " " CHIP_SEL_PREFIX " log: " fmt, \
+			 CHIP_SEL, ##__VA_ARGS__); \
+} while(0)
+#define NS_DBG_CHIP(fmt, ...) do { \
+	if (dbg) \
+		pr_devel(NS_PREFIX " " CHIP_SEL_PREFIX " debug: " fmt, \
+			 CHIP_SEL, ##__VA_ARGS__); \
+} while(0)
+#define NS_WARN_CHIP(fmt, ...) pr_warn(NS_PREFIX " " CHIP_SEL_PREFIX " warning: " fmt, \
+				  CHIP_SEL, ##__VA_ARGS__)
+#define NS_ERR_CHIP(fmt, ...) pr_err(NS_PREFIX " " CHIP_SEL_PREFIX " error: " fmt, \
+				CHIP_SEL, ##__VA_ARGS__)
+#define NS_INFO_CHIP(fmt, ...) pr_info(NS_PREFIX " " CHIP_SEL_PREFIX " " fmt, \
+				  CHIP_SEL, ##__VA_ARGS__)
 
 /* Busy-wait delay macros (microseconds, milliseconds) */
 #define NS_UDELAY(us) \
@@ -1070,10 +1088,10 @@ static void update_wear(unsigned int erase_block_no)
 	 * instead of showing an error message.
 	 */
 	if (total_wear == 0)
-		NS_ERR("Erase counter total overflow\n");
+		NS_ERR_CHIP("Erase counter total overflow\n");
 	erase_block_wear[erase_block_no] += 1;
 	if (erase_block_wear[erase_block_no] == 0)
-		NS_ERR("Erase counter overflow for erase block %u\n", erase_block_no);
+		NS_ERR_CHIP("Erase counter overflow for erase block %u\n", erase_block_no);
 }
 
 /*
@@ -1130,7 +1148,7 @@ static char *get_state_name(uint32_t state)
 			return "STATE_UNKNOWN";
 	}
 
-	NS_ERR("get_state_name: unknown state, BUG\n");
+	NS_ERR_CHIP("get_state_name: unknown state, BUG\n");
 	return NULL;
 }
 
@@ -1197,7 +1215,7 @@ static uint32_t get_state_by_command(unsigned command)
 			return STATE_CMD_RNDOUTSTART;
 	}
 
-	NS_ERR("get_state_by_command: unknown command, BUG\n");
+	NS_ERR_CHIP("get_state_by_command: unknown command, BUG\n");
 	return 0;
 }
 
@@ -1224,7 +1242,7 @@ static inline void accept_addr_byte(struct nandsim *ns, u_char bt)
  */
 static inline void switch_to_ready_state(struct nandsim *ns, u_char status)
 {
-	NS_DBG("switch_to_ready_state: switch to %s state\n", get_state_name(STATE_READY));
+	NS_DBG_CHIP("switch_to_ready_state: switch to %s state\n", get_state_name(STATE_READY));
 
 	ns->state        = STATE_READY;
 	ns->nxstate      = STATE_UNKNOWN;
@@ -1333,7 +1351,7 @@ static int find_operation(struct nandsim *ns, uint32_t flag)
 		ns->npstates = 0;
 		ns->state = ns->op[ns->stateidx];
 		ns->nxstate = ns->op[ns->stateidx + 1];
-		NS_DBG("find_operation: operation found, index: %d, state: %s, nxstate %s\n",
+		NS_DBG_CHIP("find_operation: operation found, index: %d, state: %s, nxstate %s\n",
 				idx, get_state_name(ns->state), get_state_name(ns->nxstate));
 		return 0;
 	}
@@ -1341,24 +1359,24 @@ static int find_operation(struct nandsim *ns, uint32_t flag)
 	if (opsfound == 0) {
 		/* Nothing was found. Try to ignore previous commands (if any) and search again */
 		if (ns->npstates != 0) {
-			NS_DBG("find_operation: no operation found, try again with state %s\n",
+			NS_DBG_CHIP("find_operation: no operation found, try again with state %s\n",
 					get_state_name(ns->state));
 			ns->npstates = 0;
 			return find_operation(ns, 0);
 
 		}
-		NS_DBG("find_operation: no operations found\n");
+		NS_DBG_CHIP("find_operation: no operations found\n");
 		switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		return -2;
 	}
 
 	if (flag) {
 		/* This shouldn't happen */
-		NS_DBG("find_operation: BUG, operation must be known if address is input\n");
+		NS_DBG_CHIP("find_operation: BUG, operation must be known if address is input\n");
 		return -2;
 	}
 
-	NS_DBG("find_operation: there is still ambiguity\n");
+	NS_DBG_CHIP("find_operation: there is still ambiguity\n");
 
 	ns->pstates[ns->npstates++] = ns->state;
 
@@ -1471,7 +1489,7 @@ static int do_read_error(struct nandsim *ns, int num)
 
 	if (read_error(page_no)) {
 		prandom_bytes(ns->buf.byte, num);
-		NS_WARN("simulating read error in page %u\n", ns->regs->row);
+		NS_WARN_CHIP("simulating read error in page %u\n", ns->regs->row);
 		return 1;
 	}
 	return 0;
@@ -1486,10 +1504,10 @@ static void do_bit_flips(struct nandsim *ns, int num)
 		while (flips--) {
 			int pos = prandom_u32() % (num * 8);
 			ns->buf.byte[pos / 8] ^= (1 << (pos % 8));
-			NS_WARN("read_page: flipping bit %d in page %d "
-				"reading from %d ecc: corrected=%u failed=%u\n",
-				pos, ns->regs->row, ns->regs->column + ns->regs->off,
-				nsmtd->ecc_stats.corrected, nsmtd->ecc_stats.failed);
+			NS_WARN_CHIP("read_page: flipping bit %d in page %d "
+				     "reading from %d ecc: corrected=%u failed=%u\n",
+				     pos, ns->regs->row, ns->regs->column + ns->regs->off,
+				     nsmtd->ecc_stats.corrected, nsmtd->ecc_stats.failed);
 		}
 	}
 }
@@ -1503,20 +1521,21 @@ static void read_page(struct nandsim *ns, int num)
 
 	if (ns->cfile) {
 		if (!test_bit(ADJUST_ROW(ns), ns->pages_written)) {
-			NS_DBG("read_page: page %d not written\n", ns->regs->row);
+			NS_DBG_CHIP("read_page: page %d not written\n", ns->regs->row);
 			memset(ns->buf.byte, 0xFF, num);
 		} else {
 			loff_t pos;
 			ssize_t tx;
 
-			NS_DBG("read_page: page %d written, reading from %d\n",
-				ns->regs->row, ns->regs->column + ns->regs->off);
+			NS_DBG_CHIP("read_page: page %d written, reading from %d\n",
+				    ns->regs->row, ns->regs->column + ns->regs->off);
 			if (do_read_error(ns, num))
 				return;
 			pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs->off;
 			tx = read_file(ns, ns->cfile, ns->buf.byte, num, pos);
 			if (tx != num) {
-				NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs->row, (long)tx);
+				NS_ERR_CHIP("read_page: read error for page %d ret %ld\n",
+					    ns->regs->row, (long)tx);
 				return;
 			}
 			do_bit_flips(ns, num);
@@ -1526,11 +1545,11 @@ static void read_page(struct nandsim *ns, int num)
 
 	mypage = NS_GET_PAGE(ns);
 	if (mypage->byte == NULL) {
-		NS_DBG("read_page: page %d not allocated\n", ns->regs->row);
+		NS_DBG_CHIP("read_page: page %d not allocated\n", ns->regs->row);
 		memset(ns->buf.byte, 0xFF, num);
 	} else {
-		NS_DBG("read_page: page %d allocated, reading from %d\n",
-			ns->regs->row, ns->regs->column + ns->regs->off);
+		NS_DBG_CHIP("read_page: page %d allocated, reading from %d\n",
+			    ns->regs->row, ns->regs->column + ns->regs->off);
 		if (do_read_error(ns, num))
 			return;
 		memcpy(ns->buf.byte, NS_PAGE_BYTE_OFF(ns), num);
@@ -1550,7 +1569,7 @@ static void erase_sector(struct nandsim *ns)
 		for (i = 0; i < ns->geom.pgsec; i++)
 			if (__test_and_clear_bit(ADJUST_ROW(ns) + i,
 						 ns->pages_written)) {
-				NS_DBG("erase_sector: freeing page %d\n", ns->regs->row + i);
+				NS_DBG_CHIP("erase_sector: freeing page %d\n", ns->regs->row + i);
 			}
 		return;
 	}
@@ -1558,7 +1577,7 @@ static void erase_sector(struct nandsim *ns)
 	mypage = NS_GET_PAGE(ns);
 	for (i = 0; i < ns->geom.pgsec; i++) {
 		if (mypage->byte != NULL) {
-			NS_DBG("erase_sector: freeing page %d\n", ns->regs->row+i);
+			NS_DBG_CHIP("erase_sector: freeing page %d\n", ns->regs->row+i);
 			kmem_cache_free(ns->nand_pages_slab, mypage->byte);
 			mypage->byte = NULL;
 		}
@@ -1580,7 +1599,7 @@ static int prog_page(struct nandsim *ns, int num)
 		ssize_t tx;
 		int all;
 
-		NS_DBG("prog_page: writing page %d\n", ns->regs->row);
+		NS_DBG_CHIP("prog_page: writing page %d\n", ns->regs->row);
 		pg_off = ns->file_buf + ns->regs->column + ns->regs->off;
 		off = (loff_t)NS_RAW_OFFSET(ns) + ns->regs->off;
 		if (!test_bit(ADJUST_ROW(ns), ns->pages_written)) {
@@ -1590,7 +1609,8 @@ static int prog_page(struct nandsim *ns, int num)
 			all = 0;
 			tx = read_file(ns, ns->cfile, pg_off, num, off);
 			if (tx != num) {
-				NS_ERR("prog_page: read error for page %d ret %ld\n", ns->regs->row, (long)tx);
+				NS_ERR_CHIP("prog_page: read error for page %d ret %ld\n",
+					    ns->regs->row, (long)tx);
 				return -1;
 			}
 		}
@@ -1600,14 +1620,14 @@ static int prog_page(struct nandsim *ns, int num)
 			loff_t pos = (loff_t)ADJUST_ROW(ns) * ns->geom.pgszoob;
 			tx = write_file(ns, ns->cfile, ns->file_buf, ns->geom.pgszoob, pos);
 			if (tx != ns->geom.pgszoob) {
-				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs->row, (long)tx);
+				NS_ERR_CHIP("prog_page: write error for page %d ret %ld\n", ns->regs->row, (long)tx);
 				return -1;
 			}
 			__set_bit(ADJUST_ROW(ns), ns->pages_written);
 		} else {
 			tx = write_file(ns, ns->cfile, pg_off, num, off);
 			if (tx != num) {
-				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs->row, (long)tx);
+				NS_ERR_CHIP("prog_page: write error for page %d ret %ld\n", ns->regs->row, (long)tx);
 				return -1;
 			}
 		}
@@ -1616,7 +1636,7 @@ static int prog_page(struct nandsim *ns, int num)
 
 	mypage = NS_GET_PAGE(ns);
 	if (mypage->byte == NULL) {
-		NS_DBG("prog_page: allocating page %d\n", ns->regs->row);
+		NS_DBG_CHIP("prog_page: allocating page %d\n", ns->regs->row);
 		/*
 		 * We allocate memory with GFP_NOFS because a flash FS may
 		 * utilize this. If it is holding an FS lock, then gets here,
@@ -1625,7 +1645,7 @@ static int prog_page(struct nandsim *ns, int num)
 		 */
 		mypage->byte = kmem_cache_alloc(ns->nand_pages_slab, GFP_NOFS);
 		if (mypage->byte == NULL) {
-			NS_ERR("prog_page: error allocating memory for page %d\n", ns->regs->row);
+			NS_ERR_CHIP("prog_page: error allocating memory for page %d\n", ns->regs->row);
 			return -1;
 		}
 		memset(mypage->byte, 0xFF, ns->geom.pgszoob);
@@ -1653,7 +1673,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 
 	/* Check that page address input is correct */
 	if (action != ACTION_SECERASE && ns->regs->row >= ns->geom.cpgnum) {
-		NS_WARN("do_state_action: wrong page number (%#x)\n", ns->regs->row);
+		NS_WARN_CHIP("do_state_action: wrong page number (%#x)\n", ns->regs->row);
 		return -1;
 	}
 
@@ -1666,21 +1686,21 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 
 		/* Column shouldn't be very large */
 		if (ns->regs->column >= (ns->geom.pgszoob - ns->regs->off)) {
-			NS_ERR("do_state_action: column number is too large\n");
+			NS_ERR_CHIP("do_state_action: column number is too large\n");
 			break;
 		}
 		num = ns->geom.pgszoob - ns->regs->off - ns->regs->column;
 		read_page(ns, num);
 
-		NS_DBG("do_state_action: (ACTION_CPY:) copy %d bytes to int buf, raw offset %d\n",
+		NS_DBG_CHIP("do_state_action: (ACTION_CPY:) copy %d bytes to int buf, raw offset %d\n",
 			num, NS_RAW_OFFSET(ns) + ns->regs->off);
 
 		if (ns->regs->off == 0)
-			NS_LOG("read page %d\n", ns->regs->row);
+			NS_LOG_CHIP("read page %d\n", ns->regs->row);
 		else if (ns->regs->off < ns->geom.pgsz)
-			NS_LOG("read page %d (second half)\n", ns->regs->row);
+			NS_LOG_CHIP("read page %d (second half)\n", ns->regs->row);
 		else
-			NS_LOG("read OOB of page %d\n", ns->regs->row);
+			NS_LOG_CHIP("read OOB of page %d\n", ns->regs->row);
 
 		NS_UDELAY(access_delay);
 		NS_UDELAY(input_cycle * ns->geom.pgsz / 1000 / busdiv);
@@ -1693,13 +1713,13 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 		 */
 
 		if (ns->lines->wp) {
-			NS_ERR("do_state_action: device is write-protected, ignore sector erase\n");
+			NS_ERR_CHIP("do_state_action: device is write-protected, ignore sector erase\n");
 			return -1;
 		}
 
 		if (ns->regs->row >= ns->geom.cpgnum - ns->geom.pgsec ||
 		    ns->regs->row & ~(ns->geom.secsz - 1)) {
-			NS_ERR("do_state_action: wrong sector address (%#x)\n", ns->regs->row);
+			NS_ERR_CHIP("do_state_action: wrong sector address (%#x)\n", ns->regs->row);
 			return -1;
 		}
 
@@ -1709,9 +1729,9 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 
 		erase_block_no = ADJUST_ROW(ns) >> (ns->geom.secshift - ns->geom.pgshift);
 
-		NS_DBG("do_state_action: erase sector at address %#x, off = %d\n",
+		NS_DBG_CHIP("do_state_action: erase sector at address %#x, off = %d\n",
 				ns->regs->row, NS_RAW_OFFSET(ns));
-		NS_LOG("erase sector %u\n", erase_block_no);
+		NS_LOG_CHIP("erase sector %u\n", erase_block_no);
 
 		erase_sector(ns);
 
@@ -1721,7 +1741,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 			update_wear(erase_block_no);
 
 		if (erase_error(erase_block_no)) {
-			NS_WARN("simulating erase failure in erase block %u\n", erase_block_no);
+			NS_WARN_CHIP("simulating erase failure in erase block %u\n", erase_block_no);
 			return -1;
 		}
 
@@ -1733,13 +1753,13 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 		 */
 
 		if (ns->lines->wp) {
-			NS_WARN("do_state_action: device is write-protected, programm\n");
+			NS_WARN_CHIP("do_state_action: device is write-protected, programm\n");
 			return -1;
 		}
 
 		num = ns->geom.pgszoob - ns->regs->off - ns->regs->column;
 		if (num != ns->regs->count) {
-			NS_ERR("do_state_action: too few bytes were input (%d instead of %d)\n",
+			NS_ERR_CHIP("do_state_action: too few bytes were input (%d instead of %d)\n",
 					ns->regs->count, num);
 			return -1;
 		}
@@ -1749,42 +1769,42 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 
 		page_no = ADJUST_ROW(ns);
 
-		NS_DBG("do_state_action: copy %d bytes from int buf to (%#x, %#x), raw off = %d\n",
+		NS_DBG_CHIP("do_state_action: copy %d bytes from int buf to (%#x, %#x), raw off = %d\n",
 			num, ns->regs->row, ns->regs->column, NS_RAW_OFFSET(ns) + ns->regs->off);
-		NS_LOG("programm page %d\n", ns->regs->row);
+		NS_LOG_CHIP("programm page %d\n", ns->regs->row);
 
 		NS_UDELAY(programm_delay);
 		NS_UDELAY(output_cycle * ns->geom.pgsz / 1000 / busdiv);
 
 		if (write_error(page_no)) {
-			NS_WARN("simulating write failure in page %u\n", ns->regs->row);
+			NS_WARN_CHIP("simulating write failure in page %u\n", ns->regs->row);
 			return -1;
 		}
 
 		break;
 
 	case ACTION_ZEROOFF:
-		NS_DBG("do_state_action: set internal offset to 0\n");
+		NS_DBG_CHIP("do_state_action: set internal offset to 0\n");
 		ns->regs->off = 0;
 		break;
 
 	case ACTION_HALFOFF:
 		if (!(ns->options & OPT_PAGE512_8BIT)) {
-			NS_ERR("do_state_action: BUG! can't skip half of page for non-512"
+			NS_ERR_CHIP("do_state_action: BUG! can't skip half of page for non-512"
 				"byte page size 8x chips\n");
 			return -1;
 		}
-		NS_DBG("do_state_action: set internal offset to %d\n", ns->geom.pgsz/2);
+		NS_DBG_CHIP("do_state_action: set internal offset to %d\n", ns->geom.pgsz/2);
 		ns->regs->off = ns->geom.pgsz/2;
 		break;
 
 	case ACTION_OOBOFF:
-		NS_DBG("do_state_action: set internal offset to %d\n", ns->geom.pgsz);
+		NS_DBG_CHIP("do_state_action: set internal offset to %d\n", ns->geom.pgsz);
 		ns->regs->off = ns->geom.pgsz;
 		break;
 
 	default:
-		NS_DBG("do_state_action: BUG! unknown action\n");
+		NS_DBG_CHIP("do_state_action: BUG! unknown action\n");
 	}
 
 	return 0;
@@ -1805,7 +1825,7 @@ static void switch_state(struct nandsim *ns)
 		ns->state = ns->nxstate;
 		ns->nxstate = ns->op[ns->stateidx + 1];
 
-		NS_DBG("switch_state: operation is known, switch to the next state, "
+		NS_DBG_CHIP("switch_state: operation is known, switch to the next state, "
 			"state: %s, nxstate: %s\n",
 			get_state_name(ns->state), get_state_name(ns->nxstate));
 
@@ -1827,7 +1847,7 @@ static void switch_state(struct nandsim *ns)
 		 */
 		ns->state = get_state_by_command(ns->regs->command);
 
-		NS_DBG("switch_state: operation is unknown, try to find it\n");
+		NS_DBG_CHIP("switch_state: operation is unknown, try to find it\n");
 
 		if (find_operation(ns, 0) != 0)
 			return;
@@ -1840,7 +1860,7 @@ static void switch_state(struct nandsim *ns)
 
 	/* For 16x devices column means the page offset in words */
 	if ((ns->nxstate & STATE_ADDR_MASK) && ns->busw == 16) {
-		NS_DBG("switch_state: double the column number for 16x device\n");
+		NS_DBG_CHIP("switch_state: double the column number for 16x device\n");
 		ns->regs->column <<= 1;
 	}
 
@@ -1854,12 +1874,12 @@ static void switch_state(struct nandsim *ns)
 		/* In case of data states, see if all bytes were input/output */
 		if ((ns->state & (STATE_DATAIN_MASK | STATE_DATAOUT_MASK))
 			&& ns->regs->count != ns->regs->num) {
-			NS_WARN("switch_state: not all bytes were processed, %d left\n",
-					ns->regs->num - ns->regs->count);
+			NS_WARN_CHIP("switch_state: not all bytes were processed, %d left\n",
+				     ns->regs->num - ns->regs->count);
 			status = NS_STATUS_FAILED(ns);
 		}
 
-		NS_DBG("switch_state: operation complete, switch to STATE_READY state\n");
+		NS_DBG_CHIP("switch_state: operation complete, switch to STATE_READY state\n");
 
 		switch_to_ready_state(ns, status);
 
@@ -1873,9 +1893,9 @@ static void switch_state(struct nandsim *ns)
 		ns->nxstate    = ns->op[++ns->stateidx + 1];
 		ns->regs->num  = ns->regs->count = 0;
 
-		NS_DBG("switch_state: the next state is data I/O, switch, "
-			"state: %s, nxstate: %s\n",
-			get_state_name(ns->state), get_state_name(ns->nxstate));
+		NS_DBG_CHIP("switch_state: the next state is data I/O, switch, "
+			    "state: %s, nxstate: %s\n",
+			    get_state_name(ns->state), get_state_name(ns->nxstate));
 
 		/*
 		 * Set the internal register to the count of bytes which
@@ -1896,7 +1916,7 @@ static void switch_state(struct nandsim *ns)
 				break;
 
 			default:
-				NS_ERR("switch_state: BUG! unknown data state\n");
+				NS_ERR_CHIP("switch_state: BUG! unknown data state\n");
 		}
 
 	} else if (ns->nxstate & STATE_ADDR_MASK) {
@@ -1933,7 +1953,7 @@ static void switch_state(struct nandsim *ns)
 				break;
 
 			default:
-				NS_ERR("switch_state: BUG! unknown address state\n");
+				NS_ERR_CHIP("switch_state: BUG! unknown address state\n");
 		}
 	} else {
 		/*
@@ -1952,28 +1972,28 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
 
 	/* Sanity and correctness checks */
 	if (!ns->lines->ce) {
-		NS_ERR("read_byte: chip is disabled, return %#x\n", (uint)outb);
+		NS_ERR_CHIP("read_byte: chip is disabled, return %#x\n", (uint)outb);
 		return outb;
 	}
 	if (ns->lines->ale || ns->lines->cle) {
-		NS_ERR("read_byte: ALE or CLE pin is high, return %#x\n", (uint)outb);
+		NS_ERR_CHIP("read_byte: ALE or CLE pin is high, return %#x\n", (uint)outb);
 		return outb;
 	}
 	if (!(ns->state & STATE_DATAOUT_MASK)) {
-		NS_WARN("read_byte: unexpected data output cycle, state is %s "
-			"return %#x\n", get_state_name(ns->state), (uint)outb);
+		NS_WARN_CHIP("read_byte: unexpected data output cycle, state is %s "
+			     "return %#x\n", get_state_name(ns->state), (uint)outb);
 		return outb;
 	}
 
 	/* Status register may be read as many times as it is wanted */
 	if (NS_STATE(ns->state) == STATE_DATAOUT_STATUS) {
-		NS_DBG("read_byte: return %#x status\n", ns->regs->status);
+		NS_DBG_CHIP("read_byte: return %#x status\n", ns->regs->status);
 		return ns->regs->status;
 	}
 
 	/* Check if there is any data in the internal buffer which may be read */
 	if (ns->regs->count == ns->regs->num) {
-		NS_WARN("read_byte: no more data to output, return %#x\n", (uint)outb);
+		NS_WARN_CHIP("read_byte: no more data to output, return %#x\n", (uint)outb);
 		return outb;
 	}
 
@@ -1988,7 +2008,7 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
 			}
 			break;
 		case STATE_DATAOUT_ID:
-			NS_DBG("read_byte: read ID byte %d, total = %d\n", ns->regs->count, ns->regs->num);
+			NS_DBG_CHIP("read_byte: read ID byte %d, total = %d\n", ns->regs->count, ns->regs->num);
 			outb = ns->ids[ns->regs->count];
 			ns->regs->count += 1;
 			break;
@@ -1997,7 +2017,7 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
 	}
 
 	if (ns->regs->count == ns->regs->num) {
-		NS_DBG("read_byte: all bytes were read\n");
+		NS_DBG_CHIP("read_byte: all bytes were read\n");
 
 		if (NS_STATE(ns->nxstate) == STATE_READY)
 			switch_state(ns);
@@ -2012,11 +2032,11 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 	/* Sanity and correctness checks */
 	if (!ns->lines->ce) {
-		NS_ERR("write_byte: chip is disabled, ignore write\n");
+		NS_ERR_CHIP("write_byte: chip is disabled, ignore write\n");
 		return;
 	}
 	if (ns->lines->ale && ns->lines->cle) {
-		NS_ERR("write_byte: ALE and CLE pins are high simultaneously, ignore write\n");
+		NS_ERR_CHIP("write_byte: ALE and CLE pins are high simultaneously, ignore write\n");
 		return;
 	}
 
@@ -2026,14 +2046,14 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 		 */
 
 		if (byte == NAND_CMD_RESET) {
-			NS_LOG("reset chip\n");
+			NS_LOG_CHIP("reset chip\n");
 			switch_to_ready_state(ns, NS_STATUS_OK(ns));
 			return;
 		}
 
 		/* Check that the command byte is correct */
 		if (check_command(byte)) {
-			NS_ERR("write_byte: unknown command %#x\n", (uint)byte);
+			NS_ERR_CHIP("write_byte: unknown command %#x\n", (uint)byte);
 			return;
 		}
 
@@ -2056,14 +2076,14 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 				 * was expected but command was input. In this case ignore
 				 * previous command(s)/state(s) and accept the last one.
 				 */
-				NS_WARN("write_byte: command (%#x) wasn't expected, expected state is %s, "
-					"ignore previous states\n", (uint)byte, get_state_name(ns->nxstate));
+				NS_WARN_CHIP("write_byte: command (%#x) wasn't expected, expected state is %s, "
+					     "ignore previous states\n", (uint)byte, get_state_name(ns->nxstate));
 			}
 			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		}
 
-		NS_DBG("command byte corresponding to %s state accepted\n",
-			get_state_name(get_state_by_command(byte)));
+		NS_DBG_CHIP("command byte corresponding to %s state accepted\n",
+			    get_state_name(get_state_by_command(byte)));
 		ns->regs->command = byte;
 		switch_state(ns);
 
@@ -2074,7 +2094,7 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 		if (NS_STATE(ns->nxstate) == STATE_UNKNOWN) {
 
-			NS_DBG("write_byte: operation isn't known yet, identify it\n");
+			NS_DBG_CHIP("write_byte: operation isn't known yet, identify it\n");
 
 			if (find_operation(ns, 1) < 0)
 				return;
@@ -2109,15 +2129,15 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 		/* Check that chip is expecting address */
 		if (!(ns->nxstate & STATE_ADDR_MASK)) {
-			NS_ERR("write_byte: address (%#x) isn't expected, expected state is %s, "
-				"switch to STATE_READY\n", (uint)byte, get_state_name(ns->nxstate));
+			NS_ERR_CHIP("write_byte: address (%#x) isn't expected, expected state is %s, "
+				    "switch to STATE_READY\n", (uint)byte, get_state_name(ns->nxstate));
 			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 			return;
 		}
 
 		/* Check if this is expected byte */
 		if (ns->regs->count == ns->regs->num) {
-			NS_ERR("write_byte: no more address bytes expected\n");
+			NS_ERR_CHIP("write_byte: no more address bytes expected\n");
 			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 			return;
 		}
@@ -2126,11 +2146,11 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 		ns->regs->count += 1;
 
-		NS_DBG("write_byte: address byte %#x was accepted (%d bytes input, %d expected)\n",
-				(uint)byte, ns->regs->count, ns->regs->num);
+		NS_DBG_CHIP("write_byte: address byte %#x was accepted (%d bytes input, %d expected)\n",
+			    (uint)byte, ns->regs->count, ns->regs->num);
 
 		if (ns->regs->count == ns->regs->num) {
-			NS_DBG("address (%#x, %#x) is accepted\n", ns->regs->row, ns->regs->column);
+			NS_DBG_CHIP("address (%#x, %#x) is accepted\n", ns->regs->row, ns->regs->column);
 			switch_state(ns);
 		}
 
@@ -2141,17 +2161,17 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 		/* Check that chip is expecting data input */
 		if (!(ns->state & STATE_DATAIN_MASK)) {
-			NS_ERR("write_byte: data input (%#x) isn't expected, state is %s, "
-				"switch to %s\n", (uint)byte,
-				get_state_name(ns->state), get_state_name(STATE_READY));
+			NS_ERR_CHIP("write_byte: data input (%#x) isn't expected, state is %s, "
+				    "switch to %s\n", (uint)byte,
+				    get_state_name(ns->state), get_state_name(STATE_READY));
 			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 			return;
 		}
 
 		/* Check if this is expected byte */
 		if (ns->regs->count == ns->regs->num) {
-			NS_WARN("write_byte: %u input bytes has already been accepted, ignore write\n",
-					ns->regs->num);
+			NS_WARN_CHIP("write_byte: %u input bytes has already been accepted, ignore write\n",
+				     ns->regs->num);
 			return;
 		}
 
@@ -2181,7 +2201,7 @@ static void ns_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int bitmask)
 
 static int ns_device_ready(struct mtd_info *mtd)
 {
-	NS_DBG("device_ready\n");
+	NS_DBG_CHIP("device_ready\n");
 	return 1;
 }
 
@@ -2189,7 +2209,7 @@ static uint16_t ns_nand_read_word(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
 
-	NS_DBG("read_word\n");
+	NS_DBG_CHIP("read_word\n");
 
 	return chip->read_byte(mtd) | (chip->read_byte(mtd) << 8);
 }
@@ -2200,15 +2220,15 @@ static void ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 
 	/* Check that chip is expecting data input */
 	if (!(ns->state & STATE_DATAIN_MASK)) {
-		NS_ERR("write_buf: data input isn't expected, state is %s, "
-			"switch to STATE_READY\n", get_state_name(ns->state));
+		NS_ERR_CHIP("write_buf: data input isn't expected, state is %s, "
+			    "switch to STATE_READY\n", get_state_name(ns->state));
 		switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		return;
 	}
 
 	/* Check if these are expected bytes */
 	if (ns->regs->count + len > ns->regs->num) {
-		NS_ERR("write_buf: too many input bytes\n");
+		NS_ERR_CHIP("write_buf: too many input bytes\n");
 		switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		return;
 	}
@@ -2217,7 +2237,7 @@ static void ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 	ns->regs->count += len;
 
 	if (ns->regs->count == ns->regs->num) {
-		NS_DBG("write_buf: %d bytes were written\n", ns->regs->count);
+		NS_DBG_CHIP("write_buf: %d bytes were written\n", ns->regs->count);
 	}
 }
 
@@ -2227,16 +2247,16 @@ static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 
 	/* Sanity and correctness checks */
 	if (!ns->lines->ce) {
-		NS_ERR("read_buf: chip is disabled\n");
+		NS_ERR_CHIP("read_buf: chip is disabled\n");
 		return;
 	}
 	if (ns->lines->ale || ns->lines->cle) {
-		NS_ERR("read_buf: ALE or CLE pin is high\n");
+		NS_ERR_CHIP("read_buf: ALE or CLE pin is high\n");
 		return;
 	}
 	if (!(ns->state & STATE_DATAOUT_MASK)) {
-		NS_WARN("read_buf: unexpected data output cycle, current state is %s\n",
-			get_state_name(ns->state));
+		NS_WARN_CHIP("read_buf: unexpected data output cycle, current state is %s\n",
+			     get_state_name(ns->state));
 		return;
 	}
 
@@ -2251,7 +2271,7 @@ static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 
 	/* Check if these are expected bytes */
 	if (ns->regs->count + len > ns->regs->num) {
-		NS_ERR("read_buf: too many bytes to read\n");
+		NS_ERR_CHIP("read_buf: too many bytes to read\n");
 		switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		return;
 	}
@@ -2294,8 +2314,8 @@ static void ns_select_chip(struct mtd_info *mtd, int chipselect)
 		ns->lines = &ns_lines[ns->chipselect];
 	} else {
 		ns->chipselect = -1;
-		NS_ERR("chip %d not exist, max numchips is %d, avaliable numchips is %d\n",
-		       chipselect, numchips, chip->numchips);
+		NS_ERR_CHIP("chip not exist, max numchips is %d, avaliable numchips is %d\n",
+			    numchips, chip->numchips);
 	}
 }
 
-- 
1.8.3.4
