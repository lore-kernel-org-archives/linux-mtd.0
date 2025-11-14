Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625D0CDE011
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 06:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=edocHd+9pgUrT+1A9QiNZgpIf2BnSFbIaAWSHT/4B0Q=; b=m9vt1Ii+C1V2tK
	ndwc9uSs7hBFSJe3Khe9JarkYffzLAI8brGfAL5FhFgrFwh3kk8AIvG6eWhABx451XJY3fxANAQnk
	B4qLILXvqDsCfOIukLp5KwwerHV0DkP3yysJnoEuv6cvlI2Pmi0QlcyCfwCYH7HETjentXN/k3fNg
	00Q5p5cS85ihOrLS5yXKseIka2sJyg4h+hTsjUamxBAE895BTqeE5Cw6FeWGNMoI58m6AhS6hj9hK
	rT/cgQQ2EdBRZqljN9yiC89UezOOgMx+ps3Paske3mY04fP1kb6lo7tRgaJ2MwxSRh7GacPhCUfQm
	7ECa6K1cljd6FpCOklXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnGo-0000000BeR2-2LGd;
	Fri, 14 Nov 2025 06:26:54 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnGn-0000000BeQ9-1uwk;
	Fri, 14 Nov 2025 06:26:53 +0000
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
Subject: [PATCH 01/14] fs: refactor file timestamp update logic
Date: Fri, 14 Nov 2025 07:26:04 +0100
Message-ID: <20251114062642.1524837-2-hch@lst.de>
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

Currently the two high-level APIs use two helper functions to implement
almost all of the logic.  Refactor the two helpers and the common logic
into a new file_update_time_flags routine that gets the iocb flags or
0 in case of file_update_time passed so that the entire logic is
contained in a single function and can be easily understood and modified.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/inode.c | 54 +++++++++++++++++-------------------------------------
 1 file changed, 17 insertions(+), 37 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index ec9339024ac3..4884ffa931e7 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2310,10 +2310,12 @@ struct timespec64 current_time(struct inode *inode)
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
@@ -2323,29 +2325,23 @@ static int inode_needs_update_time(struct inode *inode)
 
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
 
@@ -2365,14 +2361,7 @@ static int __file_update_time(struct file *file, int sync_mode)
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
 
@@ -2394,7 +2383,6 @@ EXPORT_SYMBOL(file_update_time);
 static int file_modified_flags(struct file *file, int flags)
 {
 	int ret;
-	struct inode *inode = file_inode(file);
 
 	/*
 	 * Clear the security bits if the process is not being run by root.
@@ -2403,17 +2391,9 @@ static int file_modified_flags(struct file *file, int flags)
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
