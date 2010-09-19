Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OxOOm-0008M6-Uu
	for linux-mtd@lists.infradead.org; Sun, 19 Sep 2010 18:14:03 +0000
Received: by bwz19 with SMTP id 19so5559949bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Sep 2010 11:14:00 -0700 (PDT)
Subject: [PATCH 2/2] UBIFS: introduce new flags for RO mounts
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <1284919977.1704.0.camel@brekeke>
References: <1284919977.1704.0.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 19 Sep 2010 21:13:56 +0300
Message-ID: <1284920036.1704.1.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Adrian.Hunter" <Adrian.Hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Commit 2fde99cb55fb9d9b88180512a5e8a5d939d27fec "UBIFS: mark VFS SB RO too"
introduced regression. This commit made UBIFS set the 'MS_RDONLY' flag in the
VFS superblock when it switches to R/O mode due to an error. This was done
to make VFS show the R/O UBIFS flag in /proc/mounts.

However, several places in UBIFS relied on the 'MS_RDONLY' flag and assume this
flag can only change when we re-mount. For example, 'ubifs_put_super()'.

This patch introduces new UBIFS flag - 'c->ro_mount' which changes only when
we re-mount, and preserves the way UBIFS was originally mounted (R/W or R/O).
This allows us to de-initialize UBIFS cleanly in 'ubifs_put_super()'.

This patch also changes all 'ubifs_assert(!c->ro_media)' assertions to
'ubifs_assert(!c->ro_media && !c->ro_mount)', because we never should write
anything if the FS was mounter R/O.

All the places where we test for 'MS_RDONLY' flag in the VFS SB were changed
and now we test the 'c->ro_mount' flag instead, because it preserves the
original UBIFS mount type, unlike the 'MS_RDONLY' flag.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/commit.c   |    2 +-
 fs/ubifs/file.c     |    5 +--
 fs/ubifs/gc.c       |    2 +-
 fs/ubifs/io.c       |    9 +++----
 fs/ubifs/journal.c  |    2 +-
 fs/ubifs/log.c      |    4 +-
 fs/ubifs/master.c   |    2 +-
 fs/ubifs/misc.h     |    6 ++--
 fs/ubifs/recovery.c |    8 +++---
 fs/ubifs/replay.c   |    3 +-
 fs/ubifs/sb.c       |    9 ++-----
 fs/ubifs/shrinker.c |    2 +-
 fs/ubifs/super.c    |   55 ++++++++++++++++++++++++++------------------------
 fs/ubifs/ubifs.h    |   13 ++++++++---
 14 files changed, 62 insertions(+), 60 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 7124327..02429d8 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -63,7 +63,7 @@ static int do_commit(struct ubifs_info *c)
 	struct ubifs_lp_stats lst;
 
 	dbg_cmt("start");
-	ubifs_assert(!c->ro_media);
+	ubifs_assert(!c->ro_media && !c->ro_mount);
 
 	if (c->ro_error) {
 		err = -EROFS;
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index c6bc51c..d77db7e 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -433,7 +433,7 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 	struct page *page;
 
 	ubifs_assert(ubifs_inode(inode)->ui_size == inode->i_size);
-	ubifs_assert(!c->ro_media);
+	ubifs_assert(!c->ro_media && !c->ro_mount);
 
 	if (unlikely(c->ro_error))
 		return -EROFS;
@@ -1440,8 +1440,7 @@ static int ubifs_vm_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vm
 
 	dbg_gen("ino %lu, pg %lu, i_size %lld",	inode->i_ino, page->index,
 		i_size_read(inode));
-	ubifs_assert(!(inode->i_sb->s_flags & MS_RDONLY));
-	ubifs_assert(!c->ro_media);
+	ubifs_assert(!c->ro_media && !c->ro_mount);
 
 	if (unlikely(c->ro_error))
 		return VM_FAULT_SIGBUS; /* -EROFS */
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index d927196..151f108 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -616,7 +616,7 @@ int ubifs_garbage_collect(struct ubifs_info *c, int anyway)
 	struct ubifs_wbuf *wbuf = &c->jheads[GCHD].wbuf;
 
 	ubifs_assert_cmt_locked(c);
-	ubifs_assert(!c->ro_media);
+	ubifs_assert(!c->ro_media && !c->ro_mount);
 
 	if (ubifs_gc_should_commit(c))
 		return -EAGAIN;
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 18a4b8d..d821731 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -356,10 +356,9 @@ int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
 
 	dbg_io("LEB %d:%d, %d bytes, jhead %s",
 	       wbuf->lnum, wbuf->offs, wbuf->used, dbg_jhead(wbuf->jhead));
-	ubifs_assert(!(c->vfs_sb->s_flags & MS_RDONLY));
 	ubifs_assert(!(wbuf->avail & 7));
 	ubifs_assert(wbuf->offs + c->min_io_size <= c->leb_size);
-	ubifs_assert(!c->ro_media);
+	ubifs_assert(!c->ro_media && !c->ro_mount);
 
 	if (c->ro_error)
 		return -EROFS;
@@ -441,7 +440,7 @@ int ubifs_bg_wbufs_sync(struct ubifs_info *c)
 {
 	int err, i;
 
-	ubifs_assert(!c->ro_media);
+	ubifs_assert(!c->ro_media && !c->ro_mount);
 	if (!c->need_wbuf_sync)
 		return 0;
 	c->need_wbuf_sync = 0;
@@ -521,7 +520,7 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	ubifs_assert(!(wbuf->offs & 7) && wbuf->offs <= c->leb_size);
 	ubifs_assert(wbuf->avail > 0 && wbuf->avail <= c->min_io_size);
 	ubifs_assert(mutex_is_locked(&wbuf->io_mutex));
-	ubifs_assert(!c->ro_media);
+	ubifs_assert(!c->ro_media && !c->ro_mount);
 
 	if (c->leb_size - wbuf->offs - wbuf->used < aligned_len) {
 		err = -ENOSPC;
@@ -666,7 +665,7 @@ int ubifs_write_node(struct ubifs_info *c, void *buf, int len, int lnum,
 	       buf_len);
 	ubifs_assert(lnum >= 0 && lnum < c->leb_cnt && offs >= 0);
 	ubifs_assert(offs % c->min_io_size == 0 && offs < c->leb_size);
-	ubifs_assert(!c->ro_media);
+	ubifs_assert(!c->ro_media && !c->ro_mount);
 
 	if (c->ro_error)
 		return -EROFS;
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index a6da8aa..914f1bd 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -122,7 +122,7 @@ static int reserve_space(struct ubifs_info *c, int jhead, int len)
 	 * better to try to allocate space at the ends of eraseblocks. This is
 	 * what the squeeze parameter does.
 	 */
-	ubifs_assert(!c->ro_media);
+	ubifs_assert(!c->ro_media && !c->ro_mount);
 	squeeze = (jhead == BASEHD);
 again:
 	mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index a41713e..4d0cb12 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -159,7 +159,7 @@ void ubifs_add_bud(struct ubifs_info *c, struct ubifs_bud *bud)
 		jhead = &c->jheads[bud->jhead];
 		list_add_tail(&bud->list, &jhead->buds_list);
 	} else
-		ubifs_assert(c->replaying && (c->vfs_sb->s_flags & MS_RDONLY));
+		ubifs_assert(c->replaying && c->ro_mount);
 
 	/*
 	 * Note, although this is a new bud, we anyway account this space now,
@@ -223,7 +223,7 @@ int ubifs_add_bud_to_log(struct ubifs_info *c, int jhead, int lnum, int offs)
 	}
 
 	mutex_lock(&c->log_mutex);
-	ubifs_assert(!c->ro_media);
+	ubifs_assert(!c->ro_media && !c->ro_mount);
 	if (c->ro_error) {
 		err = -EROFS;
 		goto out_unlock;
diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index 0c818e8..21f47af 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -361,7 +361,7 @@ int ubifs_write_master(struct ubifs_info *c)
 {
 	int err, lnum, offs, len;
 
-	ubifs_assert(!c->ro_media);
+	ubifs_assert(!c->ro_media && !c->ro_mount);
 	if (c->ro_error)
 		return -EROFS;
 
diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
index 5d476ba..c3de04d 100644
--- a/fs/ubifs/misc.h
+++ b/fs/ubifs/misc.h
@@ -132,7 +132,7 @@ static inline int ubifs_leb_unmap(const struct ubifs_info *c, int lnum)
 {
 	int err;
 
-	ubifs_assert(!c->ro_media);
+	ubifs_assert(!c->ro_media && !c->ro_mount);
 	if (c->ro_error)
 		return -EROFS;
 	err = ubi_leb_unmap(c->ubi, lnum);
@@ -160,7 +160,7 @@ static inline int ubifs_leb_write(const struct ubifs_info *c, int lnum,
 {
 	int err;
 
-	ubifs_assert(!c->ro_media);
+	ubifs_assert(!c->ro_media && !c->ro_mount);
 	if (c->ro_error)
 		return -EROFS;
 	err = ubi_leb_write(c->ubi, lnum, buf, offs, len, dtype);
@@ -188,7 +188,7 @@ static inline int ubifs_leb_change(const struct ubifs_info *c, int lnum,
 {
 	int err;
 
-	ubifs_assert(!c->ro_media);
+	ubifs_assert(!c->ro_media && !c->ro_mount);
 	if (c->ro_error)
 		return -EROFS;
 	err = ubi_leb_change(c->ubi, lnum, buf, len, dtype);
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index daae9e1..c902a5d 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -292,7 +292,7 @@ int ubifs_recover_master_node(struct ubifs_info *c)
 
 	memcpy(c->mst_node, mst, UBIFS_MST_NODE_SZ);
 
-	if ((c->vfs_sb->s_flags & MS_RDONLY)) {
+	if (c->ro_mount) {
 		/* Read-only mode. Keep a copy for switching to rw mode */
 		c->rcvrd_mst_node = kmalloc(sz, GFP_KERNEL);
 		if (!c->rcvrd_mst_node) {
@@ -469,7 +469,7 @@ static int fix_unclean_leb(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 		endpt = snod->offs + snod->len;
 	}
 
-	if ((c->vfs_sb->s_flags & MS_RDONLY) && !c->remounting_rw) {
+	if (c->ro_mount && !c->remounting_rw) {
 		/* Add to recovery list */
 		struct ubifs_unclean_leb *ucleb;
 
@@ -883,7 +883,7 @@ int ubifs_recover_inl_heads(const struct ubifs_info *c, void *sbuf)
 {
 	int err;
 
-	ubifs_assert(!(c->vfs_sb->s_flags & MS_RDONLY) || c->remounting_rw);
+	ubifs_assert(!c->ro_mount || c->remounting_rw);
 
 	dbg_rcvry("checking index head at %d:%d", c->ihead_lnum, c->ihead_offs);
 	err = recover_head(c, c->ihead_lnum, c->ihead_offs, sbuf);
@@ -1461,7 +1461,7 @@ int ubifs_recover_size(struct ubifs_info *c)
 			}
 		}
 		if (e->exists && e->i_size < e->d_size) {
-			if (!e->inode && (c->vfs_sb->s_flags & MS_RDONLY)) {
+			if (!e->inode && c->ro_mount) {
 				/* Fix the inode size and pin it in memory */
 				struct inode *inode;
 
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 5c2d6d7..730598c 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -627,8 +627,7 @@ static int replay_bud(struct ubifs_info *c, int lnum, int offs, int jhead,
 	ubifs_assert(sleb->endpt - offs >= used);
 	ubifs_assert(sleb->endpt % c->min_io_size == 0);
 
-	if (sleb->endpt + c->min_io_size <= c->leb_size &&
-	    !(c->vfs_sb->s_flags & MS_RDONLY))
+	if (sleb->endpt + c->min_io_size <= c->leb_size && !c->ro_mount)
 		err = ubifs_wbuf_seek_nolock(&c->jheads[jhead].wbuf, lnum,
 					     sleb->endpt, UBI_SHORTTERM);
 
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 96cb62c..bf31b47 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -542,11 +542,8 @@ int ubifs_read_superblock(struct ubifs_info *c)
 	 * due to the unavailability of time-travelling equipment.
 	 */
 	if (c->fmt_version > UBIFS_FORMAT_VERSION) {
-		struct super_block *sb = c->vfs_sb;
-		int mounting_ro = sb->s_flags & MS_RDONLY;
-
-		ubifs_assert(!c->ro_media || mounting_ro);
-		if (!mounting_ro ||
+		ubifs_assert(!c->ro_media || c->ro_mount);
+		if (!c->ro_mount ||
 		    c->ro_compat_version > UBIFS_RO_COMPAT_VERSION) {
 			ubifs_err("on-flash format version is w%d/r%d, but "
 				  "software only supports up to version "
@@ -624,7 +621,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
 	c->old_leb_cnt = c->leb_cnt;
 	if (c->leb_cnt < c->vi.size && c->leb_cnt < c->max_leb_cnt) {
 		c->leb_cnt = min_t(int, c->max_leb_cnt, c->vi.size);
-		if (c->vfs_sb->s_flags & MS_RDONLY)
+		if (c->ro_mount)
 			dbg_mnt("Auto resizing (ro) from %d LEBs to %d LEBs",
 				c->old_leb_cnt,	c->leb_cnt);
 		else {
diff --git a/fs/ubifs/shrinker.c b/fs/ubifs/shrinker.c
index 10eec87..46961c0 100644
--- a/fs/ubifs/shrinker.c
+++ b/fs/ubifs/shrinker.c
@@ -250,7 +250,7 @@ static int kick_a_thread(void)
 			dirty_zn_cnt = atomic_long_read(&c->dirty_zn_cnt);
 
 			if (!dirty_zn_cnt || c->cmt_state == COMMIT_BROKEN ||
-			    c->ro_media || c->ro_error) {
+			    c->ro_mount || c->ro_error) {
 				mutex_unlock(&c->umount_mutex);
 				continue;
 			}
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 1cfeec5..4e5bf3f 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1137,11 +1137,11 @@ static int check_free_space(struct ubifs_info *c)
  */
 static int mount_ubifs(struct ubifs_info *c)
 {
-	struct super_block *sb = c->vfs_sb;
-	int err, mounted_read_only = (sb->s_flags & MS_RDONLY);
+	int err;
 	long long x;
 	size_t sz;
 
+	c->ro_mount = !!(c->vfs_sb->s_flags & MS_RDONLY);
 	err = init_constants_early(c);
 	if (err)
 		return err;
@@ -1154,7 +1154,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		goto out_free;
 
-	if (c->empty && (mounted_read_only || c->ro_media)) {
+	if (c->empty && (c->ro_mount || c->ro_media)) {
 		/*
 		 * This UBI volume is empty, and read-only, or the file system
 		 * is mounted read-only - we cannot format it.
@@ -1165,7 +1165,7 @@ static int mount_ubifs(struct ubifs_info *c)
 		goto out_free;
 	}
 
-	if (c->ro_media && !mounted_read_only) {
+	if (c->ro_media && !c->ro_mount) {
 		ubifs_err("cannot mount read-write - read-only media");
 		err = -EROFS;
 		goto out_free;
@@ -1185,7 +1185,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (!c->sbuf)
 		goto out_free;
 
-	if (!mounted_read_only) {
+	if (!c->ro_mount) {
 		c->ileb_buf = vmalloc(c->leb_size);
 		if (!c->ileb_buf)
 			goto out_free;
@@ -1228,7 +1228,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	}
 
 	sprintf(c->bgt_name, BGT_NAME_PATTERN, c->vi.ubi_num, c->vi.vol_id);
-	if (!mounted_read_only) {
+	if (!c->ro_mount) {
 		err = alloc_wbufs(c);
 		if (err)
 			goto out_cbuf;
@@ -1254,12 +1254,12 @@ static int mount_ubifs(struct ubifs_info *c)
 	if ((c->mst_node->flags & cpu_to_le32(UBIFS_MST_DIRTY)) != 0) {
 		ubifs_msg("recovery needed");
 		c->need_recovery = 1;
-		if (!mounted_read_only) {
+		if (!c->ro_mount) {
 			err = ubifs_recover_inl_heads(c, c->sbuf);
 			if (err)
 				goto out_master;
 		}
-	} else if (!mounted_read_only) {
+	} else if (!c->ro_mount) {
 		/*
 		 * Set the "dirty" flag so that if we reboot uncleanly we
 		 * will notice this immediately on the next mount.
@@ -1270,7 +1270,7 @@ static int mount_ubifs(struct ubifs_info *c)
 			goto out_master;
 	}
 
-	err = ubifs_lpt_init(c, 1, !mounted_read_only);
+	err = ubifs_lpt_init(c, 1, !c->ro_mount);
 	if (err)
 		goto out_lpt;
 
@@ -1285,11 +1285,11 @@ static int mount_ubifs(struct ubifs_info *c)
 	/* Calculate 'min_idx_lebs' after journal replay */
 	c->min_idx_lebs = ubifs_calc_min_idx_lebs(c);
 
-	err = ubifs_mount_orphans(c, c->need_recovery, mounted_read_only);
+	err = ubifs_mount_orphans(c, c->need_recovery, c->ro_mount);
 	if (err)
 		goto out_orphans;
 
-	if (!mounted_read_only) {
+	if (!c->ro_mount) {
 		int lnum;
 
 		err = check_free_space(c);
@@ -1351,7 +1351,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	spin_unlock(&ubifs_infos_lock);
 
 	if (c->need_recovery) {
-		if (mounted_read_only)
+		if (c->ro_mount)
 			ubifs_msg("recovery deferred");
 		else {
 			c->need_recovery = 0;
@@ -1378,7 +1378,7 @@ static int mount_ubifs(struct ubifs_info *c)
 
 	ubifs_msg("mounted UBI device %d, volume %d, name \"%s\"",
 		  c->vi.ubi_num, c->vi.vol_id, c->vi.name);
-	if (mounted_read_only)
+	if (c->ro_mount)
 		ubifs_msg("mounted read-only");
 	x = (long long)c->main_lebs * c->leb_size;
 	ubifs_msg("file system size:   %lld bytes (%lld KiB, %lld MiB, %d "
@@ -1640,7 +1640,7 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 	}
 
 	dbg_gen("re-mounted read-write");
-	c->vfs_sb->s_flags &= ~MS_RDONLY;
+	c->ro_mount = 0;
 	c->remounting_rw = 0;
 	c->always_chk_crc = 0;
 	err = dbg_check_space_info(c);
@@ -1676,7 +1676,7 @@ static void ubifs_remount_ro(struct ubifs_info *c)
 	int i, err;
 
 	ubifs_assert(!c->need_recovery);
-	ubifs_assert(!(c->vfs_sb->s_flags & MS_RDONLY));
+	ubifs_assert(!c->ro_mount);
 
 	mutex_lock(&c->umount_mutex);
 	if (c->bgt) {
@@ -1704,6 +1704,7 @@ static void ubifs_remount_ro(struct ubifs_info *c)
 	vfree(c->ileb_buf);
 	c->ileb_buf = NULL;
 	ubifs_lpt_free(c, 1);
+	c->ro_mount = 1;
 	err = dbg_check_space_info(c);
 	if (err)
 		ubifs_ro_mode(c, err);
@@ -1735,7 +1736,7 @@ static void ubifs_put_super(struct super_block *sb)
 	 * the mutex is locked.
 	 */
 	mutex_lock(&c->umount_mutex);
-	if (!(c->vfs_sb->s_flags & MS_RDONLY)) {
+	if (!c->ro_mount) {
 		/*
 		 * First of all kill the background thread to make sure it does
 		 * not interfere with un-mounting and freeing resources.
@@ -1745,23 +1746,23 @@ static void ubifs_put_super(struct super_block *sb)
 			c->bgt = NULL;
 		}
 
-		/* Synchronize write-buffers */
-		if (c->jheads)
-			for (i = 0; i < c->jhead_cnt; i++)
-				ubifs_wbuf_sync(&c->jheads[i].wbuf);
-
 		/*
 		 * On fatal errors c->ro_error is set to 1, in which case we do
 		 * not write the master node.
 		 */
 		if (!c->ro_error) {
+			int err;
+
+			/* Synchronize write-buffers */
+			if (c->jheads)
+				for (i = 0; i < c->jhead_cnt; i++)
+					ubifs_wbuf_sync(&c->jheads[i].wbuf);
+
 			/*
 			 * We are being cleanly unmounted which means the
 			 * orphans were killed - indicate this in the master
 			 * node. Also save the reserved GC LEB number.
 			 */
-			int err;
-
 			c->mst_node->flags &= ~cpu_to_le32(UBIFS_MST_DIRTY);
 			c->mst_node->flags |= cpu_to_le32(UBIFS_MST_NO_ORPHS);
 			c->mst_node->gc_lnum = cpu_to_le32(c->gc_lnum);
@@ -1797,7 +1798,7 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 		return err;
 	}
 
-	if ((sb->s_flags & MS_RDONLY) && !(*flags & MS_RDONLY)) {
+	if (c->ro_mount && !(*flags & MS_RDONLY)) {
 		if (c->ro_error) {
 			ubifs_msg("cannot re-mount R/W due to prior errors");
 			return -EROFS;
@@ -1809,7 +1810,7 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 		err = ubifs_remount_rw(c);
 		if (err)
 			return err;
-	} else if (!(sb->s_flags & MS_RDONLY) && (*flags & MS_RDONLY)) {
+	} else if (!c->ro_mount && (*flags & MS_RDONLY)) {
 		if (c->ro_error) {
 			ubifs_msg("cannot re-mount R/O due to prior errors");
 			return -EROFS;
@@ -2068,9 +2069,11 @@ static int ubifs_get_sb(struct file_system_type *fs_type, int flags,
 	}
 
 	if (sb->s_root) {
+		struct ubifs_info *c1 = sb->s_fs_info;
+
 		/* A new mount point for already mounted UBIFS */
 		dbg_gen("this ubi volume is already mounted");
-		if ((flags ^ sb->s_flags) & MS_RDONLY) {
+		if (!!(flags & MS_RDONLY) != c1->ro_mount) {
 			err = -EBUSY;
 			goto out_deact;
 		}
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index f47ebb4..381d6b2 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1032,6 +1032,7 @@ struct ubifs_debug_info;
  * @max_leb_cnt: maximum count of logical eraseblocks
  * @old_leb_cnt: count of logical eraseblocks before re-size
  * @ro_media: the underlying UBI volume is read-only
+ * @ro_mount: the file-system was mounted as read-only
  * @ro_error: UBIFS switched to R/O mode because an error happened
  *
  * @dirty_pg_cnt: number of dirty pages (not used)
@@ -1173,11 +1174,14 @@ struct ubifs_debug_info;
  * @replay_sqnum: sequence number of node currently being replayed
  * @need_recovery: file-system needs recovery
  * @replaying: set to %1 during journal replay
- * @unclean_leb_list: LEBs to recover when mounting ro to rw
- * @rcvrd_mst_node: recovered master node to write when mounting ro to rw
+ * @unclean_leb_list: LEBs to recover when re-mounting R/O mounted FS to R/W
+ *                    mode
+ * @rcvrd_mst_node: recovered master node to write when re-mounting R/O mounted
+ *                  FS to R/W mode
  * @size_tree: inode size information for recovery
- * @remounting_rw: set while remounting from ro to rw (sb flags have MS_RDONLY)
- * @always_chk_crc: always check CRCs (while mounting and remounting rw)
+ * @remounting_rw: set while re-mounting from R/O mode to R/W mode
+ * @always_chk_crc: always check CRCs (while mounting and remounting to R/W
+ *                  mode)
  * @mount_opts: UBIFS-specific mount options
  *
  * @dbg: debugging-related information
@@ -1274,6 +1278,7 @@ struct ubifs_info {
 	int max_leb_cnt;
 	int old_leb_cnt;
 	unsigned int ro_media:1;
+	unsigned int ro_mount:1;
 	unsigned int ro_error:1;
 
 	atomic_long_t dirty_pg_cnt;
-- 
1.7.2.2



-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
