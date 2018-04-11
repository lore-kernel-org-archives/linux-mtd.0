From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH 3/8] mtd: rawnand: mtk: Add DT property mtk,fdm-ecc-size
Date: Wed, 11 Apr 2018 11:41:53 +0800
Message-ID: <1523418118-57686-4-git-send-email-xiaolei.li@mediatek.com>
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

For some MTK NAND chips, BootROM may access more than one byte
ECC protected FDM data, but now we fix ECC protected FDM byte as 1.
This will make some chips be failed to boot up.

With this DT property setting, different MTK NAND chips with the same
NAND controller IP can work well.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 Documentation/devicetree/bindings/mtd/mtk-nand.txt |  6 ++++++
 drivers/mtd/nand/raw/mtk_nand.c                    | 25 ++++++++++++++++------
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
index ef786568..a8e4136 100644
--- a/Documentation/devicetree/bindings/mtd/mtk-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
@@ -47,6 +47,12 @@ Children nodes properties:
 - reg:			Chip Select Signal, default 0.
 			Set as reg = <0>, <1> when need 2 CS.
 Optional:
+- mtk,fdm-ecc-size:	Integer representing ECC protected FDM bytes.
+			Should be in the range [1,8], if not present 1.
+			On some MTK NAND chips, BootROM may access more than
+			one byte ECC protected FDM data. Different MTK chips
+			with the same NAND controller IP will work well with
+			this properity setting.
 - nand-on-flash-bbt:	Store BBT on NAND Flash.
 - nand-ecc-mode:	the NAND ecc mode (check driver for supported modes)
 - nand-ecc-step-size:	Number of data bytes covered by a single ECC step.
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 6977da3..b05f619 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -86,7 +86,6 @@
 #define NFI_FDML(x)		(0xA0 + (x) * sizeof(u32) * 2)
 #define NFI_FDMM(x)		(0xA4 + (x) * sizeof(u32) * 2)
 #define NFI_FDM_MAX_SIZE	(8)
-#define NFI_FDM_MIN_SIZE	(1)
 #define NFI_MASTER_STA		(0x224)
 #define		MASTER_STA_MASK		(0x0FFF)
 #define NFI_EMPTY_THRESH	(0x23C)
@@ -1118,7 +1117,7 @@ static int mtk_nfc_ooblayout_ecc(struct mtd_info *mtd, int section,
 	.ecc = mtk_nfc_ooblayout_ecc,
 };
 
-static void mtk_nfc_set_fdm(struct mtk_nfc_fdm *fdm, struct mtd_info *mtd)
+static int mtk_nfc_set_fdm(struct mtk_nfc_fdm *fdm, struct mtd_info *mtd)
 {
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct mtk_nfc_nand_chip *chip = to_mtk_nand(nand);
@@ -1129,11 +1128,15 @@ static void mtk_nfc_set_fdm(struct mtk_nfc_fdm *fdm, struct mtd_info *mtd)
 				 mtk_ecc_get_parity_bits(nfc->ecc), 8);
 
 	fdm->reg_size = chip->spare_per_sector - ecc_bytes;
-	if (fdm->reg_size > NFI_FDM_MAX_SIZE)
+	if (fdm->reg_size > NFI_FDM_MAX_SIZE) {
 		fdm->reg_size = NFI_FDM_MAX_SIZE;
+	} else if (fdm->reg_size < fdm->ecc_size) {
+		dev_err(nfc->dev, "fdm reg size(%u) is less than fdm ecc size(%u)\n",
+			fdm->reg_size, fdm->ecc_size);
+		return -ENOTSUPP;
+	}
 
-	/* bad block mark storage */
-	fdm->ecc_size = 1;
+	return 0;
 }
 
 static void mtk_nfc_set_bad_mark_ctl(struct mtk_nfc_bad_mark_ctl *bm_ctl,
@@ -1185,6 +1188,7 @@ static int mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
 static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
 {
 	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(nand);
 	struct mtk_nfc *nfc = nand_get_controller_data(nand);
 	u32 spare;
 	int free, ret;
@@ -1236,7 +1240,7 @@ static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
 			nand->ecc.strength = (spare << 3) /
 					     mtk_ecc_get_parity_bits(nfc->ecc);
 		} else if (free < 0) {
-			spare -= NFI_FDM_MIN_SIZE;
+			spare -= mtk_nand->fdm.ecc_size;
 			nand->ecc.strength = (spare << 3) /
 					     mtk_ecc_get_parity_bits(nfc->ecc);
 		}
@@ -1285,6 +1289,10 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		chip->sels[i] = tmp;
 	}
 
+	/* If not present, set 1 for bad block mark storage */
+	if (of_property_read_u32(np, "mtk,fdm-ecc-size", &chip->fdm.ecc_size))
+		chip->fdm.ecc_size = 1;
+
 	nand = &chip->nand;
 	nand->controller = &nfc->controller;
 
@@ -1345,7 +1353,10 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 	if (ret)
 		return ret;
 
-	mtk_nfc_set_fdm(&chip->fdm, mtd);
+	ret = mtk_nfc_set_fdm(&chip->fdm, mtd);
+	if (ret)
+		return ret;
+
 	mtk_nfc_set_bad_mark_ctl(&chip->bad_mark, mtd);
 
 	len = mtd->writesize + mtd->oobsize;
-- 
1.9.1
