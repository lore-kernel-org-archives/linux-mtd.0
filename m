Received: from mail-pb0-x235.google.com ([2607:f8b0:400e:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V96YN-00059K-Cc
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 04:49:56 +0000
Received: by mail-pb0-f53.google.com with SMTP id up15so7576499pbc.12
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 21:49:33 -0700 (PDT)
From: Nilanjan Roychowdhury <nilanjan.roychowdhury@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH 1/1] Resubmit mtd: mtdoops: fix for a potential memory leak in
 mtdoops_notify_remove
Date: Mon, 12 Aug 2013 21:48:35 -0700
Message-Id: <1376369315-5170-1-git-send-email-nilanjan.roychowdhury@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 Nilanjan Roychowdhury <nilanjan.roychowdhury@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

we are allocating cxt->oops_page_used using vmalloc in mtdoops_notify_add for
every mtd_info addition but not freeing it in mtdoops_notify_remove. Also care is
taken so that we do not free the same pointer again in module remove.

Signed-off-by: Nilanjan Roychowdhury <nilanjan.roychowdhury@gmail.com>
---
 drivers/mtd/mtdoops.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 97bb8f6..4b8b621 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -386,6 +386,8 @@ static void mtdoops_notify_remove(struct mtd_info *mtd)
 	cxt->mtd = NULL;
 	flush_work(&cxt->work_erase);
 	flush_work(&cxt->work_write);
+	vfree(cxt->oops_page_used);
+	cxt->oops_page_used = NULL;
 }
 
 
@@ -439,7 +441,8 @@ static void __exit mtdoops_exit(void)
 
 	unregister_mtd_user(&mtdoops_notifier);
 	vfree(cxt->oops_buf);
-	vfree(cxt->oops_page_used);
+	if (cxt->oops_page_used)
+		vfree(cxt->oops_page_used);
 }
 
 
-- 
1.7.9.5
