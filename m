Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGM1X-000690-OD
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 03:41:28 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so1915646pad.36
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 20:41:27 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/9] mtd: nand: split extended ID decoding into its own
 function
Date: Mon, 24 Sep 2012 20:40:50 -0700
Message-Id: <1348544455-17656-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
References: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
Cc: Angus Clark <angus.clark@st.com>, Mike Dunn <mikedunn@newsguy.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When detecting NAND parameters, the code gets a little ugly so that the
logic is obscured. Try to remedy that by moving code to separate functions
that have well-defined purposes.

This patch splits out the extended ID decode functionality, which handles
decoding the 3rd-8th ID bytes to determine NAND device parameters.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 122 ++++++++++++++++++++++++-------------------
 1 file changed, 67 insertions(+), 55 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c7fc330..afbe1ce 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2862,6 +2862,71 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /*
+ * Many new NAND share similar device ID codes, which represent the size of the
+ * chip. The rest of the parameters must be decoded according to generic or
+ * manufacturer-specific "extended ID" decoding patterns.
+ */
+static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
+				u8 id_data[8], int *busw)
+{
+	int extid;
+	/* The 3rd id byte holds MLC / multichip data */
+	chip->cellinfo = id_data[2];
+	/* The 4th id byte is the important one */
+	extid = id_data[3];
+
+	/*
+	 * Field definitions are in the following datasheets:
+	 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
+	 * New style   (6 byte ID): Samsung K9GBG08U0M (p.40)
+	 *
+	 * Check for wraparound + Samsung ID + nonzero 6th byte
+	 * to decide what to do.
+	 */
+	if (id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
+			id_data[0] == NAND_MFR_SAMSUNG &&
+			(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
+			id_data[5] != 0x00) {
+		/* Calc pagesize */
+		mtd->writesize = 2048 << (extid & 0x03);
+		extid >>= 2;
+		/* Calc oobsize */
+		switch (extid & 0x03) {
+		case 1:
+			mtd->oobsize = 128;
+			break;
+		case 2:
+			mtd->oobsize = 218;
+			break;
+		case 3:
+			mtd->oobsize = 400;
+			break;
+		default:
+			mtd->oobsize = 436;
+			break;
+		}
+		extid >>= 2;
+		/* Calc blocksize */
+		mtd->erasesize = (128 * 1024) <<
+			(((extid >> 1) & 0x04) | (extid & 0x03));
+		*busw = 0;
+	} else {
+		/* Calc pagesize */
+		mtd->writesize = 1024 << (extid & 0x03);
+		extid >>= 2;
+		/* Calc oobsize */
+		mtd->oobsize = (8 << (extid & 0x01)) *
+			(mtd->writesize >> 9);
+		extid >>= 2;
+		/* Calc blocksize. Blocksize is multiples of 64KiB */
+		mtd->erasesize = (64 * 1024) << (extid & 0x03);
+		extid >>= 2;
+		/* Get buswidth information */
+		*busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
+	}
+}
+
+/*
  * Set the bad block marker/indicator (BBM/BBI) patterns according to some
  * heuristic patterns using various detected parameters (e.g., manufacturer,
  * page size, cell-type information).
@@ -2972,61 +3037,8 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		/* Set the pagesize, oobsize, erasesize by the driver */
 		busw = chip->init_size(mtd, chip, id_data);
 	} else if (!type->pagesize) {
-		int extid;
-		/* The 3rd id byte holds MLC / multichip data */
-		chip->cellinfo = id_data[2];
-		/* The 4th id byte is the important one */
-		extid = id_data[3];
-
-		/*
-		 * Field definitions are in the following datasheets:
-		 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
-		 * New style   (6 byte ID): Samsung K9GBG08U0M (p.40)
-		 *
-		 * Check for wraparound + Samsung ID + nonzero 6th byte
-		 * to decide what to do.
-		 */
-		if (id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
-				id_data[0] == NAND_MFR_SAMSUNG &&
-				(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
-				id_data[5] != 0x00) {
-			/* Calc pagesize */
-			mtd->writesize = 2048 << (extid & 0x03);
-			extid >>= 2;
-			/* Calc oobsize */
-			switch (extid & 0x03) {
-			case 1:
-				mtd->oobsize = 128;
-				break;
-			case 2:
-				mtd->oobsize = 218;
-				break;
-			case 3:
-				mtd->oobsize = 400;
-				break;
-			default:
-				mtd->oobsize = 436;
-				break;
-			}
-			extid >>= 2;
-			/* Calc blocksize */
-			mtd->erasesize = (128 * 1024) <<
-				(((extid >> 1) & 0x04) | (extid & 0x03));
-			busw = 0;
-		} else {
-			/* Calc pagesize */
-			mtd->writesize = 1024 << (extid & 0x03);
-			extid >>= 2;
-			/* Calc oobsize */
-			mtd->oobsize = (8 << (extid & 0x01)) *
-				(mtd->writesize >> 9);
-			extid >>= 2;
-			/* Calc blocksize. Blocksize is multiples of 64KiB */
-			mtd->erasesize = (64 * 1024) << (extid & 0x03);
-			extid >>= 2;
-			/* Get buswidth information */
-			busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
-		}
+		/* Decode parameters from extended ID */
+		nand_decode_ext_id(mtd, chip, id_data, &busw);
 	} else {
 		/*
 		 * Old devices have chip data hardcoded in the device id table.
-- 
1.7.11.3
