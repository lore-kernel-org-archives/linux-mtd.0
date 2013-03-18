Received: from mail-da0-x234.google.com ([2607:f8b0:400e:c00::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHWjw-0005q2-SE
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 09:52:28 +0000
Received: by mail-da0-f52.google.com with SMTP id f10so1244900dak.11
 for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2013 02:52:23 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] mtd: denali_dt: Change return value to fix smatch warning
Date: Mon, 18 Mar 2013 15:11:13 +0530
Message-Id: <1363599674-26933-3-git-send-email-sachin.kamat@linaro.org>
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

platform_get_irq() also returns -ENXIO upon failure.
Use it instead of hardcoded return type.

Fixes the following smatch warning:
drivers/mtd/nand/denali_dt.c:93 denali_dt_probe() info:
why not propagate 'denali->irq' from platform_get_irq() instead of (-6)?

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/denali_dt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index eb68979..067a505 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -90,7 +90,7 @@ static int denali_dt_probe(struct platform_device *ofdev)
 	denali->irq = platform_get_irq(ofdev, 0);
 	if (denali->irq < 0) {
 		dev_err(&ofdev->dev, "no irq defined\n");
-		return -ENXIO;
+		return denali->irq;
 	}
 
 	denali->flash_reg = request_and_map(&ofdev->dev, denali_reg);
-- 
1.7.4.1
