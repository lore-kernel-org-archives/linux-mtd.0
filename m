Received: from gateway30.websitewelcome.com ([192.185.192.34])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2GUR-0001Xx-VN
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2018 13:56:33 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id A0BA4E9A3
 for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2018 08:56:17 -0500 (CDT)
Date: Tue, 18 Sep 2018 08:55:55 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH v2] mtd: rawnand: atmel: Fix potential NULL pointer dereference
Message-ID: <20180918135555.GA18114@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is a potential execution path in which function
of_find_compatible_node() returns NULL. In such a case,
we end up having a NULL pointer dereference when accessing
pointer *nfc_np* in function of_clk_get().

So, we better don't take any chances and fix this by null
checking pointer *nfc_np* before calling of_clk_get().

Addresses-Coverity-ID: 1473052 ("Dereference null return value")
Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
Changes in v2:
 - Add Fixes tag to the commit log.
 - Remove blank line before null checking nfc_np.

 drivers/mtd/nand/raw/atmel/nand-controller.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index a38633a..5bfbe97 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -2034,6 +2034,10 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 	nand_np = dev->of_node;
 	nfc_np = of_find_compatible_node(dev->of_node, NULL,
 					 "atmel,sama5d3-nfc");
+	if (!nfc_np) {
+		dev_err(dev, "Could not find device node for sama5d3-nfc\n");
+		return -ENODEV;
+	}
 
 	nc->clk = of_clk_get(nfc_np, 0);
 	if (IS_ERR(nc->clk)) {
-- 
2.7.4
