Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkud0-0007dp-Mx
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 15:00:44 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 17/18] UBI: hide EBA internals
Date: Fri, 16 Sep 2016 16:59:25 +0200
Message-Id: <1474037966-5524-18-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1474037966-5524-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1474037966-5524-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Create a private ubi_eba_table struct to hide EBA internals and provide
helpers to allocate, destroy, copy and assing an EBA table to a volume.

Now that external EBA users are using helpers to query/modify the EBA
state we can safely change the internal representation, which will be
needed to support the LEB consolidation concept.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/build.c |   2 +-
 drivers/mtd/ubi/eba.c   | 166 ++++++++++++++++++++++++++++++++++++++++--------
 drivers/mtd/ubi/ubi.h   |   8 ++-
 drivers/mtd/ubi/vmt.c   |  40 +++++-------
 4 files changed, 165 insertions(+), 51 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 0680516bb472..85d54f37e28f 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -574,7 +574,7 @@ void ubi_free_internal_volumes(struct ubi_device *ubi)
 
 	for (i = ubi->vtbl_slots;
 	     i < ubi->vtbl_slots + UBI_INT_VOL_COUNT; i++) {
-		kfree(ubi->volumes[i]->eba_tbl);
+		ubi_eba_replace_table(ubi->volumes[i], NULL);
 		kfree(ubi->volumes[i]);
 	}
 }
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index f3ff8604b5e5..884c91ffe7ba 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -50,6 +50,30 @@
 #define EBA_RESERVED_PEBS 1
 
 /**
+ * struct ubi_eba_entry - structure encoding a single LEB -> PEB association
+ * @pnum: the physical eraseblock number attached to the LEB
+ *
+ * This structure is encoding a LEB -> PEB association. Note that the LEB
+ * number is not stored here, because it is the index used to access the
+ * entries table.
+ */
+struct ubi_eba_entry {
+	int pnum;
+};
+
+/**
+ * struct ubi_eba_table - LEB -> PEB association information
+ * @entries: the LEB to PEB mapping (one entry per LEB).
+ *
+ * This structure is private to the EBA logic and should be kept here.
+ * It is encoding the LEB to PEB association table, and is subject to
+ * changes.
+ */
+struct ubi_eba_table {
+	struct ubi_eba_entry *entries;
+};
+
+/**
  * next_sqnum - get next sequence number.
  * @ubi: UBI device description object
  *
@@ -97,7 +121,94 @@ void ubi_eba_get_ldesc(struct ubi_volume *vol, int lnum,
 		       struct ubi_eba_leb_desc *ldesc)
 {
 	ldesc->lnum = lnum;
-	ldesc->pnum = vol->eba_tbl[lnum];
+	ldesc->pnum = vol->eba_tbl->entries[lnum].pnum;
+}
+
+/**
+ * ubi_eba_create_table - allocate a new EBA table and initialize it with all
+ *			  LEBs unmapped
+ * @vol: volume containing the EBA table to copy
+ * @nentries: number of entries in the table
+ *
+ * Allocate a new EBA table and initialize it with all LEBs unmapped.
+ * Returns a valid pointer if it succeed, an ERR_PTR() otherwise.
+ */
+struct ubi_eba_table *ubi_eba_create_table(struct ubi_volume *vol,
+					   int nentries)
+{
+	struct ubi_eba_table *tbl;
+	int err = -ENOMEM;
+	int i;
+
+	tbl = kzalloc(sizeof(*tbl), GFP_KERNEL);
+	if (!tbl)
+		return ERR_PTR(-ENOMEM);
+
+	tbl->entries = kmalloc_array(nentries, sizeof(*tbl->entries),
+				     GFP_KERNEL);
+	if (!tbl->entries)
+		goto err;
+
+	for (i = 0; i < nentries; i++)
+		tbl->entries[i].pnum = UBI_LEB_UNMAPPED;
+
+	return tbl;
+
+err:
+	kfree(tbl->entries);
+	kfree(tbl);
+
+	return ERR_PTR(err);
+}
+
+/**
+ * ubi_eba_destroy_table - destroy an EBA table
+ * @tbl: the table to destroy
+ *
+ * Destroy an EBA table.
+ */
+void ubi_eba_destroy_table(struct ubi_eba_table *tbl)
+{
+	if (!tbl)
+		return;
+
+	kfree(tbl->entries);
+	kfree(tbl);
+}
+
+/**
+ * ubi_eba_copy_table - copy the EBA table attached to vol into another table
+ * @vol: volume containing the EBA table to copy
+ * @dst: destination
+ * @nentries: number of entries to copy
+ *
+ * Copy the EBA table stored in vol into the one pointed by dst.
+ */
+void ubi_eba_copy_table(struct ubi_volume *vol, struct ubi_eba_table *dst,
+			int nentries)
+{
+	struct ubi_eba_table *src;
+	int i;
+
+	ubi_assert(dst && vol && vol->eba_tbl);
+
+	src = vol->eba_tbl;
+
+	for (i = 0; i < nentries; i++)
+		dst->entries[i].pnum = src->entries[i].pnum;
+}
+
+/**
+ * ubi_eba_replace_table - assign a new EBA table to a volume
+ * @vol: volume containing the EBA table to copy
+ * @tbl: new EBA table
+ *
+ * Assign a new EBA table to the volume and release the old one.
+ */
+void ubi_eba_replace_table(struct ubi_volume *vol, struct ubi_eba_table *tbl)
+{
+	ubi_eba_destroy_table(vol->eba_tbl);
+	vol->eba_tbl = tbl;
 }
 
 /**
@@ -337,7 +448,7 @@ static void leb_write_unlock(struct ubi_device *ubi, int vol_id, int lnum)
  */
 bool ubi_eba_is_mapped(struct ubi_volume *vol, int lnum)
 {
-	return vol->eba_tbl[lnum] >= 0;
+	return vol->eba_tbl->entries[lnum].pnum >= 0;
 }
 
 /**
@@ -362,7 +473,7 @@ int ubi_eba_unmap_leb(struct ubi_device *ubi, struct ubi_volume *vol,
 	if (err)
 		return err;
 
-	pnum = vol->eba_tbl[lnum];
+	pnum = vol->eba_tbl->entries[lnum].pnum;
 	if (pnum < 0)
 		/* This logical eraseblock is already unmapped */
 		goto out_unlock;
@@ -370,7 +481,7 @@ int ubi_eba_unmap_leb(struct ubi_device *ubi, struct ubi_volume *vol,
 	dbg_eba("erase LEB %d:%d, PEB %d", vol_id, lnum, pnum);
 
 	down_read(&ubi->fm_eba_sem);
-	vol->eba_tbl[lnum] = UBI_LEB_UNMAPPED;
+	vol->eba_tbl->entries[lnum].pnum = UBI_LEB_UNMAPPED;
 	up_read(&ubi->fm_eba_sem);
 	err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 0);
 
@@ -409,7 +520,7 @@ int ubi_eba_read_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 	if (err)
 		return err;
 
-	pnum = vol->eba_tbl[lnum];
+	pnum = vol->eba_tbl->entries[lnum].pnum;
 	if (pnum < 0) {
 		/*
 		 * The logical eraseblock is not mapped, fill the whole buffer
@@ -658,7 +769,7 @@ out_unlock:
 	mutex_unlock(&ubi->buf_mutex);
 
 	if (!err)
-		vol->eba_tbl[lnum] = new_pnum;
+		vol->eba_tbl->entries[lnum].pnum = new_pnum;
 
 out_put:
 	up_read(&ubi->fm_eba_sem);
@@ -749,7 +860,7 @@ static int try_write_vid_and_data(struct ubi_volume *vol, int lnum,
 		goto out_put;
 	}
 
-	opnum = vol->eba_tbl[lnum];
+	opnum = vol->eba_tbl->entries[lnum].pnum;
 
 	dbg_eba("write VID hdr and %d bytes at offset %d of LEB %d:%d, PEB %d",
 		len, offset, vol_id, lnum, pnum);
@@ -771,7 +882,7 @@ static int try_write_vid_and_data(struct ubi_volume *vol, int lnum,
 		}
 	}
 
-	vol->eba_tbl[lnum] = pnum;
+	vol->eba_tbl->entries[lnum].pnum = pnum;
 
 out_put:
 	up_read(&ubi->fm_eba_sem);
@@ -812,7 +923,7 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 	if (err)
 		return err;
 
-	pnum = vol->eba_tbl[lnum];
+	pnum = vol->eba_tbl->entries[lnum].pnum;
 	if (pnum >= 0) {
 		dbg_eba("write %d bytes at offset %d of LEB %d:%d, PEB %d",
 			len, offset, vol_id, lnum, pnum);
@@ -930,7 +1041,7 @@ int ubi_eba_write_leb_st(struct ubi_device *ubi, struct ubi_volume *vol,
 	vid_hdr->used_ebs = cpu_to_be32(used_ebs);
 	vid_hdr->data_crc = cpu_to_be32(crc);
 
-	ubi_assert(vol->eba_tbl[lnum] < 0);
+	ubi_assert(vol->eba_tbl->entries[lnum].pnum < 0);
 
 	for (tries = 0; tries <= UBI_IO_RETRIES; tries++) {
 		err = try_write_vid_and_data(vol, lnum, vid_hdr, buf, 0, len);
@@ -1140,9 +1251,9 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	 * probably waiting on @ubi->move_mutex. No need to continue the work,
 	 * cancel it.
 	 */
-	if (vol->eba_tbl[lnum] != from) {
+	if (vol->eba_tbl->entries[lnum].pnum != from) {
 		dbg_wl("LEB %d:%d is no longer mapped to PEB %d, mapped to PEB %d, cancel",
-		       vol_id, lnum, from, vol->eba_tbl[lnum]);
+		       vol_id, lnum, from, vol->eba_tbl->entries[lnum].pnum);
 		err = MOVE_CANCEL_RACE;
 		goto out_unlock_leb;
 	}
@@ -1227,9 +1338,9 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		cond_resched();
 	}
 
-	ubi_assert(vol->eba_tbl[lnum] == from);
+	ubi_assert(vol->eba_tbl->entries[lnum].pnum == from);
 	down_read(&ubi->fm_eba_sem);
-	vol->eba_tbl[lnum] = to;
+	vol->eba_tbl->entries[lnum].pnum = to;
 	up_read(&ubi->fm_eba_sem);
 
 out_unlock_buf:
@@ -1386,7 +1497,7 @@ out_free:
  */
 int ubi_eba_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
-	int i, j, err, num_volumes;
+	int i, err, num_volumes;
 	struct ubi_ainf_volume *av;
 	struct ubi_volume *vol;
 	struct ubi_ainf_peb *aeb;
@@ -1402,35 +1513,39 @@ int ubi_eba_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	num_volumes = ubi->vtbl_slots + UBI_INT_VOL_COUNT;
 
 	for (i = 0; i < num_volumes; i++) {
+		struct ubi_eba_table *tbl;
+
 		vol = ubi->volumes[i];
 		if (!vol)
 			continue;
 
 		cond_resched();
 
-		vol->eba_tbl = kmalloc(vol->reserved_pebs * sizeof(int),
-				       GFP_KERNEL);
-		if (!vol->eba_tbl) {
-			err = -ENOMEM;
+		tbl = ubi_eba_create_table(vol, vol->reserved_pebs);
+		if (IS_ERR(tbl)) {
+			err = PTR_ERR(tbl);
 			goto out_free;
 		}
 
-		for (j = 0; j < vol->reserved_pebs; j++)
-			vol->eba_tbl[j] = UBI_LEB_UNMAPPED;
+		ubi_eba_replace_table(vol, tbl);
 
 		av = ubi_find_av(ai, idx2vol_id(ubi, i));
 		if (!av)
 			continue;
 
 		ubi_rb_for_each_entry(rb, aeb, &av->root, u.rb) {
-			if (aeb->lnum >= vol->reserved_pebs)
+			if (aeb->lnum >= vol->reserved_pebs) {
 				/*
 				 * This may happen in case of an unclean reboot
 				 * during re-size.
 				 */
 				ubi_move_aeb_to_list(av, aeb, &ai->erase);
-			else
-				vol->eba_tbl[aeb->lnum] = aeb->pnum;
+			} else {
+				struct ubi_eba_entry *entry;
+
+				entry = &vol->eba_tbl->entries[aeb->lnum];
+				entry->pnum = aeb->pnum;
+			}
 		}
 	}
 
@@ -1467,8 +1582,7 @@ out_free:
 	for (i = 0; i < num_volumes; i++) {
 		if (!ubi->volumes[i])
 			continue;
-		kfree(ubi->volumes[i]->eba_tbl);
-		ubi->volumes[i]->eba_tbl = NULL;
+		ubi_eba_replace_table(ubi->volumes[i], NULL);
 	}
 	return err;
 }
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 98e5dac677ee..bc145229a53c 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -359,7 +359,7 @@ struct ubi_volume {
 	long long upd_received;
 	void *upd_buf;
 
-	int *eba_tbl;
+	struct ubi_eba_table *eba_tbl;
 	unsigned int checked:1;
 	unsigned int corrupted:1;
 	unsigned int upd_marker:1;
@@ -864,6 +864,12 @@ static inline bool ubi_leb_valid(struct ubi_volume *vol, int lnum)
 }
 
 /* eba.c */
+struct ubi_eba_table *ubi_eba_create_table(struct ubi_volume *vol,
+					   int nentries);
+void ubi_eba_destroy_table(struct ubi_eba_table *tbl);
+void ubi_eba_copy_table(struct ubi_volume *vol, struct ubi_eba_table *dst,
+			int nentries);
+void ubi_eba_replace_table(struct ubi_volume *vol, struct ubi_eba_table *tbl);
 void ubi_eba_get_ldesc(struct ubi_volume *vol, int lnum,
 		       struct ubi_eba_leb_desc *ldesc);
 bool ubi_eba_is_mapped(struct ubi_volume *vol, int lnum);
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 0138f526474a..7ac78c13dd1c 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -138,7 +138,7 @@ static void vol_release(struct device *dev)
 {
 	struct ubi_volume *vol = container_of(dev, struct ubi_volume, dev);
 
-	kfree(vol->eba_tbl);
+	ubi_eba_replace_table(vol, NULL);
 	kfree(vol);
 }
 
@@ -158,6 +158,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	int i, err, vol_id = req->vol_id, do_free = 1;
 	struct ubi_volume *vol;
 	struct ubi_vtbl_record vtbl_rec;
+	struct ubi_eba_table *eba_tbl = NULL;
 	dev_t dev;
 
 	if (ubi->ro_mode)
@@ -241,14 +242,13 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	if (err)
 		goto out_acc;
 
-	vol->eba_tbl = kmalloc(vol->reserved_pebs * sizeof(int), GFP_KERNEL);
-	if (!vol->eba_tbl) {
-		err = -ENOMEM;
+	eba_tbl = ubi_eba_create_table(vol, vol->reserved_pebs);
+	if (IS_ERR(eba_tbl)) {
+		err = PTR_ERR(eba_tbl);
 		goto out_acc;
 	}
 
-	for (i = 0; i < vol->reserved_pebs; i++)
-		vol->eba_tbl[i] = UBI_LEB_UNMAPPED;
+	ubi_eba_replace_table(vol, eba_tbl);
 
 	if (vol->vol_type == UBI_DYNAMIC_VOLUME) {
 		vol->used_ebs = vol->reserved_pebs;
@@ -329,7 +329,7 @@ out_cdev:
 	cdev_del(&vol->cdev);
 out_mapping:
 	if (do_free)
-		kfree(vol->eba_tbl);
+		ubi_eba_destroy_table(eba_tbl);
 out_acc:
 	spin_lock(&ubi->volumes_lock);
 	ubi->rsvd_pebs -= vol->reserved_pebs;
@@ -427,10 +427,11 @@ out_unlock:
  */
 int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 {
-	int i, err, pebs, *new_mapping;
+	int i, err, pebs;
 	struct ubi_volume *vol = desc->vol;
 	struct ubi_device *ubi = vol->ubi;
 	struct ubi_vtbl_record vtbl_rec;
+	struct ubi_eba_table *new_eba_tbl = NULL;
 	int vol_id = vol->vol_id;
 
 	if (ubi->ro_mode)
@@ -450,12 +451,9 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 	if (reserved_pebs == vol->reserved_pebs)
 		return 0;
 
-	new_mapping = kmalloc(reserved_pebs * sizeof(int), GFP_KERNEL);
-	if (!new_mapping)
-		return -ENOMEM;
-
-	for (i = 0; i < reserved_pebs; i++)
-		new_mapping[i] = UBI_LEB_UNMAPPED;
+	new_eba_tbl = ubi_eba_create_table(vol, reserved_pebs);
+	if (IS_ERR(new_eba_tbl))
+		return PTR_ERR(new_eba_tbl);
 
 	spin_lock(&ubi->volumes_lock);
 	if (vol->ref_count > 1) {
@@ -481,10 +479,8 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 		}
 		ubi->avail_pebs -= pebs;
 		ubi->rsvd_pebs += pebs;
-		for (i = 0; i < vol->reserved_pebs; i++)
-			new_mapping[i] = vol->eba_tbl[i];
-		kfree(vol->eba_tbl);
-		vol->eba_tbl = new_mapping;
+		ubi_eba_copy_table(vol, new_eba_tbl, vol->reserved_pebs);
+		ubi_eba_replace_table(vol, new_eba_tbl);
 		spin_unlock(&ubi->volumes_lock);
 	}
 
@@ -498,10 +494,8 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 		ubi->rsvd_pebs += pebs;
 		ubi->avail_pebs -= pebs;
 		ubi_update_reserved(ubi);
-		for (i = 0; i < reserved_pebs; i++)
-			new_mapping[i] = vol->eba_tbl[i];
-		kfree(vol->eba_tbl);
-		vol->eba_tbl = new_mapping;
+		ubi_eba_copy_table(vol, new_eba_tbl, reserved_pebs);
+		ubi_eba_replace_table(vol, new_eba_tbl);
 		spin_unlock(&ubi->volumes_lock);
 	}
 
@@ -543,7 +537,7 @@ out_acc:
 		spin_unlock(&ubi->volumes_lock);
 	}
 out_free:
-	kfree(new_mapping);
+	kfree(new_eba_tbl);
 	return err;
 }
 
-- 
2.7.4
