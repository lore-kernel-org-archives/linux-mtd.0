Received: from mail-pd0-f178.google.com ([209.85.192.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHWjt-0005p6-W6
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 09:52:23 +0000
Received: by mail-pd0-f178.google.com with SMTP id u10so774247pdi.9
 for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2013 02:52:18 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] mtd: denali_dt: Fix incorrect error check
Date: Mon, 18 Mar 2013 15:11:11 +0530
Message-Id: <1363599674-26933-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 dwmw2@infradead.org, dinguyen@altera.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The return value of devm_ioremap_nocache should be checked here instead
of res.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Dinh Nguyen <dinguyen@altera.com>
---
This series is compile tested against linux-next tree (20130318).
---
 drivers/mtd/nand/denali_dt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 546f8cb..02988b0 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -42,7 +42,7 @@ static void __iomem *request_and_map(struct device *dev,
 	}
 
 	ptr = devm_ioremap_nocache(dev, res->start, resource_size(res));
-	if (!res)
+	if (!ptr)
 		dev_err(dev, "ioremap_nocache of %s failed!", res->name);
 
 	return ptr;
-- 
1.7.4.1
