Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E630CA9ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 10:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/w4rVNsY58EFHlRnyI4aBqF5SmMGtdelmR2EIYcWn8=; b=naHX41tOQZYaMV
	ZHMGAyJlXzYB7Ni00lONkwAbgblsKCTUEqUYtsNAPQuPT60TPkki/j1OLGRm8NtwlEmIvE9F7pRQl
	Why7PdyjolyT3ia8NzL930zu+5VdOgyah4mbL8LcYFgE308wjKFe/s3IQUjxscBwP8OjvkzkPRuYN
	umR8UC9Tx4N3q0AJpRVscPJAsNC8J5KtKQ11gsoYfiLCQTfqvwzesRlr23jpxFJDvUUtcmKQvmhe5
	dkLPR3jEizxg5PKkgqebuPBE9mzFgI3WWtGVYvk7PhJAC8E2FOvb4Hc8igtPl4DhMjvqMCwn6Gcfe
	tjOFkV9m2llvSBu+SqZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGD9k-0000000ACNY-2Ruf;
	Mon, 12 Oct 2026 10:21:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGD9j-0000000ACMr-15Z2
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 10:21:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B9F4243982;
	Mon, 12 Oct 2026 10:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DB31F0089C;
	Mon, 12 Oct 2026 10:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791800478;
	bh=jSaTeXy5zEI39kgqqTi6yfSkP3Kgm5wm6RfoGXruvqg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=daD9kmOaoDrecEZ+GKWXxyW9H20UJr48DcxIiw0e65dcl8QTST3JZXcj61YvqNTyb
	 c5d34ADQW1FTC40OtFvDZ/r1oWnvdCTDB2nBPiUWZpsdvr64rU3yyTUZCbQmtT/WHN
	 M4L3IE8ZFu/uZjDyHAoHWVVDuNF/pppyPWohHYEa4Yvx8fprF5PUJYsVDI169f9kxo
	 jBe+V1vSuEX9xF71FfYPmOVHGKSg4cEB3pIABRCDPA7K95hBDggmzUqYSJbpYomakn
	 PXM0tJDgLdWEhvw5L8NTowb8aNFn6hJrwa/MlDBOPgqwCRarNEsyBQ1YwBmx0RfVjr
	 WbnHd24KBBfVA==
From: Christian Brauner <brauner@kernel.org>
Date: Mon, 12 Oct 2026 12:20:46 +0200
Subject: [PATCH RFC 01/28] ecryptfs: don't leak the inode when a lookup
 can't open the lower file
MIME-Version: 1.0
Message-Id: <20261012-work-fs-sb_rdonly-v1-1-60743a3dc326@kernel.org>
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
In-Reply-To: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
To: Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, ntfs@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org, 
 gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-3d1b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=brauner@kernel.org;
 h=from:subject:message-id; bh=FHwfq/OCDsnntrfJYkKn8tLOjs4Tv7YHZV8JitYQDQ0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSd2TJJmlVX9PaCsIn+FsHZwuxHGEpPFCj+mriqsDrpf
 qGIfFJFRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwETcDjD8sz1q8vHQt6fh7p09
 uT08PmKLO9tkzFMehF2fYnDC/qOTC8P/xLgFX20+PbiQ+CC39cSDhwe1Dlq6qHKtT7/euMmvwfE
 UHwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
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

ecryptfs_lookup_interpose() opens the lower file of a regular file to
read the size from the header. If that fails it calls make_bad_inode()
and returns the error. A new inode is still I_NEW at that point and
nothing ever unlocks or puts it, so it leaks together with the reference
it holds on the lower inode. And an inode that was already in the cache
gets marked bad for all its other users instead of just losing the
reference this lookup took.

umount then complains:

  VFS: Busy inodes after unmount of ecryptfs (ecryptfs)

That's a WARN, or a BUG with CONFIG_BUG_ON_DATA_CORRUPTION. The lower
filesystem reports the same when it is unmounted. Use iget_failed() for
a new inode and iput() for one from the cache.

Reproducer, opening the lower file read-write fails on a read-only bind
mount:

  sig=$(printf x | ecryptfs-add-passphrase - | sed -n 's/.*\[\(.*\)\].*/\1/p')
  mount --bind -o ro /lower /lower
  mount -i -t ecryptfs -o ecryptfs_sig=$sig,ecryptfs_cipher=aes,ecryptfs_key_bytes=16,ecryptfs_passthrough /lower /upper
  cat /upper/f      # EROFS
  umount /upper     # VFS: Busy inodes after unmount of ecryptfs

Fixes: 3b06b3ebf441 ("eCryptfs: Fix new inode race condition")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/ecryptfs/inode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 525297c7ebd8..0d8452558a98 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -362,7 +362,10 @@ static struct dentry *ecryptfs_lookup_interpose(struct dentry *dentry,
 	if (S_ISREG(inode->i_mode)) {
 		rc = ecryptfs_i_size_read(dentry, inode);
 		if (rc) {
-			make_bad_inode(inode);
+			if (inode_state_read_once(inode) & I_NEW)
+				iget_failed(inode);
+			else
+				iput(inode);
 			return ERR_PTR(rc);
 		}
 	}

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
