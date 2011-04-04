Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6hd9-00013T-UQ
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 11:07:40 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: onenand: add ecclayout and subpage_sft for none-flex 4kb
	page onenand
Date: Mon,  4 Apr 2011 14:07:04 +0300
Message-Id: <1301915224-7571-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: kyungmin.park@samsung.com, Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So as the ecclayout and suppage size for 4kb page
Flex- and none-Flex OneNAND are different
the new values for none-Flex 4kb page OneNAND memory are added.

The introduced ecclayout and suppage size are based on specification
4Gb M-die OneNAND Flash (KFM4G16Q4M, KFN8G16Q4M). Rev. 1.3, Apr. 2010

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |   33 +++++++++++++++++++++++++++++++--
 1 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 56a8b20..9b53feb 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -87,6 +87,30 @@ static struct nand_ecclayout onenand_oob_128 = {
 };
 
 /**
+ *  onenand_oob_128 - oob info for OneNAND with 4KB page
+ *  and using reserved bytes as free bytes instead of
+ *  free bytes that are managed by ECC.
+ *  For now, we expose only 64 out of 72 ecc bytes
+ */
+static struct nand_ecclayout onenand_oob_128_none_flex = {
+	.eccbytes	= 64,
+	.eccpos		= {
+		7, 8, 9, 10, 11, 12, 13, 14, 15,
+		23, 24, 25, 26, 27, 28, 29, 30, 31,
+		39, 40, 41, 42, 43, 44, 45, 46, 47,
+		55, 56, 57, 58, 59, 60, 61, 62, 63,
+		71, 72, 73, 74, 75, 76, 77, 78, 79,
+		87, 88, 89, 90, 91, 92, 93, 94, 95,
+		103, 104, 105, 106, 107, 108, 109, 110, 111,
+		119
+	},
+	.oobfree	= {
+		{5, 2}, {21, 2}, {37, 2}, {53, 2},
+		{69, 2}, {85, 2}, {101, 2}, {117, 2}
+	}
+};
+
+/**
  * onenand_oob_64 - oob info for large (2KB) page
  */
 static struct nand_ecclayout onenand_oob_64 = {
@@ -4018,8 +4042,13 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	 */
 	switch (mtd->oobsize) {
 	case 128:
-		this->ecclayout = &onenand_oob_128;
-		mtd->subpage_sft = 0;
+		if (FLEXONENAND(this)) {
+			this->ecclayout = &onenand_oob_128;
+			mtd->subpage_sft = 0;
+		} else {
+			this->ecclayout = &onenand_oob_128_none_flex;
+			mtd->subpage_sft = 2;
+		}
 		break;
 	case 64:
 		this->ecclayout = &onenand_oob_64;
-- 
1.7.0.4
