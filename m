Received: from mail-pa0-f44.google.com ([209.85.220.44])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UYEW4-0005pD-9m
 for linux-mtd@lists.infradead.org; Fri, 03 May 2013 11:51:09 +0000
Received: by mail-pa0-f44.google.com with SMTP id jh10so889256pab.31
 for <linux-mtd@lists.infradead.org>; Fri, 03 May 2013 04:50:44 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mtd: onenand/samsung: Remove redundant
 platform_set_drvdata()
Date: Fri,  3 May 2013 17:07:43 +0530
Message-Id: <1367581063-24295-3-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1367581063-24295-1-git-send-email-sachin.kamat@linaro.org>
References: <1367581063-24295-1-git-send-email-sachin.kamat@linaro.org>
Cc: artem.bityutskiy@linux.intel.com, kyungmin.park@samsung.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 0998d06310 (device-core: Ensure drvdata = NULL when no
driver is bound) removes the need to set driver data field to
NULL.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/samsung.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 2cf7408..cebc48d 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -1073,7 +1073,6 @@ static int s3c_onenand_remove(struct platform_device *pdev)
 	release_mem_region(onenand->base_res->start,
 			   resource_size(onenand->base_res));
 
-	platform_set_drvdata(pdev, NULL);
 	kfree(onenand->oob_buf);
 	kfree(onenand->page_buf);
 	kfree(onenand);
-- 
1.7.9.5
