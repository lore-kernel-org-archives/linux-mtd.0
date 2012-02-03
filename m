Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtFgb-0006KO-Iu
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 09:44:06 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/4] mtd: mtdconcat: return -EOPNOTSUPP if block_markbad is
 undefined
Date: Fri,  3 Feb 2012 11:44:04 +0200
Message-Id: <1328262247-11391-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The main 'mtd_block_markbad()' function returns -EOPNOTSUPP if the
'->block_markbad' method is undefined, and mtdconcat should do the same.
Fix this by simply removing the 'mtd_can_have_bb()' because it is  not
really necessary. It could be treated as an optimization, but this function is
expected to be used so rarely that it does not matter.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdconcat.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 5c7eb69..d826a8a 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -673,9 +673,6 @@ static int concat_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	struct mtd_concat *concat = CONCAT(mtd);
 	int i, err = -EINVAL;
 
-	if (!mtd_can_have_bb(concat->subdev[0]))
-		return 0;
-
 	if (ofs > mtd->size)
 		return -EINVAL;
 
-- 
1.7.9
