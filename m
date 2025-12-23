Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5532DE6B26A
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 00:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s15OXQ5pFp548VX2DyqGVNYHp73P8oY6++/mx+3AIxo=; b=GYlRViFVquM0MQ
	XUMDzlpXkSWvkpFzCYv5o/oeXFux8fdMKjH0fsxh6h8dw/nAJM20ulv9hU3U2d3sRkP35fb2zILV2
	zAbFR9436AVAS0YXk6G6+P5vCcOBIAiaRp5Mh7iYwN8NCwV6lfp6szE+mxOOeZA8sONeWGF58fP81
	DwU0/7bk2QJB28gVWKFtW0MjX0phayy+KJL1ZZK4oUjAYNqxTDOpmZvM/DxvGjRPt6khi1J/RqaJN
	X6XcnbfaULD+NEJWd/2SwJ2gY5CMXy2mq4To1XgkF6TmXnFgvlDAkF1lV77ZKYLPMxIRzTH/tHxEZ
	avK3tI5mqnq2IpvTw1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXqQU-0000000EJDI-3mxt;
	Tue, 23 Dec 2025 00:38:58 +0000
Received: from s58.ghokkaidofl2.vectant.ne.jp ([202.215.7.58] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXqQT-0000000EJ8w-1zYu;
	Tue, 23 Dec 2025 00:38:57 +0000
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
Subject: [PATCH 10/11] xfs: implement ->sync_lazytime
Date: Tue, 23 Dec 2025 09:37:53 +0900
Message-ID: <20251223003756.409543-11-hch@lst.de>
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

Switch to the new explicit lazytime syncing method instead of trying
to second guess what could be a lazytime update in ->dirty_inode.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 fs/xfs/xfs_iops.c  | 20 ++++++++++++++++++++
 fs/xfs/xfs_super.c | 29 -----------------------------
 2 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 626a541b247b..e12c6e6d313e 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1227,6 +1227,22 @@ xfs_vn_update_time(
 	return xfs_trans_commit(tp);
 }
 
+static void
+xfs_vn_sync_lazytime(
+	struct inode		*inode)
+{
+	struct xfs_inode	*ip = XFS_I(inode);
+	struct xfs_mount	*mp = ip->i_mount;
+	struct xfs_trans	*tp;
+
+	if (xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp))
+		return;
+	xfs_ilock(ip, XFS_ILOCK_EXCL);
+	xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
+	xfs_trans_log_inode(tp, ip, XFS_ILOG_TIMESTAMP);
+	xfs_trans_commit(tp);
+}
+
 STATIC int
 xfs_vn_fiemap(
 	struct inode		*inode,
@@ -1270,6 +1286,7 @@ static const struct inode_operations xfs_inode_operations = {
 	.listxattr		= xfs_vn_listxattr,
 	.fiemap			= xfs_vn_fiemap,
 	.update_time		= xfs_vn_update_time,
+	.sync_lazytime		= xfs_vn_sync_lazytime,
 	.fileattr_get		= xfs_fileattr_get,
 	.fileattr_set		= xfs_fileattr_set,
 };
@@ -1296,6 +1313,7 @@ static const struct inode_operations xfs_dir_inode_operations = {
 	.setattr		= xfs_vn_setattr,
 	.listxattr		= xfs_vn_listxattr,
 	.update_time		= xfs_vn_update_time,
+	.sync_lazytime		= xfs_vn_sync_lazytime,
 	.tmpfile		= xfs_vn_tmpfile,
 	.fileattr_get		= xfs_fileattr_get,
 	.fileattr_set		= xfs_fileattr_set,
@@ -1323,6 +1341,7 @@ static const struct inode_operations xfs_dir_ci_inode_operations = {
 	.setattr		= xfs_vn_setattr,
 	.listxattr		= xfs_vn_listxattr,
 	.update_time		= xfs_vn_update_time,
+	.sync_lazytime		= xfs_vn_sync_lazytime,
 	.tmpfile		= xfs_vn_tmpfile,
 	.fileattr_get		= xfs_fileattr_get,
 	.fileattr_set		= xfs_fileattr_set,
@@ -1334,6 +1353,7 @@ static const struct inode_operations xfs_symlink_inode_operations = {
 	.setattr		= xfs_vn_setattr,
 	.listxattr		= xfs_vn_listxattr,
 	.update_time		= xfs_vn_update_time,
+	.sync_lazytime		= xfs_vn_sync_lazytime,
 	.fileattr_get		= xfs_fileattr_get,
 	.fileattr_set		= xfs_fileattr_set,
 };
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index bc71aa9dcee8..094f257eff15 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -712,34 +712,6 @@ xfs_fs_destroy_inode(
 	xfs_inode_mark_reclaimable(ip);
 }
 
-static void
-xfs_fs_dirty_inode(
-	struct inode			*inode,
-	int				flags)
-{
-	struct xfs_inode		*ip = XFS_I(inode);
-	struct xfs_mount		*mp = ip->i_mount;
-	struct xfs_trans		*tp;
-
-	if (!(inode->i_sb->s_flags & SB_LAZYTIME))
-		return;
-
-	/*
-	 * Only do the timestamp update if the inode is dirty (I_DIRTY_SYNC)
-	 * and has dirty timestamp (I_DIRTY_TIME). I_DIRTY_TIME can be passed
-	 * in flags possibly together with I_DIRTY_SYNC.
-	 */
-	if ((flags & ~I_DIRTY_TIME) != I_DIRTY_SYNC || !(flags & I_DIRTY_TIME))
-		return;
-
-	if (xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp))
-		return;
-	xfs_ilock(ip, XFS_ILOCK_EXCL);
-	xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
-	xfs_trans_log_inode(tp, ip, XFS_ILOG_TIMESTAMP);
-	xfs_trans_commit(tp);
-}
-
 /*
  * Slab object creation initialisation for the XFS inode.
  * This covers only the idempotent fields in the XFS inode;
@@ -1304,7 +1276,6 @@ xfs_fs_show_stats(
 static const struct super_operations xfs_super_operations = {
 	.alloc_inode		= xfs_fs_alloc_inode,
 	.destroy_inode		= xfs_fs_destroy_inode,
-	.dirty_inode		= xfs_fs_dirty_inode,
 	.drop_inode		= xfs_fs_drop_inode,
 	.evict_inode		= xfs_fs_evict_inode,
 	.put_super		= xfs_fs_put_super,
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
