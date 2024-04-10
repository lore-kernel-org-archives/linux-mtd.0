Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82375CD1297
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 07:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPz9TNBgaz8B1sqomZpM+/RCC5UqN+k1JAYqEDYN9MI=; b=J5dURW1ePxjFY+
	phrPjhhyJ+ipH+h+Ld69K0G8WufJGBFIc/+VlRUDopCt0KxaIK6Dox4mQ7BQUZycH9bG+8JXf0fYl
	PKRhfqijJmy/nxCLOJciMU4erUwMDVFQRUfnn/3B8cSJnklL2l3hdsbomTqbgGrDNCYTB42+tUm9s
	x9sRC0kkLHU0cadzSWKlQHbIBIkP7Y4HVcE/9/27i0vyPVf8IpiXv4LY41PjAHANhgkN6wiII1gPn
	1lUAlSYEfoU2g2ZxXI83jLSaWIGnMv4NOhhk92Pyr/Umzb19OfV/8j7cKtoHu/9BcJFP+MQpClRRy
	KGE/62o5rr3AzR+o8kWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSfJ-00000005gL1-0nSz;
	Wed, 10 Apr 2024 07:46:41 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSf9-00000005gBs-04hY
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 07:46:34 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4VDvvm4zTJz1RC8Q;
	Wed, 10 Apr 2024 15:43:32 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id C804218001A;
	Wed, 10 Apr 2024 15:46:24 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 15:46:22 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
Subject: [PATCH 8/9] ubifs: Fix unattached inode when powercut happens in creating
Date: Wed, 10 Apr 2024 15:37:50 +0800
Message-ID: <20240410073751.2522830-9-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410073751.2522830-1-chengzhihao1@huawei.com>
References: <20240410073751.2522830-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_004631_482962_33AE1332 
X-CRM114-Status: GOOD (  21.15  )
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

For selinux or encryption scenarios, UBIFS could become inconsistent
while creating new files in powercut case. Encryption/selinux related
xattrs will be created before creating file dentry, which makes creation
process is not atomic, details are shown as:

Encryption case:
ubifs_create
 ubifs_new_inode
  fscrypt_set_context
   ubifs_xattr_set
    create_xattr
     ubifs_jnl_update  // Disk: xentry xinode inode(LAST_OF_NODE_GROUP)
 >> power cut <<
 ubifs_jnl_update  // Disk: dentry inode parent_inode(LAST_OF_NODE_GROUP)

Selinux case:
ubifs_create
 ubifs_new_inode
 ubifs_init_security
  security_inode_init_security
   ubifs_xattr_set
    create_xattr
     ubifs_jnl_update  // Disk: xentry xinode inode(LAST_OF_NODE_GROUP)
 >> power cut <<
 ubifs_jnl_update  // Disk: dentry inode parent_inode(LAST_OF_NODE_GROUP)

Above process will make chk_fs failed in next mounting:
 UBIFS error (ubi0:0 pid 7995): dbg_check_filesystem [ubifs]: inode 66
 nlink is 1, but calculated nlink is 0

Fix it by allocating orphan inode for each non-xattr file creation, then
removing orphan list in journal writing process, which ensures that both
xattr and dentry be effective in atomic when powercut happens.

Fixes: d7f0b70d30ff ("UBIFS: Add security.* XATTR support for the UBIFS")
Fixes: d475a507457b ("ubifs: Add skeleton for fscrypto")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218309
Suggested-by: Zhang Yi <yi.zhang@huawei.com>
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/dir.c     | 59 +++++++++++++++++++++++++++++++---------------
 fs/ubifs/journal.c | 14 +++++++----
 fs/ubifs/ubifs.h   |  4 ++--
 3 files changed, 51 insertions(+), 26 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index fe16443243ab..c77ea57fe696 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -71,8 +71,13 @@ static int inherit_flags(const struct inode *dir, umode_t mode)
  * @is_xattr: whether the inode is xattr inode
  *
  * This function finds an unused inode number, allocates new inode and
- * initializes it. Returns new inode in case of success and an error code in
- * case of failure.
+ * initializes it. Non-xattr new inode may be written with xattrs(selinux/
+ * encryption) before writing dentry, which could cause inconsistent problem
+ * when powercut happens between two operations. To deal with it, non-xattr
+ * new inode is initialized with zero-nlink and added into orphan list, caller
+ * should make sure that inode is relinked later, and make sure that orphan
+ * removing and journal writing into an committing atomic operation. Returns
+ * new inode in case of success and an error code in case of failure.
  */
 struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 			      umode_t mode, bool is_xattr)
@@ -163,9 +168,25 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 	ui->creat_sqnum = ++c->max_sqnum;
 	spin_unlock(&c->cnt_lock);
 
+	if (!is_xattr) {
+		set_nlink(inode, 0);
+		err = ubifs_add_orphan(c, inode->i_ino);
+		if (err) {
+			ubifs_err(c, "ubifs_add_orphan failed: %i", err);
+			goto out_iput;
+		}
+		down_read(&c->commit_sem);
+		ui->del_cmtno = c->cmt_no;
+		up_read(&c->commit_sem);
+	}
+
 	if (encrypted) {
 		err = fscrypt_set_context(inode, NULL);
 		if (err) {
+			if (!is_xattr) {
+				set_nlink(inode, 1);
+				ubifs_delete_orphan(c, inode->i_ino);
+			}
 			ubifs_err(c, "fscrypt_set_context failed: %i", err);
 			goto out_iput;
 		}
@@ -320,12 +341,13 @@ static int ubifs_create(struct mnt_idmap *idmap, struct inode *dir,
 	if (err)
 		goto out_inode;
 
+	set_nlink(inode, 1);
 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
 	inode_set_mtime_to_ts(dir,
 			      inode_set_ctime_to_ts(dir, inode_get_ctime(inode)));
-	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0, 0);
+	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0, 1);
 	if (err)
 		goto out_cancel;
 	mutex_unlock(&dir_ui->ui_mutex);
@@ -340,8 +362,8 @@ static int ubifs_create(struct mnt_idmap *idmap, struct inode *dir,
 	dir->i_size -= sz_change;
 	dir_ui->ui_size = dir->i_size;
 	mutex_unlock(&dir_ui->ui_mutex);
+	set_nlink(inode, 0);
 out_inode:
-	make_bad_inode(inode);
 	iput(inode);
 out_fname:
 	fscrypt_free_filename(&nm);
@@ -386,7 +408,6 @@ static struct inode *create_whiteout(struct inode *dir, struct dentry *dentry)
 	return inode;
 
 out_inode:
-	make_bad_inode(inode);
 	iput(inode);
 out_free:
 	ubifs_err(c, "cannot create whiteout file, error %d", err);
@@ -470,6 +491,7 @@ static int ubifs_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
 	if (err)
 		goto out_inode;
 
+	set_nlink(inode, 1);
 	mutex_lock(&ui->ui_mutex);
 	insert_inode_hash(inode);
 	d_tmpfile(file, inode);
@@ -479,7 +501,7 @@ static int ubifs_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
 	mutex_unlock(&ui->ui_mutex);
 
 	lock_2_inodes(dir, inode);
-	err = ubifs_jnl_update(c, dir, &nm, inode, 1, 0, 0);
+	err = ubifs_jnl_update(c, dir, &nm, inode, 1, 0, 1);
 	if (err)
 		goto out_cancel;
 	unlock_2_inodes(dir, inode);
@@ -492,7 +514,6 @@ static int ubifs_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
 out_cancel:
 	unlock_2_inodes(dir, inode);
 out_inode:
-	make_bad_inode(inode);
 	if (!instantiated)
 		iput(inode);
 out_budg:
@@ -1011,6 +1032,7 @@ static int ubifs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	if (err)
 		goto out_inode;
 
+	set_nlink(inode, 1);
 	mutex_lock(&dir_ui->ui_mutex);
 	insert_inode_hash(inode);
 	inc_nlink(inode);
@@ -1019,7 +1041,7 @@ static int ubifs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	dir_ui->ui_size = dir->i_size;
 	inode_set_mtime_to_ts(dir,
 			      inode_set_ctime_to_ts(dir, inode_get_ctime(inode)));
-	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0, 0);
+	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0, 1);
 	if (err) {
 		ubifs_err(c, "cannot create directory, error %d", err);
 		goto out_cancel;
@@ -1036,8 +1058,8 @@ static int ubifs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	dir_ui->ui_size = dir->i_size;
 	drop_nlink(dir);
 	mutex_unlock(&dir_ui->ui_mutex);
+	set_nlink(inode, 0);
 out_inode:
-	make_bad_inode(inode);
 	iput(inode);
 out_fname:
 	fscrypt_free_filename(&nm);
@@ -1107,13 +1129,14 @@ static int ubifs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	ui = ubifs_inode(inode);
 	ui->data = dev;
 	ui->data_len = devlen;
+	set_nlink(inode, 1);
 
 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
 	inode_set_mtime_to_ts(dir,
 			      inode_set_ctime_to_ts(dir, inode_get_ctime(inode)));
-	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0, 0);
+	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0, 1);
 	if (err)
 		goto out_cancel;
 	mutex_unlock(&dir_ui->ui_mutex);
@@ -1128,8 +1151,8 @@ static int ubifs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	dir->i_size -= sz_change;
 	dir_ui->ui_size = dir->i_size;
 	mutex_unlock(&dir_ui->ui_mutex);
+	set_nlink(inode, 0);
 out_inode:
-	make_bad_inode(inode);
 	iput(inode);
 out_fname:
 	fscrypt_free_filename(&nm);
@@ -1208,13 +1231,14 @@ static int ubifs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	 */
 	ui->data_len = disk_link.len - 1;
 	inode->i_size = ubifs_inode(inode)->ui_size = disk_link.len - 1;
+	set_nlink(inode, 1);
 
 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
 	inode_set_mtime_to_ts(dir,
 			      inode_set_ctime_to_ts(dir, inode_get_ctime(inode)));
-	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0, 0);
+	err = ubifs_jnl_update(c, dir, &nm, inode, 0, 0, 1);
 	if (err)
 		goto out_cancel;
 	mutex_unlock(&dir_ui->ui_mutex);
@@ -1228,10 +1252,10 @@ static int ubifs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	dir->i_size -= sz_change;
 	dir_ui->ui_size = dir->i_size;
 	mutex_unlock(&dir_ui->ui_mutex);
+	set_nlink(inode, 0);
 out_inode:
 	/* Free inode->i_link before inode is marked as bad. */
 	fscrypt_free_inode(inode);
-	make_bad_inode(inode);
 	iput(inode);
 out_fname:
 	fscrypt_free_filename(&nm);
@@ -1399,14 +1423,10 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 		 */
 		err = ubifs_budget_space(c, &wht_req);
 		if (err) {
-			/*
-			 * Whiteout inode can not be written on flash by
-			 * ubifs_jnl_write_inode(), because it's neither
-			 * dirty nor zero-nlink.
-			 */
 			iput(whiteout);
 			goto out_release;
 		}
+		set_nlink(whiteout, 1);
 
 		/* Add the old_dentry size to the old_dir size. */
 		old_sz -= CALC_DENT_SIZE(fname_len(&old_nm));
@@ -1485,7 +1505,7 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 	}
 
 	err = ubifs_jnl_rename(c, old_dir, old_inode, &old_nm, new_dir,
-			       new_inode, &new_nm, whiteout, sync);
+			       new_inode, &new_nm, whiteout, sync, !!whiteout);
 	if (err)
 		goto out_cancel;
 
@@ -1538,6 +1558,7 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 	unlock_4_inodes(old_dir, new_dir, new_inode, whiteout);
 	if (whiteout) {
 		ubifs_release_budget(c, &wht_req);
+		set_nlink(whiteout, 0);
 		iput(whiteout);
 	}
 out_release:
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 3178020ea3c1..4a35f9e8f668 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -643,7 +643,7 @@ static void set_dent_cookie(struct ubifs_info *c, struct ubifs_dent_node *dent)
  * @inode: inode to update
  * @deletion: indicates a directory entry deletion i.e unlink or rmdir
  * @xent: non-zero if the directory entry is an extended attribute entry
- * @delete_orphan: indicates an orphan entry deletion for @inode
+ * @in_orphan: indicates whether the @inode is in orphan list
  *
  * This function updates an inode by writing a directory entry (or extended
  * attribute entry), the inode itself, and the parent directory inode (or the
@@ -665,7 +665,7 @@ static void set_dent_cookie(struct ubifs_info *c, struct ubifs_dent_node *dent)
  */
 int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 		     const struct fscrypt_name *nm, const struct inode *inode,
-		     int deletion, int xent, int delete_orphan)
+		     int deletion, int xent, int in_orphan)
 {
 	int err, dlen, ilen, len, lnum, ino_offs, dent_offs, orphan_added = 0;
 	int aligned_dlen, aligned_ilen, sync = IS_DIRSYNC(dir);
@@ -751,7 +751,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	if (err)
 		goto out_release;
 
-	if (last_reference) {
+	if (last_reference && !in_orphan) {
 		err = ubifs_add_orphan(c, inode->i_ino);
 		if (err) {
 			release_head(c, BASEHD);
@@ -807,7 +807,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	if (err)
 		goto out_ro;
 
-	if (delete_orphan)
+	if (in_orphan && inode->i_nlink)
 		ubifs_delete_orphan(c, inode->i_ino);
 
 	finish_reservation(c);
@@ -1340,6 +1340,7 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
  * @new_nm: new name of the new directory entry
  * @whiteout: whiteout inode
  * @sync: non-zero if the write-buffer has to be synchronized
+ * @delete_orphan: indicates an orphan entry deletion for @whiteout
  *
  * This function implements the re-name operation which may involve writing up
  * to 4 inodes(new inode, whiteout inode, old and new parent directory inodes)
@@ -1352,7 +1353,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 		     const struct inode *new_dir,
 		     const struct inode *new_inode,
 		     const struct fscrypt_name *new_nm,
-		     const struct inode *whiteout, int sync)
+		     const struct inode *whiteout, int sync, int delete_orphan)
 {
 	void *p;
 	union ubifs_key key;
@@ -1569,6 +1570,9 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 			goto out_ro;
 	}
 
+	if (delete_orphan)
+		ubifs_delete_orphan(c, whiteout->i_ino);
+
 	finish_reservation(c);
 	if (new_inode) {
 		mark_inode_clean(c, new_ui);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 14d28c5456f4..12216a159227 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1800,7 +1800,7 @@ int ubifs_consolidate_log(struct ubifs_info *c);
 /* journal.c */
 int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 		     const struct fscrypt_name *nm, const struct inode *inode,
-		     int deletion, int xent, int delete_orphan);
+		     int deletion, int xent, int in_orphan);
 int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 			 const union ubifs_key *key, const void *buf, int len);
 int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode);
@@ -1817,7 +1817,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 		     const struct inode *new_dir,
 		     const struct inode *new_inode,
 		     const struct fscrypt_name *new_nm,
-		     const struct inode *whiteout, int sync);
+		     const struct inode *whiteout, int sync, int delete_orphan);
 int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
 		       loff_t old_size, loff_t new_size);
 int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
