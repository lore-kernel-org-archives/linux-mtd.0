Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B0DD6407A
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Dec 2025 06:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oOvDY0u+NYAk0eM6RM/WmSaUWwxftIh/SxM9YVpTSMA=; b=v98h2rEPoS0ALD
	SndCxDOQhbF2Pb9uEKMsxTpvkOUMbicAE90m1cPpqf6Bs/pJ3nHkN3K3CMHjIsfsA/8wmZGS7kd+Z
	w+zbCQEb018Dny9MSi32+06Cd3W9fgBOAYgRG/ic+qvXOYb7KUA5ut4aYRlYTG98JE/KbGPQ40pTo
	tqTmUe6gqEenksbmT4dBa+9GGGB6Tukwg67TZVfeD9fGyPgOGkDoc5u7MQvSTOHgWAUEn8PHu9j4g
	sew7+xO5XQvNIjkci3E114y4aQW43RHZQj/j0sx6v3ZlSfykMI9iEtIyREMh6+piReAvYZ08e9ZRC
	1dtOBhs8HZwwn2jWt3Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVkkZ-00000006Djs-3iTB;
	Wed, 17 Dec 2025 06:11:03 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVkkZ-00000006Ddf-0Az9;
	Wed, 17 Dec 2025 06:11:03 +0000
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
Subject: [PATCH 05/10] fs: allow error returns from inode_update_timestamps
Date: Wed, 17 Dec 2025 07:09:38 +0100
Message-ID: <20251217061015.923954-6-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217061015.923954-1-hch@lst.de>
References: <20251217061015.923954-1-hch@lst.de>
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

Change flags to a by reference argument so that it can be updated so that
the return value can be used for error returns.  This will be used to
implement non-blocking timestamp updates.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 fs/btrfs/inode.c    |  8 +++++---
 fs/inode.c          | 24 ++++++++++++++++--------
 fs/nfs/inode.c      |  4 ++--
 fs/orangefs/inode.c |  5 ++++-
 fs/ubifs/file.c     |  2 +-
 include/linux/fs.h  |  2 +-
 6 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 317db7d10a21..3ca8d294770e 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -6349,13 +6349,15 @@ static int btrfs_dirty_inode(struct btrfs_inode *inode)
 static int btrfs_update_time(struct inode *inode, int flags)
 {
 	struct btrfs_root *root = BTRFS_I(inode)->root;
-	bool dirty;
+	int error;
 
 	if (btrfs_root_readonly(root))
 		return -EROFS;
 
-	dirty = inode_update_timestamps(inode, flags);
-	return dirty ? btrfs_dirty_inode(BTRFS_I(inode)) : 0;
+	error = inode_update_timestamps(inode, &flags);
+	if (error || !flags)
+		return error;
+	return btrfs_dirty_inode(BTRFS_I(inode));
 }
 
 /*
diff --git a/fs/inode.c b/fs/inode.c
index 17ecb7bb5067..2c0d69f7fd01 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2095,14 +2095,18 @@ static bool relatime_need_update(struct vfsmount *mnt, struct inode *inode,
  * attempt to update all three of them. S_ATIME updates can be handled
  * independently of the rest.
  *
- * Returns a set of S_* flags indicating which values changed.
+ * Updates @flags to contain the S_* flags which actually need changing.  This
+ * can drop flags from the input when they don't need an update, or can add
+ * S_VERSION when the version needs to be bumped.
+ *
+ * Returns 0 or a negative errno.
  */
-int inode_update_timestamps(struct inode *inode, int flags)
+int inode_update_timestamps(struct inode *inode, int *flags)
 {
 	int updated = 0;
 	struct timespec64 now;
 
-	if (flags & (S_MTIME|S_CTIME|S_VERSION)) {
+	if (*flags & (S_MTIME | S_CTIME | S_VERSION)) {
 		struct timespec64 ctime = inode_get_ctime(inode);
 		struct timespec64 mtime = inode_get_mtime(inode);
 
@@ -2119,7 +2123,7 @@ int inode_update_timestamps(struct inode *inode, int flags)
 		now = current_time(inode);
 	}
 
-	if (flags & S_ATIME) {
+	if (*flags & S_ATIME) {
 		struct timespec64 atime = inode_get_atime(inode);
 
 		if (!timespec64_equal(&now, &atime)) {
@@ -2127,7 +2131,9 @@ int inode_update_timestamps(struct inode *inode, int flags)
 			updated |= S_ATIME;
 		}
 	}
-	return updated;
+
+	*flags = updated;
+	return 0;
 }
 EXPORT_SYMBOL(inode_update_timestamps);
 
@@ -2145,10 +2151,12 @@ EXPORT_SYMBOL(inode_update_timestamps);
  */
 int generic_update_time(struct inode *inode, int flags)
 {
-	flags = inode_update_timestamps(inode, flags);
-	if (flags)
+	int error;
+
+	error = inode_update_timestamps(inode, &flags);
+	if (!error && flags)
 		mark_inode_dirty_time(inode, flags);
-	return 0;
+	return error;
 }
 EXPORT_SYMBOL(generic_update_time);
 
diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index 84049f3cd340..221816524c66 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -671,8 +671,8 @@ static void nfs_set_timestamps_to_ts(struct inode *inode, struct iattr *attr)
 
 static void nfs_update_timestamps(struct inode *inode, unsigned int ia_valid)
 {
-	enum file_time_flags time_flags = 0;
 	unsigned int cache_flags = 0;
+	int time_flags = 0;
 
 	if (ia_valid & ATTR_MTIME) {
 		time_flags |= S_MTIME | S_CTIME;
@@ -682,7 +682,7 @@ static void nfs_update_timestamps(struct inode *inode, unsigned int ia_valid)
 		time_flags |= S_ATIME;
 		cache_flags |= NFS_INO_INVALID_ATIME;
 	}
-	inode_update_timestamps(inode, time_flags);
+	inode_update_timestamps(inode, &time_flags);
 	NFS_I(inode)->cache_validity &= ~cache_flags;
 }
 
diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index d7275990ffa4..3b58f31bd54f 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -875,11 +875,14 @@ int orangefs_permission(struct mnt_idmap *idmap,
 int orangefs_update_time(struct inode *inode, int flags)
 {
 	struct iattr iattr;
+	int error;
 
 	gossip_debug(GOSSIP_INODE_DEBUG, "orangefs_update_time: %pU\n",
 	    get_khandle_from_ino(inode));
 
-	flags = inode_update_timestamps(inode, flags);
+	error = inode_update_timestamps(inode, &flags);
+	if (error || !flags)
+		return error;
 
 	memset(&iattr, 0, sizeof iattr);
         if (flags & S_ATIME)
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index ec1bb9f43acc..71540644a931 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1387,7 +1387,7 @@ int ubifs_update_time(struct inode *inode, int flags)
 		return err;
 
 	mutex_lock(&ui->ui_mutex);
-	inode_update_timestamps(inode, flags);
+	inode_update_timestamps(inode, &flags);
 	release = ui->dirty;
 	__mark_inode_dirty(inode, I_DIRTY_SYNC);
 	mutex_unlock(&ui->ui_mutex);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 66d3d18cf4e3..75d5f38b08c9 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2399,7 +2399,7 @@ static inline void super_set_sysfs_name_generic(struct super_block *sb, const ch
 extern void ihold(struct inode * inode);
 extern void iput(struct inode *);
 void iput_not_last(struct inode *);
-int inode_update_timestamps(struct inode *inode, int flags);
+int inode_update_timestamps(struct inode *inode, int *flags);
 int generic_update_time(struct inode *inode, int flags);
 
 /* /sys/fs */
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
