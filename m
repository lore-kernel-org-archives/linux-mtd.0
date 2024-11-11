Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCEFD2E9CF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHv16xiJoiklcVmFLs9SFkWTAynZNahfkjlwOHy2QTQ=; b=hhqOWYZzv/u4f/
	MGLl1nxJFM6XPYXEdAhLqrrH+rJrN4O+ZV92azxVtq7y8CmDwTUmm1DqEHysioZaodmNwUTlbAZPd
	RzkavUePtK+QS07cFHmL+yNQSOfY9L80ojG4rNJaEN5GOu1Ii29VfEQHyoMASF9nOeBkg2i+yQLM5
	chDEZhI1D4TFrBqa3MtXS0OyGxES7b3tolWop+73aNhwB7fkyBC+EV+I645IYz/s9C0L79X7gcqP1
	3rKR6LwaWUClaKwXIuyzWx1NE9hyw4agiaQDhI3N9Oi+5Aa7Fvk9zV5ZQO5v0F5B8gXWoi2P62OVz
	+tQEsbJ6cX7piy7KCt0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQl1-0000000H6Ef-3cEm;
	Mon, 11 Nov 2024 09:30:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOV8-0000000GZwQ-1W1I
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=4mTBKzdU85uqtNrzpl4JpaU51vUgjcxqMZ1KbBQDbHo=; b=jGXFgyu0psO6OldOF/FiB9vqUB
	cjZs5FXSHd7rvU2MqbHcNTe5SpMEPB5eSiGBLqWeGB2LKvqE7neRuvASfQ3h5rf32591AiZgKrSWA
	65fORbAl7pZhUoVsb5DgVrMRnBhd6Em+vtO1xMof7/K91sAWCw1JxFUTrR9obiAApKo81rx+GTuWw
	vBzgi6Uzg6PJwRBf6Uiq5RngHS0AsZ/IEZyMEiUwfNPYBltfqT3h3caqw3SuhiMP9KDoB60qgTDbT
	JWO2ECPjlrwVY9VAlaUanrMBwWcb73/PgqXHpSvEO8sKIB6ub3xtWje3bYAUvvcmjyTQSrAbnyj+K
	I+iLPW5A==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOV1-0000000CR3p-3krN
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:06:16 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xn0qs6QwJz10Qxr;
	Mon, 11 Nov 2024 15:03:05 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 751C71400DC;
	Mon, 11 Nov 2024 15:05:32 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:31 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 062/102] fsck.ubifs: rebuild_fs: Create new root dir if there are no scanned files
Date: Mon, 11 Nov 2024 15:03:05 +0800
Message-ID: <20241111070346.1314122-63-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070612_977209_AF3687DF 
X-CRM114-Status: GOOD (  18.77  )
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

This is a preparation for building TNC, there must at least one file
in filesystem, if not, just create new root dir.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/fsck.ubifs.h |   6 +
 ubifs-utils/fsck.ubifs/rebuild_fs.c | 213 +++++++++++++++++++++++++++++++++++-
 2 files changed, 217 insertions(+), 2 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index cb7b4002..fb72d8af 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -183,11 +183,17 @@ struct scanned_file {
  * @used_lebs: a bitmap used for recording used lebs
  * @lpts: lprops table
  * @scanned_files: tree of all scanned files
+ * @write_buf: write buffer for LEB @head_lnum
+ * @head_lnum: current writing LEB number
+ * @head_offs: current writing position in LEB @head_lnum
  */
 struct ubifs_rebuild_info {
 	unsigned long *used_lebs;
 	struct ubifs_lprops *lpts;
 	struct rb_root scanned_files;
+	void *write_buf;
+	int head_lnum;
+	int head_offs;
 };
 
 /**
diff --git a/ubifs-utils/fsck.ubifs/rebuild_fs.c b/ubifs-utils/fsck.ubifs/rebuild_fs.c
index 1b03d6c0..62bd4128 100644
--- a/ubifs-utils/fsck.ubifs/rebuild_fs.c
+++ b/ubifs-utils/fsck.ubifs/rebuild_fs.c
@@ -65,9 +65,17 @@ static int init_rebuild_info(struct ubifs_info *c)
 		log_err(c, errno, "can not allocate lpts");
 		goto free_used_lebs;
 	}
+	FSCK(c)->rebuild->write_buf = vmalloc(c->leb_size);
+	if (!FSCK(c)->rebuild->write_buf) {
+		err = -ENOMEM;
+		goto free_lpts;
+	}
+	FSCK(c)->rebuild->head_lnum = -1;
 
 	return 0;
 
+free_lpts:
+	kfree(FSCK(c)->rebuild->lpts);
 free_used_lebs:
 	kfree(FSCK(c)->rebuild->used_lebs);
 free_rebuild:
@@ -79,6 +87,7 @@ free_sbuf:
 
 static void destroy_rebuild_info(struct ubifs_info *c)
 {
+	vfree(FSCK(c)->rebuild->write_buf);
 	kfree(FSCK(c)->rebuild->lpts);
 	kfree(FSCK(c)->rebuild->used_lebs);
 	kfree(FSCK(c)->rebuild);
@@ -661,6 +670,197 @@ static void extract_dentry_tree(struct ubifs_info *c)
 	}
 }
 
+static void init_root_ino(struct ubifs_info *c, struct ubifs_ino_node *ino)
+{
+#define S_IRUGO		(S_IRUSR|S_IRGRP|S_IROTH)
+#define S_IXUGO		(S_IXUSR|S_IXGRP|S_IXOTH)
+	__le64 tmp_le64;
+
+	/* Create default root inode */
+	ino_key_init_flash(c, &ino->key, UBIFS_ROOT_INO);
+	ino->ch.node_type = UBIFS_INO_NODE;
+	ino->creat_sqnum = cpu_to_le64(++c->max_sqnum);
+	ino->nlink = cpu_to_le32(2);
+	tmp_le64 = cpu_to_le64(time(NULL));
+	ino->atime_sec   = tmp_le64;
+	ino->ctime_sec   = tmp_le64;
+	ino->mtime_sec   = tmp_le64;
+	ino->atime_nsec  = 0;
+	ino->ctime_nsec  = 0;
+	ino->mtime_nsec  = 0;
+	ino->mode = cpu_to_le32(S_IFDIR | S_IRUGO | S_IWUSR | S_IXUGO);
+	ino->size = cpu_to_le64(UBIFS_INO_NODE_SZ);
+	/* Set compression enabled by default */
+	ino->flags = cpu_to_le32(UBIFS_COMPR_FL);
+}
+
+/**
+ * get_free_leb - get a free LEB according to @FSCK(c)->rebuild->used_lebs.
+ * @c: UBIFS file-system description object
+ *
+ * This function tries to find a free LEB, %0 is returned if found, otherwise
+ * %ENOSPC is returned.
+ */
+static int get_free_leb(struct ubifs_info *c)
+{
+	int lnum, err;
+
+	lnum = find_next_zero_bit(FSCK(c)->rebuild->used_lebs, c->main_lebs, 0);
+	if (lnum >= c->main_lebs) {
+		ubifs_err(c, "No space left.");
+		return -ENOSPC;
+	}
+	set_bit(lnum, FSCK(c)->rebuild->used_lebs);
+	lnum += c->main_first;
+
+	err = ubifs_leb_unmap(c, lnum);
+	if (err)
+		return err;
+
+	FSCK(c)->rebuild->head_lnum = lnum;
+	FSCK(c)->rebuild->head_offs = 0;
+
+	return 0;
+}
+
+/**
+ * flush_write_buf - flush write buffer.
+ * @c: UBIFS file-system description object
+ *
+ * This function flush write buffer to LEB @FSCK(c)->rebuild->head_lnum, then
+ * set @FSCK(c)->rebuild->head_lnum to '-1'.
+ */
+static int flush_write_buf(struct ubifs_info *c)
+{
+	int len, pad, err;
+
+	if (!FSCK(c)->rebuild->head_offs)
+		return 0;
+
+	len = ALIGN(FSCK(c)->rebuild->head_offs, c->min_io_size);
+	pad = len - FSCK(c)->rebuild->head_offs;
+	if (pad)
+		ubifs_pad(c, FSCK(c)->rebuild->write_buf +
+			  FSCK(c)->rebuild->head_offs, pad);
+
+	err = ubifs_leb_write(c, FSCK(c)->rebuild->head_lnum,
+			      FSCK(c)->rebuild->write_buf, 0, len);
+	if (err)
+		return err;
+
+	FSCK(c)->rebuild->head_lnum = -1;
+
+	return 0;
+}
+
+/**
+ * reserve_space - reserve enough space to write data.
+ * @c: UBIFS file-system description object
+ * @len: the length of written data
+ * @lnum: the write LEB number is returned here
+ * @offs: the write pos in LEB is returned here
+ *
+ * This function finds target position <@lnum, @offs> to write data with
+ * length of @len.
+ */
+static int reserve_space(struct ubifs_info *c, int len, int *lnum, int *offs)
+{
+	int err;
+
+	if (FSCK(c)->rebuild->head_lnum == -1) {
+get_new:
+		err = get_free_leb(c);
+		if (err)
+			return err;
+	}
+
+	if (len > c->leb_size - FSCK(c)->rebuild->head_offs) {
+		err = flush_write_buf(c);
+		if (err)
+			return err;
+
+		goto get_new;
+	}
+
+	*lnum = FSCK(c)->rebuild->head_lnum;
+	*offs = FSCK(c)->rebuild->head_offs;
+	FSCK(c)->rebuild->head_offs += ALIGN(len, 8);
+
+	return 0;
+}
+
+static void copy_node_data(struct ubifs_info *c, void *node, int offs, int len)
+{
+	memcpy(FSCK(c)->rebuild->write_buf + offs, node, len);
+	memset(FSCK(c)->rebuild->write_buf + offs + len, 0xff, ALIGN(len, 8) - len);
+}
+
+/**
+ * create_root - create root dir.
+ * @c: UBIFS file-system description object
+ *
+ * This function creates root dir.
+ */
+static int create_root(struct ubifs_info *c)
+{
+	int err, lnum, offs;
+	struct ubifs_ino_node *ino;
+	struct scanned_file *file;
+
+	ino = kzalloc(ALIGN(UBIFS_INO_NODE_SZ, c->min_io_size), GFP_KERNEL);
+	if (!ino)
+		return -ENOMEM;
+
+	c->max_sqnum = 0;
+	c->highest_inum = UBIFS_FIRST_INO;
+	init_root_ino(c, ino);
+	err = ubifs_prepare_node_hmac(c, ino, UBIFS_INO_NODE_SZ, -1, 1);
+	if (err)
+		goto out;
+
+	err = reserve_space(c, UBIFS_INO_NODE_SZ, &lnum, &offs);
+	if (err)
+		goto out;
+
+	copy_node_data(c, ino, offs, UBIFS_INO_NODE_SZ);
+
+	err = flush_write_buf(c);
+	if (err)
+		goto out;
+
+	file = kzalloc(sizeof(struct scanned_file), GFP_KERNEL);
+	if (!file) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	file->inum = UBIFS_ROOT_INO;
+	file->dent_nodes = RB_ROOT;
+	file->data_nodes = RB_ROOT;
+	INIT_LIST_HEAD(&file->list);
+
+	file->ino.header.exist = true;
+	file->ino.header.lnum = lnum;
+	file->ino.header.offs = offs;
+	file->ino.header.len = UBIFS_INO_NODE_SZ;
+	file->ino.header.sqnum = le64_to_cpu(ino->ch.sqnum);
+	ino_key_init(c, &file->ino.key, UBIFS_ROOT_INO);
+	file->ino.is_xattr = le32_to_cpu(ino->flags) & UBIFS_XATTR_FL;
+	file->ino.mode = le32_to_cpu(ino->mode);
+	file->calc_nlink = file->ino.nlink = le32_to_cpu(ino->nlink);
+	file->calc_xcnt = file->ino.xcnt = le32_to_cpu(ino->xattr_cnt);
+	file->calc_xsz = file->ino.xsz = le32_to_cpu(ino->xattr_size);
+	file->calc_xnms = file->ino.xnms = le32_to_cpu(ino->xattr_names);
+	file->calc_size = file->ino.size = le64_to_cpu(ino->size);
+
+	rb_link_node(&file->rb, NULL, &FSCK(c)->rebuild->scanned_files.rb_node);
+	rb_insert_color(&file->rb, &FSCK(c)->rebuild->scanned_files);
+
+out:
+	kfree(ino);
+	return err;
+}
+
 static const char *get_file_name(struct ubifs_info *c, struct scanned_file *file)
 {
 	static char name[UBIFS_MAX_NLEN + 1];
@@ -741,9 +941,10 @@ static void record_file_used_lebs(struct ubifs_info *c,
  *
  * This function traverses all nodes from valid files and does following
  * things:
- * 1. Record all used LEBs which may hold useful nodes, then left unused
+ * 1. If there are no scanned files, create default empty filesystem.
+ * 2. Record all used LEBs which may hold useful nodes, then left unused
  *    LEBs could be taken for storing new index tree.
- * 2. Re-write data to prevent failed gc scanning in the subsequent mounting
+ * 3. Re-write data to prevent failed gc scanning in the subsequent mounting
  *    process caused by corrupted data.
  */
 static int traverse_files_and_nodes(struct ubifs_info *c)
@@ -753,6 +954,14 @@ static int traverse_files_and_nodes(struct ubifs_info *c)
 	struct scanned_file *file;
 	struct rb_root *tree = &FSCK(c)->rebuild->scanned_files;
 
+	if (rb_first(tree) == NULL) {
+		/* No scanned files. Create root dir. */
+		log_out(c, "No files found, create empty filesystem");
+		err = create_root(c);
+		if (err)
+			return err;
+	}
+
 	log_out(c, "Record used LEBs");
 	for (node = rb_first(tree); node; node = rb_next(node)) {
 		file = rb_entry(node, struct scanned_file, rb);
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
