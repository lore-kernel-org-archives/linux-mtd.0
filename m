Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V35D1-0005kO-9b
 for linux-mtd@lists.infradead.org; Sat, 27 Jul 2013 14:11:00 +0000
Received: by mail-pd0-f171.google.com with SMTP id y14so3883216pdi.16
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jul 2013 07:10:37 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: denali: use NAND_CI_CELLTYPE_MSK instead of hardcoded
 constant
Date: Sat, 27 Jul 2013 23:09:53 +0900
Message-Id: <1374934193-21236-1-git-send-email-akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Akinobu Mita <akinobu.mita@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use NAND_CI_CELLTYPE_MSK to extract the cell type from nand_chip.cellinfo
instead of hardcoded constant.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/denali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 0c8bb6b..2ed2bb3 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1520,7 +1520,7 @@ int denali_init(struct denali_nand_info *denali)
 	 * so just let controller do 15bit ECC for MLC and 8bit ECC for
 	 * SLC if possible.
 	 * */
-	if (denali->nand.cellinfo & 0xc &&
+	if (denali->nand.cellinfo & NAND_CI_CELLTYPE_MSK &&
 			(denali->mtd.oobsize > (denali->bbtskipbytes +
 			ECC_15BITS * (denali->mtd.writesize /
 			ECC_SECTOR_SIZE)))) {
-- 
1.8.3.1
