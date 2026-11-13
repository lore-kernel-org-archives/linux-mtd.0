Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ACE606A881
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IlR7wkfY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GTn2UBg5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GCcKDR0jwJZdA3kUfCQaj+OiK+hRgaHF7EWY6vqtx6E=; b=IlR7wkfYPa6N0+nBakltop4p3T
	ExnrFWqWZOp/vX1RnZcqtNu8M5QaquM5WMScm0euN/bcmrQOnbdT/U7YG7fYnY+5wwPOxn6YNsMd0
	ryiD5QY6cooWCorwYe8+VDP6b53bkkPkbk3Uh8tbK0VRMPBLau5MyJrjLVSlbq+r4wvi5Jfn7jDQ6
	pEhDftWfoNNxyw/Rslaa8Fry+kNwXse5mlWJmF1foudJqa2/FaJSVKSxpqDv8nG2IElWLydTEXEQ4
	8C313yghLYyB0B54QlFjQ39cYUiemO42sXFwfS0kvVbUeu6C5pOgnPSu9pJuFpu6gauiwVtEeGz06
	leJZUk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpx9-0000000CbqA-0JV8;
	Fri, 13 Nov 2026 12:00:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpx5-0000000CboV-3ZBr
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 12:00:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F8436243B;
	Fri, 13 Nov 2026 12:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB001F000CD;
	Fri, 13 Nov 2026 12:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794571219;
	bh=lmd4fnAESC5s+S1auO0HRGz+bU+qihMAxFdeQVUo7iY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GTn2UBg5bwmUVXQO/l/ba5bU7JvnblZR6f7K8Cc/4UDIpbisDGUOWJtOTtUWlomC8
	 VoTwfmsqGlb34fjZGac21NjFClu/qAObLKxD5tGb1irA1w34zaFbLToPCCtUHK/TyS
	 TxRlzsEuQRKg9jvXiNWkhwn9qAKto3lYrXe+vG9WKGRsF8/fh++J0dWAH++mER+ing
	 9y7YaesnZpirMMeMVnQqx/ombJZ6cDiQavuu2lAPxAc+Oohj5LPdGFrh9XeRPoKI0f
	 S1Crb5FaAt16rrSx0O4hcFnQuFCYfEdZ516JjptC1aONpuXVNsCwZVO2XZlOzYkkNX
	 2Rs9VM5LgosKQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 13 Nov 2026 12:58:58 +0100
Subject: [PATCH v3 02/33] jfs: use jfs_symlink_inode_operations in
 jfs_iget()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-work-fs-sb_rdonly-v3-2-0be92bb73709@kernel.org>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
To: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, 
 ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-xfs@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=brauner@kernel.org;
 h=from:subject:message-id; bh=JNfFHN04nudrc8oADaIN14/RzFJ3qnkM6OHZD27WnLA=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9+z17w2YfgQm3c9fKKT85PU0/OsvvnNxsGdf+1J8r5
 K1zg3u8OkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACby5j7DX5HJ5yzcGOUSeE7m
 ltbNm+AulPvoyXS3Y+ElWj+my5yd/JXhn9ml3bZNU1x3LBTU8mWI3fJ2iuiWyx55DcvlxH7wc6V
 O5AEA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jfs_symlink() gives slow symlinks jfs_symlink_inode_operations but
jfs_iget() gives them page_symlink_inode_operations. So once the inode
has been evicted a chown doesn't go through jfs_setattr() anymore and
skips dquot_transfer(), and listxattr(2) doesn't see the symlink's
xattrs. Use jfs_symlink_inode_operations in jfs_iget() as well like it
already does for fast symlinks.

Fixes: c7f2e1f0ac14 ("jfs: add jfs specific ->setattr call")
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/jfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jfs/inode.c b/fs/jfs/inode.c
index 6390d915c7f11..24b51461aacc9 100644
--- a/fs/jfs/inode.c
+++ b/fs/jfs/inode.c
@@ -47,7 +47,7 @@ struct inode *jfs_iget(struct super_block *sb, unsigned long ino)
 		inode->i_fop = &jfs_dir_operations;
 	} else if (S_ISLNK(inode->i_mode)) {
 		if (inode->i_size >= IDATASIZE) {
-			inode->i_op = &page_symlink_inode_operations;
+			inode->i_op = &jfs_symlink_inode_operations;
 			inode_nohighmem(inode);
 			inode->i_mapping->a_ops = &jfs_aops;
 		} else {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
