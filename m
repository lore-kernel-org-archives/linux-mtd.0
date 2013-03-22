Received: from mail-vb0-x22b.google.com ([2607:f8b0:400c:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UItoa-0007xX-K4
 for linux-mtd@lists.infradead.org; Fri, 22 Mar 2013 04:42:53 +0000
Received: by mail-vb0-f43.google.com with SMTP id fs19so2384645vbb.16
 for <linux-mtd@lists.infradead.org>; Thu, 21 Mar 2013 21:42:51 -0700 (PDT)
From: Xi Wang <xi.wang@gmail.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH] mtd: denali: fix error handling for devm_ioremap_nocache()
Date: Fri, 22 Mar 2013 00:42:34 -0400
Message-Id: <1363927354-13125-1-git-send-email-xi.wang@gmail.com>
Cc: linux-mtd@lists.infradead.org, Xi Wang <xi.wang@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use `ptr' rather than `res' to check the return value.

Signed-off-by: Xi Wang <xi.wang@gmail.com>
---
 drivers/mtd/nand/denali_dt.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
1.7.10.4
