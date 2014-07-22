Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9PV3-0007vu-Rr
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 02:08:18 +0000
Received: by mail-pa0-f50.google.com with SMTP id et14so10955398pad.37
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2014 19:07:56 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nandsim: fix integer widening
Date: Mon, 21 Jul 2014 19:07:44 -0700
Message-Id: <1405994864-19532-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This multiplication should be done in 64-bit, not 32-bit.

Caught by Coverity.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nandsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 4f0d83648e5a..7dc1dd28d896 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -827,7 +827,7 @@ static int parse_badblocks(struct nandsim *ns, struct mtd_info *mtd)
 			NS_ERR("invalid badblocks.\n");
 			return -EINVAL;
 		}
-		offset = erase_block_no * ns->geom.secsz;
+		offset = (loff_t)erase_block_no * ns->geom.secsz;
 		if (mtd_block_markbad(mtd, offset)) {
 			NS_ERR("invalid badblocks.\n");
 			return -EINVAL;
-- 
1.9.1
