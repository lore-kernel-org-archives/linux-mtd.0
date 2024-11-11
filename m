Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB18D2E9C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eF1f6cD0XTiHMBe8I0tp+hGUD18I46DJRNtzOyqy2+I=; b=PRHhr+b6pKUj+X
	TmOkfoZ8jCTpN5T3ywDCx0OJIdFOqzlZTbqKuqVXGL9al5LoByrvWmefYkNPmfDPP5LDGxMtymVvN
	OqYNGWkTNJ1IUJpFzoxq7L5er9+NWJpGlOsFirSBAZa4eeafM4wgRQzEDF1TgoqSJvIaMhWgxnZgG
	oDgQ5bx5RPkQ/C6QGXfo8ShfLYkeIhG8Sl7h2d6XRHwUYWA5y1KCSWgZfcM4D1c7erw/2HhOVXntF
	h/zwnvPTE4wnlA676dN4zCLNGArORoGS6bJ7iRu9llAJZvPpuA7UMBP1to8C2S63Cwg0yYEcuIqGY
	HNu1OhHq32GJj/HGjO0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQGb-0000000GvsF-0FeU;
	Mon, 11 Nov 2024 08:59:25 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQGB-0000000GvWy-2Lag
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:59:04 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xn3MV3dLxz2DgyW;
	Mon, 11 Nov 2024 16:57:10 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D1EDA1401F4;
	Mon, 11 Nov 2024 16:58:57 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:58:57 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 052/102] fsck.ubifs: Add node parsing functions
Date: Mon, 11 Nov 2024 16:57:23 +0800
Message-ID: <20241111085741.2066378-13-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111085741.2066378-1-chengzhihao1@huawei.com>
References: <20241111085741.2066378-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_005900_087244_AE38FD10 
X-CRM114-Status: GOOD (  21.94  )
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

Add parsing functions for each type of nodes, which will be used for
checking the validity of raw node data while reading from TNC or
scanning from UBIFS logical erase block.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am              |   3 +-
 ubifs-utils/fsck.ubifs/extract_files.c | 405 +++++++++++++++++++++++++++++++++
 ubifs-utils/fsck.ubifs/fsck.ubifs.h    | 106 +++++++++
 ubifs-utils/libubifs/debug.h           |   2 +
 4 files changed, 515 insertions(+), 1 deletion(-)
 create mode 100644 ubifs-utils/fsck.ubifs/extract_files.c

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index baba1853..ca40e88c 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -82,7 +82,8 @@ fsck_ubifs_SOURCES = \
 	ubifs-utils/fsck.ubifs/fsck.ubifs.h \
 	ubifs-utils/fsck.ubifs/fsck.ubifs.c \
 	ubifs-utils/fsck.ubifs/problem.c \
-	ubifs-utils/fsck.ubifs/load_fs.c
+	ubifs-utils/fsck.ubifs/load_fs.c \
+	ubifs-utils/fsck.ubifs/extract_files.c
 
 fsck_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) \
 		   $(DUMP_STACK_LD) -lm -lpthread
diff --git a/ubifs-utils/fsck.ubifs/extract_files.c b/ubifs-utils/fsck.ubifs/extract_files.c
new file mode 100644
index 00000000..dd52ef84
--- /dev/null
+++ b/ubifs-utils/fsck.ubifs/extract_files.c
@@ -0,0 +1,405 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024, Huawei Technologies Co, Ltd.
+ *
+ * Authors: Zhihao Cheng <chengzhihao1@huawei.com>
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <getopt.h>
+#include <sys/stat.h>
+
+#include "linux_err.h"
+#include "bitops.h"
+#include "kmem.h"
+#include "ubifs.h"
+#include "defs.h"
+#include "debug.h"
+#include "key.h"
+#include "misc.h"
+#include "fsck.ubifs.h"
+
+static void parse_node_header(int lnum, int offs, int len,
+			      unsigned long long sqnum,
+			      struct scanned_node *header)
+{
+	header->exist = true;
+	header->lnum = lnum;
+	header->offs = offs;
+	header->len = len;
+	header->sqnum = sqnum;
+}
+
+static inline bool inode_can_be_encrypted(struct ubifs_info *c,
+					  struct scanned_ino_node *ino_node)
+{
+	if (!c->encrypted)
+		return false;
+
+	if (ino_node->is_xattr)
+		return false;
+
+	/* Only regular files, directories, and symlinks can be encrypted. */
+	if (S_ISREG(ino_node->mode) || S_ISDIR(ino_node->mode) ||
+	    S_ISLNK(ino_node->mode))
+		return true;
+
+	return false;
+}
+
+/**
+ * parse_ino_node - parse inode node and check it's validity.
+ * @c: UBIFS file-system description object
+ * @lnum: logical eraseblock number
+ * @offs: the offset in LEB of the raw inode node
+ * @node: raw node
+ * @key: key of node scanned (if it has one)
+ * @ino_node: node used to store raw inode information
+ *
+ * This function checks the raw inode information, and stores inode
+ * information into @ino_node. Returns %true if the inode is valid,
+ * otherwise %false is returned.
+ */
+bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
+		    union ubifs_key *key, struct scanned_ino_node *ino_node)
+{
+	bool valid = false;
+	int data_len, node_len;
+	unsigned int flags;
+	unsigned long long sqnum;
+	struct ubifs_ch *ch = (struct ubifs_ch *)node;
+	struct ubifs_ino_node *ino = (struct ubifs_ino_node *)node;
+	ino_t inum = key_inum(c, key);
+
+	if (!inum || inum > INUM_WATERMARK) {
+		dbg_fsck("bad inode node(bad inum %lu) at %d:%d, in %s",
+			 inum, lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	if (ch->node_type != key_type(c, key)) {
+		dbg_fsck("bad inode node %lu(inconsistent node type %d vs key_type %d) at %d:%d, in %s",
+			 inum, ch->node_type, key_type(c, key),
+			 lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	node_len = le32_to_cpu(ch->len);
+	sqnum = le64_to_cpu(ch->sqnum);
+	key_copy(c, key, &ino_node->key);
+	flags = le32_to_cpu(ino->flags);
+	data_len = le32_to_cpu(ino->data_len);
+	ino_node->is_xattr = !!(flags & UBIFS_XATTR_FL) ? 1 : 0;
+	ino_node->is_encrypted = !!(flags & UBIFS_CRYPT_FL) ? 1 : 0;
+	ino_node->mode = le32_to_cpu(ino->mode);
+	ino_node->nlink = le32_to_cpu(ino->nlink);
+	ino_node->xcnt = le32_to_cpu(ino->xattr_cnt);
+	ino_node->xsz = le32_to_cpu(ino->xattr_size);
+	ino_node->xnms = le32_to_cpu(ino->xattr_names);
+	ino_node->size = le64_to_cpu(ino->size);
+
+	if (inum == UBIFS_ROOT_INO && !S_ISDIR(ino_node->mode)) {
+		dbg_fsck("bad inode node %lu(root inode is not dir, tyoe %u) at %d:%d, in %s",
+			 inum, ino_node->mode & S_IFMT, lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	if (ino_node->size > c->max_inode_sz) {
+		dbg_fsck("bad inode node %lu(size %llu is too large) at %d:%d, in %s",
+			 inum, ino_node->size, lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	if (le16_to_cpu(ino->compr_type) >= UBIFS_COMPR_TYPES_CNT) {
+		dbg_fsck("bad inode node %lu(unknown compression type %d) at %d:%d, in %s",
+			 inum, le16_to_cpu(ino->compr_type), lnum, offs,
+			 c->dev_name);
+		goto out;
+	}
+
+	if (ino_node->xnms + ino_node->xcnt > XATTR_LIST_MAX) {
+		dbg_fsck("bad inode node %lu(too big xnames %u xcount %u) at %d:%d, in %s",
+			 inum, ino_node->xnms, ino_node->xcnt,
+			 lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	if (data_len < 0 || data_len > UBIFS_MAX_INO_DATA) {
+		dbg_fsck("bad inode node %lu(invalid data len %d) at %d:%d, in %s",
+			 inum, data_len, lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	if (UBIFS_INO_NODE_SZ + data_len != node_len) {
+		dbg_fsck("bad inode node %lu(inconsistent data len %d vs node len %d) at %d:%d, in %s",
+			 inum, data_len, node_len, lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	if (ino_node->is_xattr) {
+		if (!S_ISREG(ino_node->mode)) {
+			dbg_fsck("bad inode node %lu(bad type %u for xattr) at %d:%d, in %s",
+				 inum, ino_node->mode & S_IFMT,
+				 lnum, offs, c->dev_name);
+			goto out;
+		}
+		if (data_len != ino_node->size) {
+			dbg_fsck("bad inode node %lu(inconsistent data_len %d vs size %llu for xattr) at %d:%d, in %s",
+				 inum, data_len, ino_node->size,
+				 lnum, offs, c->dev_name);
+			goto out;
+		}
+		if (ino_node->xcnt || ino_node->xsz || ino_node->xnms) {
+			dbg_fsck("bad inode node %lu(non zero xattr count %u xattr size %u xattr names %u for xattr) at %d:%d, in %s",
+				 inum, ino_node->xcnt, ino_node->xsz,
+				 ino_node->xnms, lnum, offs, c->dev_name);
+			goto out;
+		}
+	}
+
+	switch (ino_node->mode & S_IFMT) {
+	case S_IFREG:
+		if (!ino_node->is_xattr && data_len != 0) {
+			dbg_fsck("bad inode node %lu(bad data len %d for reg file) at %d:%d, in %s",
+				 inum, data_len, lnum, offs, c->dev_name);
+			goto out;
+		}
+		break;
+	case S_IFDIR:
+		if (data_len != 0) {
+			dbg_fsck("bad inode node %lu(bad data len %d for dir file) at %d:%d, in %s",
+				 inum, data_len, lnum, offs, c->dev_name);
+			goto out;
+		}
+		break;
+	case S_IFLNK:
+		if (data_len == 0) {
+			/*
+			 * For encryption enabled or selinux enabled situation,
+			 * uninitialized inode with xattrs could be written
+			 * before ubifs_jnl_update(). If the dent node is
+			 * written successfully but the initialized inode is
+			 * not written, ubifs_iget() will get bad symlink inode
+			 * with 'ui->data_len = 0'. Similar phenomenon can also
+			 * occur for block/char dev creation.
+			 * Just drop the inode node when above class of
+			 * exceptions are found.
+			 */
+			dbg_fsck("bad symlink inode node %lu(bad data len %d) at %d:%d, in %s",
+				 inum, data_len, lnum, offs, c->dev_name);
+			goto out;
+		}
+		break;
+	case S_IFBLK:
+		fallthrough;
+	case S_IFCHR:
+	{
+		union ubifs_dev_desc *dev = (union ubifs_dev_desc *)ino->data;
+		int sz_new = sizeof(dev->new), sz_huge = sizeof(dev->huge);
+
+		if (data_len != sz_new && data_len != sz_huge) {
+			dbg_fsck("bad inode node %lu(bad data len %d for char/block file, expect %d or %d) at %d:%d, in %s",
+				 inum, data_len, sz_new, sz_huge, lnum,
+				 offs, c->dev_name);
+			goto out;
+		}
+		break;
+	}
+	case S_IFSOCK:
+		fallthrough;
+	case S_IFIFO:
+		if (data_len != 0) {
+			dbg_fsck("bad inode node %lu(bad data len %d for fifo/sock file) at %d:%d, in %s",
+				 inum, data_len, lnum, offs, c->dev_name);
+			goto out;
+		}
+		break;
+	default:
+		/* invalid file type. */
+		dbg_fsck("bad inode node %lu(unknown type %u) at %d:%d, in %s",
+			 inum, ino_node->mode & S_IFMT, lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	if (ino_node->is_encrypted && !inode_can_be_encrypted(c, ino_node)) {
+		dbg_fsck("bad inode node %lu(encrypted but cannot be encrypted, type %u, is_xattr %d, fs_encrypted %d) at %d:%d, in %s",
+			 inum, ino_node->mode & S_IFMT, ino_node->is_xattr,
+			 c->encrypted, lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	valid = true;
+	parse_node_header(lnum, offs, node_len, sqnum, &ino_node->header);
+
+out:
+	return valid;
+}
+
+/**
+ * parse_dent_node - parse dentry node and check it's validity.
+ * @c: UBIFS file-system description object
+ * @lnum: logical eraseblock number
+ * @offs: the offset in LEB of the raw inode node
+ * @node: raw node
+ * @key: key of node scanned (if it has one)
+ * @dent_node: node used to store raw dentry information
+ *
+ * This function checks the raw dentry/(xattr entry) information, and
+ * stores dentry/(xattr entry) information into @dent_node. Returns
+ * %true if the entry is valid, otherwise %false is returned.
+ */
+bool parse_dent_node(struct ubifs_info *c, int lnum, int offs, void *node,
+		     union ubifs_key *key, struct scanned_dent_node *dent_node)
+{
+	bool valid = false;
+	int node_len, nlen;
+	unsigned long long sqnum;
+	struct ubifs_ch *ch = (struct ubifs_ch *)node;
+	struct ubifs_dent_node *dent = (struct ubifs_dent_node *)node;
+	int key_type = key_type_flash(c, dent->key);
+	ino_t inum;
+
+	nlen = le16_to_cpu(dent->nlen);
+	node_len = le32_to_cpu(ch->len);
+	sqnum = le64_to_cpu(ch->sqnum);
+	inum = le64_to_cpu(dent->inum);
+
+	if (node_len != nlen + UBIFS_DENT_NODE_SZ + 1 ||
+	    dent->type >= UBIFS_ITYPES_CNT ||
+	    nlen > UBIFS_MAX_NLEN || dent->name[nlen] != 0 ||
+	    (key_type == UBIFS_XENT_KEY &&
+	     strnlen((const char *)dent->name, nlen) != nlen) ||
+	    inum > INUM_WATERMARK || key_type != ch->node_type) {
+		dbg_fsck("bad %s node(len %d nlen %d type %d inum %lu key_type %d node_type %d) at %d:%d, in %s",
+			 ch->node_type == UBIFS_XENT_NODE ? "xattr entry" : "directory entry",
+			 node_len, nlen, dent->type, inum, key_type,
+			 ch->node_type, lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	key_copy(c, key, &dent_node->key);
+	dent_node->can_be_found = false;
+	dent_node->type = dent->type;
+	dent_node->nlen = nlen;
+	memcpy(dent_node->name, dent->name, nlen);
+	dent_node->name[nlen] = '\0';
+	dent_node->inum = inum;
+
+	valid = true;
+	parse_node_header(lnum, offs, node_len, sqnum, &dent_node->header);
+
+out:
+	return valid;
+}
+
+/**
+ * parse_data_node - parse data node and check it's validity.
+ * @c: UBIFS file-system description object
+ * @lnum: logical eraseblock number
+ * @offs: the offset in LEB of the raw data node
+ * @node: raw node
+ * @key: key of node scanned (if it has one)
+ * @ino_node: node used to store raw data information
+ *
+ * This function checks the raw data node information, and stores
+ * data node information into @data_node. Returns %true if the data
+ * node is valid, otherwise %false is returned.
+ */
+bool parse_data_node(struct ubifs_info *c, int lnum, int offs, void *node,
+		     union ubifs_key *key, struct scanned_data_node *data_node)
+{
+	bool valid = false;
+	int node_len;
+	unsigned long long sqnum;
+	struct ubifs_ch *ch = (struct ubifs_ch *)node;
+	struct ubifs_data_node *dn = (struct ubifs_data_node *)node;
+	ino_t inum = key_inum(c, key);
+
+	if (ch->node_type != key_type(c, key)) {
+		dbg_fsck("bad data node(inconsistent node type %d vs key_type %d) at %d:%d, in %s",
+			 ch->node_type, key_type(c, key),
+			 lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	if (!inum || inum > INUM_WATERMARK) {
+		dbg_fsck("bad data node(bad inum %lu) at %d:%d, in %s",
+			 inum, lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	node_len = le32_to_cpu(ch->len);
+	sqnum = le64_to_cpu(ch->sqnum);
+	key_copy(c, key, &data_node->key);
+	data_node->size = le32_to_cpu(dn->size);
+
+	if (!data_node->size || data_node->size > UBIFS_BLOCK_SIZE) {
+		dbg_fsck("bad data node(invalid size %u) at %d:%d, in %s",
+			 data_node->size, lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	if (le16_to_cpu(dn->compr_type) >= UBIFS_COMPR_TYPES_CNT) {
+		dbg_fsck("bad data node(invalid compression type %d) at %d:%d, in %s",
+			 le16_to_cpu(dn->compr_type), lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	valid = true;
+	parse_node_header(lnum, offs, node_len, sqnum, &data_node->header);
+
+out:
+	return valid;
+}
+
+/**
+ * parse_trun_node - parse truncation node and check it's validity.
+ * @c: UBIFS file-system description object
+ * @lnum: logical eraseblock number
+ * @offs: the offset in LEB of the raw truncation node
+ * @node: raw node
+ * @key: key of node scanned (if it has one)
+ * @trun_node: node used to store raw truncation information
+ *
+ * This function checks the raw truncation information, and stores
+ * truncation information into @trun_node. Returns %true if the
+ * truncation is valid, otherwise %false is returned.
+ */
+bool parse_trun_node(struct ubifs_info *c, int lnum, int offs, void *node,
+		     union ubifs_key *key, struct scanned_trun_node *trun_node)
+{
+	bool valid = false;
+	int node_len;
+	unsigned long long sqnum;
+	struct ubifs_ch *ch = (struct ubifs_ch *)node;
+	struct ubifs_trun_node *trun = (struct ubifs_trun_node *)node;
+	loff_t old_size = le64_to_cpu(trun->old_size);
+	loff_t new_size = le64_to_cpu(trun->new_size);
+	ino_t inum = le32_to_cpu(trun->inum);
+
+	if (!inum || inum > INUM_WATERMARK) {
+		dbg_fsck("bad truncation node(bad inum %lu) at %d:%d, in %s",
+			 inum, lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	node_len = le32_to_cpu(ch->len);
+	sqnum = le64_to_cpu(ch->sqnum);
+	trun_node->new_size = new_size;
+
+	if (old_size < 0 || old_size > c->max_inode_sz ||
+	    new_size < 0 || new_size > c->max_inode_sz ||
+	    old_size <= new_size) {
+		dbg_fsck("bad truncation node(new size %ld old size %ld inum %lu) at %d:%d, in %s",
+			 new_size, old_size, inum, lnum, offs, c->dev_name);
+		goto out;
+	}
+
+	trun_key_init(c, key, inum);
+	valid = true;
+	parse_node_header(lnum, offs, node_len, sqnum, &trun_node->header);
+
+out:
+	return valid;
+}
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index c21082e0..d77ebc61 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -40,6 +40,102 @@ enum { NORMAL_MODE = 0, SAFE_MODE, DANGER_MODE0,
 enum { SB_CORRUPTED = 0 };
 
 /**
+ * scanned_node - common header node.
+ * @exist: whether the node is found by scanning
+ * @lnum: LEB number of the scanned node
+ * @offs: scanned node's offset within @lnum
+ * @len: length of scanned node
+ * @sqnum: sequence number
+ */
+struct scanned_node {
+	bool exist;
+	int lnum;
+	int offs;
+	int len;
+	unsigned long long sqnum;
+};
+
+/**
+ * scanned_ino_node - scanned inode node.
+ * @header: common header of scanned node
+ * @key: the key of inode node
+ * @is_xattr: %1 for xattr inode, otherwise %0
+ * @is_encrypted: %1 for encrypted inode, otherwise %0
+ * @mode: file mode
+ * @nlink: number of hard links
+ * @xcnt: count of extended attributes this inode has
+ * @xsz: summarized size of all extended attributes in bytes
+ * @xnms: sum of lengths of all extended attribute names
+ * @size: inode size in bytes
+ * @rb: link in the tree of valid inode nodes or deleted inode nodes
+ */
+struct scanned_ino_node {
+	struct scanned_node header;
+	union ubifs_key key;
+	unsigned int is_xattr:1;
+	unsigned int is_encrypted:1;
+	unsigned int mode;
+	unsigned int nlink;
+	unsigned int xcnt;
+	unsigned int xsz;
+	unsigned int xnms;
+	unsigned long long size;
+	struct rb_node rb;
+};
+
+/**
+ * scanned_dent_node - scanned dentry node.
+ * @header: common header of scanned node
+ * @key: the key of dentry node
+ * @can_be_found: whether this dentry can be found from '/'
+ * @type: file type, reg/dir/symlink/block/char/fifo/sock
+ * @nlen: name length
+ * @name: dentry name
+ * @inum: target inode number
+ * @rb: link in the trees of:
+ *  1) valid dentry nodes or deleted dentry node
+ *  2) all scanned dentry nodes from same file
+ * @list: link in the list dentries for looking up/deleting
+ */
+struct scanned_dent_node {
+	struct scanned_node header;
+	union ubifs_key key;
+	bool can_be_found;
+	unsigned int type;
+	unsigned int nlen;
+	char name[UBIFS_MAX_NLEN + 1];
+	ino_t inum;
+	struct rb_node rb;
+	struct list_head list;
+};
+
+/**
+ * scanned_data_node - scanned data node.
+ * @header: common header of scanned node
+ * @key: the key of data node
+ * @size: uncompressed data size in bytes
+ * @rb: link in the tree of all scanned data nodes from same file
+ * @list: link in the list for deleting
+ */
+struct scanned_data_node {
+	struct scanned_node header;
+	union ubifs_key key;
+	unsigned int size;
+	struct rb_node rb;
+	struct list_head list;
+};
+
+/**
+ * scanned_trun_node - scanned truncation node.
+ * @header: common header of scanned node
+ * @new_size: size after truncation
+ */
+struct scanned_trun_node {
+	struct scanned_node header;
+	unsigned long long new_size;
+};
+
+/**
  * struct ubifs_fsck_info - UBIFS fsck information.
  * @mode: working mode
  * @failure_reason: reasons for failed operations
@@ -102,4 +198,14 @@ bool fix_problem(const struct ubifs_info *c, int problem_type);
 int ubifs_load_filesystem(struct ubifs_info *c);
 void ubifs_destroy_filesystem(struct ubifs_info *c);
 
+/* extract_files.c */
+bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
+		    union ubifs_key *key, struct scanned_ino_node *ino_node);
+bool parse_dent_node(struct ubifs_info *c, int lnum, int offs, void *node,
+		     union ubifs_key *key, struct scanned_dent_node *dent_node);
+bool parse_data_node(struct ubifs_info *c, int lnum, int offs, void *node,
+		     union ubifs_key *key, struct scanned_data_node *data_node);
+bool parse_trun_node(struct ubifs_info *c, int lnum, int offs, void *node,
+		     union ubifs_key *key, struct scanned_trun_node *trun_node);
+
 #endif
diff --git a/ubifs-utils/libubifs/debug.h b/ubifs-utils/libubifs/debug.h
index dfc4dcaf..2ac4302e 100644
--- a/ubifs-utils/libubifs/debug.h
+++ b/ubifs-utils/libubifs/debug.h
@@ -77,6 +77,8 @@ void ubifs_assert_failed(struct ubifs_info *c, const char *expr,
 #define dbg_scan(fmt, ...)  ubifs_dbg_msg("scan", fmt, ##__VA_ARGS__)
 /* Additional recovery messages */
 #define dbg_rcvry(fmt, ...) ubifs_dbg_msg("rcvry", fmt, ##__VA_ARGS__)
+/* Additional fsck messages */
+#define dbg_fsck(fmt, ...) ubifs_dbg_msg("fsck", fmt, ##__VA_ARGS__)
 
 static inline int dbg_is_chk_index(__unused const struct ubifs_info *c)
 { return 0; }
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
