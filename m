Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA73C27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVPGlgl6yToPvFia1ku/JqjIgzt4nfe6ALk4VOAjWgQ=; b=4vaNKN7Jyv9+uX
	chFl0+t5zmkiNH10ZVgKwrdukmS6frsisp0okKfnNR3cV45KMQmKQqHm3tNdNBgSUmeNR/1CHr76U
	TiGWwdoMs23RqEnmVw+Z47UXIw3Un05jI+aVzd0/5wal+q1cMskK/Qb3BC+Fs2zN2LFKASkLhgZJM
	X4+cgwOk9iZotti5utkVWK2N8BCwYDDYkEvPFYSE8zs5KMdaRAx7tC2Q1yuWPaS9+/Vj6cBMbZ3Ih
	yNk2toLySFqGybdXmosFeK4jOLKnHcLRNkF13JA/xVM9tANO9Grtas9V+dKAhYbmrvCxjuym27cEB
	ZGJIuDuWs4Y8s6b/Cmww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSE8-0000000CVWN-0Prb;
	Fri, 07 Jun 2024 05:33:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCh-0000000CH1G-2Qwt
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=R10pu8A6t09mL5tsqXYPjOpxIESZtwwem6S27xK9OtY=; b=GYfHSDWHGhjDaIhkVY155+Zyhv
	FYwN3wBbeztKuEdqXJkhOS3ighb24M2rPIz5j51UBsa26VWRazQETtZj/9lR8cz/5IROL0VuBFxHN
	hdUe1WpgThDhqZE5m9PmeyNXWP/cOXRYAVAT0oMV6uv9C3MKoyGv2CG7ZdNomag54RUfqLw9KwW4C
	MW9TIHJkrgyKeZf+Y3jVTOElwZsQQc+ROvHb94U3hPI+G2QWfFrUx4PtKlmYC4SZ+fJ+mSM7s8pO0
	s2oRKD4UsIlyC9EAd8Q0QzZ539zkugzgSZi5EtIfCugckGIwQHFCnIj1Nw3Xp4b2g7RJSB4GcntLv
	fOBuQ+Dw==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCd-00000004U19-0iNL
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwSjj5X5YzmY54;
	Fri,  7 Jun 2024 12:23:05 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 9614A180AA6;
	Fri,  7 Jun 2024 12:27:41 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:34 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 092/110] fsck.ubifs: Check and correct the index size
Date: Fri, 7 Jun 2024 12:25:57 +0800
Message-ID: <20240607042615.2069840-93-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052747_860475_2496DD89 
X-CRM114-Status: GOOD (  14.06  )
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
index cf4b8d3f..a22e5ae1 100644
--- a/ubifs-utils/fsck.ubifs/check_space.c
+++ b/ubifs-utils/fsck.ubifs/check_space.c
@@ -656,3 +656,31 @@ rebuild:
 
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
index 66b9c578..d3525e30 100644
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
index cc8b71f5..2d17b205 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -45,7 +45,7 @@ enum { SB_CORRUPTED = 0, MST_CORRUPTED, LOG_CORRUPTED, BUD_CORRUPTED,
        XATTR_HAS_WRONG_HOST, FILE_HAS_NO_ENCRYPT, FILE_IS_DISCONNECTED,
        FILE_ROOT_HAS_DENT, DENTRY_IS_UNREACHABLE, FILE_IS_INCONSISTENT,
        EMPTY_TNC, LPT_CORRUPTED, NNODE_INCORRECT, PNODE_INCORRECT,
-       LP_INCORRECT, SPACE_STAT_INCORRECT, LTAB_INCORRECT };
+       LP_INCORRECT, SPACE_STAT_INCORRECT, LTAB_INCORRECT, INCORRECT_IDX_SZ };
 
 enum { HAS_DATA_CORRUPTED = 1, HAS_TNC_CORRUPTED = 2 };
 
@@ -380,5 +380,6 @@ int get_free_leb(struct ubifs_info *c);
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
