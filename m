Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9X7f-0001b0-SE
 for linux-mtd@lists.infradead.org; Wed, 14 Aug 2013 09:12:08 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 4/29] mtd: simplify use of devm_ioremap_resource
Date: Wed, 14 Aug 2013 11:11:08 +0200
Message-Id: <1376471493-22215-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove unneeded error handling on the result of a call to
platform_get_resource when the value is passed to devm_ioremap_resource.

Move the call to platform_get_resource adjacent to the call to
devm_ioremap_resource to make the connection between them more clear.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev,res,n,e,e1;
expression ret != 0;
identifier l;
@@

- res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  ... when != res
- if (res == NULL) { ... \(goto l;\|return ret;\) }
  ... when != res
+ res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  e = devm_ioremap_resource(e1, res);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/devices/elm.c    |    5 -----
 drivers/mtd/nand/txx9ndfmc.c |    4 +---
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index 4f683d2..d1dd6a3 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -368,11 +368,6 @@ static int elm_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "no memory resource defined\n");
-		return -ENODEV;
-	}
-
 	info->elm_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(info->elm_base))
 		return PTR_ERR(info->elm_base);
diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 440b570..235714a 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -281,12 +281,10 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 	unsigned long gbusclk = plat->gbus_clock;
 	struct resource *res;
 
-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
 	drvdata = devm_kzalloc(&dev->dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
+	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
 	drvdata->base = devm_ioremap_resource(&dev->dev, res);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
