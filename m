Received: from emh03.mail.saunalahti.fi ([62.142.5.109])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXBC7-0007b9-9T
 for linux-mtd@lists.infradead.org; Sat, 20 Feb 2016 17:19:48 +0000
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH] mtd: onenand: fix deadlock in onenand_block_markbad
Date: Sat, 20 Feb 2016 19:19:09 +0200
Message-Id: <1455988749-14563-1-git-send-email-aaro.koskinen@iki.fi>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 5942ddbc500d ("mtd: introduce mtd_block_markbad interface")
incorrectly changed onenand_block_markbad() to call mtd_block_markbad
instead of onenand_chip's block_markbad function. As a result the function
will now recurse and deadlock. Fix by reverting the change.

Fixes: 5942ddbc500d ("mtd: introduce mtd_block_markbad interface")
Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 drivers/mtd/onenand/onenand_base.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 43b3392..5bd3da5 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2599,6 +2599,7 @@ static int onenand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
  */
 static int onenand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
+	struct onenand_chip *this = mtd->priv;
 	int ret;
 
 	ret = onenand_block_isbad(mtd, ofs);
@@ -2610,7 +2611,7 @@ static int onenand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	}
 
 	onenand_get_device(mtd, FL_WRITING);
-	ret = mtd_block_markbad(mtd, ofs);
+	this->block_markbad(mtd, ofs);
 	onenand_release_device(mtd);
 	return ret;
 }
-- 
2.4.0
