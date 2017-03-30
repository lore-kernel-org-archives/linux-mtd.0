Received: from lelnx193.ext.ti.com ([198.47.27.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctUfF-0000z6-7l
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 07:38:39 +0000
From: Roger Quadros <rogerq@ti.com>
To: <boris.brezillon@free-electrons.com>
CC: <richard@nod.at>, <aford173@gmail.com>, <enrico.leto@siemens.com>,
 <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>, "# 4 . 7+"
 <stable@vger.kernel.org>
Subject: [PATCH] mtd: nand: omap2: Fix partition creation via cmdline mtdparts
Date: Thu, 30 Mar 2017 10:37:50 +0300
Message-ID: <1490859470-7973-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

commit c9711ec5250b ("mtd: nand: omap: Clean up device tree support")
caused the parent device name to be changed from "omap2-nand.0"
to "<base address>.nand"  (e.g. 30000000.nand on omap3 platforms).
This caused mtd->name to be changed as well. This breaks partition
creation via mtdparts passed by u-boot as it uses "omap2-nand.0"
for the mtd-id.

Fix this by explicitly setting the mtd->name to "omap2-nand.<CS number>"
if it isn't already set by nand_set_flash_node(). CS number is the
NAND controller instance ID.

Fixes: c9711ec5250b ("mtd: nand: omap: Clean up device tree support")
Cc: <stable@vger.kernel.org> # 4.7+
Reported-by: Leto Enrico <enrico.leto@siemens.com>
Reported-by: Adam Ford <aford173@gmail.com>
Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Tested-by: Adam Ford <aford173@gmail.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/mtd/nand/omap2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 2a52101..084934a 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1856,6 +1856,15 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_chip->ecc.priv	= NULL;
 	nand_set_flash_node(nand_chip, dev->of_node);
 
+	if (!mtd->name) {
+		mtd->name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+					   "omap2-nand.%d", info->gpmc_cs);
+		if (!mtd->name) {
+			dev_err(&pdev->dev, "Failed to set MTD name\n");
+			return -ENOMEM;
+		}
+	}
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	nand_chip->IO_ADDR_R = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(nand_chip->IO_ADDR_R))
-- 
2.7.4
