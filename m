Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vts5f-0006wp-Rv
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 04:53:37 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MY30094G9KL4EC0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 13:53:09 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
Subject: [PATCH 1/8] mtd: docg3: Use devm_*() functions
Date: Fri, 20 Dec 2013 13:53:09 +0900
Message-id: <000f01cefd3f$60ef8540$22ce8fc0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Robert Jarzmik' <robert.jarzmik@free.fr>,
 'Jingoo Han' <jg1.han@samsung.com>, 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use devm_*() functions to make cleanup paths simpler.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/devices/docg3.c |   20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 4f091c1..dd5e101 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2047,21 +2047,21 @@ static int __init docg3_probe(struct platform_device *pdev)
 	ress = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!ress) {
 		dev_err(dev, "No I/O memory resource defined\n");
-		goto noress;
+		return ret;
 	}
-	base = ioremap(ress->start, DOC_IOSPACE_SIZE);
+	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
 
 	ret = -ENOMEM;
-	cascade = kzalloc(sizeof(*cascade) * DOC_MAX_NBFLOORS,
-			  GFP_KERNEL);
+	cascade = devm_kzalloc(dev, sizeof(*cascade) * DOC_MAX_NBFLOORS,
+			       GFP_KERNEL);
 	if (!cascade)
-		goto nomem1;
+		return ret;
 	cascade->base = base;
 	mutex_init(&cascade->lock);
 	cascade->bch = init_bch(DOC_ECC_BCH_M, DOC_ECC_BCH_T,
 			     DOC_ECC_BCH_PRIMPOLY);
 	if (!cascade->bch)
-		goto nomem2;
+		return ret;
 
 	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++) {
 		mtd = doc_probe_device(cascade, floor, dev);
@@ -2101,11 +2101,6 @@ err_probe:
 	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++)
 		if (cascade->floors[floor])
 			doc_release_device(cascade->floors[floor]);
-nomem2:
-	kfree(cascade);
-nomem1:
-	iounmap(base);
-noress:
 	return ret;
 }
 
@@ -2119,7 +2114,6 @@ static int __exit docg3_release(struct platform_device *pdev)
 {
 	struct docg3_cascade *cascade = platform_get_drvdata(pdev);
 	struct docg3 *docg3 = cascade->floors[0]->priv;
-	void __iomem *base = cascade->base;
 	int floor;
 
 	doc_unregister_sysfs(pdev, cascade);
@@ -2129,8 +2123,6 @@ static int __exit docg3_release(struct platform_device *pdev)
 			doc_release_device(cascade->floors[floor]);
 
 	free_bch(docg3->cascade->bch);
-	kfree(cascade);
-	iounmap(base);
 	return 0;
 }
 
-- 
1.7.10.4
