Received: from mout.web.de ([217.72.192.78])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXC3x-0004z9-9v
 for linux-mtd@lists.infradead.org; Thu, 04 Jan 2018 20:24:31 +0000
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] mtdoops: Delete an error message for a failed memory
 allocation in two functions
Message-ID: <c3d061ff-1f96-cee5-17ea-036eb80a3da4@users.sourceforge.net>
Date: Thu, 4 Jan 2018 21:24:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jan 2018 21:10:56 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/mtdoops.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 97bb8f6304d4..ea8619ec970b 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -352,10 +352,8 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	/* oops_page_used is a bit field */
 	cxt->oops_page_used = vmalloc(DIV_ROUND_UP(mtdoops_pages,
 			BITS_PER_LONG) * sizeof(unsigned long));
-	if (!cxt->oops_page_used) {
-		printk(KERN_ERR "mtdoops: could not allocate page array\n");
+	if (!cxt->oops_page_used)
 		return;
-	}
 
 	cxt->dump.max_reason = KMSG_DUMP_OOPS;
 	cxt->dump.dump = mtdoops_do_dump;
@@ -420,10 +418,9 @@ static int __init mtdoops_init(void)
 		cxt->mtd_index = mtd_index;
 
 	cxt->oops_buf = vmalloc(record_size);
-	if (!cxt->oops_buf) {
-		printk(KERN_ERR "mtdoops: failed to allocate buffer workspace\n");
+	if (!cxt->oops_buf)
 		return -ENOMEM;
-	}
+
 	memset(cxt->oops_buf, 0xff, record_size);
 
 	INIT_WORK(&cxt->work_erase, mtdoops_workfunc_erase);
-- 
2.15.1
