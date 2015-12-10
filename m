From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Ryan Mallon <rmallon@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org, Alexander Clouter <alex@digriz.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Marek Vasut <marek.vasut@gmail.com>, Steven Miao <realmz6@gmail.com>,
 adi-buildroot-devel@lists.sourceforge.net,
 Mikael Starvik <starvik@axis.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-cris-kernel@axis.com,
 Josh Wu <josh.wu@atmel.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 35/58] mtd: nand: plat: use the mtd instance embedded in
 struct nand_chip
Date: Thu, 10 Dec 2015 09:00:19 +0100
Message-Id: <1449734442-18672-36-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1449734442-18672-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1449734442-18672-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

struct nand_chip now embeds an mtd device. Make use of this mtd instance.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
Changes generated with the following coccinelle script

--->8---
virtual patch

@fix1@
identifier __chipfield, __mtdfield;
type __type;
@@
(
	__type {
		...
		struct nand_chip __chipfield;
		...
-		struct mtd_info __mtdfield;
		...
	};
|
	__type {
		...
-		struct mtd_info __mtdfield;
		...
		struct nand_chip __chipfield;
		...
	};
)

@fix2 depends on fix1@
identifier fix1.__chipfield, fix1.__mtdfield;
identifier __subfield;
type fix1.__type;
__type *__priv;
@@
(
-	__priv->__mtdfield.__subfield
+	nand_to_mtd(&__priv->__chipfield)->__subfield
|
-	&(__priv->__mtdfield)
+	nand_to_mtd(&__priv->__chipfield)
)
--->8---
---
 drivers/mtd/nand/plat_nand.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 06ac6c6..796eb7d 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -20,7 +20,6 @@
 
 struct plat_nand_data {
 	struct nand_chip	chip;
-	struct mtd_info		mtd;
 	void __iomem		*io_base;
 };
 
@@ -31,6 +30,7 @@ static int plat_nand_probe(struct platform_device *pdev)
 {
 	struct platform_nand_data *pdata = dev_get_platdata(&pdev->dev);
 	struct plat_nand_data *data;
+	struct mtd_info *mtd;
 	struct resource *res;
 	const char **part_types;
 	int err = 0;
@@ -58,8 +58,9 @@ static int plat_nand_probe(struct platform_device *pdev)
 
 	data->chip.priv = &data;
 	nand_set_flash_node(&data->chip, pdev->dev.of_node);
-	data->mtd.priv = &data->chip;
-	data->mtd.dev.parent = &pdev->dev;
+	mtd = nand_to_mtd(&data->chip);
+	mtd->priv = &data->chip;
+	mtd->dev.parent = &pdev->dev;
 
 	data->chip.IO_ADDR_R = data->io_base;
 	data->chip.IO_ADDR_W = data->io_base;
@@ -87,21 +88,21 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Scan to find existence of the device */
-	if (nand_scan(&data->mtd, pdata->chip.nr_chips)) {
+	if (nand_scan(mtd, pdata->chip.nr_chips)) {
 		err = -ENXIO;
 		goto out;
 	}
 
 	part_types = pdata->chip.part_probe_types;
 
-	err = mtd_device_parse_register(&data->mtd, part_types, NULL,
+	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
 					pdata->chip.nr_partitions);
 
 	if (!err)
 		return err;
 
-	nand_release(&data->mtd);
+	nand_release(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -116,7 +117,7 @@ static int plat_nand_remove(struct platform_device *pdev)
 	struct plat_nand_data *data = platform_get_drvdata(pdev);
 	struct platform_nand_data *pdata = dev_get_platdata(&pdev->dev);
 
-	nand_release(&data->mtd);
+	nand_release(nand_to_mtd(&data->chip));
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
 
-- 
2.1.4
