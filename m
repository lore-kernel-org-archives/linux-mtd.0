Received: from mail-pb0-f44.google.com ([209.85.160.44])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8c0q-0008Vg-8s
 for linux-mtd@lists.infradead.org; Sun, 11 Aug 2013 20:13:17 +0000
Received: by mail-pb0-f44.google.com with SMTP id xa7so6115750pbc.31
 for <linux-mtd@lists.infradead.org>; Sun, 11 Aug 2013 13:12:51 -0700 (PDT)
From: Nilanjan Roychowdhury <nilanjan.roychowdhury@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mtd: mtdoops: fix for a potential memory leak in
 mtdoops_notify_remove
Date: Sun, 11 Aug 2013 13:11:48 -0700
Message-Id: <1376251908-7451-1-git-send-email-nilanjan.roychowdhury@gmail.com>
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
every mtd_info addition but not freeing it in mtdoops_notify_remove

Signed-off-by: Nilanjan Roychowdhury <nilanjan.roychowdhury@gmail.com>
---
 drivers/mtd/mtdoops.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 97bb8f6..02f49aa 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -386,6 +386,7 @@ static void mtdoops_notify_remove(struct mtd_info *mtd)
 	cxt->mtd = NULL;
 	flush_work(&cxt->work_erase);
 	flush_work(&cxt->work_write);
+	vfree(cxt->oops_page_used);
 }
 
 
-- 
1.7.9.5
