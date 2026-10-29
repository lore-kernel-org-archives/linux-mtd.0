Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99C560A3814
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OaT3vcTq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fEou4OZE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dGpO9rhKXQGq9yQfzUXN/qbbFFHlAlEvwi8zzmo7AZs=; b=OaT3vcTqWhVL60MGR/5PhOTNf6
	EZFo4J0+91P87WRpYIXjpLZHLZqfRVF3TYBLGhi9YDxcUXt/FKdETw7eh16qQqXdHvMvIiSG6dpXm
	fjIoIsXZkW7GX3Tx33D+8+081JmRJBfF2eAYF+sN4mPbYdkWKvVeDNkWWN6WG1ugpq2PL8cJM0mHV
	8jLFZkNiJqyAaQ/NewraI6rv5+P+0zQWIwKFNjDNOFUPDjL9tU5Jev9mXBsDbuHyCQeojKD5nkana
	uasSYdagRJtm/iULdgAOlzKdtJt4ILCJ2t9uzzKPlMIwXYQxffwAyMf+Owynj0Cmkwn2TFPCdj494
	Owe+MZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSgT-00000009kuu-1dE4;
	Thu, 29 Oct 2026 16:08:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSgS-00000009kuJ-0GPL
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:08:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 81EC760623;
	Thu, 29 Oct 2026 16:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7B51F01825;
	Thu, 29 Oct 2026 16:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290135;
	bh=yi2j2PwGFXAZdOVVF9qglPFKtSCcEqxM1FclZnJpM9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fEou4OZEGqFblEGsYDsHSiid2asP7SWQTcZPRuVX6a7fvWfOcqG5G84hu1FtZKcdk
	 t0t5w3mQ58vtEuOIZ+6y0GwHXodI0AhW8meU8oAkw7jpggw+TJGDq5Pg/69vjYVBC7
	 dTKkI4G0OOQJryETPJK46s+rmGmDyo4xtNzvT1+T/sQVpJYcDeB2DKy9PnfNQuHnso
	 jcXU1kyYWmKuM63FU5c/tqAcQ6lg6Rwd8B44c8O2oyDOdunEI+gp8QBNBJ3rtt7Niu
	 IsEK2TUKdu9ld5YTQOtdNj6DvHXKfRi+DujKAt9QCFNwWMaYCWrB+ZtxeDCbmz9bRp
	 8HnjYzNj8NOzA==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 29 Oct 2026 17:07:13 +0100
Subject: [PATCH v2 22/34] zonefs: use the generic emergency read-only state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-work-fs-sb_rdonly-v2-22-2f44f64f0b66@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4544; i=brauner@kernel.org;
 h=from:subject:message-id; bh=9hLkgbjux0pplAV/6nJwgZMVd9flGZzP5a74/P2yvYY=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9zjdwtmXnEt925qBkxqSGZNHZaTPNg/XPL6h4+N07P
 /u9oXp6RykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwETsPjEyNHLHOcl/npN97fuT
 +7ziVpXTtitq6y26/+rI54sWYgfkNjIyTBVYctGc4cXO8rWTf+wMPecn1D+1uJ5//u+SNJ0H94z
 O8QEA
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

Set SB_STATE_EMERGENCY_RO instead of a private bit and drop the checks
the VFS does now. /proc/mounts and statfs() report the filesystem as
read-only again. zonefs_set_emergency_ro() still prints the warning
once. The check in zonefs_seq_file_write_close() stays so a failed zone
close doesn't make the filesystem read-only a second time. And so does
the one in zonefs_file_write_iter() because the loop driver, nfs localio
and others call ->write_iter() without rw_verify_area().

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/zonefs/file.c   | 10 ++++------
 fs/zonefs/super.c  | 11 +----------
 fs/zonefs/zonefs.h | 15 ---------------
 3 files changed, 5 insertions(+), 31 deletions(-)

diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
index 8959b6b36a83..e5f8c9bca662 100644
--- a/fs/zonefs/file.c
+++ b/fs/zonefs/file.c
@@ -299,7 +299,7 @@ static vm_fault_t zonefs_filemap_page_mkwrite(struct vm_fault *vmf)
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	vm_fault_t ret;
 
-	if (unlikely(IS_IMMUTABLE(inode) || zonefs_emergency_ro(inode->i_sb)))
+	if (unlikely(IS_IMMUTABLE(inode)))
 		return VM_FAULT_SIGBUS;
 
 	/*
@@ -601,7 +601,8 @@ static ssize_t zonefs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	if (unlikely(IS_IMMUTABLE(inode)))
 		return -EPERM;
 
-	if (sb_rdonly(inode->i_sb) || zonefs_emergency_ro(inode->i_sb))
+	/* loop and others call ->write_iter() without rw_verify_area() */
+	if (sb_rdonly(inode->i_sb) || sb_emergency_ro(inode->i_sb))
 		return -EROFS;
 
 	/* Write operations beyond the zone capacity are not allowed */
@@ -788,9 +789,6 @@ static int zonefs_file_open(struct inode *inode, struct file *file)
 {
 	int ret;
 
-	if ((file->f_mode & FMODE_WRITE) && zonefs_emergency_ro(inode->i_sb))
-		return -EROFS;
-
 	file->f_mode |= FMODE_CAN_ODIRECT;
 	ret = generic_file_open(inode, file);
 	if (ret)
@@ -832,7 +830,7 @@ static void zonefs_seq_file_write_close(struct inode *inode)
 			 * file system read-only.
 			 */
 			if (z->z_flags & ZONEFS_ZONE_OPEN &&
-			    !sb_rdonly(sb) && !zonefs_emergency_ro(sb)) {
+			    !sb_rdonly(sb) && !sb_emergency_ro(sb)) {
 				zonefs_warn(sb,
 					"closing zone at %llu failed %d\n",
 					z->z_sector, ret);
diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index e7c97b75c601..342dcc261906 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -253,8 +253,7 @@ static void zonefs_inode_update_mode(struct inode *inode)
  */
 void zonefs_set_emergency_ro(struct super_block *sb)
 {
-	if (sb_rdonly(sb) ||
-	    test_and_set_bit(ZONEFS_SB_EMERGENCY_RO, &ZONEFS_SB(sb)->s_state))
+	if (sb_rdonly(sb) || !sb_set_emergency_ro(sb))
 		return;
 
 	zonefs_warn(sb, "remounting filesystem read-only\n");
@@ -549,9 +548,6 @@ static int zonefs_inode_setattr(const struct mnt_idmap *idmap,
 	struct inode *inode = d_inode(dentry);
 	int ret;
 
-	if (unlikely(zonefs_emergency_ro(inode->i_sb)))
-		return -EROFS;
-
 	if (unlikely(IS_IMMUTABLE(inode)))
 		return -EPERM;
 
@@ -1382,11 +1378,6 @@ static int zonefs_reconfigure(struct fs_context *fc)
 	struct super_block *sb = fc->root->d_sb;
 	struct zonefs_sb_info *sbi = sb->s_fs_info;
 
-	/* An error made the file system read-only until it is unmounted. */
-	if (sb_rdonly(sb) && !(fc->sb_flags & SB_RDONLY) &&
-	    zonefs_emergency_ro(sb))
-		return -EROFS;
-
 	sync_filesystem(fc->root->d_sb);
 	/* Copy new options from ctx into sbi. */
 	sbi->s_mount_opts = ctx->s_mount_opts;
diff --git a/fs/zonefs/zonefs.h b/fs/zonefs/zonefs.h
index b14822cb9c02..24029c0e23db 100644
--- a/fs/zonefs/zonefs.h
+++ b/fs/zonefs/zonefs.h
@@ -241,16 +241,6 @@ struct zonefs_sb_info {
 	bool			s_sysfs_registered;
 	struct kobject		s_kobj;
 	struct completion	s_kobj_unregister;
-
-	unsigned long		s_state;
-};
-
-/*
- * Super block state bits (s_state).
- */
-enum {
-	/* An error made the file system read-only until it is unmounted */
-	ZONEFS_SB_EMERGENCY_RO,
 };
 
 static inline struct zonefs_sb_info *ZONEFS_SB(struct super_block *sb)
@@ -258,11 +248,6 @@ static inline struct zonefs_sb_info *ZONEFS_SB(struct super_block *sb)
 	return sb->s_fs_info;
 }
 
-static inline bool zonefs_emergency_ro(struct super_block *sb)
-{
-	return test_bit(ZONEFS_SB_EMERGENCY_RO, &ZONEFS_SB(sb)->s_state);
-}
-
 #define zonefs_info(sb, format, args...)	\
 	pr_info("zonefs (%s): " format, sb->s_id, ## args)
 #define zonefs_err(sb, format, args...)		\

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
