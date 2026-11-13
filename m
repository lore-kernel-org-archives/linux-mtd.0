Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C663160A262A
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JwH5kb9F;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TMQuyq+6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qjf8NJHxcy1rDwM34lOt76bzmuIjFJFtdxsUry4eGKU=; b=JwH5kb9FsHiOQhue+Myvjm+Y7v
	oJ0cZc8ombAD+cPnFBseV4OZXsgRrhpJ0Guq07FCK5aADxLEipmsEXoi3KCkdQnEYyPeDivHaUOuw
	jJQiyRoEqZKnIQErC5z32g7KHkrbj+vwM8oCD5QzkvbyJEZ6ZRGDbt2Oj4Q4Rrgw7J8LmgrOoKwOR
	ehXPYJ6M/TPa5Mb4ioRVS/DKPmitmv1AwVPjH30M/0oos8IK/4KIBvcaVTKACI7QCWZelQ9Zig3Xc
	5PM8qu9srJsvOiEkXBgP4eMylezVvdZm7kaRmRV8FFmh53xLiVTpaYPdSimefTnwMr7CCQhN9FH3s
	AHd0ujOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpy9-0000000CcTx-1lzS;
	Fri, 13 Nov 2026 12:01:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpy4-0000000CcR8-1yk6
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 12:01:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D3B94630A;
	Fri, 13 Nov 2026 12:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7672A1F000C5;
	Fri, 13 Nov 2026 12:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794571280;
	bh=GszE2anAQxCWM5fQiE+znviLqpcjSCVYI4wX3Rv50lw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TMQuyq+6p608xsqKXRQqwgGlwSiM0dRFCXDUPlf6N0gX0MxCWF3e1DGAdkn//5+tV
	 YznW11mwNZ30EOc7xDIGsEhvmn1N2+9yDClEf9GWCFGLUfO7rdTDHPl2aQPYmVvaao
	 7cZSykBwXej9Oi1uLjQYdatvZ5LdlYdCCuZ9Bs4vgavxO5qtL4zICJHtanvG3kZ+BT
	 9JhSKJhCLFj5pd6NCWDkdrAA9cOVsadSEE6XqCDa3Y+TXkywSsCmzKxTyRVw0UqhRy
	 qD+lu2S/s8bi0oYPoSxdA5pAoL15RT2lffhHegCUbGYXGTDp/icKPjuu+641Ly5cU3
	 Mt1Ch42vm5sEg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 13 Nov 2026 12:59:12 +0100
Subject: [PATCH v3 16/33] affs: don't set SB_RDONLY after filesystem errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-work-fs-sb_rdonly-v3-16-0be92bb73709@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2952; i=brauner@kernel.org;
 h=from:subject:message-id; bh=nlF3ceMBkFeAzDOwb5efWgYEsyPK+IFw+V5w64DXzAA=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9+71m00LxFRWnTCUtLaYL6N2zbF/MKnflzZQ5Xb5L5
 3k/ObdepKOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAiS4IZ/tfxTH17ZNFmu+3p
 m3WyZku+DV51TzhCYU9D5u1n6x5fd1vB8Fdq9y35Ywsst0yRestWOvWxToz0LvGtbi8ynL+uPtv
 22ZgVAA==
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

affs_error() sets SB_RDONLY from whatever context hit the error and
without holding s_umount. If that happens while the filesystem is frozen
through bdev_freeze(), e.g. by a device mapper suspend, thaw_super()
sees a read-only superblock and leaves the s_writers rwsems locked so
every writer hangs.

So call sb_set_emergency_ro() instead and let the VFS refuse
modifications. affs_commit_super() leaves the root block alone in that
state. affs_write_inode() keeps working because writeback still writes
the data and the bitmap and extension blocks the inode points at.

After a remount to read-only a remount to read-write fails until umount.
A plain remount to read-write right after the error succeeds but the
filesystem stays read-only. A remount to read-only works and keeps the
bitmap around because evict and the last close still free blocks,
affs_kill_sb() frees it. Writes through file descriptors opened before
the error fail with EROFS.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/affs/amigaffs.c |  4 ++--
 fs/affs/super.c    | 14 ++++++++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/affs/amigaffs.c b/fs/affs/amigaffs.c
index affa20d2b73d0..40ee1998ff337 100644
--- a/fs/affs/amigaffs.c
+++ b/fs/affs/amigaffs.c
@@ -483,9 +483,9 @@ affs_error(struct super_block *sb, const char *function, const char *fmt, ...)
 	vaf.fmt = fmt;
 	vaf.va = &args;
 	pr_crit("error (device %s): %s(): %pV\n", sb->s_id, function, &vaf);
-	if (!sb_rdonly(sb))
+	/* SB_RDONLY needs s_umount, see sb_set_emergency_ro(). */
+	if (!sb_rdonly(sb) && sb_set_emergency_ro(sb))
 		pr_warn("Remounting filesystem read-only\n");
-	sb->s_flags |= SB_RDONLY;
 	va_end(args);
 }
 
diff --git a/fs/affs/super.c b/fs/affs/super.c
index ed8225b3c93dd..0957af26652d9 100644
--- a/fs/affs/super.c
+++ b/fs/affs/super.c
@@ -36,6 +36,9 @@ affs_commit_super(struct super_block *sb, int wait)
 	struct buffer_head *bh = sbi->s_root_bh;
 	struct affs_root_tail *tail = AFFS_ROOT_TAIL(sb, bh);
 
+	if (sb_emergency_ro(sb))
+		return;
+
 	lock_buffer(bh);
 	affs_secs_to_datestamp(ktime_get_real_seconds(), &tail->disk_change);
 	affs_fix_checksum(sb, bh);
@@ -82,7 +85,7 @@ void affs_mark_sb_dirty(struct super_block *sb)
 	struct affs_sb_info *sbi = AFFS_SB(sb);
 	unsigned long delay;
 
-	if (sb_rdonly(sb))
+	if (sb_rdonly_any(sb))
 	       return;
 
 	spin_lock(&sbi->work_lock);
@@ -550,10 +553,13 @@ static int affs_reconfigure(struct fs_context *fc)
 	if ((bool)(fc->sb_flags & SB_RDONLY) == sb_rdonly(sb))
 		return 0;
 
-	if (fc->sb_flags & SB_RDONLY)
-		affs_free_bitmap(sb);
-	else
+	if (fc->sb_flags & SB_RDONLY) {
+		/* After an error evict still frees blocks, keep the bitmap. */
+		if (!sb_emergency_ro(sb))
+			affs_free_bitmap(sb);
+	} else {
 		res = affs_init_bitmap(sb, &fc->sb_flags);
+	}
 
 	return res;
 }

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
