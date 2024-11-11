Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DF9D2E9C3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIbujsYWE7J7Wt+lFD5G/bfrhZBl2eG5TSrzoK2LDV4=; b=ouPN7f6vXio7Se
	9smVEhbtnGzCKqJlTByYueBmTHcoho8Fz8gWN6voJdYys7SL4pmO2oJ8t3RGshIKFHsZI1TS/ZTLH
	LVm56Ehe/Jp+ci5DAWbennZKsbAayRD2OfI7pHXeE2ofEOhnzhvjFkCxxqznJ4cNJj2lwIHdnibUi
	BYbiR37As9KhdLucpM3Wgw4d33+8l6QHair/c+IZIZeaC4Dlh/NP8oLeBUVcQeYmZC3z+5W7cDYa4
	jh7hJE+CRaZgvAOnDII/6L02MOu3WjmLyFznz6DcklSVgkq8ePMueHNg31v9S58T83PEaKe0DHRKc
	XZ8fa1kCr/s5jCXMBR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQR9-0000000H0iP-1M4M;
	Mon, 11 Nov 2024 09:10:19 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQg-0000000H0J4-0SRM
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:09:56 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn3c01C5Lz1jy0m;
	Mon, 11 Nov 2024 17:08:00 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 56D8D180043;
	Mon, 11 Nov 2024 17:09:47 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:09:46 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 079/102] fsck.ubifs: Check whether the TNC is empty
Date: Mon, 11 Nov 2024 17:08:07 +0800
Message-ID: <20241111090832.2093596-10-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_010950_686158_1364CC9B 
X-CRM114-Status: GOOD (  17.92  )
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

This is the 11/18 step of fsck. Check whether the TNC is empty, turn to
rebuild_fs if it is not found. Can we recreate a new root dir to avoid
empty TNC? The answer is no, lpt fixing should be done before creating
new entry, but lpt fixing needs a committing before new dirty data
generated to ensure that bud data won't be overwritten(bud LEB could
become freeable after replaying journal, corrected lpt may treat it as
a free one to hold new data, see details in space checking & correcting
step). Then we have to create the new root dir after fixing lpt and a
committing, znode without children(empty TNC) maybe written on disk at
the moment of committing, which corrupts the UBIFS image. So we choose
to rebuild the filesystem if the TNC is empty, this case is equivalent
to corrupted TNC.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/check_files.c | 25 +++++++++++++++++++++++++
 ubifs-utils/fsck.ubifs/fsck.ubifs.c  |  7 +++++++
 ubifs-utils/fsck.ubifs/fsck.ubifs.h  |  4 +++-
 ubifs-utils/fsck.ubifs/problem.c     |  1 +
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/fsck.ubifs/check_files.c b/ubifs-utils/fsck.ubifs/check_files.c
index 2be96193..b9f31a7a 100644
--- a/ubifs-utils/fsck.ubifs/check_files.c
+++ b/ubifs-utils/fsck.ubifs/check_files.c
@@ -499,3 +499,28 @@ int handle_dentry_tree(struct ubifs_info *c)
 
 	return 0;
 }
+
+/**
+ * tnc_is_empty - Check whether the TNC is empty.
+ * @c: UBIFS file-system description object
+ *
+ * Returns %true if the TNC is empty, otherwise %false is returned.
+ */
+bool tnc_is_empty(struct ubifs_info *c)
+{
+	/*
+	 * Check whether the TNC is empty, turn to rebuild_fs if it is empty.
+	 * Can we recreate a new root dir to avoid empty TNC? The answer is no,
+	 * lpt fixing should be done before creating new entry, but lpt fixing
+	 * needs a committing before new dirty data generated to ensure that
+	 * bud data won't be overwritten(bud LEB could become freeable after
+	 * replaying journal, corrected lpt may treat it as a free one to hold
+	 * new data, see details in space checking & correcting step). Then we
+	 * have to create the new root dir after fixing lpt and a committing,
+	 * znode without children(empty TNC) maybe written on disk at the
+	 * moment of committing, which corrupts the UBIFS image. So we choose
+	 * to rebuild the filesystem if the TNC is empty, this case is
+	 * equivalent to corrupted TNC.
+	 */
+	return c->zroot.znode->child_cnt == 0;
+}
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index 3f61668e..cd498f55 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -467,6 +467,12 @@ static int do_fsck(void)
 		goto free_disconnected_files;
 	}
 
+	log_out(c, "Check whether the TNC is empty");
+	if (tnc_is_empty(c) && fix_problem(c, EMPTY_TNC, NULL)) {
+		err = -EINVAL;
+		FSCK(c)->try_rebuild = true;
+	}
+
 free_disconnected_files:
 	destroy_file_list(c, &FSCK(c)->disconnected_files);
 free_used_lebs:
@@ -512,6 +518,7 @@ int main(int argc, char *argv[])
 	 * Step 8: Check and handle invalid files
 	 * Step 9: Check and handle unreachable files
 	 * Step 10: Check and correct files
+	 * Step 11: Check whether the TNC is empty
 	 */
 	err = do_fsck();
 	if (err && FSCK(c)->try_rebuild) {
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index 32a991dd..3c0f2afb 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -43,7 +43,8 @@ enum { SB_CORRUPTED = 0, MST_CORRUPTED, LOG_CORRUPTED, BUD_CORRUPTED,
        FILE_HAS_0_NLINK_INODE, FILE_HAS_INCONSIST_TYPE, FILE_HAS_TOO_MANY_DENT,
        FILE_SHOULDNT_HAVE_DATA, FILE_HAS_NO_DENT, XATTR_HAS_NO_HOST,
        XATTR_HAS_WRONG_HOST, FILE_HAS_NO_ENCRYPT, FILE_IS_DISCONNECTED,
-       FILE_ROOT_HAS_DENT, DENTRY_IS_UNREACHABLE, FILE_IS_INCONSISTENT };
+       FILE_ROOT_HAS_DENT, DENTRY_IS_UNREACHABLE, FILE_IS_INCONSISTENT,
+       EMPTY_TNC };
 
 enum { HAS_DATA_CORRUPTED = 1, HAS_TNC_CORRUPTED = 2 };
 
@@ -318,5 +319,6 @@ int traverse_tnc_and_construct_files(struct ubifs_info *c);
 void update_files_size(struct ubifs_info *c);
 int handle_invalid_files(struct ubifs_info *c);
 int handle_dentry_tree(struct ubifs_info *c);
+bool tnc_is_empty(struct ubifs_info *c);
 
 #endif
diff --git a/ubifs-utils/fsck.ubifs/problem.c b/ubifs-utils/fsck.ubifs/problem.c
index e8f08606..795f05fa 100644
--- a/ubifs-utils/fsck.ubifs/problem.c
+++ b/ubifs-utils/fsck.ubifs/problem.c
@@ -60,6 +60,7 @@ static const struct fsck_problem problem_table[] = {
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Root dir should not have a dentry"},	// FILE_ROOT_HAS_DENT
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Dentry is unreachable"},	// DENTRY_IS_UNREACHABLE
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX, "File is inconsistent"},	// FILE_IS_INCONSISTENT
+	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA | PROBLEM_NEED_REBUILD, "TNC is empty"},	// EMPTY_TNC
 };
 
 static const char *get_question(const struct fsck_problem *problem,
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
