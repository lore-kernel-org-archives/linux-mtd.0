Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TWkTS-0002M4-6e
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 09:02:03 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: de-select the chip when it is not used
Date: Fri, 9 Nov 2012 16:23:45 +0800
Message-ID: <1352449425-16496-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When we scan several nand chips with nand_scan(), such as
     .......................
      nand_scan(*, 2);
     .......................

In nand_scan_ident(), the maxchips will become 2, so the current code
will select chip 1 to read the device ID. But the chip 0 is still
selected in this case.

To make the logic clear, we'd better de-select the chip when it is not used.

This patch de-select the nand chip if it is not used any more.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ec6841d..fd5fa3b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3325,6 +3325,8 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		return PTR_ERR(type);
 	}
 
+	chip->select_chip(mtd, -1);
+
 	/* Check for a chip array */
 	for (i = 1; i < maxchips; i++) {
 		chip->select_chip(mtd, i);
@@ -3334,8 +3336,11 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 		/* Read manufacturer and device IDs */
 		if (nand_maf_id != chip->read_byte(mtd) ||
-		    nand_dev_id != chip->read_byte(mtd))
+		    nand_dev_id != chip->read_byte(mtd)) {
+			chip->select_chip(mtd, -1);
 			break;
+		}
+		chip->select_chip(mtd, -1);
 	}
 	if (i > 1)
 		pr_info("%d NAND chips detected\n", i);
@@ -3594,9 +3599,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* Initialize state */
 	chip->state = FL_READY;
 
-	/* De-select the device */
-	chip->select_chip(mtd, -1);
-
 	/* Invalidate the pagebuffer reference */
 	chip->pagebuf = -1;
 
-- 
1.7.0.4
