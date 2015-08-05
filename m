From: Sheng Yong <shengyong1@huawei.com>
To: <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 4/5] MTD: nandsim: add ADJUST_ROW() to find the real page
 number
Date: Wed, 5 Aug 2015 08:55:53 +0000
Message-ID: <1438764954-36976-5-git-send-email-shengyong1@huawei.com>
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

regs->row only points to the relative page number in the selected
chip. In multiple chips case, we cannot get the correct page number
from regs->row directly. So we add a new cpgnum in nandsim geometry
to save the number of pages of one chip, and add an offset of
(cpgnum * chipselect) to get the real page number.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 drivers/mtd/nand/nandsim.c | 45 ++++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 45100b37..5406ea7 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -211,9 +211,17 @@ MODULE_PARM_DESC(numchips,	 "Number of chips of the NAND flash (1 by default)");
 /* Operation failed completion status */
 #define NS_STATUS_FAILED(ns) (NAND_STATUS_FAIL | NS_STATUS_OK(ns))
 
+/* Adjust row to suit for multichips, chipselect should be considered.
+ * Page number should be adjusted, if we want to read/prog/erase/etc. a
+ * "physic" page or get the raw offset. NOTE that the value in the row
+ * register should not be changed.
+ */
+#define ADJUST_ROW(ns) \
+	((ns)->chipselect * (ns)->geom.cpgnum + (ns)->regs->row)
+
 /* Calculate the page offset in flash RAM image by (row, column) address */
 #define NS_RAW_OFFSET(ns) \
-	(((ns)->regs->row * (ns)->geom.pgszoob) + (ns)->regs->column)
+	((ADJUST_ROW(ns) * (ns)->geom.pgszoob) + (ns)->regs->column)
 
 /* Calculate the OOB offset in flash RAM image by (row, column) address */
 #define NS_RAW_OFFSET_OOB(ns) (NS_RAW_OFFSET(ns) + ns->geom.pgsz)
@@ -366,6 +374,7 @@ struct nandsim {
 		uint64_t totszoob;  /* total flash size including OOB, bytes */
 		uint pgszoob;       /* page size including OOB , bytes*/
 		uint secszoob;      /* sector size including OOB, bytes */
+		uint cpgnum;        /* number of pages per chip */
 		uint pgnum;         /* total number of pages */
 		uint pgsec;         /* number of pages per sector */
 		uint secshift;      /* bits number in sector size */
@@ -707,6 +716,7 @@ static int init_nandsim(struct mtd_info *mtd)
 	ns->geom.secsz    = mtd->erasesize;
 	ns->geom.pgszoob  = ns->geom.pgsz + ns->geom.oobsz;
 	ns->geom.pgnum    = div_u64(ns->geom.totsz, ns->geom.pgsz);
+	ns->geom.cpgnum   = div_u64(ns->geom.chipsz, ns->geom.pgsz);
 	ns->geom.totszoob = ns->geom.totsz + (uint64_t)ns->geom.pgnum * ns->geom.oobsz;
 	ns->geom.secshift = ffs(ns->geom.secsz) - 1;
 	ns->geom.pgshift  = chip->page_shift;
@@ -1198,9 +1208,9 @@ static inline void accept_addr_byte(struct nandsim *ns, u_char bt)
 {
 	uint byte = (uint)bt;
 
-	if (ns->regs->count < (ns->geom.pgaddrbytes - ns->geom.secaddrbytes))
+	if (ns->regs->count < (ns->geom.pgaddrbytes - ns->geom.secaddrbytes)) {
 		ns->regs->column |= (byte << 8 * ns->regs->count);
-	else {
+	} else {
 		ns->regs->row |= (byte << 8 * (ns->regs->count -
 						ns->geom.pgaddrbytes +
 						ns->geom.secaddrbytes));
@@ -1443,7 +1453,8 @@ static ssize_t write_file(struct nandsim *ns, struct file *file, void *buf, size
  */
 static inline union ns_mem *NS_GET_PAGE(struct nandsim *ns)
 {
-	return &(ns->pages[ns->regs->row]);
+	uint pgnum = ADJUST_ROW(ns);
+	return &(ns->pages[pgnum]);
 }
 
 /*
@@ -1456,11 +1467,11 @@ static inline u_char *NS_PAGE_BYTE_OFF(struct nandsim *ns)
 
 static int do_read_error(struct nandsim *ns, int num)
 {
-	unsigned int page_no = ns->regs->row;
+	unsigned int page_no = ADJUST_ROW(ns);
 
 	if (read_error(page_no)) {
 		prandom_bytes(ns->buf.byte, num);
-		NS_WARN("simulating read error in page %u\n", page_no);
+		NS_WARN("simulating read error in page %u\n", ns->regs->row);
 		return 1;
 	}
 	return 0;
@@ -1491,7 +1502,7 @@ static void read_page(struct nandsim *ns, int num)
 	union ns_mem *mypage;
 
 	if (ns->cfile) {
-		if (!test_bit(ns->regs->row, ns->pages_written)) {
+		if (!test_bit(ADJUST_ROW(ns), ns->pages_written)) {
 			NS_DBG("read_page: page %d not written\n", ns->regs->row);
 			memset(ns->buf.byte, 0xFF, num);
 		} else {
@@ -1537,7 +1548,7 @@ static void erase_sector(struct nandsim *ns)
 
 	if (ns->cfile) {
 		for (i = 0; i < ns->geom.pgsec; i++)
-			if (__test_and_clear_bit(ns->regs->row + i,
+			if (__test_and_clear_bit(ADJUST_ROW(ns) + i,
 						 ns->pages_written)) {
 				NS_DBG("erase_sector: freeing page %d\n", ns->regs->row + i);
 			}
@@ -1572,7 +1583,7 @@ static int prog_page(struct nandsim *ns, int num)
 		NS_DBG("prog_page: writing page %d\n", ns->regs->row);
 		pg_off = ns->file_buf + ns->regs->column + ns->regs->off;
 		off = (loff_t)NS_RAW_OFFSET(ns) + ns->regs->off;
-		if (!test_bit(ns->regs->row, ns->pages_written)) {
+		if (!test_bit(ADJUST_ROW(ns), ns->pages_written)) {
 			all = 1;
 			memset(ns->file_buf, 0xff, ns->geom.pgszoob);
 		} else {
@@ -1586,13 +1597,13 @@ static int prog_page(struct nandsim *ns, int num)
 		for (i = 0; i < num; i++)
 			pg_off[i] &= ns->buf.byte[i];
 		if (all) {
-			loff_t pos = (loff_t)ns->regs->row * ns->geom.pgszoob;
+			loff_t pos = (loff_t)ADJUST_ROW(ns) * ns->geom.pgszoob;
 			tx = write_file(ns, ns->cfile, ns->file_buf, ns->geom.pgszoob, pos);
 			if (tx != ns->geom.pgszoob) {
 				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs->row, (long)tx);
 				return -1;
 			}
-			__set_bit(ns->regs->row, ns->pages_written);
+			__set_bit(ADJUST_ROW(ns), ns->pages_written);
 		} else {
 			tx = write_file(ns, ns->cfile, pg_off, num, off);
 			if (tx != num) {
@@ -1641,7 +1652,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 	action &= ACTION_MASK;
 
 	/* Check that page address input is correct */
-	if (action != ACTION_SECERASE && ns->regs->row >= ns->geom.pgnum) {
+	if (action != ACTION_SECERASE && ns->regs->row >= ns->geom.cpgnum) {
 		NS_WARN("do_state_action: wrong page number (%#x)\n", ns->regs->row);
 		return -1;
 	}
@@ -1686,8 +1697,8 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 			return -1;
 		}
 
-		if (ns->regs->row >= ns->geom.pgnum - ns->geom.pgsec
-			|| (ns->regs->row & ~(ns->geom.secsz - 1))) {
+		if (ns->regs->row >= ns->geom.cpgnum - ns->geom.pgsec ||
+		    ns->regs->row & ~(ns->geom.secsz - 1)) {
 			NS_ERR("do_state_action: wrong sector address (%#x)\n", ns->regs->row);
 			return -1;
 		}
@@ -1696,7 +1707,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 				8 * (ns->geom.pgaddrbytes - ns->geom.secaddrbytes)) | ns->regs->column;
 		ns->regs->column = 0;
 
-		erase_block_no = ns->regs->row >> (ns->geom.secshift - ns->geom.pgshift);
+		erase_block_no = ADJUST_ROW(ns) >> (ns->geom.secshift - ns->geom.pgshift);
 
 		NS_DBG("do_state_action: erase sector at address %#x, off = %d\n",
 				ns->regs->row, NS_RAW_OFFSET(ns));
@@ -1736,7 +1747,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 		if (prog_page(ns, num) == -1)
 			return -1;
 
-		page_no = ns->regs->row;
+		page_no = ADJUST_ROW(ns);
 
 		NS_DBG("do_state_action: copy %d bytes from int buf to (%#x, %#x), raw off = %d\n",
 			num, ns->regs->row, ns->regs->column, NS_RAW_OFFSET(ns) + ns->regs->off);
@@ -1746,7 +1757,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 		NS_UDELAY(output_cycle * ns->geom.pgsz / 1000 / busdiv);
 
 		if (write_error(page_no)) {
-			NS_WARN("simulating write failure in page %u\n", page_no);
+			NS_WARN("simulating write failure in page %u\n", ns->regs->row);
 			return -1;
 		}
 
-- 
1.8.3.4
