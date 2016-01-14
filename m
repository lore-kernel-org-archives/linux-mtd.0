Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJj9P-0001ib-NT
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2016 14:45:27 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 1/3] mtd: nand: remove EXPORT_SYMBOL of nand_scan_bbt()
Date: Thu, 14 Jan 2016 15:44:49 +0100
Message-Id: <1452782691-5193-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since commit 17799359e7b3fa6ef4f2bf926cd6821cf7903ecf ("mtd: nand_bbt:
make nand_scan_bbt() static"), the nand_scan_bbt() function is marked
as static but is still exported using EXPORT_SYMBOL(), which doesn't
make much sense.

This commit gets rid of the useless EXPORT_SYMBOL.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/nand_bbt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index b1d4f81..4dfaf93 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1373,5 +1373,3 @@ int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
 
 	return ret;
 }
-
-EXPORT_SYMBOL(nand_scan_bbt);
-- 
2.6.4
