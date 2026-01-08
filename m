Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D68FD0D17F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 14:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iv7OVUkfiNtSZFRMusypqFd9ascpg5nCjRPiR0aG6ic=; b=RSrjikL5LDhREh
	aIN80vlkTxczq6IuZsUY8xtl/q/hNegbxsugwy/B0OspF9NN29dkD7n8RYkoAbaKh4jfTqJ28XlBr
	rg7niGjC0QpcZITnbbtIG8vCzy8D2qEqniHbWCr3Zol4RL4y2T/11WPJee9/GPlrkjedolCypPo8N
	xl8LsZQlgXqur9Ei6rG3kbIZxVbohwKlD/mqDUdwOaTq44eLPnA3rZcWkrNFXfcbPLYZJrEK5EOjs
	5S0OnsZ7XRHp9M1uzOqmD8uye9nvGOkEMetLkqPqIWYmydelo2NJmyjeAhA49Fba+w2yxQ9UW+Gpg
	0AU7rwF4/3q59ALf9+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqs8-0000000HJRb-2dl4;
	Thu, 08 Jan 2026 14:20:20 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqs4-0000000HJKg-2Exj;
	Thu, 08 Jan 2026 14:20:18 +0000
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
	linux-nfs@vger.kernel.org
Subject: [PATCH 03/11] nfs: split nfs_update_timestamps
Date: Thu,  8 Jan 2026 15:19:03 +0100
Message-ID: <20260108141934.2052404-4-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108141934.2052404-1-hch@lst.de>
References: <20260108141934.2052404-1-hch@lst.de>
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

The VFS paths update either the atime or ctime and mtime but never mix
between atime and the others.  Split nfs_update_timestamps to match this
to prepare for cleaning up the VFS interfaces.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfs/inode.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index 84049f3cd340..3be8ba7b98c5 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -669,35 +669,31 @@ static void nfs_set_timestamps_to_ts(struct inode *inode, struct iattr *attr)
 	NFS_I(inode)->cache_validity &= ~cache_flags;
 }
 
-static void nfs_update_timestamps(struct inode *inode, unsigned int ia_valid)
+static void nfs_update_atime(struct inode *inode)
 {
-	enum file_time_flags time_flags = 0;
-	unsigned int cache_flags = 0;
+	inode_update_timestamps(inode, S_ATIME);
+	NFS_I(inode)->cache_validity &= ~NFS_INO_INVALID_ATIME;
+}
 
-	if (ia_valid & ATTR_MTIME) {
-		time_flags |= S_MTIME | S_CTIME;
-		cache_flags |= NFS_INO_INVALID_CTIME | NFS_INO_INVALID_MTIME;
-	}
-	if (ia_valid & ATTR_ATIME) {
-		time_flags |= S_ATIME;
-		cache_flags |= NFS_INO_INVALID_ATIME;
-	}
-	inode_update_timestamps(inode, time_flags);
-	NFS_I(inode)->cache_validity &= ~cache_flags;
+static void nfs_update_mtime(struct inode *inode)
+{
+	inode_update_timestamps(inode, S_MTIME | S_CTIME);
+	NFS_I(inode)->cache_validity &=
+		~(NFS_INO_INVALID_CTIME | NFS_INO_INVALID_MTIME);
 }
 
 void nfs_update_delegated_atime(struct inode *inode)
 {
 	spin_lock(&inode->i_lock);
 	if (nfs_have_delegated_atime(inode))
-		nfs_update_timestamps(inode, ATTR_ATIME);
+		nfs_update_atime(inode);
 	spin_unlock(&inode->i_lock);
 }
 
 void nfs_update_delegated_mtime_locked(struct inode *inode)
 {
 	if (nfs_have_delegated_mtime(inode))
-		nfs_update_timestamps(inode, ATTR_MTIME);
+		nfs_update_mtime(inode);
 }
 
 void nfs_update_delegated_mtime(struct inode *inode)
@@ -747,7 +743,10 @@ nfs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 						ATTR_ATIME|ATTR_ATIME_SET);
 			}
 		} else {
-			nfs_update_timestamps(inode, attr->ia_valid);
+			if (attr->ia_valid & ATTR_MTIME)
+				nfs_update_mtime(inode);
+			if (attr->ia_valid & ATTR_ATIME)
+				nfs_update_atime(inode);
 			attr->ia_valid &= ~(ATTR_MTIME|ATTR_ATIME);
 		}
 		spin_unlock(&inode->i_lock);
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
