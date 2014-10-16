Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xed9U-0004yf-Lo
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 04:59:05 +0000
From: Michael Opdenacker <michael.opdenacker@free-electrons.com>
To: andrew@lunn.ch, ezequiel.garcia@free-electrons.com, dwmw2@infradead.org,
 computersforpeace@gmail.com
Subject: [PATCH v2] mtd: orion_nand: fix error code path in probe
Date: Thu, 16 Oct 2014 06:58:35 +0200
Message-Id: <1413435515-12134-1-git-send-email-michael.opdenacker@free-electrons.com>
In-Reply-To: <543F4CF0.8080404@free-electrons.com>
References: <543F4CF0.8080404@free-electrons.com>
Cc: Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 jg1.han@samsung.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This replaces kzalloc() and ioremap() calls by devm_ functions
in the probe() routine, which automatically release the corresponding
resources when probe() fails or when the device is removed.

This simplifies simplifies the error management code, and brings
the below improvements or changes:

A. Fixing a bug reported by "make coccicheck":

If "board = devm_kzalloc()" fails, the probe() function jumps
incorrectly to label "no_res" and therefore returns without
running iounmap().

B. Requesting the memory region

Using devm_ioremap_resource() makes the probe() function request
the corresponding memory region before running ioremap(), as
it is supposed to do.

C. Standardizing the error codes:

The use of devm_ioremap_resource() changes the return value:
 * -ENOMEM instead of -EIO in case of ioremap() failure,
 * -EINVAL instead of -ENODEV in case of platform_get_resource()
   failure.

Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>
---
 drivers/mtd/nand/orion_nand.c | 39 +++++++++++----------------------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 471b4df3a5ac..0b49d5d34c50 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -19,7 +19,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/clk.h>
 #include <linux/err.h>
-#include <asm/io.h>
+#include <linux/io.h>
 #include <asm/sizes.h>
 #include <linux/platform_data/mtd-orion_nand.h>

@@ -85,33 +85,24 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;

-	nc = kzalloc(sizeof(struct nand_chip) + sizeof(struct mtd_info), GFP_KERNEL);
-	if (!nc) {
-		ret = -ENOMEM;
-		goto no_res;
-	}
+	nc = devm_kzalloc(&pdev->dev,
+			sizeof(struct nand_chip) + sizeof(struct mtd_info),
+			GFP_KERNEL);
+	if (!nc)
+		return -ENOMEM;
 	mtd = (struct mtd_info *)(nc + 1);

 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		ret = -ENODEV;
-		goto no_res;
-	}
+	io_base = devm_ioremap_resource(&pdev->dev, res);

-	io_base = ioremap(res->start, resource_size(res));
-	if (!io_base) {
-		dev_err(&pdev->dev, "ioremap failed\n");
-		ret = -EIO;
-		goto no_res;
-	}
+	if (IS_ERR(io_base))
+		return PTR_ERR(io_base);

 	if (pdev->dev.of_node) {
 		board = devm_kzalloc(&pdev->dev, sizeof(struct orion_nand_data),
 					GFP_KERNEL);
-		if (!board) {
-			ret = -ENOMEM;
-			goto no_res;
-		}
+		if (!board)
+			return -ENOMEM;
 		if (!of_property_read_u32(pdev->dev.of_node, "cle", &val))
 			board->cle = (u8)val;
 		else
@@ -185,9 +176,6 @@ no_dev:
 		clk_disable_unprepare(clk);
 		clk_put(clk);
 	}
-	iounmap(io_base);
-no_res:
-	kfree(nc);

 	return ret;
 }
@@ -195,15 +183,10 @@ no_res:
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
1.9.1
