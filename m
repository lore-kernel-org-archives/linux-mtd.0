Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mtilx-0003iV-UT
	for linux-mtd@lists.infradead.org; Fri, 02 Oct 2009 14:06:19 +0000
Date: Fri, 2 Oct 2009 16:06:09 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/3]: mtdoops: Make page size configurable
Message-ID: <20091002160609.3a164ef5@marrow.netinsight.se>
In-Reply-To: <20091002160510.191ef5a4@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
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

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
---
 drivers/mtd/mtdoops.c |   62 ++++++++++++++++++++++++++----------------------
 1 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 1060337..244582c 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -34,7 +34,11 @@
 #include <linux/mtd/mtd.h>
 
 #define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
-#define OOPS_PAGE_SIZE 4096
+
+static int mtdoops_page_size = 4096;
+module_param(mtdoops_page_size, int, 0);
+MODULE_PARM_DESC(mtdoops_page_size, "page size for MTD OOPS pages in bytes (default 4096)");
+
 
 static struct mtdoops_context {
 	int mtd_index;
@@ -42,6 +46,7 @@ static struct mtdoops_context {
 	struct work_struct work_write;
 	struct mtd_info *mtd;
 	int oops_pages;
+	size_t page_size;
 	int nextpage;
 	int nextcount;
 	char *name;
@@ -107,11 +112,11 @@ static void mtdoops_inc_counter(struct mtdoops_context *cxt)
 	if (cxt->nextcount == 0xffffffff)
 		cxt->nextcount = 0;
 
-	ret = mtd->read(mtd, cxt->nextpage * OOPS_PAGE_SIZE, 4,
+	ret = mtd->read(mtd, cxt->nextpage * cxt->page_size, 4,
 			&retlen, (u_char *) &count);
 	if ((retlen != 4) || ((ret < 0) && (ret != -EUCLEAN))) {
 		printk(KERN_ERR "mtdoops: Read failure at %d (%td of 4 read)"
-				", err %d.\n", cxt->nextpage * OOPS_PAGE_SIZE,
+				", err %d.\n", cxt->nextpage * cxt->page_size,
 				retlen, ret);
 		schedule_work(&cxt->work_erase);
 		return;
@@ -140,15 +145,15 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 	if (!mtd)
 		return;
 
-	mod = (cxt->nextpage * OOPS_PAGE_SIZE) % mtd->erasesize;
+	mod = (cxt->nextpage * cxt->page_size) % mtd->erasesize;
 	if (mod != 0) {
-		cxt->nextpage = cxt->nextpage + ((mtd->erasesize - mod) / OOPS_PAGE_SIZE);
+		cxt->nextpage = cxt->nextpage + ((mtd->erasesize - mod) / cxt->page_size);
 		if (cxt->nextpage >= cxt->oops_pages)
 			cxt->nextpage = 0;
 	}
 
 	while (mtd->block_isbad) {
-		ret = mtd->block_isbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
+		ret = mtd->block_isbad(mtd, cxt->nextpage * cxt->page_size);
 		if (!ret)
 			break;
 		if (ret < 0) {
@@ -157,19 +162,19 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 		}
 badblock:
 		printk(KERN_WARNING "mtdoops: Bad block at %08x\n",
-				cxt->nextpage * OOPS_PAGE_SIZE);
+				cxt->nextpage * cxt->page_size);
 		i++;
-		cxt->nextpage = cxt->nextpage + (mtd->erasesize / OOPS_PAGE_SIZE);
+		cxt->nextpage = cxt->nextpage + (mtd->erasesize / cxt->page_size);
 		if (cxt->nextpage >= cxt->oops_pages)
 			cxt->nextpage = 0;
-		if (i == (cxt->oops_pages / (mtd->erasesize / OOPS_PAGE_SIZE))) {
+		if (i == (cxt->oops_pages / (mtd->erasesize / cxt->page_size))) {
 			printk(KERN_ERR "mtdoops: All blocks bad!\n");
 			return;
 		}
 	}
 
 	for (j = 0, ret = -1; (j < 3) && (ret < 0); j++)
-		ret = mtdoops_erase_block(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
+		ret = mtdoops_erase_block(mtd, cxt->nextpage * cxt->page_size);
 
 	if (ret >= 0) {
 		printk(KERN_DEBUG "mtdoops: Ready %d, %d \n", cxt->nextpage, cxt->nextcount);
@@ -178,7 +183,7 @@ badblock:
 	}
 
 	if (mtd->block_markbad && (ret == -EIO)) {
-		ret = mtd->block_markbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
+		ret = mtd->block_markbad(mtd, cxt->nextpage * cxt->page_size);
 		if (ret < 0) {
 			printk(KERN_ERR "mtdoops: block_markbad failed, aborting.\n");
 			return;
@@ -193,22 +198,22 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	size_t retlen;
 	int ret;
 
-	if (cxt->writecount < OOPS_PAGE_SIZE)
+	if (cxt->writecount < cxt->page_size)
 		memset(cxt->oops_buf + cxt->writecount, 0xff,
-					OOPS_PAGE_SIZE - cxt->writecount);
+					cxt->page_size - cxt->writecount);
 
 	if (panic)
-		ret = mtd->panic_write(mtd, cxt->nextpage * OOPS_PAGE_SIZE,
-					OOPS_PAGE_SIZE, &retlen, cxt->oops_buf);
+		ret = mtd->panic_write(mtd, cxt->nextpage * cxt->page_size,
+					cxt->page_size, &retlen, cxt->oops_buf);
 	else
-		ret = mtd->write(mtd, cxt->nextpage * OOPS_PAGE_SIZE,
-					OOPS_PAGE_SIZE, &retlen, cxt->oops_buf);
+		ret = mtd->write(mtd, cxt->nextpage * cxt->page_size,
+					cxt->page_size, &retlen, cxt->oops_buf);
 
 	cxt->writecount = 0;
 
-	if ((retlen != OOPS_PAGE_SIZE) || (ret < 0))
+	if ((retlen != cxt->page_size) || (ret < 0))
 		printk(KERN_ERR "mtdoops: Write failure at %d (%td of %d written), err %d.\n",
-			cxt->nextpage * OOPS_PAGE_SIZE, retlen,	OOPS_PAGE_SIZE, ret);
+			cxt->nextpage * cxt->page_size, retlen,	cxt->page_size, ret);
 
 	mtdoops_inc_counter(cxt);
 }
@@ -230,10 +235,10 @@ static void find_next_position(struct mtdoops_context *cxt)
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
-		ret = mtd->read(mtd, page * OOPS_PAGE_SIZE, 8, &retlen, (u_char *) &count[0]);
+		ret = mtd->read(mtd, page * cxt->page_size, 8, &retlen, (u_char *) &count[0]);
 		if ((retlen != 8) || ((ret < 0) && (ret != -EUCLEAN))) {
 			printk(KERN_ERR "mtdoops: Read failure at %d (%td of 8 read)"
-				", err %d.\n", page * OOPS_PAGE_SIZE, retlen, ret);
+				", err %d.\n", page * cxt->page_size, retlen, ret);
 			continue;
 		}
 
@@ -286,7 +291,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		return;
 	}
 
-	if (mtd->erasesize < OOPS_PAGE_SIZE) {
+	if (mtd->erasesize < cxt->page_size) {
 		printk(KERN_ERR "Eraseblock size of MTD partition %d too small\n",
 				mtd->index);
 		return;
@@ -294,9 +299,9 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 
 	cxt->mtd = mtd;
 	if (mtd->size > INT_MAX)
-		cxt->oops_pages = INT_MAX / OOPS_PAGE_SIZE;
+		cxt->oops_pages = INT_MAX / cxt->page_size;
 	else
-		cxt->oops_pages = (int)mtd->size / OOPS_PAGE_SIZE;
+		cxt->oops_pages = (int)mtd->size / cxt->page_size;
 
 	find_next_position(cxt);
 
@@ -373,15 +378,15 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 		cxt->writecount = 8;
 	}
 
-	if ((count + cxt->writecount) > OOPS_PAGE_SIZE)
-		count = OOPS_PAGE_SIZE - cxt->writecount;
+	if ((count + cxt->writecount) > cxt->page_size)
+		count = cxt->page_size - cxt->writecount;
 
 	memcpy(cxt->oops_buf + cxt->writecount, s, count);
 	cxt->writecount += count;
 
 	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
 
-	if (cxt->writecount == OOPS_PAGE_SIZE)
+	if (cxt->writecount == cxt->page_size)
 		mtdoops_console_sync();
 }
 
@@ -421,7 +426,8 @@ static int __init mtdoops_console_init(void)
 	struct mtdoops_context *cxt = &oops_cxt;
 
 	cxt->mtd_index = -1;
-	cxt->oops_buf = vmalloc(OOPS_PAGE_SIZE);
+	cxt->page_size = mtdoops_page_size;
+	cxt->oops_buf = vmalloc(cxt->page_size);
 	spin_lock_init(&cxt->writecount_lock);
 
 	if (!cxt->oops_buf) {
-- 
1.6.0.4
