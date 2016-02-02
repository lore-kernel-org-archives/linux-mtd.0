Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm2-0002Y6-OU
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:33:00 +0000
Received: by mail-pa0-x242.google.com with SMTP id pv5so7920654pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:38 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 03/17] drivers:mtd:add dual plane page program support in
 partition layer
Date: Tue,  2 Feb 2016 02:30:38 +0000
Message-Id: <1454380252-16170-4-git-send-email-jackyard88@gmail.com>
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

This file patch is to add multi-plane page program function in MTD partition layer and
call back MTD master dual plane page program function.

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 drivers/mtd/mtdpart.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index cafdb88..85f68d0 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -203,6 +203,23 @@ static int part_write_oob(struct mtd_info *mtd, loff_t to,
 	return part->master->_write_oob(part->master, to + part->offset, ops);
 }
 
+static int part_write_dual_plane_oob(struct mtd_info *mtd, loff_t to_plane0,
+			    struct mtd_oob_ops *ops_plane0, loff_t to_plane1,
+			    struct mtd_oob_ops *ops_plane1)
+{
+	struct mtd_part *part = PART(mtd);
+
+	if ((to_plane0 >= mtd->size) || ((to_plane1 >= mtd->size)))
+		return -EINVAL;
+	if ((ops_plane0->datbuf && to_plane0 + ops_plane0->len > mtd->size) ||
+	    (ops_plane1->datbuf && to_plane1 + ops_plane0->len > mtd->size))
+		return -EINVAL;
+
+	return part->master->_dual_plane_write_oob(part->master,
+				to_plane0 + part->offset, ops_plane0,
+				to_plane1 + part->offset, ops_plane1);
+}
+
 static int part_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
@@ -409,6 +426,8 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 		slave->mtd._read_oob = part_read_oob;
 	if (master->_write_oob)
 		slave->mtd._write_oob = part_write_oob;
+	if (master->_dual_plane_write_oob)
+		slave->mtd._dual_plane_write_oob = part_write_dual_plane_oob;
 	if (master->_read_user_prot_reg)
 		slave->mtd._read_user_prot_reg = part_read_user_prot_reg;
 	if (master->_read_fact_prot_reg)
-- 
1.9.1
