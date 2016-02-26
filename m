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
Subject: [PATCH v3 50/52] staging: mt29f_spinand: switch to mtd_ooblayout_ops
Date: Fri, 26 Feb 2016 01:57:58 +0100
Message-Id: <1456448280-27788-51-git-send-email-boris.brezillon@free-electrons.com>
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

Replace the nand_ecclayout definition by the equivalent mtd_ooblayout_ops
definition.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 48 +++++++++++++++++----------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index 6728376..b9f9347 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -42,23 +42,33 @@ static inline struct spinand_state *mtd_to_state(struct mtd_info *mtd)
 static int enable_hw_ecc;
 static int enable_read_hw_ecc;
 
-static struct nand_ecclayout spinand_oob_64 = {
-	.eccbytes = 24,
-	.eccpos = {
-		1, 2, 3, 4, 5, 6,
-		17, 18, 19, 20, 21, 22,
-		33, 34, 35, 36, 37, 38,
-		49, 50, 51, 52, 53, 54, },
-	.oobfree = {
-		{.offset = 8,
-			.length = 8},
-		{.offset = 24,
-			.length = 8},
-		{.offset = 40,
-			.length = 8},
-		{.offset = 56,
-			.length = 8},
-	}
+static int spinand_ooblayout_64_ecc(struct mtd_info *mtd, int section,
+				    struct mtd_oob_region *oobregion)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	oobregion->offset = (section * 16) + 1;
+	oobregion->length = 6;
+
+	return 0;
+}
+
+static int spinand_ooblayout_64_free(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *oobregion)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	oobregion->offset = (section * 16) + 8;
+	oobregion->length = 8;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops spinand_oob_64_ops = {
+	.ecc = spinand_ooblayout_64_ecc,
+	.free = spinand_ooblayout_64_free,
 };
 #endif
 
@@ -883,7 +893,6 @@ static int spinand_probe(struct spi_device *spi_nand)
 
 	chip->ecc.strength = 1;
 	chip->ecc.total	= chip->ecc.steps * chip->ecc.bytes;
-	chip->ecc.layout = &spinand_oob_64;
 	chip->ecc.read_page = spinand_read_page_hwecc;
 	chip->ecc.write_page = spinand_write_page_hwecc;
 #else
@@ -908,6 +917,9 @@ static int spinand_probe(struct spi_device *spi_nand)
 
 	mtd->dev.parent = &spi_nand->dev;
 	mtd->oobsize = 64;
+#ifdef CONFIG_MTD_SPINAND_ONDIEECC
+	mtd_set_ooblayout(mtd, &spinand_oob_64_ops);
+#endif
 
 	if (nand_scan(mtd, 1))
 		return -ENXIO;
-- 
2.1.4
