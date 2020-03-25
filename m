Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC53AC43331
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 12:29:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DBBC20714
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 12:29:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fKGBw9GA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DBBC20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDKqhY8hvPACk4E6qWSNLi+bzYMC7t3k+Ee2biXfa3w=; b=fKGBw9GA+E4V27
	ij4DLl7IzkSt7gKeYg0tKktZKBg8Qz7/djJJgW1pbWh4CCqpd2xGPt8T6FeMvUpaROZvQGPnxn58I
	LeBF3ATfEyAFRLoVd6Z0T7RHD/y/whTmOInbzlDO8Wflnw6/azvWv9sDd38a+yOPjMzed53kXktHr
	gFmU8CLYaE6BEFVDGZmxA4FMcOVlUe2KjOGWYlGZ7sXqeBxFW5g3w7N5gGyUcNXOr2wJD6hPJTaTZ
	E2pe/oBrVFNnTF2DTi8kx4fMiK9YxMEIvvGh3DN0ZFa3jcG6oHHYPl1+wodR7dW/XLG5qfmPvHNzd
	VHxrofWCuuZcdXKpfQbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH59V-0003nr-8z; Wed, 25 Mar 2020 12:28:57 +0000
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH596-0003HP-Gi; Wed, 25 Mar 2020 12:28:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Theodore Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Richard Weinberger <richard@nod.at>, linux-xfs@vger.kernel.org
Subject: [PATCH 2/4] fs: avoid double-writing the inode on a lazytime
 expiration
Date: Wed, 25 Mar 2020 13:28:23 +0100
Message-Id: <20200325122825.1086872-3-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200325122825.1086872-1-hch@lst.de>
References: <20200325122825.1086872-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In the case that an inode has dirty timestamp for longer than the
lazytime expiration timeout (or if all such inodes are being flushed
out due to a sync or syncfs system call), we need to inform the file
system that the inode is dirty so that the inode's timestamps can be
copied out to the on-disk data structures.  That's because if the file
system supports lazytime, it will have ignored the dirty_inode(inode,
I_DIRTY_TIME) notification when the timestamp was modified in memory.q
Previously, this was accomplished by calling mark_inode_dirty_sync(),
but that has the unfortunate side effect of also putting the inode the
writeback list, and that's not necessary in this case, since we will
immediately call write_inode() afterwards.  Replace the call to
mark_inode_dirty_sync() with a new lazytime_expired method to clearly
separate out this case.

Eric Biggers noticed that this was causing problems for fscrypt after
the key was removed[1].

Based on a patch from Theodore Ts'o.

[1] https://lore.kernel.org/r/20200306004555.GB225345@gmail.com

Fixes: 0ae45f63d4ef ("vfs: add support for a lazytime mount option")
Reported-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/super.c    |  6 ++++++
 fs/f2fs/super.c    |  6 ++++++
 fs/fs-writeback.c  |  3 ++-
 fs/inode.c         |  3 ++-
 fs/xfs/xfs_super.c | 12 +++---------
 include/linux/fs.h |  1 +
 6 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 0c7c4adb664e..ebbf6370ccd6 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1448,6 +1448,11 @@ static struct dquot **ext4_get_dquots(struct inode *inode)
 	return EXT4_I(inode)->i_dquot;
 }
 
+static void ext4_lazytime_expired(struct inode *inode)
+{
+	return ext4_dirty_inode(inode, I_DIRTY_SYNC);
+}
+
 static const struct dquot_operations ext4_quota_operations = {
 	.get_reserved_space	= ext4_get_reserved_space,
 	.write_dquot		= ext4_write_dquot,
@@ -1480,6 +1485,7 @@ static const struct super_operations ext4_sops = {
 	.destroy_inode	= ext4_destroy_inode,
 	.write_inode	= ext4_write_inode,
 	.dirty_inode	= ext4_dirty_inode,
+	.lazytime_expired = ext4_lazytime_expired,
 	.drop_inode	= ext4_drop_inode,
 	.evict_inode	= ext4_evict_inode,
 	.put_super	= ext4_put_super,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 65a7a432dfee..529334573944 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1100,6 +1100,11 @@ static void f2fs_dirty_inode(struct inode *inode, int flags)
 	f2fs_inode_dirtied(inode, false);
 }
 
+static void f2fs_lazytime_expired(struct inode *inode)
+{
+	return f2fs_dirty_inode(inode, I_DIRTY_SYNC);
+}
+
 static void f2fs_free_inode(struct inode *inode)
 {
 	fscrypt_free_inode(inode);
@@ -2355,6 +2360,7 @@ static const struct super_operations f2fs_sops = {
 	.drop_inode	= f2fs_drop_inode,
 	.write_inode	= f2fs_write_inode,
 	.dirty_inode	= f2fs_dirty_inode,
+	.lazytime_expired = f2fs_lazytime_expired,
 	.show_options	= f2fs_show_options,
 #ifdef CONFIG_QUOTA
 	.quota_read	= f2fs_quota_read,
diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 76ac9c7d32ec..dc2d65c765ae 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1505,7 +1505,8 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
 	spin_unlock(&inode->i_lock);
 
 	if (dirty & I_DIRTY_TIME)
-		mark_inode_dirty_sync(inode);
+		inode->i_sb->s_op->lazytime_expired(inode);
+
 	/* Don't write the inode if only I_DIRTY_PAGES was set */
 	if (dirty & ~I_DIRTY_PAGES) {
 		int err = write_inode(inode, wbc);
diff --git a/fs/inode.c b/fs/inode.c
index 93d9252a00ab..96cf26ed4c7b 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1674,7 +1674,8 @@ int generic_update_time(struct inode *inode, struct timespec64 *time, int flags)
 	if (flags & S_MTIME)
 		inode->i_mtime = *time;
 	if ((flags & (S_ATIME | S_CTIME | S_MTIME)) &&
-	    !(inode->i_sb->s_flags & SB_LAZYTIME))
+	    (!inode->i_sb->s_op->lazytime_expired ||
+	     !(inode->i_sb->s_flags & SB_LAZYTIME)))
 		dirty = true;
 
 	if (dirty)
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 2094386af8ac..e5aafd40dd0f 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -612,19 +612,13 @@ xfs_fs_destroy_inode(
 }
 
 static void
-xfs_fs_dirty_inode(
-	struct inode			*inode,
-	int				flag)
+xfs_fs_lazytime_expired(
+	struct inode			*inode)
 {
 	struct xfs_inode		*ip = XFS_I(inode);
 	struct xfs_mount		*mp = ip->i_mount;
 	struct xfs_trans		*tp;
 
-	if (!(inode->i_sb->s_flags & SB_LAZYTIME))
-		return;
-	if (flag != I_DIRTY_SYNC || !(inode->i_state & I_DIRTY_TIME))
-		return;
-
 	if (xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp))
 		return;
 	xfs_ilock(ip, XFS_ILOCK_EXCL);
@@ -1053,7 +1047,7 @@ xfs_fs_free_cached_objects(
 static const struct super_operations xfs_super_operations = {
 	.alloc_inode		= xfs_fs_alloc_inode,
 	.destroy_inode		= xfs_fs_destroy_inode,
-	.dirty_inode		= xfs_fs_dirty_inode,
+	.lazytime_expired	= xfs_fs_lazytime_expired,
 	.drop_inode		= xfs_fs_drop_inode,
 	.put_super		= xfs_fs_put_super,
 	.sync_fs		= xfs_fs_sync_fs,
diff --git a/include/linux/fs.h b/include/linux/fs.h
index abedbffe2c9e..07c213cdecf3 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1948,6 +1948,7 @@ struct super_operations {
 	int (*write_inode) (struct inode *, struct writeback_control *wbc);
 	int (*drop_inode) (struct inode *);
 	void (*evict_inode) (struct inode *);
+	void (*lazytime_expired)(struct inode *inode);
 	void (*put_super) (struct super_block *);
 	int (*sync_fs)(struct super_block *sb, int wait);
 	int (*freeze_super) (struct super_block *);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
