Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJHTL-0006fk-QT
 for linux-mtd@lists.infradead.org; Fri, 09 Jun 2017 10:48:57 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Pavel Machek <pavel@ucw.cz>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: fsl_ifc: remove unused variable
Date: Fri,  9 Jun 2017 12:47:43 +0200
Message-Id: <20170609104829.3488073-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This one was accidentally introduced without any references,
and it causes a harmless warning:

drivers/mtd/nand/fsl_ifc_nand.c: In function 'fsl_ifc_read_page':
drivers/mtd/nand/fsl_ifc_nand.c:696:7: error: unused variable 'res' [-Werror=unused-variable]

Fixes: 79f40cc12fd3 ("mtd: nand: fsl_ifc: fix handing of bit flips in erased pages")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/nand/fsl_ifc_nand.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 14ef2f4524ac..d1c4538f870f 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -693,8 +693,6 @@ static int fsl_ifc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 		fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
 
 	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER) {
-		int res;
-
 		if (!oob_required)
 			fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
 
-- 
2.9.0
