Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N5E60-0006LO-Uf
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 07:46:33 +0000
Subject: Re: [PATCH v12 3/4]: mtdoops: Make page (record) size configurable
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091103082754.3481e9ed@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
	<20091029134119.7452f327@marrow.netinsight.se>
	<1257229438.21596.28.camel@localhost>
	<20091103082754.3481e9ed@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Nov 2009 09:45:48 +0200
Message-Id: <1257234348.21596.52.camel@localhost>
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

On Tue, 2009-11-03 at 08:27 +0100, Simon Kagstrom wrote:
> On Tue, 03 Nov 2009 08:23:58 +0200
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 
> > On Thu, 2009-10-29 at 13:41 +0100, Simon Kagstrom wrote:
> > > The main justification for this is to allow catching long messages
> > > during a panic, where the top part might otherwise be lost since moving
> > > to the next block can require a flash erase.
> > > 
> > > Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> > > Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>
> > > ---
> > > ChangeLog:
> > >  * Rebased over "[PATCH v12 2/4]: mtdoops: Add a maximum MTD partition size"
> > > 
> > >  drivers/mtd/mtdoops.c |   75 ++++++++++++++++++++++++++++--------------------
> > >  1 files changed, 44 insertions(+), 31 deletions(-)
> > 
> > Pushed this one to my tree, on top of the previous patch which I
> > tweaked, thanks.
> 
> Thanks! I was going to send an updated patch in, but I've had some
> other work to do lately. I'll send in a new version of the final patch
> before the end of the day.
> 
> 
> I noticed a small issue in your updated patch:

Fixed, thanks. And made the limit to be 8MiB. Pushed to my tree and
inlined below.


>From 3d91aca8e7b4c1b6bfa44a941ff4341e73dc665c Mon Sep 17 00:00:00 2001
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
Date: Tue, 3 Nov 2009 08:08:41 +0200
Subject: [PATCH] mtd: mtdoops: limit the maximum mtd partition size

Make the maximum mtdoops partition size to be 8MiB. Indeed, it does
not make sense to use anything larger than that anyway. This limit
makes it possible to catch stupid mistakes where the user gives e.g.,
a rootfs partition to mtdoops (which will happily erase it).

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/mtdoops.c |   17 +++++++++++------
 1 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 06c5382..b016eee 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -33,6 +33,9 @@
 #include <linux/interrupt.h>
 #include <linux/mtd/mtd.h>
 
+/* Maximum MTD partition size */
+#define MTDOOPS_MAX_MTD_SIZE (8 * 1024 * 1024)
+
 #define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
 #define OOPS_PAGE_SIZE 4096
 
@@ -310,6 +313,12 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		return;
 	}
 
+	if (mtd->size > MTDOOPS_MAX_MTD_SIZE) {
+		printk(KERN_ERR "mtdoops: mtd%d is too large (limit is %d MiB)\n",
+		       mtd->index, MTDOOPS_MAX_MTD_SIZE / 1024 / 1024);
+		return;
+	}
+
 	/* oops_page_used is a bit field */
 	cxt->oops_page_used = vmalloc(DIV_ROUND_UP(mtdoops_pages,
 			BITS_PER_LONG));
@@ -317,14 +326,10 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		printk(KERN_ERR "Could not allocate page array\n");
 		return;
 	}
-	cxt->mtd = mtd;
-	if (mtd->size > INT_MAX)
-		cxt->oops_pages = INT_MAX / OOPS_PAGE_SIZE;
-	else
-		cxt->oops_pages = (int)mtd->size / OOPS_PAGE_SIZE;
 
+	cxt->mtd = mtd;
+	cxt->oops_pages = (int)mtd->size / OOPS_PAGE_SIZE;
 	find_next_position(cxt);
-
 	printk(KERN_INFO "mtdoops: Attached to MTD device %d\n", mtd->index);
 }
 
-- 
1.6.2.5


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
