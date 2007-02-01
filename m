Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HCfxn-0001sB-Oj
	for linux-mtd@lists.infradead.org; Thu, 01 Feb 2007 12:43:16 -0500
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Date: Thu, 01 Feb 2007 19:42:52 +0200
Message-Id: <20070201174252.5664.45918.sendpatchset@localhost.localdomain>
Subject: [PATCH] [MTD] UBI: implement atomic LEB change
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 1abfdcbb9426d9c47709bb70e3a4a8974535be2c Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Thu, 1 Feb 2007 19:25:31 +0200
Subject: [PATCH] [MTD] UBI: implement atomic LEB change

This patch implements the atomic LEB change feature which allows
to change the contents of a logical eraseblock atomically.

This patch makes UBI reserve one more PEB which is needed to
implement this feature.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/eba.c   |  192 ++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/mtd/ubi/eba.h   |   47 +++++++++--
 drivers/mtd/ubi/uif.c   |   62 +++++++++++++++
 include/linux/mtd/ubi.h |   54 +++++++++++++-
 4 files changed, 342 insertions(+), 13 deletions(-)

Index: ubi-2.6.git/drivers/mtd/ubi/eba.c
===================================================================
--- ubi-2.6.git.orig/drivers/mtd/ubi/eba.c
+++ ubi-2.6.git/drivers/mtd/ubi/eba.c
@@ -22,7 +22,7 @@
 #include <linux/sched.h>
 #include <linux/crc32.h>
 #include <linux/spinlock.h>
-#include <linux/rwsem.h>
+#include <linux/mutex.h>
 #include <linux/err.h>
 #include <linux/types.h>
 #include <mtd/ubi-header.h>
@@ -41,6 +41,12 @@
 #include "debug.h"
 
 /*
+ * The EBA unit reserves on PEB to implement the atomic eraseblock movement
+ * feature.
+ */
+#define EBA_RESERVED_PEBS 1
+
+/*
  * The highest bit in logical-to-physical eraseblock mappings is used to
  * indicate that the logical eraseblock is not mapped.
  */
@@ -164,6 +170,34 @@ static inline void leb_unmap(const struc
 }
 
 /**
+ * leb_remap - re-map a logical eraseblock to another physical eraseblock.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: the volume ID
+ * @lnum: the logical eraseblock number
+ * @new_pnum: new physical eraseblock
+ *
+ * This function re-maps a logical eraseblock from one physical eraseblock to
+ * another physical eraseblock.
+ * The logical eraseblock has to be locked.
+ */
+static inline void leb_remap(const struct ubi_info *ubi, int vol_id, int lnum,
+			     int new_pnum)
+{
+	int idx;
+	struct ubi_eba_info *eba = ubi->eba;
+
+	idx = vol_id2idx(ubi, vol_id);
+
+	spin_lock(&eba->eba_tbl_lock);
+	ubi_assert(eba->eba_tbl[idx].recs);
+	ubi_assert(eba->eba_tbl[idx].recs[lnum].pnum >= 0);
+	eba->eba_tbl[idx].recs[lnum].pnum = new_pnum;
+	eba->eba_tbl[idx].recs[lnum].leb_ver += 1;
+	spin_unlock(&eba->eba_tbl_lock);
+}
+
+/**
  * leb2peb - get physical eraseblock number the logical eraseblock is mapped
  * to.
  *
@@ -413,6 +447,7 @@ int ubi_eba_read_leb(const struct ubi_in
 		*read = len;
 		return 0;
 	}
+
 	dbg_eba("read %zd bytes from offset %d of LEB %d:%d, PEB %d",
 		len, offset, vol_id, lnum, pnum);
 
@@ -576,8 +611,10 @@ retry:
 	pnum = ubi_wl_get_peb(ubi, dtype);
 	if (unlikely(pnum < 0)) {
 		err = pnum;
+		dbg_err("cannot get free PEB - error %d", err);
 		goto out_vid_hdr;
 	}
+
 	dbg_eba("write VID hdr and %zd bytes at offset %d of LEB %d:%d, PEB %d",
 		len, offset, vol_id, lnum, pnum);
 
@@ -725,8 +762,10 @@ retry:
 	pnum = ubi_wl_get_peb(ubi, dtype);
 	if (unlikely(pnum < 0)) {
 		err = pnum;
+		dbg_err("cannot get free PEB - error %d", err);
 		goto out_vid_hdr;
 	}
+
 	dbg_eba("write VID hdr and %zd bytes at of LEB %d:%d, PEB %d",
 		len, vol_id, lnum, pnum);
 
@@ -757,7 +796,6 @@ out_unlock:
 	/* Write failure */
 write_error:
 	ubi_free_vid_hdr(ubi, vid_hdr);
-	ubi_free_vid_hdr(ubi, vid_hdr);
 	if (err != -EIO || !io->bad_allowed)
 		goto no_bad_eraseblocks;
 
@@ -783,6 +821,151 @@ no_bad_eraseblocks:
 	return err;
 }
 
+int ubi_eba_atomic_leb_change(const struct ubi_info *ubi, int vol_id, int lnum,
+			      const void *buf, size_t len,
+			      enum ubi_data_type dtype)
+{
+	int err, err1, old_pnum, new_pnum, tries = 0;
+	uint32_t leb_ver;
+	struct ubi_vid_hdr *vid_hdr;
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_eba_info *eba = ubi->eba;
+	const struct ubi_io_info *io = ubi->io;
+
+retry:
+	/* Input arguments sanity check */
+	ubi_assert(vol_id >= 0);
+	ubi_assert(vol_id < ubi->acc->max_volumes || ubi_is_ivol(vol_id));
+	ubi_assert(lnum >= 0);
+	ubi_assert(len >= 0);
+	ubi_assert(dtype == UBI_DATA_LONGTERM || dtype == UBI_DATA_SHORTTERM ||
+		   dtype == UBI_DATA_UNKNOWN);
+
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	ubi_assert(!IS_ERR(vtr));
+	ubi_assert(len <= io->leb_size - vtr->data_pad);
+	ubi_assert(lnum < ubi->eba->eba_tbl[vol_id2idx(ubi, vol_id)].leb_count);
+	ubi_assert(len % io->min_io_size == 0);
+	ubi_assert(vtr->vol_type == UBI_DYNAMIC_VOLUME);
+
+	if (unlikely(ubi->io->ro_mode)) {
+		dbg_err("read-only mode");
+		return -EROFS;
+	}
+
+	mutex_lock(&eba->change_mutex);
+
+	new_pnum = ubi_wl_get_peb(ubi, dtype);
+	if (unlikely(new_pnum < 0)) {
+		err = new_pnum;
+		dbg_err("cannot get free PEB - error %d", err);
+		goto out_unlock_mutex;
+	}
+
+	err = ubi_eba_leb_write_lock(ubi, vol_id, lnum);
+	if (unlikely(err))
+		goto out_put_unlock_mutex;
+
+	old_pnum = leb2peb(ubi, vol_id, lnum);
+	leb_ver = leb_get_ver(ubi, vol_id, lnum);
+
+	dbg_eba("change LEB %d:%d with %zd bytes of data, old PEB %d, "
+		"new PEB is %d", vol_id, lnum, len, old_pnum, new_pnum);
+
+	/*
+	 * We are ready to write new data to the new physical eraseblock. Write
+	 * the VID header first, then data.
+	 */
+	vid_hdr = ubi_zalloc_vid_hdr(ubi);
+	if (unlikely(!vid_hdr)) {
+		err = -ENOMEM;
+		goto out_unlock_leb_put;
+	}
+
+	leb_ver += 1; /* we have to increase the version */
+	vid_hdr->leb_ver = cpu_to_ubi32(leb_ver);
+	vid_hdr->vol_type = UBI_VID_DYNAMIC;
+	vid_hdr->vol_id = cpu_to_ubi32(vol_id);
+	vid_hdr->lnum = cpu_to_ubi32(lnum);
+	vid_hdr->compat = ubi_vtbl_get_compat(ubi, vol_id);
+	vid_hdr->data_pad = cpu_to_ubi32(vtr->data_pad);
+
+	err = ubi_io_write_vid_hdr(ubi, new_pnum, vid_hdr);
+	if (unlikely(err))
+		goto write_error;
+
+	if (len != 0) {
+		size_t written;
+
+		err = ubi_io_write_data(ubi, buf, new_pnum, 0, len, &written);
+		if (unlikely(err))
+			goto write_error;
+	}
+
+	/*
+	 * The data is there, we need to re-map our LEB from @old_pnum to
+	 * @new_pnum.
+	 */
+	leb_remap(ubi, vol_id, lnum, new_pnum);
+
+	/* And drop the old physical eraseblock */
+	err = ubi_wl_put_peb(ubi, old_pnum, 0);
+	if (unlikely(err))
+		/*
+		 * No idea what is this. But the best we can do is to switch to
+		 * R/O mode.
+		 */
+		ubi_eba_ro_mode(ubi);
+
+
+	ubi_free_vid_hdr(ubi, vid_hdr);
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+	mutex_unlock(&eba->change_mutex);
+	return err;
+
+out_unlock_leb_put:
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+out_put_unlock_mutex:
+	err1 = ubi_wl_put_peb(ubi, new_pnum, 0);
+	if (err1)
+		/*
+		 * Something really bad is going on, switch to R/O mode just in
+		 * case.
+		 */
+		ubi_eba_ro_mode(ubi);
+out_unlock_mutex:
+	mutex_unlock(&eba->change_mutex);
+	return err;
+
+write_error:
+	ubi_free_vid_hdr(ubi, vid_hdr);
+	if (err != -EIO || !io->bad_allowed)
+		goto no_bad_eraseblocks;
+
+	/*
+	 * We assume that if this physical eraseblock went bad - the erase code
+	 * will handle that.
+	 */
+	ubi_msg("try to recover form the error");
+	err = ubi_wl_put_peb(ubi, new_pnum, 1);
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+	mutex_unlock(&eba->change_mutex);
+	if (err || ++tries > 5)
+		return err;
+	goto retry;
+
+	/*
+	 * This flash device does not admit of bad eraseblocks or something
+	 * nasty and unexpected happened. Switch to read-only mode just in
+	 * case.
+	 */
+no_bad_eraseblocks:
+	ubi_eba_ro_mode(ubi);
+	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
+	mutex_unlock(&eba->change_mutex);
+	return err;
+}
+
 int ubi_eba_leb_is_mapped(const struct ubi_info *ubi, int vol_id, int lnum)
 {
 	dbg_eba("check LEB %d:%d PEBs", vol_id, lnum);
@@ -942,6 +1125,7 @@ int ubi_eba_init_scan(struct ubi_info *u
 
 	spin_lock_init(&eba->eba_tbl_lock);
 	spin_lock_init(&eba->ltree_lock);
+	mutex_init(&eba->change_mutex);
 	eba->ltree = RB_ROOT;
 
 	eba->num_volumes = acc->max_volumes + acc->ivol_count;
@@ -952,6 +1136,10 @@ int ubi_eba_init_scan(struct ubi_info *u
 		goto out;
 	}
 
+	err = ubi_acc_reserve(ubi, EBA_RESERVED_PEBS);
+	if (err)
+		goto out;
+
 	err = build_eba_tbl(ubi, si);
 	if (err)
 		goto out;
Index: ubi-2.6.git/drivers/mtd/ubi/eba.h
===================================================================
--- ubi-2.6.git.orig/drivers/mtd/ubi/eba.h
+++ ubi-2.6.git/drivers/mtd/ubi/eba.h
@@ -41,6 +41,7 @@
 #include <linux/rwsem.h>
 #include <linux/rbtree.h>
 #include <linux/mtd/ubi.h>
+#include <linux/mutex.h>
 
 struct ubi_info;
 struct ubi_scan_info;
@@ -78,8 +79,8 @@ int ubi_eba_rmvol(const struct ubi_info 
  * @reserved_pebs: new count of physical eraseblocks in this volume
  *
  * This function changes the EBA table accordingly to the volume re-size
- * operation. If the volume is actually shrinked, the dropped logical
- * eraseblocs are got unmapped an thus, the corresponding physical eraseblocs
+ * operation. If the volume is actually shrunken, the dropped logical
+ * eraseblocks are got unmapped an thus, the corresponding physical eraseblocks
  * are scheduled for erasure. This function returns zero in case of success and
  * a negative error code in case of failure.
  */
@@ -101,7 +102,7 @@ int ubi_eba_erase_leb(const struct ubi_i
  * ubi_eba_read_leb - read data from a logical eraseblock.
  *
  * @ubi: the UBI device description object
- * @vol_id: the volume ID from where to read
+ * @vol_id: ID of the volume to read
  * @lnum: the logical eraseblock number to read from
  * @buf: the buffer to store the read data
  * @offset: the offset within the logical eraseblock from where to read
@@ -131,7 +132,7 @@ int ubi_eba_read_leb(const struct ubi_in
  * ubi_eba_write_leb - write data to a logical eraseblock of a dynamic volume.
  *
  * @ubi: the UBI device description object
- * @vol_id: the volume ID where to write
+ * @vol_id: ID of volume to write
  * @lnum: the logical eraseblock number to write
  * @buf: the data to write
  * @offset: the offset within the logical eraseblock where to write
@@ -139,10 +140,11 @@ int ubi_eba_read_leb(const struct ubi_in
  * @dtype: data type
  * @written: how many bytes were actually written
  *
- * This function writes data to a logical eraseblock of a dynamic volume.
- * Returns zero in case of success and a negative error code in case of
- * failure. The @written field contains the number of successfully written
- * bytes.
+ * This function writes data to a logical eraseblock of a dynamic volume. The
+ * @len and @offset arguments have to be aligned to the minimal I/O unit size.
+ * This function returns zero in case of success and a negative error code in
+ * case of failure. The @written field contains the number of successfully
+ * written bytes.
  */
 int ubi_eba_write_leb(const struct ubi_info *ubi, int vol_id, int lnum,
 		      const void *buf, int offset, size_t len,
@@ -152,7 +154,7 @@ int ubi_eba_write_leb(const struct ubi_i
  * ubi_eba_write_leb_st - write data to a logical eraseblock of a static volume.
  *
  * @ubi: the UBI device description object
- * @vol_id: the volume ID where to write
+ * @vol_id: ID of the volume to write
  * @lnum: the logical eraseblock number to write
  * @buf: the data to write
  * @len: how many bytes to write
@@ -182,6 +184,31 @@ int ubi_eba_write_leb_st(const struct ub
 			 size_t *written, int used_ebs);
 
 /**
+ * ubi_eba_atomic_leb_change - change the contents of an eraseblock atomically.
+ *
+ * @ubi: the UBI device description object
+ * @vol_id: ID of volume ID to change
+ * @lnum the logical eraseblock number to change
+ * @buf: new logical eraseblock contents
+ * @len: the amount of new data to write
+ * @dtype: data type
+ *
+ * This function changes the contents of the logical eraseblock @lnum of volume
+ * @vol_id atomically. This means, the function puts new data (from @buf) to
+ * the logical eraseblock and guarantees that in case of an interruption (like
+ * an unclean reboot) the old contents will be preserved and won't be damaged.
+ *
+ * The @len and @offset arguments have to be aligned to the minimal I/O unit
+ * size. This function returns zero in case of success and a negative error
+ * code in case of failure. If the function fails - either the old contents of
+ * the logical eraseblock is fully preserved or the new contents is fully
+ * written on flash.
+ */
+int ubi_eba_atomic_leb_change(const struct ubi_info *ubi, int vol_id, int lnum,
+			      const void *buf, size_t len,
+			      enum ubi_data_type dtype);
+
+/**
  * ubi_eba_leb_is_mapped - check if a logical eraseblock is mapped.
  *
  * @ubi: the UBI device description object
@@ -339,6 +366,7 @@ struct ubi_eba_ltree_entry {
  * @ltree: the lock tree
  * @ltree_lock: protects the lock tree
  * @num_volumes: number of volumes mapped by the EBA table
+ * @change_mutex: serializes the atomic eraseblock change operation
  *
  * The EBA unit implements per-logical eraseblock locking. Before accessing a
  * logical eraseblock it is locked for reading or writing. The per-logical
@@ -354,6 +382,7 @@ struct ubi_eba_info {
 	struct rb_root ltree;               /* private */
 	spinlock_t ltree_lock;              /* private */
 	size_t num_volumes;                 /* private */
+	struct mutex change_mutex;          /* private */
 };
 
 #endif /* !__UBI_EBA_H__ */
Index: ubi-2.6.git/drivers/mtd/ubi/uif.c
===================================================================
--- ubi-2.6.git.orig/drivers/mtd/ubi/uif.c
+++ ubi-2.6.git/drivers/mtd/ubi/uif.c
@@ -466,6 +466,68 @@ int ubi_eraseblock_write(struct ubi_vol_
 }
 EXPORT_SYMBOL_GPL(ubi_eraseblock_write);
 
+int ubi_atomic_eraseblock_change(struct ubi_vol_desc *udesc, int lnum,
+				 const void *buf, size_t len,
+				 enum ubi_data_type dtype)
+{
+	const struct ubi_vtbl_vtr *vtr;
+	struct ubi_vol_desc *desc = udesc;
+	const struct ubi_info *ubi = desc->vol->ubi;
+	const struct ubi_io_info *io = ubi->io;
+	int vol_id = desc->vol->vol_id;
+
+	dbg_uif("atomically write %zd bytes to LEB %d:%d",
+		len, vol_id, lnum);
+
+	if (unlikely(vol_id < 0 || vol_id >= ubi->acc->max_volumes)) {
+		dbg_err("bad vol_id %d", vol_id);
+		return -EINVAL;
+	}
+
+	vtr = ubi_vtbl_get_vtr(ubi, vol_id);
+	ubi_assert(!IS_ERR(vtr));
+
+	if (unlikely(desc->mode == UBI_READONLY)) {
+		dbg_err("read-only mode");
+		return -EROFS;
+	}
+
+	if (unlikely(vtr->vol_type == UBI_STATIC_VOLUME)) {
+		dbg_err("static volume");
+		return -EROFS;
+	}
+
+	if (unlikely(lnum < 0 || lnum >= vtr->reserved_pebs)) {
+		dbg_err("bad lnum %d", lnum);
+		return -EINVAL;
+	}
+
+	if (unlikely(len < 0 || len > vtr->usable_leb_size)) {
+		dbg_err("bad len %zd", len);
+		return -EINVAL;
+	}
+
+	if (unlikely(len % io->min_io_size)) {
+		dbg_err("unaligned len %zd", len);
+		return -EINVAL;
+	}
+
+	if (unlikely(dtype != UBI_DATA_LONGTERM &&
+		     dtype != UBI_DATA_SHORTTERM &&
+		     dtype != UBI_DATA_UNKNOWN)) {
+		dbg_err("bad dtype %d", dtype);
+		return -EINVAL;
+	}
+
+	if (unlikely(vtr->upd_marker)) {
+		dbg_err("writing update-interrupted volume");
+		return -EBADF;
+	}
+
+	return ubi_eba_atomic_leb_change(ubi, vol_id, lnum, buf, len, dtype);
+}
+EXPORT_SYMBOL_GPL(ubi_atomic_eraseblock_change);
+
 int ubi_eraseblock_erase(struct ubi_vol_desc *udesc, int lnum)
 {
 	const struct ubi_vtbl_vtr *vtr;
Index: ubi-2.6.git/include/linux/mtd/ubi.h
===================================================================
--- ubi-2.6.git.orig/include/linux/mtd/ubi.h
+++ ubi-2.6.git/include/linux/mtd/ubi.h
@@ -258,7 +258,7 @@ void ubi_close_volume(struct ubi_vol_des
  * corrupted. But the read data is actually OK.
  *
  * Note, if a volume is damaged because of an interrupted update (the
- * @upd_marker flag is set) this function just returns immidiately with %-EBADF
+ * @upd_marker flag is set) this function just returns immediately with %-EBADF
  * error code. In other words, volumes like that cannot be read before re-doing
  * the update operation.
  */
@@ -335,6 +335,56 @@ static inline int ubi_write(struct ubi_v
 }
 
 /**
+ * ubi_atomic_eraseblock_change - change the contents of a logical eraseblock
+ * atomically.
+ *
+ * @udesc: volume descriptor
+ * @lnum the logical eraseblock number to change
+ * @buf: new logical eraseblock contents
+ * @len: the amount of new data to write
+ * @dtype: data type
+ *
+ * This function changes the contents of the logical eraseblock @lnum
+ * atomically. This means, the function puts new data (from @buf) to the
+ * logical eraseblock and guarantees that in case of an interruption (like an
+ * unclean reboot) the old contents will be preserved and won't be damaged.
+ *
+ * The idea of how this function is implemented is that it writes new data
+ * (@buf) to some new physical eraseblock, then just re-maps this logical
+ * eraseblock to it. The old physical eraseblock is then scheduled for erasure.
+ *
+ * The @len and @offset arguments have to be aligned to the minimal I/O unit
+ * size. This function returns zero in case of success and a negative error
+ * code in case of failure. If the function fails - either the old contents of
+ * the logical eraseblock is fully preserved or the new contents is fully
+ * written on flash.
+ *
+ */
+int ubi_atomic_eraseblock_change(struct ubi_vol_desc *udesc, int lnum,
+				 const void *buf, size_t len,
+				 enum ubi_data_type dtype);
+
+/**
+ * ubi_atomic_change - change the contents of a logical eraseblock atomically
+ * (simplified).
+ *
+ * @udesc: volume descriptor
+ * @lnum the logical eraseblock number to change
+ * @buf: new logical eraseblock contents
+ * @len: the amount of new data to write
+ *
+ * This function is the same as the 'ubi_atomic_eraseblock_change()' functions,
+ * but it does not have the data type argument.
+ */
+static inline int ubi_atomic_change(struct ubi_vol_desc *udesc, int lnum,
+				 const void *buf, size_t len)
+{
+	return ubi_atomic_eraseblock_change(udesc, lnum, buf, len,
+					    UBI_DATA_UNKNOWN);
+}
+
+
+/**
  * ubi_eraseblock_erase - erase a logical eraseblock.
  *
  * @udesc: volume descriptor
@@ -344,7 +394,7 @@ static inline int ubi_write(struct ubi_v
  * case of failure.
  *
  * Note, UBI erases eraseblocks asynchronously. This means that this function
- * will basically unmap this logical eraseblock from its physical eraseblock,
+ * will basically un-map this logical eraseblock from its physical eraseblock,
  * schedule the physical eraseblock for erasure and return.
  */
 int ubi_eraseblock_erase(struct ubi_vol_desc *udesc, int lnum);
