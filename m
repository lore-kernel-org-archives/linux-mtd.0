Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEBWm-0008Lt-6u
 for linux-mtd@lists.infradead.org; Mon, 13 Nov 2017 09:59:41 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] mtd: nand: hynix: Don't wait after applying new read-retry
 params
Date: Mon, 13 Nov 2017 10:59:01 +0100
Message-Id: <20171113095901.24971-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Setting read-retry parameters has no impact on the R/B pin, so waiting
for the chip to be ready is useless.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_hynix.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_hynix.c b/drivers/mtd/nand/nand_hynix.c
index 985751eda317..72d98cbff4ca 100644
--- a/drivers/mtd/nand/nand_hynix.c
+++ b/drivers/mtd/nand/nand_hynix.c
@@ -83,7 +83,6 @@ static int hynix_nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct hynix_nand *hynix = nand_get_manufacturer_data(chip);
 	const u8 *values;
-	int status;
 	int i;
 
 	values = hynix->read_retry->values +
@@ -112,10 +111,6 @@ static int hynix_nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
 	/* Apply the new settings. */
 	chip->cmdfunc(mtd, NAND_HYNIX_CMD_APPLY_PARAMS, -1, -1);
 
-	status = chip->waitfunc(mtd, chip);
-	if (status & NAND_STATUS_FAIL)
-		return -EIO;
-
 	return 0;
 }
 
-- 
2.11.0
