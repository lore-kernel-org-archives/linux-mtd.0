Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7786BCF64BB
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 06:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsoeZ4KbR07FKJfDd8C8ItWSv7F69/1/7aOvSzblxDo=; b=nRaql8X1HWFU5h
	Oa8zIRGsoxpi2sDRgidwCo9P8iCCiQqyyqP8fxAvCkLabFbcQqm1JXzcUEicx+xjofuH4Iv9vaFWl
	Uv20N5sebMOdUgpg0i3YtoLyDlCllSbJ2IyFj5A5ftt4ww58vzxTgW4ycwEVrbehWwkg3PsPWuW8X
	tD5Eb/7OuPtsQG8qCdobtly2N6+dypA3+bcafDQEfea3Wd9APYNZeGuqFp7bKkyQW4m9bSmfppTuI
	kSRq6QwPc6+iKwu4j39q4fr6g8i2d8u4ywZkhalWF4tY3buDs2zP40Jv43N9rZ7SkDMFPjXITvY9O
	kaJ5P86vEn7uLkn0F54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyUu-00000006FCS-3tUG;
	Thu, 20 Nov 2025 06:50:28 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyUq-00000006F6J-16rS;
	Thu, 20 Nov 2025 06:50:26 +0000
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
Subject: [PATCH 10/16] fs: factor out a mark_inode_dirty_time helper
Date: Thu, 20 Nov 2025 07:47:31 +0100
Message-ID: <20251120064859.2911749-11-hch@lst.de>
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

Factor out the inode dirtying vs lazytime logic from generic_update_time
into a new helper so that it can be reused in file system methods.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fs-writeback.c  | 16 ++++++++++++++++
 fs/inode.c         | 14 +++-----------
 include/linux/fs.h |  3 ++-
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 2b35e80037fe..a115e26e0139 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2671,6 +2671,22 @@ void __mark_inode_dirty(struct inode *inode, int flags)
 }
 EXPORT_SYMBOL(__mark_inode_dirty);
 
+void mark_inode_dirty_time(struct inode *inode, unsigned int flags)
+{
+	if (inode->i_sb->s_flags & SB_LAZYTIME) {
+		int dirty_flags = 0;
+
+		if (flags & (S_ATIME | S_MTIME | S_CTIME))
+			dirty_flags = I_DIRTY_TIME;
+		if (flags & S_VERSION)
+			dirty_flags |= I_DIRTY_SYNC;
+		__mark_inode_dirty(inode, dirty_flags);
+	} else {
+		mark_inode_dirty_sync(inode);
+	}
+}
+EXPORT_SYMBOL_GPL(mark_inode_dirty_time);
+
 /*
  * The @s_sync_lock is used to serialise concurrent sync operations
  * to avoid lock contention problems with concurrent wait_sb_inodes() calls.
diff --git a/fs/inode.c b/fs/inode.c
index cda78f76e1dd..edbc24a489ca 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2107,17 +2107,9 @@ EXPORT_SYMBOL(inode_update_timestamps);
  */
 int generic_update_time(struct inode *inode, int flags)
 {
-	int updated = inode_update_timestamps(inode, flags);
-	int dirty_flags = 0;
-
-	if (!updated)
-		return 0;
-
-	if (updated & (S_ATIME|S_MTIME|S_CTIME))
-		dirty_flags = inode->i_sb->s_flags & SB_LAZYTIME ? I_DIRTY_TIME : I_DIRTY_SYNC;
-	if (updated & S_VERSION)
-		dirty_flags |= I_DIRTY_SYNC;
-	__mark_inode_dirty(inode, dirty_flags);
+	flags = inode_update_timestamps(inode, flags);
+	if (flags)
+		mark_inode_dirty_time(inode, flags);
 	return 0;
 }
 EXPORT_SYMBOL(generic_update_time);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 4759aa61cb14..b4d82e5c6c32 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2608,7 +2608,8 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
 	};
 }
 
-extern void __mark_inode_dirty(struct inode *, int);
+void mark_inode_dirty_time(struct inode *inode, unsigned int flags);
+void __mark_inode_dirty(struct inode *inode, int flags);
 static inline void mark_inode_dirty(struct inode *inode)
 {
 	__mark_inode_dirty(inode, I_DIRTY);
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
