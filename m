Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71BD606A31D
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GMVmnN34;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=apnLeEp6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rf2Bfkqp3jtsG110DGzuE8i78gS4A2XNI2OqlJmeQPQ=; b=GMVmnN34Rk+Wwq9sMXD5W1p18F
	71Rq/6MtMdvyBLIojyb1XBbYg4AcWr59OcdAB0cU4PhtScKzJgRQtWU3PRfz7MbNPoZmCcMelLGD6
	z/m4RXYFz90I8bAvKrvJFUR2ttVDohOOyRIYoJqs5ox7K5l+yhehRMDualFcfaBXjn8X0YGOziloW
	SOxRjb3w54m2GcI/Hg3+R2YJOtHpyJtLZhXN3cz31cx8HBPW/k8QoQvA4gnZh4GMKE1+6Y6cVZCkJ
	e9RmimVNnQICMjVjTAblGsHsWbUMs8jfnfU2qAYspJJuzgnnrHhh3KSssQ1nVdkqLxjBppbmRGGYP
	6fH02u1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSfz-00000009kZJ-2Exv;
	Thu, 29 Oct 2026 16:08:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSfy-00000009kYY-0i88
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:08:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D3C4940BEB;
	Thu, 29 Oct 2026 16:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1211F01824;
	Thu, 29 Oct 2026 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290105;
	bh=I/oiBbhXQXOuy5/WHon3lGMzwYKAwOcdwRlB5xpdxo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=apnLeEp6sWFy2449fzQAHriIIqCswM8uoD0mTMMHveLird8YKw0oOjAo1G4GlLf/E
	 wlj38mUL83hgTM19xi+oSPQDnV9WXWU1yHBf3y2zit5T3almbhv+eS37w3lnS9deCd
	 16QZrfScJpN69CogqhFXyUYjLlkeyV0oTct2sfU+T4L+omqsbHA4buFp6xSmkfbKp8
	 pWym+AoDsETj00RyBN8gL99EcOvnbplUFTpKbcTnb0LQgoQe366xX/UwyS/NQOtRb3
	 G9NgaIdQ/P78ph9RLW7QyFUmrAYZUeSPX4LFQAH48AGbNdt/9cXHMX5TwjlcYT/9Fc
	 2kP+LcuIAbwjw==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 29 Oct 2026 17:07:06 +0100
Subject: [PATCH v2 15/34] ufs: don't set SB_RDONLY after filesystem errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-work-fs-sb_rdonly-v2-15-2f44f64f0b66@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8083; i=brauner@kernel.org;
 h=from:subject:message-id; bh=5wkaJy8Del2GgoWgJLyIqhCgM2FMCOm88L7ydmoZ6Xw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9ztf/dfEn9+fLU13UX185N/37l95e7lUXL32av3rm1
 zcbC9bkSXSUsjCIcTHIiimyOLSbhMst56nYbJSpATOHlQlkCAMXpwBM5NoLhn862w35hG/cdz0h
 +/8km8q/0xs/NQn/v9XN8UpsgWxn/T8Zhv/pXwwEzuUckp3csGHLlhShgCThzspVCxf03T0ZvHh
 BnwEvAA==
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

ufs_error() sets SB_RDONLY on every error, whatever onerror= says, and
ufs_panic() does too, both without holding s_umount. If that happens
while the filesystem is frozen through bdev_freeze() thaw_super() sees a
read-only superblock and leaves the s_writers rwsems locked so every
writer hangs. It also leaked the cylinder group info because
ufs_put_super() doesn't free it for a read-only superblock, and a
remount to read-write read it in again over the old copy.

So call sb_set_emergency_ro() instead and let the VFS refuse
modifications. ufs_error() and ufs_panic() still mark the superblock
UFS_FSBAD but don't queue ufs_sync_fs() anymore which does nothing in
that state. ufs_put_cylinder() doesn't store the allocation rotors and
ufs_write_inode() refuses. ufs_handle_dirsync() treats EROFS as success
like ext2 because the directory entry was already changed.

A remount to read-write fails until umount. A remount to read-only works
and keeps the cylinder group info because evicting inodes that were
unlinked while open still loads cylinder groups. Writes through file
descriptors opened before the error fail with EROFS.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/ufs/cylinder.c | 12 +++++++-----
 fs/ufs/dir.c      |  3 +++
 fs/ufs/inode.c    |  2 ++
 fs/ufs/super.c    | 56 ++++++++++++++++++++++++++++++++++++++-----------------
 4 files changed, 51 insertions(+), 22 deletions(-)

diff --git a/fs/ufs/cylinder.c b/fs/ufs/cylinder.c
index b930ee1cf853..e0360873a7f8 100644
--- a/fs/ufs/cylinder.c
+++ b/fs/ufs/cylinder.c
@@ -117,12 +117,14 @@ void ufs_put_cylinder (struct super_block * sb, unsigned bitmap_nr)
 	}
 	/*
 	 * rotor is not so important data, so we put it to disk 
-	 * at the end of working with cylinder
+	 * at the end of working with cylinder, but not after an error
 	 */
-	ucg->cg_rotor = cpu_to_fs32(sb, ucpi->c_rotor);
-	ucg->cg_frotor = cpu_to_fs32(sb, ucpi->c_frotor);
-	ucg->cg_irotor = cpu_to_fs32(sb, ucpi->c_irotor);
-	ubh_mark_buffer_dirty (UCPI_UBH(ucpi));
+	if (!sb_emergency_ro(sb)) {
+		ucg->cg_rotor = cpu_to_fs32(sb, ucpi->c_rotor);
+		ucg->cg_frotor = cpu_to_fs32(sb, ucpi->c_frotor);
+		ucg->cg_irotor = cpu_to_fs32(sb, ucpi->c_irotor);
+		ubh_mark_buffer_dirty (UCPI_UBH(ucpi));
+	}
 	for (i = 1; i < UCPI_UBH(ucpi)->count; i++) {
 		brelse (UCPI_UBH(ucpi)->bh[i]);
 	}
diff --git a/fs/ufs/dir.c b/fs/ufs/dir.c
index e96174b738b4..78c883921115 100644
--- a/fs/ufs/dir.c
+++ b/fs/ufs/dir.c
@@ -64,6 +64,9 @@ static int ufs_handle_dirsync(struct inode *dir)
 	err = filemap_write_and_wait(dir->i_mapping);
 	if (!err)
 		err = sync_inode_metadata(dir, 1);
+	/* The change is done, an error made us read-only in the meantime. */
+	if (err == -EROFS && sb_emergency_ro(dir->i_sb))
+		err = 0;
 	return err;
 }
 
diff --git a/fs/ufs/inode.c b/fs/ufs/inode.c
index c9ff8673fa66..ed5d98c8bfca 100644
--- a/fs/ufs/inode.c
+++ b/fs/ufs/inode.c
@@ -828,6 +828,8 @@ static int ufs_update_inode(struct inode * inode, int do_sync)
 
 int ufs_write_inode(struct inode *inode, struct writeback_control *wbc)
 {
+	if (sb_emergency_ro(inode->i_sb))
+		return -EROFS;
 	return ufs_update_inode(inode, wbc->sync_mode == WB_SYNC_ALL);
 }
 
diff --git a/fs/ufs/super.c b/fs/ufs/super.c
index 3569ac92b065..d82cf73360a7 100644
--- a/fs/ufs/super.c
+++ b/fs/ufs/super.c
@@ -280,11 +280,13 @@ void ufs_error (struct super_block * sb, const char * function,
 	uspi = UFS_SB(sb)->s_uspi;
 	usb1 = ubh_get_usb_first(uspi);
 	
-	if (!sb_rdonly(sb)) {
+	/*
+	 * SB_RDONLY needs s_umount, see sb_set_emergency_ro(). The superblock
+	 * marked bad goes out with the block device.
+	 */
+	if (!sb_rdonly(sb) && sb_set_emergency_ro(sb)) {
 		usb1->fs_clean = UFS_FSBAD;
 		ubh_mark_buffer_dirty(USPI_UBH(uspi));
-		ufs_mark_sb_dirty(sb);
-		sb->s_flags |= SB_RDONLY;
 	}
 	va_start(args, fmt);
 	vaf.fmt = fmt;
@@ -314,15 +316,14 @@ void ufs_panic (struct super_block * sb, const char * function,
 	uspi = UFS_SB(sb)->s_uspi;
 	usb1 = ubh_get_usb_first(uspi);
 	
-	if (!sb_rdonly(sb)) {
+	/* See ufs_error(). */
+	if (!sb_rdonly(sb) && sb_set_emergency_ro(sb)) {
 		usb1->fs_clean = UFS_FSBAD;
 		ubh_mark_buffer_dirty(USPI_UBH(uspi));
-		ufs_mark_sb_dirty(sb);
 	}
 	va_start(args, fmt);
 	vaf.fmt = fmt;
 	vaf.va = &args;
-	sb->s_flags |= SB_RDONLY;
 	pr_crit("panic (device %s): %s: %pV\n",
 		sb->s_id, function, &vaf);
 	va_end(args);
@@ -512,11 +513,13 @@ static int ufs_read_cylinder_structures(struct super_block *sb)
 
 failed:
 	kfree (base);
+	sbi->s_csp = NULL;
 	if (sbi->s_ucg) {
 		for (i = 0; i < uspi->s_ncg; i++)
 			if (sbi->s_ucg[i])
 				brelse (sbi->s_ucg[i]);
 		kfree (sbi->s_ucg);
+		sbi->s_ucg = NULL;
 		for (i = 0; i < UFS_MAX_GROUP_LOADED; i++)
 			kfree (sbi->s_ucpi[i]);
 	}
@@ -579,7 +582,8 @@ static void ufs_put_cstotal(struct super_block *sb)
  * ufs_put_super_internal() - put on-disk intrenal structures
  * @sb: pointer to super_block structure
  * Put on-disk structures associated with cylinder groups
- * and write them back to disk, also update cs_total on disk
+ * and write them back to disk, also update cs_total on disk.
+ * Nothing is written back after an error.
  */
 static void ufs_put_super_internal(struct super_block *sb)
 {
@@ -591,10 +595,14 @@ static void ufs_put_super_internal(struct super_block *sb)
 	
 	UFSD("ENTER\n");
 
+	base = space = (char*) sbi->s_csp;
+	/* Don't write anything back after an error, see ufs_error(). */
+	if (sb_emergency_ro(sb))
+		goto release;
+
 	ufs_put_cstotal(sb);
 	size = uspi->s_cssize;
 	blks = (size + uspi->s_fsize - 1) >> uspi->s_fshift;
-	base = space = (char*) sbi->s_csp;
 	for (i = 0; i < blks; i++, space += uspi->s_fsize) {
 		struct buffer_head *bh = sb_bread(sb, uspi->s_csaddr + i);
 
@@ -607,6 +615,7 @@ static void ufs_put_super_internal(struct super_block *sb)
 		mark_buffer_dirty(bh);
 		brelse(bh);
 	}
+release:
 	for (i = 0; i < sbi->s_cg_loaded; i++) {
 		ufs_put_cylinder (sb, i);
 		kfree (sbi->s_ucpi[i]);
@@ -616,7 +625,9 @@ static void ufs_put_super_internal(struct super_block *sb)
 	for (i = 0; i < uspi->s_ncg; i++) 
 		brelse (sbi->s_ucg[i]);
 	kfree (sbi->s_ucg);
+	sbi->s_ucg = NULL;
 	kfree (base);
+	sbi->s_csp = NULL;
 
 	UFSD("EXIT\n");
 }
@@ -628,6 +639,10 @@ static int ufs_sync_fs(struct super_block *sb, int wait)
 	struct ufs_super_block_third * usb3;
 	unsigned flags;
 
+	/* Leave the superblock alone after an error, see ufs_error(). */
+	if (sb_emergency_ro(sb))
+		return 0;
+
 	mutex_lock(&UFS_SB(sb)->s_lock);
 
 	UFSD("ENTER\n");
@@ -684,7 +699,8 @@ static void ufs_put_super(struct super_block *sb)
 
 	UFSD("ENTER\n");
 
-	if (!sb_rdonly(sb))
+	/* NULL if a remount to read-only freed the cylinder groups */
+	if (sbi->s_ucg)
 		ufs_put_super_internal(sb);
 	cancel_delayed_work_sync(&sbi->sync_work);
 
@@ -1265,14 +1281,20 @@ static int ufs_reconfigure(struct fs_context *fc)
 	 * fs was mouted as rw, remounting ro
 	 */
 	if (fc->sb_flags & SB_RDONLY) {
-		ufs_put_super_internal(sb);
-		usb1->fs_time = ufs_get_seconds(sb);
-		if ((flags & UFS_ST_MASK) == UFS_ST_SUN
-		  || (flags & UFS_ST_MASK) == UFS_ST_SUNOS
-		  || (flags & UFS_ST_MASK) == UFS_ST_SUNx86) 
-			ufs_set_fs_state(sb, usb1, usb3,
-				UFS_FSOK - fs32_to_cpu(sb, usb1->fs_time));
-		ubh_mark_buffer_dirty (USPI_UBH(uspi));
+		/*
+		 * After an error leave the superblock alone and keep the
+		 * cylinder groups, evict still needs them.
+		 */
+		if (!sb_emergency_ro(sb)) {
+			ufs_put_super_internal(sb);
+			usb1->fs_time = ufs_get_seconds(sb);
+			if ((flags & UFS_ST_MASK) == UFS_ST_SUN
+			  || (flags & UFS_ST_MASK) == UFS_ST_SUNOS
+			  || (flags & UFS_ST_MASK) == UFS_ST_SUNx86)
+				ufs_set_fs_state(sb, usb1, usb3,
+					UFS_FSOK - fs32_to_cpu(sb, usb1->fs_time));
+			ubh_mark_buffer_dirty (USPI_UBH(uspi));
+		}
 		sb->s_flags |= SB_RDONLY;
 	} else {
 	/*

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
