Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820DCE6B25E
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 00:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uc8K3oTfW3yewLK6sXozvKJz1CJPDPxQvH82TAGSRFg=; b=My5UH+NmvOt2gb
	ofob1H4pqjf60oZbXbNb6neJgUL0ENv8VdnUbU8YbfrXXk6Bn1vVYT4KDfvYsjIfLaMdmDYEMe9/m
	PRWprbn6CvDbuLpYvcE7limm6SHofPs2OkiOkN5P69Tm/yxOrm6iztS6/jDDbrWzbTRMmV4OJ8bH/
	idImXwSPshdzfULX9eQkSz2yj0dtAAzCnvN1NveaoqXb0eiH2PBKaTYo/zssbwqVciRe4JiMOKw23
	wcj1n4VZIVpFzynV+ahCi249dAnmONmgDC6/SsiMPQcGVgjLwPg1c+odfnjMknfQizTkn3FQPk5ru
	QmB0IN6/uNPVR3gWpH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXqQ4-0000000EItY-3DkD;
	Tue, 23 Dec 2025 00:38:32 +0000
Received: from s58.ghokkaidofl2.vectant.ne.jp ([202.215.7.58] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXqQ3-0000000EIqa-2GeB;
	Tue, 23 Dec 2025 00:38:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>,
	Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	gfs2@lists.linux.dev,
	io-uring@vger.kernel.org,
	devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: [PATCH 05/11] fs: return I_DIRTY_* and allow error returns from inode_update_timestamps
Date: Tue, 23 Dec 2025 09:37:48 +0900
Message-ID: <20251223003756.409543-6-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223003756.409543-1-hch@lst.de>
References: <20251223003756.409543-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Change the inode_update_timestamps calling convention, so that instead
of returning the updated flags that are only needed to calculate the
I_DIRTY_* flags, return the I_DIRTY_* flags diretly in an argument, and
reserve the return value to return an error code, which will be needed to
support non-blocking timestamp updates.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/inode.c    |  8 +++++---
 fs/inode.c          | 44 ++++++++++++++++++++++++++++----------------
 fs/nfs/inode.c      |  4 ++--
 fs/orangefs/inode.c |  5 ++++-
 fs/ubifs/file.c     |  4 ++--
 include/linux/fs.h  |  2 +-
 6 files changed, 42 insertions(+), 25 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 317db7d10a21..b04842c83eef 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -6349,13 +6349,15 @@ static int btrfs_dirty_inode(struct btrfs_inode *inode)
 static int btrfs_update_time(struct inode *inode, int flags)
 {
 	struct btrfs_root *root = BTRFS_I(inode)->root;
-	bool dirty;
+	int dirty_flags, error;
 
 	if (btrfs_root_readonly(root))
 		return -EROFS;
 
-	dirty = inode_update_timestamps(inode, flags);
-	return dirty ? btrfs_dirty_inode(BTRFS_I(inode)) : 0;
+	error = inode_update_timestamps(inode, flags, &dirty_flags);
+	if (error || !dirty_flags)
+		return error;
+	return btrfs_dirty_inode(BTRFS_I(inode));
 }
 
 /*
diff --git a/fs/inode.c b/fs/inode.c
index 19f50bdb6f7d..59fffb1dbdeb 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2081,10 +2081,18 @@ static bool relatime_need_update(struct vfsmount *mnt, struct inode *inode,
 	return false;
 }
 
+static inline int timestamp_dirty_flag(struct super_block *sb)
+{
+	if (sb->s_flags & SB_LAZYTIME)
+		return I_DIRTY_TIME;
+	return I_DIRTY_SYNC;
+}
+
 /**
  * inode_update_timestamps - update the timestamps on the inode
  * @inode: inode to be updated
  * @flags: S_* flags that needed to be updated
+ * @dirty_flags: returns the I_DIRTY_* flags for the modification
  *
  * The update_time function is called when an inode's timestamps need to be
  * updated for a read or write operation. This function handles updating the
@@ -2095,14 +2103,18 @@ static bool relatime_need_update(struct vfsmount *mnt, struct inode *inode,
  * attempt to update all three of them. S_ATIME updates can be handled
  * independently of the rest.
  *
- * Returns a set of S_* flags indicating which values changed.
+ * Sets @dirty_flags to contain the I_DIRTY_FLAG_* flags for the actual changes.
+ *
+ * Returns 0 or a negative errno.
  */
-int inode_update_timestamps(struct inode *inode, int flags)
+int inode_update_timestamps(struct inode *inode, int flags, int *dirty_flags)
 {
-	int updated = 0;
 	struct timespec64 now;
+	int updated = 0;
 
-	if (flags & (S_MTIME|S_CTIME|S_VERSION)) {
+	*dirty_flags = 0;
+
+	if (flags & (S_MTIME | S_CTIME | S_VERSION)) {
 		struct timespec64 ctime = inode_get_ctime(inode);
 		struct timespec64 mtime = inode_get_mtime(inode);
 
@@ -2124,11 +2136,17 @@ int inode_update_timestamps(struct inode *inode, int flags)
 			updated |= S_ATIME;
 	}
 
+	if (updated & (S_MTIME | S_CTIME | S_MTIME))
+		*dirty_flags |= timestamp_dirty_flag(inode->i_sb);
+	if (updated & S_VERSION)
+		*dirty_flags |= I_DIRTY_SYNC;
+
 	if (updated & S_MTIME)
 		inode_set_mtime_to_ts(inode, now);
 	if (updated & S_ATIME)
 		inode_set_atime_to_ts(inode, now);
-	return updated;
+
+	return 0;
 }
 EXPORT_SYMBOL(inode_update_timestamps);
 
@@ -2146,18 +2164,12 @@ EXPORT_SYMBOL(inode_update_timestamps);
  */
 int generic_update_time(struct inode *inode, int flags)
 {
-	int updated = inode_update_timestamps(inode, flags);
-	int dirty_flags = 0;
-
-	if (!updated)
-		return 0;
+	int dirty_flags, error;
 
-	if (updated & (S_ATIME|S_MTIME|S_CTIME))
-		dirty_flags = inode->i_sb->s_flags & SB_LAZYTIME ? I_DIRTY_TIME : I_DIRTY_SYNC;
-	if (updated & S_VERSION)
-		dirty_flags |= I_DIRTY_SYNC;
-	__mark_inode_dirty(inode, dirty_flags);
-	return 0;
+	error = inode_update_timestamps(inode, flags, &dirty_flags);
+	if (!error && dirty_flags)
+		__mark_inode_dirty(inode, dirty_flags);
+	return error;
 }
 EXPORT_SYMBOL(generic_update_time);
 
diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index 84049f3cd340..6dfe382cb9fa 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -671,8 +671,8 @@ static void nfs_set_timestamps_to_ts(struct inode *inode, struct iattr *attr)
 
 static void nfs_update_timestamps(struct inode *inode, unsigned int ia_valid)
 {
-	enum file_time_flags time_flags = 0;
 	unsigned int cache_flags = 0;
+	int time_flags = 0, dirty_flags;
 
 	if (ia_valid & ATTR_MTIME) {
 		time_flags |= S_MTIME | S_CTIME;
@@ -682,7 +682,7 @@ static void nfs_update_timestamps(struct inode *inode, unsigned int ia_valid)
 		time_flags |= S_ATIME;
 		cache_flags |= NFS_INO_INVALID_ATIME;
 	}
-	inode_update_timestamps(inode, time_flags);
+	inode_update_timestamps(inode, time_flags, &dirty_flags);
 	NFS_I(inode)->cache_validity &= ~cache_flags;
 }
 
diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index d7275990ffa4..beb45690081c 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -875,11 +875,14 @@ int orangefs_permission(struct mnt_idmap *idmap,
 int orangefs_update_time(struct inode *inode, int flags)
 {
 	struct iattr iattr;
+	int error, dirty_flags;
 
 	gossip_debug(GOSSIP_INODE_DEBUG, "orangefs_update_time: %pU\n",
 	    get_khandle_from_ino(inode));
 
-	flags = inode_update_timestamps(inode, flags);
+	error = inode_update_timestamps(inode, flags, &dirty_flags);
+	if (error || !flags)
+		return error;
 
 	memset(&iattr, 0, sizeof iattr);
         if (flags & S_ATIME)
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index ec1bb9f43acc..fe236886484c 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1377,7 +1377,7 @@ int ubifs_update_time(struct inode *inode, int flags)
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 	struct ubifs_budget_req req = { .dirtied_ino = 1,
 			.dirtied_ino_d = ALIGN(ui->data_len, 8) };
-	int err, release;
+	int err, release, dirty_flags;
 
 	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
 		return generic_update_time(inode, flags);
@@ -1387,7 +1387,7 @@ int ubifs_update_time(struct inode *inode, int flags)
 		return err;
 
 	mutex_lock(&ui->ui_mutex);
-	inode_update_timestamps(inode, flags);
+	inode_update_timestamps(inode, flags, &dirty_flags);
 	release = ui->dirty;
 	__mark_inode_dirty(inode, I_DIRTY_SYNC);
 	mutex_unlock(&ui->ui_mutex);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index fccb0a38cb74..ec2f78db0977 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2398,7 +2398,7 @@ static inline void super_set_sysfs_name_generic(struct super_block *sb, const ch
 extern void ihold(struct inode * inode);
 extern void iput(struct inode *);
 void iput_not_last(struct inode *);
-int inode_update_timestamps(struct inode *inode, int flags);
+int inode_update_timestamps(struct inode *inode, int flags, int *dirty_flags);
 int generic_update_time(struct inode *inode, int flags);
 
 /* /sys/fs */
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
