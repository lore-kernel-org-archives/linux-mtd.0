Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OxONq-00088S-1I
	for linux-mtd@lists.infradead.org; Sun, 19 Sep 2010 18:13:04 +0000
Received: by bwz19 with SMTP id 19so5559512bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Sep 2010 11:13:00 -0700 (PDT)
Subject: [PATCH 1/2] UBIFS: introduce new flag for RO due to errors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 19 Sep 2010 21:12:57 +0300
Message-ID: <1284919977.1704.0.camel@brekeke>
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

The R/O state may have various reasons:

1. The UBI volume is R/O
2. The FS is mounted R/O
3. The FS switched to R/O mode because of an error

However, in UBIFS we have only one variable which represents cases
1 and 3 - 'c->ro_media'. Indeed, we set this to 1 if we switch to
R/O mode due to an error, and then we test it in many places to
make sure that we stop writing as soon as the error happens.

But this is very unclean. One consequence of this, for example, is
that in 'ubifs_remount_fs()' we use 'c->ro_media' to check whether
we are in R/O mode because on an error, and we print a message
in this case. However, if we are in R/O mode because the media
is R/O, our message is bogus.

This patch introduces new flag - 'c->ro_error' which is set when
we switch to R/O mode because of an error. It also changes all
"if (c->ro_media)" checks to "if (c->ro_error)" checks, because
this is what the checks actually mean. We do not need to check
for 'c->ro_media' because if the UBI volume is in R/O mode, we
do not allow R/W mounting, and now writes can happen. This is
guaranteed by VFS. But it is good to double-check this, so this
patch also adds many "ubifs_assert(!c->ro_media)" checks.

In the 'ubifs_remount_fs()' function this patch makes a bit more
changes - it fixes the error messages as well.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/commit.c   |    4 +++-
 fs/ubifs/file.c     |    6 ++++--
 fs/ubifs/gc.c       |    3 ++-
 fs/ubifs/io.c       |   16 ++++++++++------
 fs/ubifs/journal.c  |    3 ++-
 fs/ubifs/log.c      |    4 ++--
 fs/ubifs/master.c   |    3 ++-
 fs/ubifs/misc.h     |    9 ++++++---
 fs/ubifs/shrinker.c |    2 +-
 fs/ubifs/super.c    |   14 +++++++++-----
 fs/ubifs/ubifs.h    |    4 +++-
 11 files changed, 44 insertions(+), 24 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 37fa7ed..7124327 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -63,7 +63,9 @@ static int do_commit(struct ubifs_info *c)
 	struct ubifs_lp_stats lst;
 
 	dbg_cmt("start");
-	if (c->ro_media) {
+	ubifs_assert(!c->ro_media);
+
+	if (c->ro_error) {
 		err = -EROFS;
 		goto out_up;
 	}
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 03ae894..c6bc51c 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -433,8 +433,9 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 	struct page *page;
 
 	ubifs_assert(ubifs_inode(inode)->ui_size == inode->i_size);
+	ubifs_assert(!c->ro_media);
 
-	if (unlikely(c->ro_media))
+	if (unlikely(c->ro_error))
 		return -EROFS;
 
 	/* Try out the fast-path part first */
@@ -1440,8 +1441,9 @@ static int ubifs_vm_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vm
 	dbg_gen("ino %lu, pg %lu, i_size %lld",	inode->i_ino, page->index,
 		i_size_read(inode));
 	ubifs_assert(!(inode->i_sb->s_flags & MS_RDONLY));
+	ubifs_assert(!c->ro_media);
 
-	if (unlikely(c->ro_media))
+	if (unlikely(c->ro_error))
 		return VM_FAULT_SIGBUS; /* -EROFS */
 
 	/*
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 396f24a..d927196 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -616,13 +616,14 @@ int ubifs_garbage_collect(struct ubifs_info *c, int anyway)
 	struct ubifs_wbuf *wbuf = &c->jheads[GCHD].wbuf;
 
 	ubifs_assert_cmt_locked(c);
+	ubifs_assert(!c->ro_media);
 
 	if (ubifs_gc_should_commit(c))
 		return -EAGAIN;
 
 	mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);
 
-	if (c->ro_media) {
+	if (c->ro_error) {
 		ret = -EROFS;
 		goto out_unlock;
 	}
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 9432431..18a4b8d 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -61,8 +61,8 @@
  */
 void ubifs_ro_mode(struct ubifs_info *c, int err)
 {
-	if (!c->ro_media) {
-		c->ro_media = 1;
+	if (!c->ro_error) {
+		c->ro_error = 1;
 		c->no_chk_data_crc = 0;
 		c->vfs_sb->s_flags |= MS_RDONLY;
 		ubifs_warn("switched to read-only mode, error %d", err);
@@ -359,8 +359,9 @@ int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
 	ubifs_assert(!(c->vfs_sb->s_flags & MS_RDONLY));
 	ubifs_assert(!(wbuf->avail & 7));
 	ubifs_assert(wbuf->offs + c->min_io_size <= c->leb_size);
+	ubifs_assert(!c->ro_media);
 
-	if (c->ro_media)
+	if (c->ro_error)
 		return -EROFS;
 
 	ubifs_pad(c, wbuf->buf + wbuf->used, wbuf->avail);
@@ -440,11 +441,12 @@ int ubifs_bg_wbufs_sync(struct ubifs_info *c)
 {
 	int err, i;
 
+	ubifs_assert(!c->ro_media);
 	if (!c->need_wbuf_sync)
 		return 0;
 	c->need_wbuf_sync = 0;
 
-	if (c->ro_media) {
+	if (c->ro_error) {
 		err = -EROFS;
 		goto out_timers;
 	}
@@ -519,6 +521,7 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	ubifs_assert(!(wbuf->offs & 7) && wbuf->offs <= c->leb_size);
 	ubifs_assert(wbuf->avail > 0 && wbuf->avail <= c->min_io_size);
 	ubifs_assert(mutex_is_locked(&wbuf->io_mutex));
+	ubifs_assert(!c->ro_media);
 
 	if (c->leb_size - wbuf->offs - wbuf->used < aligned_len) {
 		err = -ENOSPC;
@@ -527,7 +530,7 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 
 	cancel_wbuf_timer_nolock(wbuf);
 
-	if (c->ro_media)
+	if (c->ro_error)
 		return -EROFS;
 
 	if (aligned_len <= wbuf->avail) {
@@ -663,8 +666,9 @@ int ubifs_write_node(struct ubifs_info *c, void *buf, int len, int lnum,
 	       buf_len);
 	ubifs_assert(lnum >= 0 && lnum < c->leb_cnt && offs >= 0);
 	ubifs_assert(offs % c->min_io_size == 0 && offs < c->leb_size);
+	ubifs_assert(!c->ro_media);
 
-	if (c->ro_media)
+	if (c->ro_error)
 		return -EROFS;
 
 	ubifs_prepare_node(c, buf, len, 1);
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index d321bae..a6da8aa 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -122,11 +122,12 @@ static int reserve_space(struct ubifs_info *c, int jhead, int len)
 	 * better to try to allocate space at the ends of eraseblocks. This is
 	 * what the squeeze parameter does.
 	 */
+	ubifs_assert(!c->ro_media);
 	squeeze = (jhead == BASEHD);
 again:
 	mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);
 
-	if (c->ro_media) {
+	if (c->ro_error) {
 		err = -EROFS;
 		goto out_unlock;
 	}
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index c345e12..a41713e 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -223,8 +223,8 @@ int ubifs_add_bud_to_log(struct ubifs_info *c, int jhead, int lnum, int offs)
 	}
 
 	mutex_lock(&c->log_mutex);
-
-	if (c->ro_media) {
+	ubifs_assert(!c->ro_media);
+	if (c->ro_error) {
 		err = -EROFS;
 		goto out_unlock;
 	}
diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index 28beaee..0c818e8 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -361,7 +361,8 @@ int ubifs_write_master(struct ubifs_info *c)
 {
 	int err, lnum, offs, len;
 
-	if (c->ro_media)
+	ubifs_assert(!c->ro_media);
+	if (c->ro_error)
 		return -EROFS;
 
 	lnum = UBIFS_MST_LNUM;
diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
index 4fa81d8..5d476ba 100644
--- a/fs/ubifs/misc.h
+++ b/fs/ubifs/misc.h
@@ -132,7 +132,8 @@ static inline int ubifs_leb_unmap(const struct ubifs_info *c, int lnum)
 {
 	int err;
 
-	if (c->ro_media)
+	ubifs_assert(!c->ro_media);
+	if (c->ro_error)
 		return -EROFS;
 	err = ubi_leb_unmap(c->ubi, lnum);
 	if (err) {
@@ -159,7 +160,8 @@ static inline int ubifs_leb_write(const struct ubifs_info *c, int lnum,
 {
 	int err;
 
-	if (c->ro_media)
+	ubifs_assert(!c->ro_media);
+	if (c->ro_error)
 		return -EROFS;
 	err = ubi_leb_write(c->ubi, lnum, buf, offs, len, dtype);
 	if (err) {
@@ -186,7 +188,8 @@ static inline int ubifs_leb_change(const struct ubifs_info *c, int lnum,
 {
 	int err;
 
-	if (c->ro_media)
+	ubifs_assert(!c->ro_media);
+	if (c->ro_error)
 		return -EROFS;
 	err = ubi_leb_change(c->ubi, lnum, buf, len, dtype);
 	if (err) {
diff --git a/fs/ubifs/shrinker.c b/fs/ubifs/shrinker.c
index 0b20111..10eec87 100644
--- a/fs/ubifs/shrinker.c
+++ b/fs/ubifs/shrinker.c
@@ -250,7 +250,7 @@ static int kick_a_thread(void)
 			dirty_zn_cnt = atomic_long_read(&c->dirty_zn_cnt);
 
 			if (!dirty_zn_cnt || c->cmt_state == COMMIT_BROKEN ||
-			    c->ro_media) {
+			    c->ro_media || c->ro_error) {
 				mutex_unlock(&c->umount_mutex);
 				continue;
 			}
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index cd5900b..1cfeec5 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1751,10 +1751,10 @@ static void ubifs_put_super(struct super_block *sb)
 				ubifs_wbuf_sync(&c->jheads[i].wbuf);
 
 		/*
-		 * On fatal errors c->ro_media is set to 1, in which case we do
+		 * On fatal errors c->ro_error is set to 1, in which case we do
 		 * not write the master node.
 		 */
-		if (!c->ro_media) {
+		if (!c->ro_error) {
 			/*
 			 * We are being cleanly unmounted which means the
 			 * orphans were killed - indicate this in the master
@@ -1798,16 +1798,20 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 	}
 
 	if ((sb->s_flags & MS_RDONLY) && !(*flags & MS_RDONLY)) {
+		if (c->ro_error) {
+			ubifs_msg("cannot re-mount R/W due to prior errors");
+			return -EROFS;
+		}
 		if (c->ro_media) {
-			ubifs_msg("cannot re-mount due to prior errors");
+			ubifs_msg("cannot re-mount R/W - UBI volume is R/O");
 			return -EROFS;
 		}
 		err = ubifs_remount_rw(c);
 		if (err)
 			return err;
 	} else if (!(sb->s_flags & MS_RDONLY) && (*flags & MS_RDONLY)) {
-		if (c->ro_media) {
-			ubifs_msg("cannot re-mount due to prior errors");
+		if (c->ro_error) {
+			ubifs_msg("cannot re-mount R/O due to prior errors");
 			return -EROFS;
 		}
 		ubifs_remount_ro(c);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index c4dc9b1..f47ebb4 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1032,6 +1032,7 @@ struct ubifs_debug_info;
  * @max_leb_cnt: maximum count of logical eraseblocks
  * @old_leb_cnt: count of logical eraseblocks before re-size
  * @ro_media: the underlying UBI volume is read-only
+ * @ro_error: UBIFS switched to R/O mode because an error happened
  *
  * @dirty_pg_cnt: number of dirty pages (not used)
  * @dirty_zn_cnt: number of dirty znodes
@@ -1272,7 +1273,8 @@ struct ubifs_info {
 	int leb_cnt;
 	int max_leb_cnt;
 	int old_leb_cnt;
-	int ro_media;
+	unsigned int ro_media:1;
+	unsigned int ro_error:1;
 
 	atomic_long_t dirty_pg_cnt;
 	atomic_long_t dirty_zn_cnt;
-- 
1.7.2.2


-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
