Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz0KU-0001fU-5j
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 08:42:10 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v3 1/3] mtd: nand: add a helper to parse the Hynix nand
Date: Fri, 3 Jan 2014 16:08:36 +0800
Message-ID: <1388736518-5934-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1388736518-5934-1-git-send-email-b32955@freescale.com>
References: <1388736518-5934-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds a nand_parse_hynix() to parse the Hynix MLC nand
whose ID length is 6 bytes.

This patch makes preparations for parsing other Hynix nand.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   89 +++++++++++++++++++++++------------------
 1 files changed, 50 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4ce8007..d6b7dc3 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3198,6 +3198,55 @@ static int nand_get_bits_per_cell(u8 cellinfo)
 	return bits + 1;
 }
 
+/* Parse for the Hynix MLC nand which has 6-bytes ID */
+static void nand_parse_hynix(struct mtd_info *mtd, struct nand_chip *chip,
+			u8 id_data[8], int *busw)
+{
+	int extid = id_data[3];
+	unsigned int tmp;
+
+	/* Calc pagesize */
+	mtd->writesize = 2048 << (extid & 0x03);
+	extid >>= 2;
+
+	/* Calc oobsize */
+	switch (((extid >> 2) & 0x04) | (extid & 0x03)) {
+	case 0:
+		mtd->oobsize = 128;
+		break;
+	case 1:
+		mtd->oobsize = 224;
+		break;
+	case 2:
+		mtd->oobsize = 448;
+		break;
+	case 3:
+		mtd->oobsize = 64;
+		break;
+	case 4:
+		mtd->oobsize = 32;
+		break;
+	case 5:
+		mtd->oobsize = 16;
+		break;
+	default:
+		mtd->oobsize = 640;
+		break;
+	}
+	extid >>= 2;
+
+	/* Calc blocksize */
+	tmp = ((extid >> 1) & 0x04) | (extid & 0x03);
+	if (tmp < 0x03)
+		mtd->erasesize = (128 * 1024) << tmp;
+	else if (tmp == 0x03)
+		mtd->erasesize = 768 * 1024;
+	else
+		mtd->erasesize = (64 * 1024) << tmp;
+
+	*busw = 0;
+}
+
 /*
  * Many new NAND share similar device ID codes, which represent the size of the
  * chip. The rest of the parameters must be decoded according to generic or
@@ -3259,45 +3308,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 		*busw = 0;
 	} else if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
 			!nand_is_slc(chip)) {
-		unsigned int tmp;
-
-		/* Calc pagesize */
-		mtd->writesize = 2048 << (extid & 0x03);
-		extid >>= 2;
-		/* Calc oobsize */
-		switch (((extid >> 2) & 0x04) | (extid & 0x03)) {
-		case 0:
-			mtd->oobsize = 128;
-			break;
-		case 1:
-			mtd->oobsize = 224;
-			break;
-		case 2:
-			mtd->oobsize = 448;
-			break;
-		case 3:
-			mtd->oobsize = 64;
-			break;
-		case 4:
-			mtd->oobsize = 32;
-			break;
-		case 5:
-			mtd->oobsize = 16;
-			break;
-		default:
-			mtd->oobsize = 640;
-			break;
-		}
-		extid >>= 2;
-		/* Calc blocksize */
-		tmp = ((extid >> 1) & 0x04) | (extid & 0x03);
-		if (tmp < 0x03)
-			mtd->erasesize = (128 * 1024) << tmp;
-		else if (tmp == 0x03)
-			mtd->erasesize = 768 * 1024;
-		else
-			mtd->erasesize = (64 * 1024) << tmp;
-		*busw = 0;
+		nand_parse_hynix(mtd, chip, id_data, busw);
 	} else {
 		/* Calc pagesize */
 		mtd->writesize = 1024 << (extid & 0x03);
-- 
1.7.2.rc3
