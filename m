Received: from mail-pf0-x22d.google.com ([2607:f8b0:400e:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayimS-0003gS-F1
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 16:39:08 +0000
Received: by mail-pf0-x22d.google.com with SMTP id c189so53071903pfb.3
 for <linux-mtd@lists.infradead.org>; Fri, 06 May 2016 09:38:48 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand_bch: fix spelling of "probably"
Date: Fri,  6 May 2016 09:38:41 -0700
Message-Id: <1462552721-93132-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_bch.c b/drivers/mtd/nand/nand_bch.c
index 28ef7b178eac..44763f87eae4 100644
--- a/drivers/mtd/nand/nand_bch.c
+++ b/drivers/mtd/nand/nand_bch.c
@@ -175,7 +175,7 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 	 * which is called by mtd_ooblayout_count_eccbytes().
 	 * Make sure they are properly initialized before calling
 	 * mtd_ooblayout_count_eccbytes().
-	 * FIXME: we should probaly rework the sequencing in nand_scan_tail()
+	 * FIXME: we should probably rework the sequencing in nand_scan_tail()
 	 * to avoid setting those fields twice.
 	 */
 	nand->ecc.steps = eccsteps;
-- 
2.8.0.rc3.226.g39d4020
