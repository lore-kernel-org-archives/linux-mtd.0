Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9PUR-00079f-7E
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 02:07:39 +0000
Received: by mail-pd0-f177.google.com with SMTP id p10so10217860pdj.36
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2014 19:07:12 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: mtdswap: fix integer overflow
Date: Mon, 21 Jul 2014 19:07:02 -0700
Message-Id: <1405994822-19376-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Caught by Coverity.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdswap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 8b33b26eb12b..8ca8d41bb35e 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1474,7 +1474,7 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	}
 
 	eblocks = mtd_div_by_eb(use_size, mtd);
-	use_size = eblocks * mtd->erasesize;
+	use_size = (uint64_t)eblocks * mtd->erasesize;
 	bad_blocks = mtdswap_badblocks(mtd, use_size);
 	eavailable = eblocks - bad_blocks;
 
-- 
1.9.1
