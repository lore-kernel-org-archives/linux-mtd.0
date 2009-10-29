Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N3UJm-0001MQ-4n
	for linux-mtd@lists.infradead.org; Thu, 29 Oct 2009 12:41:35 +0000
Date: Thu, 29 Oct 2009 13:41:19 +0100
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd
	<linux-mtd@lists.infradead.org>
Subject: [PATCH v12 3/4]: mtdoops: Make page (record) size configurable
Message-ID: <20091029134119.7452f327@marrow.netinsight.se>
In-Reply-To: <20091029133535.2ea65f72@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>
---
ChangeLog:
 * Rebased over "[PATCH v12 2/4]: mtdoops: Add a maximum MTD partition size"

 drivers/mtd/mtdoops.c |   75 ++++++++++++++++++++++++++++--------------------
 1 files changed, 44 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index dc94a70..6c8aa70 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -34,7 +34,11 @@
 #include <linux/mtd/mtd.h>
 
 #define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
-#define OOPS_PAGE_SIZE 4096
+
+static unsigned long record_size = 4096;
+module_param(record_size, ulong, 0400);
+MODULE_PARM_DESC(record_size,
+		"record size for MTD OOPS pages in bytes (default 4096)");
 
 static struct mtdoops_context {
 	int mtd_index;
@@ -80,8 +84,8 @@ static int mtdoops_erase_block(struct mtdoops_context *cxt, int offset)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	u32 start_page_offset = mtd_div_by_eb(offset, mtd) * mtd->erasesize;
-	u32 start_page = start_page_offset / OOPS_PAGE_SIZE;
-	u32 erase_pages = mtd->erasesize / OOPS_PAGE_SIZE;
+	u32 start_page = start_page_offset / record_size;
+	u32 erase_pages = mtd->erasesize / record_size;
 	struct erase_info erase;
 	DECLARE_WAITQUEUE(wait, current);
 	wait_queue_head_t wait_q;
@@ -149,15 +153,15 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 	if (!mtd)
 		return;
 
-	mod = (cxt->nextpage * OOPS_PAGE_SIZE) % mtd->erasesize;
+	mod = (cxt->nextpage * record_size) % mtd->erasesize;
 	if (mod != 0) {
-		cxt->nextpage = cxt->nextpage + ((mtd->erasesize - mod) / OOPS_PAGE_SIZE);
+		cxt->nextpage = cxt->nextpage + ((mtd->erasesize - mod) / record_size);
 		if (cxt->nextpage >= cxt->oops_pages)
 			cxt->nextpage = 0;
 	}
 
 	while (mtd->block_isbad) {
-		ret = mtd->block_isbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
+		ret = mtd->block_isbad(mtd, cxt->nextpage * record_size);
 		if (!ret)
 			break;
 		if (ret < 0) {
@@ -165,20 +169,20 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 			return;
 		}
 badblock:
-		printk(KERN_WARNING "mtdoops: bad block at %08x\n",
-		       cxt->nextpage * OOPS_PAGE_SIZE);
+		printk(KERN_WARNING "mtdoops: bad block at %08lx\n",
+		       cxt->nextpage * record_size);
 		i++;
-		cxt->nextpage = cxt->nextpage + (mtd->erasesize / OOPS_PAGE_SIZE);
+		cxt->nextpage = cxt->nextpage + (mtd->erasesize / record_size);
 		if (cxt->nextpage >= cxt->oops_pages)
 			cxt->nextpage = 0;
-		if (i == cxt->oops_pages / (mtd->erasesize / OOPS_PAGE_SIZE)) {
+		if (i == cxt->oops_pages / (mtd->erasesize / record_size)) {
 			printk(KERN_ERR "mtdoops: all blocks bad!\n");
 			return;
 		}
 	}
 
 	for (j = 0, ret = -1; (j < 3) && (ret < 0); j++)
-		ret = mtdoops_erase_block(cxt, cxt->nextpage * OOPS_PAGE_SIZE);
+		ret = mtdoops_erase_block(cxt, cxt->nextpage * record_size);
 
 	if (ret >= 0) {
 		printk(KERN_DEBUG "mtdoops: ready %d, %d\n",
@@ -188,7 +192,7 @@ badblock:
 	}
 
 	if (mtd->block_markbad && ret == -EIO) {
-		ret = mtd->block_markbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
+		ret = mtd->block_markbad(mtd, cxt->nextpage * record_size);
 		if (ret < 0) {
 			printk(KERN_ERR "mtdoops: block_markbad failed, aborting\n");
 			return;
@@ -203,22 +207,22 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	size_t retlen;
 	int ret;
 
-	if (cxt->writecount < OOPS_PAGE_SIZE)
+	if (cxt->writecount < record_size)
 		memset(cxt->oops_buf + cxt->writecount, 0xff,
-					OOPS_PAGE_SIZE - cxt->writecount);
+					record_size - cxt->writecount);
 
 	if (panic)
-		ret = mtd->panic_write(mtd, cxt->nextpage * OOPS_PAGE_SIZE,
-					OOPS_PAGE_SIZE, &retlen, cxt->oops_buf);
+		ret = mtd->panic_write(mtd, cxt->nextpage * record_size,
+					record_size, &retlen, cxt->oops_buf);
 	else
-		ret = mtd->write(mtd, cxt->nextpage * OOPS_PAGE_SIZE,
-					OOPS_PAGE_SIZE, &retlen, cxt->oops_buf);
+		ret = mtd->write(mtd, cxt->nextpage * record_size,
+					record_size, &retlen, cxt->oops_buf);
 
 	cxt->writecount = 0;
 
-	if (retlen != OOPS_PAGE_SIZE || ret < 0)
-		printk(KERN_ERR "mtdoops: write failure at %d (%td of %d written), error %d\n",
-		       cxt->nextpage * OOPS_PAGE_SIZE, retlen, OOPS_PAGE_SIZE, ret);
+	if (retlen != record_size || ret < 0)
+		printk(KERN_ERR "mtdoops: write failure at %ld (%td of %ld written), error %d\n",
+		       cxt->nextpage * record_size, retlen, record_size, ret);
 	mark_page_used(cxt, cxt->nextpage);
 
 	mtdoops_inc_counter(cxt);
@@ -243,10 +247,10 @@ static void find_next_position(struct mtdoops_context *cxt)
 	for (page = 0; page < cxt->oops_pages; page++) {
 		/* Assume the page is used */
 		mark_page_used(cxt, page);
-		ret = mtd->read(mtd, page * OOPS_PAGE_SIZE, 8, &retlen, (u_char *) &count[0]);
+		ret = mtd->read(mtd, page * record_size, 8, &retlen, (u_char *) &count[0]);
 		if (retlen != 8 || (ret < 0 && ret != -EUCLEAN)) {
-			printk(KERN_ERR "mtdoops: read failure at %d (%td of 8 read), err %d\n",
-			       page * OOPS_PAGE_SIZE, retlen, ret);
+			printk(KERN_ERR "mtdoops: read failure at %ld (%td of 8 read), err %d\n",
+			       page * record_size, retlen, ret);
 			continue;
 		}
 
@@ -290,7 +294,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	struct mtdoops_context *cxt = &oops_cxt;
 	u64 mtdoops_pages = mtd->size;
 
-	do_div(mtdoops_pages, OOPS_PAGE_SIZE);
+	do_div(mtdoops_pages, record_size);
 
 	if (cxt->name && !strcmp(mtd->name, cxt->name))
 		cxt->mtd_index = mtd->index;
@@ -310,7 +314,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		return;
 	}
 
-	if (mtd->erasesize < OOPS_PAGE_SIZE) {
+	if (mtd->erasesize < record_size) {
 		printk(KERN_ERR "mtdoops: eraseblock size of MTD partition %d too small\n",
 		       mtd->index);
 		return;
@@ -324,7 +328,8 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		return;
 	}
 	cxt->mtd = mtd;
-	cxt->oops_pages = (int)mtd->size / OOPS_PAGE_SIZE;
+
+	cxt->oops_pages = (int)mtd->size / record_size;
 
 	find_next_position(cxt);
 
@@ -401,15 +406,15 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 		cxt->writecount = 8;
 	}
 
-	if (count + cxt->writecount > OOPS_PAGE_SIZE)
-		count = OOPS_PAGE_SIZE - cxt->writecount;
+	if (count + cxt->writecount > record_size)
+		count = record_size - cxt->writecount;
 
 	memcpy(cxt->oops_buf + cxt->writecount, s, count);
 	cxt->writecount += count;
 
 	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
 
-	if (cxt->writecount == OOPS_PAGE_SIZE)
+	if (cxt->writecount == record_size)
 		mtdoops_console_sync();
 }
 
@@ -448,8 +453,16 @@ static int __init mtdoops_console_init(void)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
 
+	if ((record_size & 4095) != 0) {
+		printk(KERN_ERR "mtdoops: record_size must be a multiple of 4096\n");
+		return -EINVAL;
+	}
+	if (record_size < 4096) {
+		printk(KERN_ERR "mtdoops: record_size must be over 4096 bytes\n");
+		return -EINVAL;
+	}
 	cxt->mtd_index = -1;
-	cxt->oops_buf = vmalloc(OOPS_PAGE_SIZE);
+	cxt->oops_buf = vmalloc(record_size);
 	if (!cxt->oops_buf) {
 		printk(KERN_ERR "mtdoops: failed to allocate buffer workspace\n");
 		return -ENOMEM;
-- 
1.6.0.4
