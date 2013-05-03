Received: from mail-qe0-f42.google.com ([209.85.128.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UY7lw-0007Xa-53
 for linux-mtd@lists.infradead.org; Fri, 03 May 2013 04:39:06 +0000
Received: by mail-qe0-f42.google.com with SMTP id 1so722833qee.1
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2013 21:38:41 -0700 (PDT)
From: Xi Wang <xi.wang@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RESEND] mtd: denali: fix error handling for
 devm_ioremap_nocache()
Date: Fri,  3 May 2013 00:37:19 -0400
Message-Id: <1367555839-12920-1-git-send-email-xi.wang@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Xi Wang <xi.wang@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is incorrect to use `!res' for error handling since `res' must be
non-null.  Use the return value `ptr' instead.

Signed-off-by: Xi Wang <xi.wang@gmail.com>
---
 drivers/mtd/nand/denali_dt.c | 2 +-
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
1.8.1.2
