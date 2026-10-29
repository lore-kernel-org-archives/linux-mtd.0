Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1721D606A322
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=krXbdSlE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZO5mYTz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nUf5nhHQ3vwTyaf7xvQ03Pv9shHSlB6zmBqGEDoOTS4=; b=krXbdSlEroP0c4SZncfjubVEox
	g30h6eCvTdPhhqcIBDUCYOLHde1eH/mCczYEvJGTuJiP2vdZyQlfk5beG3RtZgFx9qsRGFsv6sLqn
	EfEKJP9VxIMX9zNcpvRUEx0fPfB4zp8gd06zGwXX8AbDJT/YT8ZGAFSgyzU5fu5ElKEsFdmrdn6/C
	sPlZFqePSWl+h5wCx1VfApXeHawN5neWhepE1Ww2F1k92/XkfIXeXVwPvPjbS8sJYtpDeiEQ6bYwg
	hqI/qrO1IeW6opMN6WWGqgvJ3RR8LFDTin25cww1PbzX2lAYqfZV4wiqRo4VioMsw8obxCAJCD89p
	c7EWMR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSfi-00000009kKz-3HGH;
	Thu, 29 Oct 2026 16:08:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSfh-00000009kJx-1Ydn
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:08:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24F1640D73;
	Thu, 29 Oct 2026 16:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE57B1F01816;
	Thu, 29 Oct 2026 16:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290089;
	bh=gBop/I1sxHpMBXqMpx8CeeDCXAySNjKC9aKMSnGOGFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kZO5mYTzBw+bB49203RNqrZShEkSe1zbH+JYICABROEOUOKcZxUyKwL21VlIz949g
	 8P0TKIU4MoKSvpQ9r/pggJVZEncvfQ1FCyOYTUA3zQnBGopFR0jGxtfJdFRUkTER79
	 j5nCbTz0QHVL9XjTGxU2siFqxYijE7KIvPZPZw3iaa4wt1LntPYb3r82axhYTCPoLu
	 A7K/zwy8E02Ogjk10TWH9uSNhF1G0d25BTYqfX6Ibh3KXf/m1MAWZNTGk/JOizPYG1
	 L96RWx+/zkOq3kR9O3gKPw1x0YKu5WA4QiNz/Tfg30VOXnAVbvBAdkfMNO73u2Xm9p
	 vwrohQFhCcRBg==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 29 Oct 2026 17:07:02 +0100
Subject: [PATCH v2 11/34] hfs: don't set SB_RDONLY after MDB write errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-work-fs-sb_rdonly-v2-11-2f44f64f0b66@kernel.org>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
To: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, 
 ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-xfs@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, stable@vger.kernel.org, 
 Viacheslav Dubeyko <slava@dubeyko.com>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10556; i=brauner@kernel.org;
 h=from:subject:message-id; bh=0FHakpkA1BemddUf6W1nU0XfKFfXqMtaY9XbXpS/Erw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9ztfPe+bzZ3rpowel9wLjzk/rubasonDVJbe8jx6uZ
 34uXdl3pKOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAi0V6MDO9PuDzXeVlt6pqY
 xvj420tF5fvcql9ylcrC2mZrFV9cIcHwP2hei4/H9b2dFa9095jIGeya8zHm4h3GP1tvvI+4e7R
 wAxMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit fdbb95ff89b2 ("hfs: don't re-dirty MDB buffers after a
write failure") hfs_mdb_commit() sets SB_RDONLY when a write of the MDB
failed. It runs from the flush_mdb work and from ->sync_fs() and neither
holds s_umount exclusively. freeze_super() decides from sb_rdonly()
whether to take the s_writers rwsems and drops s_umount while it waits
for writers. A sync(2) in that window sets SB_RDONLY, the freeze
completes with the rwsems held and the thaw never releases them.

So record the condition in a new HFS_FLG_EMERGENCY_RO bit instead. Later
calls of hfs_mdb_commit() return early like they did for sb_rdonly() and
the MDB is never marked cleanly unmounted. hfs refuses modifications
with EROFS itself: the namespace operations, setattr, the hfs.type and
hfs.creator xattrs, opening for write, write_begin, O_DIRECT writes,
block allocation, hfs_file_truncate() and writing inodes back.

B-tree growth isn't refused. A read can need a new b-tree node when it
writes back a cached extent record, and failing that would make such
reads fail with EIO until umount. That's also why the extents and
catalog b-tree headers are still written.

A remount to read-write fails with EROFS, a remount to read-only works
and /proc/mounts keeps showing the filesystem read-write.

Fixes: fdbb95ff89b2 ("hfs: don't re-dirty MDB buffers after a write failure")
Cc: stable@vger.kernel.org
Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/hfs/attr.c   |  3 +++
 fs/hfs/dir.c    | 12 ++++++++++++
 fs/hfs/extent.c |  5 +++++
 fs/hfs/hfs_fs.h | 11 +++++++++++
 fs/hfs/inode.c  | 30 ++++++++++++++++++++++++++++++
 fs/hfs/mdb.c    | 16 ++++++++++------
 fs/hfs/super.c  |  5 ++++-
 7 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/fs/hfs/attr.c b/fs/hfs/attr.c
index 6d737a085461..bd9a1289d8c5 100644
--- a/fs/hfs/attr.c
+++ b/fs/hfs/attr.c
@@ -129,6 +129,9 @@ static int hfs_xattr_set(const struct xattr_handler *handler,
 	if (!value)
 		return -EOPNOTSUPP;
 
+	if (unlikely(hfs_emergency_ro(inode->i_sb)))
+		return -EROFS;
+
 	return __hfs_setxattr(inode, handler->flags, value, size, flags);
 }
 
diff --git a/fs/hfs/dir.c b/fs/hfs/dir.c
index f6b97da19788..f0d8ddb07503 100644
--- a/fs/hfs/dir.c
+++ b/fs/hfs/dir.c
@@ -189,6 +189,9 @@ static int hfs_create(const struct mnt_idmap *idmap, struct inode *dir,
 	struct inode *inode;
 	int res;
 
+	if (unlikely(hfs_emergency_ro(dir->i_sb)))
+		return -EROFS;
+
 	inode = hfs_new_inode(dir, &dentry->d_name, mode);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
@@ -219,6 +222,9 @@ static struct dentry *hfs_mkdir(const struct mnt_idmap *idmap, struct inode *dir
 	struct inode *inode;
 	int res;
 
+	if (unlikely(hfs_emergency_ro(dir->i_sb)))
+		return ERR_PTR(-EROFS);
+
 	inode = hfs_new_inode(dir, &dentry->d_name, mode);
 	if (IS_ERR(inode))
 		return ERR_CAST(inode);
@@ -252,6 +258,9 @@ static int hfs_remove(struct inode *dir, struct dentry *dentry)
 	struct inode *inode = d_inode(dentry);
 	int res;
 
+	if (unlikely(hfs_emergency_ro(sb)))
+		return -EROFS;
+
 	if (S_ISDIR(inode->i_mode) && inode->i_size != 2)
 		return -ENOTEMPTY;
 
@@ -290,6 +299,9 @@ static int hfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 	if (flags & ~RENAME_NOREPLACE)
 		return -EINVAL;
 
+	if (unlikely(hfs_emergency_ro(old_dir->i_sb)))
+		return -EROFS;
+
 	/* Unlink destination if it already exists */
 	if (d_really_is_positive(new_dentry)) {
 		res = hfs_remove(new_dir, new_dentry);
diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
index 26357086517f..dacf7ce1ffe4 100644
--- a/fs/hfs/extent.c
+++ b/fs/hfs/extent.c
@@ -356,6 +356,9 @@ int hfs_get_block(struct inode *inode, sector_t block,
 		if (block > HFS_I(inode)->fs_blocks)
 			return -EIO;
 		if (ablock >= HFS_I(inode)->alloc_blocks) {
+			/* No new allocations after an error. */
+			if (unlikely(hfs_emergency_ro(sb)))
+				return -EROFS;
 			res = hfs_extend_file(inode);
 			if (res)
 				return res;
@@ -491,6 +494,8 @@ void hfs_file_truncate(struct inode *inode)
 	hfs_dbg("ino %llu, phys_size %llu -> i_size %llu\n",
 		inode->i_ino, (long long)HFS_I(inode)->phys_size,
 		inode->i_size);
+	if (unlikely(hfs_emergency_ro(sb)))
+		return;
 	if (inode->i_size > HFS_I(inode)->phys_size) {
 		struct address_space *mapping = inode->i_mapping;
 		void *fsdata = NULL;
diff --git a/fs/hfs/hfs_fs.h b/fs/hfs/hfs_fs.h
index fdfa5d303d5e..325214573d91 100644
--- a/fs/hfs/hfs_fs.h
+++ b/fs/hfs/hfs_fs.h
@@ -143,6 +143,7 @@ struct hfs_sb_info {
 #define HFS_FLG_BITMAP_DIRTY	0
 #define HFS_FLG_MDB_DIRTY	1
 #define HFS_FLG_ALT_MDB_DIRTY	2
+#define HFS_FLG_EMERGENCY_RO	3	/* read-only after an MDB write error */
 
 /* bitmap.c */
 extern u32 hfs_vbm_search_free(struct super_block *sb, u32 goal, u32 *num_bits);
@@ -293,6 +294,16 @@ static inline const char *hfs_mdb_name(struct super_block *sb)
 	return sb->s_id;
 }
 
+/*
+ * Writing back the MDB failed and the filesystem stopped all modifications
+ * until unmount. SB_RDONLY isn't used for that because it must not change
+ * without s_umount.
+ */
+static inline bool hfs_emergency_ro(struct super_block *sb)
+{
+	return test_bit(HFS_FLG_EMERGENCY_RO, &HFS_SB(sb)->flags);
+}
+
 static inline void hfs_bitmap_dirty(struct super_block *sb)
 {
 	set_bit(HFS_FLG_BITMAP_DIRTY, &HFS_SB(sb)->flags);
diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
index 40c169d67664..6ea3b8ffb284 100644
--- a/fs/hfs/inode.c
+++ b/fs/hfs/inode.c
@@ -54,6 +54,9 @@ int hfs_write_begin(const struct kiocb *iocb, struct address_space *mapping,
 	loff_t total_capacity;
 	int ret;
 
+	if (unlikely(hfs_emergency_ro(inode->i_sb)))
+		return -EROFS;
+
 	total_capacity = (loff_t)sbi->fs_ablocks * sbi->alloc_blksz;
 
 	if (pos >= total_capacity)
@@ -139,6 +142,10 @@ static ssize_t hfs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 	size_t count = iov_iter_count(iter);
 	ssize_t ret;
 
+	if (iov_iter_rw(iter) == WRITE &&
+	    unlikely(hfs_emergency_ro(inode->i_sb)))
+		return -EROFS;
+
 	ret = blockdev_direct_IO(iocb, inode, iter, hfs_get_block);
 
 	/*
@@ -472,6 +479,20 @@ int hfs_write_inode(struct inode *inode, struct writeback_control *wbc)
 	int res;
 
 	hfs_dbg("ino %llu\n", inode->i_ino);
+	if (unlikely(hfs_emergency_ro(inode->i_sb))) {
+		/*
+		 * Writeback still writes the b-tree nodes. Keep the headers in
+		 * sync with them so the trees on disk stay intact.
+		 */
+		if (inode->i_ino == HFS_EXT_CNID)
+			hfs_btree_write(HFS_SB(inode->i_sb)->ext_tree);
+		else if (inode->i_ino == HFS_CAT_CNID)
+			hfs_btree_write(HFS_SB(inode->i_sb)->cat_tree);
+		else
+			return -EROFS;
+		return 0;
+	}
+
 	res = hfs_ext_write_extent(inode);
 	if (res)
 		return res;
@@ -619,6 +640,8 @@ void hfs_evict_inode(struct inode *inode)
 
 static int hfs_file_open(struct inode *inode, struct file *file)
 {
+	if ((file->f_mode & FMODE_WRITE) && hfs_emergency_ro(inode->i_sb))
+		return -EROFS;
 	if (HFS_IS_RSRC(inode))
 		inode = HFS_I(inode)->rsrc_inode;
 	atomic_inc(&HFS_I(inode)->opencnt);
@@ -650,6 +673,9 @@ int hfs_inode_setattr(const struct mnt_idmap *idmap, struct dentry *dentry,
 	struct hfs_sb_info *hsb = HFS_SB(inode->i_sb);
 	int error;
 
+	if (unlikely(hfs_emergency_ro(inode->i_sb)))
+		return -EROFS;
+
 	error = setattr_prepare(&nop_mnt_idmap, dentry, attr);
 	if (error)
 		return error;
@@ -701,6 +727,10 @@ static int hfs_file_fsync(struct file *filp, loff_t start, loff_t end,
 	struct super_block * sb;
 	int ret, err;
 
+	/* Inodes aren't written back after an error. */
+	if (unlikely(hfs_emergency_ro(inode->i_sb)))
+		return -EROFS;
+
 	ret = file_write_and_wait_range(filp, start, end);
 	if (ret)
 		return ret;
diff --git a/fs/hfs/mdb.c b/fs/hfs/mdb.c
index 277de712f9d4..1a56cf5ea56e 100644
--- a/fs/hfs/mdb.c
+++ b/fs/hfs/mdb.c
@@ -322,8 +322,8 @@ int hfs_mdb_get(struct super_block *sb)
  *   NONE
  * Returns:
  *   0 on success, -EIO if the MDB or alternate MDB buffer is no longer
- *   valid (e.g. after a prior write error), in which case the volume is
- *   remounted read-only.
+ *   valid (e.g. after a prior write error), in which case the volume
+ *   refuses all further modifications until it is unmounted.
  * Preconditions:
  *   'mdb' points to a "valid" (struct hfs_mdb).
  * Postconditions:
@@ -338,12 +338,16 @@ int hfs_mdb_commit(struct super_block *sb)
 	struct hfs_mdb *mdb = HFS_SB(sb)->mdb;
 	int ret = 0;
 
-	if (sb_rdonly(sb))
+	if (sb_rdonly(sb) || hfs_emergency_ro(sb))
 		return 0;
 
+	/*
+	 * SB_RDONLY needs s_umount and a remount. Set on a frozen superblock
+	 * it makes thaw_super() leave s_writers locked.
+	 */
 	if (!buffer_uptodate(HFS_SB(sb)->mdb_bh)) {
 		pr_err("primary MDB is corrupt, mounting read-only\n");
-		sb->s_flags |= SB_RDONLY;
+		set_bit(HFS_FLG_EMERGENCY_RO, &HFS_SB(sb)->flags);
 		return -EIO;
 	}
 
@@ -377,7 +381,7 @@ int hfs_mdb_commit(struct super_block *sb)
 	    HFS_SB(sb)->alt_mdb) {
 		if (!buffer_uptodate(HFS_SB(sb)->alt_mdb_bh)) {
 			pr_err("alternate MDB is corrupt, mounting read-only\n");
-			sb->s_flags |= SB_RDONLY;
+			set_bit(HFS_FLG_EMERGENCY_RO, &HFS_SB(sb)->flags);
 			ret = -EIO;
 			goto out;
 		}
@@ -428,7 +432,7 @@ int hfs_mdb_commit(struct super_block *sb)
 void hfs_mdb_close(struct super_block *sb)
 {
 	/* update volume attributes */
-	if (sb_rdonly(sb))
+	if (sb_rdonly(sb) || hfs_emergency_ro(sb))
 		return;
 
 	if (!buffer_uptodate(HFS_SB(sb)->mdb_bh))
diff --git a/fs/hfs/super.c b/fs/hfs/super.c
index 5e6d66ff4bee..bcc19c3a4f6b 100644
--- a/fs/hfs/super.c
+++ b/fs/hfs/super.c
@@ -82,7 +82,7 @@ void hfs_mark_mdb_dirty(struct super_block *sb)
 	struct hfs_sb_info *sbi = HFS_SB(sb);
 	unsigned long delay;
 
-	if (sb_rdonly(sb))
+	if (sb_rdonly(sb) || hfs_emergency_ro(sb))
 		return;
 
 	spin_lock(&sbi->work_lock);
@@ -131,6 +131,9 @@ static int hfs_reconfigure(struct fs_context *fc)
 		return 0;
 
 	if (!(fc->sb_flags & SB_RDONLY)) {
+		/* After an MDB write error it stays read-only until unmount. */
+		if (hfs_emergency_ro(sb))
+			return -EROFS;
 		if (!(HFS_SB(sb)->mdb->drAtrb & cpu_to_be16(HFS_SB_ATTRIB_UNMNT))) {
 			pr_warn("filesystem was not cleanly unmounted, running fsck.hfs is recommended.  leaving read-only.\n");
 			sb->s_flags |= SB_RDONLY;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
