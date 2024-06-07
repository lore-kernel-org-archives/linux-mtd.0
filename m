Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E950C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMMGweVYB8tN4PVzAUfoW0RQCv3X0t4b+yldVqMfN0Y=; b=12TuwGMaNlrARe
	Hu0Npvul+QlA0JXnSmTP0+uhkm143Tj/nghK3ks7zj2d1AOORy/WdTFt4b9dSBiXW8IP3qnkYDEa+
	x1c4sRUKG4Q+7yGLkf5EdV7izvdeQD/PUL0poO+/TEcCV0HXKM2BdhDDeDbE8enC0qYgVCjXi6PpC
	7vThr927Qi6SSYVGYylwuNRNjIcc8V/u+0pQA8PMzlR8fNpVPlla4IzXBlEYotuCHIPrM9iFa9jaN
	asg0HjT/8RJZlXmRu5kOMgvivAFkn2Xh4rXlMsMfZOmRy0xlLhd9AxuSVt9CY/r1sLugOcEK89Xee
	CIozaqEekF8tf+9TquWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSES-0000000CVqC-42BC;
	Fri, 07 Jun 2024 05:33:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCu-0000000CHBG-0vaO
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=x6QeNIleKf4OmPkXl2E9KvQT8zt0YOi/U5GJYdYfcXk=; b=QRZGoTekr4Dgr1vs++WoaDm0hK
	kXVD9qhtCqxOXTWhEL4vUFomsUuLGyC72d3outjHMEf1PG+Rm3EYYv6ADOMfOBikwNDNMX10xb3+D
	1v7Gw2zUhRRy+s2MJgSFTmnTWX5lGnd2EIPL0MUcMvf7kIkPCKs+qiJ1mKkFfvjuTrwlRNBSKm3Kw
	hwhwf+qlIRmb22UQIv1b5tXdi0De87oGu1TnU0ryL6c8b3YZbBB1yQJq1+aJvsrSIdV9a3s61vmwC
	D0B8XZ+4gNfPV1hioLublJZcIRzsebWJRzEtDNJi8WySEPMpCv0UtiJPE3ilXmX5axybOTj9mPtUw
	7PxHy2mg==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCp-00000004U6f-23Ew
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:28:02 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSk75mGszsTSq;
	Fri,  7 Jun 2024 12:23:27 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 74106180AA6;
	Fri,  7 Jun 2024 12:27:26 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:17 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 069/110] fsck.ubifs: rebuild_fs: Record used LEBs
Date: Fri, 7 Jun 2024 12:25:34 +0800
Message-ID: <20240607042615.2069840-70-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052800_181285_FA561C01 
X-CRM114-Status: GOOD (  14.38  )
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
 ubifs-utils/fsck.ubifs/rebuild_fs.c | 115 +++++++++++++++++++++++++++++++++++-
 2 files changed, 114 insertions(+), 3 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index 124c8f12..0b065935 100644
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
index ecf6b0c6..f5412f08 100644
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
@@ -627,6 +643,93 @@ static void extract_dentry_tree(struct ubifs_info *c)
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
@@ -680,8 +783,14 @@ int ubifs_rebuild_filesystem(struct ubifs_info *c)
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
