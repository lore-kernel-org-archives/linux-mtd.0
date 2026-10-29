Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7978F60A6F5F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z3KrjBP8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JPzI4b+4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uVEjv9Rghd+zReX21khxRyOr4QRZuDwzViuXUl3UCAc=; b=Z3KrjBP8h4/1L74EfNxhGj+FU6
	F2/6qkwAAAPF06M1Cdo56d4hhdyWIbgetTHWAqJ7xQGmLvNMXs29mmqdkQsZtPoW7g1shLhlVINYO
	9O1l0AA58H11UXFz/lY6gY8m9mEf4ibH8cRQv1WLDxJs/6Vnu1J0/huPykTBiF51T03JTp4TqwX8h
	mopTv5O+lSIkV36TMSMAADIHew1gkmglu2x8PFv1qvjM5gsnuZwLeP/cT0pN1VF9goqoYFCUmnNeJ
	J/rMDBL8kbNYc/0JVLbMvPkaCsD2aK1hcIDFzS7bO8965HVXtV+vkZ9JbXiPXeAhB1Zdd1Lo0Ev7v
	Z/kO/L0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSgs-00000009lES-0pU9;
	Thu, 29 Oct 2026 16:09:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSgr-00000009lDb-1fhd
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:09:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D65216062D;
	Thu, 29 Oct 2026 16:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13B41F01824;
	Thu, 29 Oct 2026 16:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290160;
	bh=eQCxXsTbwof9FUg6Ix787w22LF6YubBqqIH8KJ6MCDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JPzI4b+44MGHLq4Jf1Gd4otwA/YDDR9WxZIZKcBtPYvVLxg/NVjj0FSUl04NGD2UF
	 jW+QM9NGcJ8xak2TPxWrHzDPZWsqhQZpmf3e7baLAZcqmOEyqRQFv51S7CZqCBb4ac
	 L6XwWdAsCey9Ual2ko+9VwDzSQk3VqQaRkiLecBFhzzuVikzgtCdezSfjS6hRkvMLH
	 U/N7Ctvgg+K8gvHTFhjxufgGW2WB29OW4MRVU6GRO17sWpTay79NvLRfX8CghFCIEC
	 HxFOPT2Ot/wN3eHNjYIeDLuWrUzgbMFq3kzaw8rT4HrXFXsFEIClPDfvwd6J1cAeEm
	 8E2KYC0d+8GfA==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 29 Oct 2026 17:07:19 +0100
Subject: [PATCH v2 28/34] ubifs: don't set SB_RDONLY after errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-work-fs-sb_rdonly-v2-28-2f44f64f0b66@kernel.org>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2955; i=brauner@kernel.org;
 h=from:subject:message-id; bh=/l/eYRwD7NiCvHpR0M4Ent49C5EEBbats3rfxEZnvhM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9zjc437ZtHl/b8osXnrN8PqroI20dtn0u773jdfe+R
 in93ha3vaOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAiqx8y/I8+fdTck0/0T9Sm
 R2ZFJzZ1leZviTm5Wqdaa8P/dzYRjCYM/9RevWHu7F/ra+K9+1tjgk3Rmwynj2dXLHg2QdjwwLR
 FJUwA
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

ubifs_ro_mode() sets c->ro_error and SB_RDONLY from whatever context hit
the error, e.g. a failing write, and without holding s_umount. UBIFS
can't be frozen but that still races with everyone else changing
sb->s_flags. And c->ro_error alone already makes every write fail with
EROFS.

So only set SB_RDONLY while the filesystem is still being mounted and
call sb_set_emergency_ro() after that. The xattr setters check
c->ro_error as well because ecryptfs calls them without write access on
the lower mount and they change the inode in memory first.

So far a remount to read-only after an error was refused and a remount
to read-write went through and cleared SB_RDONLY again because
c->ro_mount was never set. Now going read-only works and its writes fail
with EROFS before any I/O, and going read-write is refused by the VFS.
fsync() fails with EROFS instead of taking ubifs_fsync()'s read-only
shortcut.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/ubifs/io.c    | 9 ++++++++-
 fs/ubifs/super.c | 5 +----
 fs/ubifs/xattr.c | 6 ++++++
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 6c6d68242779..7a59aa1ea5ce 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -72,7 +72,14 @@ void ubifs_ro_mode(struct ubifs_info *c, int err)
 	if (!c->ro_error) {
 		c->ro_error = 1;
 		c->no_chk_data_crc = 0;
-		c->vfs_sb->s_flags |= SB_RDONLY;
+		/*
+		 * Before SB_BORN the mounter holds s_umount, later see
+		 * sb_set_emergency_ro().
+		 */
+		if (!(c->vfs_sb->s_flags & SB_BORN))
+			c->vfs_sb->s_flags |= SB_RDONLY;
+		else
+			sb_set_emergency_ro(c->vfs_sb);
 		ubifs_warn(c, "switched to read-only mode, error %d", err);
 		dump_stack();
 	}
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 38972786817e..ef39da4e780b 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1977,10 +1977,7 @@ static int ubifs_reconfigure(struct fs_context *fc)
 		if (err)
 			return err;
 	} else if (!c->ro_mount && (fc->sb_flags & SB_RDONLY)) {
-		if (c->ro_error) {
-			ubifs_msg(c, "cannot re-mount R/O due to prior errors");
-			return -EROFS;
-		}
+		/* After an error ubifs_remount_ro() can't write but still works. */
 		ubifs_remount_ro(c);
 	}
 
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 3b0e8a270f59..572f6f3e52ad 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -260,6 +260,9 @@ int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
 	if (check_lock)
 		ubifs_assert(c, inode_is_locked(host));
 
+	if (c->ro_error)
+		return -EROFS;
+
 	if (size > UBIFS_MAX_INO_DATA)
 		return -ERANGE;
 
@@ -564,6 +567,9 @@ static int ubifs_xattr_remove(struct inode *host, const char *name)
 
 	ubifs_assert(c, inode_is_locked(host));
 
+	if (c->ro_error)
+		return -EROFS;
+
 	if (fname_len(&nm) > UBIFS_MAX_NLEN)
 		return -ENAMETOOLONG;
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
