Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N7tDf-0004fi-1l
	for linux-mtd@lists.infradead.org; Tue, 10 Nov 2009 16:05:27 +0000
Subject: Re: [PATCH v13 4/4]: mtdoops: refactor as a kmsg_dumper
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091103141903.23d0d0be@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
	<20091029134123.348b5126@marrow.netinsight.se>
	<1257233392.21596.48.camel@localhost>
	<20091103141903.23d0d0be@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Nov 2009 18:04:58 +0200
Message-Id: <1257869098.21596.806.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-03 at 14:19 +0100, Simon Kagstrom wrote:
> The last messages which happens before a crash might contain interesting
> information about the crash. This patch reworks mtdoops using the
> kmsg_dumper support instead of a console, which simplifies the code and
> also includes the messages before the oops started.
> 
> On oops callbacks, the MTD device write is scheduled in a work queue (to
> be able to use the regular mtd->write call), while panics call
> mtd->panic_write directly. Thus, if panic_on_oops is set, the oops will
> be written out during the panic.
> 
> A parameter to specify which mtd device to use (number or name), as well
> as a flag, writable at runtime, to toggle wheter to dump oopses or only
> panics (since oopses can often be handled by regular syslog).
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>

Pushed to my l2-mtd-2.6 tree with the following amendments on top,
please, review:

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 731876a..a714ec4 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -337,9 +337,8 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumper,
 static void mtdoops_notify_add(struct mtd_info *mtd)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
-	u64 mtdoops_pages = mtd->size;
-
-	do_div(mtdoops_pages, record_size);
+	u64 mtdoops_pages = div_u64(mtd->size, record_size);
+	int err;
 
 	if (!strcmp(mtd->name, mtddev))
 		cxt->mtd_index = mtd->index;
@@ -352,13 +351,11 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		       mtd->index);
 		return;
 	}
-
 	if (mtd->erasesize < record_size) {
 		printk(KERN_ERR "mtdoops: eraseblock size of MTD partition %d too small\n",
 		       mtd->index);
 		return;
 	}
-
 	if (mtd->size > MTDOOPS_MAX_MTD_SIZE) {
 		printk(KERN_ERR "mtdoops: mtd%d is too large (limit is %d MiB)\n",
 		       mtd->index, MTDOOPS_MAX_MTD_SIZE / 1024 / 1024);
@@ -369,12 +366,14 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	cxt->oops_page_used = vmalloc(DIV_ROUND_UP(mtdoops_pages,
 			BITS_PER_LONG));
 	if (!cxt->oops_page_used) {
-		printk(KERN_ERR "Could not allocate page array\n");
+		printk(KERN_ERR "mtdoops: could not allocate page array\n");
 		return;
 	}
+
 	cxt->dump.dump = mtdoops_do_dump;
-	if (kmsg_dump_register(&cxt->dump) < 0) {
-		printk(KERN_ERR "Registering kmsg dumper failed\n");
+	err = kmsg_dump_register(&cxt->dump);
+	if (err) {
+		printk(KERN_ERR "mtdoops: registering kmsg dumper failed, error %d\n", err);
 		vfree(cxt->oops_page_used);
 		cxt->oops_page_used = NULL;
 		return;
@@ -394,7 +393,7 @@ static void mtdoops_notify_remove(struct mtd_info *mtd)
 		return;
 
 	if (kmsg_dump_unregister(&cxt->dump) < 0)
-		printk(KERN_WARNING "Could not unregister kmsg_dumper??\n");
+		printk(KERN_WARNING "mtdoops: could not unregister kmsg_dumper\n");
 
 	cxt->mtd = NULL;
 	flush_scheduled_work();

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
