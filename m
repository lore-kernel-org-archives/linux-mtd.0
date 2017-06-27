Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dPw4f-0002Vu-H3
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 19:22:59 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH 1/2] mtd: Add sanity checks in mtd_write/read_oob()
Date: Tue, 27 Jun 2017 21:22:21 +0200
Message-Id: <20170627192222.13716-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Unlike what's done in mtd_read/write(), there are no checks to make sure
the parameters passed to mtd_read/write_oob() are consistent, which
forces implementers of ->_read/write_oob() to do it, which in turn leads
to code duplication and possibly errors in the logic.

Do general sanity checks, like ops fields consistency and range checking.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Peter Pan <peterpandong@micron.com>
---
Hi Peter,

This patch is meant to replace
https://patchwork.ozlabs.org/patch/766337/. Note that I changed my mind
regarding the "do not fix inconsistent ->ooblen/oobuf and ->len/datbuf
and return an error" solution. It seems that all users assume that
->datbuf = NULL implies ->len = 0 and ->oobbuf = NULL implies ->ooblen =
0, so I decided to silently fix ->[oob]len and ->dat/oobbuf mismatch in
the mtd_check_oob_ops() helper instead.

Regards,

Boris
---
 drivers/mtd/mtdcore.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e02ccdbdcdf1..c83b407cbe15 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1107,6 +1107,39 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 }
 EXPORT_SYMBOL_GPL(mtd_panic_write);
 
+static int mtd_check_oob_ops(struct mtd_info *mtd, loff_t offs,
+			     struct mtd_oob_ops *ops)
+{
+	/*
+	 * Some users are setting ->datbuf or ->oobbuf to NULL, but are leaving
+	 * ->len or ->ooblen uninitialized. Force ->len and ->ooblen to 0 in
+	 *  this case.
+	 */
+	if (!ops->datbuf)
+		ops->len = 0;
+
+	if (!ops->oobbuf)
+		ops->ooblen = 0;
+
+	if (offs < 0 || offs + ops->len >= mtd->size)
+		return -EINVAL;
+
+	if (ops->ooblen) {
+		u64 maxooblen;
+
+		if (ops->ooboffs >= mtd_oobavail(mtd, ops))
+			return -EINVAL;
+
+		maxooblen = ((mtd_div_by_ws(mtd->size, mtd) -
+			      mtd_div_by_ws(offs, mtd)) *
+			     mtd_oobavail(mtd, ops)) - ops->ooboffs;
+		if (ops->ooblen > maxooblen)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 {
 	int ret_code;
@@ -1114,6 +1147,10 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 	if (!mtd->_read_oob)
 		return -EOPNOTSUPP;
 
+	ret_code = mtd_check_oob_ops(mtd, from, ops);
+	if (ret_code)
+		return ret_code;
+
 	ledtrig_mtd_activity();
 	/*
 	 * In cases where ops->datbuf != NULL, mtd->_read_oob() has semantics
@@ -1133,11 +1170,18 @@ EXPORT_SYMBOL_GPL(mtd_read_oob);
 int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 				struct mtd_oob_ops *ops)
 {
+	int ret;
+
 	ops->retlen = ops->oobretlen = 0;
 	if (!mtd->_write_oob)
 		return -EOPNOTSUPP;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
+
+	ret = mtd_check_oob_ops(mtd, to, ops);
+	if (ret)
+		return ret;
+
 	ledtrig_mtd_activity();
 	return mtd->_write_oob(mtd, to, ops);
 }
-- 
2.11.0
