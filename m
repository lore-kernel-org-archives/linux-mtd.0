Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MxImL-0007NL-8p
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 11:09:30 +0000
Date: Mon, 12 Oct 2009 13:09:15 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 2/4]: mtdoops: Keep track of used/unused mtdoops pages in
	an array
Message-ID: <20091012130915.553b9f94@marrow.netinsight.se>
In-Reply-To: <20091012130635.45b76b34@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091008172516.64b5c462@marrow.netinsight.se>
	<20091012130635.45b76b34@marrow.netinsight.se>
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

This patch makes mtdoops keep track of used/unused pages in an array
instead of scanning the flash after a write. The advantage with this
approach is that it avoids calling mtd->read on a panic, which is not
possible for all mtd drivers.

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
---
 drivers/mtd/mtdoops.c |   72 ++++++++++++++++++++++++++++++++++++------------
 1 files changed, 54 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index c785e1a..6af340e 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -44,6 +44,7 @@ static struct mtdoops_context {
 	int oops_pages;
 	int nextpage;
 	int nextcount;
+	u32 *oops_page_used;
 	char *name;
 
 	void *oops_buf;
@@ -54,18 +55,47 @@ static struct mtdoops_context {
 	int writecount;
 } oops_cxt;
 
+static void mark_page_used(struct mtdoops_context *cxt, int page)
+{
+	u32 *p = cxt->oops_page_used + page / (8 * sizeof(u32));
+	u32 idx = page % (8 * sizeof(u32));
+
+	*p = *p | (1 << idx);
+}
+
+static void mark_page_unused(struct mtdoops_context *cxt, int page)
+{
+	u32 *p = cxt->oops_page_used + page / (8 * sizeof(u32));
+	u32 idx = page % (8 * sizeof(u32));
+
+	*p = *p & ~(1 << idx);
+}
+
+static int page_is_used(struct mtdoops_context *cxt, int page)
+{
+	u32 *p = cxt->oops_page_used + page / (8 * sizeof(u32));
+	u32 idx = page % (8 * sizeof(u32));
+
+	return *p & (1 << idx);
+}
+
 static void mtdoops_erase_callback(struct erase_info *done)
 {
 	wait_queue_head_t *wait_q = (wait_queue_head_t *)done->priv;
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
@@ -90,16 +120,15 @@ static int mtdoops_erase_block(struct mtd_info *mtd, int offset)
 	schedule();  /* Wait for erase to finish. */
 	remove_wait_queue(&wait_q, &wait);
 
+	/* Mark pages as unused */
+	for (page = start_page; page < start_page + erase_pages; page++)
+		mark_page_unused(cxt, page);
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
@@ -107,17 +136,7 @@ static void mtdoops_inc_counter(struct mtdoops_context *cxt)
 	if (cxt->nextcount == 0xffffffff)
 		cxt->nextcount = 0;
 
-	ret = mtd->read(mtd, cxt->nextpage * OOPS_PAGE_SIZE, 4,
-			&retlen, (u_char *) &count);
-	if (retlen != 4 || (ret < 0 && ret != -EUCLEAN)) {
-		printk(KERN_ERR "mtdoops: read failure at %d (%td of 4 read), err %d\n",
-		       cxt->nextpage * OOPS_PAGE_SIZE, retlen, ret);
-		schedule_work(&cxt->work_erase);
-		return;
-	}
-
-	/* See if we need to erase the next block */
-	if (count != 0xffffffff) {
+	if (page_is_used(cxt, cxt->nextpage)) {
 		schedule_work(&cxt->work_erase);
 		return;
 	}
@@ -168,7 +187,7 @@ badblock:
 	}
 
 	for (j = 0, ret = -1; (j < 3) && (ret < 0); j++)
-		ret = mtdoops_erase_block(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
+		ret = mtdoops_erase_block(cxt, cxt->nextpage * OOPS_PAGE_SIZE);
 
 	if (ret >= 0) {
 		printk(KERN_DEBUG "mtdoops: ready %d, %d\n",
@@ -209,6 +228,7 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	if (retlen != OOPS_PAGE_SIZE || ret < 0)
 		printk(KERN_ERR "mtdoops: write failure at %d (%td of %d written), error %d\n",
 		       cxt->nextpage * OOPS_PAGE_SIZE, retlen, OOPS_PAGE_SIZE, ret);
+	mark_page_used(cxt, cxt->nextpage);
 
 	mtdoops_inc_counter(cxt);
 }
@@ -230,6 +250,8 @@ static void find_next_position(struct mtdoops_context *cxt)
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
+		/* Assume the page is used */
+		mark_page_used(cxt, page);
 		ret = mtd->read(mtd, page * OOPS_PAGE_SIZE, 8, &retlen, (u_char *) &count[0]);
 		if (retlen != 8 || (ret < 0 && ret != -EUCLEAN)) {
 			printk(KERN_ERR "mtdoops: read failure at %d (%td of 8 read), err %d\n",
@@ -237,6 +259,8 @@ static void find_next_position(struct mtdoops_context *cxt)
 			continue;
 		}
 
+		if (count[0] == 0xffffffff && count[1] == 0xffffffff)
+			mark_page_unused(cxt, page);
 		if (count[0] == 0xffffffff)
 			continue;
 		if (count[1] != MTDOOPS_KERNMSG_MAGIC) {
@@ -283,6 +307,9 @@ static void find_next_position(struct mtdoops_context *cxt)
 static void mtdoops_notify_add(struct mtd_info *mtd)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
+	u64 mtdoops_pages = mtd->size;
+
+	do_div(mtdoops_pages, OOPS_PAGE_SIZE);
 
 	if (cxt->name && !strcmp(mtd->name, cxt->name))
 		cxt->mtd_index = mtd->index;
@@ -302,6 +329,13 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		return;
 	}
 
+	/* oops_page_used is a bit field */
+	cxt->oops_page_used = vmalloc(DIV_ROUND_UP(mtdoops_pages,
+			8 * sizeof(u32)));
+	if (!cxt->oops_page_used) {
+		printk(KERN_ERR "Could not allocate page array\n");
+		return;
+	}
 	cxt->mtd = mtd;
 	if (mtd->size > INT_MAX)
 		cxt->oops_pages = INT_MAX / OOPS_PAGE_SIZE;
@@ -454,6 +488,8 @@ static void __exit mtdoops_console_exit(void)
 	unregister_console(&mtdoops_console);
 	kfree(cxt->name);
 	vfree(cxt->oops_buf);
+	if (cxt->oops_page_used)
+		vfree(cxt->oops_page_used);
 }
 
 
-- 
1.6.0.4
