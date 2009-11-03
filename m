Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N5Cne-0005ZX-LE
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 06:23:31 +0000
Subject: Re: [PATCH v12 2/4]: mtdoops: Add a maximum MTD partition size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091029134116.354237ba@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
	<20091029134116.354237ba@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Nov 2009 08:23:10 +0200
Message-Id: <1257229390.21596.27.camel@localhost>
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

On Thu, 2009-10-29 at 13:41 +0100, Simon Kagstrom wrote:
> A configurable maximum MTD partition size for mtdoops avoids mistakes
> where the user gives e.g., a rootfs partition to mtdoops (which will
> happily erase it).
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>

I've amended your patch and pushed the amended version to my tree.
Please, validate.

>From 9483bcb6b097ef3078e5a8798012e06e5156e54e Mon Sep 17 00:00:00 2001
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
Date: Tue, 3 Nov 2009 08:08:41 +0200
Subject: mtd: mtdoops: limit the maximum mtd partition size

Make the maximum mtdoops partition size to be 32MiB. Indeed, it does
not make sense to use anything larger than that anyway. This limit
makes it possible to catch stupid mistakes where the user gives e.g.,
a rootfs partition to mtdoops (which will happily erase it).

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/mtdoops.c |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 06c5382..2493c08 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -33,6 +33,8 @@
 #include <linux/interrupt.h>
 #include <linux/mtd/mtd.h>
 
+/* Maximum MTD partition size, MiB */
+#define MTDOOPS_MAX_MTD_SIZE 32
 #define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
 #define OOPS_PAGE_SIZE 4096
 
@@ -310,6 +312,12 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		return;
 	}
 
+	if (mtd->size > MTDOOPS_MAX_MTD_SIZE) {
+		printk(KERN_ERR "mtdoops: mtd%d is too large (limit is %d MiB)\n",
+		       mtd->index, MTDOOPS_MAX_MTD_SIZE);
+		return;
+	}
+
 	/* oops_page_used is a bit field */
 	cxt->oops_page_used = vmalloc(DIV_ROUND_UP(mtdoops_pages,
 			BITS_PER_LONG));
@@ -317,14 +325,10 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
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
