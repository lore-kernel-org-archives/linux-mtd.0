Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B96D12D7B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7j2opw48YrJNhSnXYa+3EdAHJsxoK1X9f5+CcMaFL1Y=; b=dfRYNzSHy8dqhp
	oM3QqZW2Aoisa1wIBGOoatZ8iRc7RiCU1O9VUCH4hUSGtjeoYT4BZs2YMEQ+3kWP6sPfgJcQLB096
	2fjGc26Fap9UrWetasVHsXLKu8DAZxc6YnY/uyUtaXyZdDDZxnUmlaWoDb3lL8W7Feu4Nav1EznTw
	hwoLP+IYZ9ul8onl9pZQjRLbZMbjvf1Pmepaa0GTMXXmajFlgai+F8uDBjBgeZYsl1EDgLvs1SqvM
	fRqk593+6xitDy+sNgOYBK2eV9HbUlfWY+ZgwGmRFTQRaEh2eriXuu3XS/PMI32+gqChvIR1aNzVF
	EtXrEqZvgHp1exDwO4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVv-0000000GaXw-0wM3;
	Mon, 11 Nov 2024 07:07:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUj-0000000GZZr-2nGT
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NdbjOiaGf1UGzYjCtSR+O4CWo5obXnlAFlh85Y6YMgQ=; b=HytFYQumaL+GrKP0QeRcCx8RX6
	b7rbtfYozbgGcV1a7z8Ddt3kIngcMX/eF2kCIRNsLq9CIMDC6Z1x35SmiOBdv0Nc39bHluhFRctls
	Weqc4WlBHNhBnAkEJysskEYlgopKhybQF50+NoScsCHsA2Vjuy0j6PipGDoNY9ZrawseOjBrgIXz7
	/E89rDf+yX2TrKkfSeJRAuiJsJvuCpFEzvOAUn5tGwbGFgfupU3GMwvuUnNm7mAEV9Ok6Qdj/dpR1
	OQ4CzY/qqv/Kv9PK09RRhhsPSIpDhgHSSi9340WA8bUMv2i+pQBGyiUDj7yKXtjeMR7ckn3u97OQM
	qhDGViSw==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUd-0000000CmIr-0Xoa
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:52 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rr0Y2nz1jy0n;
	Mon, 11 Nov 2024 15:03:56 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 2511F180019;
	Mon, 11 Nov 2024 15:05:43 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:42 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 083/102] fsck.ubifs: Check and correct the index size
Date: Mon, 11 Nov 2024 15:03:26 +0800
Message-ID: <20241111070346.1314122-84-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070550_611435_3D0023AC 
X-CRM114-Status: GOOD (  16.60  )
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
