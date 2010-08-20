Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmVk5-0000uA-CD
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 17:51:02 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: Samsung MLC - new OOB sizes
Date: Fri, 20 Aug 2010 10:50:43 -0700
Message-ID: <1282326643-9598-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: tilman@code-monkey.de, Kevin Cernekee <cernekee@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Brian Norris <norris@broadcom.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are some additions to the detection scheme used by Samsung
MLC NAND. These simple changes to support the 400- and 436-byte OOB
are found in the following data sheet:

Samsung K9GBG08U0M (p.40)

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 drivers/mtd/nand/nand_base.c |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a3c7473..80ff671 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2859,7 +2859,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		/*
 		 * Field definitions are in the following datasheets:
 		 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
-		 * New style   (6 byte ID): Samsung K9GAG08U0D (p.40)
+		 * New style   (6 byte ID): Samsung K9GBG08U0M (p.40)
 		 *
 		 * Check for wraparound + Samsung ID + nonzero 6th byte
 		 * to decide what to do.
@@ -2871,7 +2871,20 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 			mtd->writesize = 2048 << (extid & 0x03);
 			extid >>= 2;
 			/* Calc oobsize */
-			mtd->oobsize = (extid & 0x03) == 0x01 ? 128 : 218;
+			switch (extid & 0x03) {
+			case 1:
+				mtd->oobsize = 128;
+				break;
+			case 2:
+				mtd->oobsize = 218;
+				break;
+			case 3:
+				mtd->oobsize = 400;
+				break;
+			default:
+				mtd->oobsize = 436;
+				break;
+			}
 			extid >>= 2;
 			/* Calc blocksize */
 			mtd->erasesize = (128 * 1024) <<
-- 
1.7.0.4
