Received: from mail-db9lp0248.outbound.messaging.microsoft.com
 ([213.199.154.248] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vvl6f-0003iE-E0
 for linux-mtd@lists.infradead.org; Wed, 25 Dec 2013 09:50:26 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: add support for Samsung K9LCG08U0B
Date: Wed, 25 Dec 2013 17:18:55 +0800
Message-ID: <1387963135-22142-1-git-send-email-b32955@freescale.com>
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

Assume that:
          tmp = ((extid >> 2) & 0x04) | (extid & 0x03));

>From the K9LCG08U0B's datasheet, we know that:
  the oob size is 640 when tmp is 6;
  the oob size is 1024 when tmp is 7;

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ce4dec7..0d113cc 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3242,9 +3242,11 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 			mtd->oobsize = 512;
 			break;
 		case 6:
-		default: /* Other cases are "reserved" (unknown) */
 			mtd->oobsize = 640;
 			break;
+		case 7:
+			mtd->oobsize = SZ_1K;
+			break;
 		}
 		extid >>= 2;
 		/* Calc blocksize */
-- 
1.7.2.rc3
