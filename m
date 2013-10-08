Received: from mail-pb0-f41.google.com ([209.85.160.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTU7u-0000zR-FA
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2013 10:02:51 +0000
Received: by mail-pb0-f41.google.com with SMTP id rp2so8460180pbb.28
 for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2013 03:02:28 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: socrates_nand: Remove redundant dev_set_drvdata
Date: Tue,  8 Oct 2013 15:31:45 +0530
Message-Id: <1381226506-23030-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Driver core will set the driver data to NULL upon detach or
probe failure.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/socrates_nand.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index 09dde7d..f44c7c8 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -211,7 +211,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	nand_release(mtd);
 
 out:
-	dev_set_drvdata(&ofdev->dev, NULL);
 	iounmap(host->io_base);
 	kfree(host);
 	return res;
@@ -227,7 +226,6 @@ static int socrates_nand_remove(struct platform_device *ofdev)
 
 	nand_release(mtd);
 
-	dev_set_drvdata(&ofdev->dev, NULL);
 	iounmap(host->io_base);
 	kfree(host);
 
-- 
1.7.9.5
