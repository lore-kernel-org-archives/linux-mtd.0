Received: from mail-pd0-f176.google.com ([209.85.192.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG5ET-0003GE-Lm
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 10:18:01 +0000
Received: by mail-pd0-f176.google.com with SMTP id t12so40529pdi.35
 for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2013 03:17:55 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/5] mtd: dataflash: Use of_match_ptr() macro
Date: Thu, 14 Mar 2013 15:37:00 +0530
Message-Id: <1363255624-20885-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This eliminates having an #ifdef returning NULL for the case
when OF is disabled.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/devices/mtd_dataflash.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 945c9f76..28779b6 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -105,8 +105,6 @@ static const struct of_device_id dataflash_dt_ids[] = {
 	{ .compatible = "atmel,dataflash", },
 	{ /* sentinel */ }
 };
-#else
-#define dataflash_dt_ids NULL
 #endif
 
 /* ......................................................................... */
@@ -914,7 +912,7 @@ static struct spi_driver dataflash_driver = {
 	.driver = {
 		.name		= "mtd_dataflash",
 		.owner		= THIS_MODULE,
-		.of_match_table = dataflash_dt_ids,
+		.of_match_table = of_match_ptr(dataflash_dt_ids),
 	},
 
 	.probe		= dataflash_probe,
-- 
1.7.4.1
