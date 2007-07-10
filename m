Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I8Cfk-0006pi-UL
	for linux-mtd@lists.infradead.org; Tue, 10 Jul 2007 06:10:22 -0400
Subject: mtd: Improve error handling in mtdoops
From: Richard Purdie <rpurdie@openedhand.com>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Tue, 10 Jul 2007 11:10:09 +0100
Message-Id: <1184062209.6435.39.camel@localhost.localdomain>
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

Improve the error handling in mtdoops driver after some feedback from
Artem Bityutskiy.

Signed-off-by: Richard Purdie <rpurdie@openedhand.com>

---
 drivers/mtd/mtdoops.c |   51 +++++++++++++++++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 15 deletions(-)

Index: linux/drivers/mtd/mtdoops.c
===================================================================
--- linux.orig/drivers/mtd/mtdoops.c	2007-07-10 10:59:24.000000000 +0100
+++ linux/drivers/mtd/mtdoops.c	2007-07-10 11:01:32.000000000 +0100
@@ -62,10 +62,7 @@ static int mtdoops_erase_block(struct mt
 	erase.mtd = mtd;
 	erase.callback = mtdoops_erase_callback;
 	erase.addr = offset;
-	if (mtd->erasesize < OOPS_PAGE_SIZE)
-		erase.len = OOPS_PAGE_SIZE;
-	else
-		erase.len = mtd->erasesize;
+	erase.len = mtd->erasesize;
 	erase.priv = (u_long)&wait_q;
 
 	set_current_state(TASK_INTERRUPTIBLE);
@@ -103,7 +100,7 @@ static int mtdoops_inc_counter(struct mt
 
 	ret = mtd->read(mtd, cxt->nextpage * OOPS_PAGE_SIZE, 4,
 			&retlen, (u_char *) &count);
-	if ((retlen != 4) || (ret < 0)) {
+	if ((retlen != 4) || ((ret < 0) && (ret != -EUCLEAN))) {
 		printk(KERN_ERR "mtdoops: Read failure at %d (%d of 4 read)"
 				", err %d.\n", cxt->nextpage * OOPS_PAGE_SIZE,
 				retlen, ret);
@@ -136,8 +133,14 @@ static void mtdoops_prepare(struct mtdoo
 			cxt->nextpage = 0;
 	}
 
-	while (mtd->block_isbad &&
-			mtd->block_isbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE)) {
+	while (mtd->block_isbad) {
+		ret = mtd->block_isbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
+		if (!ret)
+			break;
+		if (ret < 0) {
+			printk(KERN_ERR "mtdoops: block_isbad failed, aborting.\n");
+			return;
+		}
 badblock:
 		printk(KERN_WARNING "mtdoops: Bad block at %08x\n",
 				cxt->nextpage * OOPS_PAGE_SIZE);
@@ -154,15 +157,21 @@ badblock:
 	for (j = 0, ret = -1; (j < 3) && (ret < 0); j++)
 		ret = mtdoops_erase_block(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
 
-	if (ret < 0) {
-		if (mtd->block_markbad)
-			mtd->block_markbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
-		goto badblock;
+	if (ret >= 0) {
+		printk(KERN_DEBUG "mtdoops: Ready %d, %d \n", cxt->nextpage, cxt->nextcount);
+		cxt->ready = 1;
+		return;
 	}
 
-	printk(KERN_DEBUG "mtdoops: Ready %d, %d \n", cxt->nextpage, cxt->nextcount);
 
-	cxt->ready = 1;
+	if (mtd->block_markbad && (ret == -EIO)) {
+		ret = mtd->block_markbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
+		if (ret < 0) {
+			printk(KERN_ERR "mtdoops: block_markbad failed, aborting.\n");
+			return;
+		}
+	}
+	goto badblock;
 }
 
 static void mtdoops_workfunc(struct work_struct *work)
@@ -176,12 +185,18 @@ static void mtdoops_workfunc(struct work
 static int find_next_position(struct mtdoops_context *cxt)
 {
 	struct mtd_info *mtd = cxt->mtd;
-	int page, maxpos = 0;
+	int ret, page, maxpos = 0;
 	u32 count, maxcount = 0xffffffff;
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
-		mtd->read(mtd, page * OOPS_PAGE_SIZE, 4, &retlen, (u_char *) &count);
+		ret = mtd->read(mtd, page * OOPS_PAGE_SIZE, 4, &retlen, (u_char *) &count);
+		if ((retlen != 4) || ((ret < 0) && (ret != -EUCLEAN))) {
+			printk(KERN_ERR "mtdoops: Read failure at %d (%d of 4 read)"
+				", err %d.\n", page * OOPS_PAGE_SIZE, retlen, ret);
+			continue;
+		}
+
 		if (count == 0xffffffff)
 			continue;
 		if (maxcount == 0xffffffff) {
@@ -229,6 +244,12 @@ static void mtdoops_notify_add(struct mt
 		return;
 	}
 
+	if (mtd->erasesize < OOPS_PAGE_SIZE) {
+		printk(KERN_ERR "Eraseblock size of MTD partition %d too small\n",
+				mtd->index);
+		return;
+	}
+
 	cxt->mtd = mtd;
 	cxt->oops_pages = mtd->size / OOPS_PAGE_SIZE;
 
