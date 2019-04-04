Return-Path: <SRS0=4b6q=SG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFCBC4360F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 22:35:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87AB2206DF
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 22:35:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KgeG6u0g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87AB2206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8T3u5P33cU0fF0smT10X+gW9Cpw36RihWP2y4v54ag=; b=KgeG6u0grM4mnx
	veZ7Yq5tIdhmrGGlp1xwx7KN8m91Ik3DJC5dXKYISbKvfqqjpkieGEugzjVbJO8XLaWmv5N2Hjl+k
	xDrKTcy0iMyeaJ3YkU59t6KO9jFA+sHRxWNgU858swz/nZrUatOqVFI3kzBLwNI5rVT8TAIGdAAOZ
	Ppydy9vtIYsR0nT97X0Y7mYsgaBLLzFRtnmXRXsDqvRSOcYquqIpVj1QIFKqnD0CBJduzMNyhgUMF
	QvzH3wQ8RgOYWg2+GTz1IYgE9gXzSdUjWd65W5G2Y2OJ/ZAWWjjZa2ra4HLT+SWJkjXhQqBlsDpyR
	5rFOKZoEaObjkARvBi2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCAxI-00019Q-9k; Thu, 04 Apr 2019 22:35:32 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCAws-0008Qw-NW
 for linux-mtd@lists.infradead.org; Thu, 04 Apr 2019 22:35:12 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 815B71801445E;
 Fri,  5 Apr 2019 00:35:05 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] ubifs: Limit number of xattrs per inode
Date: Fri,  5 Apr 2019 00:34:38 +0200
Message-Id: <20190404223438.29408-4-richard@nod.at>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190404223438.29408-1-richard@nod.at>
References: <20190404223438.29408-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_153507_392509_C966D4C7 
X-CRM114-Status: GOOD (  17.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, stefan@agner.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Since we have to write one deletion inode per xattr
into the journal, limit the max number of xattrs.

In theory UBIFS supported up to 65535 xattrs per inode.
But this never worked correctly, expect no powercuts happened.
Now we support only as many xattrs as we can store in 50% of a
LEB.
Even for tiny flashes this allows dozens of xattrs per inode,
which is for an embedded filesystem still fine.

In case someone has existing inodes with much more xattrs, it is
still possible to delete them.
UBIFS will fall back to an non-atomic deletion mode.

Reported-by: Stefan Agner <stefan@agner.ch>
Fixes: 1e51764a3c2ac ("UBIFS: add new flash file system")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c     | 15 +++++++++++-
 fs/ubifs/journal.c | 12 +++++++++
 fs/ubifs/misc.h    |  8 ++++++
 fs/ubifs/super.c   |  2 ++
 fs/ubifs/ubifs.h   |  1 +
 fs/ubifs/xattr.c   | 71 ++++++++++++++++++++++++++++++++++++++++++++++++------
 6 files changed, 101 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 5767b373a8ff..8d68e4a51223 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -802,6 +802,10 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 	if (err)
 		return err;
 
+	err = ubifs_purge_xattrs(inode);
+	if (err)
+		return err;
+
 	sz_change = CALC_DENT_SIZE(fname_len(&nm));
 
 	ubifs_assert(c, inode_is_locked(dir));
@@ -912,6 +916,10 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 	if (err)
 		return err;
 
+	err = ubifs_purge_xattrs(inode);
+	if (err)
+		return err;
+
 	sz_change = CALC_DENT_SIZE(fname_len(&nm));
 
 	err = ubifs_budget_space(c, &req);
@@ -1294,9 +1302,14 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 		old_dentry, old_inode->i_ino, old_dir->i_ino,
 		new_dentry, new_dir->i_ino, flags);
 
-	if (unlink)
+	if (unlink) {
 		ubifs_assert(c, inode_is_locked(new_inode));
 
+		err = ubifs_purge_xattrs(new_inode);
+		if (err)
+			return err;
+	}
+
 	if (unlink && is_dir) {
 		err = ubifs_check_dir_empty(new_inode);
 		if (err)
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 4f74d443ca44..74a7306978d0 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -892,6 +892,11 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 		struct inode *xino;
 		struct ubifs_dent_node *xent, *pxent = NULL;
 
+		if (ui->xattr_cnt >= ubifs_xattr_max_cnt(c)) {
+			ubifs_err(c, "Cannot delete inode, it has too much xattrs!");
+			goto out_release;
+		}
+
 		lowest_xent_key(c, &key, inode->i_ino);
 		while (1) {
 			xent = ubifs_tnc_next_ent(c, &key, &nm);
@@ -907,6 +912,13 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 			fname_len(&nm) = le16_to_cpu(xent->nlen);
 
 			xino = ubifs_iget(c->vfs_sb, xent->inum);
+			if (IS_ERR(xino)) {
+				err = PTR_ERR(xino);
+				ubifs_err(c, "dead directory entry '%s', error %d",
+					  xent->name, err);
+				ubifs_ro_mode(c, err);
+				goto out_release;
+			}
 			ubifs_assert(c, ubifs_inode(xino)->xattr);
 
 			clear_nlink(xino);
diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
index 6f87237fdbf4..78a6e97f846e 100644
--- a/fs/ubifs/misc.h
+++ b/fs/ubifs/misc.h
@@ -288,6 +288,14 @@ static inline int ubifs_next_log_lnum(const struct ubifs_info *c, int lnum)
 	return lnum;
 }
 
+static inline int ubifs_xattr_max_cnt(struct ubifs_info *c)
+{
+	int max_xattrs = (c->leb_size / 2) / UBIFS_INO_NODE_SZ;
+
+	ubifs_assert(c, max_xattrs < c->max_orphans);
+	return max_xattrs;
+}
+
 const char *ubifs_assert_action_name(struct ubifs_info *c);
 
 #endif /* __UBIFS_MISC_H__ */
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 12628184772c..300458a4f518 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1548,6 +1548,8 @@ static int mount_ubifs(struct ubifs_info *c)
 		c->bud_bytes, c->bud_bytes >> 10, c->bud_bytes >> 20);
 	dbg_gen("max. seq. number:    %llu", c->max_sqnum);
 	dbg_gen("commit number:       %llu", c->cmt_no);
+	dbg_gen("max. xattrs per inode: %d", ubifs_xattr_max_cnt(c));
+	dbg_gen("max orphans:           %d", c->max_orphans);
 
 	return 0;
 
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index d28102829f6c..cf4b10f24b6d 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -2017,6 +2017,7 @@ int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
 		    size_t size, int flags, bool check_lock);
 ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 			size_t size);
+int ubifs_purge_xattrs(struct inode *host);
 
 #ifdef CONFIG_UBIFS_FS_XATTR
 void ubifs_evict_xattr_inode(struct ubifs_info *c, ino_t xattr_inum);
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index f5ad1ede7990..acab3181ab35 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -60,12 +60,6 @@
 #include <linux/slab.h>
 #include <linux/xattr.h>
 
-/*
- * Limit the number of extended attributes per inode so that the total size
- * (@xattr_size) is guaranteeded to fit in an 'unsigned int'.
- */
-#define MAX_XATTRS_PER_INODE 65535
-
 /*
  * Extended attribute type constants.
  *
@@ -106,7 +100,7 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 				.new_ino_d = ALIGN(size, 8), .dirtied_ino = 1,
 				.dirtied_ino_d = ALIGN(host_ui->data_len, 8) };
 
-	if (host_ui->xattr_cnt >= MAX_XATTRS_PER_INODE) {
+	if (host_ui->xattr_cnt >= ubifs_xattr_max_cnt(c)) {
 		ubifs_err(c, "inode %lu already has too many xattrs (%d), cannot create more",
 			  host->i_ino, host_ui->xattr_cnt);
 		return -ENOSPC;
@@ -507,6 +501,69 @@ static int remove_xattr(struct ubifs_info *c, struct inode *host,
 	return err;
 }
 
+int ubifs_purge_xattrs(struct inode *host)
+{
+	union ubifs_key key;
+	struct ubifs_info *c = host->i_sb->s_fs_info;
+	struct ubifs_dent_node *xent, *pxent = NULL;
+	struct inode *xino;
+	struct fscrypt_name nm = {0};
+	int err;
+
+	if (ubifs_inode(host)->xattr_cnt < ubifs_xattr_max_cnt(c))
+		return 0;
+
+	ubifs_warn(c, "inode %lu has too many xattrs, doing a non-atomic deletion",
+		   host->i_ino);
+
+	lowest_xent_key(c, &key, host->i_ino);
+	while (1) {
+		xent = ubifs_tnc_next_ent(c, &key, &nm);
+		if (IS_ERR(xent)) {
+			err = PTR_ERR(xent);
+			break;
+		}
+
+		fname_name(&nm) = xent->name;
+		fname_len(&nm) = le16_to_cpu(xent->nlen);
+
+		xino = ubifs_iget(c->vfs_sb, xent->inum);
+		if (IS_ERR(xino)) {
+			err = PTR_ERR(xino);
+			ubifs_err(c, "dead directory entry '%s', error %d",
+				  xent->name, err);
+			ubifs_ro_mode(c, err);
+			kfree(pxent);
+			return err;
+		}
+
+		ubifs_assert(c, ubifs_inode(xino)->xattr);
+
+		clear_nlink(xino);
+		err = remove_xattr(c, host, xino, &nm);
+		if (err) {
+			kfree(pxent);
+			iput(xino);
+			ubifs_err(c, "cannot remove xattr, error %d", err);
+			return err;
+		}
+
+		iput(xino);
+
+		kfree(pxent);
+		pxent = xent;
+		key_read(c, &xent->key, &key);
+	}
+
+	kfree(pxent);
+	if (err != -ENOENT) {
+		ubifs_err(c, "cannot find next direntry, error %d", err);
+		return err;
+	}
+
+	return 0;
+}
+
 /**
  * ubifs_evict_xattr_inode - Evict an xattr inode.
  * @c: UBIFS file-system description object
-- 
2.16.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
