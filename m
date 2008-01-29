Received: from tim.rpsys.net ([194.106.48.114])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JJocg-0003Wz-4T
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 11:27:32 +0000
Subject: [PATCH 1/4] mtdoops: Add further error return code checking
From: Richard Purdie <rpurdie@rpsys.net>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Tue, 29 Jan 2008 11:27:09 +0000
Message-Id: <1201606029.5017.20.camel@localhost.localdomain>
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

Add further error return code checks to the mtdoops driver.

Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/mtd/mtdoops.c |   41 +++++++++++++++++++++++++++++------------
 1 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 20eaf29..723ca76 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -103,7 +103,7 @@ static int mtdoops_inc_counter(struct mtdoops_context *cxt)
 
 	ret = mtd->read(mtd, cxt->nextpage * OOPS_PAGE_SIZE, 4,
 			&retlen, (u_char *) &count);
-	if ((retlen != 4) || (ret < 0)) {
+	if ((retlen != 4) || ((ret < 0) && (ret != -EUCLEAN))) {
 		printk(KERN_ERR "mtdoops: Read failure at %d (%td of 4 read)"
 				", err %d.\n", cxt->nextpage * OOPS_PAGE_SIZE,
 				retlen, ret);
@@ -136,8 +136,14 @@ static void mtdoops_prepare(struct mtdoops_context *cxt)
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
@@ -154,15 +160,20 @@ badblock:
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
-
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
@@ -176,12 +187,18 @@ static void mtdoops_workfunc(struct work_struct *work)
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
+			printk(KERN_ERR "mtdoops: Read failure at %d (%td of 4 read)"
+				", err %d.\n", page * OOPS_PAGE_SIZE, retlen, ret);
+			continue;
+		}
+
 		if (count == 0xffffffff)
 			continue;
 		if (maxcount == 0xffffffff) {
-- 
1.5.2.3
