Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AB7D2E9CA
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54wKo8p/jcKWPRWc4pnwhyvW8ZJBrngSKXACLa9v++c=; b=M9ZpbbFtJk9cNH
	iLdTC0HrhE7C03FTsheIwCOTLHHrICwWuTZ7Uv/l9kCAhy5Y57GTX0+02orYJ6Z1SRQ59re9Ii+Oh
	3e9JmNGUZmb5NM4+5mMt9bkSQgGMJFWmNm4VBNnGkb3JbcZc2K7jb1V4CJ/Mn1ydOrIWGmiaNXeja
	SUaM+X6Dtni2IeLRRpKswHy0JjAFiJ4Ywm5vYsumZbDq7QxdJQ7qLLqZuMSDdzZSvjiu8G3tiMT5r
	ERUiyYUYF2vslhQHLbVSuyquojAFjR4fJjU/Bjjo4nHPlgiMU8Zd8CuBbeQeVMIRQ91Y/G6Qt+0uT
	ZpNR6neBLOH9AeVGXdWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQj-0000000H0NK-004S;
	Mon, 11 Nov 2024 09:09:53 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQe-0000000H0Iw-3Maj
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:09:51 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Xn3cc662gzQsrb;
	Mon, 11 Nov 2024 17:08:32 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 522A71400DC;
	Mon, 11 Nov 2024 17:09:45 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:09:44 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 075/102] fsck.ubifs: Update files' size for check mode
Date: Mon, 11 Nov 2024 17:08:03 +0800
Message-ID: <20241111090832.2093596-6-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_010949_185583_BE375168 
X-CRM114-Status: GOOD (  14.91  )
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

This is the 7/18 step of fsck. Update files' size according to size
tree for check mode, now all files are updated after replaying journal.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/check_files.c | 45 ++++++++++++++++++++++++++++++++++++
 ubifs-utils/fsck.ubifs/fsck.ubifs.c  |  3 +++
 ubifs-utils/fsck.ubifs/fsck.ubifs.h  |  1 +
 ubifs-utils/libubifs/recovery.c      | 16 -------------
 ubifs-utils/libubifs/ubifs.h         | 16 +++++++++++++
 5 files changed, 65 insertions(+), 16 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/check_files.c b/ubifs-utils/fsck.ubifs/check_files.c
index 29848c4e..0fd6b32a 100644
--- a/ubifs-utils/fsck.ubifs/check_files.c
+++ b/ubifs-utils/fsck.ubifs/check_files.c
@@ -309,3 +309,48 @@ out:
 	}
 	return err;
 }
+
+/**
+ * update_files_size - Update files' size.
+ * @c: UBIFS file-system description object
+ *
+ * This function updates files' size according to @c->size_tree for check mode.
+ */
+void update_files_size(struct ubifs_info *c)
+{
+	struct rb_node *this;
+
+	if (FSCK(c)->mode != CHECK_MODE) {
+		/* Other modes(rw) have updated inode size in place. */
+		dbg_fsck("skip updating files' size%s, in %s",
+			 mode_name(c), c->dev_name);
+		return;
+	}
+
+	log_out(c, "Update files' size");
+
+	this = rb_first(&c->size_tree);
+	while (this) {
+		struct size_entry *e;
+
+		e = rb_entry(this, struct size_entry, rb);
+		this = rb_next(this);
+
+		if (e->exists && e->i_size < e->d_size) {
+			struct scanned_file *file;
+
+			file = lookup_file(&FSCK(c)->scanned_files, e->inum);
+			if (file && file->ino.header.exist &&
+			    file->ino.size < e->d_size) {
+				dbg_fsck("update file(%lu) size %llu->%llu, in %s",
+					 e->inum, file->ino.size,
+					 (unsigned long long)e->d_size,
+					 c->dev_name);
+				file->ino.size = e->d_size;
+			}
+		}
+
+		rb_erase(&e->rb, &c->size_tree);
+		kfree(e);
+	}
+}
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index c0b1bf69..ec42fa73 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -443,6 +443,8 @@ static int do_fsck(void)
 		return err;
 	}
 
+	update_files_size(c);
+
 	kfree(FSCK(c)->used_lebs);
 	destroy_file_tree(c, &FSCK(c)->scanned_files);
 	return err;
@@ -481,6 +483,7 @@ int main(int argc, char *argv[])
 
 	/*
 	 * Step 6: Traverse tnc and construct files
+	 * Step 7: Update files' size
 	 */
 	err = do_fsck();
 	if (err && FSCK(c)->try_rebuild) {
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index c917a0e3..4be38b45 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -297,5 +297,6 @@ int ubifs_rebuild_filesystem(struct ubifs_info *c);
 
 /* check_files.c */
 int traverse_tnc_and_construct_files(struct ubifs_info *c);
+void update_files_size(struct ubifs_info *c);
 
 #endif
diff --git a/ubifs-utils/libubifs/recovery.c b/ubifs-utils/libubifs/recovery.c
index a5133a0f..905e1645 100644
--- a/ubifs-utils/libubifs/recovery.c
+++ b/ubifs-utils/libubifs/recovery.c
@@ -1082,22 +1082,6 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 }
 
 /**
- * struct size_entry - inode size information for recovery.
- * @rb: link in the RB-tree of sizes
- * @inum: inode number
- * @i_size: size on inode
- * @d_size: maximum size based on data nodes
- * @exists: indicates whether the inode exists
- */
-struct size_entry {
-	struct rb_node rb;
-	ino_t inum;
-	loff_t i_size;
-	loff_t d_size;
-	int exists;
-};
-
-/**
  * add_ino - add an entry to the size tree.
  * @c: UBIFS file-system description object
  * @inum: inode number
diff --git a/ubifs-utils/libubifs/ubifs.h b/ubifs-utils/libubifs/ubifs.h
index 03150cdb..72497cd9 100644
--- a/ubifs-utils/libubifs/ubifs.h
+++ b/ubifs-utils/libubifs/ubifs.h
@@ -1297,6 +1297,22 @@ static inline int ubifs_authenticated(const struct ubifs_info *c)
 	return c->authenticated;
 }
 
+/**
+ * struct size_entry - inode size information for recovery.
+ * @rb: link in the RB-tree of sizes
+ * @inum: inode number
+ * @i_size: size on inode
+ * @d_size: maximum size based on data nodes
+ * @exists: indicates whether the inode exists
+ */
+struct size_entry {
+	struct rb_node rb;
+	ino_t inum;
+	loff_t i_size;
+	loff_t d_size;
+	int exists;
+};
+
 #ifdef WITH_CRYPTO
 int ubifs_init_authentication(struct ubifs_info *c);
 int ubifs_shash_init(const struct ubifs_info *c, struct shash_desc *desc);
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
