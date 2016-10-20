Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxEov-00017d-Lo
 for linux-mtd@lists.infradead.org; Thu, 20 Oct 2016 14:59:51 +0000
From: Zach Brown <zach.brown@ni.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <dedekind1@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] mtd: introduce function max_bad_blocks
Date: Thu, 20 Oct 2016 09:58:56 -0500
Message-ID: <1476975538-19051-2-git-send-email-zach.brown@ni.com>
In-Reply-To: <1476975538-19051-1-git-send-email-zach.brown@ni.com>
References: <1476975538-19051-1-git-send-email-zach.brown@ni.com>
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
 drivers/mtd/mtdpart.c   | 12 ++++++++++++
 include/linux/mtd/mtd.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index c1f34f0..65d3563 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -350,6 +350,16 @@ static const struct mtd_ooblayout_ops part_ooblayout_ops = {
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
@@ -482,6 +492,8 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	if (master->_put_device)
 		slave->mtd._put_device = part_put_device;
 
+	if (master->_max_bad_blocks)
+		slave->mtd._max_bad_blocks = part_max_bad_blocks;
 	slave->mtd._erase = part_erase;
 	slave->master = master;
 	slave->offset = part->offset;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 13f8052..bd277eb 100644
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
-- 
2.7.4
