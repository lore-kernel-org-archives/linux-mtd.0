Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZz56-0000X4-G6
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 14:13:47 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: Implement mtd_{read,
 write}() as wrappers around mtd_{read, write}_oob()
Date: Thu, 20 Dec 2018 15:13:20 +0100
Message-Id: <20181220141320.32226-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_{read,write}_oob() already take care of checking the params and
calling ->_{read,write}() or  ->_{read,write}_oob() based on the
request and the operations supported by the MTD device.
No need to duplicate the logic, we can simply implement
mtd_{read,write}() as wrappers around mtd_{read,write}_oob().

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/mtdcore.c | 75 ++++++++++++++-----------------------------
 1 file changed, 24 insertions(+), 51 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b6b93291aba9..b2e258e48e54 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -514,6 +514,14 @@ int add_mtd_device(struct mtd_info *mtd)
 
 	BUG_ON(mtd->writesize == 0);
 
+	/*
+	 * MTD drivers should implement ->_{write,read}() or
+	 * ->_{write,read}_oob(), but not both.
+	 */
+	if (WARN_ON((mtd->_write && mtd->_write_oob) ||
+		    (mtd->_read && mtd->_read_oob)))
+		return -EINVAL;
+
 	if (WARN_ON((!mtd->erasesize || !mtd->_erase) &&
 		    !(mtd->flags & MTD_NO_ERASE)))
 		return -EINVAL;
@@ -1033,67 +1041,32 @@ EXPORT_SYMBOL_GPL(mtd_get_unmapped_area);
 int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	     u_char *buf)
 {
-	int ret_code;
-	*retlen = 0;
-	if (from < 0 || from >= mtd->size || len > mtd->size - from)
-		return -EINVAL;
-	if (!len)
-		return 0;
+	struct mtd_oob_ops ops = {
+		.len = len,
+		.datbuf = buf,
+	};
+	int ret;
 
-	ledtrig_mtd_activity();
-	/*
-	 * In the absence of an error, drivers return a non-negative integer
-	 * representing the maximum number of bitflips that were corrected on
-	 * any one ecc region (if applicable; zero otherwise).
-	 */
-	if (mtd->_read) {
-		ret_code = mtd->_read(mtd, from, len, retlen, buf);
-	} else if (mtd->_read_oob) {
-		struct mtd_oob_ops ops = {
-			.len = len,
-			.datbuf = buf,
-		};
+	ret = mtd_read_oob(mtd, from, &ops);
+	*retlen = ops.retlen;
 
-		ret_code = mtd->_read_oob(mtd, from, &ops);
-		*retlen = ops.retlen;
-	} else {
-		return -ENOTSUPP;
-	}
-
-	if (unlikely(ret_code < 0))
-		return ret_code;
-	if (mtd->ecc_strength == 0)
-		return 0;	/* device lacks ecc */
-	return ret_code >= mtd->bitflip_threshold ? -EUCLEAN : 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_read);
 
 int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 	      const u_char *buf)
 {
-	*retlen = 0;
-	if (to < 0 || to >= mtd->size || len > mtd->size - to)
-		return -EINVAL;
-	if ((!mtd->_write && !mtd->_write_oob) ||
-	    !(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
-	if (!len)
-		return 0;
-	ledtrig_mtd_activity();
+	struct mtd_oob_ops ops = {
+		.len = len,
+		.datbuf = (u8 *)buf,
+	};
+	int ret;
 
-	if (!mtd->_write) {
-		struct mtd_oob_ops ops = {
-			.len = len,
-			.datbuf = (u8 *)buf,
-		};
-		int ret;
+	ret = mtd_write_oob(mtd, to, &ops);
+	*retlen = ops.retlen;
 
-		ret = mtd->_write_oob(mtd, to, &ops);
-		*retlen = ops.retlen;
-		return ret;
-	}
-
-	return mtd->_write(mtd, to, len, retlen, buf);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_write);
 
-- 
2.17.1
