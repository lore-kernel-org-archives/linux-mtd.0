Received: from serv1.kernkonzept.com ([88.99.87.17] helo=mx.kernkonzept.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dHoU6-00007O-8W
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 09:39:39 +0000
From: Matthias Lange <matthias.lange@kernkonzept.com>
To: han.xu@nxp.com, boris.brezillon@free-electrons.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org
Cc: Matthias Lange <matthias.lange@kernkonzept.com>
Subject: [PATCH] mtd: nand: gpmi: fix typo in comment
Date: Mon,  5 Jun 2017 11:34:38 +0200
Message-Id: <1496655278-3908-1-git-send-email-matthias.lange@kernkonzept.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Matthias Lange <matthias.lange@kernkonzept.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 141bd70..41f53ae 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -932,7 +932,7 @@ static int enable_edo_mode(struct gpmi_nand_data *this, int mode)
 
 	nand->select_chip(mtd, 0);
 
-	/* [1] send SET FEATURE commond to NAND */
+	/* [1] send SET FEATURE command to NAND */
 	feature[0] = mode;
 	ret = nand->onfi_set_features(mtd, nand,
 				ONFI_FEATURE_ADDR_TIMING_MODE, feature);
-- 
2.7.4
