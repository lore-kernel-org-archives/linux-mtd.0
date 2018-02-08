Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejvh0-0006gQ-H9
 for linux-mtd@lists.infradead.org; Thu, 08 Feb 2018 23:33:28 +0000
From: Stefan Agner <stefan@agner.ch>
To: boris.brezillon@free-electrons.com
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, Stefan Agner <stefan@agner.ch>
Subject: [PATCH] mtd: nand: warn if hamming layout is used with too large ECC
Date: Fri,  9 Feb 2018 00:33:05 +0100
Message-Id: <20180208233305.20583-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Warn in case a driver uses too large ECC with hamming layout.
This is especially helpful since hamming layout is the default
layout when using hardware ECC and no specific OOB layout is
specified.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/mtd/nand/nand_base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 96c97588e1ba..2f3f43d0e288 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -197,6 +197,8 @@ static int nand_ooblayout_free_lp_hamming(struct mtd_info *mtd, int section,
 		return -EINVAL;
 	}
 
+	WARN_ON(mtd->oobsize - ecc_offset < ecc->total);
+
 	if (section == 0) {
 		oobregion->offset = 2;
 		oobregion->length = ecc_offset - 2;
-- 
2.16.1
