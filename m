Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DE8CF8549
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TKBlYmyIg2OIuPhSJ4FjmrB/RVxBEIhN25qMupYToY=; b=tO7tYeCZYMzHdS
	+JwrepNDOzyCRCdRCtOGWXmsDy/6I+f/4Xey1MjGCrNDZaRl3t5Y72okCURsSUEhvU7y/EXkj4PUU
	QA5C8BYTb2++JuJ9yBd5jfkdL6GLISc8sph8rqCfYQ98naCSW7Fgx9k+Cl2xVmYBoBBo/aLHMGYer
	m4eFY+bLVE0F7PH5TAqgiz+O1+XDo7idangjzUWX7e5I7dkFX96ktU7yLAAZdmYRrpZ1FvyRqxFXE
	hWlYCOqHHEshT1QM35kpt2lzS1+MNW4lEri4tsz7+1eQMcxxb4ns/TRg7MnicpzfZUuJcXFmhtDXl
	Nt+26hV5oHiUG6Vb85rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyTr-00000006EeZ-0t0q;
	Thu, 20 Nov 2025 06:49:23 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyTk-00000006EdI-3znm;
	Thu, 20 Nov 2025 06:49:21 +0000
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
	linux-nfs@vger.kernel.org,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: [PATCH 01/16] fs: refactor file timestamp update logic
Date: Thu, 20 Nov 2025 07:47:22 +0100
Message-ID: <20251120064859.2911749-2-hch@lst.de>
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

Currently the two high-level APIs use two helper functions to implement
almost all of the logic.  Refactor the two helpers and the common logic
into a new file_update_time_flags routine that gets the iocb flags or
0 in case of file_update_time passed so that the entire logic is
contained in a single function and can be easily understood and modified.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 fs/inode.c | 54 +++++++++++++++++-------------------------------------
 1 file changed, 17 insertions(+), 37 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index cff1d3af0d57..540f4a28c202 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2322,10 +2322,12 @@ struct timespec64 current_time(struct inode *inode)
 }
 EXPORT_SYMBOL(current_time);
 
-static int inode_needs_update_time(struct inode *inode)
+static int file_update_time_flags(struct file *file, unsigned int flags)
 {
+	struct inode *inode = file_inode(file);
 	struct timespec64 now, ts;
-	int sync_it = 0;
+	int sync_mode = 0;
+	int ret = 0;
 
 	/* First try to exhaust all avenues to not sync */
 	if (IS_NOCMTIME(inode))
@@ -2335,29 +2337,23 @@ static int inode_needs_update_time(struct inode *inode)
 
 	ts = inode_get_mtime(inode);
 	if (!timespec64_equal(&ts, &now))
-		sync_it |= S_MTIME;
-
+		sync_mode |= S_MTIME;
 	ts = inode_get_ctime(inode);
 	if (!timespec64_equal(&ts, &now))
-		sync_it |= S_CTIME;
-
+		sync_mode |= S_CTIME;
 	if (IS_I_VERSION(inode) && inode_iversion_need_inc(inode))
-		sync_it |= S_VERSION;
+		sync_mode |= S_VERSION;
 
-	return sync_it;
-}
-
-static int __file_update_time(struct file *file, int sync_mode)
-{
-	int ret = 0;
-	struct inode *inode = file_inode(file);
+	if (!sync_mode)
+		return 0;
 
-	/* try to update time settings */
-	if (!mnt_get_write_access_file(file)) {
-		ret = inode_update_time(inode, sync_mode);
-		mnt_put_write_access_file(file);
-	}
+	if (flags & IOCB_NOWAIT)
+		return -EAGAIN;
 
+	if (mnt_get_write_access_file(file))
+		return 0;
+	ret = inode_update_time(inode, sync_mode);
+	mnt_put_write_access_file(file);
 	return ret;
 }
 
@@ -2377,14 +2373,7 @@ static int __file_update_time(struct file *file, int sync_mode)
  */
 int file_update_time(struct file *file)
 {
-	int ret;
-	struct inode *inode = file_inode(file);
-
-	ret = inode_needs_update_time(inode);
-	if (ret <= 0)
-		return ret;
-
-	return __file_update_time(file, ret);
+	return file_update_time_flags(file, 0);
 }
 EXPORT_SYMBOL(file_update_time);
 
@@ -2406,7 +2395,6 @@ EXPORT_SYMBOL(file_update_time);
 static int file_modified_flags(struct file *file, int flags)
 {
 	int ret;
-	struct inode *inode = file_inode(file);
 
 	/*
 	 * Clear the security bits if the process is not being run by root.
@@ -2415,17 +2403,9 @@ static int file_modified_flags(struct file *file, int flags)
 	ret = file_remove_privs_flags(file, flags);
 	if (ret)
 		return ret;
-
 	if (unlikely(file->f_mode & FMODE_NOCMTIME))
 		return 0;
-
-	ret = inode_needs_update_time(inode);
-	if (ret <= 0)
-		return ret;
-	if (flags & IOCB_NOWAIT)
-		return -EAGAIN;
-
-	return __file_update_time(file, ret);
+	return file_update_time_flags(file, flags);
 }
 
 /**
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
