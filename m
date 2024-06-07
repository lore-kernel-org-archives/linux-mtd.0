Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B012DC27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWmOj3JPYqUS6AUdB1gXcPM4bRYpteRQPlj/SQIxckc=; b=1RTB929zW6TCx/
	++VcOPoPWG9gdSHaiLCl1E8++Ohi9GJV8KWyPDaQw4KvqK3EWuY1XR3KQWJeDuYZ3/B3ZLXNsFIzQ
	YvL5HOn/DcboaYiUcfAT2VxmWZQXVBmgK3Bi/3RuaEevVtJEzvTX1sZrNyLx9VpvnneoscvKl9jPn
	WJ3DitFFDrWPmUJGcVxqfoBjpaCwuUUpy83NA2h4vUzgkZUvRkvDvG75Z/dldkyL03KH83aJx9s++
	ch3H6ASnpwZ649bldpNzKJs17dRxnEGaldh9rY2qimzMCcmNmp80znu1E0paYdjt0uKzV+ORcyUco
	lbn7tYkjg7i8IwuWI+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFREN-0000000CILC-3Pvu;
	Fri, 07 Jun 2024 04:29:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCS-0000000CGp9-44YD
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=1BhJrodjvl/4Jt9yiGYdcmp4qG1MXtWAta9HjhGnfjw=; b=vEAWnkENcbjE4p7jEeS8TyBGfG
	KM+RPatTSkI8Qrkcqpgo9IdyfuuwZOgv9bwg2keEfvnzLtna+JytWwFpmwpBnAqVZqNsUDxffs2CN
	Y7rBTbZlfzEJ/5olP/HPye847waJK/cxkZR5YNHIfRJKsftVZjkr+AXk3xxuvNK1CauFOSeGO6UX/
	YH78xVWRQS7MuSHReiOpWemMVdWosxIzSvB8i0rQEzJ/cFVCKBcuUS46wjUB8/j04d0c2mzx771v4
	PHacWi4y3FiLuvSmOSD2To0202I+YXudT/7/49yqZoK3yXz3RASJQnVSH9biEX98K+T1fXyeM0qGT
	a060fEzw==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCN-00000004Tsl-0yRz
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:35 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4VwSkv1hdfzPpnW;
	Fri,  7 Jun 2024 12:24:07 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 84686180085;
	Fri,  7 Jun 2024 12:27:26 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:18 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 070/110] fsck.ubifs: rebuild_fs: Re-write data
Date: Fri, 7 Jun 2024 12:25:35 +0800
Message-ID: <20240607042615.2069840-71-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052732_003855_7BAA25D3 
X-CRM114-Status: GOOD (  17.29  )
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

This is the 8/12 step of rebuilding. Re-write data. Read data from
LEB and write back data, make sure that all LEB is ended with empty
data(0xFF). It will prevent failed gc scanning in next mounting.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/fsck.ubifs.h |   2 +
 ubifs-utils/fsck.ubifs/rebuild_fs.c | 107 ++++++++++++++++++++++++++++--------
 ubifs-utils/libubifs/ubifs.h        |   2 +
 3 files changed, 89 insertions(+), 22 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index 0b065935..f027ec3f 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -181,10 +181,12 @@ struct scanned_file {
 /**
  * ubifs_rebuild_info - UBIFS rebuilding information.
  * @used_lebs: a bitmap used for recording used lebs
+ * @lpts: lprops table
  * @scanned_files: tree of all scanned files
  */
 struct ubifs_rebuild_info {
 	unsigned long *used_lebs;
+	struct ubifs_lprops *lpts;
 	struct rb_root scanned_files;
 };
 
diff --git a/ubifs-utils/fsck.ubifs/rebuild_fs.c b/ubifs-utils/fsck.ubifs/rebuild_fs.c
index f5412f08..1b03d6c0 100644
--- a/ubifs-utils/fsck.ubifs/rebuild_fs.c
+++ b/ubifs-utils/fsck.ubifs/rebuild_fs.c
@@ -58,9 +58,18 @@ static int init_rebuild_info(struct ubifs_info *c)
 		log_err(c, errno, "can not allocate bitmap of used lebs");
 		goto free_rebuild;
 	}
+	FSCK(c)->rebuild->lpts = kzalloc(sizeof(struct ubifs_lprops) * c->main_lebs,
+					 GFP_KERNEL);
+	if (!FSCK(c)->rebuild->lpts) {
+		err = -ENOMEM;
+		log_err(c, errno, "can not allocate lpts");
+		goto free_used_lebs;
+	}
 
 	return 0;
 
+free_used_lebs:
+	kfree(FSCK(c)->rebuild->used_lebs);
 free_rebuild:
 	kfree(FSCK(c)->rebuild);
 free_sbuf:
@@ -70,6 +79,7 @@ free_sbuf:
 
 static void destroy_rebuild_info(struct ubifs_info *c)
 {
+	kfree(FSCK(c)->rebuild->lpts);
 	kfree(FSCK(c)->rebuild->used_lebs);
 	kfree(FSCK(c)->rebuild);
 	vfree(c->sbuf);
@@ -461,9 +471,13 @@ static void remove_del_nodes(struct ubifs_info *c, struct scanned_info *si)
 
 		valid_ino_node = lookup_valid_ino_node(c, si, del_ino_node);
 		if (valid_ino_node) {
-			int lnum = del_ino_node->header.lnum;
+			int lnum = del_ino_node->header.lnum - c->main_first;
+			int pos = del_ino_node->header.offs +
+				  ALIGN(del_ino_node->header.len, 8);
 
-			set_bit(lnum - c->main_first, FSCK(c)->rebuild->used_lebs);
+			set_bit(lnum, FSCK(c)->rebuild->used_lebs);
+			FSCK(c)->rebuild->lpts[lnum].end =
+				max_t(int, FSCK(c)->rebuild->lpts[lnum].end, pos);
 			rb_erase(&valid_ino_node->rb, &si->valid_inos);
 			kfree(valid_ino_node);
 		}
@@ -479,9 +493,13 @@ static void remove_del_nodes(struct ubifs_info *c, struct scanned_info *si)
 
 		valid_dent_node = lookup_valid_dent_node(c, si, del_dent_node);
 		if (valid_dent_node) {
-			int lnum = del_dent_node->header.lnum;
+			int lnum = del_dent_node->header.lnum - c->main_first;
+			int pos = del_dent_node->header.offs +
+				  ALIGN(del_dent_node->header.len, 8);
 
-			set_bit(lnum - c->main_first, FSCK(c)->rebuild->used_lebs);
+			set_bit(lnum, FSCK(c)->rebuild->used_lebs);
+			FSCK(c)->rebuild->lpts[lnum].end =
+				max_t(int, FSCK(c)->rebuild->lpts[lnum].end, pos);
 			rb_erase(&valid_dent_node->rb, &si->valid_dents);
 			kfree(valid_dent_node);
 		}
@@ -667,10 +685,21 @@ static const char *get_file_name(struct ubifs_info *c, struct scanned_file *file
 	return name;
 }
 
+static void parse_node_location(struct ubifs_info *c, struct scanned_node *sn)
+{
+	int lnum, pos;
+
+	lnum = sn->lnum - c->main_first;
+	pos = sn->offs + ALIGN(sn->len, 8);
+
+	set_bit(lnum, FSCK(c)->rebuild->used_lebs);
+	FSCK(c)->rebuild->lpts[lnum].end = max_t(int,
+					FSCK(c)->rebuild->lpts[lnum].end, pos);
+}
+
 static void record_file_used_lebs(struct ubifs_info *c,
 				  struct scanned_file *file)
 {
-	int lnum;
 	struct rb_node *node;
 	struct scanned_file *xattr_file;
 	struct scanned_dent_node *dent_node;
@@ -682,26 +711,21 @@ static void record_file_used_lebs(struct ubifs_info *c,
 		 ubifs_get_type_name(ubifs_get_dent_type(file->ino.mode)),
 		 c->dev_name);
 
-	lnum = file->ino.header.lnum;
-	set_bit(lnum - c->main_first, FSCK(c)->rebuild->used_lebs);
+	parse_node_location(c, &file->ino.header);
 
-	if (file->trun.header.exist) {
-		lnum = file->trun.header.lnum;
-		set_bit(lnum - c->main_first, FSCK(c)->rebuild->used_lebs);
-	}
+	if (file->trun.header.exist)
+		parse_node_location(c, &file->trun.header);
 
 	for (node = rb_first(&file->data_nodes); node; node = rb_next(node)) {
 		data_node = rb_entry(node, struct scanned_data_node, rb);
 
-		lnum = data_node->header.lnum;
-		set_bit(lnum - c->main_first, FSCK(c)->rebuild->used_lebs);
+		parse_node_location(c, &data_node->header);
 	}
 
 	for (node = rb_first(&file->dent_nodes); node; node = rb_next(node)) {
 		dent_node = rb_entry(node, struct scanned_dent_node, rb);
 
-		lnum = dent_node->header.lnum;
-		set_bit(lnum - c->main_first, FSCK(c)->rebuild->used_lebs);
+		parse_node_location(c, &dent_node->header);
 	}
 
 	for (node = rb_first(&file->xattr_files); node; node = rb_next(node)) {
@@ -712,22 +736,57 @@ static void record_file_used_lebs(struct ubifs_info *c,
 }
 
 /**
- * record_used_lebs - record used LEBs.
+ * traverse_files_and_nodes - traverse all nodes from valid files.
  * @c: UBIFS file-system description object
  *
- * This function records all used LEBs which may hold useful nodes, then left
- * unused LEBs could be taken for storing new index tree.
+ * This function traverses all nodes from valid files and does following
+ * things:
+ * 1. Record all used LEBs which may hold useful nodes, then left unused
+ *    LEBs could be taken for storing new index tree.
+ * 2. Re-write data to prevent failed gc scanning in the subsequent mounting
+ *    process caused by corrupted data.
  */
-static void record_used_lebs(struct ubifs_info *c)
+static int traverse_files_and_nodes(struct ubifs_info *c)
 {
+	int i, err = 0;
+	struct rb_node *node;
 	struct scanned_file *file;
 	struct rb_root *tree = &FSCK(c)->rebuild->scanned_files;
 
+	log_out(c, "Record used LEBs");
 	for (node = rb_first(tree); node; node = rb_next(node)) {
 		file = rb_entry(node, struct scanned_file, rb);
 
 		record_file_used_lebs(c, file);
 	}
+
+	/* Re-write data. */
+	log_out(c, "Re-write data");
+	for (i = 0; i < c->main_lebs; ++i) {
+		int lnum, len, end;
+
+		if (!test_bit(i, FSCK(c)->rebuild->used_lebs))
+			continue;
+
+		lnum = i + c->main_first;
+		dbg_fsck("re-write LEB %d, in %s", lnum, c->dev_name);
+
+		end = FSCK(c)->rebuild->lpts[i].end;
+		len = ALIGN(end, c->min_io_size);
+
+		err = ubifs_leb_read(c, lnum, c->sbuf, 0, len, 0);
+		if (err && err != -EBADMSG)
+			return err;
+
+		if (len > end)
+			ubifs_pad(c, c->sbuf + end, len - end);
+
+		err = ubifs_leb_change(c, lnum, c->sbuf, len);
+		if (err)
+			return err;
+	}
+
+	return err;
 }
 
 /**
@@ -788,9 +847,13 @@ int ubifs_rebuild_filesystem(struct ubifs_info *c)
 		goto out;
 	}
 
-	/* Step 7: Record used LEBs. */
-	log_out(c, "Record used LEBs");
-	record_used_lebs(c);
+	/*
+	 * Step 7: Record used LEBs.
+	 * Step 8: Re-write data to clean corrupted data.
+	 */
+	err = traverse_files_and_nodes(c);
+	if (err)
+		exit_code |= FSCK_ERROR;
 
 out:
 	destroy_scanned_info(c, &si);
diff --git a/ubifs-utils/libubifs/ubifs.h b/ubifs-utils/libubifs/ubifs.h
index e6de7cea..c9d582da 100644
--- a/ubifs-utils/libubifs/ubifs.h
+++ b/ubifs-utils/libubifs/ubifs.h
@@ -337,6 +337,7 @@ enum {
  * @dirty: amount of dirty space in bytes
  * @flags: LEB properties flags (see above)
  * @lnum: LEB number
+ * @end: the end postition of LEB calculated by the last node
  * @list: list of same-category lprops (for LPROPS_EMPTY and LPROPS_FREEABLE)
  * @hpos: heap position in heap of same-category lprops (other categories)
  */
@@ -345,6 +346,7 @@ struct ubifs_lprops {
 	int dirty;
 	int flags;
 	int lnum;
+	int end;
 	union {
 		struct list_head list;
 		int hpos;
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
