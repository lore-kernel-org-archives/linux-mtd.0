Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cR28W-0007nw-9t
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 19:31:14 +0000
From: Zach Brown <zach.brown@ni.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <dedekind1@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 1/5] mtd: introduce function max_bad_blocks
Date: Tue, 10 Jan 2017 13:30:17 -0600
Message-ID: <1484076621-7789-2-git-send-email-zach.brown@ni.com>
In-Reply-To: <1484076621-7789-1-git-send-email-zach.brown@ni.com>
References: <1484076621-7789-1-git-send-email-zach.brown@ni.com>
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
blocks to reserve for a MTD. An implementation for NAND is coming soon.

Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
Signed-off-by: Zach Brown <zach.brown@ni.com>
Acked-by: Boris Brezillon <boris.brezillon@free-electron.com>
Acked-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdpart.c   | 10 ++++++++++
 include/linux/mtd/mtd.h | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index fccdd49..08925bb 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -349,6 +349,14 @@ static const struct mtd_ooblayout_ops part_ooblayout_ops = {
 	.free = part_ooblayout_free,
 };
 
+static int part_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	struct mtd_part *part = mtd_to_part(mtd);
+
+	return part->master->_max_bad_blocks(part->master,
+					     ofs + part->offset, len);
+}
+
 static inline void free_partition(struct mtd_part *p)
 {
 	kfree(p->mtd.name);
@@ -475,6 +483,8 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 		slave->mtd._block_isbad = part_block_isbad;
 	if (master->_block_markbad)
 		slave->mtd._block_markbad = part_block_markbad;
+	if (master->_max_bad_blocks)
+		slave->mtd._max_bad_blocks = part_max_bad_blocks;
 
 	if (master->_get_device)
 		slave->mtd._get_device = part_get_device;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 13f8052..5bb42c6 100644
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
@@ -397,6 +398,18 @@ static inline int mtd_oobavail(struct mtd_info *mtd, struct mtd_oob_ops *ops)
 	return ops->mode == MTD_OPS_AUTO_OOB ? mtd->oobavail : mtd->oobsize;
 }
 
+static inline int mtd_max_bad_blocks(struct mtd_info *mtd,
+				     loff_t ofs, size_t len)
+{
+	if (!mtd->_max_bad_blocks)
+		return -ENOTSUPP;
+
+	if (mtd->size < (len + ofs) || ofs < 0)
+		return -EINVAL;
+
+	return mtd->_max_bad_blocks(mtd, ofs, len);
+}
+
 int mtd_wunit_to_pairing_info(struct mtd_info *mtd, int wunit,
 			      struct mtd_pairing_info *info);
 int mtd_pairing_info_to_wunit(struct mtd_info *mtd,
-- 
2.7.4
