Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66173D5E392
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wg4lpFM40/KqPyec/otKBAgnP9Uec1j0uC/tp4xu3D4=; b=sDDw+fFDzIOrcn
	h2ufLzyvS5hdINs7YVbIQXd3zD+NJ7bPJ/RTtS+PoMcnebMHwVG/J3qp5CsX8guIEX2YYJt5cjYp3
	ugEuf+5IwzI3oI/f8UpD+HAJzdB89Y1LxkLWdTCz7VPoAmDMeMGSHk/RSjckMbPD/AS7c02X+/eVh
	krVQt0S8D2P0X8vf050S7bJ8apGnLJKMhvjL4hr7CsqOqg/YUXCt0AjYTLHvQVJcQ5gvy4uxQOXsV
	GHyk4sAzEZnQjCMy8J36xc3YkMn7jILe0E0E3rfbFEP2FXkLArvvAIGL5Z3g7jJu2bJD135MzmeYq
	hPxlj/fzsgpj7jFIKgow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPbJ-0000000GnAr-2cKa;
	Mon, 11 Nov 2024 08:16:45 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUV-0000000GZMZ-29Dt
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:45 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rV24zRzpZSC;
	Mon, 11 Nov 2024 15:03:38 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 6CA6F18007C;
	Mon, 11 Nov 2024 15:05:31 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:30 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 060/102] fsck.ubifs: rebuild_fs: Record used LEBs
Date: Mon, 11 Nov 2024 15:03:03 +0800
Message-ID: <20241111070346.1314122-61-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_230540_159299_5A3F4854 
X-CRM114-Status: GOOD (  14.20  )
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

This is the 7/12 step of rebuilding. Record used LEBs which may hold
useful nodes, then left unused LEBs could be taken for storing new index
tree. Notice, LEB that contains effective nodes on deleted trees in step
1 is regarded as used.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/fsck.ubifs.h |   2 +
 ubifs-utils/fsck.ubifs/rebuild_fs.c | 116 +++++++++++++++++++++++++++++++++++-
 2 files changed, 115 insertions(+), 3 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index bb5d1c49..a3b755bf 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -180,9 +180,11 @@ struct scanned_file {
 
 /**
  * ubifs_rebuild_info - UBIFS rebuilding information.
+ * @used_lebs: a bitmap used for recording used lebs
  * @scanned_files: tree of all scanned files
  */
 struct ubifs_rebuild_info {
+	unsigned long *used_lebs;
 	struct rb_root scanned_files;
 };
 
diff --git a/ubifs-utils/fsck.ubifs/rebuild_fs.c b/ubifs-utils/fsck.ubifs/rebuild_fs.c
index ecf6b0c6..3be08446 100644
--- a/ubifs-utils/fsck.ubifs/rebuild_fs.c
+++ b/ubifs-utils/fsck.ubifs/rebuild_fs.c
@@ -48,19 +48,29 @@ static int init_rebuild_info(struct ubifs_info *c)
 	if (!FSCK(c)->rebuild) {
 		err = -ENOMEM;
 		log_err(c, errno, "can not allocate rebuild info");
-		goto out;
+		goto free_sbuf;
 	}
 	FSCK(c)->rebuild->scanned_files = RB_ROOT;
+	FSCK(c)->rebuild->used_lebs = kcalloc(BITS_TO_LONGS(c->main_lebs),
+					      sizeof(unsigned long), GFP_KERNEL);
+	if (!FSCK(c)->rebuild->used_lebs) {
+		err = -ENOMEM;
+		log_err(c, errno, "can not allocate bitmap of used lebs");
+		goto free_rebuild;
+	}
 
 	return 0;
 
-out:
+free_rebuild:
+	kfree(FSCK(c)->rebuild);
+free_sbuf:
 	vfree(c->sbuf);
 	return err;
 }
 
 static void destroy_rebuild_info(struct ubifs_info *c)
 {
+	kfree(FSCK(c)->rebuild->used_lebs);
 	kfree(FSCK(c)->rebuild);
 	vfree(c->sbuf);
 }
@@ -451,6 +461,9 @@ static void remove_del_nodes(struct ubifs_info *c, struct scanned_info *si)
 
 		valid_ino_node = lookup_valid_ino_node(c, si, del_ino_node);
 		if (valid_ino_node) {
+			int lnum = del_ino_node->header.lnum;
+
+			set_bit(lnum - c->main_first, FSCK(c)->rebuild->used_lebs);
 			rb_erase(&valid_ino_node->rb, &si->valid_inos);
 			kfree(valid_ino_node);
 		}
@@ -466,6 +479,9 @@ static void remove_del_nodes(struct ubifs_info *c, struct scanned_info *si)
 
 		valid_dent_node = lookup_valid_dent_node(c, si, del_dent_node);
 		if (valid_dent_node) {
+			int lnum = del_dent_node->header.lnum;
+
+			set_bit(lnum - c->main_first, FSCK(c)->rebuild->used_lebs);
 			rb_erase(&valid_dent_node->rb, &si->valid_dents);
 			kfree(valid_dent_node);
 		}
@@ -627,6 +643,94 @@ static void extract_dentry_tree(struct ubifs_info *c)
 	}
 }
 
+static const char *get_file_name(struct ubifs_info *c, struct scanned_file *file)
+{
+	static char name[UBIFS_MAX_NLEN + 1];
+	struct rb_node *node;
+	struct scanned_dent_node *dent_node;
+
+	node = rb_first(&file->dent_nodes);
+	if (!node) {
+		ubifs_assert(c, file->inum == UBIFS_ROOT_INO);
+		return "/";
+	}
+
+	if (c->encrypted && !file->ino.is_xattr)
+		/* Encrypted file name. */
+		return "<encrypted>";
+
+	/* Get name from any one dentry. */
+	dent_node = rb_entry(node, struct scanned_dent_node, rb);
+	memcpy(name, dent_node->name, dent_node->nlen);
+	/* @dent->name could be non '\0' terminated. */
+	name[dent_node->nlen] = '\0';
+	return name;
+}
+
+static void record_file_used_lebs(struct ubifs_info *c,
+				  struct scanned_file *file)
+{
+	int lnum;
+	struct rb_node *node;
+	struct scanned_file *xattr_file;
+	struct scanned_dent_node *dent_node;
+	struct scanned_data_node *data_node;
+
+	dbg_fsck("recovered file(inum:%lu name:%s type:%s), in %s",
+		 file->inum, get_file_name(c, file),
+		 file->ino.is_xattr ? "xattr" :
+		 ubifs_get_type_name(ubifs_get_dent_type(file->ino.mode)),
+		 c->dev_name);
+
+	lnum = file->ino.header.lnum;
+	set_bit(lnum - c->main_first, FSCK(c)->rebuild->used_lebs);
+
+	if (file->trun.header.exist) {
+		lnum = file->trun.header.lnum;
+		set_bit(lnum - c->main_first, FSCK(c)->rebuild->used_lebs);
+	}
+
+	for (node = rb_first(&file->data_nodes); node; node = rb_next(node)) {
+		data_node = rb_entry(node, struct scanned_data_node, rb);
+
+		lnum = data_node->header.lnum;
+		set_bit(lnum - c->main_first, FSCK(c)->rebuild->used_lebs);
+	}
+
+	for (node = rb_first(&file->dent_nodes); node; node = rb_next(node)) {
+		dent_node = rb_entry(node, struct scanned_dent_node, rb);
+
+		lnum = dent_node->header.lnum;
+		set_bit(lnum - c->main_first, FSCK(c)->rebuild->used_lebs);
+	}
+
+	for (node = rb_first(&file->xattr_files); node; node = rb_next(node)) {
+		xattr_file = rb_entry(node, struct scanned_file, rb);
+
+		record_file_used_lebs(c, xattr_file);
+	}
+}
+
+/**
+ * record_used_lebs - record used LEBs.
+ * @c: UBIFS file-system description object
+ *
+ * This function records all used LEBs which may hold useful nodes, then left
+ * unused LEBs could be taken for storing new index tree.
+ */
+static void record_used_lebs(struct ubifs_info *c)
+{
+	struct rb_node *node;
+	struct scanned_file *file;
+	struct rb_root *tree = &FSCK(c)->rebuild->scanned_files;
+
+	for (node = rb_first(tree); node; node = rb_next(node)) {
+		file = rb_entry(node, struct scanned_file, rb);
+
+		record_file_used_lebs(c, file);
+	}
+}
+
 /**
  * ubifs_rebuild_filesystem - Rebuild filesystem.
  * @c: UBIFS file-system description object
@@ -680,8 +784,14 @@ int ubifs_rebuild_filesystem(struct ubifs_info *c)
 	/* Step 6: Check & correct files' information. */
 	log_out(c, "Check & correct file information");
 	err = check_and_correct_files(c);
-	if (err)
+	if (err) {
 		exit_code |= FSCK_ERROR;
+		goto out;
+	}
+
+	/* Step 7: Record used LEBs. */
+	log_out(c, "Record used LEBs");
+	record_used_lebs(c);
 
 out:
 	destroy_scanned_info(c, &si);
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
