Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz0KR-0001fQ-Oe
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 08:42:06 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v3 2/3] mtd: nand: add new parsing rule for Hynix's
 H27UBG8T2CTR
Date: Fri, 3 Jan 2014 16:08:37 +0800
Message-ID: <1388736518-5934-3-git-send-email-b32955@freescale.com>
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

The H27UBG8T2CTR is produced by the 20nm technology, and Hynix uses
different ID rules for it.

In order to parse out the correct information, we should check the
process technology and the Device ID, and then determine whether to
use a new parsing rule for this chip.

This patch adds the new parsing rule for the H27UBG8T2CTR.

Tested with H27UBG8T2CTR(8192 + 640).

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   90 +++++++++++++++++++++++++++++++-----------
 1 files changed, 67 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d6b7dc3..2c2f7af 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3204,34 +3204,78 @@ static void nand_parse_hynix(struct mtd_info *mtd, struct nand_chip *chip,
 {
 	int extid = id_data[3];
 	unsigned int tmp;
+	bool new_rule;
 
+	/*
+	 * The ((id_data[5] & 0x7) < 4) means the nand uses >20nm technology;
+	 * The ((id_data[5] & 0x7) >= 4) means the nand uses <=20nm technology;
+	 *
+	 * Please reference to the H27UBG8T2B (p.23) and H27UBG8T2C (p.23).
+	 *
+	 * The new parsing rule is used in the H27UBG8T2C, we have to use the
+	 * process technology and the Device ID to distinguish this new rule.
+	 */
+	new_rule = ((id_data[5] & 0x7) >= 4) && (id_data[1] == 0xd7);
+
+	tmp = new_rule ? SZ_4K : SZ_2K;
 	/* Calc pagesize */
-	mtd->writesize = 2048 << (extid & 0x03);
+	mtd->writesize = tmp << (extid & 0x03);
 	extid >>= 2;
 
 	/* Calc oobsize */
-	switch (((extid >> 2) & 0x04) | (extid & 0x03)) {
-	case 0:
-		mtd->oobsize = 128;
-		break;
-	case 1:
-		mtd->oobsize = 224;
-		break;
-	case 2:
-		mtd->oobsize = 448;
-		break;
-	case 3:
-		mtd->oobsize = 64;
-		break;
-	case 4:
-		mtd->oobsize = 32;
-		break;
-	case 5:
-		mtd->oobsize = 16;
-		break;
-	default:
-		mtd->oobsize = 640;
-		break;
+	tmp = ((extid >> 2) & 0x04) | (extid & 0x03);
+
+	if (!new_rule) {
+		switch (tmp) {
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
+	} else {
+		switch (tmp) {
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
 	}
 	extid >>= 2;
 
-- 
1.7.2.rc3
