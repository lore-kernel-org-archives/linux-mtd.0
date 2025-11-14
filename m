Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B63ACDE00F
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 06:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQIpPgG4OYIWUnTovMQxwcu9bS48U2PS70Vf05+XkVM=; b=WAe7uabmI6l+Q1
	I0iBV7wuocAmwbfu0Q3o8TSUFslnYeNYB4Txe+e3snUiPTiW2IOk1aCKjGsi2vPE8BJ5ttQxNOXlZ
	r50+0Hf6XsQdqqvCTD/OOC0swz49KuBI8clIedPAMFELjF0cVNlOGiLvK+kJsJ3+T7RFPkTb8hqjE
	IoCbi6WeG/JkVVUvRuxdmC3vqqqJM+DhcG0nmT9gIEpxjjB+mP0wHJGr/x+fNS1SZJwpDi3eEE9St
	7PewwMQyREBVElEELVWzZ+ul/kmzKlhQodY3Oy6ObURd0+pf7iimMDq8qCrLjsjdXMS/tHsS5cSoB
	PM3WOx1/+6DZSF+ceIDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnI9-0000000BfA3-1UOi;
	Fri, 14 Nov 2025 06:28:17 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnI8-0000000Bf6h-0FyH;
	Fri, 14 Nov 2025 06:28:16 +0000
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
	gfs2@lists.linux.dev,
	io-uring@vger.kernel.org,
	devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: [PATCH 12/14] fs: add support for non-blocking timestamp updates
Date: Fri, 14 Nov 2025 07:26:15 +0100
Message-ID: <20251114062642.1524837-13-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251114062642.1524837-1-hch@lst.de>
References: <20251114062642.1524837-1-hch@lst.de>
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
---
 fs/btrfs/inode.c     |  3 +++
 fs/fat/misc.c        |  3 +++
 fs/gfs2/inode.c      |  3 +++
 fs/inode.c           |  5 ++++-
 fs/orangefs/inode.c  |  3 +++
 fs/overlayfs/inode.c |  3 +++
 fs/ubifs/file.c      |  3 +++
 fs/xfs/xfs_iops.c    |  3 +++
 include/linux/fs.h   | 10 ++++++----
 9 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 6282911e536f..dea798d325d1 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -6302,6 +6302,9 @@ static int btrfs_update_time(struct inode *inode, int flags)
 	if (btrfs_root_readonly(root))
 		return -EROFS;
 
+	if (flags & S_NOWAIT)
+		return -EAGAIN;
+
 	dirty = inode_update_timestamps(inode, flags);
 	return dirty ? btrfs_dirty_inode(BTRFS_I(inode)) : 0;
 }
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
index 601c14a3ac77..0184cb64fe9f 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -2234,6 +2234,9 @@ static int gfs2_update_time(struct inode *inode, int flags)
 	struct gfs2_holder *gh;
 	int error;
 
+	if (flags & S_NOWAIT)
+		return -EAGAIN;
+
 	gh = gfs2_glock_is_locked_by_me(gl);
 	if (gh && gl->gl_state != LM_ST_EXCLUSIVE) {
 		gfs2_glock_dq(gh);
diff --git a/fs/inode.c b/fs/inode.c
index 34d572c99313..dc6bb6236361 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2092,6 +2092,9 @@ EXPORT_SYMBOL(inode_update_timestamps);
  */
 int generic_update_time(struct inode *inode, int flags)
 {
+	if (flags & S_NOWAIT)
+		return -EAGAIN;
+
 	flags = inode_update_timestamps(inode, flags);
 	if (flags)
 		mark_inode_dirty_time(inode, flags);
@@ -2320,7 +2323,7 @@ static int file_update_time_flags(struct file *file, unsigned int flags)
 		return 0;
 
 	if (flags & IOCB_NOWAIT)
-		return -EAGAIN;
+		sync_mode |= S_NOWAIT;
 
 	if (mnt_get_write_access_file(file))
 		return 0;
diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 55f6c8026812..9abd4153c85d 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -879,6 +879,9 @@ int orangefs_update_time(struct inode *inode, int flags)
 	gossip_debug(GOSSIP_INODE_DEBUG, "orangefs_update_time: %pU\n",
 	    get_khandle_from_ino(inode));
 
+	if (flags & S_NOWAIT)
+		return -EAGAIN;
+
 	flags = inode_update_timestamps(inode, flags);
 
 	memset(&iattr, 0, sizeof iattr);
diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
index e11f310ce092..c132d1f5502b 100644
--- a/fs/overlayfs/inode.c
+++ b/fs/overlayfs/inode.c
@@ -576,6 +576,9 @@ int ovl_update_time(struct inode *inode, int flags)
 			.dentry = ovl_upperdentry_dereference(OVL_I(inode)),
 		};
 
+		if (flags & S_NOWAIT)
+			return -EAGAIN;
+
 		if (upperpath.dentry) {
 			touch_atime(&upperpath);
 			inode_set_atime_to_ts(inode,
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 3e119cb93ea9..1caa2a93eaf5 100644
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
index 0ace5f790006..da055dade25f 100644
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
index 61051c86dbd2..36592fac1887 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2659,10 +2659,12 @@ static inline void inode_dec_link_count(struct inode *inode)
 }
 
 enum file_time_flags {
-	S_ATIME = 1,
-	S_MTIME = 2,
-	S_CTIME = 4,
-	S_VERSION = 8,
+	S_ATIME		= 1U << 0,
+	S_MTIME		= 1U << 1,
+	S_CTIME		= 1U << 2,
+	S_VERSION	= 1U << 4,
+
+	S_NOWAIT	= 1U << 15,
 };
 
 extern bool atime_needs_update(const struct path *, struct inode *);
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
