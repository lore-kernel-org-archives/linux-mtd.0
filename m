Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGM1g-000690-1E
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 03:41:36 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so1915646pad.36
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 20:41:35 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 8/9] mtd: nand: decode Hynix MLC, 6-byte ID length
Date: Mon, 24 Sep 2012 20:40:54 -0700
Message-Id: <1348544455-17656-9-git-send-email-computersforpeace@gmail.com>
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

Hynix has introduced a new ID decoding scheme for their newer MLC, some of
which don't support ONFI. The following devices all follow the pattern given in
the datasheet for Hynix H27UBG8T2B, p.22:

Hynix H27UAG8T2A
Hynix H27UBG8T2A
Hynix H27UBG8T2B

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 45 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index fd5c307..7e93d0d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2940,8 +2940,10 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 	 * Field definitions are in the following datasheets:
 	 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
 	 * New style   (6 byte ID): Samsung K9GBG08U0M (p.40)
+	 * Hynix MLC   (6 byte ID): Hynix H27UBG8T2B (p.22)
 	 *
-	 * Check for ID length + Samsung ID to decide what to do.
+	 * Check for ID length, cell type, and Hynix/Samsung ID to decide what
+	 * to do.
 	 */
 	if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG &&
 			(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
@@ -2968,6 +2970,47 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 		mtd->erasesize = (128 * 1024) <<
 			(((extid >> 1) & 0x04) | (extid & 0x03));
 		*busw = 0;
+	} else if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
+			(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
+		unsigned int tmp;
+
+		/* Calc pagesize */
+		mtd->writesize = 2048 << (extid & 0x03);
+		extid >>= 2;
+		/* Calc oobsize */
+		switch (((extid >> 2) & 0x04) | (extid & 0x03)) {
+		case 0:
+			mtd->oobsize = 128;
+			break;
+		case 1:
+			mtd->oobsize = 224;
+			break;
+		case 2:
+			mtd->oobsize = 448;
+			break;
+		case 3:
+			mtd->oobsize = 64;
+			break;
+		case 4:
+			mtd->oobsize = 32;
+			break;
+		case 5:
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
+		*busw = 0;
 	} else {
 		/* Calc pagesize */
 		mtd->writesize = 1024 << (extid & 0x03);
-- 
1.7.11.3
