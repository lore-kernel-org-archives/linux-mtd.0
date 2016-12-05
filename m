Received: from hauke-m.de ([5.39.93.123] helo=mail.hauke-m.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cE0bK-00082s-6C
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 21:15:07 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>, stable@vger.kernel.org
Subject: [PATCH V2 2/2] mtd: nand: xway: fix build because of module functions
Date: Mon,  5 Dec 2016 22:14:37 +0100
Message-Id: <20161205211437.29489-2-hauke@hauke-m.de>
In-Reply-To: <20161205211437.29489-1-hauke@hauke-m.de>
References: <20161205211437.29489-1-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the usage of modules functions to make this driver compile
again. Otherwise an include of linux/modules.h would be needed.

Fixes: 024366750c2e ("mtd: nand: xway: convert to normal platform driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 1f2948c..895101a 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -232,7 +232,6 @@ static const struct of_device_id xway_nand_match[] = {
 	{ .compatible = "lantiq,nand-xway" },
 	{},
 };
-MODULE_DEVICE_TABLE(of, xway_nand_match);
 
 static struct platform_driver xway_nand_driver = {
 	.probe	= xway_nand_probe,
@@ -243,6 +242,4 @@ static struct platform_driver xway_nand_driver = {
 	},
 };
 
-module_platform_driver(xway_nand_driver);
-
-MODULE_LICENSE("GPL");
+builtin_platform_driver(xway_nand_driver);
-- 
2.10.2
