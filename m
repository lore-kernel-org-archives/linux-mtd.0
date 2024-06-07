Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DD5C27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oVHrvrctNzCpqIMN6PlElzXrZoa1xIZR4HcYi9nWG6g=; b=vwVou1mscKqFY/
	xH6AJ42ZZEUjp0xMwQzKhjxUPbPSvU149sPpZbO2DBW+vFye9ecLLqdTpi1nfeSfel6kwY1XDthJs
	FxI9nqlUYseyEfPYbkXN1Jrpd6DQZg+tE43OaxSN+F/3WkghSYP+BhcAtKFxB9UKm8tiq54b4b0vb
	a4g538Swk9Rv03S8oyksUpOTraMuOmjPR45oeOfQM6ga7BJANkPfhql+0Y3tZEe3Q218XM85c+/2Y
	ymiEi2K9Ft81vYVTT8D9LP0tKOWWcU121tOda4/2MGgEZ4bcAD//SgYwsSsipKUVhCgz0Q/KXOpIG
	kF3VVPx+nzxW2yJavLfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRGc-0000000CK72-2p1E;
	Fri, 07 Jun 2024 04:31:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRD8-0000000CHMz-1Rc5
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=iCZ6yH4mzp/0+3sJR0PQyflZFs79iIYflMDCyLUgUzg=; b=kRCpLQw3PQCmwKDbtmzVtipmA2
	XztIgZ8JPp6R3vUHcKst9OfBMicpR3l53+HOsXo97wQEH5e1E/x9q9Jq94ysYTb0HW2MkynztgFwZ
	g384oLwr3NTG8Jc/P3e3XOJEHBezcr7nryLN4sLofypGYPr6rFV/E1aMv2dWGKT2LK5ifSn5gRYVt
	DKtV/3HHMN+dY+5No+rzvFgiNYg8+Ib8gBPprITjVD8NfFUwfFXIzWrO2DV+mAXWZaon31W0AcjQ3
	PitUgE6Rya0rlBMem4EhViArTLtk76y2tWfjjvNLHuGN6jaYJmm4/Zvs0uDzXaFixGVg3L7WxAreU
	Z5ZEKKkA==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRD4-00000004UA7-1BUD
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:28:16 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSkQ4KjXzsTSr;
	Fri,  7 Jun 2024 12:23:42 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 43225180085;
	Fri,  7 Jun 2024 12:27:41 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:31 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 087/110] fsck.ubifs: Check and correct files' information
Date: Fri, 7 Jun 2024 12:25:52 +0800
Message-ID: <20240607042615.2069840-88-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052814_986851_A9257FD5 
X-CRM114-Status: GOOD (  16.03  )
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

From: Xiang Yang <xiangyang3@huawei.com>

This is the 10/18 step of fsck. Check and handle inconsistent files, the
checking rule is same as rebuild mode which has been implemented in
check_and_correct_files, but the methods of handling are different:
 1. Correct the file information for safe mode, danger mode and normal
    mode with 'yes' answer, other modes will exit.

Signed-off-by: Xiang Yang <xiangyang3@huawei.com>
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/extract_files.c | 76 ++++++++++++++++++++++------------
 ubifs-utils/fsck.ubifs/fsck.ubifs.c    |  8 ++++
 ubifs-utils/fsck.ubifs/fsck.ubifs.h    |  2 +-
 ubifs-utils/fsck.ubifs/problem.c       | 16 +++++++
 4 files changed, 74 insertions(+), 28 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/extract_files.c b/ubifs-utils/fsck.ubifs/extract_files.c
index b24445be..c83d3774 100644
--- a/ubifs-utils/fsck.ubifs/extract_files.c
+++ b/ubifs-utils/fsck.ubifs/extract_files.c
@@ -1292,8 +1292,8 @@ reachable:
  * data nodes and truncation node. The calculated informaion will be used
  * to correct inode node.
  */
-static void calculate_file_info(struct ubifs_info *c, struct scanned_file *file,
-				struct rb_root *file_tree)
+static int calculate_file_info(struct ubifs_info *c, struct scanned_file *file,
+			       struct rb_root *file_tree)
 {
 	int nlink = 0;
 	bool corrupted_truncation = false;
@@ -1306,15 +1306,24 @@ static void calculate_file_info(struct ubifs_info *c, struct scanned_file *file,
 
 	for (node = rb_first(&file->xattr_files); node; node = rb_next(node)) {
 		xattr_file = rb_entry(node, struct scanned_file, rb);
+		dent_node = rb_entry(rb_first(&xattr_file->dent_nodes),
+				     struct scanned_dent_node, rb);
 
+		ubifs_assert(c, xattr_file->ino.is_xattr);
 		ubifs_assert(c, !rb_first(&xattr_file->xattr_files));
-		calculate_file_info(c, xattr_file, file_tree);
+		xattr_file->calc_nlink = 1;
+		xattr_file->calc_size = xattr_file->ino.size;
+
+		file->calc_xcnt += 1;
+		file->calc_xsz += CALC_DENT_SIZE(dent_node->nlen);
+		file->calc_xsz += CALC_XATTR_BYTES(xattr_file->ino.size);
+		file->calc_xnms += dent_node->nlen;
 	}
 
 	if (file->inum == UBIFS_ROOT_INO) {
 		file->calc_nlink += 2;
 		file->calc_size += UBIFS_INO_NODE_SZ;
-		return;
+		return 0;
 	}
 
 	if (S_ISDIR(file->ino.mode)) {
@@ -1326,29 +1335,11 @@ static void calculate_file_info(struct ubifs_info *c, struct scanned_file *file,
 		parent_file = lookup_file(file_tree, key_inum(c, &dent_node->key));
 		if (!parent_file) {
 			ubifs_assert(c, 0);
-			return;
+			return 0;
 		}
 		parent_file->calc_nlink += 1;
 		parent_file->calc_size += CALC_DENT_SIZE(dent_node->nlen);
-		return;
-	}
-
-	if (file->ino.is_xattr) {
-		file->calc_nlink = 1;
-		file->calc_size = file->ino.size;
-
-		dent_node = rb_entry(rb_first(&file->dent_nodes),
-				     struct scanned_dent_node, rb);
-		parent_file = lookup_file(file_tree, key_inum(c, &dent_node->key));
-		if (!parent_file) {
-			ubifs_assert(c, 0);
-			return;
-		}
-		parent_file->calc_xcnt += 1;
-		parent_file->calc_xsz += CALC_DENT_SIZE(dent_node->nlen);
-		parent_file->calc_xsz += CALC_XATTR_BYTES(file->ino.size);
-		parent_file->calc_xnms += dent_node->nlen;
-		return;
+		return 0;
 	}
 
 	for (node = rb_first(&file->dent_nodes); node; node = rb_next(node)) {
@@ -1359,7 +1350,7 @@ static void calculate_file_info(struct ubifs_info *c, struct scanned_file *file,
 		parent_file = lookup_file(file_tree, key_inum(c, &dent_node->key));
 		if (!parent_file) {
 			ubifs_assert(c, 0);
-			return;
+			return 0;
 		}
 		parent_file->calc_size += CALC_DENT_SIZE(dent_node->nlen);
 	}
@@ -1368,7 +1359,7 @@ static void calculate_file_info(struct ubifs_info *c, struct scanned_file *file,
 	if (!S_ISREG(file->ino.mode)) {
 		/* No need to verify i_size for symlink/sock/block/char/fifo. */
 		file->calc_size = file->ino.size;
-		return;
+		return 0;
 	}
 
 	/*
@@ -1452,10 +1443,22 @@ drop_data:
 		data_node = list_entry(drop_list.next, struct scanned_data_node,
 				       list);
 
+		if (FSCK(c)->mode != REBUILD_MODE) {
+			/*
+			 * Don't ask, inconsistent file correcting will be
+			 * asked in function correct_file_info().
+			 */
+			int err = delete_node(c, &data_node->key,
+				data_node->header.lnum, data_node->header.offs);
+			if (err)
+				return err;
+		}
 		list_del(&data_node->list);
 		rb_erase(&data_node->rb, &file->data_nodes);
 		kfree(data_node);
 	}
+
+	return 0;
 }
 
 /**
@@ -1490,6 +1493,7 @@ static int correct_file_info(struct ubifs_info *c, struct scanned_file *file)
 	    file->calc_size == file->ino.size)
 		return 0;
 
+	handle_invalid_file(c, FILE_IS_INCONSISTENT, file, NULL);
 	lnum = file->ino.header.lnum;
 	dbg_fsck("correct file(inum:%lu type:%s), nlink %u->%u, xattr cnt %u->%u, xattr size %u->%u, xattr names %u->%u, size %llu->%llu, at %d:%d, in %s",
 		 file->inum, file->ino.is_xattr ? "xattr" :
@@ -1537,7 +1541,9 @@ int check_and_correct_files(struct ubifs_info *c)
 	for (node = rb_first(tree); node; node = rb_next(node)) {
 		file = rb_entry(node, struct scanned_file, rb);
 
-		calculate_file_info(c, file, tree);
+		err = calculate_file_info(c, file, tree);
+		if (err)
+			return err;
 	}
 
 	for (node = rb_first(tree); node; node = rb_next(node)) {
@@ -1548,5 +1554,21 @@ int check_and_correct_files(struct ubifs_info *c)
 			return err;
 	}
 
+	if (list_empty(&FSCK(c)->disconnected_files))
+		return 0;
+
+	ubifs_assert(c, FSCK(c)->mode != REBUILD_MODE);
+	list_for_each_entry(file, &FSCK(c)->disconnected_files, list) {
+		err = calculate_file_info(c, file, tree);
+		if (err)
+			return err;
+
+		/* Reset disconnected file's nlink as one. */
+		file->calc_nlink = 1;
+		err = correct_file_info(c, file);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index fd4890a0..85a5baf0 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -460,6 +460,13 @@ static int do_fsck(void)
 		goto free_disconnected_files;
 	}
 
+	log_out(c, "Check and correct files");
+	err = check_and_correct_files(c);
+	if (err) {
+		exit_code |= FSCK_ERROR;
+		goto free_disconnected_files;
+	}
+
 free_disconnected_files:
 	destroy_file_list(c, &FSCK(c)->disconnected_files);
 free_used_lebs:
@@ -504,6 +511,7 @@ int main(int argc, char *argv[])
 	 * Step 7: Update files' size
 	 * Step 8: Check and handle invalid files
 	 * Step 9: Check and handle unreachable files
+	 * Step 10: Check and correct files
 	 */
 	err = do_fsck();
 	if (err && FSCK(c)->try_rebuild) {
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index ba4771a3..d1423c01 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -43,7 +43,7 @@ enum { SB_CORRUPTED = 0, MST_CORRUPTED, LOG_CORRUPTED, BUD_CORRUPTED,
        FILE_HAS_0_NLINK_INODE, FILE_HAS_INCONSIST_TYPE, FILE_HAS_TOO_MANY_DENT,
        FILE_SHOULDNT_HAVE_DATA, FILE_HAS_NO_DENT, XATTR_HAS_NO_HOST,
        XATTR_HAS_WRONG_HOST, FILE_HAS_NO_ENCRYPT, FILE_IS_DISCONNECTED,
-       FILE_ROOT_HAS_DENT, DENTRY_IS_UNREACHABLE };
+       FILE_ROOT_HAS_DENT, DENTRY_IS_UNREACHABLE, FILE_IS_INCONSISTENT };
 
 enum { HAS_DATA_CORRUPTED = 1, HAS_TNC_CORRUPTED = 2 };
 
diff --git a/ubifs-utils/fsck.ubifs/problem.c b/ubifs-utils/fsck.ubifs/problem.c
index 0395a34f..e8f08606 100644
--- a/ubifs-utils/fsck.ubifs/problem.c
+++ b/ubifs-utils/fsck.ubifs/problem.c
@@ -59,6 +59,7 @@ static const struct fsck_problem problem_table[] = {
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX, "File is disconnected(regular file without dentries)"},	// FILE_IS_DISCONNECTED
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Root dir should not have a dentry"},	// FILE_ROOT_HAS_DENT
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Dentry is unreachable"},	// DENTRY_IS_UNREACHABLE
+	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX, "File is inconsistent"},	// FILE_IS_INCONSISTENT
 };
 
 static const char *get_question(const struct fsck_problem *problem,
@@ -212,6 +213,21 @@ static void print_problem(const struct ubifs_info *c,
 			key_type(c, &dent_node->key) == UBIFS_XENT_KEY ? "(xattr)" : "");
 		break;
 	}
+	case FILE_IS_INCONSISTENT:
+	{
+		const struct invalid_file_problem *ifp = (const struct invalid_file_problem *)priv;
+		const struct scanned_file *file = ifp->file;
+
+		log_out(c, "problem: %s, ino %lu type %s, nlink %u xcnt %u xsz %u xnms %u size %llu, "
+			"should be nlink %u xcnt %u xsz %u xnms %u size %llu",
+			problem->desc, file->inum,
+			file->ino.is_xattr ? "xattr" : ubifs_get_type_name(ubifs_get_dent_type(file->ino.mode)),
+			file->ino.nlink, file->ino.xcnt, file->ino.xsz,
+			file->ino.xnms, file->ino.size,
+			file->calc_nlink, file->calc_xcnt, file->calc_xsz,
+			file->calc_xnms, file->calc_size);
+		break;
+	}
 	default:
 		log_out(c, "problem: %s", problem->desc);
 		break;
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
