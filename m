Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WwRjp-0000Q3-Sx
 for linux-mtd@lists.infradead.org; Mon, 16 Jun 2014 07:53:58 +0000
Received: by mail-pb0-f46.google.com with SMTP id md12so3367073pbc.33
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jun 2014 00:53:36 -0700 (PDT)
From: Kevin Hao <haokexin@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd/ftl: fix the double free of the buffers allocated in
 build_maps()
Date: Mon, 16 Jun 2014 15:52:37 +0800
Message-Id: <1402905157-10330-3-git-send-email-haokexin@gmail.com>
In-Reply-To: <1402905157-10330-1-git-send-email-haokexin@gmail.com>
References: <1402905157-10330-1-git-send-email-haokexin@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In function build_maps(), it will free all the buffers it has allocated
before return with error. So the invoking of ftl_freepart() will causes
the buffers to be freed twice and then weird things would happen.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/mtd/ftl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index 71f2782f03fc..dabf08450d0b 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -1072,7 +1072,6 @@ static void ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 			return;
 	}
 
-	ftl_freepart(partition);
 	kfree(partition);
 }
 
-- 
1.9.3
