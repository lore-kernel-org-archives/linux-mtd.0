Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHWjz-0005rL-5D
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 09:52:28 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa12so6333131pbc.36
 for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2013 02:52:26 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] mtd: denali_dt: Remove redundant use of of_match_ptr
Date: Mon, 18 Mar 2013 15:11:14 +0530
Message-Id: <1363599674-26933-4-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1363599674-26933-1-git-send-email-sachin.kamat@linaro.org>
References: <1363599674-26933-1-git-send-email-sachin.kamat@linaro.org>
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

Since this driver is dt only and denali_nand_dt_ids is always
compiled in, use of of_match_ptr() macro is not necessary.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/denali_dt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 067a505..9253024 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -146,7 +146,7 @@ static struct platform_driver denali_dt_driver = {
 	.driver		= {
 		.name	= "denali-nand-dt",
 		.owner	= THIS_MODULE,
-		.of_match_table	= of_match_ptr(denali_nand_dt_ids),
+		.of_match_table	= denali_nand_dt_ids,
 	},
 };
 
-- 
1.7.4.1
