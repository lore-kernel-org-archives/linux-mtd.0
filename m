Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC991D2E9C8
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4J6/jkxBDF9GseXY5/YRbodGkvBq2hOAaxgvUXTJcI=; b=Jxn61k7AZNQ30H
	zO+ZzWMQ6+5dmYNCFaUyH4Q/sBdPUXq9b2JZLGJtmEfAgjDLajpWqRF5EOA5y/9HNtGkwd6r9w/2N
	lY0RBaW06hQaXDeaJndbUL/6inJmUDxmO19ANu5B59VBYtiEoXTB2rtNzNxpvMs5Q35Iy1w2zLr3V
	xx1EVrkXZfsdAPTbFP3y+3bTa50qRh+c7um2R1rfJBwH4jFBs4rRJqy4clf8Qb175ymu/SLM91bll
	FhtPvF0z0XfUUsshcldOswWRe0hPcf9uXtwJPt8y5qFwTHaYMG26/V2ehbrbD290Qd1faZD/9+XA/
	maWJRIH+GjKXgi3yAlrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQRK-0000000H0sy-2n5m;
	Mon, 11 Nov 2024 09:10:30 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQj-0000000H0MU-0EQD
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:10:00 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Xn3bH7332z1TB6F;
	Mon, 11 Nov 2024 17:07:23 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 627871800A5;
	Mon, 11 Nov 2024 17:09:50 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:09:49 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 085/102] fsck.ubifs: Check and create the root dir
Date: Mon, 11 Nov 2024 17:08:13 +0800
Message-ID: <20241111090832.2093596-16-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_010953_605501_6A02A8E9 
X-CRM114-Status: GOOD (  17.88  )
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

This is the 15/18 step of fsck. Check whether the root dir is existed,
create a new one if it is not found. This step makes sure that filesystem
can be mounted successful.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/check_files.c | 29 +++++++++++++++++++++++++++++
 ubifs-utils/fsck.ubifs/fsck.ubifs.c  |  8 ++++++++
 ubifs-utils/fsck.ubifs/fsck.ubifs.h  |  4 +++-
 ubifs-utils/fsck.ubifs/problem.c     |  3 +++
 4 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/fsck.ubifs/check_files.c b/ubifs-utils/fsck.ubifs/check_files.c
index b9f31a7a..1e1a77b4 100644
--- a/ubifs-utils/fsck.ubifs/check_files.c
+++ b/ubifs-utils/fsck.ubifs/check_files.c
@@ -524,3 +524,32 @@ bool tnc_is_empty(struct ubifs_info *c)
 	 */
 	return c->zroot.znode->child_cnt == 0;
 }
+
+/**
+ * check_and_create_root - Check and create root dir.
+ * @c: UBIFS file-system description object
+ *
+ * This function checks whether the root dir is existed, create a new root
+ * dir if it doesn't exist. Returns zero in case of success, a negative error
+ * code in case of failure.
+ */
+int check_and_create_root(struct ubifs_info *c)
+{
+	int err;
+	struct ubifs_inode *ui = ubifs_lookup_by_inum(c, UBIFS_ROOT_INO);
+
+	if (!IS_ERR(ui)) {
+		/* The root dir is found. */
+		dbg_fsck("root dir is found, in %s", c->dev_name);
+		kfree(ui);
+		return 0;
+	}
+
+	err = PTR_ERR(ui);
+	if (err != -ENOENT)
+		return err;
+
+	fix_problem(c, ROOT_DIR_NOT_FOUND, NULL);
+	dbg_fsck("root dir is lost, create a new one, in %s", c->dev_name);
+	return ubifs_create_root(c);
+}
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index 80205aac..b97c8e3b 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -519,6 +519,13 @@ static int do_fsck(void)
 
 	log_out(c, "Check and correct the index size");
 	err = check_and_correct_index_size(c);
+	if (err) {
+		exit_code |= FSCK_ERROR;
+		goto free_disconnected_files_2;
+	}
+
+	log_out(c, "Check and create root dir");
+	err = check_and_create_root(c);
 	if (err)
 		exit_code |= FSCK_ERROR;
 
@@ -575,6 +582,7 @@ int main(int argc, char *argv[])
 	 * Step 12: Check and correct the space statistics
 	 * Step 13: Commit problem fixing modifications
 	 * Step 14: Check and correct the index size
+	 * Step 15: Check and create root dir
 	 */
 	err = do_fsck();
 	if (err && FSCK(c)->try_rebuild) {
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index ab498ad1..fb7ccca0 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -45,7 +45,8 @@ enum { SB_CORRUPTED = 0, MST_CORRUPTED, LOG_CORRUPTED, BUD_CORRUPTED,
        XATTR_HAS_WRONG_HOST, FILE_HAS_NO_ENCRYPT, FILE_IS_DISCONNECTED,
        FILE_ROOT_HAS_DENT, DENTRY_IS_UNREACHABLE, FILE_IS_INCONSISTENT,
        EMPTY_TNC, LPT_CORRUPTED, NNODE_INCORRECT, PNODE_INCORRECT,
-       LP_INCORRECT, SPACE_STAT_INCORRECT, LTAB_INCORRECT, INCORRECT_IDX_SZ };
+       LP_INCORRECT, SPACE_STAT_INCORRECT, LTAB_INCORRECT, INCORRECT_IDX_SZ,
+       ROOT_DIR_NOT_FOUND };
 
 enum { HAS_DATA_CORRUPTED = 1, HAS_TNC_CORRUPTED = 2 };
 
@@ -373,6 +374,7 @@ void update_files_size(struct ubifs_info *c);
 int handle_invalid_files(struct ubifs_info *c);
 int handle_dentry_tree(struct ubifs_info *c);
 bool tnc_is_empty(struct ubifs_info *c);
+int check_and_create_root(struct ubifs_info *c);
 
 /* check_space.c */
 int get_free_leb(struct ubifs_info *c);
diff --git a/ubifs-utils/fsck.ubifs/problem.c b/ubifs-utils/fsck.ubifs/problem.c
index 32182c91..8e7e1e15 100644
--- a/ubifs-utils/fsck.ubifs/problem.c
+++ b/ubifs-utils/fsck.ubifs/problem.c
@@ -68,6 +68,7 @@ static const struct fsck_problem problem_table[] = {
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX, "Incorrect space statistics"},	// SPACE_STAT_INCORRECT
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX, "Inconsistent properties for lprops table"},	// LTAB_INCORRECT
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX, "Incorrect index size"},	// INCORRECT_IDX_SZ
+	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX, "Root dir is lost"},	// ROOT_DIR_NOT_FOUND
 };
 
 static const char *get_question(const struct fsck_problem *problem,
@@ -105,6 +106,8 @@ static const char *get_question(const struct fsck_problem *problem,
 		return "Put it into disconnected list?";
 	case LPT_CORRUPTED:
 		return "Rebuild LPT?";
+	case ROOT_DIR_NOT_FOUND:
+		return "Create a new one?";
 	}
 
 	return "Fix it?";
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
