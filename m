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
Subject: [PATCH v3 32/52] mtd: nand: docg4: switch to mtd_ooblayout_ops
Date: Fri, 26 Feb 2016 01:57:40 +0100
Message-Id: <1456448280-27788-33-git-send-email-boris.brezillon@free-electrons.com>
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
 drivers/mtd/nand/docg4.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index fb46fd7..f5ca9a5 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -222,10 +222,33 @@ struct docg4_priv {
  * Bytes 8 - 14 are hw-generated ecc covering entire page + oob bytes 0 - 14.
  * Byte 15 (the last) is used by the driver as a "page written" flag.
  */
-static struct nand_ecclayout docg4_oobinfo = {
-	.eccbytes = 9,
-	.eccpos = {7, 8, 9, 10, 11, 12, 13, 14, 15},
-	.oobfree = { {.offset = 2, .length = 5} }
+static int docg4_ooblayout_ecc(struct mtd_info *mtd, int section,
+			       struct mtd_oob_region *oobregion)
+{
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = 7;
+	oobregion->length = 9;
+
+	return 0;
+}
+
+static int docg4_ooblayout_free(struct mtd_info *mtd, int section,
+				struct mtd_oob_region *oobregion)
+{
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = 2;
+	oobregion->length = 5;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops docg4_ooblayout_ops = {
+	.ecc = docg4_ooblayout_ecc,
+	.free = docg4_ooblayout_free,
 };
 
 /*
@@ -1209,6 +1232,7 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
 	mtd->writesize = DOCG4_PAGE_SIZE;
 	mtd->erasesize = DOCG4_BLOCK_SIZE;
 	mtd->oobsize = DOCG4_OOB_SIZE;
+	mtd_set_ooblayout(mtd, &docg4_ooblayout_ops);
 	nand->chipsize = DOCG4_CHIP_SIZE;
 	nand->chip_shift = DOCG4_CHIP_SHIFT;
 	nand->bbt_erase_shift = nand->phys_erase_shift = DOCG4_ERASE_SHIFT;
@@ -1217,7 +1241,6 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
 	nand->pagemask = 0x3ffff;
 	nand->badblockpos = NAND_LARGE_BADBLOCK_POS;
 	nand->badblockbits = 8;
-	nand->ecc.layout = &docg4_oobinfo;
 	nand->ecc.mode = NAND_ECC_HW_SYNDROME;
 	nand->ecc.size = DOCG4_PAGE_SIZE;
 	nand->ecc.prepad = 8;
-- 
2.1.4
