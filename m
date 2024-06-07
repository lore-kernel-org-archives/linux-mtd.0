Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C416C27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OexSyVdQIoKQKJoH9WbN5rvtlSm8t9mwWxJLExw7Yik=; b=gtvdfakObFvOGy
	a6VR2qUxIjRZyc/24EjOPMbSTj2Pv/IJ+e0g8S6LihnHFRSCLsHitiPuLzJ9k1eYeFREByHGCAqPf
	VyXEARtQ8WaqWJAWxk5RQpkIaYU2Kjk8M7ijZtfVeGpq/DgH8V3ViIS5QMUvljgOA++LBJdJFwnCO
	LhR3JkdFmM93yQ0pHrdUyZQ7ERJw5gacyn7UT2QvuhygkMB6RuYnuCF/a8GzEy2guBtxQFrOOO9Aw
	Lp+rACLuof0/QLot9+ux1VqGgM+uFhWbrbqu7MubpWS16OjFiXfPIHD2ReTRBFffdF35RREOTxTvp
	82TK5u6NQDulQFovo08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSDb-0000000CV1D-3tJJ;
	Fri, 07 Jun 2024 05:32:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCR-0000000CGoQ-3ic6
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ss5dm8ipy5f2y8crPHWfd+DBjDbik31e9sb9V0JhNI4=; b=SM39QOGWCNJDrMwBJx0UPGmhwC
	3wpvPVH4+VBu7HUS+wGDVS+KStAK1gj5gDaJv2NvSQv4D5BVVPD1OEcHRLOJvA15Op05BN/x2lZGg
	YYXuazbQR04uQvwDLDtrI4ql7N3uKLjVrPis7BOgK57rnhccR8HiQCiT7UQ1Ee+T0j2A722dHx8Z5
	a1UghOOG5tViHcPhRYdtiYJLpvQ2myNhSjIkztF/5TYMihE7CuQ+AV4zyE6sb8xy5bu/10UCYorYy
	dBtLVvHhAuG3MKAtSxFR1ljWKu+hDc0POuFw8qEfbO8cd2pZwIZcr5xI0qbsRbquEWX57UHGbgyw0
	h/uMU3fA==;
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCN-00000004Tsa-0StF
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:34 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VwSk74CfJz1SB59;
	Fri,  7 Jun 2024 12:23:27 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 52BDA180AA6;
	Fri,  7 Jun 2024 12:27:26 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:16 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 067/110] fsck.ubifs: rebuild_fs: Extract reachable directory entries tree
Date: Fri, 7 Jun 2024 12:25:32 +0800
Message-ID: <20240607042615.2069840-68-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052731_774128_1EA30558 
X-CRM114-Status: GOOD (  15.55  )
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

This is the 5/12 step of rebuilding. Extract reachable directory entries
tree. Make sure that all files can be searched from '/', unreachable
file is deleted. So, all files can be accessible in userspace after
reparing.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/extract_files.c | 94 ++++++++++++++++++++++++++++++++++
 ubifs-utils/fsck.ubifs/fsck.ubifs.h    |  6 +++
 ubifs-utils/fsck.ubifs/rebuild_fs.c    | 44 ++++++++++++++++
 3 files changed, 144 insertions(+)

diff --git a/ubifs-utils/fsck.ubifs/extract_files.c b/ubifs-utils/fsck.ubifs/extract_files.c
index 772e3003..dd5cb310 100644
--- a/ubifs-utils/fsck.ubifs/extract_files.c
+++ b/ubifs-utils/fsck.ubifs/extract_files.c
@@ -525,6 +525,7 @@ static int update_file(struct ubifs_info *c, struct scanned_file *file,
 	{
 		struct scanned_dent_node *dent = (struct scanned_dent_node *)sn;
 
+		dent->file = file;
 		err = insert_file_dentry(file, dent);
 		break;
 	}
@@ -888,3 +889,96 @@ check_dent_node:
 
 	return true;
 }
+
+static bool dentry_is_reachable(struct ubifs_info *c,
+				struct scanned_dent_node *dent_node,
+				struct list_head *path_list,
+				struct rb_root *file_tree)
+{
+	struct scanned_file *parent_file = NULL;
+	struct scanned_dent_node *dn, *parent_dent;
+	struct rb_node *p;
+
+	/* Check whether the path is cyclical. */
+	list_for_each_entry(dn, path_list, list) {
+		if (dn == dent_node)
+			return false;
+	}
+
+	/* Quick path, dentry has already been checked as reachable. */
+	if (dent_node->can_be_found)
+		return true;
+
+	dent_node->can_be_found = true;
+	list_add(&dent_node->list, path_list);
+
+	parent_file = lookup_file(file_tree, key_inum(c, &dent_node->key));
+	/* Parent dentry is not found, unreachable. */
+	if (!parent_file)
+		return false;
+
+	/* Parent dentry is '/', reachable. */
+	if (parent_file->inum == UBIFS_ROOT_INO)
+		return true;
+
+	p = rb_first(&parent_file->dent_nodes);
+	if (!p)
+		return false;
+	parent_dent = rb_entry(p, struct scanned_dent_node, rb);
+
+	return dentry_is_reachable(c, parent_dent, path_list, file_tree);
+}
+
+/**
+ * file_is_reachable - whether the file can be found from '/'.
+ * @c: UBIFS file-system description object
+ * @file: file object
+ * @file_tree: tree of all scanned files
+ *
+ * This function iterates all directory entries in given @file and checks
+ * whether each dentry is reachable. All unreachable directory entries will
+ * be removed.
+ */
+bool file_is_reachable(struct ubifs_info *c, struct scanned_file *file,
+		       struct rb_root *file_tree)
+{
+	struct rb_node *node;
+	struct scanned_dent_node *dent_node;
+
+	if (file->inum == UBIFS_ROOT_INO)
+		goto reachable;
+
+retry:
+	for (node = rb_first(&file->dent_nodes); node; node = rb_next(node)) {
+		LIST_HEAD(path_list);
+
+		dent_node = rb_entry(node, struct scanned_dent_node, rb);
+
+		if (dentry_is_reachable(c, dent_node, &path_list, file_tree))
+			continue;
+
+		while (!list_empty(&path_list)) {
+			dent_node = list_entry(path_list.next,
+					       struct scanned_dent_node, list);
+
+			dbg_fsck("remove unreachable dentry %s, in %s",
+				 c->encrypted && !file->ino.is_xattr ?
+				 "<encrypted>" : dent_node->name, c->dev_name);
+			list_del(&dent_node->list);
+			rb_erase(&dent_node->rb, &dent_node->file->dent_nodes);
+			kfree(dent_node);
+		}
+
+		/* Since dentry node is removed from rb-tree, rescan rb-tree. */
+		goto retry;
+	}
+
+	if (!rb_first(&file->dent_nodes)) {
+		dbg_fsck("file %lu is unreachable, in %s", file->inum, c->dev_name);
+		return false;
+	}
+
+reachable:
+	dbg_fsck("file %lu is reachable, in %s", file->inum, c->dev_name);
+	return true;
+}
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index 3885d138..d378a06c 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -39,6 +39,8 @@ enum { NORMAL_MODE = 0, SAFE_MODE, DANGER_MODE0,
 /* Types of inconsistent problems */
 enum { SB_CORRUPTED = 0 };
 
+struct scanned_file;
+
 /**
  * scanned_node - common header node.
  * @exist: whether the node is found by scanning
@@ -92,6 +94,7 @@ struct scanned_ino_node {
  * @nlen: name length
  * @name: dentry name
  * @inum: target inode number
+ * @file: corresponding file
  * @rb: link in the trees of:
  *  1) valid dentry nodes or deleted dentry node
  *  2) all scanned dentry nodes from same file
@@ -105,6 +108,7 @@ struct scanned_dent_node {
 	unsigned int nlen;
 	char name[UBIFS_MAX_NLEN + 1];
 	ino_t inum;
+	struct scanned_file *file;
 	struct rb_node rb;
 	struct list_head list;
 };
@@ -266,6 +270,8 @@ void destroy_file_tree(struct ubifs_info *c, struct rb_root *file_tree);
 struct scanned_file *lookup_file(struct rb_root *file_tree, ino_t inum);
 bool file_is_valid(struct ubifs_info *c, struct scanned_file *file,
 		   struct rb_root *file_tree);
+bool file_is_reachable(struct ubifs_info *c, struct scanned_file *file,
+		       struct rb_root *file_tree);
 
 /* rebuild_fs.c */
 int ubifs_rebuild_filesystem(struct ubifs_info *c);
diff --git a/ubifs-utils/fsck.ubifs/rebuild_fs.c b/ubifs-utils/fsck.ubifs/rebuild_fs.c
index 31f1b3ba..669b61d1 100644
--- a/ubifs-utils/fsck.ubifs/rebuild_fs.c
+++ b/ubifs-utils/fsck.ubifs/rebuild_fs.c
@@ -588,6 +588,46 @@ static void filter_invalid_files(struct ubifs_info *c)
 }
 
 /**
+ * extract_dentry_tree - extract reachable directory entries.
+ * @c: UBIFS file-system description object
+ *
+ * This function iterates all directory entries and remove those
+ * unreachable ones. 'Unreachable' means that a directory entry can
+ * not be searched from '/'.
+ */
+static void extract_dentry_tree(struct ubifs_info *c)
+{
+	struct rb_node *node;
+	struct scanned_file *file;
+	struct rb_root *tree = &FSCK(c)->rebuild->scanned_files;
+	LIST_HEAD(unreachable);
+
+	for (node = rb_first(tree); node; node = rb_next(node)) {
+		file = rb_entry(node, struct scanned_file, rb);
+
+		/*
+		 * Since all xattr files are already attached to corresponding
+		 * host file, there are only non-xattr files in the file tree.
+		 */
+		ubifs_assert(c, !file->ino.is_xattr);
+		if (!file_is_reachable(c, file, tree))
+			list_add(&file->list, &unreachable);
+	}
+
+	/* Remove unreachable files. */
+	while (!list_empty(&unreachable)) {
+		file = list_entry(unreachable.next, struct scanned_file, list);
+
+		dbg_fsck("remove unreachable file %lu, in %s",
+			 file->inum, c->dev_name);
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
@@ -633,6 +673,10 @@ int ubifs_rebuild_filesystem(struct ubifs_info *c)
 	log_out(c, "Filter invalid files");
 	filter_invalid_files(c);
 
+	/* Step 5: Extract reachable directory entries. */
+	log_out(c, "Extract reachable files");
+	extract_dentry_tree(c);
+
 out:
 	destroy_scanned_info(c, &si);
 	destroy_rebuild_info(c);
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
