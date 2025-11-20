Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8B6CF64BB
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 06:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Q21hczrSEueZOwqL6fFVK4APW/ZXhHrmnZ8TUejVY0=; b=UhElW1lJcLRxiE
	nC3sOpKALRmgT84/pU3izuHHcf+Y/SHqmAHATr+kHX590G8lxoLdMutCVd5yY14Lhjy2JQ4CMrOBn
	eov3heNkfFzKXGMU0NIdIvSicJPF/Fzff+TzrGtSsMdz3PYETwAWt2/CIgUJlEaMTd3bVK9Taa/zP
	F7fsLj3NKl+AYQBSLoTVVBibwhpVPMxQ/1ZX2foFJudyVkYo8UzPBk9yni18hm80Vimm7AWdIoBL8
	2kcyXEpu0ws08bVz+7Fb7l8OKj04IFoOxMU0rK8x0gqWboRXys8FQkxfI9k11RgJumioBzDKqffxL
	AgSZgOBbsRC2kGQYGXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyVD-00000006FP1-10jv;
	Thu, 20 Nov 2025 06:50:47 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyVB-00000006FJY-3Jnx;
	Thu, 20 Nov 2025 06:50:46 +0000
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
Subject: [PATCH 13/16] fs: add a ->sync_lazytime method
Date: Thu, 20 Nov 2025 07:47:34 +0100
Message-ID: <20251120064859.2911749-14-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120064859.2911749-1-hch@lst.de>
References: <20251120064859.2911749-1-hch@lst.de>
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

Allow the file system to explicitly implement lazytime syncing instead
of pigging back on generic inode dirtying.  This allows to simplify
the XFS implementation and prepares for non-blocking lazytime timestamp
updates.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 Documentation/filesystems/locking.rst |  2 ++
 Documentation/filesystems/vfs.rst     |  6 ++++++
 fs/fs-writeback.c                     | 15 ++++++++++++---
 include/linux/fs.h                    |  1 +
 4 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
index 77704fde9845..9b2f14ada8cd 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -81,6 +81,7 @@ prototypes::
 	ssize_t (*listxattr) (struct dentry *, char *, size_t);
 	int (*fiemap)(struct inode *, struct fiemap_extent_info *, u64 start, u64 len);
 	void (*update_time)(struct inode *, struct timespec *, int);
+	void (*sync_lazytime)(struct inode *inode);
 	int (*atomic_open)(struct inode *, struct dentry *,
 				struct file *, unsigned open_flag,
 				umode_t create_mode);
@@ -117,6 +118,7 @@ getattr:	no
 listxattr:	no
 fiemap:		no
 update_time:	no
+sync_lazytime:	no
 atomic_open:	shared (exclusive if O_CREAT is set in open flags)
 tmpfile:	no
 fileattr_get:	no or exclusive
diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index 4f13b01e42eb..ff59760daae2 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -486,6 +486,7 @@ As of kernel 2.6.22, the following members are defined:
 		int (*getattr) (struct mnt_idmap *, const struct path *, struct kstat *, u32, unsigned int);
 		ssize_t (*listxattr) (struct dentry *, char *, size_t);
 		void (*update_time)(struct inode *, struct timespec *, int);
+		void (*sync_lazytime)(struct inode *inode);
 		int (*atomic_open)(struct inode *, struct dentry *, struct file *,
 				   unsigned open_flag, umode_t create_mode);
 		int (*tmpfile) (struct mnt_idmap *, struct inode *, struct file *, umode_t);
@@ -642,6 +643,11 @@ otherwise noted.
 	an inode.  If this is not defined the VFS will update the inode
 	itself and call mark_inode_dirty_sync.
 
+``sync_lazytime``:
+	called by the writeback code to update the lazy time stamps to
+	regular time stamp updates that get syncing into the on-disk
+	inode.
+
 ``atomic_open``
 	called on the last component of an open.  Using this optional
 	method the filesystem can look up, possibly create and open the
diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 50e58cf399b8..1d614d53cce2 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1699,7 +1699,10 @@ bool sync_lazytime(struct inode *inode)
 		return false;
 
 	trace_writeback_lazytime(inode);
-	mark_inode_dirty_sync(inode);
+	if (inode->i_op->sync_lazytime)
+		inode->i_op->sync_lazytime(inode);
+	else
+		mark_inode_dirty_sync(inode);
 	return true;
 }
 
@@ -2547,16 +2550,19 @@ void __mark_inode_dirty(struct inode *inode, int flags)
 	trace_writeback_mark_inode_dirty(inode, flags);
 
 	if (flags & I_DIRTY_INODE) {
+		bool was_dirty_time = inode->i_state & I_DIRTY_TIME;
+
 		/*
 		 * Inode timestamp update will piggback on this dirtying.
 		 * We tell ->dirty_inode callback that timestamps need to
 		 * be updated by setting I_DIRTY_TIME in flags.
 		 */
-		if (inode->i_state & I_DIRTY_TIME) {
+		if (was_dirty_time) {
 			spin_lock(&inode->i_lock);
 			if (inode->i_state & I_DIRTY_TIME) {
 				inode->i_state &= ~I_DIRTY_TIME;
 				flags |= I_DIRTY_TIME;
+				was_dirty_time = true;
 			}
 			spin_unlock(&inode->i_lock);
 		}
@@ -2569,9 +2575,12 @@ void __mark_inode_dirty(struct inode *inode, int flags)
 		 * for just I_DIRTY_PAGES or I_DIRTY_TIME.
 		 */
 		trace_writeback_dirty_inode_start(inode, flags);
-		if (sb->s_op->dirty_inode)
+		if (sb->s_op->dirty_inode) {
 			sb->s_op->dirty_inode(inode,
 				flags & (I_DIRTY_INODE | I_DIRTY_TIME));
+		} else if (was_dirty_time && inode->i_op->sync_lazytime) {
+			inode->i_op->sync_lazytime(inode);
+		}
 		trace_writeback_dirty_inode(inode, flags);
 
 		/* I_DIRTY_INODE supersedes I_DIRTY_TIME. */
diff --git a/include/linux/fs.h b/include/linux/fs.h
index a6a38e30c998..eddb2bab0edd 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2363,6 +2363,7 @@ struct inode_operations {
 	int (*fiemap)(struct inode *, struct fiemap_extent_info *, u64 start,
 		      u64 len);
 	int (*update_time)(struct inode *, int);
+	void (*sync_lazytime)(struct inode *inode);
 	int (*atomic_open)(struct inode *, struct dentry *,
 			   struct file *, unsigned open_flag,
 			   umode_t create_mode);
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
