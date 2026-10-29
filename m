Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9345B60A2613
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E55e3GE9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAbb5DUl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=01XXKKmI/EPQnHgFTPDc9apZGrNx7zIfYD2ehMv+YhA=; b=E55e3GE9ha08JdowYpr5C7AVBY
	XA9TIYshMXMu+Pgc2ALOD6YcKVvFUxFoHr0iiNEwq+ZSzyNp8PqSWuQjx2FPu4mplrVt+QzfYGjcP
	F9fuGmhhVmiTg6JRx7TsHTgu9D9Pwyih9tHt63dPO3ND+yhF3StLVzaG5VBnbUgBtiOdXka4O13Xj
	RPQFEu8gMktMYVHZudskMqN8y7tRG0euko6JkDkd7uZeCfHVFOEu86msA8xg/1WGkWGs3ZCc29qzV
	XbjzR0qo92A+6ACtp4HUclLwUedeU0Z/xNJHS9PgJzd5vM5pDml4u//pB+InvGVZGoUjzS9hafz7r
	DmlpR+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSgO-00000009ksP-1GyN;
	Thu, 29 Oct 2026 16:08:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSgN-00000009krp-23iN
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:08:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 437CE4163F;
	Thu, 29 Oct 2026 16:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319001F01816;
	Thu, 29 Oct 2026 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290131;
	bh=fYLTRB96LN7RebiK7hFKBZ3h+lwWyZev+AxtatE8lJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CAbb5DUluPoHDa9s81xrNaUrrMVZGOhJEsr3nOf5L11RYO1az07kuHlQC+sqJ2waE
	 cKzYKUJATJ2hUTdX4GEC4InIrN5bsfrITO9yP0SsmPTbgSFuTQA2A/TEIjTK7ginCQ
	 m9l/mopoDv48kMJaNh4X9HHavXRZRI4Tf/yEYkoMoSrfMAZfqQnfwK8UszXwf+/y9J
	 4pV7wquhaaklkMbg0cC8jzaUtwx5sdUt8sSe9nVoMo49iMrnIe5No35nU5ePgqGfF7
	 PEhiKIJw5APmAPaLOZ3ivb/zM8Z0ntpogljyeQG1MrmuUvdoohlqlCbcvPz5MjoxZ+
	 pnfcprOoFUvPw==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 29 Oct 2026 17:07:12 +0100
Subject: [PATCH v2 21/34] zonefs: don't set SB_RDONLY after I/O errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-work-fs-sb_rdonly-v2-21-2f44f64f0b66@kernel.org>
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
 "Christian Brauner (Amutable)" <brauner@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8256; i=brauner@kernel.org;
 h=from:subject:message-id; bh=lOaOSG9XUps4OEG0IvNRy9lQ1UJIH7otMWSnFL7mfmQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9zjfwYP4201UoTDjBIPvicfazLu8MXGv08q41bGdfv
 lrpxaGUjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIn8FWH473Rx2ZVGb87r2/x/
 sUV/tp7s3PNTcq3S18fsTyyU5oqwvmL4H3fl6V/ZpC7diTybaw7Z8xg6lSnHyBkZTZqz65JF2gs
 JFgA=
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

zonefs sets SB_RDONLY from its I/O error handling without holding
s_umount: with errors=remount-ro, when the zone report fails and when
closing an explicitly opened zone fails. If that happens while the
filesystem is frozen through bdev_freeze() thaw_super() sees a read-only
superblock and leaves the s_writers rwsems locked. Writers hang and even
a remount to read-write doesn't help because the next freeze blocks
forever.

So record the error in a new ZONEFS_SB_EMERGENCY_RO bit instead. All
three places go through zonefs_set_emergency_ro() which keeps printing
the warning once. Write opens, write_iter and setattr fail with EROFS
and page_mkwrite with SIGBUS. An error on a read-only mount doesn't set
the bit.

The state lasts until umount and zonefs.rst says so. A remount to
read-only works and writes nothing. /proc/mounts keeps showing the
filesystem read-write. ftruncate() and write faults through file
descriptors and mappings from before the error are refused now too.

Fixes: 8dcc1a9d90c1 ("fs: New zonefs file system")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 Documentation/filesystems/zonefs.rst |  4 ++--
 fs/zonefs/file.c                     | 17 +++++++++--------
 fs/zonefs/super.c                    | 34 ++++++++++++++++++++++++++--------
 fs/zonefs/zonefs.h                   | 16 ++++++++++++++++
 4 files changed, 53 insertions(+), 18 deletions(-)

diff --git a/Documentation/filesystems/zonefs.rst b/Documentation/filesystems/zonefs.rst
index c22124c2213d..55ca0f2ef2b2 100644
--- a/Documentation/filesystems/zonefs.rst
+++ b/Documentation/filesystems/zonefs.rst
@@ -285,8 +285,8 @@ Further notes:
 * The "errors=remount-ro" mount option is the default behavior of zonefs I/O
   error processing if no errors mount option is specified.
 * With the "errors=remount-ro" mount option, the change of the file access
-  permissions to read-only applies to all files. The file system is remounted
-  read-only.
+  permissions to read-only applies to all files. A file system mounted
+  read-write refuses all writes until it is unmounted.
 * Access permission and file size changes due to the device transitioning zones
   to the offline condition are permanent. Remounting or reformatting the device
   with mkfs.zonefs (mkzonefs) will not change back offline zone files to a good
diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
index 5b34849be7a2..8959b6b36a83 100644
--- a/fs/zonefs/file.c
+++ b/fs/zonefs/file.c
@@ -299,7 +299,7 @@ static vm_fault_t zonefs_filemap_page_mkwrite(struct vm_fault *vmf)
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	vm_fault_t ret;
 
-	if (unlikely(IS_IMMUTABLE(inode)))
+	if (unlikely(IS_IMMUTABLE(inode) || zonefs_emergency_ro(inode->i_sb)))
 		return VM_FAULT_SIGBUS;
 
 	/*
@@ -601,7 +601,7 @@ static ssize_t zonefs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	if (unlikely(IS_IMMUTABLE(inode)))
 		return -EPERM;
 
-	if (sb_rdonly(inode->i_sb))
+	if (sb_rdonly(inode->i_sb) || zonefs_emergency_ro(inode->i_sb))
 		return -EROFS;
 
 	/* Write operations beyond the zone capacity are not allowed */
@@ -788,6 +788,9 @@ static int zonefs_file_open(struct inode *inode, struct file *file)
 {
 	int ret;
 
+	if ((file->f_mode & FMODE_WRITE) && zonefs_emergency_ro(inode->i_sb))
+		return -EROFS;
+
 	file->f_mode |= FMODE_CAN_ODIRECT;
 	ret = generic_file_open(inode, file);
 	if (ret)
@@ -825,17 +828,15 @@ static void zonefs_seq_file_write_close(struct inode *inode)
 			/*
 			 * Leaving zones explicitly open may lead to a state
 			 * where most zones cannot be written (zone resources
-			 * exhausted). So take preventive action by remounting
-			 * read-only.
+			 * exhausted). So take preventive action by making the
+			 * file system read-only.
 			 */
 			if (z->z_flags & ZONEFS_ZONE_OPEN &&
-			    !(sb->s_flags & SB_RDONLY)) {
+			    !sb_rdonly(sb) && !zonefs_emergency_ro(sb)) {
 				zonefs_warn(sb,
 					"closing zone at %llu failed %d\n",
 					z->z_sector, ret);
-				zonefs_warn(sb,
-					"remounting filesystem read-only\n");
-				sb->s_flags |= SB_RDONLY;
+				zonefs_set_emergency_ro(sb);
 			}
 			goto unlock;
 		}
diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index b97f1f2b8dda..e7c97b75c601 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -247,6 +247,19 @@ static void zonefs_inode_update_mode(struct inode *inode)
 	z->z_mode = inode->i_mode;
 }
 
+/*
+ * Refuse writes after an error. SB_RDONLY needs s_umount and a remount, set on
+ * a frozen file system it makes thaw_super() leave s_writers locked.
+ */
+void zonefs_set_emergency_ro(struct super_block *sb)
+{
+	if (sb_rdonly(sb) ||
+	    test_and_set_bit(ZONEFS_SB_EMERGENCY_RO, &ZONEFS_SB(sb)->s_state))
+		return;
+
+	zonefs_warn(sb, "remounting filesystem read-only\n");
+}
+
 static int zonefs_io_error_cb(struct blk_zone *zone, unsigned int idx,
 			      void *data)
 {
@@ -339,13 +352,11 @@ static void zonefs_handle_io_error(struct inode *inode, struct blk_zone *zone,
 		z->z_flags &= ~ZONEFS_ZONE_OPEN;
 
 	/*
-	 * If error=remount-ro was specified, any error result in remounting
-	 * the volume as read-only.
+	 * If error=remount-ro was specified, any error makes the volume
+	 * read-only.
 	 */
-	if ((sbi->s_mount_opts & ZONEFS_MNTOPT_ERRORS_RO) && !sb_rdonly(sb)) {
-		zonefs_warn(sb, "remounting filesystem read-only\n");
-		sb->s_flags |= SB_RDONLY;
-	}
+	if (sbi->s_mount_opts & ZONEFS_MNTOPT_ERRORS_RO)
+		zonefs_set_emergency_ro(sb);
 
 	/*
 	 * Update block usage stats and the inode size  to prevent access to
@@ -404,8 +415,7 @@ void __zonefs_io_error(struct inode *inode, bool write)
 	if (ret != 1) {
 		zonefs_err(sb, "Get inode %llu zone information failed %d\n",
 			   inode->i_ino, ret);
-		zonefs_warn(sb, "remounting filesystem read-only\n");
-		sb->s_flags |= SB_RDONLY;
+		zonefs_set_emergency_ro(sb);
 		return;
 	}
 
@@ -539,6 +549,9 @@ static int zonefs_inode_setattr(const struct mnt_idmap *idmap,
 	struct inode *inode = d_inode(dentry);
 	int ret;
 
+	if (unlikely(zonefs_emergency_ro(inode->i_sb)))
+		return -EROFS;
+
 	if (unlikely(IS_IMMUTABLE(inode)))
 		return -EPERM;
 
@@ -1369,6 +1382,11 @@ static int zonefs_reconfigure(struct fs_context *fc)
 	struct super_block *sb = fc->root->d_sb;
 	struct zonefs_sb_info *sbi = sb->s_fs_info;
 
+	/* An error made the file system read-only until it is unmounted. */
+	if (sb_rdonly(sb) && !(fc->sb_flags & SB_RDONLY) &&
+	    zonefs_emergency_ro(sb))
+		return -EROFS;
+
 	sync_filesystem(fc->root->d_sb);
 	/* Copy new options from ctx into sbi. */
 	sbi->s_mount_opts = ctx->s_mount_opts;
diff --git a/fs/zonefs/zonefs.h b/fs/zonefs/zonefs.h
index 8175652241b5..b14822cb9c02 100644
--- a/fs/zonefs/zonefs.h
+++ b/fs/zonefs/zonefs.h
@@ -241,6 +241,16 @@ struct zonefs_sb_info {
 	bool			s_sysfs_registered;
 	struct kobject		s_kobj;
 	struct completion	s_kobj_unregister;
+
+	unsigned long		s_state;
+};
+
+/*
+ * Super block state bits (s_state).
+ */
+enum {
+	/* An error made the file system read-only until it is unmounted */
+	ZONEFS_SB_EMERGENCY_RO,
 };
 
 static inline struct zonefs_sb_info *ZONEFS_SB(struct super_block *sb)
@@ -248,6 +258,11 @@ static inline struct zonefs_sb_info *ZONEFS_SB(struct super_block *sb)
 	return sb->s_fs_info;
 }
 
+static inline bool zonefs_emergency_ro(struct super_block *sb)
+{
+	return test_bit(ZONEFS_SB_EMERGENCY_RO, &ZONEFS_SB(sb)->s_state);
+}
+
 #define zonefs_info(sb, format, args...)	\
 	pr_info("zonefs (%s): " format, sb->s_id, ## args)
 #define zonefs_err(sb, format, args...)		\
@@ -260,6 +275,7 @@ void zonefs_inode_account_active(struct inode *inode);
 int zonefs_inode_zone_mgmt(struct inode *inode, enum req_op op);
 void zonefs_i_size_write(struct inode *inode, loff_t isize);
 void zonefs_update_stats(struct inode *inode, loff_t new_isize);
+void zonefs_set_emergency_ro(struct super_block *sb);
 void __zonefs_io_error(struct inode *inode, bool write);
 
 static inline void zonefs_io_error(struct inode *inode, bool write)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
