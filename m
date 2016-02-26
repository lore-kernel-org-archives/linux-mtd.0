From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>, Kyungmin Park <kyungmin.park@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 punnaiah choudary kalluri <punnaia@xilinx.com>,
 Priit Laes <plaes@plaes.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-api@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 39/52] mtd: nand: jz4780: switch to mtd_ooblayout_ops
Date: Fri, 26 Feb 2016 01:57:47 +0100
Message-Id: <1456448280-27788-40-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1456448280-27788-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1456448280-27788-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implementing the mtd_ooblayout_ops interface is the new way of exposing
ECC/OOB layout to MTD users.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/jz4780_nand.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
index e1c016c..b86a579 100644
--- a/drivers/mtd/nand/jz4780_nand.c
+++ b/drivers/mtd/nand/jz4780_nand.c
@@ -56,8 +56,6 @@ struct jz4780_nand_chip {
 	struct nand_chip chip;
 	struct list_head chip_list;
 
-	struct nand_ecclayout ecclayout;
-
 	struct gpio_desc *busy_gpio;
 	struct gpio_desc *wp_gpio;
 	unsigned int reading: 1;
@@ -165,8 +163,7 @@ static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *de
 	struct nand_chip *chip = &nand->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct jz4780_nand_controller *nfc = to_jz4780_nand_controller(chip->controller);
-	struct nand_ecclayout *layout = &nand->ecclayout;
-	u32 start, i;
+	int eccbytes;
 
 	chip->ecc.bytes = fls((1 + 8) * chip->ecc.size)	*
 				(chip->ecc.strength / 8);
@@ -201,23 +198,17 @@ static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *de
 		return 0;
 
 	/* Generate ECC layout. ECC codes are right aligned in the OOB area. */
-	layout->eccbytes = mtd->writesize / chip->ecc.size * chip->ecc.bytes;
+	eccbytes = mtd->writesize / chip->ecc.size * chip->ecc.bytes;
 
-	if (layout->eccbytes > mtd->oobsize - 2) {
+	if (eccbytes > mtd->oobsize - 2) {
 		dev_err(dev,
 			"invalid ECC config: required %d ECC bytes, but only %d are available",
-			layout->eccbytes, mtd->oobsize - 2);
+			eccbytes, mtd->oobsize - 2);
 		return -EINVAL;
 	}
 
-	start = mtd->oobsize - layout->eccbytes;
-	for (i = 0; i < layout->eccbytes; i++)
-		layout->eccpos[i] = start + i;
-
-	layout->oobfree[0].offset = 2;
-	layout->oobfree[0].length = mtd->oobsize - layout->eccbytes - 2;
+	mtd->ooblayout = &nand_ooblayout_lp_ops;
 
-	chip->ecc.layout = layout;
 	return 0;
 }
 
-- 
2.1.4
