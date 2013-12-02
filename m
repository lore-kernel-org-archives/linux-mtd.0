Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnPnb-0007bT-TI
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2013 09:28:16 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: parse the Hynix nand which uses <26nm technology
Date: Mon, 2 Dec 2013 17:01:46 +0800
Message-ID: <1385974906-29891-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Hynix uses different ID parsing rules for <26nm technology.
We should check the id_data[5] for Hynix nand now.

This patch adds the parsing code for the Hynix nand which use <26nm technology,
and it also parses out the datasheet's minimum required ECC.

Tested with H27UBG8T2CTR(8192 + 640).

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   65 +++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 64 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index bd39f7b..4dab696 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3162,7 +3162,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 			(((extid >> 1) & 0x04) | (extid & 0x03));
 		*busw = 0;
 	} else if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
-			!nand_is_slc(chip)) {
+			!nand_is_slc(chip) && (id_data[5] & 0x7) < 3) {
 		unsigned int tmp;
 
 		/* Calc pagesize */
@@ -3202,6 +3202,69 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 		else
 			mtd->erasesize = (64 * 1024) << tmp;
 		*busw = 0;
+	} else if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
+			!nand_is_slc(chip) && (id_data[5] & 0x7) > 3) {
+		unsigned int tmp;
+
+		/* Calc pagesize */
+		mtd->writesize = 4096 << (extid & 0x03);
+		extid >>= 2;
+		/* Calc oobsize */
+		switch (((extid >> 2) & 0x04) | (extid & 0x03)) {
+		case 0:
+			mtd->oobsize = 640;
+			break;
+		case 1:
+			mtd->oobsize = 448;
+			break;
+		case 2:
+			mtd->oobsize = 224;
+			break;
+		case 3:
+			mtd->oobsize = 128;
+			break;
+		case 4:
+			mtd->oobsize = 64;
+			break;
+		case 5:
+			mtd->oobsize = 32;
+			break;
+		case 6:
+			mtd->oobsize = 16;
+			break;
+		default:
+			mtd->oobsize = 640;
+			break;
+		}
+		extid >>= 2;
+		/* Calc blocksize */
+		tmp = ((extid >> 1) & 0x04) | (extid & 0x03);
+		if (tmp < 0x03)
+			mtd->erasesize = (128 * 1024) << tmp;
+		else if (tmp == 0x03)
+			mtd->erasesize = 768 * 1024;
+		else
+			mtd->erasesize = (64 * 1024) << tmp;
+
+		/* ecc info */
+		tmp = (id_data[4] >> 4) & 0x7;
+
+		if (tmp < 4) {
+			chip->ecc_strength_ds = 1 << tmp;
+			chip->ecc_step_ds = 512;
+		} else {
+			chip->ecc_step_ds = 1024;
+			if (tmp == 4)
+				chip->ecc_strength_ds = 24;
+			else if (tmp == 5)
+				chip->ecc_strength_ds = 32;
+			else if (tmp == 6)
+				chip->ecc_strength_ds = 40;
+			else /* (tmp == 7) */
+				chip->ecc_strength_ds = 100;
+		}
+
+		*busw = 0;
 	} else {
 		/* Calc pagesize */
 		mtd->writesize = 1024 << (extid & 0x03);
-- 
1.7.2.rc3
