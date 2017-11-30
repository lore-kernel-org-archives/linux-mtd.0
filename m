From: RogerCC Lin <rogercc.lin@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xiaolei.li@mediatek.com>,
 <srv_heupstream@mediatek.com>, <bayi.cheng@mediatek.com>,
 <rogercc.lin@mediatek.com>
Subject: [PATCH v2 3/3] mtd: nand: mtk: Support MT7622 NAND flash controller.
Date: Thu, 30 Nov 2017 22:10:45 +0800
Message-ID: <1512051045-24026-4-git-send-email-rogercc.lin@mediatek.com>
In-Reply-To: <1512051045-24026-1-git-send-email-rogercc.lin@mediatek.com>
References: <1512051045-24026-1-git-send-email-rogercc.lin@mediatek.com>
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

From: RogerCC Lin <rogercc.lin@mediatek.com>

Add tables to support MT7622 NAND flash controller.

Signed-off-by: RogerCC Lin <rogercc.lin@mediatek.com>
---
 drivers/mtd/nand/mtk_ecc.c  | 26 ++++++++++++++++++++++++++
 drivers/mtd/nand/mtk_nand.c | 16 ++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
index 6610eef..40d86a8 100644
--- a/drivers/mtd/nand/mtk_ecc.c
+++ b/drivers/mtd/nand/mtk_ecc.c
@@ -83,6 +83,10 @@ struct mtk_ecc {
 	40, 44, 48, 52, 56, 60, 68, 72, 80
 };
 
+static const u8 ecc_strength_mt7622[] = {
+	4, 6, 8, 10, 12, 14, 16
+};
+
 enum mtk_ecc_regs {
 	ECC_ENCPAR00,
 	ECC_ENCIRQ_EN,
@@ -110,6 +114,15 @@ enum mtk_ecc_regs {
 	[ECC_DECIRQ_STA] =      0x204,
 };
 
+static int mt7622_ecc_regs[] = {
+	[ECC_ENCPAR00] =        0x10,
+	[ECC_ENCIRQ_EN] =       0x30,
+	[ECC_ENCIRQ_STA] =      0x34,
+	[ECC_DECDONE] =         0x11c,
+	[ECC_DECIRQ_EN] =       0x140,
+	[ECC_DECIRQ_STA] =      0x144,
+};
+
 static inline void mtk_ecc_wait_idle(struct mtk_ecc *ecc,
 				     enum mtk_ecc_operation op)
 {
@@ -458,6 +471,16 @@ unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc)
 	.pg_irq_sel = 1,
 };
 
+static const struct mtk_ecc_caps mtk_ecc_caps_mt7622 = {
+	.err_mask = 0x3f,
+	.ecc_strength = ecc_strength_mt7622,
+	.ecc_regs = mt7622_ecc_regs,
+	.num_ecc_strength = 7,
+	.ecc_mode_shift = 4,
+	.parity_bits = 13,
+	.pg_irq_sel = 0,
+};
+
 static const struct of_device_id mtk_ecc_dt_match[] = {
 	{
 		.compatible = "mediatek,mt2701-ecc",
@@ -465,6 +488,9 @@ unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc)
 	}, {
 		.compatible = "mediatek,mt2712-ecc",
 		.data = &mtk_ecc_caps_mt2712,
+	}, {
+		.compatible = "mediatek,mt7622-ecc",
+		.data = &mtk_ecc_caps_mt7622,
 	},
 	{},
 };
diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
index 20f4b45..b69681ad 100644
--- a/drivers/mtd/nand/mtk_nand.c
+++ b/drivers/mtd/nand/mtk_nand.c
@@ -174,6 +174,10 @@ struct mtk_nfc {
 	74
 };
 
+static const u8 spare_size_mt7622[] = {
+	16, 26, 27, 28
+};
+
 static inline struct mtk_nfc_nand_chip *to_mtk_nand(struct nand_chip *nand)
 {
 	return container_of(nand, struct mtk_nfc_nand_chip, nand);
@@ -1409,6 +1413,15 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
 	.max_sector_size = 1024,
 };
 
+static const struct mtk_nfc_caps mtk_nfc_caps_mt7622 = {
+	.spare_size = spare_size_mt7622,
+	.num_spare_size = 4,
+	.pageformat_spare_shift = 4,
+	.nfi_clk_div = 1,
+	.max_sector = 8,
+	.max_sector_size = 512,
+};
+
 static const struct of_device_id mtk_nfc_id_table[] = {
 	{
 		.compatible = "mediatek,mt2701-nfc",
@@ -1416,6 +1429,9 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
 	}, {
 		.compatible = "mediatek,mt2712-nfc",
 		.data = &mtk_nfc_caps_mt2712,
+	}, {
+		.compatible = "mediatek,mt7622-nfc",
+		.data = &mtk_nfc_caps_mt7622,
 	},
 	{}
 };
-- 
1.9.1
