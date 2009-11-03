Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N5JHy-0004Mq-Dg
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 13:19:14 +0000
Date: Tue, 3 Nov 2009 14:19:03 +0100
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: dedekind1@gmail.com
Subject: [PATCH v13 4/4]: mtdoops: refactor as a kmsg_dumper
Message-ID: <20091103141903.23d0d0be@marrow.netinsight.se>
In-Reply-To: <1257233392.21596.48.camel@localhost>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
	<20091029134123.348b5126@marrow.netinsight.se>
	<1257233392.21596.48.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The last messages which happens before a crash might contain interesting
information about the crash. This patch reworks mtdoops using the
kmsg_dumper support instead of a console, which simplifies the code and
also includes the messages before the oops started.

On oops callbacks, the MTD device write is scheduled in a work queue (to
be able to use the regular mtd->write call), while panics call
mtd->panic_write directly. Thus, if panic_on_oops is set, the oops will
be written out during the panic.

A parameter to specify which mtd device to use (number or name), as well
as a flag, writable at runtime, to toggle wheter to dump oopses or only
panics (since oopses can often be handled by regular syslog).

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>
---
ChangeLog:
 v13:
	* Rebase against http://git.infradead.org/users/dedekind/l2-mtd-2.6.git
	* (Artem): Check simple_strtoul output to catch strings which only
	  start with numbers
	* (Artem): Check that the mtd_index does not exceed MAX_MTD_DEVICES

 drivers/mtd/mtdoops.c |  224 +++++++++++++++++++++----------------------------
 1 files changed, 97 insertions(+), 127 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 64772dc..731876a 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -29,21 +29,34 @@
 #include <linux/sched.h>
 #include <linux/wait.h>
 #include <linux/delay.h>
-#include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/mtd/mtd.h>
+#include <linux/kmsg_dump.h>
 
 /* Maximum MTD partition size */
 #define MTDOOPS_MAX_MTD_SIZE (8 * 1024 * 1024)
 
 #define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
+#define MTDOOPS_HEADER_SIZE   8
 
 static unsigned long record_size = 4096;
 module_param(record_size, ulong, 0400);
 MODULE_PARM_DESC(record_size,
 		"record size for MTD OOPS pages in bytes (default 4096)");
 
+static char mtddev[80];
+module_param_string(mtddev, mtddev, 80, 0400);
+MODULE_PARM_DESC(mtddev,
+		"name or index number of the MTD device to use");
+
+static int dump_oops = 1;
+module_param(dump_oops, int, 0600);
+MODULE_PARM_DESC(dump_oops,
+		"set to 1 to dump oopses, 0 to only dump panics (default 1)");
+
 static struct mtdoops_context {
+	struct kmsg_dumper dump;
+
 	int mtd_index;
 	struct work_struct work_erase;
 	struct work_struct work_write;
@@ -52,14 +65,8 @@ static struct mtdoops_context {
 	int nextpage;
 	int nextcount;
 	unsigned long *oops_page_used;
-	char *name;
 
 	void *oops_buf;
-
-	/* writecount and disabling ready are spin lock protected */
-	spinlock_t writecount_lock;
-	int ready;
-	int writecount;
 } oops_cxt;
 
 static void mark_page_used(struct mtdoops_context *cxt, int page)
@@ -111,7 +118,7 @@ static int mtdoops_erase_block(struct mtdoops_context *cxt, int offset)
 		remove_wait_queue(&wait_q, &wait);
 		printk(KERN_WARNING "mtdoops: erase of region [0x%llx, 0x%llx] on \"%s\" failed\n",
 		       (unsigned long long)erase.addr,
-		       (unsigned long long)erase.len, mtd->name);
+		       (unsigned long long)erase.len, mtddev);
 		return ret;
 	}
 
@@ -141,7 +148,6 @@ static void mtdoops_inc_counter(struct mtdoops_context *cxt)
 
 	printk(KERN_DEBUG "mtdoops: ready %d, %d (no erase)\n",
 	       cxt->nextpage, cxt->nextcount);
-	cxt->ready = 1;
 }
 
 /* Scheduled work - when we can't proceed without erasing a block */
@@ -190,7 +196,6 @@ badblock:
 	if (ret >= 0) {
 		printk(KERN_DEBUG "mtdoops: ready %d, %d\n",
 		       cxt->nextpage, cxt->nextcount);
-		cxt->ready = 1;
 		return;
 	}
 
@@ -208,11 +213,13 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	size_t retlen;
+	u32 *hdr;
 	int ret;
 
-	if (cxt->writecount < record_size)
-		memset(cxt->oops_buf + cxt->writecount, 0xff,
-					record_size - cxt->writecount);
+	/* Add mtdoops header to the buffer */
+	hdr = cxt->oops_buf;
+	hdr[0] = cxt->nextcount;
+	hdr[1] = MTDOOPS_KERNMSG_MAGIC;
 
 	if (panic)
 		ret = mtd->panic_write(mtd, cxt->nextpage * record_size,
@@ -221,17 +228,15 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 		ret = mtd->write(mtd, cxt->nextpage * record_size,
 					record_size, &retlen, cxt->oops_buf);
 
-	cxt->writecount = 0;
-
 	if (retlen != record_size || ret < 0)
 		printk(KERN_ERR "mtdoops: write failure at %ld (%td of %ld written), error %d\n",
 		       cxt->nextpage * record_size, retlen, record_size, ret);
 	mark_page_used(cxt, cxt->nextpage);
+	memset(cxt->oops_buf, 0xff, record_size);
 
 	mtdoops_inc_counter(cxt);
 }
 
-
 static void mtdoops_workfunc_write(struct work_struct *work)
 {
 	struct mtdoops_context *cxt =
@@ -250,17 +255,18 @@ static void find_next_position(struct mtdoops_context *cxt)
 	for (page = 0; page < cxt->oops_pages; page++) {
 		/* Assume the page is used */
 		mark_page_used(cxt, page);
-		ret = mtd->read(mtd, page * record_size, 8, &retlen, (u_char *) &count[0]);
-		if (retlen != 8 || (ret < 0 && ret != -EUCLEAN)) {
-			printk(KERN_ERR "mtdoops: read failure at %ld (%td of 8 read), err %d\n",
-			       page * record_size, retlen, ret);
+		ret = mtd->read(mtd, page * record_size, MTDOOPS_HEADER_SIZE,
+				&retlen, (u_char *) &count[0]);
+		if (retlen != MTDOOPS_HEADER_SIZE ||
+				(ret < 0 && ret != -EUCLEAN)) {
+			printk(KERN_ERR "mtdoops: read failure at %ld (%td of %d read), err %d\n",
+			       page * record_size, retlen,
+			       MTDOOPS_HEADER_SIZE, ret);
 			continue;
 		}
 
 		if (count[0] == 0xffffffff && count[1] == 0xffffffff)
 			mark_page_unused(cxt, page);
-		if (count[1] != MTDOOPS_KERNMSG_MAGIC)
-			continue;
 		if (count[0] == 0xffffffff)
 			continue;
 		if (maxcount == 0xffffffff) {
@@ -291,6 +297,42 @@ static void find_next_position(struct mtdoops_context *cxt)
 	mtdoops_inc_counter(cxt);
 }
 
+static void mtdoops_do_dump(struct kmsg_dumper *dumper,
+		enum kmsg_dump_reason reason, const char *s1, unsigned long l1,
+		const char *s2, unsigned long l2)
+{
+	struct mtdoops_context *cxt = container_of(dumper,
+			struct mtdoops_context, dump);
+	unsigned long s1_start, s2_start;
+	unsigned long l1_cpy, l2_cpy;
+	char *dst;
+
+	/* Only dump oopses if dump_oops is set */
+	if (reason == KMSG_DUMP_OOPS && !dump_oops)
+		return;
+
+	dst = cxt->oops_buf + MTDOOPS_HEADER_SIZE; /* Skip the header */
+	l2_cpy = min(l2, record_size - MTDOOPS_HEADER_SIZE);
+	l1_cpy = min(l1, record_size - MTDOOPS_HEADER_SIZE - l2_cpy);
+
+	s2_start = l2 - l2_cpy;
+	s1_start = l1 - l1_cpy;
+
+	memcpy(dst, s1 + s1_start, l1_cpy);
+	memcpy(dst + l1_cpy, s2 + s2_start, l2_cpy);
+
+	/* Panics must be written immediately */
+	if (reason == KMSG_DUMP_PANIC) {
+		if (!cxt->mtd->panic_write)
+			printk(KERN_ERR "mtdoops: Cannot write from panic without panic_write\n");
+		else
+			mtdoops_write(cxt, 1);
+		return;
+	}
+
+	/* For other cases, schedule work to write it "nicely" */
+	schedule_work(&cxt->work_write);
+}
 
 static void mtdoops_notify_add(struct mtd_info *mtd)
 {
@@ -299,7 +341,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 
 	do_div(mtdoops_pages, record_size);
 
-	if (cxt->name && !strcmp(mtd->name, cxt->name))
+	if (!strcmp(mtd->name, mtddev))
 		cxt->mtd_index = mtd->index;
 
 	if (mtd->index != cxt->mtd_index || cxt->mtd_index < 0)
@@ -330,6 +372,13 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		printk(KERN_ERR "Could not allocate page array\n");
 		return;
 	}
+	cxt->dump.dump = mtdoops_do_dump;
+	if (kmsg_dump_register(&cxt->dump) < 0) {
+		printk(KERN_ERR "Registering kmsg dumper failed\n");
+		vfree(cxt->oops_page_used);
+		cxt->oops_page_used = NULL;
+		return;
+	}
 
 	cxt->mtd = mtd;
 	cxt->oops_pages = (int)mtd->size / record_size;
@@ -344,116 +393,29 @@ static void mtdoops_notify_remove(struct mtd_info *mtd)
 	if (mtd->index != cxt->mtd_index || cxt->mtd_index < 0)
 		return;
 
+	if (kmsg_dump_unregister(&cxt->dump) < 0)
+		printk(KERN_WARNING "Could not unregister kmsg_dumper??\n");
+
 	cxt->mtd = NULL;
 	flush_scheduled_work();
 }
 
-static void mtdoops_console_sync(void)
-{
-	struct mtdoops_context *cxt = &oops_cxt;
-	struct mtd_info *mtd = cxt->mtd;
-	unsigned long flags;
-
-	if (!cxt->ready || !mtd || cxt->writecount == 0)
-		return;
-
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
-	if (mtd->panic_write && in_interrupt())
-		/* Interrupt context, we're going to panic so try and log */
-		mtdoops_write(cxt, 1);
-	else
-		schedule_work(&cxt->work_write);
-}
-
-static void
-mtdoops_console_write(struct console *co, const char *s, unsigned int count)
-{
-	struct mtdoops_context *cxt = co->data;
-	struct mtd_info *mtd = cxt->mtd;
-	unsigned long flags;
-
-	if (!oops_in_progress) {
-		mtdoops_console_sync();
-		return;
-	}
-
-	if (!cxt->ready || !mtd)
-		return;
-
-	/* Locking on writecount ensures sequential writes to the buffer */
-	spin_lock_irqsave(&cxt->writecount_lock, flags);
-
-	/* Check ready status didn't change whilst waiting for the lock */
-	if (!cxt->ready) {
-		spin_unlock_irqrestore(&cxt->writecount_lock, flags);
-		return;
-	}
-
-	if (cxt->writecount == 0) {
-		u32 *stamp = cxt->oops_buf;
-		*stamp++ = cxt->nextcount;
-		*stamp = MTDOOPS_KERNMSG_MAGIC;
-		cxt->writecount = 8;
-	}
-
-	if (count + cxt->writecount > record_size)
-		count = record_size - cxt->writecount;
-
-	memcpy(cxt->oops_buf + cxt->writecount, s, count);
-	cxt->writecount += count;
-
-	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
-
-	if (cxt->writecount == record_size)
-		mtdoops_console_sync();
-}
-
-static int __init mtdoops_console_setup(struct console *co, char *options)
-{
-	struct mtdoops_context *cxt = co->data;
-
-	if (cxt->mtd_index != -1 || cxt->name)
-		return -EBUSY;
-	if (options) {
-		cxt->name = kstrdup(options, GFP_KERNEL);
-		return 0;
-	}
-	if (co->index == -1)
-		return -EINVAL;
-
-	cxt->mtd_index = co->index;
-	return 0;
-}
 
 static struct mtd_notifier mtdoops_notifier = {
 	.add	= mtdoops_notify_add,
 	.remove	= mtdoops_notify_remove,
 };
 
-static struct console mtdoops_console = {
-	.name		= "ttyMTD",
-	.write		= mtdoops_console_write,
-	.setup		= mtdoops_console_setup,
-	.unblank	= mtdoops_console_sync,
-	.index		= -1,
-	.data		= &oops_cxt,
-};
-
-static int __init mtdoops_console_init(void)
+static int __init mtdoops_init(void)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
+	int mtd_index;
+	char *endp;
 
+	if (strlen(mtddev) == 0) {
+		printk(KERN_ERR "mtdoops: mtd device (mtddev=name/number) must be supplied\n");
+		return -EINVAL;
+	}
 	if ((record_size & 4095) != 0) {
 		printk(KERN_ERR "mtdoops: record_size must be a multiple of 4096\n");
 		return -EINVAL;
@@ -462,36 +424,44 @@ static int __init mtdoops_console_init(void)
 		printk(KERN_ERR "mtdoops: record_size must be over 4096 bytes\n");
 		return -EINVAL;
 	}
+
+	/* Setup the MTD device to use */
 	cxt->mtd_index = -1;
+	mtd_index = simple_strtoul(mtddev, &endp, 0);
+	if (*endp == '\0')
+		cxt->mtd_index = mtd_index;
+	if (cxt->mtd_index > MAX_MTD_DEVICES) {
+		printk(KERN_ERR "mtdoops: invalid mtd device number (%u) given\n",
+				mtd_index);
+		return -EINVAL;
+	}
+
 	cxt->oops_buf = vmalloc(record_size);
 	if (!cxt->oops_buf) {
 		printk(KERN_ERR "mtdoops: failed to allocate buffer workspace\n");
 		return -ENOMEM;
 	}
+	memset(cxt->oops_buf, 0xff, record_size);
 
-	spin_lock_init(&cxt->writecount_lock);
 	INIT_WORK(&cxt->work_erase, mtdoops_workfunc_erase);
 	INIT_WORK(&cxt->work_write, mtdoops_workfunc_write);
 
-	register_console(&mtdoops_console);
 	register_mtd_user(&mtdoops_notifier);
 	return 0;
 }
 
-static void __exit mtdoops_console_exit(void)
+static void __exit mtdoops_exit(void)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
 
 	unregister_mtd_user(&mtdoops_notifier);
-	unregister_console(&mtdoops_console);
-	kfree(cxt->name);
 	vfree(cxt->oops_buf);
 	vfree(cxt->oops_page_used);
 }
 
 
-subsys_initcall(mtdoops_console_init);
-module_exit(mtdoops_console_exit);
+module_init(mtdoops_init);
+module_exit(mtdoops_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Richard Purdie <rpurdie@openedhand.com>");
-- 
1.6.0.4
