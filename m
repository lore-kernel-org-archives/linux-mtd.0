Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MvBNZ-0004vq-V2
	for linux-mtd@lists.infradead.org; Tue, 06 Oct 2009 14:51:11 +0000
Date: Tue, 6 Oct 2009 16:50:56 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 3/3]: mtdoops: store all kernel messages in a circular
	buffer
Message-ID: <20091006165056.2ccb43f3@marrow.netinsight.se>
In-Reply-To: <20091002160741.6afac48b@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091002160741.6afac48b@marrow.netinsight.se>
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

The last messages which happens before a crash might contain interesting
information about the crash. This patch reworks mtdoops to keep a
circular buffer of _all_ kernel messages, not just those that are
printed when an oops is initiated.

A handler that is called on panic is also added instead of
mtdoops_console_sync so that panic_on_oops and true panics are stored.

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
---
ChangeLog:

 v2:
   * Fix output bug when writing out on large pages (ff's were at the
     start of the printout).
   * Fix garbled text issues on wrapping
   * Add a BUG_ON assertion for writecount

 drivers/mtd/mtdoops.c |  117 +++++++++++++++++++++++++++++-------------------
 1 files changed, 71 insertions(+), 46 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index cc2c187..c24e11f 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -52,6 +52,7 @@ static struct mtdoops_context {
 	char *name;
 
 	void *oops_buf;
+	void *oops_buf_write;
 
 	/* writecount and disabling ready are spin lock protected */
 	spinlock_t writecount_lock;
@@ -196,20 +197,36 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	size_t retlen;
+	u32 * stamp;
+	int p;
 	int ret;
 
-	if (cxt->writecount < cxt->page_size)
-		memset(cxt->oops_buf + cxt->writecount, 0xff,
-					cxt->page_size - cxt->writecount);
+	cxt->ready = 0;
+
+	BUG_ON(cxt->writecount < 8);
+	BUG_ON(cxt->writecount > cxt->page_size - 8);
+
+	/* oops_write_buf = [:8] + [writecount:] + [:writecount] */
+	stamp = cxt->oops_buf_write;
+	*stamp++ = cxt->nextcount;
+	*stamp = MTDOOPS_KERNMSG_MAGIC;
+
+	/* Find out the first non-0xff character */
+	for (p = cxt->writecount; p < cxt->page_size; p++) {
+		if ( ((u8*)cxt->oops_buf)[p] != 0xff)
+			break;
+	}
+	memcpy(cxt->oops_buf_write + 8, cxt->oops_buf + p,
+			cxt->page_size - p);
+	memcpy(cxt->oops_buf_write + 8 + cxt->page_size - p,
+			cxt->oops_buf + 8, p - 8);
 
 	if (panic)
 		ret = mtd->panic_write(mtd, cxt->nextpage * cxt->page_size,
-					cxt->page_size, &retlen, cxt->oops_buf);
+					cxt->page_size, &retlen, cxt->oops_buf_write);
 	else
 		ret = mtd->write(mtd, cxt->nextpage * cxt->page_size,
-					cxt->page_size, &retlen, cxt->oops_buf);
-
-	cxt->writecount = 0;
+					cxt->page_size, &retlen, cxt->oops_buf_write);
 
 	if ((retlen != cxt->page_size) || (ret < 0))
 		printk(KERN_ERR "mtdoops: Write failure at %d (%td of %d written), err %d.\n",
@@ -222,6 +239,26 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 		mtdoops_inc_counter(cxt);
 }
 
+static int mtdoops_panic(struct notifier_block *this, unsigned long event,
+		void *ptr)
+{
+	struct mtdoops_context *cxt = &oops_cxt;
+
+	cancel_work_sync(&cxt->work_write);
+	cxt->ready = 0;
+	if (cxt->mtd->panic_write)
+		mtdoops_write(cxt, 1);
+	else
+		printk(KERN_WARNING "mtdoops: panic_write is not defined, "
+					"cannot store dump from panic\n");
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block panic_block = {
+	.notifier_call = mtdoops_panic,
+};
+
 
 static void mtdoops_workfunc_write(struct work_struct *work)
 {
@@ -309,6 +346,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 
 	find_next_position(cxt);
 
+	atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
 	printk(KERN_INFO "mtdoops: Attached to MTD device %d\n", mtd->index);
 }
 
@@ -326,28 +364,9 @@ static void mtdoops_notify_remove(struct mtd_info *mtd)
 static void mtdoops_console_sync(void)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
-	struct mtd_info *mtd = cxt->mtd;
-	unsigned long flags;
-
-	if (!cxt->ready || !mtd || cxt->writecount == 0)
-		return;
 
-	/* 
-	 *  Once ready is 0 and we've held the lock no further writes to the 
-	 *  buffer will happen
-	 */
-	spin_lock_irqsave(&cxt->writecount_lock, flags);
-	if (!cxt->ready) {
-		spin_unlock_irqrestore(&cxt->writecount_lock, flags);
-		return;
-	}
-	cxt->ready = 0;
-	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
-
-	if (mtd->panic_write && (in_interrupt() || panic_on_oops))
-		/* Interrupt context, we're going to panic so try and log */
-		mtdoops_write(cxt, 1);
-	else
+	/* Write out the buffer if we are called during an oops */
+	if (oops_in_progress)
 		schedule_work(&cxt->work_write);
 }
 
@@ -356,13 +375,11 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 {
 	struct mtdoops_context *cxt = co->data;
 	struct mtd_info *mtd = cxt->mtd;
+	int copy_from;
+	int copy_wrap = 0;
+	int copy_wrap_diff = 0;
 	unsigned long flags;
 
-	if (!oops_in_progress) {
-		mtdoops_console_sync();
-		return;
-	}
-
 	if (!cxt->ready || !mtd)
 		return;
 
@@ -375,23 +392,21 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 		return;
 	}
 
-	if (cxt->writecount == 0) {
-		u32 *stamp = cxt->oops_buf;
-		*stamp++ = cxt->nextcount;
-		*stamp = MTDOOPS_KERNMSG_MAGIC;
+	/* Handle wraps */
+	if ((count + cxt->writecount) >= cxt->page_size) {
+		copy_wrap_diff = cxt->page_size - cxt->writecount;
+		copy_wrap = cxt->writecount;
+
 		cxt->writecount = 8;
+		count -= copy_wrap_diff;
 	}
-
-	if ((count + cxt->writecount) > cxt->page_size)
-		count = cxt->page_size - cxt->writecount;
-
-	memcpy(cxt->oops_buf + cxt->writecount, s, count);
+	copy_from = cxt->writecount;
 	cxt->writecount += count;
-
 	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
 
-	if (cxt->writecount == cxt->page_size)
-		mtdoops_console_sync();
+	if (copy_wrap)
+		memcpy(cxt->oops_buf + copy_wrap, s, copy_wrap_diff);
+	memcpy(cxt->oops_buf + copy_from, s + copy_wrap_diff, count);
 }
 
 static int __init mtdoops_console_setup(struct console *co, char *options)
@@ -429,15 +444,24 @@ static int __init mtdoops_console_init(void)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
 
+	cxt->writecount = 8; /* Start after the header */
 	cxt->mtd_index = -1;
 	cxt->page_size = mtdoops_page_size;
-	cxt->oops_buf = vmalloc(cxt->page_size);
 	spin_lock_init(&cxt->writecount_lock);
 
+	cxt->oops_buf = vmalloc(cxt->page_size);
 	if (!cxt->oops_buf) {
 		printk(KERN_ERR "Failed to allocate mtdoops buffer workspace\n");
 		return -ENOMEM;
 	}
+	cxt->oops_buf_write = vmalloc(cxt->page_size);
+	if (!cxt->oops_buf_write) {
+		printk(KERN_ERR "Failed to allocate mtdoops write buffer workspace\n");
+		vfree(cxt->oops_buf);
+		return -ENOMEM;
+	}
+	memset(cxt->oops_buf_write, 0xff, cxt->page_size);
+	memset(cxt->oops_buf, 0xff, cxt->page_size);
 
 	INIT_WORK(&cxt->work_erase, mtdoops_workfunc_erase);
 	INIT_WORK(&cxt->work_write, mtdoops_workfunc_write);
@@ -455,6 +479,7 @@ static void __exit mtdoops_console_exit(void)
 	unregister_console(&mtdoops_console);
 	kfree(cxt->name);
 	vfree(cxt->oops_buf);
+	vfree(cxt->oops_buf_write);
 }
 
 
-- 
1.6.0.4
