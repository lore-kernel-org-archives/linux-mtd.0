Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D9F606A32C
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4vSkdD5R;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RlUquBNs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JEe4JBtR37mKmqL4M+yGG1oozrj0zQ7s/Nk3Q2YH4J4=; b=4vSkdD5RqS/4+GySBW3rei+qJ2
	WZGDndgAaszkx+SkgDVF1qnt9U+Izrr8YrilxkJN3VH6aSrikfMEf/WdnxqRo6xHaFzMln26w9Aac
	pma1WJbKiPaocPjUBk4VGLYO/hgdqb2RIcDOjIN8apy4UYEsIWtuqrYNbbDwUE5MSVRU1vUP8DuIb
	bLiCtjRYnDMVp1F9jd3pLo6nfWZLAfn+j06/yaG9vnKI9k+hi95YhZjosjcMlMNa4Y7PWH/Enih0F
	QfB6re1n2lRTS05xa6j2amiqPTCcnjOX4jjTAA8tBQf7tnwcMwJSAVTuola6h+p7OUrSHKGaRzsky
	jXiakf1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSfN-00000009k2l-043u;
	Thu, 29 Oct 2026 16:07:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSfM-00000009k1p-0AJn
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:07:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C17A6061D;
	Thu, 29 Oct 2026 16:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336A81F01824;
	Thu, 29 Oct 2026 16:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290067;
	bh=kveNn4j/GWeYrnti6f44EeqZoatALymzZ1v9ov541sk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RlUquBNsrDtCLKwUecn0DUBR3oLX6ZESdpaf9Opt7wiIWS8/pl5OntDis/ohpLEQn
	 ac1QSgTsOFGUli+GKpPs6xCnCfWvi+teA+SNSCS2kOvnin52DOt5Em9yQUW60ZrjaN
	 3U8bn+V4DACQt7S5AbipkHLgaqfYdWYncJlNn7/0AYDp4JC/A/N0NSl1aNcMIwCYdy
	 Rc1zYGC63tTSjSsdEPFep919+IgPu/2MtMmQCB6KKa9IPcymjviK3oe7TE61Tuwfmb
	 tZ1kKNdkOHidWMF5CGY0lyua9UTdiYBArCY6XkRrwNfU4zXesisyu5gnoEZ8+2yOz7
	 B896S6Y7N5VLw==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 29 Oct 2026 17:06:57 +0100
Subject: [PATCH v2 06/34] nilfs2: don't set SB_RDONLY after filesystem
 errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-work-fs-sb_rdonly-v2-6-2f44f64f0b66@kernel.org>
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
 "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Karl Mehltretter <kmehltretter@gmail.com>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9921; i=brauner@kernel.org;
 h=from:subject:message-id; bh=csUy0jt26u0t2G96OWe0GxhGfzrZOn8y/Ie4DWlh7UA=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9ztfPUb6wYBbvydk2Tr3bvdeL3zA68LM+kVfs1v1Q1
 40sHbsXdpSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEykj5ORYYliuqGd+Bch46X5
 YfEnzdJcfLYqbGI9dCnv8S2VNS6OUxkZ2n722uW2nZi2wuTTrknSe7MOTP8Xw7Mmq+SNAA/r5eS
 rDAA=
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

With errors=remount-ro, the nilfs2 default, __nilfs_error() sets
SB_RDONLY from whatever context hit the error and without holding
s_umount. If that happens while the filesystem is frozen thaw_super()
sees a read-only superblock and leaves the s_writers rwsems locked so
every writer hangs.

nilfs2 already treats a runtime SB_RDONLY as "degraded because of
corruption" in a lot of places and that can stay. So call
sb_set_emergency_ro() instead and add nilfs_sb_rdonly() which is true
for a read-only mount and for the emergency state. Use it for every
sb_rdonly() check that guards a write. FITRIM is refused and
nilfs_sync_fs() and a remount to read-only don't write anything anymore.

nilfs2 explicitly supported "mount -o remount,rw" after an error so far.
Now the state lasts until umount like on ext4. That includes a mount
that reconfigures a superblock only snapshots kept alive.
nilfs_get_tree() does that without reconfigure_super() so
nilfs_reconfigure() refuses going read-write itself. Writes through file
descriptors opened before the error fail with EROFS now instead of being
dropped.

Reported-by: Karl Mehltretter <kmehltretter@gmail.com>
Link: https://lore.kernel.org/r/20260903060855.4610-1-kmehltretter@gmail.com
Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/nilfs2/inode.c     |  4 ++--
 fs/nilfs2/ioctl.c     |  4 ++++
 fs/nilfs2/mdt.c       |  2 +-
 fs/nilfs2/page.c      |  2 +-
 fs/nilfs2/segment.c   | 13 ++++++-------
 fs/nilfs2/sufile.h    |  2 +-
 fs/nilfs2/super.c     | 29 ++++++++++++++++++++++-------
 fs/nilfs2/the_nilfs.h |  6 ++++++
 8 files changed, 43 insertions(+), 19 deletions(-)

diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
index a99a69e9f91b..0d4995a08b78 100644
--- a/fs/nilfs2/inode.c
+++ b/fs/nilfs2/inode.c
@@ -162,7 +162,7 @@ static int nilfs_writepages(struct address_space *mapping,
 	struct inode *inode = mapping->host;
 	int err = 0;
 
-	if (sb_rdonly(inode->i_sb)) {
+	if (nilfs_sb_rdonly(inode->i_sb)) {
 		nilfs_clear_dirty_pages(mapping, false);
 		return -EROFS;
 	}
@@ -848,7 +848,7 @@ void nilfs_evict_inode(struct inode *inode)
 	truncate_inode_pages_final(&inode->i_data);
 
 	nilfs = sb->s_fs_info;
-	if (unlikely(sb_rdonly(sb) || !nilfs->ns_writer)) {
+	if (unlikely(nilfs_sb_rdonly(sb) || !nilfs->ns_writer)) {
 		/*
 		 * If this inode is about to be disposed after the file system
 		 * has been degraded to read-only due to file system corruption
diff --git a/fs/nilfs2/ioctl.c b/fs/nilfs2/ioctl.c
index 686ac53498bc..42848601b394 100644
--- a/fs/nilfs2/ioctl.c
+++ b/fs/nilfs2/ioctl.c
@@ -1050,6 +1050,10 @@ static int nilfs_ioctl_trim_fs(struct inode *inode, void __user *argp)
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
+	/* Don't trust the segment usage after an error. */
+	if (sb_emergency_ro(inode->i_sb))
+		return -EROFS;
+
 	if (!bdev_max_discard_sectors(nilfs->ns_bdev))
 		return -EOPNOTSUPP;
 
diff --git a/fs/nilfs2/mdt.c b/fs/nilfs2/mdt.c
index 77dc2be2ce65..3679a21dcb29 100644
--- a/fs/nilfs2/mdt.c
+++ b/fs/nilfs2/mdt.c
@@ -400,7 +400,7 @@ static int nilfs_mdt_writeback(struct address_space *mapping,
 	if (!inode)
 		return 0;
 
-	if (sb_rdonly(inode->i_sb)) {
+	if (nilfs_sb_rdonly(inode->i_sb)) {
 		/*
 		 * It means that filesystem was remounted in read-only
 		 * mode because of error or metadata corruption. But we
diff --git a/fs/nilfs2/page.c b/fs/nilfs2/page.c
index 857926da9f21..c71b82244f9d 100644
--- a/fs/nilfs2/page.c
+++ b/fs/nilfs2/page.c
@@ -259,7 +259,7 @@ int nilfs_copy_dirty_pages(struct address_space *dmap,
 
 		folio_lock(folio);
 		if (unlikely(!folio_test_dirty(folio))) {
-			if (WARN_ONCE(!sb_rdonly(smap_inode->i_sb),
+			if (WARN_ONCE(!nilfs_sb_rdonly(smap_inode->i_sb),
 					"inconsistent dirty state\n"))
 				goto unlock_folio;
 
diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index af0c3560444f..24b6e9597d5d 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -317,7 +317,7 @@ void nilfs_relax_pressure_in_lock(struct super_block *sb)
 	struct the_nilfs *nilfs = sb->s_fs_info;
 	struct nilfs_sc_info *sci = nilfs->ns_writer;
 
-	if (sb_rdonly(sb) || unlikely(!sci) || !sci->sc_flush_request)
+	if (nilfs_sb_rdonly(sb) || unlikely(!sci) || !sci->sc_flush_request)
 		return;
 
 	set_bit(NILFS_SC_PRIOR_FLUSH, &sci->sc_flags);
@@ -2099,7 +2099,7 @@ static int nilfs_segctor_do_construct(struct nilfs_sc_info *sci, int mode)
 	struct the_nilfs *nilfs = sci->sc_super->s_fs_info;
 	int err;
 
-	if (sb_rdonly(sci->sc_super))
+	if (nilfs_sb_rdonly(sci->sc_super))
 		return -EROFS;
 
 	nilfs_sc_cstage_set(sci, NILFS_ST_INIT);
@@ -2323,7 +2323,7 @@ int nilfs_construct_segment(struct super_block *sb)
 	struct nilfs_sc_info *sci = nilfs->ns_writer;
 	struct nilfs_transaction_info *ti;
 
-	if (sb_rdonly(sb) || unlikely(!sci))
+	if (nilfs_sb_rdonly(sb) || unlikely(!sci))
 		return -EROFS;
 
 	/* A call inside transactions causes a deadlock. */
@@ -2356,7 +2356,7 @@ int nilfs_construct_dsync_segment(struct super_block *sb, struct inode *inode,
 	struct nilfs_transaction_info ti;
 	int err = 0;
 
-	if (sb_rdonly(sb) || unlikely(!sci))
+	if (nilfs_sb_rdonly(sb) || unlikely(!sci))
 		return -EROFS;
 
 	nilfs_transaction_lock(sb, &ti, 0);
@@ -2870,9 +2870,8 @@ int nilfs_attach_log_writer(struct super_block *sb, struct nilfs_root *root)
 
 	if (nilfs->ns_writer) {
 		/*
-		 * This happens if the filesystem is made read-only by
-		 * __nilfs_error or nilfs_remount and then remounted
-		 * read/write.  In these cases, reuse the existing
+		 * This happens if the filesystem is remounted read-only and
+		 * then read/write again.  In this case, reuse the existing
 		 * writer.
 		 */
 		return 0;
diff --git a/fs/nilfs2/sufile.h b/fs/nilfs2/sufile.h
index 5888ed479c8b..d5e7598e36b3 100644
--- a/fs/nilfs2/sufile.h
+++ b/fs/nilfs2/sufile.h
@@ -76,7 +76,7 @@ int nilfs_sufile_trim_fs(struct inode *sufile, struct fstrim_range *range);
 		int _err = (err);					\
 									\
 		if (unlikely(_err))					\
-			_err = WARN_ONCE(!sb_rdonly((sufile)->i_sb),	\
+			_err = WARN_ONCE(!nilfs_sb_rdonly((sufile)->i_sb), \
 				"unexpected sufile error %d\n", _err) ? \
 				-EIO : -EROFS;				\
 		_err;							\
diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
index 2e3b591c117c..edb7d379ecbd 100644
--- a/fs/nilfs2/super.c
+++ b/fs/nilfs2/super.c
@@ -137,12 +137,13 @@ void __nilfs_error(struct super_block *sb, const char *function,
 
 	va_end(args);
 
-	if (!sb_rdonly(sb)) {
+	if (!nilfs_sb_rdonly(sb)) {
 		nilfs_set_error(sb);
 
 		if (nilfs_test_opt(nilfs, ERRORS_RO)) {
 			printk(KERN_CRIT "Remounting filesystem read-only\n");
-			sb->s_flags |= SB_RDONLY;
+			/* SB_RDONLY needs s_umount, see sb_set_emergency_ro(). */
+			sb_set_emergency_ro(sb);
 		}
 	}
 
@@ -508,7 +509,7 @@ static void nilfs_put_super(struct super_block *sb)
 
 	nilfs_detach_log_writer(sb);
 
-	if (!sb_rdonly(sb)) {
+	if (!nilfs_sb_rdonly(sb)) {
 		down_write(&nilfs->ns_sem);
 		nilfs_cleanup_super(sb);
 		up_write(&nilfs->ns_sem);
@@ -529,6 +530,10 @@ static int nilfs_sync_fs(struct super_block *sb, int wait)
 	struct nilfs_super_block **sbp;
 	int err = 0;
 
+	/* Nothing may be written after an error made us read-only. */
+	if (sb_emergency_ro(sb))
+		return 0;
+
 	/* This function is called when super block should be written back */
 	if (wait)
 		err = nilfs_construct_segment(sb);
@@ -588,7 +593,7 @@ static int nilfs_freeze(struct super_block *sb)
 	struct the_nilfs *nilfs = sb->s_fs_info;
 	int err;
 
-	if (sb_rdonly(sb))
+	if (nilfs_sb_rdonly(sb))
 		return 0;
 
 	/* Mark super block clean */
@@ -602,7 +607,7 @@ static int nilfs_unfreeze(struct super_block *sb)
 {
 	struct the_nilfs *nilfs = sb->s_fs_info;
 
-	if (sb_rdonly(sb))
+	if (nilfs_sb_rdonly(sb))
 		return 0;
 
 	down_write(&nilfs->ns_sem);
@@ -1083,7 +1088,7 @@ nilfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto failed_unload;
 	}
 
-	if (!sb_rdonly(sb)) {
+	if (!nilfs_sb_rdonly(sb)) {
 		err = nilfs_attach_log_writer(sb, fsroot);
 		if (err)
 			goto failed_checkpoint;
@@ -1095,7 +1100,7 @@ nilfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	nilfs_put_root(fsroot);
 
-	if (!sb_rdonly(sb)) {
+	if (!nilfs_sb_rdonly(sb)) {
 		down_write(&nilfs->ns_sem);
 		nilfs_setup_super(sb, true);
 		up_write(&nilfs->ns_sem);
@@ -1141,6 +1146,10 @@ static int nilfs_reconfigure(struct fs_context *fc)
 	if (fc->sb_flags & SB_RDONLY) {
 		sb->s_flags |= SB_RDONLY;
 
+		/* After an error nothing may be written, just go read-only. */
+		if (sb_emergency_ro(sb))
+			goto out;
+
 		/*
 		 * Remounting a valid RW partition RDONLY, so set
 		 * the RDONLY flag and then mark the partition as valid again.
@@ -1152,6 +1161,12 @@ static int nilfs_reconfigure(struct fs_context *fc)
 		__u64 features;
 		struct nilfs_root *root;
 
+		/* The VFS doesn't refuse this when nilfs_get_tree() calls us. */
+		if (sb_emergency_ro(sb)) {
+			err = -EROFS;
+			goto ignore_opts;
+		}
+
 		/*
 		 * Mounting a RDONLY partition read-write, so reread and
 		 * store the current valid flag.  (It may have been changed
diff --git a/fs/nilfs2/the_nilfs.h b/fs/nilfs2/the_nilfs.h
index 4776a70f01ae..f90d5bd6e7d3 100644
--- a/fs/nilfs2/the_nilfs.h
+++ b/fs/nilfs2/the_nilfs.h
@@ -205,6 +205,12 @@ THE_NILFS_FNS(GC_RUNNING, gc_running)
 THE_NILFS_FNS(SB_DIRTY, sb_dirty)
 THE_NILFS_FNS(PURGING, purging)
 
+/* Mounted read-only or read-only after an error. */
+static inline bool nilfs_sb_rdonly(struct super_block *sb)
+{
+	return sb_rdonly(sb) || sb_emergency_ro(sb);
+}
+
 /*
  * Mount option operations
  */

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
