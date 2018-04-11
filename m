From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH 7/8] mtd: rawnand: mtk: Introduce mtk_ecc_get_strength_num(),
 mtk_ecc_get_strength()
Date: Wed, 11 Apr 2018 11:41:57 +0800
Message-ID: <1523418118-57686-8-git-send-email-xiaolei.li@mediatek.com>
In-Reply-To: <1523418118-57686-1-git-send-email-xiaolei.li@mediatek.com>
References: <1523418118-57686-1-git-send-email-xiaolei.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Introduce mtk_ecc_get_strength_num(), mtk_ecc_get_strength() functions,
and prepare to support struct nand_ecc_caps.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/raw/mtk_ecc.c | 24 ++++++++++++++++++------
 drivers/mtd/nand/raw/mtk_ecc.h |  2 ++
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/raw/mtk_ecc.c
index 717d553..71390e7 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.c
+++ b/drivers/mtd/nand/raw/mtk_ecc.c
@@ -51,9 +51,9 @@
 
 struct mtk_ecc_caps {
 	u32 err_mask;
-	const u8 *ecc_strength;
+	const int *ecc_strength;
 	const u32 *ecc_regs;
-	u8 num_ecc_strength;
+	int num_ecc_strength;
 	u8 ecc_mode_shift;
 	u32 parity_bits;
 	int pg_irq_sel;
@@ -73,17 +73,17 @@ struct mtk_ecc {
 };
 
 /* ecc strength that each IP supports */
-static const u8 ecc_strength_mt2701[] = {
+static const int ecc_strength_mt2701[] = {
 	4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36,
 	40, 44, 48, 52, 56, 60
 };
 
-static const u8 ecc_strength_mt2712[] = {
+static const int ecc_strength_mt2712[] = {
 	4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36,
 	40, 44, 48, 52, 56, 60, 68, 72, 80
 };
 
-static const u8 ecc_strength_mt7622[] = {
+static const int ecc_strength_mt7622[] = {
 	4, 6, 8, 10, 12, 14, 16
 };
 
@@ -428,7 +428,7 @@ int mtk_ecc_encode(struct mtk_ecc *ecc, struct mtk_ecc_config *config,
 
 void mtk_ecc_adjust_strength(struct mtk_ecc *ecc, u32 *p)
 {
-	const u8 *ecc_strength = ecc->caps->ecc_strength;
+	const int *ecc_strength = ecc->caps->ecc_strength;
 	int i;
 
 	for (i = 0; i < ecc->caps->num_ecc_strength; i++) {
@@ -451,6 +451,18 @@ unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc)
 }
 EXPORT_SYMBOL(mtk_ecc_get_parity_bits);
 
+int mtk_ecc_get_strength_num(struct mtk_ecc *ecc)
+{
+	return ecc->caps->num_ecc_strength;
+}
+EXPORT_SYMBOL(mtk_ecc_get_strength_num);
+
+const int *mtk_ecc_get_strength(struct mtk_ecc *ecc)
+{
+	return ecc->caps->ecc_strength;
+}
+EXPORT_SYMBOL(mtk_ecc_get_strength);
+
 int mtk_ecc_calc_parity_bytes(struct mtk_ecc *ecc, int ecc_strength)
 {
 	return DIV_ROUND_UP(ecc->caps->parity_bits * ecc_strength, 8);
diff --git a/drivers/mtd/nand/raw/mtk_ecc.h b/drivers/mtd/nand/raw/mtk_ecc.h
index c1546f9..5687864 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.h
+++ b/drivers/mtd/nand/raw/mtk_ecc.h
@@ -42,6 +42,8 @@ struct mtk_ecc_config {
 void mtk_ecc_disable(struct mtk_ecc *);
 void mtk_ecc_adjust_strength(struct mtk_ecc *ecc, u32 *p);
 unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc);
+int mtk_ecc_get_strength_num(struct mtk_ecc *ecc);
+const int *mtk_ecc_get_strength(struct mtk_ecc *ecc);
 int mtk_ecc_calc_parity_bytes(struct mtk_ecc *ecc, int ecc_strength);
 
 struct mtk_ecc *of_mtk_ecc_get(struct device_node *);
-- 
1.9.1
