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
Subject: [PATCH v5 25/50] mtd: nand: cafe: switch to mtd_ooblayout_ops
Date: Wed, 30 Mar 2016 18:14:40 +0200
Message-Id: <1459354505-32551-26-git-send-email-boris.brezillon@free-electrons.com>
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
 drivers/mtd/nand/cafe_nand.c | 44 ++++++++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index e553aff..0b0c937 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -459,10 +459,37 @@ static int cafe_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	return max_bitflips;
 }
 
-static struct nand_ecclayout cafe_oobinfo_2048 = {
-	.eccbytes = 14,
-	.eccpos = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
-	.oobfree = {{14, 50}}
+static int cafe_ooblayout_ecc(struct mtd_info *mtd, int section,
+			      struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = 0;
+	oobregion->length = chip->ecc.total;
+
+	return 0;
+}
+
+static int cafe_ooblayout_free(struct mtd_info *mtd, int section,
+			       struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = chip->ecc.total;
+	oobregion->length = mtd->oobsize - chip->ecc.total;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops cafe_ooblayout_ops = {
+	.ecc = cafe_ooblayout_ecc,
+	.free = cafe_ooblayout_free,
 };
 
 /* Ick. The BBT code really ought to be able to work this bit out
@@ -494,12 +521,6 @@ static struct nand_bbt_descr cafe_bbt_mirror_descr_2048 = {
 	.pattern = cafe_mirror_pattern_2048
 };
 
-static struct nand_ecclayout cafe_oobinfo_512 = {
-	.eccbytes = 14,
-	.eccpos = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
-	.oobfree = {{14, 2}}
-};
-
 static struct nand_bbt_descr cafe_bbt_main_descr_512 = {
 	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
 		| NAND_BBT_2BIT | NAND_BBT_VERSION,
@@ -743,12 +764,11 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		cafe->ctl2 |= 1<<29; /* 2KiB page size */
 
 	/* Set up ECC according to the type of chip we found */
+	mtd_set_ooblayout(mtd, &cafe_ooblayout_ops);
 	if (mtd->writesize == 2048) {
-		cafe->nand.ecc.layout = &cafe_oobinfo_2048;
 		cafe->nand.bbt_td = &cafe_bbt_main_descr_2048;
 		cafe->nand.bbt_md = &cafe_bbt_mirror_descr_2048;
 	} else if (mtd->writesize == 512) {
-		cafe->nand.ecc.layout = &cafe_oobinfo_512;
 		cafe->nand.bbt_td = &cafe_bbt_main_descr_512;
 		cafe->nand.bbt_md = &cafe_bbt_mirror_descr_512;
 	} else {
-- 
2.5.0
