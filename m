Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXtsK-0000NW-36
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 13:48:44 +0000
Received: by mail-wi0-f179.google.com with SMTP id l13so602842wie.6
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2013 06:48:20 -0700 (PDT)
From: Laurent Navet <laurent.navet@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH V2] drivers: mtd: nand: davinci: use devm_ioremap_resource()
Date: Thu,  2 May 2013 15:56:10 +0200
Message-Id: <1367502970-28642-1-git-send-email-laurent.navet@gmail.com>
Cc: mturquette@linaro.org, sshtylyov@ru.mvista.com,
 artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 m-karicheri2@ti.com, linux-mtd@lists.infradead.org,
 Laurent Navet <laurent.navet@gmail.com>
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
 drivers/mtd/nand/davinci_nand.c |   13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 94e17af..941f69a 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -623,11 +623,14 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 		goto err_nomem;
 	}
 
-	vaddr = devm_request_and_ioremap(&pdev->dev, res1);
-	base = devm_request_and_ioremap(&pdev->dev, res2);
-	if (!vaddr || !base) {
-		dev_err(&pdev->dev, "ioremap failed\n");
-		ret = -EADDRNOTAVAIL;
+	vaddr = devm_ioremap_resource(&pdev->dev, res1);
+	if (IS_ERR(vaddr)) {
+		ret = PTR_ERR(vaddr);
+		goto err_ioremap;
+	}
+	base = devm_ioremap_resource(&pdev->dev, res2);
+	if (IS_ERR(base)) {
+		ret = PTR_ERR(base);
 		goto err_ioremap;
 	}
 
-- 
1.7.10.4
