Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG5Ee-0003Iw-N4
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 10:18:12 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa12so1976245pbc.22
 for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2013 03:18:07 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/5] mtd: sh_flctl: Use of_match_ptr() macro
Date: Thu, 14 Mar 2013 15:37:04 +0530
Message-Id: <1363255624-20885-5-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1363255624-20885-1-git-send-email-sachin.kamat@linaro.org>
References: <1363255624-20885-1-git-send-email-sachin.kamat@linaro.org>
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
 drivers/mtd/nand/sh_flctl.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 5899738..e57e18e 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -1081,7 +1081,6 @@ static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
 	return pdata;
 }
 #else /* CONFIG_OF */
-#define of_flctl_match NULL
 static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
 {
 	return NULL;
@@ -1219,7 +1218,7 @@ static struct platform_driver flctl_driver = {
 	.driver = {
 		.name	= "sh_flctl",
 		.owner	= THIS_MODULE,
-		.of_match_table = of_flctl_match,
+		.of_match_table = of_match_ptr(of_flctl_match),
 	},
 };
 
-- 
1.7.4.1
