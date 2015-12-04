Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4yxB-00056z-GR
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 22:35:51 +0000
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: support JEDEC additional redundant parameter pages
Date: Fri,  4 Dec 2015 23:35:28 +0100
Message-Id: <1449268528-18154-1-git-send-email-antoine.tenart@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The JEDEC standard defines the JEDEC parameter page data structure.
One page plus two redundant pages are always there, in bits 0-1535.
Additionnal redundant parameter pages can be stored at bits 1536+.
Add support to read these pages.

The first 3 JEDEC parameter pages are always checked, and if none
is valid we try to read additional redundant pages following the
standard definition: we continue while at least two of the four bytes
of the parameter page signature match (stored in the first dword).

There is no limit to the number of additional redundant parameter
page.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 44 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index cc74142938b0..31f4a6585703 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3392,6 +3392,32 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	return 1;
 }
 
+static int nand_flash_jedec_read_param(struct mtd_info *mtd,
+				       struct nand_chip *chip,
+				       struct nand_jedec_params *p)
+{
+	int i, match = 0;
+	char sig[4] = "JESD";
+
+	for (i = 0; i < sizeof(*p); i++)
+		((uint8_t *)p)[i] = chip->read_byte(mtd);
+
+	for (i = 0; i < 4; i++)
+		if (p->sig[i] == sig[i])
+			match++;
+
+	if (match < 2) {
+		pr_warn("Invalid JEDEC page\n");
+		return -EINVAL;
+	}
+
+	if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) ==
+			le16_to_cpu(p->crc))
+		return 0;
+
+	return -EAGAIN;
+}
+
 /*
  * Check if the NAND chip is JEDEC compliant, returns 1 if it is, 0 otherwise.
  */
@@ -3400,8 +3426,7 @@ static int nand_flash_detect_jedec(struct mtd_info *mtd, struct nand_chip *chip,
 {
 	struct nand_jedec_params *p = &chip->jedec_params;
 	struct jedec_ecc_info *ecc;
-	int val;
-	int i, j;
+	int val, i, ret = 0;
 
 	/* Try JEDEC for unknown chip or LP */
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x40, -1);
@@ -3411,16 +3436,15 @@ static int nand_flash_detect_jedec(struct mtd_info *mtd, struct nand_chip *chip,
 		return 0;
 
 	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0x40, -1);
-	for (i = 0; i < 3; i++) {
-		for (j = 0; j < sizeof(*p); j++)
-			((uint8_t *)p)[j] = chip->read_byte(mtd);
-
-		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) ==
-				le16_to_cpu(p->crc))
+	for (i = 0; i < 3; i++)
+		if (!nand_flash_jedec_read_param(mtd, chip, p))
 			break;
-	}
 
-	if (i == 3) {
+	/* Try reading additional parameter pages */
+	if (i == 3)
+		while ((ret = nand_flash_jedec_read_param(mtd, chip, p)) ==
+				-EAGAIN);
+	if (ret) {
 		pr_err("Could not find valid JEDEC parameter page; aborting\n");
 		return 0;
 	}
-- 
2.6.3
