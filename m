Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dPCC0-00084l-BP
 for linux-mtd@lists.infradead.org; Sun, 25 Jun 2017 18:23:30 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Fix check in mtd_unpoint()
Date: Sun, 25 Jun 2017 20:22:57 +0200
Message-Id: <20170625182257.20867-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The code checks that ->_point is not NULL, but we should actually check
->_unpoint value which is dereferenced a few lines after the check.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
Found while checking that nobody except the core was directly calling
->_xxx().
Note that I didn't had a Fixes tag because it's hard to tell when
mtd_point() was introduced (code has been moved from mtd.h to mtdcore.c
in commit 8273a0c911d8 "mtd: add offset and length checks to the API
function"), and all drivers implementing ->_point() also implement
->_unpoint (the only exception being drivers/mtd/maps/uclinux.c).
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e214af82b9be..e02ccdbdcdf1 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -991,7 +991,7 @@ EXPORT_SYMBOL_GPL(mtd_point);
 /* We probably shouldn't allow XIP if the unpoint isn't a NULL */
 int mtd_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
-	if (!mtd->_point)
+	if (!mtd->_unpoint)
 		return -EOPNOTSUPP;
 	if (from < 0 || from >= mtd->size || len > mtd->size - from)
 		return -EINVAL;
-- 
2.11.0
