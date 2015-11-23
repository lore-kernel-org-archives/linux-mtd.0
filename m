Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0tmZ-0008K8-W9
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2015 16:16:00 +0000
Received: by padhk6 with SMTP id hk6so27519757pad.2
 for <linux-mtd@lists.infradead.org>; Mon, 23 Nov 2015 08:15:39 -0800 (PST)
From: Saurabh Sengar <saurabh.truth@gmail.com>
To: mans@mansr.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Saurabh Sengar <saurabh.truth@gmail.com>
Subject: [PATCH v2] mtd: nand: use of_property_read_u8()
Date: Mon, 23 Nov 2015 21:45:29 +0530
Message-Id: <1448295329-3087-1-git-send-email-saurabh.truth@gmail.com>
In-Reply-To: <201511232333.kj6JWXch%fengguang.wu@intel.com>
References: <201511232333.kj6JWXch%fengguang.wu@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

use of_property_read_u8() for u8 values

Signed-off-by: Saurabh Sengar <saurabh.truth@gmail.com>
---
v2 :  added the missed semi colon
 drivers/mtd/nand/orion_nand.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index ee83749..0cbebc5 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -83,7 +83,6 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	struct clk *clk;
 	void __iomem *io_base;
 	int ret = 0;
-	u32 val = 0;
 
 	nc = devm_kzalloc(&pdev->dev,
 			sizeof(struct nand_chip) + sizeof(struct mtd_info),
@@ -103,22 +102,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 					GFP_KERNEL);
 		if (!board)
 			return -ENOMEM;
-		if (!of_property_read_u32(pdev->dev.of_node, "cle", &val))
-			board->cle = (u8)val;
-		else
-			board->cle = 0;
-		if (!of_property_read_u32(pdev->dev.of_node, "ale", &val))
-			board->ale = (u8)val;
-		else
+		of_property_read_u8(pdev->dev.of_node, "cle", &board->cle);
+
+		if (of_property_read_u8(pdev->dev.of_node, "ale", &board->ale))
 			board->ale = 1;
-		if (!of_property_read_u32(pdev->dev.of_node,
-						"bank-width", &val))
-			board->width = (u8)val * 8;
-		else
+		if (of_property_read_u8(pdev->dev.of_node,
+						"bank-width", &board->width))
 			board->width = 8;
-		if (!of_property_read_u32(pdev->dev.of_node,
-						"chip-delay", &val))
-			board->chip_delay = (u8)val;
+		of_property_read_u8(pdev->dev.of_node,
+					"chip-delay", &board->chip_delay);
 	} else {
 		board = dev_get_platdata(&pdev->dev);
 	}
-- 
1.9.1
