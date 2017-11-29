From: RogerCC Lin <rogercc.lin@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xiaolei.li@mediatek.com>,
 <srv_heupstream@mediatek.com>, <bayi.cheng@mediatek.com>,
 <rogercc.lin@mediatek.com>
Subject: [PATCH 2/3] mtd: nand: mtk: Support different MTK NAND flash
 controller IP
Date: Wed, 29 Nov 2017 17:24:45 +0800
Message-ID: <1511947486-7707-3-git-send-email-rogercc.lin@mediatek.com>
In-Reply-To: <1511947486-7707-1-git-send-email-rogercc.lin@mediatek.com>
References: <1511947486-7707-1-git-send-email-rogercc.lin@mediatek.com>
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

MT7622 uses an MTK's earlier NAND flash controller IP which support
different sector size, max spare size per sector and paraity bits...,
some register's offset and definition also been changed in the NAND
flash controller, this patch is the preparation to support MT7622
NAND flash controller.

MT7622 NFC and ECC engine are similar to MT2701's, except below
differences:
(1)MT7622 NFC's max sector size(ECC data size) is 512 bytes, and
   MT2701's is 1024, and MT7622's max sector number is 8.
(2)The parity bit of MT7622 is 13, MT2701 is 14.
(3)MT7622 ECC supports less ECC strength, max to 16 bit ecc strength.
(4)MT7622 supports less spare size per sector(512 bytes), max size is
   28 bytes per sector.
(5)Some register's offset are different, include ECC_ENCIRQ_EN,
   ECC_ENCIRQ_STA, ECC_DECDONE, ECC_DECIRQ_EN and ECC_DECIRQ_STA.
(6)ENC_MODE of ECC_ENCCNFG register is moved from bit 5-6 to bit 4-5.

Signed-off-by: RogerCC Lin <rogercc.lin@mediatek.com>
---
 drivers/mtd/nand/mtk_ecc.c  | 111 ++++++++++++++++++++++++--------------------
 drivers/mtd/nand/mtk_ecc.h  |  25 +++++++++-
 drivers/mtd/nand/mtk_nand.c |  27 +++++++----
 3 files changed, 102 insertions(+), 61 deletions(-)

diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
index c51d214..fa1843e 100644
--- a/drivers/mtd/nand/mtk_ecc.c
+++ b/drivers/mtd/nand/mtk_ecc.c
@@ -34,49 +34,20 @@
 
 #define ECC_ENCCON		(0x00)
 #define ECC_ENCCNFG		(0x04)
-#define		ECC_MODE_SHIFT		(5)
 #define		ECC_MS_SHIFT		(16)
 #define ECC_ENCDIADDR		(0x08)
 #define ECC_ENCIDLE		(0x0C)
-#define ECC_ENCIRQ_EN		(0x80)
-#define ECC_ENCIRQ_STA		(0x84)
 #define ECC_DECCON		(0x100)
 #define ECC_DECCNFG		(0x104)
 #define		DEC_EMPTY_EN		BIT(31)
 #define		DEC_CNFG_CORRECT	(0x3 << 12)
 #define ECC_DECIDLE		(0x10C)
 #define ECC_DECENUM0		(0x114)
-#define ECC_DECDONE		(0x124)
-#define ECC_DECIRQ_EN		(0x200)
-#define ECC_DECIRQ_STA		(0x204)
 
 #define ECC_TIMEOUT		(500000)
 
 #define ECC_IDLE_REG(op)	((op) == ECC_ENCODE ? ECC_ENCIDLE : ECC_DECIDLE)
 #define ECC_CTL_REG(op)		((op) == ECC_ENCODE ? ECC_ENCCON : ECC_DECCON)
-#define ECC_IRQ_REG(op)		((op) == ECC_ENCODE ? \
-					ECC_ENCIRQ_EN : ECC_DECIRQ_EN)
-
-struct mtk_ecc_caps {
-	u32 err_mask;
-	const u8 *ecc_strength;
-	u8 num_ecc_strength;
-	u32 encode_parity_reg0;
-	int pg_irq_sel;
-};
-
-struct mtk_ecc {
-	struct device *dev;
-	const struct mtk_ecc_caps *caps;
-	void __iomem *regs;
-	struct clk *clk;
-
-	struct completion done;
-	struct mutex lock;
-	u32 sectors;
-
-	u8 *eccdata;
-};
 
 /* ecc strength that each IP supports */
 static const u8 ecc_strength_mt2701[] = {
@@ -89,6 +60,33 @@ struct mtk_ecc {
 	40, 44, 48, 52, 56, 60, 68, 72, 80
 };
 
+enum mtk_ecc_regs {
+	ECC_ENCPAR00,
+	ECC_ENCIRQ_EN,
+	ECC_ENCIRQ_STA,
+	ECC_DECDONE,
+	ECC_DECIRQ_EN,
+	ECC_DECIRQ_STA,
+};
+
+static int mt2701_ecc_regs[] = {
+	[ECC_ENCPAR00] =        0x10,
+	[ECC_ENCIRQ_EN] =       0x80,
+	[ECC_ENCIRQ_STA] =      0x84,
+	[ECC_DECDONE] =         0x124,
+	[ECC_DECIRQ_EN] =       0x200,
+	[ECC_DECIRQ_STA] =      0x204,
+};
+
+static int mt2712_ecc_regs[] = {
+	[ECC_ENCPAR00] =        0x300,
+	[ECC_ENCIRQ_EN] =       0x80,
+	[ECC_ENCIRQ_STA] =      0x84,
+	[ECC_DECDONE] =         0x124,
+	[ECC_DECIRQ_EN] =       0x200,
+	[ECC_DECIRQ_STA] =      0x204,
+};
+
 static inline void mtk_ecc_wait_idle(struct mtk_ecc *ecc,
 				     enum mtk_ecc_operation op)
 {
@@ -107,32 +105,30 @@ static inline void mtk_ecc_wait_idle(struct mtk_ecc *ecc,
 static irqreturn_t mtk_ecc_irq(int irq, void *id)
 {
 	struct mtk_ecc *ecc = id;
-	enum mtk_ecc_operation op;
 	u32 dec, enc;
 
-	dec = readw(ecc->regs + ECC_DECIRQ_STA) & ECC_IRQ_EN;
+	dec = readw(ecc->regs + ecc->caps->ecc_regs[ECC_DECIRQ_STA])
+		    & ECC_IRQ_EN;
 	if (dec) {
-		op = ECC_DECODE;
-		dec = readw(ecc->regs + ECC_DECDONE);
+		dec = readw(ecc->regs + ecc->caps->ecc_regs[ECC_DECDONE]);
 		if (dec & ecc->sectors) {
 			/*
 			 * Clear decode IRQ status once again to ensure that
 			 * there will be no extra IRQ.
 			 */
-			readw(ecc->regs + ECC_DECIRQ_STA);
+			readw(ecc->regs + ecc->caps->ecc_regs[ECC_DECIRQ_STA]);
 			ecc->sectors = 0;
 			complete(&ecc->done);
 		} else {
 			return IRQ_HANDLED;
 		}
 	} else {
-		enc = readl(ecc->regs + ECC_ENCIRQ_STA) & ECC_IRQ_EN;
-		if (enc) {
-			op = ECC_ENCODE;
+		enc = readl(ecc->regs + ecc->caps->ecc_regs[ECC_ENCIRQ_STA])
+		      & ECC_IRQ_EN;
+		if (enc)
 			complete(&ecc->done);
-		} else {
+		else
 			return IRQ_NONE;
-		}
 	}
 
 	return IRQ_HANDLED;
@@ -160,7 +156,7 @@ static int mtk_ecc_config(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
 		/* configure ECC encoder (in bits) */
 		enc_sz = config->len << 3;
 
-		reg = ecc_bit | (config->mode << ECC_MODE_SHIFT);
+		reg = ecc_bit | (config->mode << ecc->caps->ecc_mode_shift);
 		reg |= (enc_sz << ECC_MS_SHIFT);
 		writel(reg, ecc->regs + ECC_ENCCNFG);
 
@@ -171,9 +167,9 @@ static int mtk_ecc_config(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
 	} else {
 		/* configure ECC decoder (in bits) */
 		dec_sz = (config->len << 3) +
-					config->strength * ECC_PARITY_BITS;
+			 config->strength * ecc->caps->parity_bits;
 
-		reg = ecc_bit | (config->mode << ECC_MODE_SHIFT);
+		reg = ecc_bit | (config->mode << ecc->caps->ecc_mode_shift);
 		reg |= (dec_sz << ECC_MS_SHIFT) | DEC_CNFG_CORRECT;
 		reg |= DEC_EMPTY_EN;
 		writel(reg, ecc->regs + ECC_DECCNFG);
@@ -291,7 +287,12 @@ int mtk_ecc_enable(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
 		 */
 		if (ecc->caps->pg_irq_sel && config->mode == ECC_NFI_MODE)
 			reg_val |= ECC_PG_IRQ_SEL;
-		writew(reg_val, ecc->regs + ECC_IRQ_REG(op));
+		if (op == ECC_ENCODE)
+			writew(reg_val, ecc->regs +
+			       ecc->caps->ecc_regs[ECC_ENCIRQ_EN]);
+		else
+			writew(reg_val, ecc->regs +
+			       ecc->caps->ecc_regs[ECC_DECIRQ_EN]);
 	}
 
 	writew(ECC_OP_ENABLE, ecc->regs + ECC_CTL_REG(op));
@@ -310,13 +311,17 @@ void mtk_ecc_disable(struct mtk_ecc *ecc)
 
 	/* disable it */
 	mtk_ecc_wait_idle(ecc, op);
-	if (op == ECC_DECODE)
+	if (op == ECC_DECODE) {
 		/*
 		 * Clear decode IRQ status in case there is a timeout to wait
 		 * decode IRQ.
 		 */
-		readw(ecc->regs + ECC_DECIRQ_STA);
-	writew(0, ecc->regs + ECC_IRQ_REG(op));
+		readw(ecc->regs + ecc->caps->ecc_regs[ECC_DECDONE]);
+		writew(0, ecc->regs + ecc->caps->ecc_regs[ECC_DECIRQ_EN]);
+	} else {
+		writew(0, ecc->regs + ecc->caps->ecc_regs[ECC_ENCIRQ_EN]);
+	}
+
 	writew(ECC_OP_DISABLE, ecc->regs + ECC_CTL_REG(op));
 
 	mutex_unlock(&ecc->lock);
@@ -367,11 +372,11 @@ int mtk_ecc_encode(struct mtk_ecc *ecc, struct mtk_ecc_config *config,
 	mtk_ecc_wait_idle(ecc, ECC_ENCODE);
 
 	/* Program ECC bytes to OOB: per sector oob = FDM + ECC + SPARE */
-	len = (config->strength * ECC_PARITY_BITS + 7) >> 3;
+	len = (config->strength * ecc->caps->parity_bits + 7) >> 3;
 
 	/* write the parity bytes generated by the ECC back to temp buffer */
 	__ioread32_copy(ecc->eccdata,
-			ecc->regs + ecc->caps->encode_parity_reg0,
+			ecc->regs + ecc->caps->ecc_regs[ECC_ENCPAR00],
 			round_up(len, 4));
 
 	/* copy into possibly unaligned OOB region with actual length */
@@ -407,16 +412,20 @@ void mtk_ecc_adjust_strength(struct mtk_ecc *ecc, u32 *p)
 static const struct mtk_ecc_caps mtk_ecc_caps_mt2701 = {
 	.err_mask = 0x3f,
 	.ecc_strength = ecc_strength_mt2701,
+	.ecc_regs = mt2701_ecc_regs,
 	.num_ecc_strength = 20,
-	.encode_parity_reg0 = 0x10,
+	.ecc_mode_shift = 5,
+	.parity_bits = 14,
 	.pg_irq_sel = 0,
 };
 
 static const struct mtk_ecc_caps mtk_ecc_caps_mt2712 = {
 	.err_mask = 0x7f,
 	.ecc_strength = ecc_strength_mt2712,
+	.ecc_regs = mt2712_ecc_regs,
 	.num_ecc_strength = 23,
-	.encode_parity_reg0 = 0x300,
+	.ecc_mode_shift = 5,
+	.parity_bits = 14,
 	.pg_irq_sel = 1,
 };
 
@@ -452,7 +461,7 @@ static int mtk_ecc_probe(struct platform_device *pdev)
 
 	max_eccdata_size = ecc->caps->num_ecc_strength - 1;
 	max_eccdata_size = ecc->caps->ecc_strength[max_eccdata_size];
-	max_eccdata_size = (max_eccdata_size * ECC_PARITY_BITS + 7) >> 3;
+	max_eccdata_size = (max_eccdata_size * ecc->caps->parity_bits + 7) >> 3;
 	max_eccdata_size = round_up(max_eccdata_size, 4);
 	ecc->eccdata = devm_kzalloc(dev, max_eccdata_size, GFP_KERNEL);
 	if (!ecc->eccdata)
diff --git a/drivers/mtd/nand/mtk_ecc.h b/drivers/mtd/nand/mtk_ecc.h
index d245c14..764adb6 100644
--- a/drivers/mtd/nand/mtk_ecc.h
+++ b/drivers/mtd/nand/mtk_ecc.h
@@ -14,8 +14,6 @@
 
 #include <linux/types.h>
 
-#define ECC_PARITY_BITS		(14)
-
 enum mtk_ecc_mode {ECC_DMA_MODE = 0, ECC_NFI_MODE = 1};
 enum mtk_ecc_operation {ECC_ENCODE, ECC_DECODE};
 
@@ -37,6 +35,29 @@ struct mtk_ecc_config {
 	u32 len;
 };
 
+struct mtk_ecc_caps {
+	u32 err_mask;
+	const u8 *ecc_strength;
+	const u32 *ecc_regs;
+	u8 num_ecc_strength;
+	u8 ecc_mode_shift;
+	u8 parity_bits;
+	int pg_irq_sel;
+};
+
+struct mtk_ecc {
+	struct device *dev;
+	const struct mtk_ecc_caps *caps;
+	void __iomem *regs;
+	struct clk *clk;
+
+	struct completion done;
+	struct mutex lock;
+	u32 sectors;
+
+	u8 *eccdata;
+};
+
 int mtk_ecc_encode(struct mtk_ecc *, struct mtk_ecc_config *, u8 *, u32);
 void mtk_ecc_get_stats(struct mtk_ecc *, struct mtk_ecc_stats *, int);
 int mtk_ecc_wait_done(struct mtk_ecc *, enum mtk_ecc_operation);
diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
index d86a7d1..641c2be 100644
--- a/drivers/mtd/nand/mtk_nand.c
+++ b/drivers/mtd/nand/mtk_nand.c
@@ -97,7 +97,6 @@
 
 #define MTK_TIMEOUT		(500000)
 #define MTK_RESET_TIMEOUT	(1000000)
-#define MTK_MAX_SECTOR		(16)
 #define MTK_NAND_MAX_NSELS	(2)
 #define MTK_NFC_MIN_SPARE	(16)
 #define ACCTIMING(tpoecs, tprecs, tc2r, tw2r, twh, twst, trlt) \
@@ -109,6 +108,8 @@ struct mtk_nfc_caps {
 	u8 num_spare_size;
 	u8 pageformat_spare_shift;
 	u8 nfi_clk_div;
+	u8 max_sector;
+	u32 max_sector_size;
 };
 
 struct mtk_nfc_bad_mark_ctl {
@@ -450,7 +451,7 @@ static inline u8 mtk_nfc_read_byte(struct mtd_info *mtd)
 		 * set to max sector to allow the HW to continue reading over
 		 * unaligned accesses
 		 */
-		reg = (MTK_MAX_SECTOR << CON_SEC_SHIFT) | CON_BRD;
+		reg = (nfc->caps->max_sector << CON_SEC_SHIFT) | CON_BRD;
 		nfi_writel(nfc, reg, NFI_CON);
 
 		/* trigger to fetch data */
@@ -481,7 +482,7 @@ static void mtk_nfc_write_byte(struct mtd_info *mtd, u8 byte)
 		reg = nfi_readw(nfc, NFI_CNFG) | CNFG_BYTE_RW;
 		nfi_writew(nfc, reg, NFI_CNFG);
 
-		reg = MTK_MAX_SECTOR << CON_SEC_SHIFT | CON_BWR;
+		reg = nfc->caps->max_sector << CON_SEC_SHIFT | CON_BWR;
 		nfi_writel(nfc, reg, NFI_CON);
 
 		nfi_writew(nfc, STAR_EN, NFI_STRDATA);
@@ -1126,9 +1127,11 @@ static void mtk_nfc_set_fdm(struct mtk_nfc_fdm *fdm, struct mtd_info *mtd)
 {
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct mtk_nfc_nand_chip *chip = to_mtk_nand(nand);
+	struct mtk_nfc *nfc = nand_get_controller_data(nand);
 	u32 ecc_bytes;
 
-	ecc_bytes = DIV_ROUND_UP(nand->ecc.strength * ECC_PARITY_BITS, 8);
+	ecc_bytes = DIV_ROUND_UP(nand->ecc.strength *
+				 nfc->ecc->caps->parity_bits, 8);
 
 	fdm->reg_size = chip->spare_per_sector - ecc_bytes;
 	if (fdm->reg_size > NFI_FDM_MAX_SIZE)
@@ -1208,7 +1211,8 @@ static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
 		 * this controller only supports 512 and 1024 sizes
 		 */
 		if (nand->ecc.size < 1024) {
-			if (mtd->writesize > 512) {
+			if (mtd->writesize > 512 &&
+			    nfc->caps->max_sector_size > 512) {
 				nand->ecc.size = 1024;
 				nand->ecc.strength <<= 1;
 			} else {
@@ -1223,7 +1227,8 @@ static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
 			return ret;
 
 		/* calculate oob bytes except ecc parity data */
-		free = ((nand->ecc.strength * ECC_PARITY_BITS) + 7) >> 3;
+		free = ((nand->ecc.strength * nfc->ecc->caps->parity_bits) + 7)
+		       >> 3;
 		free = spare - free;
 
 		/*
@@ -1233,10 +1238,12 @@ static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
 		 */
 		if (free > NFI_FDM_MAX_SIZE) {
 			spare -= NFI_FDM_MAX_SIZE;
-			nand->ecc.strength = (spare << 3) / ECC_PARITY_BITS;
+			nand->ecc.strength = (spare << 3) /
+					     nfc->ecc->caps->parity_bits;
 		} else if (free < 0) {
 			spare -= NFI_FDM_MIN_SIZE;
-			nand->ecc.strength = (spare << 3) / ECC_PARITY_BITS;
+			nand->ecc.strength = (spare << 3) /
+					     nfc->ecc->caps->parity_bits;
 		}
 	}
 
@@ -1389,6 +1396,8 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
 	.num_spare_size = 16,
 	.pageformat_spare_shift = 4,
 	.nfi_clk_div = 1,
+	.max_sector = 16,
+	.max_sector_size = 1024,
 };
 
 static const struct mtk_nfc_caps mtk_nfc_caps_mt2712 = {
@@ -1396,6 +1405,8 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
 	.num_spare_size = 19,
 	.pageformat_spare_shift = 16,
 	.nfi_clk_div = 2,
+	.max_sector = 16,
+	.max_sector_size = 1024,
 };
 
 static const struct of_device_id mtk_nfc_id_table[] = {
-- 
1.9.1
