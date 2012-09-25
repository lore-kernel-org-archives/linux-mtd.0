Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGM1i-000690-3s
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 03:41:39 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so1915646pad.36
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 20:41:37 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 9/9] mtd: nand: detect Samsung K9GBG08U0A, K9GAG08U0F ID
Date: Mon, 24 Sep 2012 20:40:55 -0700
Message-Id: <1348544455-17656-10-git-send-email-computersforpeace@gmail.com>
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

Datasheets for the following Samsung NAND parts (both MLC and SLC) describe
extensions to the Samsung 6-byte extended ID decoding table:

K9GBG08U0A (MLC, 6-byte ID)
K9GAG08U0F (MLC, 6-byte ID)
K9FAG08U0M (SLC, 6-byte ID)

The table found in K9GAG08U0F, p.44, contains a superset of the information
found in other previous datasheets.

This patch adds support for all of these chips, with 512B and 640B OOB sizes.
It also changes the detection pattern such that this table applies to all
Samsung 6-byte ID NAND, not just MLC. This is safe, according to the NAND
parameter data I have collected:

Note that nand_base.c does not yet support the bad block marker scheme defined
for these chips (i.e., scan 1st and last page for BB markers).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7e93d0d..bcb58ce 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2939,19 +2939,18 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 	/*
 	 * Field definitions are in the following datasheets:
 	 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
-	 * New style   (6 byte ID): Samsung K9GBG08U0M (p.40)
+	 * New style   (6 byte ID): Samsung K9GAG08U0F (p.44)
 	 * Hynix MLC   (6 byte ID): Hynix H27UBG8T2B (p.22)
 	 *
 	 * Check for ID length, cell type, and Hynix/Samsung ID to decide what
 	 * to do.
 	 */
-	if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG &&
-			(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
+	if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG) {
 		/* Calc pagesize */
 		mtd->writesize = 2048 << (extid & 0x03);
 		extid >>= 2;
 		/* Calc oobsize */
-		switch (extid & 0x03) {
+		switch (((extid >> 2) & 0x04) | (extid & 0x03)) {
 		case 1:
 			mtd->oobsize = 128;
 			break;
@@ -2961,9 +2960,16 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 		case 3:
 			mtd->oobsize = 400;
 			break;
-		default:
+		case 4:
 			mtd->oobsize = 436;
 			break;
+		case 5:
+			mtd->oobsize = 512;
+			break;
+		case 6:
+		default: /* Other cases are "reserved" (unknown) */
+			mtd->oobsize = 640;
+			break;
 		}
 		extid >>= 2;
 		/* Calc blocksize */
-- 
1.7.11.3
