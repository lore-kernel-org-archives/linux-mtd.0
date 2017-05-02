Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5LJm-0001OV-4m
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 00:05:27 +0000
Received: by mail-pf0-x243.google.com with SMTP id g23so29729071pfj.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 17:05:05 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH] mtd: nand: don't leak buffers when ->scan_bbt() fails
Date: Mon,  1 May 2017 17:04:50 -0700
Message-Id: <20170502000455.13240-1-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This bug seems to have been here forever, although we came close to
fixing all of them in [1]!

[1] 11eaf6df1cce ("mtd: nand: Remove BUG() abuse in nand_scan_tail")

Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
The goto isn't *really* necessary, but I thought it'd be more consistent.

Compile tested only

 drivers/mtd/nand/nand_base.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 978242b1213f..e4919f9dece4 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4794,7 +4794,11 @@ int nand_scan_tail(struct mtd_info *mtd)
 		return 0;
 
 	/* Build bad block table */
-	return chip->scan_bbt(mtd);
+	ret = chip->scan_bbt(mtd);
+	if (ret)
+		goto err_free;
+	return 0;
+
 err_free:
 	if (nbuf) {
 		kfree(nbuf->databuf);
-- 
2.13.0.rc1.294.g07d810a77f-goog
