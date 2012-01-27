Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqsZ6-0003JX-BV
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 20:38:32 +0000
Received: by dadz9 with SMTP id z9so896373dad.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 12:38:30 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: mtdcore: remove unnecessary mtd->resume check
Date: Fri, 27 Jan 2012 12:39:32 -0800
Message-Id: <1327696772-18081-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We don't need to to check for mtd->resume before calling mtd_resume().
mtd_resume() should take care of that.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdcore.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index de96865..f96c2cd 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -126,7 +126,7 @@ static int mtd_cls_resume(struct device *dev)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
-	if (mtd && mtd->resume)
+	if (mtd)
 		mtd_resume(mtd);
 	return 0;
 }
-- 
1.7.5.4
