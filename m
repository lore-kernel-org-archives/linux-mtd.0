Received: from mail-we0-x22f.google.com ([2a00:1450:400c:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXv0S-0001qh-Gy
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 15:01:13 +0000
Received: by mail-we0-f175.google.com with SMTP id s43so555567wey.20
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2013 08:00:50 -0700 (PDT)
From: Laurent Navet <laurent.navet@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] drivers: mtd: devices: elm: use devm_ioremap_resource()
Date: Thu,  2 May 2013 17:09:05 +0200
Message-Id: <1367507346-29382-1-git-send-email-laurent.navet@gmail.com>
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Laurent Navet <laurent.navet@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace a call to deprecated devm_request_and_ioremap by devm_ioremap_resource.

Found with coccicheck and this semantic patch:
 scripts/coccinelle/api/devm_request_and_ioremap.cocci.

Signed-off-by: Laurent Navet <laurent.navet@gmail.com>
---
 drivers/mtd/devices/elm.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index 2ec5da9..2bafb06 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -344,9 +344,9 @@ static int elm_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info->elm_base = devm_request_and_ioremap(&pdev->dev, res);
-	if (!info->elm_base)
-		return -EADDRNOTAVAIL;
+	info->elm_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(info->elm_base))
+		return PTR_ERR(info->elm_base);
 
 	ret = devm_request_irq(&pdev->dev, irq->start, elm_isr, 0,
 			pdev->name, info);
-- 
1.7.10.4
