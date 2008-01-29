Received: from tim.rpsys.net ([194.106.48.114])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JJocu-0003aW-8Z
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 11:27:53 +0000
Subject: [PATCH 4/4] mtdoops: Various minor cleanups
From: Richard Purdie <rpurdie@rpsys.net>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Tue, 29 Jan 2008 11:27:14 +0000
Message-Id: <1201606034.5017.23.camel@localhost.localdomain>
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

>From b4de341e0ca649104b95eb59024eba1d05b3da42 Mon Sep 17 00:00:00 2001
From: Richard Purdie <rpurdie@rpsys.net>
Date: Tue, 29 Jan 2008 10:25:55 +0000
Subject: [PATCH] [MTD] mtdoops: Various minor cleanups

Various minor cleaups to mtdoops:
  * Don't support the mtd->erasesize < OOPS_PAGE_SIZE case
  * Tweak printks and make the device mtdoops connects to more visible
  * CON_PRINTBUFFER flag is uneeded

Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/mtd/mtdoops.c |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 1687521..34681bc 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -67,10 +67,7 @@ static int mtdoops_erase_block(struct mtd_info *mtd, int offset)
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
@@ -271,12 +268,18 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
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
 
 	find_next_position(cxt);
 
-	printk(KERN_DEBUG "mtdoops: Attached to MTD device %d\n", mtd->index);
+	printk(KERN_INFO "mtdoops: Attached to MTD device %d\n", mtd->index);
 }
 
 static void mtdoops_notify_remove(struct mtd_info *mtd)
@@ -377,7 +380,6 @@ static struct console mtdoops_console = {
 	.write		= mtdoops_console_write,
 	.setup		= mtdoops_console_setup,
 	.unblank	= mtdoops_console_sync,
-	.flags		= CON_PRINTBUFFER,
 	.index		= -1,
 	.data		= &oops_cxt,
 };
@@ -390,7 +392,7 @@ static int __init mtdoops_console_init(void)
 	cxt->oops_buf = vmalloc(OOPS_PAGE_SIZE);
 
 	if (!cxt->oops_buf) {
-		printk(KERN_ERR "Failed to allocate oops buffer workspace\n");
+		printk(KERN_ERR "Failed to allocate mtdoops buffer workspace\n");
 		return -ENOMEM;
 	}
 
-- 
1.5.2.3
