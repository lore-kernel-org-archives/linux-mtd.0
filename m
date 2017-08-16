Received: from bran.ispras.ru ([83.149.199.196] helo=smtp.ispras.ru)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1di15v-00082z-Ke
 for linux-mtd@lists.infradead.org; Wed, 16 Aug 2017 16:23:02 +0000
From: Anton Vasilyev <vasilyev@ispras.ru>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Anton Vasilyev <vasilyev@ispras.ru>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ldv-project@linuxtesting.org
Subject: [PATCH v2] mtd: plat-ram: use release_mem_region instead of
 release_resource
Date: Wed, 16 Aug 2017 19:22:17 +0300
Message-Id: <1502900537-14402-1-git-send-email-vasilyev@ispras.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace ioremap() and request_mem_region() by devm_ioremap_resource().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>
Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
v1: Fix commit based on Boris Brezillon review
---
v2: Change commit by Boris Brezillon solution
---
 drivers/mtd/maps/plat-ram.c | 38 ++++----------------------------------
 1 file changed, 4 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 5157289..6d9a4d6 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -43,7 +43,6 @@ struct platram_info {
 	struct device		*dev;
 	struct mtd_info		*mtd;
 	struct map_info		 map;
-	struct resource		*area;
 	struct platdata_mtd_ram	*pdata;
 };
 
@@ -97,16 +96,6 @@ static int platram_remove(struct platform_device *pdev)
 
 	platram_setrw(info, PLATRAM_RO);
 
-	/* release resources */
-
-	if (info->area) {
-		release_resource(info->area);
-		kfree(info->area);
-	}
-
-	if (info->map.virt != NULL)
-		iounmap(info->map.virt);
-
 	kfree(info);
 
 	return 0;
@@ -147,12 +136,11 @@ static int platram_probe(struct platform_device *pdev)
 	info->pdata = pdata;
 
 	/* get the resource for the memory mapping */
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	if (res == NULL) {
-		dev_err(&pdev->dev, "no memory resource specified\n");
-		err = -ENOENT;
+	info->map.virt = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(info->map.virt)) {
+		err = PTR_ERR(info->map.virt);
+		dev_err(&pdev->dev, "failed to ioremap() region\n");
 		goto exit_free;
 	}
 
@@ -167,26 +155,8 @@ static int platram_probe(struct platform_device *pdev)
 			(char *)pdata->mapname : (char *)pdev->name;
 	info->map.bankwidth = pdata->bankwidth;
 
-	/* register our usage of the memory area */
-
-	info->area = request_mem_region(res->start, info->map.size, pdev->name);
-	if (info->area == NULL) {
-		dev_err(&pdev->dev, "failed to request memory region\n");
-		err = -EIO;
-		goto exit_free;
-	}
-
-	/* remap the memory area */
-
-	info->map.virt = ioremap(res->start, info->map.size);
 	dev_dbg(&pdev->dev, "virt %p, %lu bytes\n", info->map.virt, info->map.size);
 
-	if (info->map.virt == NULL) {
-		dev_err(&pdev->dev, "failed to ioremap() region\n");
-		err = -EIO;
-		goto exit_free;
-	}
-
 	simple_map_init(&info->map);
 
 	dev_dbg(&pdev->dev, "initialised map, probing for mtd\n");
-- 
2.7.4
