Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA471C27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/BhmFkOpMOfeMCJRExa1nKMfpcPaRN4Gjs03vWZCiI=; b=IWq3OeKDhaQF0V
	OcPDv+KrrtcT021Z9NStGg96QftFmChk94e3+QYPOKFxKUo12JFXFuTBWMn8HoB5ZY5kXawIPw86u
	a29hqOCBu7j/C3UBkuwd+dhTLA9e/DyJFGyoekY5Vla+dpXK03e/xil1hVX/DcZlvmkLtwolFah/h
	mJqPqSoO4DNFSUTI0jknqmcdUB0Ms+957ByHHXsrhVXMe8vhgMYxE2WlL+sq+BNF5QEKkDHrijxuu
	YDuOxcCRkN2lKXK4yBJJC8ogrfBw2wtYlXG7Vx6TEvLplbPJWZbx0cCRovkfesxNM4yaBPY4Yl2qc
	UZE8UG7LF4J5NqmWoxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRGl-0000000CKDC-2Gvu;
	Fri, 07 Jun 2024 04:32:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRDF-0000000CHSy-04w3
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=vfSRO932tFwCD6srnkv4HC8Kome8IZOT6nZZRWAJjO4=; b=TkOrOdgF3p/RYS9CWwXuxeCisg
	ATGBmotaG7APqyelJV4QAqvLO7EFl2r+muCmd3QhH56fRXZ20tplbbhyCd/ktyGs7LdMLa0eU0zlc
	qKEb/vbixrTFJRZiBKVxjERzACc8wM3Mn4nAuUfNmrU0H0XwvUsgWTIBsP4QP3zCpYCYN8MMm6Qzm
	3CSFlhN65SnavaszX2mfFSgTtavtCuFHj/UZe7CTyDCzv73Srh1gSNwe6SBxq3PQIW84k6UT3WwPz
	jQGXdeTOm9Zd3v3uNFXdsC7V7ocNyBxkAQysVFQ8efzCUjD+X7XGFkil0hkmLE+uNktx+47Z0QpzX
	keUpzanw==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRDB-00000004UBG-0w1d
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:28:23 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSkP5KnKzwRtf;
	Fri,  7 Jun 2024 12:23:41 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id A2F06180AA6;
	Fri,  7 Jun 2024 12:27:40 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:24 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 078/110] fsck.ubifs: Handle orphan nodes
Date: Fri, 7 Jun 2024 12:25:43 +0800
Message-ID: <20240607042615.2069840-79-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052821_909489_7143D9EB 
X-CRM114-Status: GOOD (  18.79  )
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

This is the 3/18 step of fsck. Handle orphan nodes, update TNC & LPT.
There could be following steps and possible errors:
 Step 1. scan orphan LEB, get all orphan nodes
  a. corrupted scanning data in orphan area: danger mode and normal mode
     with 'yes' answer will drop orphan LEB, other modes will exit.
 Step 2. parse orphan node, find the original inode for each inum
  a. corrupted node searched from TNC: skip node for danger mode and
     normal mode with 'yes' answer, other modes will exit.
  b. corrupted index node read from TNC: danger mode with rebuild_fs and
     normal mode with 'yes' answer will turn to rebuild filesystem, other
     modes will exit.
 Step 4. remove inode for each inum, update TNC & LPT
  a. corrupted index node read from TNC: danger mode with rebuild_fs and
     normal mode with 'yes' answer will turn to rebuild filesystem, other
     modes will exit.
  b. corrupted lpt: Set %FR_LPT_CORRUPTED for lpt status. Ignore the
     error.
  c. incorrect lpt: Set %FR_LPT_INCORRECT for lpt status. Ignore the
     error.
  d. If lpt status is not empty, skip updating lpt.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/fsck.ubifs.c |  2 ++
 ubifs-utils/fsck.ubifs/fsck.ubifs.h |  2 +-
 ubifs-utils/fsck.ubifs/load_fs.c    | 19 +++++++++++++++++
 ubifs-utils/fsck.ubifs/problem.c    | 20 ++++++++++++++++--
 ubifs-utils/libubifs/orphan.c       | 42 ++++++++++++++++++++++++++++++++++---
 ubifs-utils/libubifs/ubifs.h        |  1 +
 6 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index 3e7e7093..4d5296d7 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -328,6 +328,7 @@ static bool fsck_can_ignore_failure(const struct ubifs_info *c,
 static const unsigned int reason_mapping_table[] = {
 	BUD_CORRUPTED,		/* FR_H_BUD_CORRUPTED */
 	TNC_DATA_CORRUPTED,	/* FR_H_TNC_DATA_CORRUPTED */
+	ORPHAN_CORRUPTED,	/* FR_H_ORPHAN_CORRUPTED */
 };
 
 static bool fsck_handle_failure(const struct ubifs_info *c, unsigned int reason,
@@ -431,6 +432,7 @@ int main(int argc, char *argv[])
 	 * Init: Read superblock
 	 * Step 1: Read master & init lpt
 	 * Step 2: Replay journal
+	 * Step 3: Handle orphan nodes
 	 */
 	err = ubifs_load_filesystem(c);
 	if (err) {
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index 917f124e..b98c3f7d 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -38,7 +38,7 @@ enum { NORMAL_MODE = 0, SAFE_MODE, DANGER_MODE0,
 
 /* Types of inconsistent problems */
 enum { SB_CORRUPTED = 0, MST_CORRUPTED, LOG_CORRUPTED, BUD_CORRUPTED,
-       TNC_CORRUPTED, TNC_DATA_CORRUPTED };
+       TNC_CORRUPTED, TNC_DATA_CORRUPTED, ORPHAN_CORRUPTED };
 
 struct scanned_file;
 
diff --git a/ubifs-utils/fsck.ubifs/load_fs.c b/ubifs-utils/fsck.ubifs/load_fs.c
index f45c4117..f376383c 100644
--- a/ubifs-utils/fsck.ubifs/load_fs.c
+++ b/ubifs-utils/fsck.ubifs/load_fs.c
@@ -183,10 +183,28 @@ int ubifs_load_filesystem(struct ubifs_info *c)
 	/* Calculate 'min_idx_lebs' after journal replay */
 	c->bi.min_idx_lebs = ubifs_calc_min_idx_lebs(c);
 
+	log_out(c, "Handle orphan nodes");
+	err = ubifs_mount_orphans(c, c->need_recovery, c->ro_mount);
+	if (err) {
+		unsigned int reason = get_failure_reason_callback(c);
+
+		clear_failure_reason_callback(c);
+		if (reason & FR_TNC_CORRUPTED) {
+			if (fix_problem(c, TNC_CORRUPTED, NULL))
+				FSCK(c)->try_rebuild = true;
+		} else {
+			ubifs_assert(c, reason == 0);
+			exit_code |= FSCK_ERROR;
+		}
+		goto out_orphans;
+	}
+
 	c->mounting = 0;
 
 	return 0;
 
+out_orphans:
+	free_orphans(c);
 out_journal:
 	destroy_journal(c);
 out_lpt:
@@ -214,6 +232,7 @@ void ubifs_destroy_filesystem(struct ubifs_info *c)
 {
 	destroy_journal(c);
 	free_wbufs(c);
+	free_orphans(c);
 	ubifs_lpt_free(c, 0);
 
 	c->max_sqnum = 0;
diff --git a/ubifs-utils/fsck.ubifs/problem.c b/ubifs-utils/fsck.ubifs/problem.c
index 9df2c2ae..9c8730a5 100644
--- a/ubifs-utils/fsck.ubifs/problem.c
+++ b/ubifs-utils/fsck.ubifs/problem.c
@@ -41,6 +41,7 @@ static const struct fsck_problem problem_table[] = {
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Corrupted bud LEB"},	// BUD_CORRUPTED
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA | PROBLEM_NEED_REBUILD, "Corrupted index node"},	// TNC_CORRUPTED
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Corrupted data searched from TNC"},	// TNC_DATA_CORRUPTED
+	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX | PROBLEM_DROP_DATA, "Corrupted orphan LEB"},	// ORPHAN_CORRUPTED
 };
 
 static const char *get_question(const struct fsck_problem *problem,
@@ -54,6 +55,8 @@ static const char *get_question(const struct fsck_problem *problem,
 		return "Drop bud?";
 	case TNC_DATA_CORRUPTED:
 		return "Drop it?";
+	case ORPHAN_CORRUPTED:
+		return "Drop orphans on the LEB?";
 	}
 
 	return "Fix it?";
@@ -63,13 +66,26 @@ static void print_problem(const struct ubifs_info *c,
 			  const struct fsck_problem *problem, int problem_type,
 			  const void *priv)
 {
-	if (problem_type == BUD_CORRUPTED) {
+	switch (problem_type) {
+	case BUD_CORRUPTED:
+	{
 		const struct ubifs_bud *bud = (const struct ubifs_bud *)priv;
 
 		log_out(c, "problem: %s %d:%d %s", problem->desc, bud->lnum,
 			bud->start, dbg_jhead(bud->jhead));
-	} else
+		break;
+	}
+	case ORPHAN_CORRUPTED:
+	{
+		const int *lnum = (const int *)priv;
+
+		log_out(c, "problem: %s %d", problem->desc, *lnum);
+		break;
+	}
+	default:
 		log_out(c, "problem: %s", problem->desc);
+		break;
+	}
 }
 
 static void fatal_error(const struct ubifs_info *c,
diff --git a/ubifs-utils/libubifs/orphan.c b/ubifs-utils/libubifs/orphan.c
index 26668cbd..baa4db78 100644
--- a/ubifs-utils/libubifs/orphan.c
+++ b/ubifs-utils/libubifs/orphan.c
@@ -423,6 +423,7 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 			ubifs_dump_node(c, snod->node,
 					c->leb_size - snod->offs);
 			err = -EINVAL;
+			set_failure_reason_callback(c, FR_DATA_CORRUPTED);
 			goto out_free;
 		}
 
@@ -452,6 +453,7 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 				ubifs_dump_node(c, snod->node,
 						c->leb_size - snod->offs);
 				err = -EINVAL;
+				set_failure_reason_callback(c, FR_DATA_CORRUPTED);
 				goto out_free;
 			}
 			dbg_rcvry("out of date LEB %d", sleb->lnum);
@@ -471,8 +473,19 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 
 			ino_key_init(c, &key, inum);
 			err = ubifs_tnc_lookup(c, &key, ino);
-			if (err && err != -ENOENT)
+			if (err && err != -ENOENT) {
+				unsigned int reason;
+
+				reason = get_failure_reason_callback(c);
+				if (reason & FR_DATA_CORRUPTED) {
+					test_and_clear_failure_reason_callback(c, FR_DATA_CORRUPTED);
+					if (handle_failure_callback(c, FR_H_TNC_DATA_CORRUPTED, NULL)) {
+						/* Leave the inode to be deleted by subsequent steps */
+						continue;
+					}
+				}
 				goto out_free;
+			}
 
 			/*
 			 * Check whether an inode can really get deleted.
@@ -483,8 +496,11 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 					  (unsigned long)inum);
 
 				err = ubifs_tnc_remove_ino(c, inum);
-				if (err)
+				if (err) {
+					if (c->program_type == FSCK_PROGRAM_TYPE)
+						goto out_free;
 					goto out_ro;
+				}
 			}
 		}
 
@@ -553,13 +569,33 @@ static int kill_orphans(struct ubifs_info *c)
 							 c->sbuf, -1);
 			}
 			if (IS_ERR(sleb)) {
+				if (test_and_clear_failure_reason_callback(c, FR_DATA_CORRUPTED) &&
+				    handle_failure_callback(c, FR_H_ORPHAN_CORRUPTED, &lnum)) {
+					/* Skip the orphan LEB. */
+					continue;
+				}
 				err = PTR_ERR(sleb);
 				break;
 			}
 		}
 		err = do_kill_orphans(c, sleb, &last_cmt_no, &outofdate,
 				      &last_flagged);
-		if (err || outofdate) {
+		if (err) {
+			unsigned int reason = get_failure_reason_callback(c);
+
+			if (reason & FR_DATA_CORRUPTED) {
+				test_and_clear_failure_reason_callback(c, FR_DATA_CORRUPTED);
+				if (handle_failure_callback(c, FR_H_ORPHAN_CORRUPTED, &lnum)) {
+					err = 0;
+					/* Skip the orphan LEB. */
+					ubifs_scan_destroy(sleb);
+					continue;
+				}
+			}
+			ubifs_scan_destroy(sleb);
+			break;
+		}
+		if (outofdate) {
 			ubifs_scan_destroy(sleb);
 			break;
 		}
diff --git a/ubifs-utils/libubifs/ubifs.h b/ubifs-utils/libubifs/ubifs.h
index ae812ff8..8a506a8b 100644
--- a/ubifs-utils/libubifs/ubifs.h
+++ b/ubifs-utils/libubifs/ubifs.h
@@ -1546,6 +1546,7 @@ enum {
 enum {
 	FR_H_BUD_CORRUPTED = 0,		/* Bud LEB is corrupted */
 	FR_H_TNC_DATA_CORRUPTED,	/* Data searched from TNC is corrupted */
+	FR_H_ORPHAN_CORRUPTED,		/* Orphan LEB is corrupted */
 };
 /* Callback functions for failure(which can be handled by fsck) happens. */
 static inline void set_failure_reason_callback(const struct ubifs_info *c,
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
