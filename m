Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91703C47BC4
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jan 2026 07:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTAYcl+8sZOpe4oBMH2QoOYzp6kqqv8RapAfm/3I1wY=; b=a9Y3zxotdGOdWZ
	qbsiR91ApFsy3HbaBKBAya+2U5Hzq8yY4rVOpUgQPEzpu80jBJZ5qfPkoysSrHjaeA6Co0wXomesC
	DVlQG76pp+i/+tqYqYFUrysbKOFc05DmK8XE29c2OHfnyH8W6C+k2iQbABjYy89Jl74scP/gY5M6J
	t7eJUpuJbndomFA9/cmIrUqaer7tHDk8q+J4b4fQbYQ4noSNVnIdMiRVIJqF5r2zorkDVq/UrgTjW
	KCwRsNctCD4RkM0yCcwZu7Y3X22935ryD92VQlrmeF2Jdli+NoN2bYCzzW84ip3gHXBy2BbMbg8RD
	Ez98yxXf54i63/tHEswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1mT-0000000CY2A-3GfB;
	Tue, 06 Jan 2026 07:47:05 +0000
Received: from [213.208.157.59] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1mS-0000000CXx5-1jD6;
	Tue, 06 Jan 2026 07:47:04 +0000
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
Subject: [PATCH 04/11] fat: cleanup the flags for fat_truncate_time
Date: Tue,  6 Jan 2026 08:44:58 +0100
Message-ID: <20260106074628.1609575-5-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106074628.1609575-1-hch@lst.de>
References: <20260106074628.1609575-1-hch@lst.de>
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

Fat only has a single on-disk timestamp covering ctime and mtime.  Add
fat-specific flags that indicate which timestamp fat_truncate_time should
update to make this more clear.  This allows removing no-op
fat_truncate_time calls with the S_CTIME flag and prepares for removing
the S_* flags.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/fat/dir.c         |  2 +-
 fs/fat/fat.h         |  8 ++++----
 fs/fat/file.c        | 14 ++++++--------
 fs/fat/inode.c       |  2 +-
 fs/fat/misc.c        | 39 ++++++++++++++++-----------------------
 fs/fat/namei_msdos.c | 13 +++++--------
 fs/fat/namei_vfat.c  |  9 ++++-----
 7 files changed, 37 insertions(+), 50 deletions(-)

diff --git a/fs/fat/dir.c b/fs/fat/dir.c
index 92b091783966..3d03bff40944 100644
--- a/fs/fat/dir.c
+++ b/fs/fat/dir.c
@@ -1080,7 +1080,7 @@ int fat_remove_entries(struct inode *dir, struct fat_slot_info *sinfo)
 		}
 	}
 
-	fat_truncate_time(dir, NULL, S_ATIME|S_MTIME);
+	fat_truncate_time(dir, NULL, FAT_UPDATE_ATIME | FAT_UPDATE_CMTIME);
 	if (IS_DIRSYNC(dir))
 		(void)fat_sync_inode(dir);
 	else
diff --git a/fs/fat/fat.h b/fs/fat/fat.h
index d3e426de5f01..767b566b1cab 100644
--- a/fs/fat/fat.h
+++ b/fs/fat/fat.h
@@ -468,10 +468,10 @@ extern void fat_time_unix2fat(struct msdos_sb_info *sbi, struct timespec64 *ts,
 			      __le16 *time, __le16 *date, u8 *time_cs);
 extern struct timespec64 fat_truncate_atime(const struct msdos_sb_info *sbi,
 					    const struct timespec64 *ts);
-extern struct timespec64 fat_truncate_mtime(const struct msdos_sb_info *sbi,
-					    const struct timespec64 *ts);
-extern int fat_truncate_time(struct inode *inode, struct timespec64 *now,
-			     int flags);
+#define FAT_UPDATE_ATIME	(1u << 0)
+#define FAT_UPDATE_CMTIME	(1u << 1)
+void fat_truncate_time(struct inode *inode, struct timespec64 *now,
+		unsigned int flags);
 extern int fat_update_time(struct inode *inode, int flags);
 extern int fat_sync_bhs(struct buffer_head **bhs, int nr_bhs);
 
diff --git a/fs/fat/file.c b/fs/fat/file.c
index 4fc49a614fb8..f9bc93411aa2 100644
--- a/fs/fat/file.c
+++ b/fs/fat/file.c
@@ -224,7 +224,7 @@ static int fat_cont_expand(struct inode *inode, loff_t size)
 	if (err)
 		goto out;
 
-	fat_truncate_time(inode, NULL, S_CTIME|S_MTIME);
+	fat_truncate_time(inode, NULL, FAT_UPDATE_CMTIME);
 	mark_inode_dirty(inode);
 	if (IS_SYNC(inode)) {
 		int err2;
@@ -327,7 +327,7 @@ static int fat_free(struct inode *inode, int skip)
 		MSDOS_I(inode)->i_logstart = 0;
 	}
 	MSDOS_I(inode)->i_attrs |= ATTR_ARCH;
-	fat_truncate_time(inode, NULL, S_CTIME|S_MTIME);
+	fat_truncate_time(inode, NULL, FAT_UPDATE_CMTIME);
 	if (wait) {
 		err = fat_sync_inode(inode);
 		if (err) {
@@ -553,15 +553,13 @@ int fat_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	}
 
 	/*
-	 * setattr_copy can't truncate these appropriately, so we'll
-	 * copy them ourselves
+	 * setattr_copy can't truncate these appropriately, so we'll copy them
+	 * ourselves.  See fat_truncate_time for the c/mtime logic on fat.
 	 */
 	if (attr->ia_valid & ATTR_ATIME)
-		fat_truncate_time(inode, &attr->ia_atime, S_ATIME);
-	if (attr->ia_valid & ATTR_CTIME)
-		fat_truncate_time(inode, &attr->ia_ctime, S_CTIME);
+		fat_truncate_time(inode, &attr->ia_atime, FAT_UPDATE_ATIME);
 	if (attr->ia_valid & ATTR_MTIME)
-		fat_truncate_time(inode, &attr->ia_mtime, S_MTIME);
+		fat_truncate_time(inode, &attr->ia_mtime, FAT_UPDATE_CMTIME);
 	attr->ia_valid &= ~(ATTR_ATIME|ATTR_CTIME|ATTR_MTIME);
 
 	setattr_copy(idmap, inode, attr);
diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index 0b6009cd1844..59fa90617b5b 100644
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -246,7 +246,7 @@ static int fat_write_end(const struct kiocb *iocb,
 	if (err < len)
 		fat_write_failed(mapping, pos + len);
 	if (!(err < 0) && !(MSDOS_I(inode)->i_attrs & ATTR_ARCH)) {
-		fat_truncate_time(inode, NULL, S_CTIME|S_MTIME);
+		fat_truncate_time(inode, NULL, FAT_UPDATE_CMTIME);
 		MSDOS_I(inode)->i_attrs |= ATTR_ARCH;
 		mark_inode_dirty(inode);
 	}
diff --git a/fs/fat/misc.c b/fs/fat/misc.c
index 950da09f0961..f4a1fa58bf05 100644
--- a/fs/fat/misc.c
+++ b/fs/fat/misc.c
@@ -299,43 +299,36 @@ struct timespec64 fat_truncate_atime(const struct msdos_sb_info *sbi,
 }
 
 /*
- * truncate mtime to 2 second granularity
- */
-struct timespec64 fat_truncate_mtime(const struct msdos_sb_info *sbi,
-				     const struct timespec64 *ts)
-{
-	return fat_timespec64_trunc_2secs(*ts);
-}
-
-/*
- * truncate the various times with appropriate granularity:
- *   all times in root node are always 0
+ * Update the in-inode atime and/or mtime after truncating the timestamp to the
+ * granularity.  All timestamps in root inode are always 0.
+ *
+ * ctime and mtime share the same on-disk field, and should be identical in
+ * memory.  All mtime updates will be applied to ctime, but ctime updates are
+ * ignored.
  */
-int fat_truncate_time(struct inode *inode, struct timespec64 *now, int flags)
+void fat_truncate_time(struct inode *inode, struct timespec64 *now,
+		unsigned int flags)
 {
 	struct msdos_sb_info *sbi = MSDOS_SB(inode->i_sb);
 	struct timespec64 ts;
 
 	if (inode->i_ino == MSDOS_ROOT_INO)
-		return 0;
+		return;
 
 	if (now == NULL) {
 		now = &ts;
 		ts = current_time(inode);
 	}
 
-	if (flags & S_ATIME)
+	if (flags & FAT_UPDATE_ATIME)
 		inode_set_atime_to_ts(inode, fat_truncate_atime(sbi, now));
-	/*
-	 * ctime and mtime share the same on-disk field, and should be
-	 * identical in memory. all mtime updates will be applied to ctime,
-	 * but ctime updates are ignored.
-	 */
-	if (flags & S_MTIME)
-		inode_set_mtime_to_ts(inode,
-				      inode_set_ctime_to_ts(inode, fat_truncate_mtime(sbi, now)));
+	if (flags & FAT_UPDATE_CMTIME) {
+		/* truncate mtime to 2 second granularity */
+		struct timespec64 mtime = fat_timespec64_trunc_2secs(*now);
 
-	return 0;
+		inode_set_mtime_to_ts(inode, mtime);
+		inode_set_ctime_to_ts(inode, mtime);
+	}
 }
 EXPORT_SYMBOL_GPL(fat_truncate_time);
 
diff --git a/fs/fat/namei_msdos.c b/fs/fat/namei_msdos.c
index 0b920ee40a7f..ba0152ed0810 100644
--- a/fs/fat/namei_msdos.c
+++ b/fs/fat/namei_msdos.c
@@ -251,7 +251,7 @@ static int msdos_add_entry(struct inode *dir, const unsigned char *name,
 	if (err)
 		return err;
 
-	fat_truncate_time(dir, ts, S_CTIME|S_MTIME);
+	fat_truncate_time(dir, ts, FAT_UPDATE_CMTIME);
 	if (IS_DIRSYNC(dir))
 		(void)fat_sync_inode(dir);
 	else
@@ -295,7 +295,7 @@ static int msdos_create(struct mnt_idmap *idmap, struct inode *dir,
 		err = PTR_ERR(inode);
 		goto out;
 	}
-	fat_truncate_time(inode, &ts, S_ATIME|S_CTIME|S_MTIME);
+	fat_truncate_time(inode, &ts, FAT_UPDATE_ATIME | FAT_UPDATE_CMTIME);
 	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
 
 	d_instantiate(dentry, inode);
@@ -328,7 +328,6 @@ static int msdos_rmdir(struct inode *dir, struct dentry *dentry)
 	drop_nlink(dir);
 
 	clear_nlink(inode);
-	fat_truncate_time(inode, NULL, S_CTIME);
 	fat_detach(inode);
 out:
 	mutex_unlock(&MSDOS_SB(sb)->s_lock);
@@ -382,7 +381,7 @@ static struct dentry *msdos_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 		goto out;
 	}
 	set_nlink(inode, 2);
-	fat_truncate_time(inode, &ts, S_ATIME|S_CTIME|S_MTIME);
+	fat_truncate_time(inode, &ts, FAT_UPDATE_ATIME | FAT_UPDATE_CMTIME);
 	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
 
 	d_instantiate(dentry, inode);
@@ -415,7 +414,6 @@ static int msdos_unlink(struct inode *dir, struct dentry *dentry)
 	if (err)
 		goto out;
 	clear_nlink(inode);
-	fat_truncate_time(inode, NULL, S_CTIME);
 	fat_detach(inode);
 out:
 	mutex_unlock(&MSDOS_SB(sb)->s_lock);
@@ -480,7 +478,7 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
 				mark_inode_dirty(old_inode);
 
 			inode_inc_iversion(old_dir);
-			fat_truncate_time(old_dir, NULL, S_CTIME|S_MTIME);
+			fat_truncate_time(old_dir, NULL, FAT_UPDATE_CMTIME);
 			if (IS_DIRSYNC(old_dir))
 				(void)fat_sync_inode(old_dir);
 			else
@@ -540,7 +538,7 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
 	if (err)
 		goto error_dotdot;
 	inode_inc_iversion(old_dir);
-	fat_truncate_time(old_dir, &ts, S_CTIME|S_MTIME);
+	fat_truncate_time(old_dir, &ts, FAT_UPDATE_CMTIME);
 	if (IS_DIRSYNC(old_dir))
 		(void)fat_sync_inode(old_dir);
 	else
@@ -550,7 +548,6 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
 		drop_nlink(new_inode);
 		if (is_dir)
 			drop_nlink(new_inode);
-		fat_truncate_time(new_inode, &ts, S_CTIME);
 	}
 out:
 	brelse(sinfo.bh);
diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
index 5dbc4cbb8fce..e46f34cade1a 100644
--- a/fs/fat/namei_vfat.c
+++ b/fs/fat/namei_vfat.c
@@ -676,7 +676,7 @@ static int vfat_add_entry(struct inode *dir, const struct qstr *qname,
 		goto cleanup;
 
 	/* update timestamp */
-	fat_truncate_time(dir, ts, S_CTIME|S_MTIME);
+	fat_truncate_time(dir, ts, FAT_UPDATE_CMTIME);
 	if (IS_DIRSYNC(dir))
 		(void)fat_sync_inode(dir);
 	else
@@ -806,7 +806,7 @@ static int vfat_rmdir(struct inode *dir, struct dentry *dentry)
 	drop_nlink(dir);
 
 	clear_nlink(inode);
-	fat_truncate_time(inode, NULL, S_ATIME|S_MTIME);
+	fat_truncate_time(inode, NULL, FAT_UPDATE_ATIME | FAT_UPDATE_CMTIME);
 	fat_detach(inode);
 	vfat_d_version_set(dentry, inode_query_iversion(dir));
 out:
@@ -832,7 +832,7 @@ static int vfat_unlink(struct inode *dir, struct dentry *dentry)
 	if (err)
 		goto out;
 	clear_nlink(inode);
-	fat_truncate_time(inode, NULL, S_ATIME|S_MTIME);
+	fat_truncate_time(inode, NULL, FAT_UPDATE_ATIME | FAT_UPDATE_CMTIME);
 	fat_detach(inode);
 	vfat_d_version_set(dentry, inode_query_iversion(dir));
 out:
@@ -918,7 +918,7 @@ static int vfat_update_dotdot_de(struct inode *dir, struct inode *inode,
 static void vfat_update_dir_metadata(struct inode *dir, struct timespec64 *ts)
 {
 	inode_inc_iversion(dir);
-	fat_truncate_time(dir, ts, S_CTIME | S_MTIME);
+	fat_truncate_time(dir, ts, FAT_UPDATE_CMTIME);
 	if (IS_DIRSYNC(dir))
 		(void)fat_sync_inode(dir);
 	else
@@ -996,7 +996,6 @@ static int vfat_rename(struct inode *old_dir, struct dentry *old_dentry,
 		drop_nlink(new_inode);
 		if (is_dir)
 			drop_nlink(new_inode);
-		fat_truncate_time(new_inode, &ts, S_CTIME);
 	}
 out:
 	brelse(sinfo.bh);
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
