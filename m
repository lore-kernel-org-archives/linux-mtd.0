Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1feJsM-0007jf-69
 for linux-mtd@lists.infradead.org; Sat, 14 Jul 2018 12:42:15 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: Fallback to ->_read/write() when ->_read/write_oob() is
 missing
Date: Sat, 14 Jul 2018 14:42:00 +0200
Message-Id: <20180714124200.17148-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some MTD sublayers/drivers are implementing ->_read/write() and
not ->_read/write_oob().

While for NAND devices both are usually valid, for NOR devices, using
the _oob variant has no real meaning. But, as the MTD layer is supposed
to hide as much as possible the flash complexity to the user, there is
no reason to error out while it is just a matter of rewritting things
internally.

Add a fallback on mtd->_read() (resp. mtd->_write()) when the user calls
mtd_read_oob() (resp. mtd_write_oob()) while mtd->_read_oob() (resp.
mtd->_write_oob) is not implemented. There is already a fallback on the
_oob variant if the former is used.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/mtdcore.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 42395df06be9..97ac219c082e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1155,21 +1155,29 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 {
 	int ret_code;
 	ops->retlen = ops->oobretlen = 0;
-	if (!mtd->_read_oob)
-		return -EOPNOTSUPP;
 
 	ret_code = mtd_check_oob_ops(mtd, from, ops);
 	if (ret_code)
 		return ret_code;
 
 	ledtrig_mtd_activity();
+
+	/* Check the validity of a potential fallback on mtd->_read */
+	if (!mtd->_read_oob && (!mtd->_read || ops->oobbuf))
+		return -EOPNOTSUPP;
+
+	if (mtd->_read_oob)
+		ret_code = mtd->_read_oob(mtd, from, ops);
+	else
+		ret_code = mtd->_read(mtd, from, ops->len, &ops->retlen,
+				      ops->datbuf);
+
 	/*
 	 * In cases where ops->datbuf != NULL, mtd->_read_oob() has semantics
 	 * similar to mtd->_read(), returning a non-negative integer
 	 * representing max bitflips. In other cases, mtd->_read_oob() may
 	 * return -EUCLEAN. In all cases, perform similar logic to mtd_read().
 	 */
-	ret_code = mtd->_read_oob(mtd, from, ops);
 	if (unlikely(ret_code < 0))
 		return ret_code;
 	if (mtd->ecc_strength == 0)
@@ -1184,8 +1192,7 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 	int ret;
 
 	ops->retlen = ops->oobretlen = 0;
-	if (!mtd->_write_oob)
-		return -EOPNOTSUPP;
+
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
 
@@ -1194,7 +1201,16 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 		return ret;
 
 	ledtrig_mtd_activity();
-	return mtd->_write_oob(mtd, to, ops);
+
+	/* Check the validity of a potential fallback on mtd->_write */
+	if (!mtd->_write_oob && (!mtd->_write || ops->oobbuf))
+		return -EOPNOTSUPP;
+
+	if (mtd->_write_oob)
+		return mtd->_write_oob(mtd, to, ops);
+	else
+		return mtd->_write(mtd, to, ops->len, &ops->retlen,
+				   ops->datbuf);
 }
 EXPORT_SYMBOL_GPL(mtd_write_oob);
 
-- 
2.14.1
