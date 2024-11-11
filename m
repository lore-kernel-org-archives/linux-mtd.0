Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A382D2E9C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2PD9QU2g/7VwJu0UYJn0C2CPFDQjVxmZYBqYAKshIFw=; b=vJqbIgYIsU7aOl
	H454w7sQwkjiFM36U48j415LSqySN9sfywiBkd4NGgHFBBdaWzIGxqtXrZ+lH9KYO1JPNf1DualU8
	Mq1binBtMODRpUu6ci1QGR4zEDfwyifl8C4AYXQ05o9/9u99Dost8yM5LoUaVrO4FzPWRNIox4iL9
	qBOO3bTHSg7iv4Vl+rIHS6cw3ep+FAaVp3HerbGzOoSUY6en8i7ljW8dmJX6hMhrCdHgmn1YNkAL5
	m1SclbcEbG1OKeqWCJ+ywHOuQD8HI3mcC3p+9Bdt5BK4aJ/GAAtdcqQgICw1Yzl1lPTjRCP7CYdu0
	my1hVyKQOPQ5lHE53KRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQKk-0000000GyYr-0wk3;
	Mon, 11 Nov 2024 09:03:42 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQJq-0000000Gxmg-0W56
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:02:56 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xn3Rl29h9zpZQ8;
	Mon, 11 Nov 2024 17:00:51 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 6B83A1800A5;
	Mon, 11 Nov 2024 17:02:44 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:02:43 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 057/102] fsck.ubifs: rebuild_fs: Filter invalid files
Date: Mon, 11 Nov 2024 17:01:11 +0800
Message-ID: <20241111090124.2070455-18-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_010246_624529_EC363247 
X-CRM114-Status: GOOD (  24.52  )
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

This is the 4/12 step of rebuilding. Filter out invalid files and drop
them, for example:
 1. File has no inode node or inode nlink is zero
 2. Nonconsistent file type between inode node and dentry nodes
 3. File has no dentry nodes(excepts '/')
 4. Encrypted file has no xattr information
 5. Non regular file has data nodes
 6. Directory/xattr file has more than one dentries
 7. Xattr file has no host inode, or the host inode is a xattr
 ...
Valid xattr file will be inserted into corresponding host file's subtree.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/extract_files.c | 210 +++++++++++++++++++++++++++++++++
 ubifs-utils/fsck.ubifs/fsck.ubifs.h    |   3 +
 ubifs-utils/fsck.ubifs/rebuild_fs.c    |  65 +++++++++-
 ubifs-utils/libubifs/journal.c         |   4 +-
 ubifs-utils/libubifs/ubifs.h           |   3 +
 5 files changed, 282 insertions(+), 3 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/extract_files.c b/ubifs-utils/fsck.ubifs/extract_files.c
index 58aa9db8..772e3003 100644
--- a/ubifs-utils/fsck.ubifs/extract_files.c
+++ b/ubifs-utils/fsck.ubifs/extract_files.c
@@ -678,3 +678,213 @@ void destroy_file_tree(struct ubifs_info *c, struct rb_root *file_tree)
 		kfree(file);
 	}
 }
+
+/**
+ * lookup_file - lookup file according to inode number.
+ * @file_tree: tree of all scanned files
+ * @inum: inode number
+ *
+ * This function lookups target file from @file_tree according to @inum.
+ */
+struct scanned_file *lookup_file(struct rb_root *file_tree, ino_t inum)
+{
+	struct scanned_file *file;
+	struct rb_node *p;
+
+	p = file_tree->rb_node;
+	while (p) {
+		file = rb_entry(p, struct scanned_file, rb);
+
+		if (inum < file->inum)
+			p = p->rb_left;
+		else if (inum > file->inum)
+			p = p->rb_right;
+		else
+			return file;
+	}
+
+	return NULL;
+}
+
+/**
+ * insert_xattr_file - insert xattr file into file's subtree.
+ * @c: UBIFS file-system description object
+ * @xattr_file: xattr file
+ * @host_file: host file
+ *
+ * This inserts xattr file into its' host file's subtree.
+ */
+static void insert_xattr_file(struct ubifs_info *c,
+			      struct scanned_file *xattr_file,
+			      struct scanned_file *host_file)
+{
+	struct scanned_file *tmp_xattr_file;
+	struct rb_node **p, *parent = NULL;
+
+	p = &host_file->xattr_files.rb_node;
+	while (*p) {
+		parent = *p;
+		tmp_xattr_file = rb_entry(parent, struct scanned_file, rb);
+		if (xattr_file->inum < tmp_xattr_file->inum) {
+			p = &(*p)->rb_left;
+		} else if (xattr_file->inum > tmp_xattr_file->inum) {
+			p = &(*p)->rb_right;
+		} else {
+			/* Impossible: Same xattr file is inserted twice. */
+			ubifs_assert(c, 0);
+		}
+	}
+
+	rb_link_node(&xattr_file->rb, parent, p);
+	rb_insert_color(&xattr_file->rb, &host_file->xattr_files);
+}
+
+/**
+ * file_is_valid - check whether the file is valid.
+ * @c: UBIFS file-system description object
+ * @file: file object
+ * @file_tree: tree of all scanned files
+ *
+ * This function checks whether given @file is valid, following checks will
+ * be performed:
+ * 1. All files have none-zero nlink inode, otherwise they are invalid.
+ * 2. The file type comes from inode and dentries should be consistent,
+ *    inconsistent dentries will be deleted.
+ * 3. Directory type or xattr type files only have one dentry. Superfluous
+ *    dentries with lower sequence number will be deleted.
+ * 4. Non-regular file doesn't have data nodes. Data nodes are deleted for
+ *    non-regular file.
+ * 5. All files must have at least one dentries, except '/', '/' doesn't
+ *    have dentries. Non '/' file is invalid if it doesn't have dentries.
+ * 6. Xattr files should have host inode, and host inode cannot be a xattr,
+ *    otherwise they are invalid.
+ * 7. Encrypted files should have corresponding xattrs, otherwise they are
+ *    invalid.
+ * Xattr file will be inserted into corresponding host file's subtree.
+ *
+ * Returns %true is @file is valid, otherwise %false is returned.
+ * Notice: All xattr files should be traversed before non-xattr files, because
+ *         checking item 7 depends on it.
+ */
+bool file_is_valid(struct ubifs_info *c, struct scanned_file *file,
+		   struct rb_root *file_tree)
+{
+	int type;
+	struct rb_node *node;
+	struct scanned_file *parent_file = NULL;
+	struct scanned_dent_node *dent_node;
+	struct scanned_data_node *data_node;
+	LIST_HEAD(drop_list);
+
+	if (!file->ino.header.exist || !file->ino.nlink)
+		return false;
+
+	type = ubifs_get_dent_type(file->ino.mode);
+
+	/* Drop dentry nodes with inconsistent type. */
+	for (node = rb_first(&file->dent_nodes); node; node = rb_next(node)) {
+		int is_xattr = 0;
+
+		dent_node = rb_entry(node, struct scanned_dent_node, rb);
+
+		if (key_type(c, &dent_node->key) == UBIFS_XENT_KEY)
+			is_xattr = 1;
+		if (is_xattr != file->ino.is_xattr || type != dent_node->type)
+			list_add(&dent_node->list, &drop_list);
+	}
+
+	while (!list_empty(&drop_list)) {
+		dent_node = list_entry(drop_list.next, struct scanned_dent_node,
+				       list);
+
+		list_del(&dent_node->list);
+		rb_erase(&dent_node->rb, &file->dent_nodes);
+		kfree(dent_node);
+	}
+
+	if (type != UBIFS_ITYPE_DIR && !file->ino.is_xattr)
+		goto check_data_nodes;
+
+	/*
+	 * Make sure that directory/xattr type files only have one dentry.
+	 * This work should be done in step 3, but file type could be unknown
+	 * for lacking inode information at that time, so do it here.
+	 */
+	node = rb_first(&file->dent_nodes);
+	while (node) {
+		dent_node = rb_entry(node, struct scanned_dent_node, rb);
+		node = rb_next(node);
+		if (!node)
+			break;
+
+		rb_erase(&dent_node->rb, &file->dent_nodes);
+		kfree(dent_node);
+	}
+
+check_data_nodes:
+	if (type == UBIFS_ITYPE_REG && !file->ino.is_xattr)
+		goto check_dent_node;
+
+	/*
+	 * Make sure that non regular type files not have data/trun nodes.
+	 * This work should be done in step 3, but file type could be unknown
+	 * for lacking inode information at that time, so do it here.
+	 */
+	file->trun.header.exist = 0;
+	node = rb_first(&file->data_nodes);
+	while (node) {
+		data_node = rb_entry(node, struct scanned_data_node, rb);
+		node = rb_next(node);
+
+		rb_erase(&data_node->rb, &file->data_nodes);
+		kfree(data_node);
+	}
+
+check_dent_node:
+	if (rb_first(&file->dent_nodes)) {
+		if (file->inum == UBIFS_ROOT_INO)
+			/* '/' has no dentries. */
+			return false;
+
+		node = rb_first(&file->dent_nodes);
+		dent_node = rb_entry(node, struct scanned_dent_node, rb);
+		parent_file = lookup_file(file_tree, key_inum(c, &dent_node->key));
+	} else {
+		/* Non-root files must have dentries. */
+		if (file->inum != UBIFS_ROOT_INO)
+			return false;
+	}
+
+	if (file->ino.is_xattr) {
+		if (!parent_file)
+			/* Host inode is not found. */
+			return false;
+		if (parent_file->ino.is_xattr)
+			/* Host cannot be a xattr file. */
+			return false;
+
+		insert_xattr_file(c, file, parent_file);
+		if (parent_file->ino.is_encrypted) {
+			int nlen = min(dent_node->nlen,
+				   strlen(UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT));
+
+			if (!strncmp(dent_node->name,
+				     UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT, nlen))
+				parent_file->has_encrypted_info = true;
+		}
+	} else {
+		if (parent_file && !S_ISDIR(parent_file->ino.mode))
+			/* Parent file should be directory. */
+			return false;
+
+		/*
+		 * Since xattr files are checked in first round, so all
+		 * non-xattr files's @has_encrypted_info fields have been
+		 * initialized.
+		 */
+		if (file->ino.is_encrypted && !file->has_encrypted_info)
+			return false;
+	}
+
+	return true;
+}
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index df3325e6..81c37160 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -262,6 +262,9 @@ int insert_or_update_file(struct ubifs_info *c, struct rb_root *file_tree,
 			  struct scanned_node *sn, int key_type, ino_t inum);
 void destroy_file_content(struct ubifs_info *c, struct scanned_file *file);
 void destroy_file_tree(struct ubifs_info *c, struct rb_root *file_tree);
+struct scanned_file *lookup_file(struct rb_root *file_tree, ino_t inum);
+bool file_is_valid(struct ubifs_info *c, struct scanned_file *file,
+		   struct rb_root *file_tree);
 
 /* rebuild_fs.c */
 int ubifs_rebuild_filesystem(struct ubifs_info *c);
diff --git a/ubifs-utils/fsck.ubifs/rebuild_fs.c b/ubifs-utils/fsck.ubifs/rebuild_fs.c
index a86430d0..31f1b3ba 100644
--- a/ubifs-utils/fsck.ubifs/rebuild_fs.c
+++ b/ubifs-utils/fsck.ubifs/rebuild_fs.c
@@ -531,6 +531,63 @@ static int add_valid_nodes_into_file(struct ubifs_info *c,
 }
 
 /**
+ * filter_invalid_files - filter out invalid files.
+ * @c: UBIFS file-system description object
+ *
+ * This function filters out invalid files(eg. inconsistent types between
+ * inode and dentry node, or missing inode/dentry node, or encrypted inode
+ * has no encryption related xattrs, etc.).
+ */
+static void filter_invalid_files(struct ubifs_info *c)
+{
+	struct rb_node *node;
+	struct scanned_file *file;
+	struct rb_root *tree = &FSCK(c)->rebuild->scanned_files;
+	LIST_HEAD(tmp_list);
+
+	/* Add all xattr files into a list. */
+	for (node = rb_first(tree); node; node = rb_next(node)) {
+		file = rb_entry(node, struct scanned_file, rb);
+
+		if (file->ino.is_xattr)
+			list_add(&file->list, &tmp_list);
+	}
+
+	/*
+	 * Round 1: Traverse xattr files, check whether the xattr file is
+	 * valid, move valid xattr file into corresponding host file's subtree.
+	 */
+	while (!list_empty(&tmp_list)) {
+		file = list_entry(tmp_list.next, struct scanned_file, list);
+
+		list_del(&file->list);
+		rb_erase(&file->rb, tree);
+		if (!file_is_valid(c, file, tree)) {
+			destroy_file_content(c, file);
+			kfree(file);
+		}
+	}
+
+	/* Round 2: Traverse non-xattr files. */
+	for (node = rb_first(tree); node; node = rb_next(node)) {
+		file = rb_entry(node, struct scanned_file, rb);
+
+		if (!file_is_valid(c, file, tree))
+			list_add(&file->list, &tmp_list);
+	}
+
+	/* Remove invalid files. */
+	while (!list_empty(&tmp_list)) {
+		file = list_entry(tmp_list.next, struct scanned_file, list);
+
+		list_del(&file->list);
+		destroy_file_content(c, file);
+		rb_erase(&file->rb, tree);
+		kfree(file);
+	}
+}
+
+/**
  * ubifs_rebuild_filesystem - Rebuild filesystem.
  * @c: UBIFS file-system description object
  *
@@ -567,8 +624,14 @@ int ubifs_rebuild_filesystem(struct ubifs_info *c)
 	/* Step 3: Add valid nodes into file. */
 	log_out(c, "Add valid nodes into file");
 	err = add_valid_nodes_into_file(c, &si);
-	if (err)
+	if (err) {
 		exit_code |= FSCK_ERROR;
+		goto out;
+	}
+
+	/* Step 4: Drop invalid files. */
+	log_out(c, "Filter invalid files");
+	filter_invalid_files(c);
 
 out:
 	destroy_scanned_info(c, &si);
diff --git a/ubifs-utils/libubifs/journal.c b/ubifs-utils/libubifs/journal.c
index 37dc3f0e..d3fdb76a 100644
--- a/ubifs-utils/libubifs/journal.c
+++ b/ubifs-utils/libubifs/journal.c
@@ -404,10 +404,10 @@ static void finish_reservation(struct ubifs_info *c)
 }
 
 /**
- * get_dent_type - translate VFS inode mode to UBIFS directory entry type.
+ * ubifs_get_dent_type - translate VFS inode mode to UBIFS directory entry type.
  * @mode: inode mode
  */
-static int get_dent_type(int mode)
+int ubifs_get_dent_type(int mode)
 {
 	switch (mode & S_IFMT) {
 	case S_IFREG:
diff --git a/ubifs-utils/libubifs/ubifs.h b/ubifs-utils/libubifs/ubifs.h
index 21b0ce0a..e6de7cea 100644
--- a/ubifs-utils/libubifs/ubifs.h
+++ b/ubifs-utils/libubifs/ubifs.h
@@ -1611,6 +1611,9 @@ int ubifs_log_end_commit(struct ubifs_info *c, int new_ltail_lnum);
 int ubifs_log_post_commit(struct ubifs_info *c, int old_ltail_lnum);
 int ubifs_consolidate_log(struct ubifs_info *c);
 
+/* journal.c */
+int ubifs_get_dent_type(int mode);
+
 /* budget.c */
 int ubifs_budget_space(struct ubifs_info *c, struct ubifs_budget_req *req);
 void ubifs_release_budget(struct ubifs_info *c, struct ubifs_budget_req *req);
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
