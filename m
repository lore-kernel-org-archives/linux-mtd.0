From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
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
 Harvey Hunt <harvey.hunt@imgtec.com>,
 Archit Taneja <architt@codeaurora.org>, Han Xu <b45815@freescale.com>,
 Huang Shijie <shijie.huang@arm.com>
Subject: [PATCH v5 37/50] mtd: nand: lpc32xx: switch to mtd_ooblayout_ops
Date: Wed, 30 Mar 2016 18:14:52 +0200
Message-Id: <1459354505-32551-38-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459354505-32551-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459354505-32551-1-git-send-email-boris.brezillon@free-electrons.com>
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
 drivers/mtd/nand/lpc32xx_mlc.c | 50 ++++++++++++++++++++++++++++--------------
 drivers/mtd/nand/lpc32xx_slc.c | 41 +++++++++++++++++++++++++++-------
 2 files changed, 66 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index d8c3e7a..f668282 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -139,22 +139,37 @@ struct lpc32xx_nand_cfg_mlc {
 	unsigned num_parts;
 };
 
-static struct nand_ecclayout lpc32xx_nand_oob = {
-	.eccbytes = 40,
-	.eccpos = { 6,  7,  8,  9, 10, 11, 12, 13, 14, 15,
-		   22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
-		   38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
-		   54, 55, 56, 57, 58, 59, 60, 61, 62, 63 },
-	.oobfree = {
-		{ .offset = 0,
-		  .length = 6, },
-		{ .offset = 16,
-		  .length = 6, },
-		{ .offset = 32,
-		  .length = 6, },
-		{ .offset = 48,
-		  .length = 6, },
-		},
+static int lpc32xx_ooblayout_ecc(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+
+	if (section >= nand_chip->ecc.steps)
+		return -ERANGE;
+
+	oobregion->offset = ((section + 1) * 16) - nand_chip->ecc.bytes;
+	oobregion->length = nand_chip->ecc.bytes;
+
+	return 0;
+}
+
+static int lpc32xx_ooblayout_free(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+
+	if (section >= nand_chip->ecc.steps)
+		return -ERANGE;
+
+	oobregion->offset = 16 * section;
+	oobregion->length = 16 - nand_chip->ecc.bytes;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops lpc32xx_ooblayout_ops = {
+	.ecc = lpc32xx_ooblayout_ecc,
+	.free = lpc32xx_ooblayout_free,
 };
 
 static struct nand_bbt_descr lpc32xx_nand_bbt = {
@@ -713,6 +728,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	nand_chip->ecc.write_oob = lpc32xx_write_oob;
 	nand_chip->ecc.read_oob = lpc32xx_read_oob;
 	nand_chip->ecc.strength = 4;
+	nand_chip->ecc.bytes = 10;
 	nand_chip->waitfunc = lpc32xx_waitfunc;
 
 	nand_chip->options = NAND_NO_SUBPAGE_WRITE;
@@ -751,7 +767,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	nand_chip->ecc.mode = NAND_ECC_HW;
 	nand_chip->ecc.size = 512;
-	nand_chip->ecc.layout = &lpc32xx_nand_oob;
+	mtd_set_ooblayout(mtd, &lpc32xx_ooblayout_ops);
 	host->mlcsubpages = mtd->writesize / 512;
 
 	/* initially clear interrupt status */
diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index 10cf8e62..219dd67 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -146,13 +146,38 @@
  * NAND ECC Layout for small page NAND devices
  * Note: For large and huge page devices, the default layouts are used
  */
-static struct nand_ecclayout lpc32xx_nand_oob_16 = {
-	.eccbytes = 6,
-	.eccpos = {10, 11, 12, 13, 14, 15},
-	.oobfree = {
-		{ .offset = 0, .length = 4 },
-		{ .offset = 6, .length = 4 },
-	},
+static int lpc32xx_ooblayout_ecc(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oobregion)
+{
+	if (section)
+		return -ERANGE;
+
+	oobregion->length = 6;
+	oobregion->offset = 10;
+
+	return 0;
+}
+
+static int lpc32xx_ooblayout_free(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oobregion)
+{
+	if (section > 1)
+		return -ERANGE;
+
+	if (!section) {
+		oobregion->offset = 0;
+		oobregion->length = 4;
+	} else {
+		oobregion->offset = 6;
+		oobregion->length = 4;
+	}
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops lpc32xx_ooblayout_ops = {
+	.ecc = lpc32xx_ooblayout_ecc,
+	.free = lpc32xx_ooblayout_free,
 };
 
 static u8 bbt_pattern[] = {'B', 'b', 't', '0' };
@@ -886,7 +911,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	 * custom BBT marker layout.
 	 */
 	if (mtd->writesize <= 512)
-		chip->ecc.layout = &lpc32xx_nand_oob_16;
+		mtd_set_ooblayout(mtd, &lpc32xx_ooblayout_ops);
 
 	/* These sizes remain the same regardless of page size */
 	chip->ecc.size = 256;
-- 
2.5.0
