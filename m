Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UYEVz-0005os-Aw
 for linux-mtd@lists.infradead.org; Fri, 03 May 2013 11:51:04 +0000
Received: by mail-pb0-f47.google.com with SMTP id uo1so859097pbc.6
 for <linux-mtd@lists.infradead.org>; Fri, 03 May 2013 04:50:38 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd: onenand/generic: Remove redundant
 platform_set_drvdata()
Date: Fri,  3 May 2013 17:07:41 +0530
Message-Id: <1367581063-24295-1-git-send-email-sachin.kamat@linaro.org>
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
 drivers/mtd/onenand/generic.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
index 9f11562..42520a3 100644
--- a/drivers/mtd/onenand/generic.c
+++ b/drivers/mtd/onenand/generic.c
@@ -94,8 +94,6 @@ static int generic_onenand_remove(struct platform_device *pdev)
 	struct resource *res = pdev->resource;
 	unsigned long size = resource_size(res);
 
-	platform_set_drvdata(pdev, NULL);
-
 	if (info) {
 		onenand_release(&info->mtd);
 		release_mem_region(res->start, size);
-- 
1.7.9.5
