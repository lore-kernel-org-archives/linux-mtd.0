Received: from mail-ea0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TPEWH-0004nH-PG
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2012 15:29:54 +0000
Received: by mail-ea0-f177.google.com with SMTP id n13so198879eaa.36
 for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2012 08:29:50 -0700 (PDT)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtdoops : don't erase flash at each boot
Date: Fri, 19 Oct 2012 17:29:33 +0200
Message-Id: <1350660573-6631-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If there is no oops stored (flash is erased), find_next_position will
exit with maxcount == 0xffffffff and erase the first page.

Only erase it if mark_is_used.

Signed-off-by: Matthieu Castet <matthieu.castet@parrot@com>
---
 drivers/mtd/mtdoops.c |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index f5b3f91..97bb8f6 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -271,7 +271,7 @@ static void find_next_position(struct mtdoops_context *cxt)
 
 		if (count[0] == 0xffffffff && count[1] == 0xffffffff)
 			mark_page_unused(cxt, page);
-		if (count[0] == 0xffffffff)
+		if (count[0] == 0xffffffff || count[1] != MTDOOPS_KERNMSG_MAGIC)
 			continue;
 		if (maxcount == 0xffffffff) {
 			maxcount = count[0];
@@ -289,14 +289,13 @@ static void find_next_position(struct mtdoops_context *cxt)
 		}
 	}
 	if (maxcount == 0xffffffff) {
-		cxt->nextpage = 0;
-		cxt->nextcount = 1;
-		schedule_work(&cxt->work_erase);
-		return;
+		cxt->nextpage = cxt->oops_pages - 1;
+		cxt->nextcount = 0;
+	}
+	else {
+		cxt->nextpage = maxpos;
+		cxt->nextcount = maxcount;
 	}
-
-	cxt->nextpage = maxpos;
-	cxt->nextcount = maxcount;
 
 	mtdoops_inc_counter(cxt);
 }
-- 
1.7.10.4
