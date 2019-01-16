From: miquel.raynal@bootlin.com (Miquel Raynal)
Date: Wed, 16 Jan 2019 17:21:44 +0100
Subject: [PATCH v2] mtd: rework partitions handling
Message-ID: <20190116162144.4458-1-miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Instead of collecting partitions in a flat list, create a hierarchy
within the mtd_info structure: use a partitions list to keep track of
the partitions of an MTD device (which might be itself a partition of
another MTD device), a pointer to the parent device (NULL when the MTD
device is the root one, not a partition).

By also saving directly in mtd_info the offset of the partition, we
can get rid of the mtd_part structure.

All part_*() helpers are removed, the corresponding mtd_*() helpers
are updated to handle the partitions themselves.

The part_absolute_offset() helper is also replaced by
mtd_get_master_offset() which is very similar but not recursive and
accepts an additional offset. Plus, it is used in both mtdcore and
mtdpart.

While at it, be consistent in the naming of the mtd_info structures to
ease the understanding of the new hierarchy: these structures are
usually called 'mtd', unless there are multiple instances of the same
structure. In this case, there is usually a parent/child bound so we
will call them 'parent' and 'child'.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

This patch applies on top of:
mtd: Implement mtd_{read,write}() as wrappers around mtd_{read,write}_oob()

Changes since v1:
=================
* Commit name changed "proper partition handling" -> "rework partition
  tree".
* Update mtd_get_device_size() to support recursive partitioning.
* Remove part_*() helpers, update the corresponding mtd_*() helpers to
  handle the partitions themselves.
* Drop the global partitions lock, add a lock per mtd_info but only use
  the root one to protect against partitions updates.

drivers/mtd/mtdcore.c          | 247 ++++++++----
 drivers/mtd/mtdpart.c          | 687 +++++++++------------------------
 include/linux/mtd/mtd.h        | 100 ++++-
 include/linux/mtd/partitions.h |   3 +-
 4 files changed, 452 insertions(+), 585 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index d5a7fc6ea3f3..ae1b49bf0f2b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -414,13 +414,14 @@ static int mtd_reboot_notifier(struct notifier_block *n, unsigned long state,
 int mtd_wunit_to_pairing_info(struct mtd_info *mtd, int wunit,
 			      struct mtd_pairing_info *info)
 {
-	int npairs = mtd_wunit_per_eb(mtd) / mtd_pairing_groups(mtd);
+	struct mtd_info *master = mtd_get_master(mtd);
+	int npairs = mtd_wunit_per_eb(master) / mtd_pairing_groups(master);
 
 	if (wunit < 0 || wunit >= npairs)
 		return -EINVAL;
 
-	if (mtd->pairing && mtd->pairing->get_info)
-		return mtd->pairing->get_info(mtd, wunit, info);
+	if (master->pairing && master->pairing->get_info)
+		return master->pairing->get_info(master, wunit, info);
 
 	info->group = 0;
 	info->pair = wunit;
@@ -456,15 +457,16 @@ EXPORT_SYMBOL_GPL(mtd_wunit_to_pairing_info);
 int mtd_pairing_info_to_wunit(struct mtd_info *mtd,
 			      const struct mtd_pairing_info *info)
 {
-	int ngroups = mtd_pairing_groups(mtd);
-	int npairs = mtd_wunit_per_eb(mtd) / ngroups;
+	struct mtd_info *master = mtd_get_master(mtd);
+	int ngroups = mtd_pairing_groups(master);
+	int npairs = mtd_wunit_per_eb(master) / ngroups;
 
 	if (!info || info->pair < 0 || info->pair >= npairs ||
 	    info->group < 0 || info->group >= ngroups)
 		return -EINVAL;
 
-	if (mtd->pairing && mtd->pairing->get_wunit)
-		return mtd->pairing->get_wunit(mtd, info);
+	if (master->pairing && master->pairing->get_wunit)
+		return mtd->pairing->get_wunit(master, info);
 
 	return info->pair;
 }
@@ -482,10 +484,12 @@ EXPORT_SYMBOL_GPL(mtd_pairing_info_to_wunit);
  */
 int mtd_pairing_groups(struct mtd_info *mtd)
 {
-	if (!mtd->pairing || !mtd->pairing->ngroups)
+	struct mtd_info *master = mtd_get_master(mtd);
+
+	if (!master->pairing || !master->pairing->ngroups)
 		return 1;
 
-	return mtd->pairing->ngroups;
+	return master->pairing->ngroups;
 }
 EXPORT_SYMBOL_GPL(mtd_pairing_groups);
 
@@ -546,6 +550,7 @@ static struct dentry *dfs_dir_mtd;
 
 int add_mtd_device(struct mtd_info *mtd)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
 	struct mtd_notifier *not;
 	int i, error;
 
@@ -567,7 +572,7 @@ int add_mtd_device(struct mtd_info *mtd)
 		    (mtd->_read && mtd->_read_oob)))
 		return -EINVAL;
 
-	if (WARN_ON((!mtd->erasesize || !mtd->_erase) &&
+	if (WARN_ON((!mtd->erasesize || !master->_erase) &&
 		    !(mtd->flags & MTD_NO_ERASE)))
 		return -EINVAL;
 
@@ -731,6 +736,9 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 	}
 
 	mtd->orig_flags = mtd->flags;
+
+	INIT_LIST_HEAD(&mtd->partitions);
+	mutex_init(&mtd->partitions_lock);
 }
 
 /**
@@ -936,20 +944,26 @@ EXPORT_SYMBOL_GPL(get_mtd_device);
 
 int __get_mtd_device(struct mtd_info *mtd)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
 	int err;
 
-	if (!try_module_get(mtd->owner))
+	if (!try_module_get(master->owner))
 		return -ENODEV;
 
-	if (mtd->_get_device) {
-		err = mtd->_get_device(mtd);
+	if (master->_get_device) {
+		err = master->_get_device(mtd);
 
 		if (err) {
-			module_put(mtd->owner);
+			module_put(master->owner);
 			return err;
 		}
 	}
-	mtd->usecount++;
+
+	while (mtd->parent) {
+		mtd->usecount++;
+		mtd = mtd->parent;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__get_mtd_device);
@@ -1003,13 +1017,18 @@ EXPORT_SYMBOL_GPL(put_mtd_device);
 
 void __put_mtd_device(struct mtd_info *mtd)
 {
-	--mtd->usecount;
-	BUG_ON(mtd->usecount < 0);
+	struct mtd_info *master = mtd_get_master(mtd);
 
-	if (mtd->_put_device)
-		mtd->_put_device(mtd);
+	while (mtd->parent) {
+		--mtd->usecount;
+		BUG_ON(mtd->usecount < 0);
+		mtd = mtd->parent;
+	}
 
-	module_put(mtd->owner);
+	if (master->_put_device)
+		master->_put_device(master);
+
+	module_put(master->owner);
 }
 EXPORT_SYMBOL_GPL(__put_mtd_device);
 
@@ -1020,9 +1039,13 @@ EXPORT_SYMBOL_GPL(__put_mtd_device);
  */
 int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
+	u64 mst_ofs = mtd_get_master_offset(mtd, 0);
+	int ret;
+
 	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 
-	if (!mtd->erasesize || !mtd->_erase)
+	if (!mtd->erasesize || !master->_erase)
 		return -ENOTSUPP;
 
 	if (instr->addr >= mtd->size || instr->len > mtd->size - instr->addr)
@@ -1034,7 +1057,14 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 		return 0;
 
 	ledtrig_mtd_activity();
-	return mtd->_erase(mtd, instr);
+
+	instr->addr += mst_ofs;
+	ret = mtd->_erase(mtd, instr);
+	if (instr->fail_addr != MTD_FAIL_ADDR_UNKNOWN)
+		instr->fail_addr -= mst_ofs;
+
+	instr->addr -= mst_ofs;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_erase);
 
@@ -1044,30 +1074,36 @@ EXPORT_SYMBOL_GPL(mtd_erase);
 int mtd_point(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	      void **virt, resource_size_t *phys)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
+
 	*retlen = 0;
 	*virt = NULL;
 	if (phys)
 		*phys = 0;
-	if (!mtd->_point)
+	if (!master->_point)
 		return -EOPNOTSUPP;
 	if (from < 0 || from >= mtd->size || len > mtd->size - from)
 		return -EINVAL;
 	if (!len)
 		return 0;
-	return mtd->_point(mtd, from, len, retlen, virt, phys);
+
+	from = mtd_get_master_offset(mtd, from);
+	return master->_point(master, from, len, retlen, virt, phys);
 }
 EXPORT_SYMBOL_GPL(mtd_point);
 
 /* We probably shouldn't allow XIP if the unpoint isn't a NULL */
 int mtd_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
-	if (!mtd->_unpoint)
+	struct mtd_info *master = mtd_get_master(mtd);
+
+	if (!master->_unpoint)
 		return -EOPNOTSUPP;
 	if (from < 0 || from >= mtd->size || len > mtd->size - from)
 		return -EINVAL;
 	if (!len)
 		return 0;
-	return mtd->_unpoint(mtd, from, len);
+	return master->_unpoint(master, mtd_get_master_offset(mtd, from), len);
 }
 EXPORT_SYMBOL_GPL(mtd_unpoint);
 
@@ -1094,6 +1130,25 @@ unsigned long mtd_get_unmapped_area(struct mtd_info *mtd, unsigned long len,
 }
 EXPORT_SYMBOL_GPL(mtd_get_unmapped_area);
 
+static void mtd_update_ecc_stats(struct mtd_info *mtd, struct mtd_info *master,
+				 const struct mtd_ecc_stats *old_stats)
+{
+	struct mtd_ecc_stats diff;
+
+	if (master == mtd)
+		return;
+
+	diff = master->ecc_stats;
+	diff.failed -= old_stats->failed;
+	diff.corrected -= old_stats->corrected;
+
+	while (mtd->parent) {
+		mtd->ecc_stats.failed += diff.failed;
+		mtd->ecc_stats.corrected += diff.corrected;
+		mtd = mtd->parent;
+	}
+}
+
 int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	     u_char *buf)
 {
@@ -1136,8 +1191,10 @@ EXPORT_SYMBOL_GPL(mtd_write);
 int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		    const u_char *buf)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
+
 	*retlen = 0;
-	if (!mtd->_panic_write)
+	if (!master->_panic_write)
 		return -EOPNOTSUPP;
 	if (to < 0 || to >= mtd->size || len > mtd->size - to)
 		return -EINVAL;
@@ -1145,7 +1202,8 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		return -EROFS;
 	if (!len)
 		return 0;
-	return mtd->_panic_write(mtd, to, len, retlen, buf);
+	return master->_panic_write(master, mtd_get_master_offset(mtd, to), len,
+				    retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_panic_write);
 
@@ -1184,7 +1242,11 @@ static int mtd_check_oob_ops(struct mtd_info *mtd, loff_t offs,
 
 int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
+	struct mtd_ecc_stats old_stats = master->ecc_stats;
 	int ret_code;
+
+	from = mtd_get_master_offset(mtd, from);
 	ops->retlen = ops->oobretlen = 0;
 
 	ret_code = mtd_check_oob_ops(mtd, from, ops);
@@ -1194,14 +1256,16 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 	ledtrig_mtd_activity();
 
 	/* Check the validity of a potential fallback on mtd->_read */
-	if (!mtd->_read_oob && (!mtd->_read || ops->oobbuf))
+	if (!master->_read_oob && (!master->_read || ops->oobbuf))
 		return -EOPNOTSUPP;
 
-	if (mtd->_read_oob)
-		ret_code = mtd->_read_oob(mtd, from, ops);
+	if (master->_read_oob)
+		ret_code = master->_read_oob(master, from, ops);
 	else
-		ret_code = mtd->_read(mtd, from, ops->len, &ops->retlen,
-				      ops->datbuf);
+		ret_code = master->_read(master, from, ops->len, &ops->retlen,
+					 ops->datbuf);
+
+	mtd_update_ecc_stats(mtd, master, &old_stats);
 
 	/*
 	 * In cases where ops->datbuf != NULL, mtd->_read_oob() has semantics
@@ -1220,6 +1284,7 @@ EXPORT_SYMBOL_GPL(mtd_read_oob);
 int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 				struct mtd_oob_ops *ops)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
 	int ret;
 
 	ops->retlen = ops->oobretlen = 0;
@@ -1237,10 +1302,12 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 	if (!mtd->_write_oob && (!mtd->_write || ops->oobbuf))
 		return -EOPNOTSUPP;
 
+	to = mtd_get_master_offset(mtd, to);
+
 	if (mtd->_write_oob)
-		return mtd->_write_oob(mtd, to, ops);
+		return mtd->_write_oob(master, to, ops);
 	else
-		return mtd->_write(mtd, to, ops->len, &ops->retlen,
+		return mtd->_write(master, to, ops->len, &ops->retlen,
 				   ops->datbuf);
 }
 EXPORT_SYMBOL_GPL(mtd_write_oob);
@@ -1264,15 +1331,17 @@ EXPORT_SYMBOL_GPL(mtd_write_oob);
 int mtd_ooblayout_ecc(struct mtd_info *mtd, int section,
 		      struct mtd_oob_region *oobecc)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
+
 	memset(oobecc, 0, sizeof(*oobecc));
 
-	if (!mtd || section < 0)
+	if (!master || section < 0)
 		return -EINVAL;
 
-	if (!mtd->ooblayout || !mtd->ooblayout->ecc)
+	if (!master->ooblayout || !master->ooblayout->ecc)
 		return -ENOTSUPP;
 
-	return mtd->ooblayout->ecc(mtd, section, oobecc);
+	return master->ooblayout->ecc(master, section, oobecc);
 }
 EXPORT_SYMBOL_GPL(mtd_ooblayout_ecc);
 
@@ -1296,15 +1365,17 @@ EXPORT_SYMBOL_GPL(mtd_ooblayout_ecc);
 int mtd_ooblayout_free(struct mtd_info *mtd, int section,
 		       struct mtd_oob_region *oobfree)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
+
 	memset(oobfree, 0, sizeof(*oobfree));
 
-	if (!mtd || section < 0)
+	if (!master || section < 0)
 		return -EINVAL;
 
-	if (!mtd->ooblayout || !mtd->ooblayout->free)
+	if (!master->ooblayout || !master->ooblayout->free)
 		return -ENOTSUPP;
 
-	return mtd->ooblayout->free(mtd, section, oobfree);
+	return master->ooblayout->free(master, section, oobfree);
 }
 EXPORT_SYMBOL_GPL(mtd_ooblayout_free);
 
@@ -1613,60 +1684,69 @@ EXPORT_SYMBOL_GPL(mtd_ooblayout_count_eccbytes);
 int mtd_get_fact_prot_info(struct mtd_info *mtd, size_t len, size_t *retlen,
 			   struct otp_info *buf)
 {
-	if (!mtd->_get_fact_prot_info)
+	struct mtd_info *master = mtd_get_master(mtd);
+
+	if (!master->_get_fact_prot_info)
 		return -EOPNOTSUPP;
 	if (!len)
 		return 0;
-	return mtd->_get_fact_prot_info(mtd, len, retlen, buf);
+	return master->_get_fact_prot_info(master, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_get_fact_prot_info);
 
 int mtd_read_fact_prot_reg(struct mtd_info *mtd, loff_t from, size_t len,
 			   size_t *retlen, u_char *buf)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
+
 	*retlen = 0;
-	if (!mtd->_read_fact_prot_reg)
+	if (!master->_read_fact_prot_reg)
 		return -EOPNOTSUPP;
 	if (!len)
 		return 0;
-	return mtd->_read_fact_prot_reg(mtd, from, len, retlen, buf);
+	return master->_read_fact_prot_reg(master, from, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_read_fact_prot_reg);
 
 int mtd_get_user_prot_info(struct mtd_info *mtd, size_t len, size_t *retlen,
 			   struct otp_info *buf)
 {
-	if (!mtd->_get_user_prot_info)
+	struct mtd_info *master = mtd_get_master(mtd);
+
+	if (!master->_get_user_prot_info)
 		return -EOPNOTSUPP;
 	if (!len)
 		return 0;
-	return mtd->_get_user_prot_info(mtd, len, retlen, buf);
+	return master->_get_user_prot_info(master, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_get_user_prot_info);
 
 int mtd_read_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len,
 			   size_t *retlen, u_char *buf)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
+
 	*retlen = 0;
-	if (!mtd->_read_user_prot_reg)
+	if (!master->_read_user_prot_reg)
 		return -EOPNOTSUPP;
 	if (!len)
 		return 0;
-	return mtd->_read_user_prot_reg(mtd, from, len, retlen, buf);
+	return master->_read_user_prot_reg(master, from, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_read_user_prot_reg);
 
 int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to, size_t len,
 			    size_t *retlen, u_char *buf)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
 	int ret;
 
 	*retlen = 0;
-	if (!mtd->_write_user_prot_reg)
+	if (!master->_write_user_prot_reg)
 		return -EOPNOTSUPP;
 	if (!len)
 		return 0;
-	ret = mtd->_write_user_prot_reg(mtd, to, len, retlen, buf);
+	ret = master->_write_user_prot_reg(master, to, len, retlen, buf);
 	if (ret)
 		return ret;
 
@@ -1680,80 +1760,106 @@ EXPORT_SYMBOL_GPL(mtd_write_user_prot_reg);
 
 int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len)
 {
-	if (!mtd->_lock_user_prot_reg)
+	struct mtd_info *master = mtd_get_master(mtd);
+
+	if (!master->_lock_user_prot_reg)
 		return -EOPNOTSUPP;
 	if (!len)
 		return 0;
-	return mtd->_lock_user_prot_reg(mtd, from, len);
+	return master->_lock_user_prot_reg(master, from, len);
 }
 EXPORT_SYMBOL_GPL(mtd_lock_user_prot_reg);
 
 /* Chip-supported device locking */
 int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
-	if (!mtd->_lock)
+	struct mtd_info *master = mtd_get_master(mtd);
+
+	if (!master->_lock)
 		return -EOPNOTSUPP;
 	if (ofs < 0 || ofs >= mtd->size || len > mtd->size - ofs)
 		return -EINVAL;
 	if (!len)
 		return 0;
-	return mtd->_lock(mtd, ofs, len);
+	return master->_lock(master, mtd_get_master_offset(mtd, ofs), len);
 }
 EXPORT_SYMBOL_GPL(mtd_lock);
 
 int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
-	if (!mtd->_unlock)
+	struct mtd_info *master = mtd_get_master(mtd);
+
+	if (!master->_unlock)
 		return -EOPNOTSUPP;
 	if (ofs < 0 || ofs >= mtd->size || len > mtd->size - ofs)
 		return -EINVAL;
 	if (!len)
 		return 0;
-	return mtd->_unlock(mtd, ofs, len);
+	return master->_unlock(master, mtd_get_master_offset(mtd, ofs), len);
 }
 EXPORT_SYMBOL_GPL(mtd_unlock);
 
 int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
-	if (!mtd->_is_locked)
+	struct mtd_info *master = mtd_get_master(mtd);
+
+	if (!master->_is_locked)
 		return -EOPNOTSUPP;
 	if (ofs < 0 || ofs >= mtd->size || len > mtd->size - ofs)
 		return -EINVAL;
 	if (!len)
 		return 0;
-	return mtd->_is_locked(mtd, ofs, len);
+	return master->_is_locked(master, mtd_get_master_offset(mtd, ofs), len);
 }
 EXPORT_SYMBOL_GPL(mtd_is_locked);
 
 int mtd_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
+
 	if (ofs < 0 || ofs >= mtd->size)
 		return -EINVAL;
-	if (!mtd->_block_isreserved)
+	if (!master->_block_isreserved)
 		return 0;
-	return mtd->_block_isreserved(mtd, ofs);
+	return master->_block_isreserved(master,
+					 mtd_get_master_offset(mtd, ofs));
 }
 EXPORT_SYMBOL_GPL(mtd_block_isreserved);
 
 int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
+
 	if (ofs < 0 || ofs >= mtd->size)
 		return -EINVAL;
-	if (!mtd->_block_isbad)
+	if (!master->_block_isbad)
 		return 0;
-	return mtd->_block_isbad(mtd, ofs);
+	return master->_block_isbad(master, mtd_get_master_offset(mtd, ofs));
 }
 EXPORT_SYMBOL_GPL(mtd_block_isbad);
 
 int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
-	if (!mtd->_block_markbad)
+	struct mtd_info *master = mtd_get_master(mtd);
+	int ret;
+
+	if (!master->_block_markbad)
 		return -EOPNOTSUPP;
 	if (ofs < 0 || ofs >= mtd->size)
 		return -EINVAL;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
-	return mtd->_block_markbad(mtd, ofs);
+
+	ret = master->_block_markbad(master, mtd_get_master_offset(mtd, ofs));
+	if (ret)
+		return ret;
+
+	while (mtd->parent) {
+		mtd->ecc_stats.badblocks++;
+		mtd = mtd->parent;
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(mtd_block_markbad);
 
@@ -1803,12 +1909,17 @@ static int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	       unsigned long count, loff_t to, size_t *retlen)
 {
+	struct mtd_info *master = mtd_get_master(mtd);
+
 	*retlen = 0;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
-	if (!mtd->_writev)
-		return default_mtd_writev(mtd, vecs, count, to, retlen);
-	return mtd->_writev(mtd, vecs, count, to, retlen);
+
+	to = mtd_get_master_offset(mtd, to);
+
+	if (!master->_writev)
+		return default_mtd_writev(master, vecs, count, to, retlen);
+	return master->_writev(master, vecs, count, to, retlen);
 }
 EXPORT_SYMBOL_GPL(mtd_writev);
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index b6af41b04622..60984e9ce90a 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -34,339 +34,52 @@
 
 #include "mtdcore.h"
 
-/* Our partition linked list */
-static LIST_HEAD(mtd_partitions);
-static DEFINE_MUTEX(mtd_partitions_mutex);
-
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
-static u64 part_absolute_offset(struct mtd_info *mtd)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-
-	if (!mtd_is_partition(mtd))
-		return 0;
-
-	return part_absolute_offset(part->parent) + part->offset;
-}
-
 /*
  * MTD methods which simply translate the effective address and pass through
  * to the _real_ device.
  */
 
-static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char *buf)
+static inline void free_partition(struct mtd_info *mtd)
 {
-	struct mtd_part *part = mtd_to_part(mtd);
-	struct mtd_ecc_stats stats;
-	int res;
-
-	stats = part->parent->ecc_stats;
-	res = part->parent->_read(part->parent, from + part->offset, len,
-				  retlen, buf);
-	if (unlikely(mtd_is_eccerr(res)))
-		mtd->ecc_stats.failed +=
-			part->parent->ecc_stats.failed - stats.failed;
-	else
-		mtd->ecc_stats.corrected +=
-			part->parent->ecc_stats.corrected - stats.corrected;
-	return res;
-}
-
-static int part_point(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, void **virt, resource_size_t *phys)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-
-	return part->parent->_point(part->parent, from + part->offset, len,
-				    retlen, virt, phys);
-}
-
-static int part_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-
-	return part->parent->_unpoint(part->parent, from + part->offset, len);
-}
-
-static int part_read_oob(struct mtd_info *mtd, loff_t from,
-		struct mtd_oob_ops *ops)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	struct mtd_ecc_stats stats;
-	int res;
-
-	stats = part->parent->ecc_stats;
-	res = part->parent->_read_oob(part->parent, from + part->offset, ops);
-	if (unlikely(mtd_is_eccerr(res)))
-		mtd->ecc_stats.failed +=
-			part->parent->ecc_stats.failed - stats.failed;
-	else
-		mtd->ecc_stats.corrected +=
-			part->parent->ecc_stats.corrected - stats.corrected;
-	return res;
-}
-
-static int part_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
-		size_t len, size_t *retlen, u_char *buf)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_read_user_prot_reg(part->parent, from, len,
-						 retlen, buf);
-}
-
-static int part_get_user_prot_info(struct mtd_info *mtd, size_t len,
-				   size_t *retlen, struct otp_info *buf)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_get_user_prot_info(part->parent, len, retlen,
-						 buf);
-}
-
-static int part_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
-		size_t len, size_t *retlen, u_char *buf)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_read_fact_prot_reg(part->parent, from, len,
-						 retlen, buf);
-}
-
-static int part_get_fact_prot_info(struct mtd_info *mtd, size_t len,
-				   size_t *retlen, struct otp_info *buf)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_get_fact_prot_info(part->parent, len, retlen,
-						 buf);
-}
-
-static int part_write(struct mtd_info *mtd, loff_t to, size_t len,
-		size_t *retlen, const u_char *buf)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_write(part->parent, to + part->offset, len,
-				    retlen, buf);
-}
-
-static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
-		size_t *retlen, const u_char *buf)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_panic_write(part->parent, to + part->offset, len,
-					  retlen, buf);
-}
-
-static int part_write_oob(struct mtd_info *mtd, loff_t to,
-		struct mtd_oob_ops *ops)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-
-	return part->parent->_write_oob(part->parent, to + part->offset, ops);
-}
-
-static int part_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
-		size_t len, size_t *retlen, u_char *buf)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_write_user_prot_reg(part->parent, from, len,
-						  retlen, buf);
-}
-
-static int part_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
-		size_t len)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_lock_user_prot_reg(part->parent, from, len);
-}
-
-static int part_writev(struct mtd_info *mtd, const struct kvec *vecs,
-		unsigned long count, loff_t to, size_t *retlen)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_writev(part->parent, vecs, count,
-				     to + part->offset, retlen);
-}
-
-static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	int ret;
-
-	instr->addr += part->offset;
-	ret = part->parent->_erase(part->parent, instr);
-	if (instr->fail_addr != MTD_FAIL_ADDR_UNKNOWN)
-		instr->fail_addr -= part->offset;
-	instr->addr -= part->offset;
-
-	return ret;
-}
-
-static int part_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_lock(part->parent, ofs + part->offset, len);
-}
-
-static int part_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_unlock(part->parent, ofs + part->offset, len);
-}
-
-static int part_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_is_locked(part->parent, ofs + part->offset, len);
-}
-
-static void part_sync(struct mtd_info *mtd)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	part->parent->_sync(part->parent);
-}
-
-static int part_suspend(struct mtd_info *mtd)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_suspend(part->parent);
-}
-
-static void part_resume(struct mtd_info *mtd)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	part->parent->_resume(part->parent);
-}
-
-static int part_block_isreserved(struct mtd_info *mtd, loff_t ofs)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	ofs += part->offset;
-	return part->parent->_block_isreserved(part->parent, ofs);
-}
-
-static int part_block_isbad(struct mtd_info *mtd, loff_t ofs)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	ofs += part->offset;
-	return part->parent->_block_isbad(part->parent, ofs);
-}
-
-static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	int res;
-
-	ofs += part->offset;
-	res = part->parent->_block_markbad(part->parent, ofs);
-	if (!res)
-		mtd->ecc_stats.badblocks++;
-	return res;
-}
-
-static int part_get_device(struct mtd_info *mtd)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	return part->parent->_get_device(part->parent);
-}
-
-static void part_put_device(struct mtd_info *mtd)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-	part->parent->_put_device(part->parent);
-}
-
-static int part_ooblayout_ecc(struct mtd_info *mtd, int section,
-			      struct mtd_oob_region *oobregion)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-
-	return mtd_ooblayout_ecc(part->parent, section, oobregion);
-}
-
-static int part_ooblayout_free(struct mtd_info *mtd, int section,
-			       struct mtd_oob_region *oobregion)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-
-	return mtd_ooblayout_free(part->parent, section, oobregion);
-}
-
-static const struct mtd_ooblayout_ops part_ooblayout_ops = {
-	.ecc = part_ooblayout_ecc,
-	.free = part_ooblayout_free,
-};
-
-static int part_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
-{
-	struct mtd_part *part = mtd_to_part(mtd);
-
-	return part->parent->_max_bad_blocks(part->parent,
-					     ofs + part->offset, len);
-}
-
-static inline void free_partition(struct mtd_part *p)
-{
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
+	struct mtd_info *child, *master = mtd_get_master(parent);
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
-	slave->mtd.flags = parent->orig_flags & ~part->mask_flags;
-	slave->mtd.orig_flags = slave->mtd.flags;
-	slave->mtd.size = part->size;
-	slave->mtd.writesize = parent->writesize;
-	slave->mtd.writebufsize = parent->writebufsize;
-	slave->mtd.oobsize = parent->oobsize;
-	slave->mtd.oobavail = parent->oobavail;
-	slave->mtd.subpage_sft = parent->subpage_sft;
-	slave->mtd.pairing = parent->pairing;
+	child->type = parent->type;
+	child->flags = parent->orig_flags & ~part->mask_flags;
+	child->orig_flags = child->flags;
+	child->size = part->size;
+	child->writesize = parent->writesize;
+	child->writebufsize = parent->writebufsize;
+	child->oobsize = parent->oobsize;
+	child->oobavail = parent->oobavail;
+	child->subpage_sft = parent->subpage_sft;
 
-	slave->mtd.name = name;
-	slave->mtd.owner = parent->owner;
+	child->name = name;
+	child->owner = parent->owner;
 
 	/* NOTE: Historically, we didn't arrange MTDs as a tree out of
 	 * concern for showing the same data in multiple partitions.
@@ -374,130 +87,69 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
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
-
-	if (parent->_read)
-		slave->mtd._read = part_read;
-	if (parent->_write)
-		slave->mtd._write = part_write;
-
-	if (parent->_panic_write)
-		slave->mtd._panic_write = part_panic_write;
-
-	if (parent->_point && parent->_unpoint) {
-		slave->mtd._point = part_point;
-		slave->mtd._unpoint = part_unpoint;
-	}
-
-	if (parent->_read_oob)
-		slave->mtd._read_oob = part_read_oob;
-	if (parent->_write_oob)
-		slave->mtd._write_oob = part_write_oob;
-	if (parent->_read_user_prot_reg)
-		slave->mtd._read_user_prot_reg = part_read_user_prot_reg;
-	if (parent->_read_fact_prot_reg)
-		slave->mtd._read_fact_prot_reg = part_read_fact_prot_reg;
-	if (parent->_write_user_prot_reg)
-		slave->mtd._write_user_prot_reg = part_write_user_prot_reg;
-	if (parent->_lock_user_prot_reg)
-		slave->mtd._lock_user_prot_reg = part_lock_user_prot_reg;
-	if (parent->_get_user_prot_info)
-		slave->mtd._get_user_prot_info = part_get_user_prot_info;
-	if (parent->_get_fact_prot_info)
-		slave->mtd._get_fact_prot_info = part_get_fact_prot_info;
-	if (parent->_sync)
-		slave->mtd._sync = part_sync;
-	if (!partno && !parent->dev.class && parent->_suspend &&
-	    parent->_resume) {
-		slave->mtd._suspend = part_suspend;
-		slave->mtd._resume = part_resume;
-	}
-	if (parent->_writev)
-		slave->mtd._writev = part_writev;
-	if (parent->_lock)
-		slave->mtd._lock = part_lock;
-	if (parent->_unlock)
-		slave->mtd._unlock = part_unlock;
-	if (parent->_is_locked)
-		slave->mtd._is_locked = part_is_locked;
-	if (parent->_block_isreserved)
-		slave->mtd._block_isreserved = part_block_isreserved;
-	if (parent->_block_isbad)
-		slave->mtd._block_isbad = part_block_isbad;
-	if (parent->_block_markbad)
-		slave->mtd._block_markbad = part_block_markbad;
-	if (parent->_max_bad_blocks)
-		slave->mtd._max_bad_blocks = part_max_bad_blocks;
-
-	if (parent->_get_device)
-		slave->mtd._get_device = part_get_device;
-	if (parent->_put_device)
-		slave->mtd._put_device = part_put_device;
-
-	slave->mtd._erase = part_erase;
-	slave->parent = parent;
-	slave->offset = part->offset;
-
-	if (slave->offset == MTDPART_OFS_APPEND)
-		slave->offset = cur_offset;
-	if (slave->offset == MTDPART_OFS_NXTBLK) {
+	child->dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) || mtd_is_partition(parent) ?
+			    &parent->dev : parent->dev.parent;
+	child->dev.of_node = part->of_node;
+	child->parent = parent;
+	child->offset = part->offset;
+	INIT_LIST_HEAD(&child->partitions);
+
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
@@ -505,70 +157,67 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 
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
 
-	tmp = part_absolute_offset(parent) + slave->offset;
+	tmp = mtd_get_master_offset(child, 0);
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
 
-	tmp = part_absolute_offset(parent) + slave->mtd.size;
+	tmp = mtd_get_master_offset(child, child->size);
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
+	child->ecc_step_size = parent->ecc_step_size;
+	child->ecc_strength = parent->ecc_strength;
+	child->bitflip_threshold = parent->bitflip_threshold;
 
-	if (parent->_block_isbad) {
+	if (master->_block_isbad) {
 		uint64_t offs = 0;
 
-		while (offs < slave->mtd.size) {
-			if (mtd_block_isreserved(parent, offs + slave->offset))
-				slave->mtd.ecc_stats.bbtblocks++;
-			else if (mtd_block_isbad(parent, offs + slave->offset))
-				slave->mtd.ecc_stats.badblocks++;
-			offs += slave->mtd.erasesize;
+		while (offs < child->size) {
+			if (mtd_block_isreserved(child, offs))
+				child->ecc_stats.bbtblocks++;
+			else if (mtd_block_isbad(child, offs))
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
@@ -578,9 +227,9 @@ static const struct attribute *mtd_partition_attrs[] = {
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
@@ -591,7 +240,7 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 		      long long offset, long long length)
 {
 	struct mtd_partition part;
-	struct mtd_part *new;
+	struct mtd_info *child;
 	int ret = 0;
 
 	/* the direct offset is expected */
@@ -610,17 +259,17 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 	part.size = length;
 	part.offset = offset;
 
-	new = allocate_partition(parent, &part, -1, offset);
-	if (IS_ERR(new))
-		return PTR_ERR(new);
+	child = allocate_partition(parent, &part, -1, offset);
+	if (IS_ERR(child))
+		return PTR_ERR(child);
 
-	mutex_lock(&mtd_partitions_mutex);
-	list_add(&new->list, &mtd_partitions);
-	mutex_unlock(&mtd_partitions_mutex);
+	mutex_lock(&parent->partitions_lock);
+	list_add_tail(&child->node, &parent->partitions);
+	mutex_unlock(&parent->partitions_lock);
 
-	add_mtd_device(&new->mtd);
+	add_mtd_device(child);
 
-	mtd_add_partition_attrs(new);
+	mtd_add_partition_attrs(child);
 
 	return ret;
 }
@@ -629,110 +278,150 @@ EXPORT_SYMBOL_GPL(mtd_add_partition);
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
+	LIST_HEAD(tmp_list);
 	int err;
 
-	list_for_each_entry_safe(child, next, &mtd_partitions, list) {
-		if (child->parent == &priv->mtd) {
-			err = __mtd_del_partition(child);
-			if (err)
-				return err;
-		}
+	mutex_lock(&mtd->partitions_lock);
+	list_splice_init(&mtd->partitions, &tmp_list);
+	mutex_unlock(&mtd->partitions_lock);
+
+	list_for_each_entry_safe(child, next, &tmp_list, node) {
+		err = __mtd_del_partition(child);
+		if (err)
+			goto err_reinsert_parts;
+
+		list_del(&child->node);
 	}
 
-	sysfs_remove_files(&priv->mtd.dev.kobj, mtd_partition_attrs);
+	sysfs_remove_files(&mtd->dev.kobj, mtd_partition_attrs);
 
-	err = del_mtd_device(&priv->mtd);
+	err = del_mtd_device(mtd);
 	if (err)
 		return err;
 
-	list_del(&priv->list);
-	free_partition(priv);
+	free_partition(mtd);
 
 	return 0;
+
+err_reinsert_parts:
+	mutex_lock(&mtd->partitions_lock);
+	list_splice_init(&tmp_list, &mtd->partitions);
+	mutex_unlock(&mtd->partitions_lock);
+
+	return err;
 }
 
 /*
  * This function unregisters and destroy all slave MTD objects which are
- * attached to the given MTD object.
+ * attached to the given MTD object, recursively.
  */
 int del_mtd_partitions(struct mtd_info *mtd)
 {
-	struct mtd_part *slave, *next;
+	struct mtd_info *child, *next;
+	LIST_HEAD(tmp_list);
 	int ret, err = 0;
 
-	mutex_lock(&mtd_partitions_mutex);
-	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
-		if (slave->parent == mtd) {
-			ret = __mtd_del_partition(slave);
-			if (ret < 0)
-				err = ret;
+	pr_info("Deleting MTD partitions on \"%s\":\n", mtd->name);
+
+	mutex_lock(&mtd->partitions_lock);
+	list_splice_init(&mtd->partitions, &tmp_list);
+	mutex_unlock(&mtd->partitions_lock);
+
+	list_for_each_entry_safe(child, next, &tmp_list, node) {
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
 		}
-	mutex_unlock(&mtd_partitions_mutex);
+
+		list_del(&child->node);
+		free_partition(child);
+	}
+
+	/* Re-insert partitions that could not be deleted. */
+	mutex_lock(&mtd->partitions_lock);
+	list_splice_init(&tmp_list, &mtd->partitions);
+	mutex_unlock(&mtd->partitions_lock);
 
 	return err;
 }
 
 int mtd_del_partition(struct mtd_info *mtd, int partno)
 {
-	struct mtd_part *slave, *next;
+	struct mtd_info *child, *part = NULL;
 	int ret = -EINVAL;
 
-	mutex_lock(&mtd_partitions_mutex);
-	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
-		if ((slave->parent == mtd) &&
-		    (slave->mtd.index == partno)) {
-			ret = __mtd_del_partition(slave);
+	mutex_lock(&mtd->partitions_lock);
+	list_for_each_entry(child, &mtd->partitions, node) {
+		if (child->index == partno) {
+			part = child;
+			list_del(&child->node);
 			break;
 		}
-	mutex_unlock(&mtd_partitions_mutex);
+	}
+	mutex_unlock(&mtd->partitions_lock);
+
+	ret = __mtd_del_partition(part);
+	if (ret) {
+		mutex_lock(&mtd->partitions_lock);
+		list_add_tail(&part->node, &mtd->partitions);
+		mutex_unlock(&mtd->partitions_lock);
+	}
 
 	return ret;
 }
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
+	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n",
+	       nbparts, parent->name);
 
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
 
-		mutex_lock(&mtd_partitions_mutex);
-		list_add(&slave->list, &mtd_partitions);
-		mutex_unlock(&mtd_partitions_mutex);
+		mutex_lock(&parent->partitions_lock);
+		list_add_tail(&child->node, &parent->partitions);
+		mutex_unlock(&parent->partitions_lock);
 
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
@@ -1008,29 +697,11 @@ void mtd_part_parser_cleanup(struct mtd_partitions *parts)
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
-uint64_t mtd_get_device_size(const struct mtd_info *mtd)
+u64 mtd_get_device_size(struct mtd_info *mtd)
 {
-	if (!mtd_is_partition(mtd))
-		return mtd->size;
+	struct mtd_info *master = mtd_get_master(mtd);
 
-	return mtd_get_device_size(mtd_to_part(mtd)->parent);
+	return master->size;
 }
 EXPORT_SYMBOL_GPL(mtd_get_device_size);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 677768b21a1d..93bd55d3cbb8 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -22,6 +22,7 @@
 
 #include <linux/types.h>
 #include <linux/uio.h>
+#include <linux/list.h>
 #include <linux/notifier.h>
 #include <linux/device.h>
 #include <linux/of.h>
@@ -344,8 +345,70 @@ struct mtd_info {
 	int usecount;
 	struct mtd_debug_info dbg;
 	struct nvmem_device *nvmem;
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
+
+	/*
+	 * Lock protecting the partitions list. Only used by master MTD
+	 * devices. Sub-partitions (partitions belonging to another
+	 * partitions) are protected by the master lock.
+	 */
+	struct mutex partitions_lock;
+
+	/*
+	 * Set to 1 when the device is suspended, 0 otherwise. Only meaningful
+	 * for master devices.
+	 */
+	unsigned int suspended : 1;
 };
 
+static inline struct mtd_info *mtd_get_master(struct mtd_info *mtd)
+{
+	while (mtd->parent)
+		mtd = mtd->parent;
+
+	return mtd;
+}
+
+static inline u64 mtd_get_master_offset(struct mtd_info *mtd, u64 ofs)
+{
+	while (mtd->parent) {
+		ofs += mtd->offset;
+		mtd = mtd->parent;
+	}
+
+	return ofs;
+}
+
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
@@ -397,13 +460,16 @@ static inline u32 mtd_oobavail(struct mtd_info *mtd, struct mtd_oob_ops *ops)
 static inline int mtd_max_bad_blocks(struct mtd_info *mtd,
 				     loff_t ofs, size_t len)
 {
-	if (!mtd->_max_bad_blocks)
+	struct mtd_info *master = mtd_get_master(mtd);
+
+	if (!master->_max_bad_blocks)
 		return -ENOTSUPP;
 
 	if (mtd->size < (len + ofs) || ofs < 0)
 		return -EINVAL;
 
-	return mtd->_max_bad_blocks(mtd, ofs, len);
+	return master->_max_bad_blocks(master, mtd_get_master_offset(mtd, ofs),
+				       len);
 }
 
 int mtd_wunit_to_pairing_info(struct mtd_info *mtd, int wunit,
@@ -444,8 +510,10 @@ int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 
 static inline void mtd_sync(struct mtd_info *mtd)
 {
-	if (mtd->_sync)
-		mtd->_sync(mtd);
+	struct mtd_info *master = mtd_get_master(mtd);
+
+	if (master->_sync)
+		master->_sync(master);
 }
 
 int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
@@ -457,13 +525,31 @@ int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs);
 
 static inline int mtd_suspend(struct mtd_info *mtd)
 {
-	return mtd->_suspend ? mtd->_suspend(mtd) : 0;
+	struct mtd_info *master = mtd_get_master(mtd);
+	int ret;
+
+	if (master->suspended)
+		return 0;
+
+	ret = master->_suspend ? master->_suspend(master) : 0;
+	if (ret)
+		return ret;
+
+	master->suspended = 1;
+	return 0;
 }
 
 static inline void mtd_resume(struct mtd_info *mtd)
 {
-	if (mtd->_resume)
-		mtd->_resume(mtd);
+	struct mtd_info *master = mtd_get_master(mtd);
+
+	if (!master->suspended)
+		return;
+
+	if (master->_resume)
+		master->_resume(master);
+
+	master->suspended = 0;
 }
 
 static inline uint32_t mtd_div_by_eb(uint64_t sz, struct mtd_info *mtd)
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 11cb0c50cd84..84631e886f22 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -105,10 +105,9 @@ extern void deregister_mtd_parser(struct mtd_part_parser *parser);
 	module_driver(__mtd_part_parser, register_mtd_parser, \
 		      deregister_mtd_parser)
 
-int mtd_is_partition(const struct mtd_info *mtd);
 int mtd_add_partition(struct mtd_info *master, const char *name,
 		      long long offset, long long length);
 int mtd_del_partition(struct mtd_info *master, int partno);
-uint64_t mtd_get_device_size(const struct mtd_info *mtd);
+u64 mtd_get_device_size(struct mtd_info *mtd);
 
 #endif
-- 
2.19.1
