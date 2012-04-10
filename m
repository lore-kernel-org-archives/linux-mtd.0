Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SHR5l-0004Lr-0l
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2012 02:46:01 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dedekind1@gmail.com>
Subject: [PATCH] mtd : add parsing code for one kind of Hynix's nand chip
Date: Tue, 10 Apr 2012 10:56:46 +0800
Message-ID: <1334026606-18327-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Huang Shijie <shijie8@gmail.com>

The H27UBG8T2A is not supported by the current code.
Its full-id is : 0xad, 0xd7, 0x94, 0x9a, 0x74, 0x42.

Now, add the parsing code for it.

Signed-off-by: Huang Shijie <shijie8@gmail.com>
Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   43 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 6315b94..8997023 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3028,6 +3028,49 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 			mtd->erasesize = (128 * 1024) <<
 				(((extid >> 1) & 0x04) | (extid & 0x03));
 			busw = 0;
+		} else if (id_data[0] == NAND_MFR_HYNIX && id_data[1] == 0xd7) {
+			/* Calc pagesize */
+			mtd->writesize = 2048 << (extid & 0x03);
+			extid >>= 2;
+
+			/* Calc oobsize */
+			switch (extid & 0x03) {
+			case 0:
+				mtd->oobsize = 128;
+				break;
+			case 1:
+				mtd->oobsize = 224;
+				break;
+			case 2:
+				mtd->oobsize = 448;
+				break;
+			default:
+				pr_info("Cannot parse out the oobsize.\n");
+				break;
+			}
+			extid >>= 2;
+
+			/* Calc blocksize */
+			extid = (((extid >> 1) & 0x04) | (extid & 0x03));
+
+			switch (extid) {
+			case 0:
+			case 1:
+			case 2:
+				mtd->erasesize = (128 * 1024) << extid;
+				break;
+			case 3:
+				mtd->erasesize = (128 * 1024) * 6;
+				break;
+			case 4:
+			case 5:
+				mtd->erasesize = (128 * 1024) << (extid - 1);
+				break;
+			default:
+				pr_info("Cannot parse out the blocksize.\n");
+				break;
+			}
+			busw = 0;
 		} else {
 			/* Calc pagesize */
 			mtd->writesize = 1024 << (extid & 0x03);
-- 
1.7.0.4
