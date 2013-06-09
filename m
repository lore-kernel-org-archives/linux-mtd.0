Received: from gw02.mail.saunalahti.fi ([195.197.172.116])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UlmzX-00040Z-A2
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2013 21:17:36 +0000
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: linux-mtd@lists.infradead.org, Emil Goode <emilgoode@gmail.com>,
 artem.bityutskiy@linux.intel.com, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] mtd: orion_nand: convert printk to dev_*
Date: Mon, 10 Jun 2013 00:16:54 +0300
Message-Id: <1370812614-5724-1-git-send-email-andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's better to use actual device name as a prefix in error messages.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/mtd/nand/orion_nand.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 8fbd002..ba38853 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -87,7 +87,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 
 	nc = kzalloc(sizeof(struct nand_chip) + sizeof(struct mtd_info), GFP_KERNEL);
 	if (!nc) {
-		printk(KERN_ERR "orion_nand: failed to allocate device structure.\n");
+		dev_err(&pdev->dev, "failed to allocate device structure.\n");
 		ret = -ENOMEM;
 		goto no_res;
 	}
@@ -101,7 +101,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 
 	io_base = ioremap(res->start, resource_size(res));
 	if (!io_base) {
-		printk(KERN_ERR "orion_nand: ioremap failed\n");
+		dev_err(&pdev->dev, "ioremap failed\n");
 		ret = -EIO;
 		goto no_res;
 	}
@@ -110,7 +110,8 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		board = devm_kzalloc(&pdev->dev, sizeof(struct orion_nand_data),
 					GFP_KERNEL);
 		if (!board) {
-			printk(KERN_ERR "orion_nand: failed to allocate board structure.\n");
+			dev_err(&pdev->dev,
+				"failed to allocate board structure.\n");
 			ret = -ENOMEM;
 			goto no_res;
 		}
-- 
1.8.3.101.g727a46b
