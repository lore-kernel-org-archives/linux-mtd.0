Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRePl-0007yx-Cn
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:14:30 +0000
Received: by pdbnh10 with SMTP id nh10so3423869pdb.3
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:14:08 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/5] mtd: nand_bbt: make nand_scan_bbt() static
Date: Sat, 28 Feb 2015 02:13:11 -0800
Message-Id: <1425118393-25179-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425118393-25179-1-git-send-email-computersforpeace@gmail.com>
References: <1425118393-25179-1-git-send-email-computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This implementation detail is no longer needed outside of nand_bbt.c.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c | 2 +-
 include/linux/mtd/nand.h    | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 307a285afb78..53e17586fbed 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1074,7 +1074,7 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
  * The bad block table memory is allocated here. It must be freed by calling
  * the nand_free_bbt function.
  */
-int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
+static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
 	struct nand_chip *this = mtd->priv;
 	int len, res = 0;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3d4ea7eb2b68..6c51876941f3 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -833,7 +833,6 @@ struct nand_manufacturers {
 extern struct nand_flash_dev nand_flash_ids[];
 extern struct nand_manufacturers nand_manuf_ids[];
 
-extern int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd);
 extern int nand_default_bbt(struct mtd_info *mtd);
 extern int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
 extern int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
-- 
2.1.0
