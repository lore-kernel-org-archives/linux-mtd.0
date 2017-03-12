Received: from mail.base45.de ([2001:67c:2050:310::a:2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cn9iD-0001bt-PS
 for linux-mtd@lists.infradead.org; Sun, 12 Mar 2017 20:03:33 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Alexander Couzens <lynxis@fe80.eu>
Subject: [PATCH] nand_base: fix regression on nand with 64/128 oob size
Date: Sun, 12 Mar 2017 21:02:32 +0100
Message-Id: <20170312200232.19269-1-lynxis@fe80.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

41b207a70d3a accidently changed the oob layout for nand when ECC doesn't use
the full available ecc reserved data.
This only affects controllers which use the default large page ops
nand_ooblayout_ecc_lp.

E.g. for davinci:
- nand has 2048 byte page, 64 byte oob
- 3 byte ecc every 512 byte using 1bit hw ecc
- requires 12 byte of oob space for ecc
- old layout reserved 24 byte based on 64 byte oob

Old layout started using byte from offset 40 while new layout
uses the last X bytes so it fits into the end of oob.
Meaning in this example the old layout uses byte 40-51, while
the new layout use byte 52-63.

Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
---
 drivers/mtd/nand/nand_base.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b0524f8accb6..ba88345fd334 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -112,8 +112,25 @@ static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
 	if (section)
 		return -ERANGE;
 
+	/* to be compatible with previous layouts
+	 * 64 byte oob must have ecc data at byte 40,
+	 * 128 byte oob must have ecc data at byte 80 */
+	switch (mtd->oobsize) {
+	case 64:
+		oobregion->offset = 40;
+		break;
+	case 128:
+		oobregion->offset = 80;
+		break;
+	default:
+		oobregion->offset = mtd->oobsize - oobregion->length;
+		break;
+	}
+
 	oobregion->length = ecc->total;
-	oobregion->offset = mtd->oobsize - oobregion->length;
+	if (oobregion->offset + oobregion->length > mtd->oobsize) {
+		return -ERANGE;
+	}
 
 	return 0;
 }
-- 
2.12.0
