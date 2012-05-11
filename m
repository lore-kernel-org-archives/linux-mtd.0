Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSwUC-0004zl-16
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 20:30:48 +0000
Received: by dadm1 with SMTP id m1so4049880dad.36
 for <linux-mtd@lists.infradead.org>; Fri, 11 May 2012 13:30:46 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/3] mtdoops: refactor loop
Date: Fri, 11 May 2012 13:30:33 -0700
Message-Id: <1336768235-12658-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We can clean up the loop logic a bit, here. This refactoring was enabled
in part by:

 Commit bb4a09866 [mtdoops: clean-up new MTD API usage]

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdoops.c |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index ae36d7e..6ba9507 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -169,14 +169,7 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 			cxt->nextpage = 0;
 	}
 
-	while (1) {
-		ret = mtd_block_isbad(mtd, cxt->nextpage * record_size);
-		if (!ret)
-			break;
-		if (ret < 0) {
-			printk(KERN_ERR "mtdoops: block_isbad failed, aborting\n");
-			return;
-		}
+	while ((ret = mtd_block_isbad(mtd, cxt->nextpage * record_size)) > 0) {
 badblock:
 		printk(KERN_WARNING "mtdoops: bad block at %08lx\n",
 		       cxt->nextpage * record_size);
@@ -190,6 +183,11 @@ badblock:
 		}
 	}
 
+	if (ret < 0) {
+		printk(KERN_ERR "mtdoops: mtd_block_isbad failed, aborting\n");
+		return;
+	}
+
 	for (j = 0, ret = -1; (j < 3) && (ret < 0); j++)
 		ret = mtdoops_erase_block(cxt, cxt->nextpage * record_size);
 
-- 
1.7.5.4.2.g519b1
