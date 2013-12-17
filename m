Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vsr71-0006ai-9Y
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 09:38:47 +0000
Received: by mail-pd0-f180.google.com with SMTP id q10so6542945pdj.25
 for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2013 01:38:25 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: onenand: fix warning (integer used as pointer)
Date: Tue, 17 Dec 2013 01:38:10 -0800
Message-Id: <1387273090-28216-1-git-send-email-computersforpeace@gmail.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes this sparse warning:

    CHECK   drivers/mtd/onenand/generic.c
  drivers/mtd/onenand/generic.c:61:62: warning: Using plain integer as NULL pointer

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Compile tested only

 drivers/mtd/onenand/generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
index 63699fffc96d..8e1919b6f074 100644
--- a/drivers/mtd/onenand/generic.c
+++ b/drivers/mtd/onenand/generic.c
@@ -58,7 +58,7 @@ static int generic_onenand_probe(struct platform_device *pdev)
 		goto out_release_mem_region;
 	}
 
-	info->onenand.mmcontrol = pdata ? pdata->mmcontrol : 0;
+	info->onenand.mmcontrol = pdata ? pdata->mmcontrol : NULL;
 	info->onenand.irq = platform_get_irq(pdev, 0);
 
 	info->mtd.name = dev_name(&pdev->dev);
-- 
1.8.3.2
