Received: from mail-db8lp0184.outbound.messaging.microsoft.com
 ([213.199.154.184] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VvjWM-0002yG-IU
 for linux-mtd@lists.infradead.org; Wed, 25 Dec 2013 08:08:51 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH V2 2/2] mtd: nand: parse the Hynix nand which uses <26nm
 technology
Date: Wed, 25 Dec 2013 15:37:19 +0800
Message-ID: <1387957039-12575-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1387957039-12575-1-git-send-email-b32955@freescale.com>
References: <1387957039-12575-1-git-send-email-b32955@freescale.com>
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

The Hynix uses different ID parsing rules for <26nm technology.
We should check the id_data[5] for Hynix nand now.

This patch adds the parsing code for the Hynix nand which use <26nm technology.

Tested with H27UBG8T2CTR(8192 + 640).

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   87 +++++++++++++++++++++++++++++++-----------
 1 files changed, 64 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 79f0050..070884a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3109,36 +3109,77 @@ static void nand_parse_hynix(struct mtd_info *mtd, struct nand_chip *chip,
 			u8 id_data[8], int *busw)
 {
 	int extid = id_data[3];
+	int tech = id_data[5];
 	unsigned int tmp;
 
+	/*
+	 * The (id_data[5] <= 3) means the nand uses >=26nm technology;
+	 * The (id_data[5] > 3) means the nand uses <26nm technology;
+	 *
+	 * Please reference the H27UBG8T2B (p.23) and H27UBG8T2C (p.23).
+	 */
+	tmp = (tech <= 3) ? SZ_2K : SZ_4K;
+
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
+	if (tech <= 3) {
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
+
 	extid >>= 2;
 
 	/* Calc blocksize */
-- 
1.7.2.rc3
