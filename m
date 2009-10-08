Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MvuEY-0006C5-Nn
	for linux-mtd@lists.infradead.org; Thu, 08 Oct 2009 14:44:51 +0000
Date: Thu, 8 Oct 2009 16:44:37 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 1/3]: mtdoops: Keep track of clean/dirty mtdoops pages in
	an array
Message-ID: <20091008164437.1bbade08@marrow.netinsight.se>
In-Reply-To: <20091008164243.2344df24@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091008164243.2344df24@marrow.netinsight.se>
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

This patch makes mtdoops keep track of clean/dirty pages in an array
instead of scanning the flash after a write. The advantage with this
approach is that it avoids calling mtd->read on a panic, which is not
possible for all mtd drivers.
---
 drivers/mtd/mtdoops.c |   50 +++++++++++++++++++++++++++++-------------------
 1 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index ac67833..19632d5 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -44,6 +44,7 @@ static struct mtdoops_context {
 	int oops_pages;
 	int nextpage;
 	int nextcount;
+	u8 *oops_page_dirty;
 	char *name;
 
 	void *oops_buf;
@@ -60,12 +61,17 @@ static void mtdoops_erase_callback(struct erase_info *done)
 	wake_up(wait_q);
 }
 
-static int mtdoops_erase_block(struct mtd_info *mtd, int offset)
+static int mtdoops_erase_block(struct mtdoops_context *cxt, int offset)
 {
+	struct mtd_info *mtd = cxt->mtd;
+	u32 start_page_offset = mtd_div_by_eb(offset, mtd) * mtd->erasesize;
+	u32 start_page = start_page_offset / OOPS_PAGE_SIZE;
+	u32 erase_pages = mtd->erasesize / OOPS_PAGE_SIZE;
 	struct erase_info erase;
 	DECLARE_WAITQUEUE(wait, current);
 	wait_queue_head_t wait_q;
 	int ret;
+	int page;
 
 	init_waitqueue_head(&wait_q);
 	erase.mtd = mtd;
@@ -90,16 +96,15 @@ static int mtdoops_erase_block(struct mtd_info *mtd, int offset)
 	schedule();  /* Wait for erase to finish. */
 	remove_wait_queue(&wait_q, &wait);
 
+	/* Mark pages as clean */
+	for (page = start_page; page < start_page + erase_pages; page++)
+		cxt->oops_page_dirty[page] = 0;
+
 	return 0;
 }
 
 static void mtdoops_inc_counter(struct mtdoops_context *cxt)
 {
-	struct mtd_info *mtd = cxt->mtd;
-	size_t retlen;
-	u32 count;
-	int ret;
-
 	cxt->nextpage++;
 	if (cxt->nextpage >= cxt->oops_pages)
 		cxt->nextpage = 0;
@@ -107,18 +112,7 @@ static void mtdoops_inc_counter(struct mtdoops_context *cxt)
 	if (cxt->nextcount == 0xffffffff)
 		cxt->nextcount = 0;
 
-	ret = mtd->read(mtd, cxt->nextpage * OOPS_PAGE_SIZE, 4,
-			&retlen, (u_char *) &count);
-	if ((retlen != 4) || ((ret < 0) && (ret != -EUCLEAN))) {
-		printk(KERN_ERR "mtdoops: Read failure at %d (%td of 4 read)"
-				", err %d.\n", cxt->nextpage * OOPS_PAGE_SIZE,
-				retlen, ret);
-		schedule_work(&cxt->work_erase);
-		return;
-	}
-
-	/* See if we need to erase the next block */
-	if (count != 0xffffffff) {
+	if (cxt->oops_page_dirty[cxt->nextpage]) {
 		schedule_work(&cxt->work_erase);
 		return;
 	}
@@ -169,7 +163,7 @@ badblock:
 	}
 
 	for (j = 0, ret = -1; (j < 3) && (ret < 0); j++)
-		ret = mtdoops_erase_block(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
+		ret = mtdoops_erase_block(cxt, cxt->nextpage * OOPS_PAGE_SIZE);
 
 	if (ret >= 0) {
 		printk(KERN_DEBUG "mtdoops: Ready %d, %d \n", cxt->nextpage, cxt->nextcount);
@@ -230,13 +224,17 @@ static void find_next_position(struct mtdoops_context *cxt)
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
+		/* Assume it's dirty */
+		cxt->oops_page_dirty[page] = 1;
 		ret = mtd->read(mtd, page * OOPS_PAGE_SIZE, 8, &retlen, (u_char *) &count[0]);
+
 		if ((retlen != 8) || ((ret < 0) && (ret != -EUCLEAN))) {
 			printk(KERN_ERR "mtdoops: Read failure at %d (%td of 8 read)"
 				", err %d.\n", page * OOPS_PAGE_SIZE, retlen, ret);
 			continue;
 		}
-
+		if (count[0] == 0xffffffff && count[1] == 0xffffffff)
+			cxt->oops_page_dirty[page] = 0;
 		if (count[1] != MTDOOPS_KERNMSG_MAGIC)
 			continue;
 		if (count[0] == 0xffffffff)
@@ -273,6 +271,9 @@ static void find_next_position(struct mtdoops_context *cxt)
 static void mtdoops_notify_add(struct mtd_info *mtd)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
+	u64 mtdoops_pages = mtd->size;
+
+	do_div(mtdoops_pages, OOPS_PAGE_SIZE);
 
 	if (cxt->name && !strcmp(mtd->name, cxt->name))
 		cxt->mtd_index = mtd->index;
@@ -292,6 +293,12 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		return;
 	}
 
+	cxt->oops_page_dirty = vmalloc(mtdoops_pages);
+	if (!cxt->oops_page_dirty) {
+		printk(KERN_ERR "Could not allocate page array (%Ld bytes)\n",
+				mtdoops_pages);
+		return;
+	}
 	cxt->mtd = mtd;
 	if (mtd->size > INT_MAX)
 		cxt->oops_pages = INT_MAX / OOPS_PAGE_SIZE;
@@ -428,6 +435,7 @@ static int __init mtdoops_console_init(void)
 		printk(KERN_ERR "Failed to allocate mtdoops buffer workspace\n");
 		return -ENOMEM;
 	}
+	cxt->oops_page_dirty = NULL;
 
 	INIT_WORK(&cxt->work_erase, mtdoops_workfunc_erase);
 	INIT_WORK(&cxt->work_write, mtdoops_workfunc_write);
@@ -445,6 +453,8 @@ static void __exit mtdoops_console_exit(void)
 	unregister_console(&mtdoops_console);
 	kfree(cxt->name);
 	vfree(cxt->oops_buf);
+	if (cxt->oops_page_dirty)
+		vfree(cxt->oops_page_dirty);
 }
 
 
-- 
1.6.0.4
