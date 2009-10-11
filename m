Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MwwAr-00032y-M3
	for linux-mtd@lists.infradead.org; Sun, 11 Oct 2009 11:01:18 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: mtdoops: several minor cleanups
Date: Sun, 11 Oct 2009 14:00:10 +0300
Message-Id: <1255258810-18859-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

While looking into the mtdoops module, I've spotted several minor
imperfections. This patch addresses them. Namely:

1. Remove several trailing white-spaces and tabs
2. Check 'vmalloc()' return code straight away, not several lines
   below in the 'mtdoops_console_init()' function.
3. Clean up printks - make them more consistent and use the same
   code formatting style for them.
4. Remove silly style of putting brackets around everything in
   "if" operators.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: Simon Kagstrom <simon.kagstrom@netinsight.net>
---
 drivers/mtd/mtdoops.c |   81 ++++++++++++++++++++++++-------------------------
 1 files changed, 40 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index ac67833..18c6c96 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -81,9 +81,9 @@ static int mtdoops_erase_block(struct mtd_info *mtd, int offset)
 	if (ret) {
 		set_current_state(TASK_RUNNING);
 		remove_wait_queue(&wait_q, &wait);
-		printk (KERN_WARNING "mtdoops: erase of region [0x%llx, 0x%llx] "
-				     "on \"%s\" failed\n",
-			(unsigned long long)erase.addr, (unsigned long long)erase.len, mtd->name);
+		printk(KERN_WARNING "mtdoops: erase of region [0x%llx, 0x%llx] on \"%s\" failed\n",
+		       (unsigned long long)erase.addr,
+		       (unsigned long long)erase.len, mtd->name);
 		return ret;
 	}
 
@@ -109,10 +109,9 @@ static void mtdoops_inc_counter(struct mtdoops_context *cxt)
 
 	ret = mtd->read(mtd, cxt->nextpage * OOPS_PAGE_SIZE, 4,
 			&retlen, (u_char *) &count);
-	if ((retlen != 4) || ((ret < 0) && (ret != -EUCLEAN))) {
-		printk(KERN_ERR "mtdoops: Read failure at %d (%td of 4 read)"
-				", err %d.\n", cxt->nextpage * OOPS_PAGE_SIZE,
-				retlen, ret);
+	if (retlen != 4 || (ret < 0 && ret != -EUCLEAN)) {
+		printk(KERN_ERR "mtdoops: read failure at %d (%td of 4 read), err %d\n",
+		       cxt->nextpage * OOPS_PAGE_SIZE, retlen, ret);
 		schedule_work(&cxt->work_erase);
 		return;
 	}
@@ -123,8 +122,8 @@ static void mtdoops_inc_counter(struct mtdoops_context *cxt)
 		return;
 	}
 
-	printk(KERN_DEBUG "mtdoops: Ready %d, %d (no erase)\n",
-			cxt->nextpage, cxt->nextcount);
+	printk(KERN_DEBUG "mtdoops: ready %d, %d (no erase)\n",
+	       cxt->nextpage, cxt->nextcount);
 	cxt->ready = 1;
 }
 
@@ -152,18 +151,18 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 		if (!ret)
 			break;
 		if (ret < 0) {
-			printk(KERN_ERR "mtdoops: block_isbad failed, aborting.\n");
+			printk(KERN_ERR "mtdoops: block_isbad failed, aborting\n");
 			return;
 		}
 badblock:
-		printk(KERN_WARNING "mtdoops: Bad block at %08x\n",
-				cxt->nextpage * OOPS_PAGE_SIZE);
+		printk(KERN_WARNING "mtdoops: bad block at %08x\n",
+		       cxt->nextpage * OOPS_PAGE_SIZE);
 		i++;
 		cxt->nextpage = cxt->nextpage + (mtd->erasesize / OOPS_PAGE_SIZE);
 		if (cxt->nextpage >= cxt->oops_pages)
 			cxt->nextpage = 0;
-		if (i == (cxt->oops_pages / (mtd->erasesize / OOPS_PAGE_SIZE))) {
-			printk(KERN_ERR "mtdoops: All blocks bad!\n");
+		if (i == cxt->oops_pages / (mtd->erasesize / OOPS_PAGE_SIZE)) {
+			printk(KERN_ERR "mtdoops: all blocks bad!\n");
 			return;
 		}
 	}
@@ -172,15 +171,16 @@ badblock:
 		ret = mtdoops_erase_block(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
 
 	if (ret >= 0) {
-		printk(KERN_DEBUG "mtdoops: Ready %d, %d \n", cxt->nextpage, cxt->nextcount);
+		printk(KERN_DEBUG "mtdoops: ready %d, %d\n",
+		       cxt->nextpage, cxt->nextcount);
 		cxt->ready = 1;
 		return;
 	}
 
-	if (mtd->block_markbad && (ret == -EIO)) {
+	if (mtd->block_markbad && ret == -EIO) {
 		ret = mtd->block_markbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
 		if (ret < 0) {
-			printk(KERN_ERR "mtdoops: block_markbad failed, aborting.\n");
+			printk(KERN_ERR "mtdoops: block_markbad failed, aborting\n");
 			return;
 		}
 	}
@@ -206,9 +206,9 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 
 	cxt->writecount = 0;
 
-	if ((retlen != OOPS_PAGE_SIZE) || (ret < 0))
-		printk(KERN_ERR "mtdoops: Write failure at %d (%td of %d written), err %d.\n",
-			cxt->nextpage * OOPS_PAGE_SIZE, retlen,	OOPS_PAGE_SIZE, ret);
+	if (retlen != OOPS_PAGE_SIZE || ret < 0)
+		printk(KERN_ERR "mtdoops: write failure at %d (%td of %d written), error %d\n",
+		       cxt->nextpage * OOPS_PAGE_SIZE, retlen, OOPS_PAGE_SIZE, ret);
 
 	mtdoops_inc_counter(cxt);
 }
@@ -220,7 +220,7 @@ static void mtdoops_workfunc_write(struct work_struct *work)
 			container_of(work, struct mtdoops_context, work_write);
 
 	mtdoops_write(cxt, 0);
-}					
+}
 
 static void find_next_position(struct mtdoops_context *cxt)
 {
@@ -231,9 +231,9 @@ static void find_next_position(struct mtdoops_context *cxt)
 
 	for (page = 0; page < cxt->oops_pages; page++) {
 		ret = mtd->read(mtd, page * OOPS_PAGE_SIZE, 8, &retlen, (u_char *) &count[0]);
-		if ((retlen != 8) || ((ret < 0) && (ret != -EUCLEAN))) {
-			printk(KERN_ERR "mtdoops: Read failure at %d (%td of 8 read)"
-				", err %d.\n", page * OOPS_PAGE_SIZE, retlen, ret);
+		if (retlen != 8 || (ret < 0 && ret != -EUCLEAN)) {
+			printk(KERN_ERR "mtdoops: read failure at %d (%td of 8 read), err %d\n",
+			       page * OOPS_PAGE_SIZE, retlen, ret);
 			continue;
 		}
 
@@ -244,14 +244,14 @@ static void find_next_position(struct mtdoops_context *cxt)
 		if (maxcount == 0xffffffff) {
 			maxcount = count[0];
 			maxpos = page;
-		} else if ((count[0] < 0x40000000) && (maxcount > 0xc0000000)) {
+		} else if (count[0] < 0x40000000 && maxcount > 0xc0000000) {
 			maxcount = count[0];
 			maxpos = page;
-		} else if ((count[0] > maxcount) && (count[0] < 0xc0000000)) {
+		} else if (count[0] > maxcount && count[0] < 0xc0000000) {
 			maxcount = count[0];
 			maxpos = page;
-		} else if ((count[0] > maxcount) && (count[0] > 0xc0000000)
-					&& (maxcount > 0x80000000)) {
+		} else if (count[0] > maxcount && count[0] > 0xc0000000
+					&& maxcount > 0x80000000) {
 			maxcount = count[0];
 			maxpos = page;
 		}
@@ -277,18 +277,18 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	if (cxt->name && !strcmp(mtd->name, cxt->name))
 		cxt->mtd_index = mtd->index;
 
-	if ((mtd->index != cxt->mtd_index) || cxt->mtd_index < 0)
+	if (mtd->index != cxt->mtd_index || cxt->mtd_index < 0)
 		return;
 
-	if (mtd->size < (mtd->erasesize * 2)) {
-		printk(KERN_ERR "MTD partition %d not big enough for mtdoops\n",
-				mtd->index);
+	if (mtd->size < mtd->erasesize * 2) {
+		printk(KERN_ERR "mtdoops: MTD partition %d not big enough for mtdoops\n",
+		       mtd->index);
 		return;
 	}
 
 	if (mtd->erasesize < OOPS_PAGE_SIZE) {
-		printk(KERN_ERR "Eraseblock size of MTD partition %d too small\n",
-				mtd->index);
+		printk(KERN_ERR "mtdoops: eraseblock size of MTD partition %d too small\n",
+		       mtd->index);
 		return;
 	}
 
@@ -307,7 +307,7 @@ static void mtdoops_notify_remove(struct mtd_info *mtd)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
 
-	if ((mtd->index != cxt->mtd_index) || cxt->mtd_index < 0)
+	if (mtd->index != cxt->mtd_index || cxt->mtd_index < 0)
 		return;
 
 	cxt->mtd = NULL;
@@ -323,8 +323,8 @@ static void mtdoops_console_sync(void)
 	if (!cxt->ready || !mtd || cxt->writecount == 0)
 		return;
 
-	/* 
-	 *  Once ready is 0 and we've held the lock no further writes to the 
+	/*
+	 *  Once ready is 0 and we've held the lock no further writes to the
 	 *  buffer will happen
 	 */
 	spin_lock_irqsave(&cxt->writecount_lock, flags);
@@ -373,7 +373,7 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 		cxt->writecount = 8;
 	}
 
-	if ((count + cxt->writecount) > OOPS_PAGE_SIZE)
+	if (count + cxt->writecount > OOPS_PAGE_SIZE)
 		count = OOPS_PAGE_SIZE - cxt->writecount;
 
 	memcpy(cxt->oops_buf + cxt->writecount, s, count);
@@ -422,13 +422,12 @@ static int __init mtdoops_console_init(void)
 
 	cxt->mtd_index = -1;
 	cxt->oops_buf = vmalloc(OOPS_PAGE_SIZE);
-	spin_lock_init(&cxt->writecount_lock);
-
 	if (!cxt->oops_buf) {
-		printk(KERN_ERR "Failed to allocate mtdoops buffer workspace\n");
+		printk(KERN_ERR "mtdoops: failed to allocate buffer workspace\n");
 		return -ENOMEM;
 	}
 
+	spin_lock_init(&cxt->writecount_lock);
 	INIT_WORK(&cxt->work_erase, mtdoops_workfunc_erase);
 	INIT_WORK(&cxt->work_write, mtdoops_workfunc_write);
 
-- 
1.6.2.5
