Received: from ernst.netinsight.se ([194.16.221.21])
	by casper.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mvuu2-0004Ea-Oh
	for linux-mtd@lists.infradead.org; Thu, 08 Oct 2009 15:27:44 +0000
Date: Thu, 8 Oct 2009 17:27:01 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 2/3]: mtdoops: Make page size configurable
Message-ID: <20091008172701.7fbe0f5e@marrow.netinsight.se>
In-Reply-To: <20091008172516.64b5c462@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091008172516.64b5c462@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, Aaro Koskinen <aaro.koskinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The main justification for this is to allow catching long messages
during a panic, where the top part might otherwise be lost since moving
to the next block can require a flash erase.

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
---
 drivers/mtd/mtdoops.c |   83 +++++++++++++++++++++++++++++++-----------------
 1 files changed, 53 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 435961e..7045578 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -32,9 +32,14 @@
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/mtd/mtd.h>
+#include <linux/log2.h>
 
 #define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
-#define OOPS_PAGE_SIZE 4096
+
+static int mtdoops_page_size = 4096;
+module_param(mtdoops_page_size, int, 0);
+MODULE_PARM_DESC(mtdoops_page_size,
+		"page size for MTD OOPS pages in bytes (default 4096)");
 
 static struct mtdoops_context {
 	int mtd_index;
@@ -65,8 +70,8 @@ static int mtdoops_erase_block(struct mtdoops_context *cxt, int offset)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	u32 start_page_offset = mtd_div_by_eb(offset, mtd) * mtd->erasesize;
-	u32 start_page = start_page_offset / OOPS_PAGE_SIZE;
-	u32 erase_pages = mtd->erasesize / OOPS_PAGE_SIZE;
+	u32 start_page = start_page_offset / mtdoops_page_size;
+	u32 erase_pages = mtd->erasesize / mtdoops_page_size;
 	struct erase_info erase;
 	DECLARE_WAITQUEUE(wait, current);
 	wait_queue_head_t wait_q;
@@ -134,15 +139,16 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 	if (!mtd)
 		return;
 
-	mod = (cxt->nextpage * OOPS_PAGE_SIZE) % mtd->erasesize;
+	mod = (cxt->nextpage * mtdoops_page_size) % mtd->erasesize;
 	if (mod != 0) {
-		cxt->nextpage = cxt->nextpage + ((mtd->erasesize - mod) / OOPS_PAGE_SIZE);
+		cxt->nextpage = cxt->nextpage +
+				((mtd->erasesize - mod) / mtdoops_page_size);
 		if (cxt->nextpage >= cxt->oops_pages)
 			cxt->nextpage = 0;
 	}
 
 	while (mtd->block_isbad) {
-		ret = mtd->block_isbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
+		ret = mtd->block_isbad(mtd, cxt->nextpage * mtdoops_page_size);
 		if (!ret)
 			break;
 		if (ret < 0) {
@@ -151,19 +157,22 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 		}
 badblock:
 		printk(KERN_WARNING "mtdoops: Bad block at %08x\n",
-				cxt->nextpage * OOPS_PAGE_SIZE);
+				cxt->nextpage * mtdoops_page_size);
 		i++;
-		cxt->nextpage = cxt->nextpage + (mtd->erasesize / OOPS_PAGE_SIZE);
+		cxt->nextpage = cxt->nextpage +
+				(mtd->erasesize / mtdoops_page_size);
 		if (cxt->nextpage >= cxt->oops_pages)
 			cxt->nextpage = 0;
-		if (i == (cxt->oops_pages / (mtd->erasesize / OOPS_PAGE_SIZE))) {
+		if (i == (cxt->oops_pages /
+				(mtd->erasesize / mtdoops_page_size))) {
 			printk(KERN_ERR "mtdoops: All blocks bad!\n");
 			return;
 		}
 	}
 
 	for (j = 0, ret = -1; (j < 3) && (ret < 0); j++)
-		ret = mtdoops_erase_block(cxt, cxt->nextpage * OOPS_PAGE_SIZE);
+		ret = mtdoops_erase_block(cxt,
+				cxt->nextpage * mtdoops_page_size);
 
 	if (ret >= 0) {
 		printk(KERN_DEBUG "mtdoops: Ready %d, %d \n", cxt->nextpage, cxt->nextcount);
@@ -172,7 +181,8 @@ badblock:
 	}
 
 	if (mtd->block_markbad && (ret == -EIO)) {
-		ret = mtd->block_markbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
+		ret = mtd->block_markbad(mtd,
+				cxt->nextpage * mtdoops_page_size);
 		if (ret < 0) {
 			printk(KERN_ERR "mtdoops: block_markbad failed, aborting.\n");
 			return;
@@ -187,22 +197,25 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	size_t retlen;
 	int ret;
 
-	if (cxt->writecount < OOPS_PAGE_SIZE)
+	if (cxt->writecount < mtdoops_page_size)
 		memset(cxt->oops_buf + cxt->writecount, 0xff,
-					OOPS_PAGE_SIZE - cxt->writecount);
+					mtdoops_page_size - cxt->writecount);
 
 	if (panic)
-		ret = mtd->panic_write(mtd, cxt->nextpage * OOPS_PAGE_SIZE,
-					OOPS_PAGE_SIZE, &retlen, cxt->oops_buf);
+		ret = mtd->panic_write(mtd, cxt->nextpage * mtdoops_page_size,
+					mtdoops_page_size, &retlen,
+					cxt->oops_buf);
 	else
-		ret = mtd->write(mtd, cxt->nextpage * OOPS_PAGE_SIZE,
-					OOPS_PAGE_SIZE, &retlen, cxt->oops_buf);
+		ret = mtd->write(mtd, cxt->nextpage * mtdoops_page_size,
+					mtdoops_page_size, &retlen,
+					cxt->oops_buf);
 
 	cxt->writecount = 0;
 
-	if ((retlen != OOPS_PAGE_SIZE) || (ret < 0))
+	if ((retlen != mtdoops_page_size) || (ret < 0))
 		printk(KERN_ERR "mtdoops: Write failure at %d (%td of %d written), err %d.\n",
-			cxt->nextpage * OOPS_PAGE_SIZE, retlen,	OOPS_PAGE_SIZE, ret);
+			cxt->nextpage * mtdoops_page_size, retlen,
+			mtdoops_page_size, ret);
 
 	mtdoops_inc_counter(cxt);
 }
@@ -226,11 +239,13 @@ static void find_next_position(struct mtdoops_context *cxt)
 	for (page = 0; page < cxt->oops_pages; page++) {
 		/* Assume it's dirty */
 		cxt->oops_page_dirty[page] = 1;
-		ret = mtd->read(mtd, page * OOPS_PAGE_SIZE, 8, &retlen, (u_char *) &count[0]);
+		ret = mtd->read(mtd, page * mtdoops_page_size, 8, &retlen,
+				(u_char *) &count[0]);
 
 		if ((retlen != 8) || ((ret < 0) && (ret != -EUCLEAN))) {
-			printk(KERN_ERR "mtdoops: Read failure at %d (%td of 8 read)"
-				", err %d.\n", page * OOPS_PAGE_SIZE, retlen, ret);
+			printk(KERN_ERR "mtdoops: Read failure at %d (%td of "
+				"8 read), err %d.\n", page * mtdoops_page_size,
+				retlen, ret);
 			continue;
 		}
 
@@ -274,7 +289,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	struct mtdoops_context *cxt = &oops_cxt;
 	u64 mtdoops_pages = mtd->size;
 
-	do_div(mtdoops_pages, OOPS_PAGE_SIZE);
+	do_div(mtdoops_pages, mtdoops_page_size);
 
 	if (cxt->name && !strcmp(mtd->name, cxt->name))
 		cxt->mtd_index = mtd->index;
@@ -288,7 +303,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		return;
 	}
 
-	if (mtd->erasesize < OOPS_PAGE_SIZE) {
+	if (mtd->erasesize < mtdoops_page_size) {
 		printk(KERN_ERR "Eraseblock size of MTD partition %d too small\n",
 				mtd->index);
 		return;
@@ -301,9 +316,9 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	}
 	cxt->mtd = mtd;
 	if (mtd->size > INT_MAX)
-		cxt->oops_pages = INT_MAX / OOPS_PAGE_SIZE;
+		cxt->oops_pages = INT_MAX / mtdoops_page_size;
 	else
-		cxt->oops_pages = (int)mtd->size / OOPS_PAGE_SIZE;
+		cxt->oops_pages = (int)mtd->size / mtdoops_page_size;
 
 	find_next_position(cxt);
 
@@ -380,15 +395,15 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 		cxt->writecount = 8;
 	}
 
-	if ((count + cxt->writecount) > OOPS_PAGE_SIZE)
-		count = OOPS_PAGE_SIZE - cxt->writecount;
+	if ((count + cxt->writecount) > mtdoops_page_size)
+		count = mtdoops_page_size - cxt->writecount;
 
 	memcpy(cxt->oops_buf + cxt->writecount, s, count);
 	cxt->writecount += count;
 
 	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
 
-	if (cxt->writecount == OOPS_PAGE_SIZE)
+	if (cxt->writecount == mtdoops_page_size)
 		mtdoops_console_sync();
 }
 
@@ -427,8 +442,16 @@ static int __init mtdoops_console_init(void)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
 
+	if (!is_power_of_2(mtdoops_page_size)) {
+		printk(KERN_ERR "Error: mtdoops_page_size not a power of two\n");
+		return -EINVAL;
+	}
+	if (mtdoops_page_size < 4096) {
+		printk(KERN_ERR "Error: mtdoops_page_size must be over 4096 bytes\n");
+		return -EINVAL;
+	}
 	cxt->mtd_index = -1;
-	cxt->oops_buf = vmalloc(OOPS_PAGE_SIZE);
+	cxt->oops_buf = vmalloc(mtdoops_page_size);
 	spin_lock_init(&cxt->writecount_lock);
 
 	if (!cxt->oops_buf) {
-- 
1.6.0.4
