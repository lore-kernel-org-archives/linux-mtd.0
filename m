Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F61C47BC5
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jan 2026 07:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HsrboklseZnIFJfxKiKyCIfeItK1xqKqqcESr566yj4=; b=AoEXhuXxO/g4Le
	xhkVaaGSnv2okXzj/vGq2VF9Sk7MlxPauZbNb9grvEUEJMm1CYr0bkOz+4TmHpyORsMAZwKNloisg
	l4LqQVRFk0Tb5ElaNvdaZB6wCHYjfRT6aNgtwQrlXkYt2ORc65ePlAHmNcbA/iQRGac/w0Pghd/Nt
	zkK8BYRQSP706uKQN7IeO0+WX3XYCmPiFwAMGD6op58Ts/Gt7VNdnf2MOVcovujhaiqGTTz64BSGr
	Tcuegxzhc1U2CW/BexWjo1DNtU+1BUZIfhJ0tCfarvwD6W2yo/mQsYiwYZLH8vmu7Tvt2Cp+iyYGn
	2L1p01a/aRwSQtHPwFxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1q2-0000000CYfN-2vfs;
	Tue, 06 Jan 2026 07:50:46 +0000
Received: from [2001:4bb8:2af:87cb:5562:685f:c094:6513] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1pv-0000000CYbO-19Xa;
	Tue, 06 Jan 2026 07:50:39 +0000
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
Subject: [PATCH 02/11] fs: allow error returns from generic_update_time
Date: Tue,  6 Jan 2026 08:49:56 +0100
Message-ID: <20260106075008.1610195-3-hch@lst.de>
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

Now that no caller looks at the updated flags, switch generic_update_time
to the same calling convention as the ->update_time method and return 0
or a negative errno.

This prepares for adding non-blocking timestamp updates that could return
-EAGAIN.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 fs/gfs2/inode.c    | 3 +--
 fs/inode.c         | 4 ++--
 fs/ubifs/file.c    | 6 ++----
 fs/xfs/xfs_iops.c  | 6 ++----
 include/linux/fs.h | 2 +-
 5 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 36618e353199..e08eb419347c 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -2257,8 +2257,7 @@ static int gfs2_update_time(struct inode *inode, int flags)
 		if (error)
 			return error;
 	}
-	generic_update_time(inode, flags);
-	return 0;
+	return generic_update_time(inode, flags);
 }
 
 static const struct inode_operations gfs2_file_iops = {
diff --git a/fs/inode.c b/fs/inode.c
index 07effa0cb999..7eb28dd45a5a 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2141,7 +2141,7 @@ EXPORT_SYMBOL(inode_update_timestamps);
  * or S_VERSION need to be updated we attempt to update all three of them. S_ATIME
  * updates can be handled done independently of the rest.
  *
- * Returns a S_* mask indicating which fields were updated.
+ * Returns a negative error value on error, else 0.
  */
 int generic_update_time(struct inode *inode, int flags)
 {
@@ -2153,7 +2153,7 @@ int generic_update_time(struct inode *inode, int flags)
 	if (updated & S_VERSION)
 		dirty_flags |= I_DIRTY_SYNC;
 	__mark_inode_dirty(inode, dirty_flags);
-	return updated;
+	return 0;
 }
 EXPORT_SYMBOL(generic_update_time);
 
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index c3265b8804f5..ec1bb9f43acc 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1379,10 +1379,8 @@ int ubifs_update_time(struct inode *inode, int flags)
 			.dirtied_ino_d = ALIGN(ui->data_len, 8) };
 	int err, release;
 
-	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT)) {
-		generic_update_time(inode, flags);
-		return 0;
-	}
+	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
+		return generic_update_time(inode, flags);
 
 	err = ubifs_budget_space(c, &req);
 	if (err)
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index ad94fbf55014..9dedb54e3cb0 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1197,10 +1197,8 @@ xfs_vn_update_time(
 
 	if (inode->i_sb->s_flags & SB_LAZYTIME) {
 		if (!((flags & S_VERSION) &&
-		      inode_maybe_inc_iversion(inode, false))) {
-			generic_update_time(inode, flags);
-			return 0;
-		}
+		      inode_maybe_inc_iversion(inode, false)))
+			return generic_update_time(inode, flags);
 
 		/* Capture the iversion update that just occurred */
 		log_flags |= XFS_ILOG_CORE;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index ee623c16d835..fccb0a38cb74 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2399,7 +2399,7 @@ extern void ihold(struct inode * inode);
 extern void iput(struct inode *);
 void iput_not_last(struct inode *);
 int inode_update_timestamps(struct inode *inode, int flags);
-int generic_update_time(struct inode *, int);
+int generic_update_time(struct inode *inode, int flags);
 
 /* /sys/fs */
 extern struct kobject *fs_kobj;
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
