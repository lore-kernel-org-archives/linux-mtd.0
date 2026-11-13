Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A997C606A8BB
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 12:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xmue+GIt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROqB3IOn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ioTe0tVVZW4l1KhfKO2LzWh2ijqw1bXC5voK3r/UPjo=; b=Xmue+GItv25lVyk3KumEB6l9In
	pGyr2mkuD9RzprZMKdLtMC27NXkOit70MBk2ng+SpNrKt3MzZodCLuqysaJ2w+VOfoAhoSZ9R5QZh
	hQ0ANP2FhXfRKsUfI73ARLO72G/U6hYcACItGMO10Wf9PRxzvBhZ5QSzQhL9aDzMHWstp3EcmuLDl
	1nSUeymL6dFry7XzZJs90suWMvcBKiZ6hu1mn11BqfGBuC+A1427wpV8dwfAikYNCpF+NJJVeJNn1
	wZGaYzJNDFm09caacF5ddKFUtvTxriIgL8283tu0i1nUPAk9sEKHBK/xNhVgttW6SjMtJRmWM6xor
	k/cv0oJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpy2-0000000CcQP-0iKM;
	Fri, 13 Nov 2026 12:01:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpy0-0000000CcOw-1RPe
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 12:01:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C209408E9;
	Fri, 13 Nov 2026 12:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127921F000C4;
	Fri, 13 Nov 2026 12:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794571276;
	bh=/YHEqYzi5KXNIwRcZhn83Em4Jwz15A4c49SP6KyvpsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ROqB3IOnFwfdV8L8FloWuGRW9fzjTNujIbxsHPGc6ZIYoXTLVhTZjQqpbFYqwssfy
	 wbNG3roSn2UJqG5xX9LzWsBJLHJACFpGxTcgR4Oo/EW56SzA616NfPWYp0sNE6H8qs
	 RooXVYKq2C14UEtszL1v++YKW8z1YHN5QCZlbbX/5Hcsofc/hmAAhRiCAezMKlifUc
	 mOEqeCi9EgNkof/s0h/sg7i5wDBKeHqwFdWGnMQJ6Uz5ZsEAWwNKFwXp8jsGKphQrL
	 SiqQ/CQP2AZgJkAHZRunIRKmH4DOLqojvqPeInDh6/cJH3rNEO1Qm/l5V7N7UGuNIR
	 pkx2wvDSX1/Ww==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 13 Nov 2026 12:59:11 +0100
Subject: [PATCH v3 15/33] hfsplus: don't set SB_RDONLY when creating the
 attributes tree
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-work-fs-sb_rdonly-v3-15-0be92bb73709@kernel.org>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
To: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, 
 ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-xfs@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Viacheslav Dubeyko <slava@dubeyko.com>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4341; i=brauner@kernel.org;
 h=from:subject:message-id; bh=hq2uWZM7C6gmK9X25gRT9szwb+uBN9yc2jOPMElC9g4=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9+7163lcGr3jlpaG7PNRjpKTusjD2TPE14lpWusM6e
 JWel69BRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwERmaDH8s67S7K+Y9S6t7OO2
 rerlTCLH0i5Mm6Fy0OtF6jSWNcuk4xj+GQuwbE8W2r1cRel5RZjorJrMr4tm7HtXoag+Zaan2VZ
 TdgA=
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

hfs_btree_open() sets SB_RDONLY when the map record of a b-tree doesn't
mark the header node as used. That's fine while mounting. But
hfsplus_create_attributes_file() calls it too when the first extended
attribute is set on a filesystem that has no attributes file yet. That
runs on the live filesystem without s_umount and a filesystem must not
change SB_RDONLY behind the VFS' back.

hfsplus_create_attributes_file() opens a tree it has just created itself
with the header node marked as used, so there's nothing to check there.
Move the check into hfsplus_fill_super() and do it for every tree it
opens. No functional changes.

Suggested-by: Viacheslav Dubeyko <slava@dubeyko.com>
Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/hfsplus/btree.c      | 42 ++++++++++++++++++++++++++++--------------
 fs/hfsplus/hfsplus_fs.h |  1 +
 fs/hfsplus/super.c      |  5 +++++
 3 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/fs/hfsplus/btree.c b/fs/hfsplus/btree.c
index bd4dbdbc8f98c..4a67569050e36 100644
--- a/fs/hfsplus/btree.c
+++ b/fs/hfsplus/btree.c
@@ -270,7 +270,6 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 	struct hfs_btree *tree;
 	struct hfs_btree_header_rec *head;
 	struct address_space *mapping;
-	struct hfs_bnode *node;
 	struct inode *inode;
 	struct page *page;
 	unsigned int size;
@@ -381,19 +380,6 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 	kunmap_local(head);
 	put_page(page);
 
-	node = hfs_bnode_find(tree, HFSPLUS_TREE_HEAD);
-	if (IS_ERR(node))
-		goto free_inode;
-
-	if (!hfs_bmap_test_bit(node, 0)) {
-		pr_warn("(%s): %s (cnid 0x%x) map record invalid or bitmap corruption detected, forcing read-only.\n",
-				sb->s_id, hfs_btree_name(id), id);
-		pr_warn("Run fsck.hfsplus to repair.\n");
-		sb->s_flags |= SB_RDONLY;
-	}
-
-	hfs_bnode_put(node);
-
 	return tree;
 
  fail_page:
@@ -407,6 +393,34 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 	return NULL;
 }
 
+/*
+ * Check the map record of a b-tree at mount. hfs_btree_open() can't do it
+ * because hfsplus_create_attributes_file() calls it on the live filesystem
+ * where SB_RDONLY must not be set.
+ */
+int hfsplus_btree_check_map(struct hfs_btree *tree)
+{
+	struct super_block *sb = tree->sb;
+	struct hfs_bnode *node;
+
+	node = hfs_bnode_find(tree, HFSPLUS_TREE_HEAD);
+	if (IS_ERR(node)) {
+		pr_err("failed to load %s header node\n",
+		       hfs_btree_name(tree->cnid));
+		return PTR_ERR(node);
+	}
+
+	if (!hfs_bmap_test_bit(node, 0)) {
+		pr_warn("(%s): %s (cnid 0x%x) map record invalid or bitmap corruption detected, forcing read-only.\n",
+				sb->s_id, hfs_btree_name(tree->cnid), tree->cnid);
+		pr_warn("Run fsck.hfsplus to repair.\n");
+		sb->s_flags |= SB_RDONLY;
+	}
+
+	hfs_bnode_put(node);
+	return 0;
+}
+
 /* Release resources used by a btree */
 void hfs_btree_close(struct hfs_btree *tree)
 {
diff --git a/fs/hfsplus/hfsplus_fs.h b/fs/hfsplus/hfsplus_fs.h
index 6f240f87f8ff1..58c780b09b6f8 100644
--- a/fs/hfsplus/hfsplus_fs.h
+++ b/fs/hfsplus/hfsplus_fs.h
@@ -362,6 +362,7 @@ int hfsplus_block_free(struct super_block *sb, u32 offset, u32 count);
 u32 hfsplus_calc_btree_clump_size(u32 block_size, u32 node_size, u64 sectors,
 				  int file_id);
 struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id);
+int hfsplus_btree_check_map(struct hfs_btree *tree);
 void hfs_btree_close(struct hfs_btree *tree);
 int hfs_btree_write(struct hfs_btree *tree);
 int hfs_bmap_reserve(struct hfs_btree *tree, u32 rsvd_nodes);
diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
index ff7d6b3336a66..532f23502df3c 100644
--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -564,6 +564,11 @@ static int hfsplus_fill_super(struct super_block *sb, struct fs_context *fc)
 	}
 	sb->s_xattr = hfsplus_xattr_handlers;
 
+	if (hfsplus_btree_check_map(sbi->ext_tree) ||
+	    hfsplus_btree_check_map(sbi->cat_tree) ||
+	    (sbi->attr_tree && hfsplus_btree_check_map(sbi->attr_tree)))
+		goto out_close_attr_tree;
+
 	inode = hfsplus_iget(sb, HFSPLUS_ALLOC_CNID);
 	if (IS_ERR(inode)) {
 		pr_err("failed to load allocation file\n");

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
