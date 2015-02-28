Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YReGd-0001Hm-IM
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:05:05 +0000
Received: by padfb1 with SMTP id fb1so29266107pad.8
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:04:41 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: fix spelling of REPLACEABLE
Date: Sat, 28 Feb 2015 02:04:18 -0800
Message-Id: <1425117858-23071-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
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
 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d4cec2f8a016..ff5652211607 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2124,7 +2124,7 @@ static int nand_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 
 
 /**
- * nand_write_subpage_hwecc - [REPLACABLE] hardware ECC based subpage write
+ * nand_write_subpage_hwecc - [REPLACEABLE] hardware ECC based subpage write
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @offset:	column address of subpage within the page
-- 
2.1.0
