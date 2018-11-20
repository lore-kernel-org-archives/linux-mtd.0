Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP1w1-0005f4-NE
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 09:03:07 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>, Stefan Agner <stefan@agner.ch>
Subject: [PATCH 08/10] mtd: rawnand: vf610: Stop using the dummy controller obj
Date: Tue, 20 Nov 2018 10:02:37 +0100
Message-Id: <20181120090239.5792-9-boris.brezillon@bootlin.com>
In-Reply-To: <20181120090239.5792-1-boris.brezillon@bootlin.com>
References: <20181120090239.5792-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The dummy controller is kept around to support old drivers. Let's
patch this one and declare our own nand_controller instance.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 845a639b0595..2e8b7e9314a3 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -152,6 +152,7 @@ enum vf610_nfc_variant {
 };
 
 struct vf610_nfc {
+	struct nand_controller base;
 	struct nand_chip chip;
 	struct device *dev;
 	void __iomem *regs;
@@ -887,8 +888,11 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
+	nand_controller_init(&nfc->base);
+	nfc->base.ops = &vf610_nfc_controller_ops;
+	chip->controller = &nfc->base;
+
 	/* Scan the NAND chip */
-	chip->dummy_controller.ops = &vf610_nfc_controller_ops;
 	err = nand_scan(chip, 1);
 	if (err)
 		goto err_disable_clk;
-- 
2.17.1
