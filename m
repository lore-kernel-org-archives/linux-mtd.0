From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>,
 <matthias.bgg@gmail.com>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <robh+dt@kernel.org>,
 <rogercc.lin@mediatek.com>, <yt.shen@mediatek.com>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH v3 3/4] mtd: nand: mediatek: add support for different MTK
 NAND FLASH Controller IP
Date: Mon, 15 May 2017 20:39:38 +0800
Message-ID: <1494851979-14416-4-git-send-email-xiaolei.li@mediatek.com>
In-Reply-To: <1494851979-14416-1-git-send-email-xiaolei.li@mediatek.com>
References: <1494851979-14416-1-git-send-email-xiaolei.li@mediatek.com>
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

ECC strength and spare size supported may be different among MTK NAND
FLASH Controller IPs.

This patch contains changes as following:
(1) add new struct mtk_nfc_caps to support different spare size.
(2) add new struct mtk_ecc_caps to support different ecc strength.
(3) remove ECC_CNFG_xBIT define, use a for loop to do ecc strength config.
(4) remove PAGEFMT_SPARE_ define, use a for loop to do spare format config.
(5) malloc ecc->eccdata buffer according to max ecc strength of this IP.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/mtk_ecc.c  | 181 ++++++++++++++++++--------------------------
 drivers/mtd/nand/mtk_ecc.h  |   2 +-
 drivers/mtd/nand/mtk_nand.c | 175 +++++++++++++++++++++---------------------
 3 files changed, 166 insertions(+), 192 deletions(-)

diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
index dbf2562..ae51303 100644
--- a/drivers/mtd/nand/mtk_ecc.c
+++ b/drivers/mtd/nand/mtk_ecc.c
@@ -33,26 +33,6 @@
 
 #define ECC_ENCCON		(0x00)
 #define ECC_ENCCNFG		(0x04)
-#define		ECC_CNFG_4BIT		(0)
-#define		ECC_CNFG_6BIT		(1)
-#define		ECC_CNFG_8BIT		(2)
-#define		ECC_CNFG_10BIT		(3)
-#define		ECC_CNFG_12BIT		(4)
-#define		ECC_CNFG_14BIT		(5)
-#define		ECC_CNFG_16BIT		(6)
-#define		ECC_CNFG_18BIT		(7)
-#define		ECC_CNFG_20BIT		(8)
-#define		ECC_CNFG_22BIT		(9)
-#define		ECC_CNFG_24BIT		(0xa)
-#define		ECC_CNFG_28BIT		(0xb)
-#define		ECC_CNFG_32BIT		(0xc)
-#define		ECC_CNFG_36BIT		(0xd)
-#define		ECC_CNFG_40BIT		(0xe)
-#define		ECC_CNFG_44BIT		(0xf)
-#define		ECC_CNFG_48BIT		(0x10)
-#define		ECC_CNFG_52BIT		(0x11)
-#define		ECC_CNFG_56BIT		(0x12)
-#define		ECC_CNFG_60BIT		(0x13)
 #define		ECC_MODE_SHIFT		(5)
 #define		ECC_MS_SHIFT		(16)
 #define ECC_ENCDIADDR		(0x08)
@@ -66,7 +46,6 @@
 #define		DEC_CNFG_CORRECT	(0x3 << 12)
 #define ECC_DECIDLE		(0x10C)
 #define ECC_DECENUM0		(0x114)
-#define		ERR_MASK		(0x3f)
 #define ECC_DECDONE		(0x124)
 #define ECC_DECIRQ_EN		(0x200)
 #define ECC_DECIRQ_STA		(0x204)
@@ -78,8 +57,15 @@
 #define ECC_IRQ_REG(op)		((op) == ECC_ENCODE ? \
 					ECC_ENCIRQ_EN : ECC_DECIRQ_EN)
 
+struct mtk_ecc_caps {
+	u32 err_mask;
+	const u8 *ecc_strength;
+	u8 num_ecc_strength;
+};
+
 struct mtk_ecc {
 	struct device *dev;
+	const struct mtk_ecc_caps *caps;
 	void __iomem *regs;
 	struct clk *clk;
 
@@ -87,7 +73,13 @@ struct mtk_ecc {
 	struct mutex lock;
 	u32 sectors;
 
-	u8 eccdata[112];
+	u8 *eccdata;
+};
+
+/* ecc strength that mt2701 supports */
+static const u8 ecc_strength_mt2701[] = {
+	4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36,
+	40, 44, 48, 52, 56, 60
 };
 
 static inline void mtk_ecc_wait_idle(struct mtk_ecc *ecc,
@@ -136,77 +128,24 @@ static irqreturn_t mtk_ecc_irq(int irq, void *id)
 	return IRQ_HANDLED;
 }
 
-static void mtk_ecc_config(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
+static int mtk_ecc_config(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
 {
-	u32 ecc_bit = ECC_CNFG_4BIT, dec_sz, enc_sz;
-	u32 reg;
-
-	switch (config->strength) {
-	case 4:
-		ecc_bit = ECC_CNFG_4BIT;
-		break;
-	case 6:
-		ecc_bit = ECC_CNFG_6BIT;
-		break;
-	case 8:
-		ecc_bit = ECC_CNFG_8BIT;
-		break;
-	case 10:
-		ecc_bit = ECC_CNFG_10BIT;
-		break;
-	case 12:
-		ecc_bit = ECC_CNFG_12BIT;
-		break;
-	case 14:
-		ecc_bit = ECC_CNFG_14BIT;
-		break;
-	case 16:
-		ecc_bit = ECC_CNFG_16BIT;
-		break;
-	case 18:
-		ecc_bit = ECC_CNFG_18BIT;
-		break;
-	case 20:
-		ecc_bit = ECC_CNFG_20BIT;
-		break;
-	case 22:
-		ecc_bit = ECC_CNFG_22BIT;
-		break;
-	case 24:
-		ecc_bit = ECC_CNFG_24BIT;
-		break;
-	case 28:
-		ecc_bit = ECC_CNFG_28BIT;
-		break;
-	case 32:
-		ecc_bit = ECC_CNFG_32BIT;
-		break;
-	case 36:
-		ecc_bit = ECC_CNFG_36BIT;
-		break;
-	case 40:
-		ecc_bit = ECC_CNFG_40BIT;
-		break;
-	case 44:
-		ecc_bit = ECC_CNFG_44BIT;
-		break;
-	case 48:
-		ecc_bit = ECC_CNFG_48BIT;
-		break;
-	case 52:
-		ecc_bit = ECC_CNFG_52BIT;
-		break;
-	case 56:
-		ecc_bit = ECC_CNFG_56BIT;
-		break;
-	case 60:
-		ecc_bit = ECC_CNFG_60BIT;
-		break;
-	default:
-		dev_err(ecc->dev, "invalid strength %d, default to 4 bits\n",
+	u32 ecc_bit, dec_sz, enc_sz;
+	u32 reg, i;
+
+	for (i = 0; i < ecc->caps->num_ecc_strength; i++) {
+		if (ecc->caps->ecc_strength[i] == config->strength)
+			break;
+	}
+
+	if (i == ecc->caps->num_ecc_strength) {
+		dev_err(ecc->dev, "invalid ecc strength %d\n",
 			config->strength);
+		return -EINVAL;
 	}
 
+	ecc_bit = i;
+
 	if (config->op == ECC_ENCODE) {
 		/* configure ECC encoder (in bits) */
 		enc_sz = config->len << 3;
@@ -232,6 +171,8 @@ static void mtk_ecc_config(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
 		if (config->sectors)
 			ecc->sectors = 1 << (config->sectors - 1);
 	}
+
+	return 0;
 }
 
 void mtk_ecc_get_stats(struct mtk_ecc *ecc, struct mtk_ecc_stats *stats,
@@ -247,8 +188,8 @@ void mtk_ecc_get_stats(struct mtk_ecc *ecc, struct mtk_ecc_stats *stats,
 		offset = (i >> 2) << 2;
 		err = readl(ecc->regs + ECC_DECENUM0 + offset);
 		err = err >> ((i % 4) * 8);
-		err &= ERR_MASK;
-		if (err == ERR_MASK) {
+		err &= ecc->caps->err_mask;
+		if (err == ecc->caps->err_mask) {
 			/* uncorrectable errors */
 			stats->failed++;
 			continue;
@@ -322,7 +263,11 @@ int mtk_ecc_enable(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
 	}
 
 	mtk_ecc_wait_idle(ecc, op);
-	mtk_ecc_config(ecc, config);
+
+	ret = mtk_ecc_config(ecc, config);
+	if (ret)
+		return ret;
+
 	writew(ECC_OP_ENABLE, ecc->regs + ECC_CTL_REG(op));
 
 	init_completion(&ecc->done);
@@ -409,37 +354,66 @@ int mtk_ecc_encode(struct mtk_ecc *ecc, struct mtk_ecc_config *config,
 }
 EXPORT_SYMBOL(mtk_ecc_encode);
 
-void mtk_ecc_adjust_strength(u32 *p)
+void mtk_ecc_adjust_strength(struct mtk_ecc *ecc, u32 *p)
 {
-	u32 ecc[] = {4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36,
-			40, 44, 48, 52, 56, 60};
+	const u8 *ecc_strength = ecc->caps->ecc_strength;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(ecc); i++) {
-		if (*p <= ecc[i]) {
+	for (i = 0; i < ecc->caps->num_ecc_strength; i++) {
+		if (*p <= ecc_strength[i]) {
 			if (!i)
-				*p = ecc[i];
-			else if (*p != ecc[i])
-				*p = ecc[i - 1];
+				*p = ecc_strength[i];
+			else if (*p != ecc_strength[i])
+				*p = ecc_strength[i - 1];
 			return;
 		}
 	}
 
-	*p = ecc[ARRAY_SIZE(ecc) - 1];
+	*p = ecc_strength[ecc->caps->num_ecc_strength - 1];
 }
 EXPORT_SYMBOL(mtk_ecc_adjust_strength);
 
+static const struct mtk_ecc_caps mtk_ecc_caps_mt2701 = {
+	.err_mask = 0x3f,
+	.ecc_strength = ecc_strength_mt2701,
+	.num_ecc_strength = 20,
+};
+
+static const struct of_device_id mtk_ecc_dt_match[] = {
+	{
+		.compatible = "mediatek,mt2701-ecc",
+		.data = &mtk_ecc_caps_mt2701,
+	},
+	{},
+};
+
 static int mtk_ecc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_ecc *ecc;
 	struct resource *res;
+	const struct of_device_id *of_ecc_id = NULL;
+	u32 max_eccdata_size;
 	int irq, ret;
 
 	ecc = devm_kzalloc(dev, sizeof(*ecc), GFP_KERNEL);
 	if (!ecc)
 		return -ENOMEM;
 
+	of_ecc_id = of_match_device(mtk_ecc_dt_match, &pdev->dev);
+	if (!of_ecc_id)
+		return -ENODEV;
+
+	ecc->caps = of_ecc_id->data;
+
+	max_eccdata_size = ecc->caps->num_ecc_strength - 1;
+	max_eccdata_size = ecc->caps->ecc_strength[max_eccdata_size];
+	max_eccdata_size = (max_eccdata_size * ECC_PARITY_BITS + 7) >> 3;
+	max_eccdata_size = round_up(max_eccdata_size, 4);
+	ecc->eccdata = devm_kzalloc(dev, max_eccdata_size, GFP_KERNEL);
+	if (!ecc->eccdata)
+		return -ENOMEM;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ecc->regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(ecc->regs)) {
@@ -508,11 +482,6 @@ static int mtk_ecc_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(mtk_ecc_pm_ops, mtk_ecc_suspend, mtk_ecc_resume);
 #endif
 
-static const struct of_device_id mtk_ecc_dt_match[] = {
-	{ .compatible = "mediatek,mt2701-ecc" },
-	{},
-};
-
 MODULE_DEVICE_TABLE(of, mtk_ecc_dt_match);
 
 static struct platform_driver mtk_ecc_driver = {
diff --git a/drivers/mtd/nand/mtk_ecc.h b/drivers/mtd/nand/mtk_ecc.h
index cbeba5c..d245c14 100644
--- a/drivers/mtd/nand/mtk_ecc.h
+++ b/drivers/mtd/nand/mtk_ecc.h
@@ -42,7 +42,7 @@ struct mtk_ecc_config {
 int mtk_ecc_wait_done(struct mtk_ecc *, enum mtk_ecc_operation);
 int mtk_ecc_enable(struct mtk_ecc *, struct mtk_ecc_config *);
 void mtk_ecc_disable(struct mtk_ecc *);
-void mtk_ecc_adjust_strength(u32 *);
+void mtk_ecc_adjust_strength(struct mtk_ecc *ecc, u32 *p);
 
 struct mtk_ecc *of_mtk_ecc_get(struct device_node *);
 void mtk_ecc_release(struct mtk_ecc *);
diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
index c28f4b7..77915da 100644
--- a/drivers/mtd/nand/mtk_nand.c
+++ b/drivers/mtd/nand/mtk_nand.c
@@ -24,6 +24,8 @@
 #include <linux/module.h>
 #include <linux/iopoll.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/sort.h>
 #include "mtk_ecc.h"
 
 /* NAND controller register definition */
@@ -38,23 +40,6 @@
 #define NFI_PAGEFMT		(0x04)
 #define		PAGEFMT_FDM_ECC_SHIFT	(12)
 #define		PAGEFMT_FDM_SHIFT	(8)
-#define		PAGEFMT_SPARE_16	(0)
-#define		PAGEFMT_SPARE_26	(1)
-#define		PAGEFMT_SPARE_27	(2)
-#define		PAGEFMT_SPARE_28	(3)
-#define		PAGEFMT_SPARE_32	(4)
-#define		PAGEFMT_SPARE_36	(5)
-#define		PAGEFMT_SPARE_40	(6)
-#define		PAGEFMT_SPARE_44	(7)
-#define		PAGEFMT_SPARE_48	(8)
-#define		PAGEFMT_SPARE_49	(9)
-#define		PAGEFMT_SPARE_50	(0xa)
-#define		PAGEFMT_SPARE_51	(0xb)
-#define		PAGEFMT_SPARE_52	(0xc)
-#define		PAGEFMT_SPARE_62	(0xd)
-#define		PAGEFMT_SPARE_63	(0xe)
-#define		PAGEFMT_SPARE_64	(0xf)
-#define		PAGEFMT_SPARE_SHIFT	(4)
 #define		PAGEFMT_SEC_SEL_512	BIT(2)
 #define		PAGEFMT_512_2K		(0)
 #define		PAGEFMT_2K_4K		(1)
@@ -116,6 +101,12 @@
 #define MTK_MAX_SECTOR		(16)
 #define MTK_NAND_MAX_NSELS	(2)
 
+struct mtk_nfc_caps {
+	const u8 *spare_size;
+	u8 num_spare_size;
+	u8 pageformat_spare_shift;
+};
+
 struct mtk_nfc_bad_mark_ctl {
 	void (*bm_swap)(struct mtd_info *, u8 *buf, int raw);
 	u32 sec;
@@ -155,6 +146,7 @@ struct mtk_nfc {
 	struct mtk_ecc *ecc;
 
 	struct device *dev;
+	const struct mtk_nfc_caps *caps;
 	void __iomem *regs;
 
 	struct completion done;
@@ -163,6 +155,15 @@ struct mtk_nfc {
 	u8 *buffer;
 };
 
+/*
+ * supported spare size of each IP.
+ * order should be the same with the spare size bitfiled defination of
+ * register NFI_PAGEFMT.
+ */
+static const u8 spare_size_mt2701[] = {
+	16, 26, 27, 28, 32, 36, 40, 44,	48, 49, 50, 51, 52, 62, 63, 64
+};
+
 static inline struct mtk_nfc_nand_chip *to_mtk_nand(struct nand_chip *nand)
 {
 	return container_of(nand, struct mtk_nfc_nand_chip, nand);
@@ -308,7 +309,7 @@ static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
 	struct mtk_nfc *nfc = nand_get_controller_data(chip);
-	u32 fmt, spare;
+	u32 fmt, spare, i;
 
 	if (!mtd->writesize)
 		return 0;
@@ -352,60 +353,18 @@ static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
 	if (chip->ecc.size == 1024)
 		spare >>= 1;
 
-	switch (spare) {
-	case 16:
-		fmt |= (PAGEFMT_SPARE_16 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 26:
-		fmt |= (PAGEFMT_SPARE_26 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 27:
-		fmt |= (PAGEFMT_SPARE_27 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 28:
-		fmt |= (PAGEFMT_SPARE_28 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 32:
-		fmt |= (PAGEFMT_SPARE_32 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 36:
-		fmt |= (PAGEFMT_SPARE_36 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 40:
-		fmt |= (PAGEFMT_SPARE_40 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 44:
-		fmt |= (PAGEFMT_SPARE_44 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 48:
-		fmt |= (PAGEFMT_SPARE_48 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 49:
-		fmt |= (PAGEFMT_SPARE_49 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 50:
-		fmt |= (PAGEFMT_SPARE_50 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 51:
-		fmt |= (PAGEFMT_SPARE_51 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 52:
-		fmt |= (PAGEFMT_SPARE_52 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 62:
-		fmt |= (PAGEFMT_SPARE_62 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 63:
-		fmt |= (PAGEFMT_SPARE_63 << PAGEFMT_SPARE_SHIFT);
-		break;
-	case 64:
-		fmt |= (PAGEFMT_SPARE_64 << PAGEFMT_SPARE_SHIFT);
-		break;
-	default:
-		dev_err(nfc->dev, "invalid spare per sector %d\n", spare);
+	for (i = 0; i < nfc->caps->num_spare_size; i++) {
+		if (nfc->caps->spare_size[i] == spare)
+			break;
+	}
+
+	if (i == nfc->caps->num_spare_size) {
+		dev_err(nfc->dev, "invalid spare size %d\n", spare);
 		return -EINVAL;
 	}
 
+	fmt |= i << nfc->caps->pageformat_spare_shift;
+
 	fmt |= mtk_nand->fdm.reg_size << PAGEFMT_FDM_SHIFT;
 	fmt |= mtk_nand->fdm.ecc_size << PAGEFMT_FDM_ECC_SHIFT;
 	nfi_writel(nfc, fmt, NFI_PAGEFMT);
@@ -1131,20 +1090,38 @@ static void mtk_nfc_set_bad_mark_ctl(struct mtk_nfc_bad_mark_ctl *bm_ctl,
 	}
 }
 
-static void mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
+static int cmp_map(const void *m0, const void *m1)
+{
+	return *(u8 *)m0 > *(u8 *)m1 ? 1 : -1;
+}
+
+static int mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
 {
 	struct nand_chip *nand = mtd_to_nand(mtd);
-	u32 spare[] = {16, 26, 27, 28, 32, 36, 40, 44,
-			48, 49, 50, 51, 52, 62, 63, 64};
+	struct mtk_nfc *nfc = nand_get_controller_data(nand);
+	u8 *spare;
 	u32 eccsteps, i;
 
+	spare = vmalloc(nfc->caps->num_spare_size);
+	if (!spare)
+		return -ENOMEM;
+
+	memcpy(spare, nfc->caps->spare_size, nfc->caps->num_spare_size);
+
+	/*
+	 * Spare size array of some IP may be not sorted, because the spare
+	 * size does not always increase as the spare size bitfiled value of
+	 * register NFI_PAGEFMT. So, sort it here.
+	 */
+	sort(spare, nfc->caps->num_spare_size, sizeof(u8), cmp_map, NULL);
+
 	eccsteps = mtd->writesize / nand->ecc.size;
 	*sps = mtd->oobsize / eccsteps;
 
 	if (nand->ecc.size == 1024)
 		*sps >>= 1;
 
-	for (i = 0; i < ARRAY_SIZE(spare); i++) {
+	for (i = 0; i < nfc->caps->num_spare_size; i++) {
 		if (*sps <= spare[i]) {
 			if (!i)
 				*sps = spare[i];
@@ -1154,18 +1131,23 @@ static void mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
 		}
 	}
 
-	if (i >= ARRAY_SIZE(spare))
-		*sps = spare[ARRAY_SIZE(spare) - 1];
+	if (i == nfc->caps->num_spare_size)
+		*sps = spare[nfc->caps->num_spare_size - 1];
 
 	if (nand->ecc.size == 1024)
 		*sps <<= 1;
+
+	vfree(spare);
+
+	return 0;
 }
 
 static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
 {
 	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct mtk_nfc *nfc = nand_get_controller_data(nand);
 	u32 spare;
-	int free;
+	int free, ret;
 
 	/* support only ecc hw mode */
 	if (nand->ecc.mode != NAND_ECC_HW) {
@@ -1194,7 +1176,9 @@ static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
 			nand->ecc.size = 1024;
 		}
 
-		mtk_nfc_set_spare_per_sector(&spare, mtd);
+		ret = mtk_nfc_set_spare_per_sector(&spare, mtd);
+		if (ret)
+			return ret;
 
 		/* calculate oob bytes except ecc parity data */
 		free = ((nand->ecc.strength * ECC_PARITY_BITS) + 7) >> 3;
@@ -1214,7 +1198,7 @@ static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
 		}
 	}
 
-	mtk_ecc_adjust_strength(&nand->ecc.strength);
+	mtk_ecc_adjust_strength(nfc->ecc, &nand->ecc.strength);
 
 	dev_info(dev, "eccsize %d eccstrength %d\n",
 		 nand->ecc.size, nand->ecc.strength);
@@ -1312,7 +1296,10 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	mtk_nfc_set_spare_per_sector(&chip->spare_per_sector, mtd);
+	ret = mtk_nfc_set_spare_per_sector(&chip->spare_per_sector, mtd);
+	if (ret)
+		return ret;
+
 	mtk_nfc_set_fdm(&chip->fdm, mtd);
 	mtk_nfc_set_bad_mark_ctl(&chip->bad_mark, mtd);
 
@@ -1354,12 +1341,28 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
 	return 0;
 }
 
+static const struct mtk_nfc_caps mtk_nfc_caps_mt2701 = {
+	.spare_size = spare_size_mt2701,
+	.num_spare_size = 16,
+	.pageformat_spare_shift = 4,
+};
+
+static const struct of_device_id mtk_nfc_id_table[] = {
+	{
+		.compatible = "mediatek,mt2701-nfc",
+		.data = &mtk_nfc_caps_mt2701,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mtk_nfc_id_table);
+
 static int mtk_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct mtk_nfc *nfc;
 	struct resource *res;
+	const struct of_device_id *of_nfc_id = NULL;
 	int ret, irq;
 
 	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
@@ -1423,6 +1426,14 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
+	of_nfc_id = of_match_device(mtk_nfc_id_table, &pdev->dev);
+	if (!of_nfc_id) {
+		ret = -ENODEV;
+		goto clk_disable;
+	}
+
+	nfc->caps = of_nfc_id->data;
+
 	platform_set_drvdata(pdev, nfc);
 
 	ret = mtk_nfc_nand_chips_init(dev, nfc);
@@ -1503,12 +1514,6 @@ static int mtk_nfc_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(mtk_nfc_pm_ops, mtk_nfc_suspend, mtk_nfc_resume);
 #endif
 
-static const struct of_device_id mtk_nfc_id_table[] = {
-	{ .compatible = "mediatek,mt2701-nfc" },
-	{}
-};
-MODULE_DEVICE_TABLE(of, mtk_nfc_id_table);
-
 static struct platform_driver mtk_nfc_driver = {
 	.probe  = mtk_nfc_probe,
 	.remove = mtk_nfc_remove,
-- 
1.9.1
