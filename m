Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C65CF64BB
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 06:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNES+BUml1y6S+vM9tf6ze/85i54aetlOIqodN4ocYg=; b=FvkB/eLwov5Yu9
	M+lWZv7dRvjaAXC/gQbGZdxcH6GrnZFH1MSHpTWFcpKrQMUjbZJwDhV5PZ9QwopqQZEUCSueDdKYv
	m5zG+V8a0QWJIxGkGBveaExO4xkRO5owwlrmtDINoBYgp/2D9DwU/C0/TLDVal9WySsZkqijIsYH8
	7vQd0i6e23Id2IbbPGBAV57uHb4EsK9bczBX+pdqkxLegPDmOkSgz481Kdy+JCs407DrXKbBRQ93b
	QYg02Ym86Y4T0acjezFSX13mg2tTS0TCiTlM2E/r/2A8ALn9AWUZDQnqgeU/Az1azAb/KCzDhlslA
	yv7D44lFMolCrjz8Qwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyUV-00000006EwU-0Jzy;
	Thu, 20 Nov 2025 06:50:03 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyUT-00000006ErS-31y9;
	Thu, 20 Nov 2025 06:50:02 +0000
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
Subject: [PATCH 07/16] fs: remove inode_update_time
Date: Thu, 20 Nov 2025 07:47:28 +0100
Message-ID: <20251120064859.2911749-8-hch@lst.de>
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

The only external user is gone now, open code it in the two VFS
callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 fs/inode.c         | 23 ++++++++---------------
 include/linux/fs.h |  1 -
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 2c55ec49b023..6e7e42915376 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2119,19 +2119,6 @@ int generic_update_time(struct inode *inode, int flags)
 }
 EXPORT_SYMBOL(generic_update_time);
 
-/*
- * This does the actual work of updating an inodes time or version.  Must have
- * had called mnt_want_write() before calling this.
- */
-int inode_update_time(struct inode *inode, int flags)
-{
-	if (inode->i_op->update_time)
-		return inode->i_op->update_time(inode, flags);
-	generic_update_time(inode, flags);
-	return 0;
-}
-EXPORT_SYMBOL(inode_update_time);
-
 /**
  *	atime_needs_update	-	update the access time
  *	@path: the &struct path to update
@@ -2199,7 +2186,10 @@ void touch_atime(const struct path *path)
 	 * We may also fail on filesystems that have the ability to make parts
 	 * of the fs read only, e.g. subvolumes in Btrfs.
 	 */
-	inode_update_time(inode, S_ATIME);
+	if (inode->i_op->update_time)
+		inode->i_op->update_time(inode, S_ATIME);
+	else
+		generic_update_time(inode, S_ATIME);
 	mnt_put_write_access(mnt);
 skip_update:
 	sb_end_write(inode->i_sb);
@@ -2354,7 +2344,10 @@ static int file_update_time_flags(struct file *file, unsigned int flags)
 
 	if (mnt_get_write_access_file(file))
 		return 0;
-	ret = inode_update_time(inode, sync_mode);
+	if (inode->i_op->update_time)
+		ret = inode->i_op->update_time(inode, sync_mode);
+	else
+		ret = generic_update_time(inode, sync_mode);
 	mnt_put_write_access_file(file);
 	return ret;
 }
diff --git a/include/linux/fs.h b/include/linux/fs.h
index dd3b57cfadee..b54d300285b0 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2665,7 +2665,6 @@ enum file_time_flags {
 
 extern bool atime_needs_update(const struct path *, struct inode *);
 extern void touch_atime(const struct path *);
-int inode_update_time(struct inode *inode, int flags);
 
 static inline void file_accessed(struct file *file)
 {
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
