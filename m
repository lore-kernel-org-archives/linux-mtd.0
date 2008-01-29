Received: from tim.rpsys.net ([194.106.48.114])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JJoct-0003aV-Uo
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 11:27:53 +0000
Subject: [PATCH 2/4] mtdoops: Perform write operations in a workqueue
From: Richard Purdie <rpurdie@rpsys.net>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Tue, 29 Jan 2008 11:27:11 +0000
Message-Id: <1201606031.5017.21.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Writing to the flash needs to be done in a workqueue. The console
write functions may be called in any context which can lead to
lockups otherwise.

Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/mtd/mtdoops.c |   82 +++++++++++++++++++++++++------------------------
 1 files changed, 42 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 723ca76..72c434c 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -32,9 +32,10 @@
 
 #define OOPS_PAGE_SIZE 4096
 
-static struct mtdoops_context {
+struct mtdoops_context {
 	int mtd_index;
-	struct work_struct work;
+	struct work_struct work_erase;
+	struct work_struct work_write;
 	struct mtd_info *mtd;
 	int oops_pages;
 	int nextpage;
@@ -87,7 +88,7 @@ static int mtdoops_erase_block(struct mtd_info *mtd, int offset)
 	return 0;
 }
 
-static int mtdoops_inc_counter(struct mtdoops_context *cxt)
+static void mtdoops_inc_counter(struct mtdoops_context *cxt)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	size_t retlen;
@@ -107,21 +108,26 @@ static int mtdoops_inc_counter(struct mtdoops_context *cxt)
 		printk(KERN_ERR "mtdoops: Read failure at %d (%td of 4 read)"
 				", err %d.\n", cxt->nextpage * OOPS_PAGE_SIZE,
 				retlen, ret);
-		return 1;
+		schedule_work(&cxt->work_erase);
+		return;
 	}
 
 	/* See if we need to erase the next block */
-	if (count != 0xffffffff)
-		return 1;
+	if (count != 0xffffffff) {
+		schedule_work(&cxt->work_erase);
+		return;
+	}
 
 	printk(KERN_DEBUG "mtdoops: Ready %d, %d (no erase)\n",
 			cxt->nextpage, cxt->nextcount);
 	cxt->ready = 1;
-	return 0;
 }
 
-static void mtdoops_prepare(struct mtdoops_context *cxt)
+/* Scheduled work - when we can't proceed without erasing a block */
+static void mtdoops_workfunc_erase(struct work_struct *work)
 {
+	struct mtdoops_context *cxt =
+			container_of(work, struct mtdoops_context, work_erase);
 	struct mtd_info *mtd = cxt->mtd;
 	int i = 0, j, ret, mod;
 
@@ -176,15 +182,31 @@ badblock:
 	goto badblock;
 }
 
-static void mtdoops_workfunc(struct work_struct *work)
+static void mtdoops_workfunc_write(struct work_struct *work)
 {
 	struct mtdoops_context *cxt =
-			container_of(work, struct mtdoops_context, work);
+			container_of(work, struct mtdoops_context, work_write);
+	struct mtd_info *mtd = cxt->mtd;
+	size_t retlen;
+	int ret;
 
-	mtdoops_prepare(cxt);
-}
+	if (cxt->writecount < OOPS_PAGE_SIZE)
+		memset(cxt->oops_buf + cxt->writecount, 0xff,
+					OOPS_PAGE_SIZE - cxt->writecount);
+
+	ret = mtd->write(mtd, cxt->nextpage * OOPS_PAGE_SIZE,
+					OOPS_PAGE_SIZE, &retlen, cxt->oops_buf);
+
+	cxt->writecount = 0;
+
+	if ((retlen != OOPS_PAGE_SIZE) || (ret < 0))
+		printk(KERN_ERR "mtdoops: Write failure at %d (%td of %d written), err %d.\n",
+			cxt->nextpage * OOPS_PAGE_SIZE, retlen,	OOPS_PAGE_SIZE, ret);
+
+	mtdoops_inc_counter(cxt);
+}					
 
-static int find_next_position(struct mtdoops_context *cxt)
+static void find_next_position(struct mtdoops_context *cxt)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	int ret, page, maxpos = 0;
@@ -222,20 +244,19 @@ static int find_next_position(struct mtdoops_context *cxt)
 		cxt->ready = 1;
 		printk(KERN_DEBUG "mtdoops: Ready %d, %d (first init)\n",
 				cxt->nextpage, cxt->nextcount);
-		return 0;
+		return;
 	}
 
 	cxt->nextpage = maxpos;
 	cxt->nextcount = maxcount;
 
-	return mtdoops_inc_counter(cxt);
+	mtdoops_inc_counter(cxt);
 }
 
 
 static void mtdoops_notify_add(struct mtd_info *mtd)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
-	int ret;
 
 	if ((mtd->index != cxt->mtd_index) || cxt->mtd_index < 0)
 		return;
@@ -249,9 +270,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	cxt->mtd = mtd;
 	cxt->oops_pages = mtd->size / OOPS_PAGE_SIZE;
 
-	ret = find_next_position(cxt);
-	if (ret == 1)
-		mtdoops_prepare(cxt);
+	find_next_position(cxt);
 
 	printk(KERN_DEBUG "mtdoops: Attached to MTD device %d\n", mtd->index);
 }
@@ -271,31 +290,13 @@ static void mtdoops_console_sync(void)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
 	struct mtd_info *mtd = cxt->mtd;
-	size_t retlen;
-	int ret;
 
-	if (!cxt->ready || !mtd)
+	if (!cxt->ready || !mtd || cxt->writecount == 0)
 		return;
 
-	if (cxt->writecount == 0)
-		return;
-
-	if (cxt->writecount < OOPS_PAGE_SIZE)
-		memset(cxt->oops_buf + cxt->writecount, 0xff,
-					OOPS_PAGE_SIZE - cxt->writecount);
-
-	ret = mtd->write(mtd, cxt->nextpage * OOPS_PAGE_SIZE,
-					OOPS_PAGE_SIZE, &retlen, cxt->oops_buf);
 	cxt->ready = 0;
-	cxt->writecount = 0;
-
-	if ((retlen != OOPS_PAGE_SIZE) || (ret < 0))
-		printk(KERN_ERR "mtdoops: Write failure at %d (%td of %d written), err %d.\n",
-			cxt->nextpage * OOPS_PAGE_SIZE, retlen,	OOPS_PAGE_SIZE, ret);
 
-	ret = mtdoops_inc_counter(cxt);
-	if (ret == 1)
-		schedule_work(&cxt->work);
+	schedule_work(&cxt->work_write);
 }
 
 static void
@@ -365,7 +366,8 @@ static int __init mtdoops_console_init(void)
 		return -ENOMEM;
 	}
 
-	INIT_WORK(&cxt->work, mtdoops_workfunc);
+	INIT_WORK(&cxt->work_erase, mtdoops_workfunc_erase);
+	INIT_WORK(&cxt->work_write, mtdoops_workfunc_write);
 
 	register_console(&mtdoops_console);
 	register_mtd_user(&mtdoops_notifier);
-- 
1.5.2.3
