Received: from skprod3.natinst.com ([130.164.80.24] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1dcd-0008VK-PE
 for linux-mtd@lists.infradead.org; Tue, 01 Nov 2016 18:17:22 +0000
From: Zach Brown <zach.brown@ni.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <dedekind1@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/5] mtd: introduce function max_bad_blocks
Date: Tue, 1 Nov 2016 13:16:26 -0500
Message-ID: <1478024190-13713-2-git-send-email-zach.brown@ni.com>
In-Reply-To: <1478024190-13713-1-git-send-email-zach.brown@ni.com>
References: <1478024190-13713-1-git-send-email-zach.brown@ni.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jeff Westfahl <jeff.westfahl@ni.com>

If implemented, 'max_bad_blocks' returns the maximum number of bad
blocks to reserve for an MTD. An implementation for NAND is coming soon.

Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
Signed-off-by: Zach Brown <zach.brown@ni.com>
---
 drivers/mtd/mtdpart.c   | 13 +++++++++++++
 include/linux/mtd/mtd.h | 11 +++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index fccdd49..2106bd5 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -349,6 +349,16 @@ static const struct mtd_ooblayout_ops part_ooblayout_ops = {
 	.free = part_ooblayout_free,
 };
 
+static int part_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	struct mtd_part *part = mtd_to_part(mtd);
+
+	if ((len + ofs) > mtd->size)
+		return -EINVAL;
+	return part->master->_max_bad_blocks(part->master,
+					     ofs + part->offset, len);
+}
+
 static inline void free_partition(struct mtd_part *p)
 {
 	kfree(p->mtd.name);
@@ -481,6 +491,9 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	if (master->_put_device)
 		slave->mtd._put_device = part_put_device;
 
+	if (master->_max_bad_blocks)
+		slave->mtd._max_bad_blocks = part_max_bad_blocks;
+
 	slave->mtd._erase = part_erase;
 	slave->master = master;
 	slave->offset = part->offset;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 13f8052..c02d3c2 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -322,6 +322,7 @@ struct mtd_info {
 	int (*_block_isreserved) (struct mtd_info *mtd, loff_t ofs);
 	int (*_block_isbad) (struct mtd_info *mtd, loff_t ofs);
 	int (*_block_markbad) (struct mtd_info *mtd, loff_t ofs);
+	int (*_max_bad_blocks) (struct mtd_info *mtd, loff_t ofs, size_t len);
 	int (*_suspend) (struct mtd_info *mtd);
 	void (*_resume) (struct mtd_info *mtd);
 	void (*_reboot) (struct mtd_info *mtd);
@@ -402,6 +403,16 @@ int mtd_wunit_to_pairing_info(struct mtd_info *mtd, int wunit,
 int mtd_pairing_info_to_wunit(struct mtd_info *mtd,
 			      const struct mtd_pairing_info *info);
 int mtd_pairing_groups(struct mtd_info *mtd);
+
+static inline int mtd_max_bad_blocks(struct mtd_info *mtd,
+				     loff_t ofs, size_t len)
+{
+	if (mtd->_max_bad_blocks)
+		return mtd->_max_bad_blocks(mtd, ofs, len);
+
+	return -ENOTSUPP;
+}
+
 int mtd_erase(struct mtd_info *mtd, struct erase_info *instr);
 int mtd_point(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	      void **virt, resource_size_t *phys);
-- 
2.7.4
