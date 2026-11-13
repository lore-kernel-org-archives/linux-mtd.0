Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED00606A331
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 12:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1/en8sI3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZfgPFpD/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zHfRkSeiJ1oqxsxr1xyz0iqoMNn4Vvnq3yrPz/pT4/g=; b=1/en8sI3ceoQNBbCUlsIMGS/ob
	tlkmGvvyXWyhZZ72DtZkVMGe5iu6fd4sLJJn7LBtdJlf031ry3FPQ59UPr7gH2KXSpLtJA4cauclV
	yqUehLOEcpoco+6DJRW1Wv9i71i6WGm8JRUkE9Nhr4kqbHeaXFN+Cbjb/CT9AMJN81uEupMvq6xEl
	4df8XaHpw7Tr9aPEijMUZQnPGfu6TJQaIpKmjVG7EE+TrGFOjJc/Du81pjM5vO8kEEkC7RjPGuayo
	5jCAIP/57XxgKH+1RRgbclsUFeHcRgT/KePRsa3dpYrPwZYi80qQm1ouRehJQuQoIj9o9eMJ1j+8z
	3DjkwUvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpxv-0000000CcKB-3Aa9;
	Fri, 13 Nov 2026 12:01:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpxs-0000000CcIc-0EGw
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 12:01:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73A4A62236;
	Fri, 13 Nov 2026 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272521F000C5;
	Fri, 13 Nov 2026 12:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794571267;
	bh=gTPIFdycLfvRFxLEZX/ysZQ8afAPlmyCKY9h7UfC59w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZfgPFpD/dqpo/27RFi1AlEYTPl8SMhW9Kg6wzsW2TfPJ2d+Hwi9uYdtxiE4ByiB0G
	 8y20UMtQ7sJ4N/HWlIiKB40KXmKNiSaL5QbDvS3QZ6BA9awd4RmZfCGwr/Tc0nQurt
	 iaIJbvdH5unV7kDlu6GDh6R23AcQAV1DPE72FFj7rNnkAa6JFjqtkD3YTV6IKfHY4t
	 WnjaDsj3FqMGBfKaSHxZ8YUir8ILB0wT6rZPsXROS2xhYiarKzl6zG2A+F2F+c3wJL
	 BtfXrdsqBeFX3/VmP3eUvEu5E65aU85P0DmOp2zIUxzOf7tzM+KA6JH8tixRcqrhrL
	 CUsD/OXWCHYCA==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 13 Nov 2026 12:59:09 +0100
Subject: [PATCH v3 13/33] hfs: don't set SB_RDONLY after MDB write errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-work-fs-sb_rdonly-v3-13-0be92bb73709@kernel.org>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10035; i=brauner@kernel.org;
 h=from:subject:message-id; bh=hiBHmFbT56K7+Xyk4nQvRna9XyZ1bO7Um7R0oFjPD2I=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9+73y6ezohh1P1MUzBH+zu75J6rtr8Ytd/2eemkvYz
 W3KxpvXd5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzkpQkjw/p/d1fq6j2qFpTi
 lq1OfBa2lvWHC0fg5j9J3+u26Sbaf2Jk6E/j3l+c4xSZk7riNS+HO9+LOX6tf1c6yc38vrB8lns
 RJwA=
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
block allocation and hfs_file_truncate(). Writing inodes back isn't
refused because writeback still writes data and b-tree nodes.

B-tree growth isn't refused. A read can need a new b-tree node when it
writes back a cached extent record, and failing that would make such
reads fail with EIO until umount.

After a remount to read-only a remount to read-write fails with EROFS.
A plain remount to read-write right after the error succeeds but the
filesystem stays read-only. A remount to read-only works and
/proc/mounts keeps showing the filesystem read-write.

Fixes: fdbb95ff89b2 ("hfs: don't re-dirty MDB buffers after a write failure")
Cc: stable@vger.kernel.org
Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/hfs/attr.c   |  3 +++
 fs/hfs/dir.c    | 12 ++++++++++++
 fs/hfs/extent.c |  5 +++++
 fs/hfs/hfs_fs.h | 11 +++++++++++
 fs/hfs/inode.c  | 16 ++++++++++++++++
 fs/hfs/mdb.c    | 16 ++++++++++------
 fs/hfs/super.c  |  5 ++++-
 7 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/fs/hfs/attr.c b/fs/hfs/attr.c
index 6d737a085461c..bd9a1289d8c5d 100644
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
index f6b97da197887..f0d8ddb075034 100644
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
index 26357086517fc..dacf7ce1ffe4a 100644
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
index fdfa5d303d5ef..325214573d91d 100644
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
index 40c169d67664f..10f72c0536a07 100644
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
@@ -619,6 +626,8 @@ void hfs_evict_inode(struct inode *inode)
 
 static int hfs_file_open(struct inode *inode, struct file *file)
 {
+	if ((file->f_mode & FMODE_WRITE) && hfs_emergency_ro(inode->i_sb))
+		return -EROFS;
 	if (HFS_IS_RSRC(inode))
 		inode = HFS_I(inode)->rsrc_inode;
 	atomic_inc(&HFS_I(inode)->opencnt);
@@ -650,6 +659,9 @@ int hfs_inode_setattr(const struct mnt_idmap *idmap, struct dentry *dentry,
 	struct hfs_sb_info *hsb = HFS_SB(inode->i_sb);
 	int error;
 
+	if (unlikely(hfs_emergency_ro(inode->i_sb)))
+		return -EROFS;
+
 	error = setattr_prepare(&nop_mnt_idmap, dentry, attr);
 	if (error)
 		return error;
@@ -701,6 +713,10 @@ static int hfs_file_fsync(struct file *filp, loff_t start, loff_t end,
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
index 277de712f9d47..1a56cf5ea56e6 100644
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
index 5e6d66ff4bee9..bcc19c3a4f6bc 100644
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
