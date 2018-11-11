Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLkb0-0004Yu-Ae
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 07:55:51 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 11/22] mtd: rawnand: ams-delta: Explicitly inherit from
 nand_controller
Date: Sun, 11 Nov 2018 08:55:13 +0100
Message-Id: <20181111075524.13123-12-boris.brezillon@bootlin.com>
In-Reply-To: <20181111075524.13123-1-boris.brezillon@bootlin.com>
References: <20181111075524.13123-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All NAND objects are supposed to inherit from nand_controller. The
framework is providing a dummy controller object, but we're moving
away from this approach in favor of explicit inheritance.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Changes in v3:
- Add Janusz T-b

Changes in v2:
- None
---
 drivers/mtd/nand/raw/ams-delta.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index c59672a92832..34b83edb965c 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -29,6 +29,7 @@
  * MTD structure for E3 (Delta)
  */
 struct ams_delta_nand {
+	struct nand_controller	base;
 	struct nand_chip	nand_chip;
 	struct gpio_desc	*gpiod_rdy;
 	struct gpio_desc	*gpiod_nce;
@@ -277,6 +278,10 @@ static int ams_delta_init(struct platform_device *pdev)
 	/* Initialize data port direction to a known state */
 	ams_delta_dir_input(priv, true);
 
+	/* Initialize the NAND controller object embedded in ams_delta_nand. */
+	nand_controller_init(&priv->base);
+	this->controller = &priv->base;
+
 	/* Scan to find existence of the device */
 	err = nand_scan(this, 1);
 	if (err)
-- 
2.17.1
