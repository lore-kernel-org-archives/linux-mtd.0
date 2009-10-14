Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1My46b-0006mI-EP
	for linux-mtd@lists.infradead.org; Wed, 14 Oct 2009 13:41:34 +0000
Date: Wed, 14 Oct 2009 15:41:24 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd
	<linux-mtd@lists.infradead.org>
Subject: [PATCH v6 5/5]: mtdoops: refactor as a kmsg_dumper
Message-ID: <20091014154124.5d9c366e@marrow.netinsight.se>
In-Reply-To: <20091014153458.05e31db6@marrow.netinsight.se>
References: <20091012113758.GB11035@elte.hu>
	<20091012140149.6789efab@marrow.netinsight.se>
	<20091012120951.GA16799@elte.hu>
	<1255349748.10605.13.camel@macbook.infradead.org>
	<20091012122023.GA19365@elte.hu>
	<20091012150650.51a4b4dc@marrow.netinsight.se>
	<20091012131528.GC25464@elte.hu>
	<20091012153937.0dcd73e5@marrow.netinsight.se>
	<alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
	<20091012110954.67d7d8d8.akpm@linux-foundation.org>
	<20091012182346.GH17138@elte.hu>
	<alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
	<20091014153458.05e31db6@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <dedekind1@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	Ingo Molnar <mingo@elte.hu>, David Woodhouse <dwmw2@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
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
Review comments from Anders Grafstr=C3=B6m and myself:
       * Fix mtddev and dump_oops parameter permissions (dump_oops is
         now runtime-settable)
       * Style cleanup here and there
       * Add a MTDOOPS_HEADER_SIZE define instead of hardcoding the size
       * Fix a double-free on unregistration
       * Rework the patch according to patch 4
       * Fix output problems for some conditions

 drivers/mtd/mtdoops.c |  207 ++++++++++++++++++++-------------------------=
----
 1 files changed, 84 insertions(+), 123 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 2870a11..817265d 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -29,18 +29,31 @@
 #include <linux/sched.h>
 #include <linux/wait.h>
 #include <linux/delay.h>
-#include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/mtd/mtd.h>
+#include <linux/kmsg_dump.h>
=20
 #define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
+#define MTDOOPS_HEADER_SIZE   8
=20
 static unsigned long record_size =3D 4096;
 module_param(record_size, ulong, 0400);
 MODULE_PARM_DESC(record_size,
 		"record size for MTD OOPS pages in bytes (default 4096)");
=20
+static char mtddev[80];
+module_param_string(mtddev, mtddev, 80, 0400);
+MODULE_PARM_DESC(mtddev,
+		"name or index number of the MTD device to use");
+
+static int dump_oops =3D 1;
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
@@ -49,14 +62,9 @@ static struct mtdoops_context {
 	int nextpage;
 	int nextcount;
 	unsigned long *oops_page_used;
-	char *name;
+	const char *name;
=20
 	void *oops_buf;
-
-	/* writecount and disabling ready are spin lock protected */
-	spinlock_t writecount_lock;
-	int ready;
-	int writecount;
 } oops_cxt;
=20
 static void mark_page_used(struct mtdoops_context *cxt, int page)
@@ -138,7 +146,6 @@ static void mtdoops_inc_counter(struct mtdoops_context =
*cxt)
=20
 	printk(KERN_DEBUG "mtdoops: ready %d, %d (no erase)\n",
 	       cxt->nextpage, cxt->nextcount);
-	cxt->ready =3D 1;
 }
=20
 /* Scheduled work - when we can't proceed without erasing a block */
@@ -187,7 +194,6 @@ badblock:
 	if (ret >=3D 0) {
 		printk(KERN_DEBUG "mtdoops: ready %d, %d\n",
 		       cxt->nextpage, cxt->nextcount);
-		cxt->ready =3D 1;
 		return;
 	}
=20
@@ -205,11 +211,13 @@ static void mtdoops_write(struct mtdoops_context *cxt=
, int panic)
 {
 	struct mtd_info *mtd =3D cxt->mtd;
 	size_t retlen;
+	u32 *hdr;
 	int ret;
=20
-	if (cxt->writecount < record_size)
-		memset(cxt->oops_buf + cxt->writecount, 0xff,
-					record_size - cxt->writecount);
+	/* Add mtdoops header to the buffer */
+	hdr =3D cxt->oops_buf;
+	hdr[0] =3D cxt->nextcount;
+	hdr[1] =3D MTDOOPS_KERNMSG_MAGIC;
=20
 	if (panic)
 		ret =3D mtd->panic_write(mtd, cxt->nextpage * record_size,
@@ -218,17 +226,15 @@ static void mtdoops_write(struct mtdoops_context *cxt=
, int panic)
 		ret =3D mtd->write(mtd, cxt->nextpage * record_size,
 					record_size, &retlen, cxt->oops_buf);
=20
-	cxt->writecount =3D 0;
-
 	if (retlen !=3D record_size || ret < 0)
 		printk(KERN_ERR "mtdoops: write failure at %ld (%td of %ld written), err=
or %d\n",
 		       cxt->nextpage * record_size, retlen, record_size, ret);
 	mark_page_used(cxt, cxt->nextpage);
+	memset(cxt->oops_buf, 0xff, record_size);
=20
 	mtdoops_inc_counter(cxt);
 }
=20
-
 static void mtdoops_workfunc_write(struct work_struct *work)
 {
 	struct mtdoops_context *cxt =3D
@@ -247,10 +253,13 @@ static void find_next_position(struct mtdoops_context=
 *cxt)
 	for (page =3D 0; page < cxt->oops_pages; page++) {
 		/* Assume the page is used */
 		mark_page_used(cxt, page);
-		ret =3D mtd->read(mtd, page * record_size, 8, &retlen, (u_char *) &count=
[0]);
-		if (retlen !=3D 8 || (ret < 0 && ret !=3D -EUCLEAN)) {
-			printk(KERN_ERR "mtdoops: read failure at %ld (%td of 8 read), err %d\n=
",
-			       page * record_size, retlen, ret);
+		ret =3D mtd->read(mtd, page * record_size, MTDOOPS_HEADER_SIZE,
+				&retlen, (u_char *) &count[0]);
+		if (retlen !=3D MTDOOPS_HEADER_SIZE ||
+				(ret < 0 && ret !=3D -EUCLEAN)) {
+			printk(KERN_ERR "mtdoops: read failure at %ld (%td of %d read), err %d\=
n",
+			       page * record_size, retlen,
+			       MTDOOPS_HEADER_SIZE, ret);
 			continue;
 		}
=20
@@ -287,7 +296,6 @@ static void find_next_position(struct mtdoops_context *=
cxt)
 		} else {
 			printk(KERN_DEBUG "mtdoops: ready %d, %d (clean)\n",
 			       cxt->nextpage, cxt->nextcount);
-			cxt->ready =3D 1;
 		}
 		return;
 	}
@@ -298,6 +306,41 @@ static void find_next_position(struct mtdoops_context =
*cxt)
 	mtdoops_inc_counter(cxt);
 }
=20
+static void mtdoops_do_dump(struct kmsg_dumper *dump,
+		enum kmsg_dump_reason reason, const char *s1, unsigned long l1,
+		const char *s2, unsigned long l2)
+{
+	struct mtdoops_context *cxt =3D dump->priv;
+	unsigned long s1_start, s2_start;
+	unsigned long l1_cpy, l2_cpy;
+	char *dst;
+
+	/* Only dump oopses if dump_oops is set */
+	if (reason =3D=3D kmsg_dump_oops && !dump_oops)
+		return;
+
+	dst =3D cxt->oops_buf + MTDOOPS_HEADER_SIZE; /* Skip the header */
+	l2_cpy =3D min(l2, record_size - MTDOOPS_HEADER_SIZE);
+	l1_cpy =3D min(l1, record_size - MTDOOPS_HEADER_SIZE - l2_cpy);
+
+	s2_start =3D l2 - l2_cpy;
+	s1_start =3D l1 - l1_cpy;
+
+	memcpy(dst, s1 + s1_start, l1_cpy);
+	memcpy(dst + l1_cpy, s2 + s2_start, l2_cpy);
+
+	/* Panics must be written immediately */
+	if (reason =3D=3D kmsg_dump_panic) {
+		if (!cxt->mtd->panic_write)
+			printk(KERN_ERR "mtdoops: Cannot write from panic without panic_write\n=
");
+		else
+			mtdoops_write(cxt, 1);
+		return;
+	}
+
+	/* For other cases, schedule work to write it "nicely" */
+	schedule_work(&cxt->work_write);
+}
=20
 static void mtdoops_notify_add(struct mtd_info *mtd)
 {
@@ -339,6 +382,8 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
=20
 	find_next_position(cxt);
=20
+	cxt->dump.dump =3D mtdoops_do_dump;
+	register_kmsg_dumper(&cxt->dump, cxt);
 	printk(KERN_INFO "mtdoops: Attached to MTD device %d\n", mtd->index);
 }
=20
@@ -349,116 +394,27 @@ static void mtdoops_notify_remove(struct mtd_info *m=
td)
 	if (mtd->index !=3D cxt->mtd_index || cxt->mtd_index < 0)
 		return;
=20
+	unregister_kmsg_dumper(&cxt->dump);
 	cxt->mtd =3D NULL;
 	flush_scheduled_work();
 }
=20
-static void mtdoops_console_sync(void)
-{
-	struct mtdoops_context *cxt =3D &oops_cxt;
-	struct mtd_info *mtd =3D cxt->mtd;
-	unsigned long flags;
-
-	if (!cxt->ready || !mtd || cxt->writecount =3D=3D 0)
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
-	cxt->ready =3D 0;
-	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
-
-	if (mtd->panic_write && (in_interrupt() || panic_on_oops))
-		/* Interrupt context, we're going to panic so try and log */
-		mtdoops_write(cxt, 1);
-	else
-		schedule_work(&cxt->work_write);
-}
-
-static void
-mtdoops_console_write(struct console *co, const char *s, unsigned int coun=
t)
-{
-	struct mtdoops_context *cxt =3D co->data;
-	struct mtd_info *mtd =3D cxt->mtd;
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
-	if (cxt->writecount =3D=3D 0) {
-		u32 *stamp =3D cxt->oops_buf;
-		*stamp++ =3D cxt->nextcount;
-		*stamp =3D MTDOOPS_KERNMSG_MAGIC;
-		cxt->writecount =3D 8;
-	}
-
-	if (count + cxt->writecount > record_size)
-		count =3D record_size - cxt->writecount;
-
-	memcpy(cxt->oops_buf + cxt->writecount, s, count);
-	cxt->writecount +=3D count;
-
-	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
-
-	if (cxt->writecount =3D=3D record_size)
-		mtdoops_console_sync();
-}
-
-static int __init mtdoops_console_setup(struct console *co, char *options)
-{
-	struct mtdoops_context *cxt =3D co->data;
-
-	if (cxt->mtd_index !=3D -1 || cxt->name)
-		return -EBUSY;
-	if (options) {
-		cxt->name =3D kstrdup(options, GFP_KERNEL);
-		return 0;
-	}
-	if (co->index =3D=3D -1)
-		return -EINVAL;
-
-	cxt->mtd_index =3D co->index;
-	return 0;
-}
=20
 static struct mtd_notifier mtdoops_notifier =3D {
 	.add	=3D mtdoops_notify_add,
 	.remove	=3D mtdoops_notify_remove,
 };
=20
-static struct console mtdoops_console =3D {
-	.name		=3D "ttyMTD",
-	.write		=3D mtdoops_console_write,
-	.setup		=3D mtdoops_console_setup,
-	.unblank	=3D mtdoops_console_sync,
-	.index		=3D -1,
-	.data		=3D &oops_cxt,
-};
-
-static int __init mtdoops_console_init(void)
+static int __init mtdoops_init(void)
 {
 	struct mtdoops_context *cxt =3D &oops_cxt;
+	int mtd_index;
+	char *endp;
=20
+	if (strlen(mtddev) =3D=3D 0) {
+		printk(KERN_ERR "mtdoops: mtd device must be supplied\n");
+		return -EINVAL;
+	}
 	if ((record_size & 4095) !=3D 0) {
 		printk(KERN_ERR "mtdoops: record_size must be a multiple of 4096\n");
 		return -EINVAL;
@@ -467,36 +423,41 @@ static int __init mtdoops_console_init(void)
 		printk(KERN_ERR "mtdoops: record_size must be over 4096 bytes\n");
 		return -EINVAL;
 	}
+
+	/* Setup the MTD device to use */
+	cxt->name =3D mtddev;
 	cxt->mtd_index =3D -1;
+	mtd_index =3D simple_strtoul(mtddev, &endp, 0);
+	if (endp !=3D mtddev)
+		cxt->mtd_index =3D mtd_index;
+
 	cxt->oops_buf =3D vmalloc(record_size);
 	if (!cxt->oops_buf) {
 		printk(KERN_ERR "mtdoops: failed to allocate buffer workspace\n");
 		return -ENOMEM;
 	}
+	memset(cxt->oops_buf, 0xff, record_size);
=20
-	spin_lock_init(&cxt->writecount_lock);
 	INIT_WORK(&cxt->work_erase, mtdoops_workfunc_erase);
 	INIT_WORK(&cxt->work_write, mtdoops_workfunc_write);
=20
-	register_console(&mtdoops_console);
 	register_mtd_user(&mtdoops_notifier);
 	return 0;
 }
=20
-static void __exit mtdoops_console_exit(void)
+static void __exit mtdoops_exit(void)
 {
 	struct mtdoops_context *cxt =3D &oops_cxt;
=20
 	unregister_mtd_user(&mtdoops_notifier);
-	unregister_console(&mtdoops_console);
 	kfree(cxt->name);
 	vfree(cxt->oops_buf);
 	vfree(cxt->oops_page_used);
 }
=20
=20
-subsys_initcall(mtdoops_console_init);
-module_exit(mtdoops_console_exit);
+module_init(mtdoops_init);
+module_exit(mtdoops_exit);
=20
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Richard Purdie <rpurdie@openedhand.com>");
--=20
1.6.0.4
