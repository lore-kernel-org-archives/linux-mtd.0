Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F43D2E9C3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQIX6CUZD9lxYR9cyy+Rkz5qQF/0b6l1yl7kjKEFAAw=; b=fCn1dULg+CgCJq
	7pGKKYBrUe+Th6D3XBF8e+OlGewPy/zX2lhKoPFMhwcyicUFS1NxpHUdLjE0kQaE2Yn9VymKzU5Ro
	GtXRIEDpTENF0hh9xr2JNWIw+bSIKBXFw63gtzBeUvIo3aBk/VvoaZZ5VqS2eOWAq0K7KFAjlG0LU
	L8HDX0XgTPQbBfPKPkIIG9LeM0Y67rfFDlA3ZKl+P9m16cLdFv7cjqixiH+meZQRfsyHJwrWF6DEP
	qhSRA79LcsZ8djkOZKPNjdJDWv+cAECQr+KA09f5aolnUy/NP2eMb7/Bcj9XwR1lh+IK1Q9wESjfN
	wxrQK3xMXag802oTMHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQl-0000000H0PA-13dy;
	Mon, 11 Nov 2024 09:09:55 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQe-0000000H0It-3MQe
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:09:51 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Xn3fC6jNLz1ypSj;
	Mon, 11 Nov 2024 17:09:55 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id C91B01A016C;
	Mon, 11 Nov 2024 17:09:44 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:09:44 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 074/102] fsck.ubifs: Ensure that TNC LEB can be scanned successful
Date: Mon, 11 Nov 2024 17:08:02 +0800
Message-ID: <20241111090832.2093596-5-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_010949_206983_EA825385 
X-CRM114-Status: GOOD (  26.66  )
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

This is the second part of 6/18 step in fsck. Add an extra checking for
non-check mode while traversing TNC, make sure that all LEBs(contains TNC)
can be scanned successful. There could be following steps and possible
errors:
 Step 2. Scan all LEBs(contain TNC), remove TNC branch which points to
 corrupted LEB.
  a. corrupted node is found by scanning: If current node is index node,
     danger mode with rebuild_fs and normal mode with 'yes' answer will
     turn to rebuild filesystem, other modes will exit; If current node
     is non-index node, danger mode and normal mode with 'yes' answer
     will remove all TNC branches which point to the corrupted LEB,
     other modes will exit.
  b. LEB contains both index and non-index nodes: danger mode with
     rebuild_fs and normal mode with 'yes' answer will turn to rebuild
     filesystem, other modes will exit.
This is a preparation for space checking, which means that ubifs_scan
will always succeed when check properties for any TNC LEBs. We do this
before checking files(step 7) & extracting dentry tree(step 8), nodes
cannot be dropped(which may corrupted file and make file inconsistent
again) when scanning corrupted as long as the dentry tree is extracted.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/check_files.c | 122 +++++++++++++++++++++++++++++++++--
 ubifs-utils/fsck.ubifs/fsck.ubifs.c  |   1 +
 ubifs-utils/fsck.ubifs/fsck.ubifs.h  |   2 +-
 ubifs-utils/fsck.ubifs/problem.c     |  10 +++
 4 files changed, 128 insertions(+), 7 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/check_files.c b/ubifs-utils/fsck.ubifs/check_files.c
index 982c05b7..29848c4e 100644
--- a/ubifs-utils/fsck.ubifs/check_files.c
+++ b/ubifs-utils/fsck.ubifs/check_files.c
@@ -8,6 +8,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 
+#include "linux_err.h"
 #include "bitops.h"
 #include "kmem.h"
 #include "ubifs.h"
@@ -25,6 +26,7 @@ struct invalid_node {
 
 struct iteration_info {
 	struct list_head invalid_nodes;
+	unsigned long *corrupted_lebs;
 };
 
 static int add_invalid_node(struct ubifs_info *c, union ubifs_key *key,
@@ -103,6 +105,49 @@ static int construct_file(struct ubifs_info *c, union ubifs_key *key,
 	return insert_or_update_file(c, tree, sn, key_type(c, key), inum);
 }
 
+static int scan_check_leb(struct ubifs_info *c, int lnum, bool is_idx)
+{
+	int err = 0;
+	struct ubifs_scan_leb *sleb;
+	struct ubifs_scan_node *snod;
+
+	if (FSCK(c)->mode == CHECK_MODE)
+		/* Skip check mode. */
+		return 0;
+
+	ubifs_assert(c, lnum >= c->main_first);
+	if (test_bit(lnum - c->main_first, FSCK(c)->used_lebs))
+		return 0;
+
+	sleb = ubifs_scan(c, lnum, 0, c->sbuf, 0);
+	if (IS_ERR(sleb)) {
+		err = PTR_ERR(sleb);
+		if (test_and_clear_failure_reason_callback(c, FR_DATA_CORRUPTED))
+			err = 1;
+		return err;
+	}
+
+	list_for_each_entry(snod, &sleb->nodes, list) {
+		if (is_idx) {
+			if (snod->type != UBIFS_IDX_NODE) {
+				err = 1;
+				goto out;
+			}
+		} else {
+			if (snod->type == UBIFS_IDX_NODE) {
+				err = 1;
+				goto out;
+			}
+		}
+	}
+
+	set_bit(lnum - c->main_first, FSCK(c)->used_lebs);
+
+out:
+	ubifs_scan_destroy(sleb);
+	return err;
+}
+
 static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		      void *priv)
 {
@@ -127,6 +172,23 @@ static int check_leaf(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		return -EINVAL;
 	}
 
+	if (test_bit(lnum - c->main_first, iter->corrupted_lebs)) {
+		if (fix_problem(c, SCAN_CORRUPTED, zbr))
+			/* All nodes in corrupted LEB should be removed. */
+			return add_invalid_node(c, key, lnum, offs, iter);
+		return 0;
+	}
+
+	err = scan_check_leb(c, lnum, false);
+	if (err < 0) {
+		return err;
+	} else if (err) {
+		set_bit(lnum - c->main_first, iter->corrupted_lebs);
+		if (fix_problem(c, SCAN_CORRUPTED, zbr))
+			return add_invalid_node(c, key, lnum, offs, iter);
+		return 0;
+	}
+
 	node = kmalloc(len, GFP_NOFS);
 	if (!node)
 		return -ENOMEM;
@@ -147,6 +209,34 @@ out:
 	return err;
 }
 
+static int check_znode(struct ubifs_info *c, struct ubifs_znode *znode,
+		       __unused void *priv)
+{
+	int err;
+	const struct ubifs_zbranch *zbr;
+
+	if (znode->parent)
+		zbr = &znode->parent->zbranch[znode->iip];
+	else
+		zbr = &c->zroot;
+
+	if (zbr->lnum == 0) {
+		/* The znode has been split up. */
+		ubifs_assert(c, zbr->offs == 0 && zbr->len == 0);
+		return 0;
+	}
+
+	err = scan_check_leb(c, zbr->lnum, true);
+	if (err < 0) {
+		return err;
+	} else if (err) {
+		set_failure_reason_callback(c, FR_TNC_CORRUPTED);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int remove_invalid_nodes(struct ubifs_info *c,
 				struct list_head *invalid_nodes, int error)
 {
@@ -176,10 +266,12 @@ static int remove_invalid_nodes(struct ubifs_info *c,
  * traverse_tnc_and_construct_files - traverse TNC and construct all files.
  * @c: UBIFS file-system description object
  *
- * This function checks all index nodes and non-index nodes by traversing TNC,
- * then construct file according to scanned non-index nodes and insert file
- * into file tree. Returns zero in case of success, a negative error code in
- * case of failure.
+ * This function does two things by traversing TNC:
+ * 1. Check all index nodes and non-index nodes, then construct file according
+ *    to scanned non-index nodes and insert file into file tree.
+ * 2. Make sure that LEB(contains any nodes from TNC) can be scanned by
+ *    ubifs_scan, and the LEB only contains index nodes or non-index nodes.
+ * Returns zero in case of success, a negative error code in case of failure.
  */
 int traverse_tnc_and_construct_files(struct ubifs_info *c)
 {
@@ -187,15 +279,33 @@ int traverse_tnc_and_construct_files(struct ubifs_info *c)
 	struct iteration_info iter;
 
 	FSCK(c)->scanned_files = RB_ROOT;
+	FSCK(c)->used_lebs = kcalloc(BITS_TO_LONGS(c->main_lebs),
+				     sizeof(unsigned long), GFP_KERNEL);
+	if (!FSCK(c)->used_lebs) {
+		err = -ENOMEM;
+		log_err(c, errno, "can not allocate bitmap of used lebs");
+		return err;
+	}
 	INIT_LIST_HEAD(&iter.invalid_nodes);
+	iter.corrupted_lebs = kcalloc(BITS_TO_LONGS(c->main_lebs),
+				      sizeof(unsigned long), GFP_KERNEL);
+	if (!iter.corrupted_lebs) {
+		err = -ENOMEM;
+		log_err(c, errno, "can not allocate bitmap of corrupted lebs");
+		goto out;
+	}
 
-	err = dbg_walk_index(c, check_leaf, NULL, &iter);
+	err = dbg_walk_index(c, check_leaf, check_znode, &iter);
 
 	ret = remove_invalid_nodes(c, &iter.invalid_nodes, err);
 	if (!err)
 		err = ret;
 
-	if (err)
+	kfree(iter.corrupted_lebs);
+out:
+	if (err) {
+		kfree(FSCK(c)->used_lebs);
 		destroy_file_tree(c, &FSCK(c)->scanned_files);
+	}
 	return err;
 }
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index 96091b42..c0b1bf69 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -443,6 +443,7 @@ static int do_fsck(void)
 		return err;
 	}
 
+	kfree(FSCK(c)->used_lebs);
 	destroy_file_tree(c, &FSCK(c)->scanned_files);
 	return err;
 }
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index 4fa40883..c917a0e3 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -39,7 +39,7 @@ enum { NORMAL_MODE = 0, SAFE_MODE, DANGER_MODE0,
 /* Types of inconsistent problems */
 enum { SB_CORRUPTED = 0, MST_CORRUPTED, LOG_CORRUPTED, BUD_CORRUPTED,
        TNC_CORRUPTED, TNC_DATA_CORRUPTED, ORPHAN_CORRUPTED, INVALID_INO_NODE,
-       INVALID_DENT_NODE, INVALID_DATA_NODE };
+       INVALID_DENT_NODE, INVALID_DATA_NODE, SCAN_CORRUPTED };
 
 enum { HAS_DATA_CORRUPTED = 1, HAS_TNC_CORRUPTED = 2 };
 
diff --git a/ubifs-utils/fsck.ubifs/problem.c b/ubifs-utils/fsck.ubifs/problem.c
index f99fd90e..c5ecd109 100644
--- a/ubifs-utils/fsck.ubifs/problem.c
+++ b/ubifs-utils/fsck.ubifs/problem.c
@@ -45,6 +45,7 @@ static const struct fsck_problem problem_table[] = {
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Invalid inode node"},	// INVALID_INO_NODE
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Invalid dentry node"},	// INVALID_DENT_NODE
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Invalid data node"},	// INVALID_DATA_NODE
+	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Corrupted data is scanned"},	// SCAN_CORRUPTED
 };
 
 static const char *get_question(const struct fsck_problem *problem,
@@ -60,6 +61,7 @@ static const char *get_question(const struct fsck_problem *problem,
 	case INVALID_INO_NODE:
 	case INVALID_DENT_NODE:
 	case INVALID_DATA_NODE:
+	case SCAN_CORRUPTED:
 		return "Drop it?";
 	case ORPHAN_CORRUPTED:
 		return "Drop orphans on the LEB?";
@@ -88,6 +90,14 @@ static void print_problem(const struct ubifs_info *c,
 		log_out(c, "problem: %s %d", problem->desc, *lnum);
 		break;
 	}
+	case SCAN_CORRUPTED:
+	{
+		const struct ubifs_zbranch *zbr = (const struct ubifs_zbranch *)priv;
+
+		log_out(c, "problem: %s in LEB %d, node in %d:%d becomes invalid",
+			problem->desc, zbr->lnum, zbr->lnum, zbr->offs);
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
