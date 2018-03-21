Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eydY2-0000MB-4a
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 13:13:04 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/2] mtd: rawnand: sm_common: make use of the new flash_ids
 table entry
Date: Wed, 21 Mar 2018 14:12:35 +0100
Message-Id: <20180321131235.9822-3-miquel.raynal@bootlin.com>
In-Reply-To: <20180321131235.9822-1-miquel.raynal@bootlin.com>
References: <20180321131235.9822-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the new entry in nand_chip to fill a local ID table instead of the
traditional way through nand_scan_ident() as part of the transition to
use nand_scan() in every driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/sm_common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index 7f5044a79f01..ac93fae5ed27 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -168,8 +168,9 @@ int sm_register_device(struct mtd_info *mtd, int smartmedia)
 	chip->options |= NAND_SKIP_BBTSCAN;
 
 	/* Scan for card properties */
-	ret = nand_scan_ident(mtd, 1, smartmedia ?
-		nand_smartmedia_flash_ids : nand_xd_flash_ids);
+	chip->flash_ids = smartmedia ? nand_smartmedia_flash_ids :
+				       nand_xd_flash_ids;
+	ret = nand_scan_ident(mtd, 1, NULL);
 
 	if (ret)
 		return ret;
-- 
2.14.1
