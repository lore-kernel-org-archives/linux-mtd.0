Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E68E732C5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Sep 2023 11:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cr9EAaWG6BjjE5kwfxzMYFWHo5vSrbXvZ+oYF81dcjM=; b=fmSC9ZTipNC3Ee
	HhVjI2L0FwYQxPK1Xlambpatr5BpkkkptHTw0jbQaR1qEUIM5tDW/zwOFtMIqCSs2NGSFy+RCrZfR
	4fYYbsj255V4VqiJXxJTo3usywpSi+87IaI5ICLN+/uLzJZKxL3Lopazmo7pRfOf/cIIp8JT4tL8S
	jtVPIHqvMzdzU9Tt4wIoJUpiEi3x2cLf33iESiLfUfqcmCyS8X/QnUCDrSK38rsQFpf9qS1bOtZuL
	S7C9AZDPxcjGpmqWeYAxTzCcypdvDKXWdmvWJlYSVxN+UfeKoDWiOCU0Fw+m3CahQdRaOyUG299w5
	BrGFbrR7HyTFlEeqlC3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qloq7-00348X-0H;
	Thu, 28 Sep 2023 11:05:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlopy-00340m-20
	for linux-mtd@lists.infradead.org;
	Thu, 28 Sep 2023 11:05:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 27EBFCE1D1B;
	Thu, 28 Sep 2023 11:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21C7C433D9;
	Thu, 28 Sep 2023 11:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695899139;
	bh=cv9SfrcWZVkYk2VwTVipTu4sbLCE/zDatfr5PCjqSsM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aBWgry+MO4CAf8ojhH5BUiO+kaKaN0QSsdwxd/10AFlKcGJqs3K5H7OpSGFJt0ff7
	 zQLqXY+djgEUh96ZgrvVgMWBdKiDWAdLLiZoe6ak1cuQSluttx1lOPfhaeU8N1cRyB
	 uf4d1OTYSe2adQMAaOWXYZzqCFm4goKmKAf35sukCRoXD/UU4wTrUd/3svGHJD6drS
	 8F5UD3aaykDkCsNTSM51LQWIT1h+oFkeu5HUPp+tpXxk4gspkrjJfcz2pYkBv6+mbD
	 s+l2O+THemnyOGnQAOSddW6M94NpYX4Ovg8glIfK8hv+K6QFiayIA4QbXuIHB/mBQX
	 l0k4PrQvJ3cNA==
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 72/87] fs/ubifs: convert to new inode {a,m}time accessors
Date: Thu, 28 Sep 2023 07:03:21 -0400
Message-ID: <20230928110413.33032-71-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928110413.33032-1-jlayton@kernel.org>
References: <20230928110300.32891-1-jlayton@kernel.org>
 <20230928110413.33032-1-jlayton@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_040543_351980_6FFBE000 
X-CRM114-Status: GOOD (  15.23  )
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

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ubifs/debug.c   |  8 ++++----
 fs/ubifs/dir.c     | 23 +++++++++++++++--------
 fs/ubifs/file.c    | 16 ++++++++--------
 fs/ubifs/journal.c |  8 ++++----
 fs/ubifs/super.c   |  8 ++++----
 5 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index eef9e527d9ff..ef9c39e3f39a 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -237,11 +237,11 @@ void ubifs_dump_inode(struct ubifs_info *c, const struct inode *inode)
 	pr_err("\tuid            %u\n", (unsigned int)i_uid_read(inode));
 	pr_err("\tgid            %u\n", (unsigned int)i_gid_read(inode));
 	pr_err("\tatime          %u.%u\n",
-	       (unsigned int)inode->i_atime.tv_sec,
-	       (unsigned int)inode->i_atime.tv_nsec);
+	       (unsigned int) inode_get_atime(inode).tv_sec,
+	       (unsigned int) inode_get_atime(inode).tv_nsec);
 	pr_err("\tmtime          %u.%u\n",
-	       (unsigned int)inode->i_mtime.tv_sec,
-	       (unsigned int)inode->i_mtime.tv_nsec);
+	       (unsigned int) inode_get_mtime(inode).tv_sec,
+	       (unsigned int) inode_get_mtime(inode).tv_nsec);
 	pr_err("\tctime          %u.%u\n",
 	       (unsigned int) inode_get_ctime(inode).tv_sec,
 	       (unsigned int) inode_get_ctime(inode).tv_nsec);
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 2f48c58d47cd..7af442de44c3 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -96,7 +96,7 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 	inode->i_flags |= S_NOCMTIME;
 
 	inode_init_owner(&nop_mnt_idmap, inode, dir, mode);
-	inode->i_mtime = inode->i_atime = inode_set_ctime_current(inode);
+	simple_inode_init_ts(inode);
 	inode->i_mapping->nrpages = 0;
 
 	if (!is_xattr) {
@@ -324,7 +324,8 @@ static int ubifs_create(struct mnt_idmap *idmap, struct inode *dir,
 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
-	dir->i_mtime = inode_set_ctime_to_ts(dir, inode_get_ctime(inode));
+	inode_set_mtime_to_ts(dir,
+			      inode_set_ctime_to_ts(dir, inode_get_ctime(inode)));
 	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err)
 		goto out_cancel;
@@ -767,7 +768,8 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	inode_set_ctime_current(inode);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
-	dir->i_mtime = inode_set_ctime_to_ts(dir, inode_get_ctime(inode));
+	inode_set_mtime_to_ts(dir,
+			      inode_set_ctime_to_ts(dir, inode_get_ctime(inode)));
 	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err)
 		goto out_cancel;
@@ -841,7 +843,8 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 	drop_nlink(inode);
 	dir->i_size -= sz_change;
 	dir_ui->ui_size = dir->i_size;
-	dir->i_mtime = inode_set_ctime_to_ts(dir, inode_get_ctime(inode));
+	inode_set_mtime_to_ts(dir,
+			      inode_set_ctime_to_ts(dir, inode_get_ctime(inode)));
 	err = ubifs_jnl_update(c, dir, &nm, inode, 1, 0);
 	if (err)
 		goto out_cancel;
@@ -944,7 +947,8 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 	drop_nlink(dir);
 	dir->i_size -= sz_change;
 	dir_ui->ui_size = dir->i_size;
-	dir->i_mtime = inode_set_ctime_to_ts(dir, inode_get_ctime(inode));
+	inode_set_mtime_to_ts(dir,
+			      inode_set_ctime_to_ts(dir, inode_get_ctime(inode)));
 	err = ubifs_jnl_update(c, dir, &nm, inode, 1, 0);
 	if (err)
 		goto out_cancel;
@@ -1018,7 +1022,8 @@ static int ubifs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	inc_nlink(dir);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
-	dir->i_mtime = inode_set_ctime_to_ts(dir, inode_get_ctime(inode));
+	inode_set_mtime_to_ts(dir,
+			      inode_set_ctime_to_ts(dir, inode_get_ctime(inode)));
 	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err) {
 		ubifs_err(c, "cannot create directory, error %d", err);
@@ -1109,7 +1114,8 @@ static int ubifs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
-	dir->i_mtime = inode_set_ctime_to_ts(dir, inode_get_ctime(inode));
+	inode_set_mtime_to_ts(dir,
+			      inode_set_ctime_to_ts(dir, inode_get_ctime(inode)));
 	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err)
 		goto out_cancel;
@@ -1209,7 +1215,8 @@ static int ubifs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
-	dir->i_mtime = inode_set_ctime_to_ts(dir, inode_get_ctime(inode));
+	inode_set_mtime_to_ts(dir,
+			      inode_set_ctime_to_ts(dir, inode_get_ctime(inode)));
 	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0);
 	if (err)
 		goto out_cancel;
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index e5382f0b2587..2e65fd2dbdc3 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1088,9 +1088,9 @@ static void do_attr_changes(struct inode *inode, const struct iattr *attr)
 	if (attr->ia_valid & ATTR_GID)
 		inode->i_gid = attr->ia_gid;
 	if (attr->ia_valid & ATTR_ATIME)
-		inode->i_atime = attr->ia_atime;
+		inode_set_atime_to_ts(inode, attr->ia_atime);
 	if (attr->ia_valid & ATTR_MTIME)
-		inode->i_mtime = attr->ia_mtime;
+		inode_set_mtime_to_ts(inode, attr->ia_mtime);
 	if (attr->ia_valid & ATTR_CTIME)
 		inode_set_ctime_to_ts(inode, attr->ia_ctime);
 	if (attr->ia_valid & ATTR_MODE) {
@@ -1192,7 +1192,7 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 	mutex_lock(&ui->ui_mutex);
 	ui->ui_size = inode->i_size;
 	/* Truncation changes inode [mc]time */
-	inode->i_mtime = inode_set_ctime_current(inode);
+	inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
 	/* Other attributes may be changed at the same time as well */
 	do_attr_changes(inode, attr);
 	err = ubifs_jnl_truncate(c, inode, old_size, new_size);
@@ -1239,7 +1239,7 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
 	mutex_lock(&ui->ui_mutex);
 	if (attr->ia_valid & ATTR_SIZE) {
 		/* Truncation changes inode [mc]time */
-		inode->i_mtime = inode_set_ctime_current(inode);
+		inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
 		/* 'truncate_setsize()' changed @i_size, update @ui_size */
 		ui->ui_size = inode->i_size;
 	}
@@ -1365,9 +1365,9 @@ static inline int mctime_update_needed(const struct inode *inode,
 				       const struct timespec64 *now)
 {
 	struct timespec64 ctime = inode_get_ctime(inode);
+	struct timespec64 mtime = inode_get_mtime(inode);
 
-	if (!timespec64_equal(&inode->i_mtime, now) ||
-	    !timespec64_equal(&ctime, now))
+	if (!timespec64_equal(&mtime, now) || !timespec64_equal(&ctime, now))
 		return 1;
 	return 0;
 }
@@ -1429,7 +1429,7 @@ static int update_mctime(struct inode *inode)
 			return err;
 
 		mutex_lock(&ui->ui_mutex);
-		inode->i_mtime = inode_set_ctime_current(inode);
+		inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
 		release = ui->dirty;
 		mark_inode_dirty_sync(inode);
 		mutex_unlock(&ui->ui_mutex);
@@ -1567,7 +1567,7 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 		struct ubifs_inode *ui = ubifs_inode(inode);
 
 		mutex_lock(&ui->ui_mutex);
-		inode->i_mtime = inode_set_ctime_current(inode);
+		inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
 		release = ui->dirty;
 		mark_inode_dirty_sync(inode);
 		mutex_unlock(&ui->ui_mutex);
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index ffc9beee7be6..79d148357f81 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -452,12 +452,12 @@ static void pack_inode(struct ubifs_info *c, struct ubifs_ino_node *ino,
 	ino->ch.node_type = UBIFS_INO_NODE;
 	ino_key_init_flash(c, &ino->key, inode->i_ino);
 	ino->creat_sqnum = cpu_to_le64(ui->creat_sqnum);
-	ino->atime_sec  = cpu_to_le64(inode->i_atime.tv_sec);
-	ino->atime_nsec = cpu_to_le32(inode->i_atime.tv_nsec);
+	ino->atime_sec  = cpu_to_le64(inode_get_atime(inode).tv_sec);
+	ino->atime_nsec = cpu_to_le32(inode_get_atime(inode).tv_nsec);
 	ino->ctime_sec  = cpu_to_le64(inode_get_ctime(inode).tv_sec);
 	ino->ctime_nsec = cpu_to_le32(inode_get_ctime(inode).tv_nsec);
-	ino->mtime_sec  = cpu_to_le64(inode->i_mtime.tv_sec);
-	ino->mtime_nsec = cpu_to_le32(inode->i_mtime.tv_nsec);
+	ino->mtime_sec  = cpu_to_le64(inode_get_mtime(inode).tv_sec);
+	ino->mtime_nsec = cpu_to_le32(inode_get_mtime(inode).tv_nsec);
 	ino->uid   = cpu_to_le32(i_uid_read(inode));
 	ino->gid   = cpu_to_le32(i_gid_read(inode));
 	ino->mode  = cpu_to_le32(inode->i_mode);
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b08fb28d16b5..366941d4a18a 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -142,10 +142,10 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 	set_nlink(inode, le32_to_cpu(ino->nlink));
 	i_uid_write(inode, le32_to_cpu(ino->uid));
 	i_gid_write(inode, le32_to_cpu(ino->gid));
-	inode->i_atime.tv_sec  = (int64_t)le64_to_cpu(ino->atime_sec);
-	inode->i_atime.tv_nsec = le32_to_cpu(ino->atime_nsec);
-	inode->i_mtime.tv_sec  = (int64_t)le64_to_cpu(ino->mtime_sec);
-	inode->i_mtime.tv_nsec = le32_to_cpu(ino->mtime_nsec);
+	inode_set_atime(inode, (int64_t)le64_to_cpu(ino->atime_sec),
+			le32_to_cpu(ino->atime_nsec));
+	inode_set_mtime(inode, (int64_t)le64_to_cpu(ino->mtime_sec),
+			le32_to_cpu(ino->mtime_nsec));
 	inode_set_ctime(inode, (int64_t)le64_to_cpu(ino->ctime_sec),
 			le32_to_cpu(ino->ctime_nsec));
 	inode->i_mode = le32_to_cpu(ino->mode);
-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
