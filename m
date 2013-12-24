Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VvU5f-0007d5-IB
 for linux-mtd@lists.infradead.org; Tue, 24 Dec 2013 15:40:16 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: pxa3xx: Add "armada370-nand" compatible
Date: Tue, 24 Dec 2013 12:40:07 -0300
Message-Id: <1387899607-2656-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the driver can support the Armada 370/XP SoC NAND controller,
add the devicetree compatible string, enabling its use.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
Applies on top of l2-mtd.git master branch, rebased on top of v3.13-rc4
in order to include:

commit 9c59ac616137fb62f6cb3f1219201b09cbcf30be
Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date:   Mon Dec 9 18:36:26 2013 -0300

    Partially revert "mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand' compatible string"

and it is v3.14 material.

 drivers/mtd/nand/pxa3xx_nand.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 0599a88..31aae53 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -333,6 +333,10 @@ static struct of_device_id pxa3xx_nand_dt_ids[] = {
 		.compatible = "marvell,pxa3xx-nand",
 		.data       = (void *)PXA3XX_NAND_VARIANT_PXA,
 	},
+	{
+		.compatible = "marvell,armada370-nand",
+		.data       = (void *)PXA3XX_NAND_VARIANT_ARMADA370,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, pxa3xx_nand_dt_ids);
-- 
1.8.1.5
