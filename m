Received: from mail-lb0-f181.google.com ([209.85.217.181])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ulbfi-0002jW-T0
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2013 09:12:24 +0000
Received: by mail-lb0-f181.google.com with SMTP id w10so2707591lbi.40
 for <linux-mtd@lists.infradead.org>; Sun, 09 Jun 2013 02:11:58 -0700 (PDT)
From: Emil Goode <emilgoode@gmail.com>
To: dwmw2@infradead.org, artem.bityutskiy@linux.intel.com, andrew@lunn.ch,
 wfp5p@virginia.edu, jg1.han@samsung.com
Subject: [PATCH] mtd: orion_nand: Improve error handling in orion_nand_probe
Date: Sun,  9 Jun 2013 11:08:22 +0200
Message-Id: <1370768902-20239-1-git-send-email-emilgoode@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes some issues in the error handling and simplifies
the code by converting to devm* functions.

If the kzalloc call fails it is unnecessary to use the label no_res
and pass a NULL pointer to kfree. If the devm_kzalloc call fails on
line 110 we forgett to call iounmap for the previous ioremap call.

The following changes are introduced:
- Convert to devm_kzalloc and remove calls to kfree.
- Convert to devm_ioremap_resource that adds a missing call to
  *request_mem_region and remove calls to iounmap.
- The devm_ioremap_resource function checks the passed resource so
  we can remove the NULL check after the platform_get_resource call.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
The patch is only build tested

 drivers/mtd/nand/orion_nand.c |   39 +++++++++++----------------------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 8fbd002..cc22f2f 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -85,34 +85,25 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	nc = kzalloc(sizeof(struct nand_chip) + sizeof(struct mtd_info), GFP_KERNEL);
+	nc = devm_kzalloc(&pdev->dev, sizeof(struct nand_chip) +
+			  sizeof(struct mtd_info), GFP_KERNEL);
 	if (!nc) {
 		printk(KERN_ERR "orion_nand: failed to allocate device structure.\n");
-		ret = -ENOMEM;
-		goto no_res;
+		return -ENOMEM;
 	}
 	mtd = (struct mtd_info *)(nc + 1);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		ret = -ENODEV;
-		goto no_res;
-	}
-
-	io_base = ioremap(res->start, resource_size(res));
-	if (!io_base) {
-		printk(KERN_ERR "orion_nand: ioremap failed\n");
-		ret = -EIO;
-		goto no_res;
-	}
+	io_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(io_base))
+		return PTR_ERR(io_base);
 
 	if (pdev->dev.of_node) {
 		board = devm_kzalloc(&pdev->dev, sizeof(struct orion_nand_data),
-					GFP_KERNEL);
+				     GFP_KERNEL);
 		if (!board) {
 			printk(KERN_ERR "orion_nand: failed to allocate board structure.\n");
-			ret = -ENOMEM;
-			goto no_res;
+			return -ENOMEM;
 		}
 		if (!of_property_read_u32(pdev->dev.of_node, "cle", &val))
 			board->cle = (u8)val;
@@ -167,7 +158,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 
 	if (nand_scan(mtd, 1)) {
 		ret = -ENXIO;
-		goto no_dev;
+		goto disable_clk;
 	}
 
 	mtd->name = "orion_nand";
@@ -176,20 +167,17 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 			board->parts, board->nr_parts);
 	if (ret) {
 		nand_release(mtd);
-		goto no_dev;
+		goto disable_clk;
 	}
 
 	return 0;
 
-no_dev:
+disable_clk:
 	if (!IS_ERR(clk)) {
 		clk_disable_unprepare(clk);
 		clk_put(clk);
 	}
 	platform_set_drvdata(pdev, NULL);
-	iounmap(io_base);
-no_res:
-	kfree(nc);
 
 	return ret;
 }
@@ -197,15 +185,10 @@ no_res:
 static int orion_nand_remove(struct platform_device *pdev)
 {
 	struct mtd_info *mtd = platform_get_drvdata(pdev);
-	struct nand_chip *nc = mtd->priv;
 	struct clk *clk;
 
 	nand_release(mtd);
 
-	iounmap(nc->IO_ADDR_W);
-
-	kfree(nc);
-
 	clk = clk_get(&pdev->dev, NULL);
 	if (!IS_ERR(clk)) {
 		clk_disable_unprepare(clk);
-- 
1.7.10.4
