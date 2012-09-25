Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGM1Z-00069B-Qw
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 03:41:30 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq8so14273168pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 20:41:29 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/9] mtd: nand: split simple ID decode into its own function
Date: Mon, 24 Sep 2012 20:40:51 -0700
Message-Id: <1348544455-17656-6-git-send-email-computersforpeace@gmail.com>
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

This patch splits out the simple ID decode functionality, where all the
information regarding NAND size/blocksize/pagesize/oobsize/busw is encoded in
the first two bytes of the ID string.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 51 +++++++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index afbe1ce..380f783 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2927,6 +2927,36 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /*
+ * Old devices have chip data hardcoded in the device ID table. nand_decode_id
+ * decodes a matching ID table entry and assigns the MTD size parameters for
+ * the chip.
+ */
+static void nand_decode_id(struct mtd_info *mtd, struct nand_chip *chip,
+				struct nand_flash_dev *type, u8 id_data[8],
+				int *busw)
+{
+	int maf_id = id_data[0];
+
+	mtd->erasesize = type->erasesize;
+	mtd->writesize = type->pagesize;
+	mtd->oobsize = mtd->writesize / 32;
+	*busw = type->options & NAND_BUSWIDTH_16;
+
+	/*
+	 * Check for Spansion/AMD ID + repeating 5th, 6th byte since
+	 * some Spansion chips have erasesize that conflicts with size
+	 * listed in nand_ids table.
+	 * Data sheet (5 byte ID): Spansion S30ML-P ORNAND (p.39)
+	 */
+	if (maf_id == NAND_MFR_AMD && id_data[4] != 0x00 && id_data[5] == 0x00
+			&& id_data[6] == 0x00 && id_data[7] == 0x00
+			&& mtd->writesize == 512) {
+		mtd->erasesize = 128 * 1024;
+		mtd->erasesize <<= ((id_data[3] & 0x03) << 1);
+	}
+}
+
+/*
  * Set the bad block marker/indicator (BBM/BBI) patterns according to some
  * heuristic patterns using various detected parameters (e.g., manufacturer,
  * page size, cell-type information).
@@ -3040,26 +3070,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		/* Decode parameters from extended ID */
 		nand_decode_ext_id(mtd, chip, id_data, &busw);
 	} else {
-		/*
-		 * Old devices have chip data hardcoded in the device id table.
-		 */
-		mtd->erasesize = type->erasesize;
-		mtd->writesize = type->pagesize;
-		mtd->oobsize = mtd->writesize / 32;
-		busw = type->options & NAND_BUSWIDTH_16;
-
-		/*
-		 * Check for Spansion/AMD ID + repeating 5th, 6th byte since
-		 * some Spansion chips have erasesize that conflicts with size
-		 * listed in nand_ids table.
-		 * Data sheet (5 byte ID): Spansion S30ML-P ORNAND (p.39)
-		 */
-		if (*maf_id == NAND_MFR_AMD && id_data[4] != 0x00 &&
-				id_data[5] == 0x00 && id_data[6] == 0x00 &&
-				id_data[7] == 0x00 && mtd->writesize == 512) {
-			mtd->erasesize = 128 * 1024;
-			mtd->erasesize <<= ((id_data[3] & 0x03) << 1);
-		}
+		nand_decode_id(mtd, chip, type, id_data, &busw);
 	}
 	/* Get chip options */
 	chip->options |= type->options;
-- 
1.7.11.3
