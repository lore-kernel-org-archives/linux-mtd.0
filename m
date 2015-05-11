From: Ben Shelton <ben.shelton@ni.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com, richard@nod.at
Subject: [PATCH 1/3] mtd: introduce function max_bad_blocks
Date: Mon, 11 May 2015 10:19:54 -0500
Message-Id: <1431357596-29959-2-git-send-email-ben.shelton@ni.com>
In-Reply-To: <1431357596-29959-1-git-send-email-ben.shelton@ni.com>
References: <1431357596-29959-1-git-send-email-ben.shelton@ni.com>
Cc: Jeff Westfahl <jeff.westfahl@ni.com>
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
blocks to reserve for an MTD.

Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
---
 drivers/mtd/mtdpart.c   | 12 ++++++++++++
 include/linux/mtd/mtd.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index cafdb88..d252df9 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -317,6 +317,16 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	return res;
 }
 
+static int part_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	struct mtd_part *part = PART(mtd);
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
@@ -442,6 +452,8 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 		slave->mtd._block_isbad = part_block_isbad;
 	if (master->_block_markbad)
 		slave->mtd._block_markbad = part_block_markbad;
+	if (master->_max_bad_blocks)
+		slave->mtd._max_bad_blocks = part_max_bad_blocks;
 	slave->mtd._erase = part_erase;
 	slave->master = master;
 	slave->offset = part->offset;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f17fa75..ba607c2 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -225,6 +225,7 @@ struct mtd_info {
 	int (*_block_isreserved) (struct mtd_info *mtd, loff_t ofs);
 	int (*_block_isbad) (struct mtd_info *mtd, loff_t ofs);
 	int (*_block_markbad) (struct mtd_info *mtd, loff_t ofs);
+	int (*_max_bad_blocks) (struct mtd_info *mtd, loff_t ofs, size_t len);
 	int (*_suspend) (struct mtd_info *mtd);
 	void (*_resume) (struct mtd_info *mtd);
 	void (*_reboot) (struct mtd_info *mtd);
-- 
2.4.0
