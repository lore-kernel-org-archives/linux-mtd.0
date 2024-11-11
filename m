Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B43D2E9D5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7j2opw48YrJNhSnXYa+3EdAHJsxoK1X9f5+CcMaFL1Y=; b=do0+pPFQ/rsufY
	XpfbmsOkuTksONFjcxD7GpDxUJxyZoa4ofV4Leo2+dM21eW/5loVrEUwP4wv7idie75NTrIBEQ824
	A6adPHiZFRUB72LXzJXZO1N3rXWdmUdax40frCLnzRLiXry1R1oZVOb4OMirlnd+duqA8GhFPz7nx
	a7NqattLHgxvJUZcqhwuIc032bS7D3gEg1p7qIpgyyDn362CCUwQxQSSIn7SPuQXzT5flSpasG+E3
	d0wHLJ3/TK6p1Ut3DK3UCoxhAqI/aHnnK3ueU5utraEYcb4brEabjvoc1mbY0sbEWAbz5wbZbp/Uo
	p98GqI+VetYXyxWFQvHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARSY-0000000HFA7-3P97;
	Mon, 11 Nov 2024 10:15:50 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQg-0000000H0L4-3qjt
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:09:57 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xn3bw1ptBzpZQy;
	Mon, 11 Nov 2024 17:07:56 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 601561400D8;
	Mon, 11 Nov 2024 17:09:49 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:09:48 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 083/102] fsck.ubifs: Check and correct the index size
Date: Mon, 11 Nov 2024 17:08:11 +0800
Message-ID: <20241111090832.2093596-14-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_010951_320552_DC0EC395 
X-CRM114-Status: GOOD (  16.86  )
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

This is the 14/18 step of fsck. Check and correct the index size by
traversing TNC just like dbg_check_idx_size does. This step should
be executed after first committing, because 'c->calc_idx_sz' can be
changed in 'ubifs_tnc_start_commit' and the initial value of
'c->calc_idx_sz' read from disk is untrusted.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/check_space.c | 28 ++++++++++++++++++++++++++++
 ubifs-utils/fsck.ubifs/fsck.ubifs.c  |  8 ++++++++
 ubifs-utils/fsck.ubifs/fsck.ubifs.h  |  3 ++-
 ubifs-utils/fsck.ubifs/problem.c     |  9 +++++++++
 4 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/fsck.ubifs/check_space.c b/ubifs-utils/fsck.ubifs/check_space.c
index afe6ba0b..cff8a7c2 100644
--- a/ubifs-utils/fsck.ubifs/check_space.c
+++ b/ubifs-utils/fsck.ubifs/check_space.c
@@ -660,3 +660,31 @@ rebuild:
 
 	return err;
 }
+
+/**
+ * check_and_correct_index_size - check & correct the index size.
+ * @c: UBIFS file-system description object
+ *
+ * This function checks and corrects the index size by traversing TNC: Returns
+ * zero in case of success, a negative error code in case of failure.
+ */
+int check_and_correct_index_size(struct ubifs_info *c)
+{
+	int err;
+	unsigned long long index_size = 0;
+
+	ubifs_assert(c, c->bi.old_idx_sz == c->calc_idx_sz);
+	err = dbg_walk_index(c, NULL, add_size, &index_size);
+	if (err) {
+		/* All TNC nodes must be accessible. */
+		ubifs_assert(c, !get_failure_reason_callback(c));
+		return err;
+	}
+
+	dbg_fsck("total index size %llu, in %s", index_size, c->dev_name);
+	if (index_size != c->calc_idx_sz &&
+	    fix_problem(c, INCORRECT_IDX_SZ, &index_size))
+		c->bi.old_idx_sz = c->calc_idx_sz = index_size;
+
+	return 0;
+}
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index 07ed8171..80205aac 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -512,6 +512,13 @@ static int do_fsck(void)
 	}
 
 	err = commit_fix_modifications(c);
+	if (err) {
+		exit_code |= FSCK_ERROR;
+		goto free_disconnected_files_2;
+	}
+
+	log_out(c, "Check and correct the index size");
+	err = check_and_correct_index_size(c);
 	if (err)
 		exit_code |= FSCK_ERROR;
 
@@ -567,6 +574,7 @@ int main(int argc, char *argv[])
 	 * Step 11: Check whether the TNC is empty
 	 * Step 12: Check and correct the space statistics
 	 * Step 13: Commit problem fixing modifications
+	 * Step 14: Check and correct the index size
 	 */
 	err = do_fsck();
 	if (err && FSCK(c)->try_rebuild) {
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index 00c157a4..ab498ad1 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -45,7 +45,7 @@ enum { SB_CORRUPTED = 0, MST_CORRUPTED, LOG_CORRUPTED, BUD_CORRUPTED,
        XATTR_HAS_WRONG_HOST, FILE_HAS_NO_ENCRYPT, FILE_IS_DISCONNECTED,
        FILE_ROOT_HAS_DENT, DENTRY_IS_UNREACHABLE, FILE_IS_INCONSISTENT,
        EMPTY_TNC, LPT_CORRUPTED, NNODE_INCORRECT, PNODE_INCORRECT,
-       LP_INCORRECT, SPACE_STAT_INCORRECT, LTAB_INCORRECT };
+       LP_INCORRECT, SPACE_STAT_INCORRECT, LTAB_INCORRECT, INCORRECT_IDX_SZ };
 
 enum { HAS_DATA_CORRUPTED = 1, HAS_TNC_CORRUPTED = 2 };
 
@@ -379,5 +379,6 @@ int get_free_leb(struct ubifs_info *c);
 int build_lpt(struct ubifs_info *c, calculate_lp_callback calculate_lp_cb,
 	      bool free_ltab);
 int check_and_correct_space(struct ubifs_info *c);
+int check_and_correct_index_size(struct ubifs_info *c);
 
 #endif
diff --git a/ubifs-utils/fsck.ubifs/problem.c b/ubifs-utils/fsck.ubifs/problem.c
index f987e480..32182c91 100644
--- a/ubifs-utils/fsck.ubifs/problem.c
+++ b/ubifs-utils/fsck.ubifs/problem.c
@@ -67,6 +67,7 @@ static const struct fsck_problem problem_table[] = {
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX, "Inconsistent properties for LEB"},	// LP_INCORRECT
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX, "Incorrect space statistics"},	// SPACE_STAT_INCORRECT
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX, "Inconsistent properties for lprops table"},	// LTAB_INCORRECT
+	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX, "Incorrect index size"},	// INCORRECT_IDX_SZ
 };
 
 static const char *get_question(const struct fsck_problem *problem,
@@ -280,6 +281,14 @@ static void print_problem(const struct ubifs_info *c,
 			ssp->calc_lst->total_dead, ssp->calc_lst->total_dark);
 		break;
 	}
+	case INCORRECT_IDX_SZ:
+	{
+		const unsigned long long *calc_sz = (const unsigned long long *)priv;
+
+		log_out(c, "problem: %s, index size is %llu, should be %llu",
+			problem->desc, c->calc_idx_sz, *calc_sz);
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
