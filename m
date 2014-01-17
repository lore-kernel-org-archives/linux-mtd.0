Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W43JN-0000EB-41
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 06:53:50 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH fix] mtd: nand: add support for Samsung K9LCG08U0B
Date: Fri, 17 Jan 2014 14:17:26 +0800
Message-ID: <1389939446-20577-1-git-send-email-b32955@freescale.com>
In-Reply-To: <CAN8TOE-6gwR1fXM_unGUo27JhLsZiUBXhTsGa+GD8tbe-kRf_A@mail.gmail.com>
References: <CAN8TOE-6gwR1fXM_unGUo27JhLsZiUBXhTsGa+GD8tbe-kRf_A@mail.gmail.com>
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

[1] use the 1024, not the SZ_1k
[2] add back the default case for case 0.

---
 drivers/mtd/nand/nand_base.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d388c7f..537afe0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3285,9 +3285,12 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 			mtd->oobsize = 512;
 			break;
 		case 6:
-		default: /* Other cases are "reserved" (unknown) */
 			mtd->oobsize = 640;
 			break;
+		default: /* Other cases are "reserved" (unknown) */
+		case 7:
+			mtd->oobsize = 1024;
+			break;
 		}
 		extid >>= 2;
 		/* Calc blocksize */
-- 
1.7.2.rc3
