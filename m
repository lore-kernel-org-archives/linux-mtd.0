Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33F9E6B25E
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 00:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOxLOD9Cuqqf5WZQovWslogL+h06PjFWNSnh2m1Y8pk=; b=Qku0s0H1K38ycD
	9fzWOpR+GxiqAxq4nK00UES8bt7U9oKzQwJWan+tb7cKuKzNfNPgB+X6fmMmLHzaxkyCdgPyGDK4A
	Y/fP3ZlnMbUcNz7Tx24qBeS96pmpX+r3KZmW4HkB+3r120ET95SlQe6E+FkkMGbDH1hY0hGtRLKmK
	FaXAgxP0T63w8h31sA0whgDKPKOSQbvhtFel3j5t8qSi/44MQ9BbHfrLj6HEX/4/14mDoqfEl11u6
	NK6J0RJEaZMqDW4aToG3WLKLt5i16OqPUVHTKUIUiYHMDpugxNiXti9U2yCz+bBgiY6AAQcmTyPtX
	BXd8eCU7z+nZZSx3e61Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXqQL-0000000EJ5x-11yt;
	Tue, 23 Dec 2025 00:38:49 +0000
Received: from s58.ghokkaidofl2.vectant.ne.jp ([202.215.7.58] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXqQJ-0000000EJ07-0YZe;
	Tue, 23 Dec 2025 00:38:47 +0000
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
Subject: [PATCH 08/11] fs: add support for non-blocking timestamp updates
Date: Tue, 23 Dec 2025 09:37:51 +0900
Message-ID: <20251223003756.409543-9-hch@lst.de>
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

Currently file_update_time_flags unconditionally returns -EAGAIN if any
timestamp needs to be updated and IOCB_NOWAIT is passed.  This makes
non-blocking direct writes impossible on file systems with granular
enough timestamps.

Add a S_NOWAIT to ask for timestamps to not block, and return -EAGAIN in
all methods for now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fat/misc.c        |  3 +++
 fs/gfs2/inode.c      |  3 +++
 fs/inode.c           | 29 ++++++++++++++++++++++++++---
 fs/overlayfs/inode.c |  2 ++
 fs/ubifs/file.c      |  3 +++
 fs/xfs/xfs_iops.c    |  3 +++
 include/linux/fs.h   | 21 +++++++++++++++++----
 7 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/fs/fat/misc.c b/fs/fat/misc.c
index 950da09f0961..5df3193c35f9 100644
--- a/fs/fat/misc.c
+++ b/fs/fat/misc.c
@@ -346,6 +346,9 @@ int fat_update_time(struct inode *inode, int flags)
 	if (inode->i_ino == MSDOS_ROOT_INO)
 		return 0;
 
+	if (flags & S_NOWAIT)
+		return -EAGAIN;
+
 	if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
 		fat_truncate_time(inode, NULL, flags);
 		if (inode->i_sb->s_flags & SB_LAZYTIME)
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index e08eb419347c..0dce2af533b2 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -2249,6 +2249,9 @@ static int gfs2_update_time(struct inode *inode, int flags)
 	struct gfs2_holder *gh;
 	int error;
 
+	if (flags & S_NOWAIT)
+		return -EAGAIN;
+
 	gh = gfs2_glock_is_locked_by_me(gl);
 	if (gh && gl->gl_state != LM_ST_EXCLUSIVE) {
 		gfs2_glock_dq(gh);
diff --git a/fs/inode.c b/fs/inode.c
index 212dab5c65ad..98a878427ecb 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2111,6 +2111,13 @@ int inode_update_timestamps(struct inode *inode, int flags, int *dirty_flags)
 
 	*dirty_flags = 0;
 
+	/*
+	 * Non-blocking timestamp updates require an explicit opt-in from the
+	 * file system.
+	 */
+	if ((flags & S_NOWAIT) && !(flags & S_CAN_NOWAIT_LAZYTIME))
+		return -EAGAIN;
+
 	if (flags & (S_MTIME | S_CTIME | S_VERSION)) {
 		struct timespec64 ctime = inode_get_ctime(inode);
 		struct timespec64 mtime = inode_get_mtime(inode);
@@ -2120,8 +2127,24 @@ int inode_update_timestamps(struct inode *inode, int flags, int *dirty_flags)
 			updated |= S_CTIME;
 		if (!timespec64_equal(&now, &mtime))
 			updated |= S_MTIME;
-		if (IS_I_VERSION(inode) && inode_maybe_inc_iversion(inode, updated))
-			updated |= S_VERSION;
+
+		/*
+		 * Pure timestamp updates can be recorded in the inode without
+		 * blocking by not dirtying the inode.  But when the file system
+		 * requires i_version updates, actual i_version update may block
+		 * despite that.  Error out if we'd actually have to update
+		 * i_version or don't support lazytime.
+		 */
+		if (IS_I_VERSION(inode)) {
+			if (flags & S_NOWAIT) {
+				if (!(inode->i_sb->s_flags & SB_LAZYTIME) ||
+				    inode_iversion_need_inc(inode))
+					return -EAGAIN;
+			} else {
+				if (inode_maybe_inc_iversion(inode, updated))
+					updated |= S_NOWAIT;
+			}
+		}
 	} else {
 		now = current_time(inode);
 	}
@@ -2391,7 +2414,7 @@ static int file_update_time_flags(struct file *file, unsigned int flags)
 		return 0;
 
 	if (flags & IOCB_NOWAIT)
-		return -EAGAIN;
+		sync_mode |= S_NOWAIT;
 
 	if (mnt_get_write_access_file(file))
 		return 0;
diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
index bdbf86b56a9b..6d23cacbf776 100644
--- a/fs/overlayfs/inode.c
+++ b/fs/overlayfs/inode.c
@@ -565,6 +565,8 @@ int ovl_update_time(struct inode *inode, int flags)
 		};
 
 		if (upperpath.dentry) {
+			if (flags & S_NOWAIT)
+				return -EAGAIN;
 			touch_atime(&upperpath);
 			inode_set_atime_to_ts(inode,
 					      inode_get_atime(d_inode(upperpath.dentry)));
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index fe236886484c..b74dd4d21330 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1382,6 +1382,9 @@ int ubifs_update_time(struct inode *inode, int flags)
 	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
 		return generic_update_time(inode, flags);
 
+	if (flags & S_NOWAIT)
+		return -EAGAIN;
+
 	err = ubifs_budget_space(c, &req);
 	if (err)
 		return err;
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 9dedb54e3cb0..626a541b247b 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1195,6 +1195,9 @@ xfs_vn_update_time(
 
 	trace_xfs_update_time(ip);
 
+	if (flags & S_NOWAIT)
+		return -EAGAIN;
+
 	if (inode->i_sb->s_flags & SB_LAZYTIME) {
 		if (!((flags & S_VERSION) &&
 		      inode_maybe_inc_iversion(inode, false)))
diff --git a/include/linux/fs.h b/include/linux/fs.h
index d1d57149aa93..0ea175e19a8b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2239,10 +2239,23 @@ static inline void inode_dec_link_count(struct inode *inode)
 }
 
 enum file_time_flags {
-	S_ATIME = 1,
-	S_MTIME = 2,
-	S_CTIME = 4,
-	S_VERSION = 8,
+	/* update atime: */
+	S_ATIME			= 1U << 0,
+
+	/* update mtime */
+	S_MTIME			= 1U << 1,
+
+	/* update ctime */
+	S_CTIME			= 1U << 2,
+
+	/* force update i_version even if no timestamp changes */
+	S_VERSION		= 1U << 3,
+
+	/* only update timestamps or i_version if it doesn't require blocking */
+	S_NOWAIT		= 1U << 14,
+
+	/* support S_NOWAIT for SB_LAZYTIME mounts in inode_update_timestamps */
+	S_CAN_NOWAIT_LAZYTIME	= 1U << 15,
 };
 
 extern bool atime_needs_update(const struct path *, struct inode *);
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
