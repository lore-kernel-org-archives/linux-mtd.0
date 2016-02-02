Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm1-0002Y1-0P
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:32:59 +0000
Received: by mail-pf0-x242.google.com with SMTP id 65so8259687pfd.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:37 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 02/17] include:mtd:add multi-plane program in mtd_info
Date: Tue,  2 Feb 2016 02:30:37 +0000
Message-Id: <1454380252-16170-3-git-send-email-jackyard88@gmail.com>
In-Reply-To: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
References: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bean Huo <beanhuo@micron.com>

This patch file is to add support for multi-plane page program hook in mtd_info,
callback this in one new inline function mtd_write_dual_plane_oob.

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 include/linux/mtd/mtd.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f17fa75..cfcb3a68 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -204,6 +204,9 @@ struct mtd_info {
 			  struct mtd_oob_ops *ops);
 	int (*_write_oob) (struct mtd_info *mtd, loff_t to,
 			   struct mtd_oob_ops *ops);
+	int (*_dual_plane_write_oob) (struct mtd_info *mtd, loff_t to_plane0,
+			struct mtd_oob_ops *ops_plane0, loff_t to_plane1,
+					struct mtd_oob_ops *ops_plane1);
 	int (*_get_fact_prot_info) (struct mtd_info *mtd, size_t len,
 				    size_t *retlen, struct otp_info *buf);
 	int (*_read_fact_prot_reg) (struct mtd_info *mtd, loff_t from,
@@ -280,6 +283,22 @@ static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 	return mtd->_write_oob(mtd, to, ops);
 }
 
+static inline int mtd_write_dual_plane_oob(struct mtd_info *mtd,
+		loff_t to_plane0, struct mtd_oob_ops *ops0, loff_t to_plane1,
+						struct mtd_oob_ops *ops1)
+{
+	ops0->retlen = ops0->oobretlen = 0;
+	ops1->retlen = ops1->oobretlen = 0;
+
+	if (!mtd->_dual_plane_write_oob)
+		return -EOPNOTSUPP;
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
+
+	return mtd->_dual_plane_write_oob(mtd, to_plane0, ops0,
+						to_plane1, ops1);
+}
+
 int mtd_get_fact_prot_info(struct mtd_info *mtd, size_t len, size_t *retlen,
 			   struct otp_info *buf);
 int mtd_read_fact_prot_reg(struct mtd_info *mtd, loff_t from, size_t len,
-- 
1.9.1
