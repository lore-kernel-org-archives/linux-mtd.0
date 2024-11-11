Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7413DD5E392
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNNQLEo5glK07hvbIqwSp8+rmTC7teXrzDIGKe/E2D8=; b=2J5p8SE5WcVxvg
	fLMK5zwJ2qjF05fwIB3wYUOOLXZYgNjWNpDZV6b7IAd25N5TlYYlA/97Hz2UzNxxd0UjJncWi7ovP
	XA09bfIgV4QEDE1be9fJ672/E1eZzsHiUgIyJnA/2ywKv9W3kkSsmV7bDnv6/sRRep/nAlF/jy1gs
	BOCb3vDFt19FqDeDIz0IAgTYvLCVpStBdleyKc9uqqxfK71Cc5zhy0b1Zmh981hqpJBE5Zge3aM05
	7q49P9KW5jx/PpTDzHzPBrLbNbyvwonNDelm55B5igg0JmkBVYfU038BB5ZgnCUyz5OE+h/J8oHIR
	G26l8k4XxChgLgXCMSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPbN-0000000GnDw-3jJ5;
	Mon, 11 Nov 2024 08:16:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUd-0000000GZU3-1c77
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AKsgSOubIuPQ7y6B6V/UBxrjjuqf9Rhjh4R4j34zs4A=; b=D8Nbdwh8yqLBxj64nvKA0PQKMY
	pIRdnaLqkXZ9ZYUmVHON6W6z8jtl6UBVWscAarnwAOZhRmMq5BLjFdkGb/tthyP1OjllKFAd23xhf
	I0VBBQP6qZ4svkruhGiMaWaGMgq3L6eourBDrYwM48n9zMD2jE4+0JyIRNEKKaWCAw02dXyodlaCm
	8Y0Sf4+aABTDuqLLLONINggL3uWDx0dSuv8ggMbSHme66PryR59hFhk9VqsRqV5vXOmdJ4Xl1Xyo+
	3ZAbEv1f8xDCr7nJw33Uh2oIYjaZpdzWUmDb6L2yfmHHoMq4tm3p30zwH5d7z6c601BhJAQDxv1ex
	MtjiucHg==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUZ-0000000CmGb-0b0w
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:46 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rl04rZz1jy0x;
	Mon, 11 Nov 2024 15:03:51 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C34C180019;
	Mon, 11 Nov 2024 15:05:38 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:37 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 073/102] fsck.ubifs: Traverse TNC and construct files
Date: Mon, 11 Nov 2024 15:03:16 +0800
Message-ID: <20241111070346.1314122-74-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070544_589822_1A5DC164 
X-CRM114-Status: GOOD (  23.01  )
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

This is the 6/18 step of fsck. Traverse TNC and construct files. There
could be following steps and possible errors:
 Step 1. Traverse TNC, check whether the leaf node is valid, remove invalid
 nodes, construct file for valid node and insert file into file tree.
  a. corrupted node searched from TNC: remove corresponding TNC branch for
     danger mode and normal mode with 'yes' answer, other modes will exit.
  b. corrupted index node read from TNC: danger mode with rebuild_fs and
     normal mode with 'yes' answer will turn to rebuild filesystem, other
     modes will exit.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am              |   3 +-
 ubifs-utils/fsck.ubifs/check_files.c   | 201 ++++++++++++++++++++++++++++++
 ubifs-utils/fsck.ubifs/extract_files.c | 216 ++++++++++++++++++++++++---------
 ubifs-utils/fsck.ubifs/fsck.ubifs.c    |  15 ++-
 ubifs-utils/fsck.ubifs/fsck.ubifs.h    |   6 +-
 ubifs-utils/fsck.ubifs/problem.c       |   6 +
 ubifs-utils/libubifs/debug.c           |  12 +-
 ubifs-utils/libubifs/debug.h           |   1 +
 8 files changed, 395 insertions(+), 65 deletions(-)
 create mode 100644 ubifs-utils/fsck.ubifs/check_files.c

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index a822639e..f88723af 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -84,7 +84,8 @@ fsck_ubifs_SOURCES = \
 	ubifs-utils/fsck.ubifs/problem.c \
 	ubifs-utils/fsck.ubifs/load_fs.c \
 	ubifs-utils/fsck.ubifs/extract_files.c \
-	ubifs-utils/fsck.ubifs/rebuild_fs.c
+	ubifs-utils/fsck.ubifs/rebuild_fs.c \
+	ubifs-utils/fsck.ubifs/check_files.c
 
 fsck_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) \
 		   $(DUMP_STACK_LD) -lm -lpthread
diff --git a/ubifs-utils/fsck.ubifs/check_files.c b/ubifs-utils/fsck.ubifs/check_files.c
new file mode 100644
index 00000000..982c05b7
--- /dev/null
+++ b/ubifs-utils/fsck.ubifs/check_files.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024, Huawei Technologies Co, Ltd.
+ *
+ * Authors: Zhihao Cheng <chengzhihao1@huawei.com>
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "bitops.h"
+#include "kmem.h"
+#include "ubifs.h"
+#include "defs.h"
+#include "debug.h"
+#include "key.h"
+#include "fsck.ubifs.h"
+
+struct invalid_node {
+	union ubifs_key key;
+	int lnum;
+	int offs;
+	struct list_head list;
+};
+
+struct iteration_info {
+	struct list_head invalid_nodes;
+};
+
+static int add_invalid_node(struct ubifs_info *c, union ubifs_key *key,
+			    int lnum, int offs, struct iteration_info *iter)
+{
+	struct invalid_node *in;
+
+	in = kmalloc(sizeof(struct invalid_node), GFP_KERNEL);
+	if (!in) {
+		log_err(c, errno, "can not allocate invalid node");
+		return -ENOMEM;
+	}
+
+	key_copy(c, key, &in->key);
+	in->lnum = lnum;
+	in->offs = offs;
+	list_add(&in->list, &iter->invalid_nodes);
+
+	return 0;
+}
+
+static int construct_file(struct ubifs_info *c, union ubifs_key *key,
+			  int lnum, int offs, void *node,
+			  struct iteration_info *iter)
+{
+	ino_t inum = 0;
+	struct rb_root *tree = &FSCK(c)->scanned_files;
+	struct scanned_node *sn = NULL;
+	struct ubifs_ch *ch = (struct ubifs_ch *)node;
+
+	switch (ch->node_type) {
+	case UBIFS_INO_NODE:
+	{
+		struct scanned_ino_node ino_node;
+
+		if (!parse_ino_node(c, lnum, offs, node, key, &ino_node)) {
+			if (fix_problem(c, INVALID_INO_NODE, NULL))
+				return add_invalid_node(c, key, lnum, offs, iter);
+		}
+		inum = key_inum(c, key);
+		sn = (struct scanned_node *)&ino_node;
+		break;
+	}
+	case UBIFS_DENT_NODE:
+	case UBIFS_XENT_NODE:
+	{
+		struct scanned_dent_node dent_node;
+
+		if (!parse_dent_node(c, lnum, offs, node, key, &dent_node)) {
+			if (fix_problem(c, INVALID_DENT_NODE, NULL))
+				return add_invalid_node(c, key, lnum, offs, iter);
+		}
+		inum = dent_node.inum;
+		sn = (struct scanned_node *)&dent_node;
+		break;
+	}
+	case UBIFS_DATA_NODE:
+	{
+		struct scanned_data_node data_node;
+
+		if (!parse_data_node(c, lnum, offs, node, key, &data_node)) {
+			if (fix_problem(c, INVALID_DATA_NODE, NULL))
+				return add_invalid_node(c, key, lnum, offs, iter);
+		}
+		inum = key_inum(c, key);
+		sn = (struct scanned_node *)&data_node;
+		break;
+	}
+	default:
+		ubifs_assert(c, 0);
+	}
+
+	dbg_fsck("construct file(%lu) for %s node, TNC location %d:%d, in %s",
+		 inum, ubifs_get_key_name(key_type(c, key)), sn->lnum, sn->offs,
+		 c->dev_name);
+	return insert_or_update_file(c, tree, sn, key_type(c, key), inum);
+}
+
+static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
+		      void *priv)
+{
+	void *node;
+	struct iteration_info *iter = (struct iteration_info *)priv;
+	union ubifs_key *key = &zbr->key;
+	int lnum = zbr->lnum, offs = zbr->offs, len = zbr->len, err = 0;
+
+	if (len < UBIFS_CH_SZ) {
+		ubifs_err(c, "bad leaf length %d (LEB %d:%d)",
+			  len, lnum, offs);
+		set_failure_reason_callback(c, FR_TNC_CORRUPTED);
+		return -EINVAL;
+	}
+	if (key_type(c, key) != UBIFS_INO_KEY &&
+	    key_type(c, key) != UBIFS_DATA_KEY &&
+	    key_type(c, key) != UBIFS_DENT_KEY &&
+	    key_type(c, key) != UBIFS_XENT_KEY) {
+		ubifs_err(c, "bad key type %d (LEB %d:%d)",
+			  key_type(c, key), lnum, offs);
+		set_failure_reason_callback(c, FR_TNC_CORRUPTED);
+		return -EINVAL;
+	}
+
+	node = kmalloc(len, GFP_NOFS);
+	if (!node)
+		return -ENOMEM;
+
+	err = ubifs_tnc_read_node(c, zbr, node);
+	if (err) {
+		if (test_and_clear_failure_reason_callback(c, FR_DATA_CORRUPTED)) {
+			if (fix_problem(c, TNC_DATA_CORRUPTED, NULL))
+				err = add_invalid_node(c, key, lnum, offs, iter);
+		}
+		goto out;
+	}
+
+	err = construct_file(c, key, lnum, offs, node, iter);
+
+out:
+	kfree(node);
+	return err;
+}
+
+static int remove_invalid_nodes(struct ubifs_info *c,
+				struct list_head *invalid_nodes, int error)
+{
+	int ret = 0;;
+	struct invalid_node *in;
+
+	while (!list_empty(invalid_nodes)) {
+		in = list_entry(invalid_nodes->next, struct invalid_node, list);
+
+		if (!error) {
+			error = ubifs_tnc_remove_node(c, &in->key, in->lnum, in->offs);
+			if (error) {
+				/* TNC traversing is finished, any TNC path is accessible */
+				ubifs_assert(c, !get_failure_reason_callback(c));
+				ret = error;
+			}
+		}
+
+		list_del(&in->list);
+		kfree(in);
+	}
+
+	return ret;
+}
+
+/**
+ * traverse_tnc_and_construct_files - traverse TNC and construct all files.
+ * @c: UBIFS file-system description object
+ *
+ * This function checks all index nodes and non-index nodes by traversing TNC,
+ * then construct file according to scanned non-index nodes and insert file
+ * into file tree. Returns zero in case of success, a negative error code in
+ * case of failure.
+ */
+int traverse_tnc_and_construct_files(struct ubifs_info *c)
+{
+	int err, ret;
+	struct iteration_info iter;
+
+	FSCK(c)->scanned_files = RB_ROOT;
+	INIT_LIST_HEAD(&iter.invalid_nodes);
+
+	err = dbg_walk_index(c, check_leaf, NULL, &iter);
+
+	ret = remove_invalid_nodes(c, &iter.invalid_nodes, err);
+	if (!err)
+		err = ret;
+
+	if (err)
+		destroy_file_tree(c, &FSCK(c)->scanned_files);
+	return err;
+}
diff --git a/ubifs-utils/fsck.ubifs/extract_files.c b/ubifs-utils/fsck.ubifs/extract_files.c
index c3ab2b76..e9c71a3c 100644
--- a/ubifs-utils/fsck.ubifs/extract_files.c
+++ b/ubifs-utils/fsck.ubifs/extract_files.c
@@ -74,15 +74,24 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	ino_t inum = key_inum(c, key);
 
 	if (!inum || inum > INUM_WATERMARK) {
-		dbg_fsck("bad inode node(bad inum %lu) at %d:%d, in %s",
-			 inum, lnum, offs, c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad inode node(bad inum %lu) at %d:%d, in %s",
+				 inum, lnum, offs, c->dev_name);
+		else
+			log_out(c, "bad inode node(bad inum %lu) at %d:%d",
+				inum, lnum, offs);
 		goto out;
 	}
 
 	if (ch->node_type != key_type(c, key)) {
-		dbg_fsck("bad inode node %lu(inconsistent node type %d vs key_type %d) at %d:%d, in %s",
-			 inum, ch->node_type, key_type(c, key),
-			 lnum, offs, c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad inode node %lu(inconsistent node type %d vs key_type %d) at %d:%d, in %s",
+				 inum, ch->node_type, key_type(c, key),
+				 lnum, offs, c->dev_name);
+		else
+			log_out(c, "bad inode node %lu(inconsistent node type %d vs key_type %d) at %d:%d",
+				inum, ch->node_type, key_type(c, key),
+				lnum, offs);
 		goto out;
 	}
 
@@ -101,60 +110,101 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	ino_node->size = le64_to_cpu(ino->size);
 
 	if (inum == UBIFS_ROOT_INO && !S_ISDIR(ino_node->mode)) {
-		dbg_fsck("bad inode node %lu(root inode is not dir, tyoe %u) at %d:%d, in %s",
-			 inum, ino_node->mode & S_IFMT, lnum, offs, c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad inode node %lu(root inode is not dir, tyoe %u) at %d:%d, in %s",
+				 inum, ino_node->mode & S_IFMT, lnum, offs,
+				 c->dev_name);
+		else
+			log_out(c, "bad inode node %lu(root inode is not dir, tyoe %u) at %d:%d",
+				inum, ino_node->mode & S_IFMT, lnum, offs);
 		goto out;
 	}
 
 	if (ino_node->size > c->max_inode_sz) {
-		dbg_fsck("bad inode node %lu(size %llu is too large) at %d:%d, in %s",
-			 inum, ino_node->size, lnum, offs, c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad inode node %lu(size %llu is too large) at %d:%d, in %s",
+				 inum, ino_node->size, lnum, offs, c->dev_name);
+		else
+			log_out(c, "bad inode node %lu(size %llu is too large) at %d:%d",
+				inum, ino_node->size, lnum, offs);
 		goto out;
 	}
 
 	if (le16_to_cpu(ino->compr_type) >= UBIFS_COMPR_TYPES_CNT) {
-		dbg_fsck("bad inode node %lu(unknown compression type %d) at %d:%d, in %s",
-			 inum, le16_to_cpu(ino->compr_type), lnum, offs,
-			 c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad inode node %lu(unknown compression type %d) at %d:%d, in %s",
+				 inum, le16_to_cpu(ino->compr_type), lnum, offs,
+				 c->dev_name);
+		else
+			log_out(c, "bad inode node %lu(unknown compression type %d) at %d:%d",
+				inum, le16_to_cpu(ino->compr_type), lnum, offs);
 		goto out;
 	}
 
 	if (ino_node->xnms + ino_node->xcnt > XATTR_LIST_MAX) {
-		dbg_fsck("bad inode node %lu(too big xnames %u xcount %u) at %d:%d, in %s",
-			 inum, ino_node->xnms, ino_node->xcnt,
-			 lnum, offs, c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad inode node %lu(too big xnames %u xcount %u) at %d:%d, in %s",
+				 inum, ino_node->xnms, ino_node->xcnt,
+				 lnum, offs, c->dev_name);
+		else
+			log_out(c, "bad inode node %lu(too big xnames %u xcount %u) at %d:%d",
+				inum, ino_node->xnms, ino_node->xcnt,
+				lnum, offs);
 		goto out;
 	}
 
 	if (data_len < 0 || data_len > UBIFS_MAX_INO_DATA) {
-		dbg_fsck("bad inode node %lu(invalid data len %d) at %d:%d, in %s",
-			 inum, data_len, lnum, offs, c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad inode node %lu(invalid data len %d) at %d:%d, in %s",
+				 inum, data_len, lnum, offs, c->dev_name);
+		else
+			log_out(c, "bad inode node %lu(invalid data len %d) at %d:%d",
+				inum, data_len, lnum, offs);
 		goto out;
 	}
 
 	if (UBIFS_INO_NODE_SZ + data_len != node_len) {
-		dbg_fsck("bad inode node %lu(inconsistent data len %d vs node len %d) at %d:%d, in %s",
-			 inum, data_len, node_len, lnum, offs, c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad inode node %lu(inconsistent data len %d vs node len %d) at %d:%d, in %s",
+				 inum, data_len, node_len, lnum, offs, c->dev_name);
+		else
+			log_out(c, "bad inode node %lu(inconsistent data len %d vs node len %d) at %d:%d",
+				inum, data_len, node_len, lnum, offs);
 		goto out;
 	}
 
 	if (ino_node->is_xattr) {
 		if (!S_ISREG(ino_node->mode)) {
-			dbg_fsck("bad inode node %lu(bad type %u for xattr) at %d:%d, in %s",
-				 inum, ino_node->mode & S_IFMT,
-				 lnum, offs, c->dev_name);
+			if (FSCK(c)->mode == REBUILD_MODE)
+				dbg_fsck("bad inode node %lu(bad type %u for xattr) at %d:%d, in %s",
+					 inum, ino_node->mode & S_IFMT,
+					 lnum, offs, c->dev_name);
+			else
+				log_out(c, "bad inode node %lu(bad type %u for xattr) at %d:%d",
+					inum, ino_node->mode & S_IFMT,
+					lnum, offs);
 			goto out;
 		}
 		if (data_len != ino_node->size) {
-			dbg_fsck("bad inode node %lu(inconsistent data_len %d vs size %llu for xattr) at %d:%d, in %s",
-				 inum, data_len, ino_node->size,
-				 lnum, offs, c->dev_name);
+			if (FSCK(c)->mode == REBUILD_MODE)
+				dbg_fsck("bad inode node %lu(inconsistent data_len %d vs size %llu for xattr) at %d:%d, in %s",
+					 inum, data_len, ino_node->size,
+					 lnum, offs, c->dev_name);
+			else
+				log_out(c, "bad inode node %lu(inconsistent data_len %d vs size %llu for xattr) at %d:%d",
+					inum, data_len, ino_node->size,
+					lnum, offs);
 			goto out;
 		}
 		if (ino_node->xcnt || ino_node->xsz || ino_node->xnms) {
-			dbg_fsck("bad inode node %lu(non zero xattr count %u xattr size %u xattr names %u for xattr) at %d:%d, in %s",
-				 inum, ino_node->xcnt, ino_node->xsz,
-				 ino_node->xnms, lnum, offs, c->dev_name);
+			if (FSCK(c)->mode == REBUILD_MODE)
+				dbg_fsck("bad inode node %lu(non zero xattr count %u xattr size %u xattr names %u for xattr) at %d:%d, in %s",
+					 inum, ino_node->xcnt, ino_node->xsz,
+					 ino_node->xnms, lnum, offs, c->dev_name);
+			else
+				log_out(c, "bad inode node %lu(non zero xattr count %u xattr size %u xattr names %u for xattr) at %d:%d",
+					inum, ino_node->xcnt, ino_node->xsz,
+					ino_node->xnms, lnum, offs);
 			goto out;
 		}
 	}
@@ -162,15 +212,23 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	switch (ino_node->mode & S_IFMT) {
 	case S_IFREG:
 		if (!ino_node->is_xattr && data_len != 0) {
-			dbg_fsck("bad inode node %lu(bad data len %d for reg file) at %d:%d, in %s",
-				 inum, data_len, lnum, offs, c->dev_name);
+			if (FSCK(c)->mode == REBUILD_MODE)
+				dbg_fsck("bad inode node %lu(bad data len %d for reg file) at %d:%d, in %s",
+					 inum, data_len, lnum, offs, c->dev_name);
+			else
+				log_out(c, "bad inode node %lu(bad data len %d for reg file) at %d:%d",
+					inum, data_len, lnum, offs);
 			goto out;
 		}
 		break;
 	case S_IFDIR:
 		if (data_len != 0) {
-			dbg_fsck("bad inode node %lu(bad data len %d for dir file) at %d:%d, in %s",
-				 inum, data_len, lnum, offs, c->dev_name);
+			if (FSCK(c)->mode == REBUILD_MODE)
+				dbg_fsck("bad inode node %lu(bad data len %d for dir file) at %d:%d, in %s",
+					 inum, data_len, lnum, offs, c->dev_name);
+			else
+				log_out(c, "bad inode node %lu(bad data len %d for dir file) at %d:%d",
+					inum, data_len, lnum, offs);
 			goto out;
 		}
 		break;
@@ -187,8 +245,12 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 			 * Just drop the inode node when above class of
 			 * exceptions are found.
 			 */
-			dbg_fsck("bad symlink inode node %lu(bad data len %d) at %d:%d, in %s",
-				 inum, data_len, lnum, offs, c->dev_name);
+			if (FSCK(c)->mode == REBUILD_MODE)
+				dbg_fsck("bad symlink inode node %lu(bad data len %d) at %d:%d, in %s",
+					 inum, data_len, lnum, offs, c->dev_name);
+			else
+				log_out(c, "bad symlink inode node %lu(bad data len %d) at %d:%d",
+					inum, data_len, lnum, offs);
 			goto out;
 		}
 		break;
@@ -200,9 +262,14 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 		int sz_new = sizeof(dev->new), sz_huge = sizeof(dev->huge);
 
 		if (data_len != sz_new && data_len != sz_huge) {
-			dbg_fsck("bad inode node %lu(bad data len %d for char/block file, expect %d or %d) at %d:%d, in %s",
-				 inum, data_len, sz_new, sz_huge, lnum,
-				 offs, c->dev_name);
+			if (FSCK(c)->mode == REBUILD_MODE)
+				dbg_fsck("bad inode node %lu(bad data len %d for char/block file, expect %d or %d) at %d:%d, in %s",
+					 inum, data_len, sz_new, sz_huge, lnum,
+					 offs, c->dev_name);
+			else
+				log_out(c, "bad inode node %lu(bad data len %d for char/block file, expect %d or %d) at %d:%d",
+					inum, data_len, sz_new, sz_huge, lnum,
+					offs);
 			goto out;
 		}
 		break;
@@ -211,22 +278,35 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 		fallthrough;
 	case S_IFIFO:
 		if (data_len != 0) {
-			dbg_fsck("bad inode node %lu(bad data len %d for fifo/sock file) at %d:%d, in %s",
-				 inum, data_len, lnum, offs, c->dev_name);
+			if (FSCK(c)->mode == REBUILD_MODE)
+				dbg_fsck("bad inode node %lu(bad data len %d for fifo/sock file) at %d:%d, in %s",
+					 inum, data_len, lnum, offs, c->dev_name);
+			else
+				log_out(c, "bad inode node %lu(bad data len %d for fifo/sock file) at %d:%d",
+					inum, data_len, lnum, offs);
 			goto out;
 		}
 		break;
 	default:
 		/* invalid file type. */
-		dbg_fsck("bad inode node %lu(unknown type %u) at %d:%d, in %s",
-			 inum, ino_node->mode & S_IFMT, lnum, offs, c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad inode node %lu(unknown type %u) at %d:%d, in %s",
+				 inum, ino_node->mode & S_IFMT, lnum, offs, c->dev_name);
+		else
+			log_out(c, "bad inode node %lu(unknown type %u) at %d:%d",
+				inum, ino_node->mode & S_IFMT, lnum, offs);
 		goto out;
 	}
 
 	if (ino_node->is_encrypted && !inode_can_be_encrypted(c, ino_node)) {
-		dbg_fsck("bad inode node %lu(encrypted but cannot be encrypted, type %u, is_xattr %d, fs_encrypted %d) at %d:%d, in %s",
-			 inum, ino_node->mode & S_IFMT, ino_node->is_xattr,
-			 c->encrypted, lnum, offs, c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad inode node %lu(encrypted but cannot be encrypted, type %u, is_xattr %d, fs_encrypted %d) at %d:%d, in %s",
+				 inum, ino_node->mode & S_IFMT, ino_node->is_xattr,
+				 c->encrypted, lnum, offs, c->dev_name);
+		else
+			log_out(c, "bad inode node %lu(encrypted but cannot be encrypted, type %u, is_xattr %d, fs_encrypted %d) at %d:%d",
+				inum, ino_node->mode & S_IFMT, ino_node->is_xattr,
+				c->encrypted, lnum, offs);
 		goto out;
 	}
 
@@ -272,10 +352,16 @@ bool parse_dent_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	    (key_type == UBIFS_XENT_KEY &&
 	     strnlen((const char *)dent->name, nlen) != nlen) ||
 	    inum > INUM_WATERMARK || key_type != ch->node_type) {
-		dbg_fsck("bad %s node(len %d nlen %d type %d inum %lu key_type %d node_type %d) at %d:%d, in %s",
-			 ch->node_type == UBIFS_XENT_NODE ? "xattr entry" : "directory entry",
-			 node_len, nlen, dent->type, inum, key_type,
-			 ch->node_type, lnum, offs, c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad %s node(len %d nlen %d type %d inum %lu key_type %d node_type %d) at %d:%d, in %s",
+				 ch->node_type == UBIFS_XENT_NODE ? "xattr entry" : "directory entry",
+				 node_len, nlen, dent->type, inum, key_type,
+				 ch->node_type, lnum, offs, c->dev_name);
+		else
+			log_out(c, "bad %s node(len %d nlen %d type %d inum %lu key_type %d node_type %d) at %d:%d",
+				ch->node_type == UBIFS_XENT_NODE ? "xattr entry" : "directory entry",
+				node_len, nlen, dent->type, inum, key_type,
+				ch->node_type, lnum, offs);
 		goto out;
 	}
 
@@ -318,15 +404,23 @@ bool parse_data_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	ino_t inum = key_inum(c, key);
 
 	if (ch->node_type != key_type(c, key)) {
-		dbg_fsck("bad data node(inconsistent node type %d vs key_type %d) at %d:%d, in %s",
-			 ch->node_type, key_type(c, key),
-			 lnum, offs, c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad data node(inconsistent node type %d vs key_type %d) at %d:%d, in %s",
+				 ch->node_type, key_type(c, key),
+				 lnum, offs, c->dev_name);
+		else
+			log_out(c, "bad data node(inconsistent node type %d vs key_type %d) at %d:%d",
+				ch->node_type, key_type(c, key), lnum, offs);
 		goto out;
 	}
 
 	if (!inum || inum > INUM_WATERMARK) {
-		dbg_fsck("bad data node(bad inum %lu) at %d:%d, in %s",
-			 inum, lnum, offs, c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad data node(bad inum %lu) at %d:%d, in %s",
+				 inum, lnum, offs, c->dev_name);
+		else
+			log_out(c, "bad data node(bad inum %lu) at %d:%d",
+				inum, lnum, offs);
 		goto out;
 	}
 
@@ -336,14 +430,22 @@ bool parse_data_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	data_node->size = le32_to_cpu(dn->size);
 
 	if (!data_node->size || data_node->size > UBIFS_BLOCK_SIZE) {
-		dbg_fsck("bad data node(invalid size %u) at %d:%d, in %s",
-			 data_node->size, lnum, offs, c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad data node(invalid size %u) at %d:%d, in %s",
+				 data_node->size, lnum, offs, c->dev_name);
+		else
+			log_out(c, "bad data node(invalid size %u) at %d:%d",
+				data_node->size, lnum, offs);
 		goto out;
 	}
 
 	if (le16_to_cpu(dn->compr_type) >= UBIFS_COMPR_TYPES_CNT) {
-		dbg_fsck("bad data node(invalid compression type %d) at %d:%d, in %s",
-			 le16_to_cpu(dn->compr_type), lnum, offs, c->dev_name);
+		if (FSCK(c)->mode == REBUILD_MODE)
+			dbg_fsck("bad data node(invalid compression type %d) at %d:%d, in %s",
+				 le16_to_cpu(dn->compr_type), lnum, offs, c->dev_name);
+		else
+			log_out(c, "bad data node(invalid compression type %d) at %d:%d",
+				le16_to_cpu(dn->compr_type), lnum, offs);
 		goto out;
 	}
 
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index 59080d87..96091b42 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -434,7 +434,17 @@ void handle_error(const struct ubifs_info *c, int reason_set)
  */
 static int do_fsck(void)
 {
-	return 0;
+	int err;
+
+	log_out(c, "Traverse TNC and construct files");
+	err = traverse_tnc_and_construct_files(c);
+	if (err) {
+		handle_error(c, HAS_TNC_CORRUPTED);
+		return err;
+	}
+
+	destroy_file_tree(c, &FSCK(c)->scanned_files);
+	return err;
 }
 
 int main(int argc, char *argv[])
@@ -468,6 +478,9 @@ int main(int argc, char *argv[])
 		goto out_close;
 	}
 
+	/*
+	 * Step 6: Traverse tnc and construct files
+	 */
 	err = do_fsck();
 	if (err && FSCK(c)->try_rebuild) {
 		ubifs_destroy_filesystem(c);
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index db43ccc0..4fa40883 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -38,7 +38,8 @@ enum { NORMAL_MODE = 0, SAFE_MODE, DANGER_MODE0,
 
 /* Types of inconsistent problems */
 enum { SB_CORRUPTED = 0, MST_CORRUPTED, LOG_CORRUPTED, BUD_CORRUPTED,
-       TNC_CORRUPTED, TNC_DATA_CORRUPTED, ORPHAN_CORRUPTED };
+       TNC_CORRUPTED, TNC_DATA_CORRUPTED, ORPHAN_CORRUPTED, INVALID_INO_NODE,
+       INVALID_DENT_NODE, INVALID_DATA_NODE };
 
 enum { HAS_DATA_CORRUPTED = 1, HAS_TNC_CORRUPTED = 2 };
 
@@ -294,4 +295,7 @@ int check_and_correct_files(struct ubifs_info *c);
 /* rebuild_fs.c */
 int ubifs_rebuild_filesystem(struct ubifs_info *c);
 
+/* check_files.c */
+int traverse_tnc_and_construct_files(struct ubifs_info *c);
+
 #endif
diff --git a/ubifs-utils/fsck.ubifs/problem.c b/ubifs-utils/fsck.ubifs/problem.c
index 9c8730a5..f99fd90e 100644
--- a/ubifs-utils/fsck.ubifs/problem.c
+++ b/ubifs-utils/fsck.ubifs/problem.c
@@ -42,6 +42,9 @@ static const struct fsck_problem problem_table[] = {
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA | PROBLEM_NEED_REBUILD, "Corrupted index node"},	// TNC_CORRUPTED
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Corrupted data searched from TNC"},	// TNC_DATA_CORRUPTED
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Corrupted orphan LEB"},	// ORPHAN_CORRUPTED
+	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Invalid inode node"},	// INVALID_INO_NODE
+	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Invalid dentry node"},	// INVALID_DENT_NODE
+	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Invalid data node"},	// INVALID_DATA_NODE
 };
 
 static const char *get_question(const struct fsck_problem *problem,
@@ -54,6 +57,9 @@ static const char *get_question(const struct fsck_problem *problem,
 	case BUD_CORRUPTED:
 		return "Drop bud?";
 	case TNC_DATA_CORRUPTED:
+	case INVALID_INO_NODE:
+	case INVALID_DENT_NODE:
+	case INVALID_DATA_NODE:
 		return "Drop it?";
 	case ORPHAN_CORRUPTED:
 		return "Drop orphans on the LEB?";
diff --git a/ubifs-utils/libubifs/debug.c b/ubifs-utils/libubifs/debug.c
index eaf403f9..836cbc74 100644
--- a/ubifs-utils/libubifs/debug.c
+++ b/ubifs-utils/libubifs/debug.c
@@ -51,7 +51,7 @@ static const char *get_key_hash(int hash)
 	}
 }
 
-static const char *get_key_type(int type)
+const char *ubifs_get_key_name(int type)
 {
 	switch (type) {
 	case UBIFS_INO_KEY:
@@ -102,23 +102,25 @@ const char *dbg_snprintf_key(const struct ubifs_info *c,
 		case UBIFS_INO_KEY:
 			len -= snprintf(p, len, "(%lu, %s)",
 					(unsigned long)key_inum(c, key),
-					get_key_type(type));
+					ubifs_get_key_name(type));
 			break;
 		case UBIFS_DENT_KEY:
 		case UBIFS_XENT_KEY:
 			len -= snprintf(p, len, "(%lu, %s, %#08x)",
 					(unsigned long)key_inum(c, key),
-					get_key_type(type), key_hash(c, key));
+					ubifs_get_key_name(type),
+					key_hash(c, key));
 			break;
 		case UBIFS_DATA_KEY:
 			len -= snprintf(p, len, "(%lu, %s, %u)",
 					(unsigned long)key_inum(c, key),
-					get_key_type(type), key_block(c, key));
+					ubifs_get_key_name(type),
+					key_block(c, key));
 			break;
 		case UBIFS_TRUN_KEY:
 			len -= snprintf(p, len, "(%lu, %s)",
 					(unsigned long)key_inum(c, key),
-					get_key_type(type));
+					ubifs_get_key_name(type));
 			break;
 		default:
 			len -= snprintf(p, len, "(bad key type: %#08x, %#08x)",
diff --git a/ubifs-utils/libubifs/debug.h b/ubifs-utils/libubifs/debug.h
index 4b475a00..c4aa59df 100644
--- a/ubifs-utils/libubifs/debug.h
+++ b/ubifs-utils/libubifs/debug.h
@@ -84,6 +84,7 @@ static inline int dbg_is_chk_index(__unused const struct ubifs_info *c)
 { return 0; }
 
 /* Dump functions */
+const char *ubifs_get_key_name(int type);
 const char *ubifs_get_type_name(int type);
 const char *dbg_ntype(int type);
 const char *dbg_cstate(int cmt_state);
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
