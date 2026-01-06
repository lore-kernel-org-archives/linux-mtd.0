Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EACC47BC4
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jan 2026 07:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASU/UvXK+LCxJwWhNUq+moTwtiVpEZJVK5bsxsUvM9Q=; b=s7Gdz/e5hpMGwX
	CPo7J4LAYY7oYlSNvEqYFXxbx4mfY8jEQFaK5Csgd1nj3Z6pqrmhdBWbvm6WiyEPom3ZG4vi3lLDx
	ukllf4KcLn2J93M9ETuIoWJC8XZ9x0POQv0dxYVGQiMW7HdfPhFHtd88FzgPa2StqpJIsnhfRMP+t
	eO9jztrCT5wajpz899Qd6/zT5pkTz9cbA8PQ9kNNVdAT67LzNDXZ0k6r9MYENetOHaZQWhM1rTf6U
	hDGVyjh7WPYO/+K+r6U0k9mpC+RWzKxCLNKv0WubNxZMYYEWvs8ghavuaXEgvxTikmiYx01OOvZaX
	pMQfdq9lw5dK9UCfVwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1qS-0000000CYvg-2JpA;
	Tue, 06 Jan 2026 07:51:12 +0000
Received: from [2001:4bb8:2af:87cb:5562:685f:c094:6513] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1qP-0000000CYq7-42ue;
	Tue, 06 Jan 2026 07:51:10 +0000
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
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	gfs2@lists.linux.dev,
	io-uring@vger.kernel.org,
	devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: [PATCH 06/11] fs: factor out a sync_lazytime helper
Date: Tue,  6 Jan 2026 08:50:00 +0100
Message-ID: <20260106075008.1610195-7-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106075008.1610195-1-hch@lst.de>
References: <20260106075008.1610195-1-hch@lst.de>
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

Centralize how we synchronize a lazytime update into the actual on-disk
timestamp into a single helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fs-writeback.c                | 22 +++++++++++++++-------
 fs/inode.c                       |  5 +----
 fs/internal.h                    |  3 ++-
 fs/sync.c                        |  4 ++--
 include/trace/events/writeback.h |  6 ------
 5 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 6800886c4d10..3d68b757136c 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1711,6 +1711,16 @@ static void requeue_inode(struct inode *inode, struct bdi_writeback *wb,
 	}
 }
 
+bool sync_lazytime(struct inode *inode)
+{
+	if (!(inode_state_read_once(inode) & I_DIRTY_TIME))
+		return false;
+
+	trace_writeback_lazytime(inode);
+	mark_inode_dirty_sync(inode);
+	return true;
+}
+
 /*
  * Write out an inode and its dirty pages (or some of its dirty pages, depending
  * on @wbc->nr_to_write), and clear the relevant dirty flags from i_state.
@@ -1750,17 +1760,15 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
 	}
 
 	/*
-	 * If the inode has dirty timestamps and we need to write them, call
-	 * mark_inode_dirty_sync() to notify the filesystem about it and to
-	 * change I_DIRTY_TIME into I_DIRTY_SYNC.
+	 * For data integrity writeback, or when the dirty interval expired,
+	 * ask the file system to propagata lazy timestamp updates into real
+	 * dirty state.
 	 */
 	if ((inode_state_read_once(inode) & I_DIRTY_TIME) &&
 	    (wbc->sync_mode == WB_SYNC_ALL ||
 	     time_after(jiffies, inode->dirtied_time_when +
-			dirtytime_expire_interval * HZ))) {
-		trace_writeback_lazytime(inode);
-		mark_inode_dirty_sync(inode);
-	}
+			dirtytime_expire_interval * HZ)))
+		sync_lazytime(inode);
 
 	/*
 	 * Get and clear the dirty flags from i_state.  This needs to be done
diff --git a/fs/inode.c b/fs/inode.c
index 7d8709b0158c..c08682524a8d 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1979,11 +1979,8 @@ void iput(struct inode *inode)
 	if (atomic_add_unless(&inode->i_count, -1, 1))
 		return;
 
-	if ((inode_state_read_once(inode) & I_DIRTY_TIME) && inode->i_nlink) {
-		trace_writeback_lazytime_iput(inode);
-		mark_inode_dirty_sync(inode);
+	if (inode->i_nlink && sync_lazytime(inode))
 		goto retry;
-	}
 
 	spin_lock(&inode->i_lock);
 	if (unlikely((inode_state_read(inode) & I_DIRTY_TIME) && inode->i_nlink)) {
diff --git a/fs/internal.h b/fs/internal.h
index ab638d41ab81..18a062c1b5b0 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -214,7 +214,8 @@ bool in_group_or_capable(struct mnt_idmap *idmap,
 /*
  * fs-writeback.c
  */
-extern long get_nr_dirty_inodes(void);
+long get_nr_dirty_inodes(void);
+bool sync_lazytime(struct inode *inode);
 
 /*
  * dcache.c
diff --git a/fs/sync.c b/fs/sync.c
index 431fc5f5be06..4283af7119d1 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -183,8 +183,8 @@ int vfs_fsync_range(struct file *file, loff_t start, loff_t end, int datasync)
 
 	if (!file->f_op->fsync)
 		return -EINVAL;
-	if (!datasync && (inode_state_read_once(inode) & I_DIRTY_TIME))
-		mark_inode_dirty_sync(inode);
+	if (!datasync)
+		sync_lazytime(inode);
 	return file->f_op->fsync(file, start, end, datasync);
 }
 EXPORT_SYMBOL(vfs_fsync_range);
diff --git a/include/trace/events/writeback.h b/include/trace/events/writeback.h
index 311a341e6fe4..7162d03e69a5 100644
--- a/include/trace/events/writeback.h
+++ b/include/trace/events/writeback.h
@@ -856,12 +856,6 @@ DEFINE_EVENT(writeback_inode_template, writeback_lazytime,
 	TP_ARGS(inode)
 );
 
-DEFINE_EVENT(writeback_inode_template, writeback_lazytime_iput,
-	TP_PROTO(struct inode *inode),
-
-	TP_ARGS(inode)
-);
-
 DEFINE_EVENT(writeback_inode_template, writeback_dirty_inode_enqueue,
 
 	TP_PROTO(struct inode *inode),
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
