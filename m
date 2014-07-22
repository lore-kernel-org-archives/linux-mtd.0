Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9PVK-0008Hj-Gm
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 02:08:35 +0000
Received: by mail-pd0-f170.google.com with SMTP id g10so10323487pdj.29
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2014 19:08:13 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: fix integer widening problems
Date: Mon, 21 Jul 2014 19:08:03 -0700
Message-Id: <1405994883-19610-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

chip->pagebuf is a 32-bit type (int), so the shift will only be applied
as 32-bit. Fix this for 64-bit safety.

Caught by Coverity.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
I haven't confirmed through tests, but this likely could be pretty dangerous.
Perhaps it should be marked for -stable? (In the meantime, maybe I'll see if I
can rig up a test case that fails.)

 drivers/mtd/nand/nand_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d8cdf06343fb..4ffb06b8138d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2391,8 +2391,8 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	blockmask = (1 << (chip->phys_erase_shift - chip->page_shift)) - 1;
 
 	/* Invalidate the page cache, when we write to the cached page */
-	if (to <= (chip->pagebuf << chip->page_shift) &&
-	    (chip->pagebuf << chip->page_shift) < (to + ops->len))
+	if (to <= ((loff_t)chip->pagebuf << chip->page_shift) &&
+	    ((loff_t)chip->pagebuf << chip->page_shift) < (to + ops->len))
 		chip->pagebuf = -1;
 
 	/* Don't allow multipage oob writes with offset */
-- 
1.9.1
