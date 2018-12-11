Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWm44-0001A8-J3
 for linux-mtd@lists.infradead.org; Tue, 11 Dec 2018 17:43:28 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: implement proper partition handling
Date: Tue, 11 Dec 2018 18:43:02 +0100
Message-Id: <20181211174302.9913-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of collecting partitions in a flat list, create a hierarchy
within the mtd_info structure: use a partitions list to keep track of
the partitions of an MTD device (which might be itself a partition of
another MTD device), a pointer to the parent device (NULL when the MTD
device is the root one, not a partition).

By also saving directly in mtd_info the offset of the partition, we
can get rid of the mtd_part structure.

While at it, be consistent in the naming of the mtd_info structures to
easy the understanding of the new hierarchy: these structures are
usually called 'mtd', unless there are multiple instances of the same
structure. In this case, there is usually a parent/child bound so we
will call them 'parent' and 'child'.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/mtdcore.c          |   2 +
 drivers/mtd/mtdpart.c          | 516 ++++++++++++++-------------------
 include/linux/mtd/mtd.h        |  32 ++
 include/linux/mtd/partitions.h |   1 -
 4 files changed, 259 insertions(+), 292 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 97ac219c082e..6dad2b70ea15 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -665,6 +665,8 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 	} else {
 		pr_debug("mtd device won't show a device symlink in sysfs\n");
 	}
+
+	INIT_LIST_HEAD(&mtd->partitions);
 }
 
 /**
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 99c460facd5e..7afc7f7f1199 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -34,34 +34,8 @@
 
 #include "mtdcore.h"
 
-/* Our partition linked list */
-static LIST_HEAD(mtd_partitions);
 static DEFINE_MUTEX(mtd_partitions_mutex);
 
-/**
- * struct mtd_part - our partition node structure
- *
- * @mtd: struct holding partition details
- * @parent: parent mtd - flash device or another partition
- * @offset: partition offset relative to the *flash device*
- */
-struct mtd_part {
-	struct mtd_info mtd;
-	struct mtd_info *parent;
-	uint64_t offset;
-	struct list_head list;
-};
-
-/*
- * Given a pointer to the MTD object in the mtd_part structure, we can retrieve
- * the pointer to that structure.
- */
-static inline struct mtd_part *mtd_to_part(const struct mtd_info *mtd)
-{
-	return container_of(mtd, struct mtd_part, mtd);
-}
-
-
 /*
  * MTD methods which simply translate the effective address and pass through
  * to the _real_ device.
@@ -70,206 +44,177 @@ static inline struct mtd_part *mtd_to_part(const struct mtd_info *mtd)
 static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
 	struct mtd_ecc_stats stats;
 	int res;
 
-	stats = part->parent->ecc_stats;
-	res = part->parent->_read(part->parent, from + part->offset, len,
-				  retlen, buf);
+	stats = mtd->parent->ecc_stats;
+	res = mtd->parent->_read(mtd->parent, from + mtd->offset, len,
+				 retlen, buf);
 	if (unlikely(mtd_is_eccerr(res)))
 		mtd->ecc_stats.failed +=
-			part->parent->ecc_stats.failed - stats.failed;
+			mtd->parent->ecc_stats.failed - stats.failed;
 	else
 		mtd->ecc_stats.corrected +=
-			part->parent->ecc_stats.corrected - stats.corrected;
+			mtd->parent->ecc_stats.corrected - stats.corrected;
 	return res;
 }
 
 static int part_point(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, void **virt, resource_size_t *phys)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-
-	return part->parent->_point(part->parent, from + part->offset, len,
-				    retlen, virt, phys);
+	return mtd->parent->_point(mtd->parent, from + mtd->offset, len,
+				   retlen, virt, phys);
 }
 
 static int part_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-
-	return part->parent->_unpoint(part->parent, from + part->offset, len);
+	return mtd->parent->_unpoint(mtd->parent, from + mtd->offset, len);
 }
 
 static int part_read_oob(struct mtd_info *mtd, loff_t from,
 		struct mtd_oob_ops *ops)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
 	struct mtd_ecc_stats stats;
 	int res;
 
-	stats = part->parent->ecc_stats;
-	res = part->parent->_read_oob(part->parent, from + part->offset, ops);
+	stats = mtd->parent->ecc_stats;
+	res = mtd->parent->_read_oob(mtd->parent, from + mtd->offset, ops);
 	if (unlikely(mtd_is_eccerr(res)))
 		mtd->ecc_stats.failed +=
-			part->parent->ecc_stats.failed - stats.failed;
+			mtd->parent->ecc_stats.failed - stats.failed;
 	else
 		mtd->ecc_stats.corrected +=
-			part->parent->ecc_stats.corrected - stats.corrected;
+			mtd->parent->ecc_stats.corrected - stats.corrected;
 	return res;
 }
 
 static int part_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_read_user_prot_reg(part->parent, from, len,
-						 retlen, buf);
+	return mtd->parent->_read_user_prot_reg(mtd->parent, from, len, retlen,
+						buf);
 }
 
 static int part_get_user_prot_info(struct mtd_info *mtd, size_t len,
 				   size_t *retlen, struct otp_info *buf)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_get_user_prot_info(part->parent, len, retlen,
-						 buf);
+	return mtd->parent->_get_user_prot_info(mtd->parent, len, retlen, buf);
 }
 
 static int part_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_read_fact_prot_reg(part->parent, from, len,
-						 retlen, buf);
+	return mtd->parent->_read_fact_prot_reg(mtd->parent, from, len,	retlen,
+						buf);
 }
 
 static int part_get_fact_prot_info(struct mtd_info *mtd, size_t len,
 				   size_t *retlen, struct otp_info *buf)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_get_fact_prot_info(part->parent, len, retlen,
-						 buf);
+	return mtd->parent->_get_fact_prot_info(mtd->parent, len, retlen, buf);
 }
 
 static int part_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_write(part->parent, to + part->offset, len,
-				    retlen, buf);
+	return mtd->parent->_write(mtd->parent, to + mtd->offset, len, retlen,
+				   buf);
 }
 
 static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_panic_write(part->parent, to + part->offset, len,
-					  retlen, buf);
+	return mtd->parent->_panic_write(mtd->parent, to + mtd->offset, len,
+					 retlen, buf);
 }
 
 static int part_write_oob(struct mtd_info *mtd, loff_t to,
 		struct mtd_oob_ops *ops)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-
-	return part->parent->_write_oob(part->parent, to + part->offset, ops);
+	return mtd->parent->_write_oob(mtd->parent, to + mtd->offset, ops);
 }
 
 static int part_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_write_user_prot_reg(part->parent, from, len,
-						  retlen, buf);
+	return mtd->parent->_write_user_prot_reg(mtd->parent, from, len,
+						 retlen, buf);
 }
 
 static int part_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_lock_user_prot_reg(part->parent, from, len);
+	return mtd->parent->_lock_user_prot_reg(mtd->parent, from, len);
 }
 
 static int part_writev(struct mtd_info *mtd, const struct kvec *vecs,
 		unsigned long count, loff_t to, size_t *retlen)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_writev(part->parent, vecs, count,
-				     to + part->offset, retlen);
+	return mtd->parent->_writev(mtd->parent, vecs, count,
+				    to + mtd->offset, retlen);
 }
 
 static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
 	int ret;
 
-	instr->addr += part->offset;
-	ret = part->parent->_erase(part->parent, instr);
+	instr->addr += mtd->offset;
+	ret = mtd->parent->_erase(mtd->parent, instr);
 	if (instr->fail_addr != MTD_FAIL_ADDR_UNKNOWN)
-		instr->fail_addr -= part->offset;
-	instr->addr -= part->offset;
+		instr->fail_addr -= mtd->offset;
+	instr->addr -= mtd->offset;
 
 	return ret;
 }
 
 static int part_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_lock(part->parent, ofs + part->offset, len);
+	return mtd->parent->_lock(mtd->parent, ofs + mtd->offset, len);
 }
 
 static int part_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_unlock(part->parent, ofs + part->offset, len);
+	return mtd->parent->_unlock(mtd->parent, ofs + mtd->offset, len);
 }
 
 static int part_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_is_locked(part->parent, ofs + part->offset, len);
+	return mtd->parent->_is_locked(mtd->parent, ofs + mtd->offset, len);
 }
 
 static void part_sync(struct mtd_info *mtd)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	part->parent->_sync(part->parent);
+	mtd->parent->_sync(mtd->parent);
 }
 
 static int part_suspend(struct mtd_info *mtd)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_suspend(part->parent);
+	return mtd->parent->_suspend(mtd->parent);
 }
 
 static void part_resume(struct mtd_info *mtd)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	part->parent->_resume(part->parent);
+	mtd->parent->_resume(mtd->parent);
 }
 
 static int part_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	ofs += part->offset;
-	return part->parent->_block_isreserved(part->parent, ofs);
+	ofs += mtd->offset;
+	return mtd->parent->_block_isreserved(mtd->parent, ofs);
 }
 
 static int part_block_isbad(struct mtd_info *mtd, loff_t ofs)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	ofs += part->offset;
-	return part->parent->_block_isbad(part->parent, ofs);
+	ofs += mtd->offset;
+	return mtd->parent->_block_isbad(mtd->parent, ofs);
 }
 
 static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
 	int res;
 
-	ofs += part->offset;
-	res = part->parent->_block_markbad(part->parent, ofs);
+	ofs += mtd->offset;
+	res = mtd->parent->_block_markbad(mtd->parent, ofs);
 	if (!res)
 		mtd->ecc_stats.badblocks++;
 	return res;
@@ -277,30 +222,24 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 static int part_get_device(struct mtd_info *mtd)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_get_device(part->parent);
+	return mtd->parent->_get_device(mtd->parent);
 }
 
 static void part_put_device(struct mtd_info *mtd)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	part->parent->_put_device(part->parent);
+	mtd->parent->_put_device(mtd->parent);
 }
 
 static int part_ooblayout_ecc(struct mtd_info *mtd, int section,
 			      struct mtd_oob_region *oobregion)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-
-	return mtd_ooblayout_ecc(part->parent, section, oobregion);
+	return mtd_ooblayout_ecc(mtd->parent, section, oobregion);
 }
 
 static int part_ooblayout_free(struct mtd_info *mtd, int section,
 			       struct mtd_oob_region *oobregion)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-
-	return mtd_ooblayout_free(part->parent, section, oobregion);
+	return mtd_ooblayout_free(mtd->parent, section, oobregion);
 }
 
 static const struct mtd_ooblayout_ops part_ooblayout_ops = {
@@ -310,53 +249,50 @@ static const struct mtd_ooblayout_ops part_ooblayout_ops = {
 
 static int part_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-
-	return part->parent->_max_bad_blocks(part->parent,
-					     ofs + part->offset, len);
+	return mtd->parent->_max_bad_blocks(mtd->parent, ofs + mtd->offset, len);
 }
 
-static inline void free_partition(struct mtd_part *p)
+static inline void free_partition(struct mtd_info *mtd)
 {
-	kfree(p->mtd.name);
-	kfree(p);
+	kfree(mtd->name);
+	kfree(mtd);
 }
 
-static struct mtd_part *allocate_partition(struct mtd_info *parent,
-			const struct mtd_partition *part, int partno,
-			uint64_t cur_offset)
+static struct mtd_info *allocate_partition(struct mtd_info *parent,
+					   const struct mtd_partition *part,
+					   int partno, uint64_t cur_offset)
 {
 	int wr_alignment = (parent->flags & MTD_NO_ERASE) ? parent->writesize :
 							    parent->erasesize;
-	struct mtd_part *slave;
+	struct mtd_info *child;
 	u32 remainder;
 	char *name;
 	u64 tmp;
 
 	/* allocate the partition structure */
-	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
+	child = kzalloc(sizeof(*child), GFP_KERNEL);
 	name = kstrdup(part->name, GFP_KERNEL);
-	if (!name || !slave) {
+	if (!name || !child) {
 		printk(KERN_ERR"memory allocation error while creating partitions for \"%s\"\n",
 		       parent->name);
 		kfree(name);
-		kfree(slave);
+		kfree(child);
 		return ERR_PTR(-ENOMEM);
 	}
 
 	/* set up the MTD object for this partition */
-	slave->mtd.type = parent->type;
-	slave->mtd.flags = parent->flags & ~part->mask_flags;
-	slave->mtd.size = part->size;
-	slave->mtd.writesize = parent->writesize;
-	slave->mtd.writebufsize = parent->writebufsize;
-	slave->mtd.oobsize = parent->oobsize;
-	slave->mtd.oobavail = parent->oobavail;
-	slave->mtd.subpage_sft = parent->subpage_sft;
-	slave->mtd.pairing = parent->pairing;
+	child->type = parent->type;
+	child->flags = parent->flags & ~part->mask_flags;
+	child->size = part->size;
+	child->writesize = parent->writesize;
+	child->writebufsize = parent->writebufsize;
+	child->oobsize = parent->oobsize;
+	child->oobavail = parent->oobavail;
+	child->subpage_sft = parent->subpage_sft;
+	child->pairing = parent->pairing;
 
-	slave->mtd.name = name;
-	slave->mtd.owner = parent->owner;
+	child->name = name;
+	child->owner = parent->owner;
 
 	/* NOTE: Historically, we didn't arrange MTDs as a tree out of
 	 * concern for showing the same data in multiple partitions.
@@ -364,130 +300,129 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 	 * so the MTD_PARTITIONED_MASTER option allows that. The master
 	 * will have device nodes etc only if this is set, so make the
 	 * parent conditional on that option. Note, this is a way to
-	 * distinguish between the master and the partition in sysfs.
+	 * distinguish between the parent and its partitions in sysfs.
 	 */
-	slave->mtd.dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) || mtd_is_partition(parent) ?
-				&parent->dev :
-				parent->dev.parent;
-	slave->mtd.dev.of_node = part->of_node;
+	child->dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) || mtd_is_partition(parent) ?
+			    &parent->dev : parent->dev.parent;
+	child->dev.of_node = part->of_node;
 
 	if (parent->_read)
-		slave->mtd._read = part_read;
+		child->_read = part_read;
 	if (parent->_write)
-		slave->mtd._write = part_write;
+		child->_write = part_write;
 
 	if (parent->_panic_write)
-		slave->mtd._panic_write = part_panic_write;
+		child->_panic_write = part_panic_write;
 
 	if (parent->_point && parent->_unpoint) {
-		slave->mtd._point = part_point;
-		slave->mtd._unpoint = part_unpoint;
+		child->_point = part_point;
+		child->_unpoint = part_unpoint;
 	}
 
 	if (parent->_read_oob)
-		slave->mtd._read_oob = part_read_oob;
+		child->_read_oob = part_read_oob;
 	if (parent->_write_oob)
-		slave->mtd._write_oob = part_write_oob;
+		child->_write_oob = part_write_oob;
 	if (parent->_read_user_prot_reg)
-		slave->mtd._read_user_prot_reg = part_read_user_prot_reg;
+		child->_read_user_prot_reg = part_read_user_prot_reg;
 	if (parent->_read_fact_prot_reg)
-		slave->mtd._read_fact_prot_reg = part_read_fact_prot_reg;
+		child->_read_fact_prot_reg = part_read_fact_prot_reg;
 	if (parent->_write_user_prot_reg)
-		slave->mtd._write_user_prot_reg = part_write_user_prot_reg;
+		child->_write_user_prot_reg = part_write_user_prot_reg;
 	if (parent->_lock_user_prot_reg)
-		slave->mtd._lock_user_prot_reg = part_lock_user_prot_reg;
+		child->_lock_user_prot_reg = part_lock_user_prot_reg;
 	if (parent->_get_user_prot_info)
-		slave->mtd._get_user_prot_info = part_get_user_prot_info;
+		child->_get_user_prot_info = part_get_user_prot_info;
 	if (parent->_get_fact_prot_info)
-		slave->mtd._get_fact_prot_info = part_get_fact_prot_info;
+		child->_get_fact_prot_info = part_get_fact_prot_info;
 	if (parent->_sync)
-		slave->mtd._sync = part_sync;
+		child->_sync = part_sync;
 	if (!partno && !parent->dev.class && parent->_suspend &&
 	    parent->_resume) {
-		slave->mtd._suspend = part_suspend;
-		slave->mtd._resume = part_resume;
+		child->_suspend = part_suspend;
+		child->_resume = part_resume;
 	}
 	if (parent->_writev)
-		slave->mtd._writev = part_writev;
+		child->_writev = part_writev;
 	if (parent->_lock)
-		slave->mtd._lock = part_lock;
+		child->_lock = part_lock;
 	if (parent->_unlock)
-		slave->mtd._unlock = part_unlock;
+		child->_unlock = part_unlock;
 	if (parent->_is_locked)
-		slave->mtd._is_locked = part_is_locked;
+		child->_is_locked = part_is_locked;
 	if (parent->_block_isreserved)
-		slave->mtd._block_isreserved = part_block_isreserved;
+		child->_block_isreserved = part_block_isreserved;
 	if (parent->_block_isbad)
-		slave->mtd._block_isbad = part_block_isbad;
+		child->_block_isbad = part_block_isbad;
 	if (parent->_block_markbad)
-		slave->mtd._block_markbad = part_block_markbad;
+		child->_block_markbad = part_block_markbad;
 	if (parent->_max_bad_blocks)
-		slave->mtd._max_bad_blocks = part_max_bad_blocks;
+		child->_max_bad_blocks = part_max_bad_blocks;
 
 	if (parent->_get_device)
-		slave->mtd._get_device = part_get_device;
+		child->_get_device = part_get_device;
 	if (parent->_put_device)
-		slave->mtd._put_device = part_put_device;
+		child->_put_device = part_put_device;
 
-	slave->mtd._erase = part_erase;
-	slave->parent = parent;
-	slave->offset = part->offset;
+	child->_erase = part_erase;
+	child->parent = parent;
+	child->offset = part->offset;
+	INIT_LIST_HEAD(&child->partitions);
 
-	if (slave->offset == MTDPART_OFS_APPEND)
-		slave->offset = cur_offset;
-	if (slave->offset == MTDPART_OFS_NXTBLK) {
+	if (child->offset == MTDPART_OFS_APPEND)
+		child->offset = cur_offset;
+	if (child->offset == MTDPART_OFS_NXTBLK) {
 		tmp = cur_offset;
-		slave->offset = cur_offset;
+		child->offset = cur_offset;
 		remainder = do_div(tmp, wr_alignment);
 		if (remainder) {
-			slave->offset += wr_alignment - remainder;
+			child->offset += wr_alignment - remainder;
 			printk(KERN_NOTICE "Moving partition %d: "
 			       "0x%012llx -> 0x%012llx\n", partno,
-			       (unsigned long long)cur_offset, (unsigned long long)slave->offset);
+			       (unsigned long long)cur_offset, child->offset);
 		}
 	}
-	if (slave->offset == MTDPART_OFS_RETAIN) {
-		slave->offset = cur_offset;
-		if (parent->size - slave->offset >= slave->mtd.size) {
-			slave->mtd.size = parent->size - slave->offset
-							- slave->mtd.size;
+	if (child->offset == MTDPART_OFS_RETAIN) {
+		child->offset = cur_offset;
+		if (parent->size - child->offset >= child->size) {
+			child->size = parent->size - child->offset - child->size;
 		} else {
 			printk(KERN_ERR "mtd partition \"%s\" doesn't have enough space: %#llx < %#llx, disabled\n",
-				part->name, parent->size - slave->offset,
-				slave->mtd.size);
+				part->name, parent->size - child->offset,
+				child->size);
 			/* register to preserve ordering */
 			goto out_register;
 		}
 	}
-	if (slave->mtd.size == MTDPART_SIZ_FULL)
-		slave->mtd.size = parent->size - slave->offset;
+	if (child->size == MTDPART_SIZ_FULL)
+		child->size = parent->size - child->offset;
 
-	printk(KERN_NOTICE "0x%012llx-0x%012llx : \"%s\"\n", (unsigned long long)slave->offset,
-		(unsigned long long)(slave->offset + slave->mtd.size), slave->mtd.name);
+	printk(KERN_NOTICE "0x%012llx-0x%012llx : \"%s\"\n", child->offset,
+	       child->offset + child->size, child->name);
 
 	/* let's do some sanity checks */
-	if (slave->offset >= parent->size) {
+	if (child->offset >= parent->size) {
 		/* let's register it anyway to preserve ordering */
-		slave->offset = 0;
-		slave->mtd.size = 0;
+		child->offset = 0;
+		child->size = 0;
 		printk(KERN_ERR"mtd: partition \"%s\" is out of reach -- disabled\n",
 			part->name);
 		goto out_register;
 	}
-	if (slave->offset + slave->mtd.size > parent->size) {
-		slave->mtd.size = parent->size - slave->offset;
+	if (child->offset + child->size > parent->size) {
+		child->size = parent->size - child->offset;
 		printk(KERN_WARNING"mtd: partition \"%s\" extends beyond the end of device \"%s\" -- size truncated to %#llx\n",
-			part->name, parent->name, (unsigned long long)slave->mtd.size);
+			part->name, parent->name, child->size);
 	}
 	if (parent->numeraseregions > 1) {
 		/* Deal with variable erase size stuff */
 		int i, max = parent->numeraseregions;
-		u64 end = slave->offset + slave->mtd.size;
+		u64 end = child->offset + child->size;
 		struct mtd_erase_region_info *regions = parent->eraseregions;
 
 		/* Find the first erase regions which is part of this
 		 * partition. */
-		for (i = 0; i < max && regions[i].offset <= slave->offset; i++)
+		for (i = 0; i < max && regions[i].offset <= child->offset; i++)
 			;
 		/* The loop searched for the region _behind_ the first one */
 		if (i > 0)
@@ -495,70 +430,68 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 
 		/* Pick biggest erasesize */
 		for (; i < max && regions[i].offset < end; i++) {
-			if (slave->mtd.erasesize < regions[i].erasesize) {
-				slave->mtd.erasesize = regions[i].erasesize;
-			}
+			if (child->erasesize < regions[i].erasesize)
+				child->erasesize = regions[i].erasesize;
 		}
-		BUG_ON(slave->mtd.erasesize == 0);
+		BUG_ON(child->erasesize == 0);
 	} else {
 		/* Single erase size */
-		slave->mtd.erasesize = parent->erasesize;
+		child->erasesize = parent->erasesize;
 	}
 
 	/*
-	 * Slave erasesize might differ from the master one if the master
+	 * Child erasesize might differ from the parent one if the parent
 	 * exposes several regions with different erasesize. Adjust
 	 * wr_alignment accordingly.
 	 */
-	if (!(slave->mtd.flags & MTD_NO_ERASE))
-		wr_alignment = slave->mtd.erasesize;
+	if (!(child->flags & MTD_NO_ERASE))
+		wr_alignment = child->erasesize;
 
-	tmp = slave->offset;
+	tmp = child->offset;
 	remainder = do_div(tmp, wr_alignment);
-	if ((slave->mtd.flags & MTD_WRITEABLE) && remainder) {
+	if ((child->flags & MTD_WRITEABLE) && remainder) {
 		/* Doesn't start on a boundary of major erase size */
 		/* FIXME: Let it be writable if it is on a boundary of
 		 * _minor_ erase size though */
-		slave->mtd.flags &= ~MTD_WRITEABLE;
+		child->flags &= ~MTD_WRITEABLE;
 		printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an erase/write block boundary -- force read-only\n",
 			part->name);
 	}
 
-	tmp = slave->mtd.size;
+	tmp = child->size;
 	remainder = do_div(tmp, wr_alignment);
-	if ((slave->mtd.flags & MTD_WRITEABLE) && remainder) {
-		slave->mtd.flags &= ~MTD_WRITEABLE;
+	if ((child->flags & MTD_WRITEABLE) && remainder) {
+		child->flags &= ~MTD_WRITEABLE;
 		printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase/write block -- force read-only\n",
 			part->name);
 	}
 
-	mtd_set_ooblayout(&slave->mtd, &part_ooblayout_ops);
-	slave->mtd.ecc_step_size = parent->ecc_step_size;
-	slave->mtd.ecc_strength = parent->ecc_strength;
-	slave->mtd.bitflip_threshold = parent->bitflip_threshold;
+	mtd_set_ooblayout(child, &part_ooblayout_ops);
+	child->ecc_step_size = parent->ecc_step_size;
+	child->ecc_strength = parent->ecc_strength;
+	child->bitflip_threshold = parent->bitflip_threshold;
 
 	if (parent->_block_isbad) {
 		uint64_t offs = 0;
 
-		while (offs < slave->mtd.size) {
-			if (mtd_block_isreserved(parent, offs + slave->offset))
-				slave->mtd.ecc_stats.bbtblocks++;
-			else if (mtd_block_isbad(parent, offs + slave->offset))
-				slave->mtd.ecc_stats.badblocks++;
-			offs += slave->mtd.erasesize;
+		while (offs < child->size) {
+			if (mtd_block_isreserved(parent, offs + child->offset))
+				child->ecc_stats.bbtblocks++;
+			else if (mtd_block_isbad(parent, offs + child->offset))
+				child->ecc_stats.badblocks++;
+			offs += child->erasesize;
 		}
 	}
 
 out_register:
-	return slave;
+	return child;
 }
 
 static ssize_t mtd_partition_offset_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
-	struct mtd_part *part = mtd_to_part(mtd);
-	return snprintf(buf, PAGE_SIZE, "%lld\n", part->offset);
+	return snprintf(buf, PAGE_SIZE, "%lld\n", mtd->offset);
 }
 
 static DEVICE_ATTR(offset, S_IRUGO, mtd_partition_offset_show, NULL);
@@ -568,9 +501,9 @@ static const struct attribute *mtd_partition_attrs[] = {
 	NULL
 };
 
-static int mtd_add_partition_attrs(struct mtd_part *new)
+static int mtd_add_partition_attrs(struct mtd_info *new)
 {
-	int ret = sysfs_create_files(&new->mtd.dev.kobj, mtd_partition_attrs);
+	int ret = sysfs_create_files(&new->dev.kobj, mtd_partition_attrs);
 	if (ret)
 		printk(KERN_WARNING
 		       "mtd: failed to create partition attrs, err=%d\n", ret);
@@ -581,7 +514,7 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 		      long long offset, long long length)
 {
 	struct mtd_partition part;
-	struct mtd_part *new;
+	struct mtd_info *child;
 	int ret = 0;
 
 	/* the direct offset is expected */
@@ -600,17 +533,17 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 	part.size = length;
 	part.offset = offset;
 
-	new = allocate_partition(parent, &part, -1, offset);
-	if (IS_ERR(new))
-		return PTR_ERR(new);
+	child = allocate_partition(parent, &part, -1, offset);
+	if (IS_ERR(child))
+		return PTR_ERR(child);
 
 	mutex_lock(&mtd_partitions_mutex);
-	list_add(&new->list, &mtd_partitions);
+	list_add_tail(&child->node, &parent->partitions);
 	mutex_unlock(&mtd_partitions_mutex);
 
-	add_mtd_device(&new->mtd);
+	add_mtd_device(child);
 
-	mtd_add_partition_attrs(new);
+	mtd_add_partition_attrs(child);
 
 	return ret;
 }
@@ -619,66 +552,84 @@ EXPORT_SYMBOL_GPL(mtd_add_partition);
 /**
  * __mtd_del_partition - delete MTD partition
  *
- * @priv: internal MTD struct for partition to be deleted
+ * @priv: MTD structure to be deleted
  *
  * This function must be called with the partitions mutex locked.
  */
-static int __mtd_del_partition(struct mtd_part *priv)
+static int __mtd_del_partition(struct mtd_info *mtd)
 {
-	struct mtd_part *child, *next;
+	struct mtd_info *child, *next;
 	int err;
 
-	list_for_each_entry_safe(child, next, &mtd_partitions, list) {
-		if (child->parent == &priv->mtd) {
-			err = __mtd_del_partition(child);
-			if (err)
-				return err;
-		}
+	list_for_each_entry_safe(child, next, &mtd->partitions, node) {
+		err = __mtd_del_partition(child);
+		if (err)
+			return err;
 	}
 
-	sysfs_remove_files(&priv->mtd.dev.kobj, mtd_partition_attrs);
+	sysfs_remove_files(&mtd->dev.kobj, mtd_partition_attrs);
 
-	err = del_mtd_device(&priv->mtd);
+	err = del_mtd_device(mtd);
 	if (err)
 		return err;
 
-	list_del(&priv->list);
-	free_partition(priv);
+	list_del(&mtd->node);
+	free_partition(mtd);
 
 	return 0;
 }
 
 /*
  * This function unregisters and destroy all slave MTD objects which are
- * attached to the given MTD object.
+ * attached to the given MTD object, recursively.
  */
+int __del_mtd_partitions(struct mtd_info *mtd)
+{
+	struct mtd_info *child, *next;
+	int ret, err = 0;
+
+	list_for_each_entry_safe(child, next, &mtd->partitions, node) {
+		if (mtd_has_partitions(child))
+			del_mtd_partitions(child);
+
+		pr_info("Deleting %s MTD partition\n", child->name);
+		ret = del_mtd_device(child);
+		if (ret < 0) {
+			pr_err("Error when deleting partition \"%s\" (%d)\n",
+			       child->name, ret);
+			err = ret;
+			continue;
+		}
+
+		list_del(&child->node);
+		free_partition(child);
+	}
+
+	return err;
+}
+
 int del_mtd_partitions(struct mtd_info *mtd)
 {
-	struct mtd_part *slave, *next;
-	int ret, err = 0;
+	int ret;
+
+	pr_info("Deleting MTD partitions on \"%s\":\n", mtd->name);
 
 	mutex_lock(&mtd_partitions_mutex);
-	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
-		if (slave->parent == mtd) {
-			ret = __mtd_del_partition(slave);
-			if (ret < 0)
-				err = ret;
-		}
+	ret = __del_mtd_partitions(mtd);
 	mutex_unlock(&mtd_partitions_mutex);
 
-	return err;
+	return ret;
 }
 
 int mtd_del_partition(struct mtd_info *mtd, int partno)
 {
-	struct mtd_part *slave, *next;
+	struct mtd_info *child, *next;
 	int ret = -EINVAL;
 
 	mutex_lock(&mtd_partitions_mutex);
-	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
-		if ((slave->parent == mtd) &&
-		    (slave->mtd.index == partno)) {
-			ret = __mtd_del_partition(slave);
+	list_for_each_entry_safe(child, next, &mtd->partitions, node)
+		if (child->index == partno) {
+			ret = __mtd_del_partition(child);
 			break;
 		}
 	mutex_unlock(&mtd_partitions_mutex);
@@ -688,41 +639,41 @@ int mtd_del_partition(struct mtd_info *mtd, int partno)
 EXPORT_SYMBOL_GPL(mtd_del_partition);
 
 /*
- * This function, given a master MTD object and a partition table, creates
- * and registers slave MTD objects which are bound to the master according to
- * the partition definitions.
+ * This function, given a parent MTD object and a partition table, creates
+ * and registers the child MTD objects which are bound to the parent according
+ * to the partition definitions.
  *
- * For historical reasons, this function's caller only registers the master
+ * For historical reasons, this function's caller only registers the parent
  * if the MTD_PARTITIONED_MASTER config option is set.
  */
 
-int add_mtd_partitions(struct mtd_info *master,
+int add_mtd_partitions(struct mtd_info *parent,
 		       const struct mtd_partition *parts,
 		       int nbparts)
 {
-	struct mtd_part *slave;
+	struct mtd_info *child;
 	uint64_t cur_offset = 0;
 	int i;
 
-	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
+	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, parent->name);
 
 	for (i = 0; i < nbparts; i++) {
-		slave = allocate_partition(master, parts + i, i, cur_offset);
-		if (IS_ERR(slave)) {
-			del_mtd_partitions(master);
-			return PTR_ERR(slave);
+		child = allocate_partition(parent, parts + i, i, cur_offset);
+		if (IS_ERR(child)) {
+			del_mtd_partitions(parent);
+			return PTR_ERR(child);
 		}
 
 		mutex_lock(&mtd_partitions_mutex);
-		list_add(&slave->list, &mtd_partitions);
+		list_add_tail(&child->node, &parent->partitions);
 		mutex_unlock(&mtd_partitions_mutex);
 
-		add_mtd_device(&slave->mtd);
-		mtd_add_partition_attrs(slave);
+		add_mtd_device(child);
+		mtd_add_partition_attrs(child);
 		/* Look for subpartitions */
-		parse_mtd_partitions(&slave->mtd, parts[i].types, NULL);
+		parse_mtd_partitions(child, parts[i].types, NULL);
 
-		cur_offset = slave->offset + slave->mtd.size;
+		cur_offset = child->offset + child->size;
 	}
 
 	return 0;
@@ -998,29 +949,12 @@ void mtd_part_parser_cleanup(struct mtd_partitions *parts)
 	}
 }
 
-int mtd_is_partition(const struct mtd_info *mtd)
-{
-	struct mtd_part *part;
-	int ispart = 0;
-
-	mutex_lock(&mtd_partitions_mutex);
-	list_for_each_entry(part, &mtd_partitions, list)
-		if (&part->mtd == mtd) {
-			ispart = 1;
-			break;
-		}
-	mutex_unlock(&mtd_partitions_mutex);
-
-	return ispart;
-}
-EXPORT_SYMBOL_GPL(mtd_is_partition);
-
 /* Returns the size of the entire flash chip */
 uint64_t mtd_get_device_size(const struct mtd_info *mtd)
 {
 	if (!mtd_is_partition(mtd))
 		return mtd->size;
 
-	return mtd_get_device_size(mtd_to_part(mtd)->parent);
+	return mtd_get_device_size(mtd->parent);
 }
 EXPORT_SYMBOL_GPL(mtd_get_device_size);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index cd0be91bdefa..47185e1ff3f8 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -22,6 +22,7 @@
 
 #include <linux/types.h>
 #include <linux/uio.h>
+#include <linux/list.h>
 #include <linux/notifier.h>
 #include <linux/device.h>
 #include <linux/of.h>
@@ -341,8 +342,39 @@ struct mtd_info {
 	struct device dev;
 	int usecount;
 	struct mtd_debug_info dbg;
+
+	/* MTD devices do not have any parent. MTD partitions do. */
+	struct mtd_info *parent;
+
+	/*
+	 * Offset of the partition relatively to the parent offset.
+	 * Is 0 for real MTD devices (ie. not partitions).
+	 */
+	u64 offset;
+
+	/*
+	 * List node used to add an MTD partition to the parent
+	 * partition list.
+	 */
+	struct list_head node;
+
+	/*
+	 * List of partitions attached to this MTD device (the parent
+	 * MTD device can itself be a partition).
+	 */
+	struct list_head partitions;
 };
 
+static inline bool mtd_is_partition(const struct mtd_info *mtd)
+{
+	return mtd->parent;
+}
+
+static inline bool mtd_has_partitions(const struct mtd_info *mtd)
+{
+	return !list_empty(&mtd->partitions);
+}
+
 int mtd_ooblayout_ecc(struct mtd_info *mtd, int section,
 		      struct mtd_oob_region *oobecc);
 int mtd_ooblayout_find_eccregion(struct mtd_info *mtd, int eccbyte,
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 11cb0c50cd84..e545c050d3e8 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -105,7 +105,6 @@ extern void deregister_mtd_parser(struct mtd_part_parser *parser);
 	module_driver(__mtd_part_parser, register_mtd_parser, \
 		      deregister_mtd_parser)
 
-int mtd_is_partition(const struct mtd_info *mtd);
 int mtd_add_partition(struct mtd_info *master, const char *name,
 		      long long offset, long long length);
 int mtd_del_partition(struct mtd_info *master, int partno);
-- 
2.19.1
