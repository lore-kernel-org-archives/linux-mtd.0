Received: from mail-ea0-x22b.google.com ([2a00:1450:4013:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQ29a-0007AD-2x
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2013 21:02:02 +0000
Received: by mail-ea0-f171.google.com with SMTP id b15so427987eae.30
 for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2013 14:01:59 -0700 (PDT)
From: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] drivers: mtd: devices: convert to devm_ioremap_resource()
Date: Thu, 11 Apr 2013 00:01:51 +0300
Message-Id: <1365627711-17476-1-git-send-email-silviupopescu1990@gmail.com>
Cc: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert all uses of devm_request_and_ioremap() to the newly introduced
devm_ioremap_resource() which provides more consistent error handling.

Signed-off-by: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>
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
1.7.9.5
