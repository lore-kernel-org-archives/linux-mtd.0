Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51680D2E9C8
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2H0LQB2N+WX+30honeD1Ng/jwLarI0D5Op7kPXfaQo=; b=A4bvVaejFBOlj6
	KZID33uY1oHes2QQI0WNbXW9/b5syoPDm4fSt0HMhhT4Q6HX+0DTkNtoIhx/WEiQugMMJLcr+Xolv
	Tr4qCwDD0rMppnbOT60JU8X5yQ9KlrNebehfgbQdfcTW8C11N6Zm1a8xqt8Vgo8xl5AD9WD+tPpTk
	xsRSm5dqa9GvtwTgMwUYa6aPnOg/ZxbpCu5U9G3y364LuQgELH3YTJmBixTkoKj/jiLF1JAVFn7m+
	/h2Hte5+PhEat5pnYb0FS+/92KmBGvRxoI5hImREj2fp+w0UucePV89eU2FCBQJDjVRnlD111n6dO
	praP18/3cvWeBsBPhSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQk-0000000H0Ob-2Hw7;
	Mon, 11 Nov 2024 09:09:54 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQe-0000000H0Iu-3MhF
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:09:51 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Xn3cZ5m9HzQsrj;
	Mon, 11 Nov 2024 17:08:30 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 4A6C0180104;
	Mon, 11 Nov 2024 17:09:43 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:09:42 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 071/102] fsck.ubifs: Recover isize
Date: Mon, 11 Nov 2024 17:07:59 +0800
Message-ID: <20241111090832.2093596-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_010949_222361_73DAE876 
X-CRM114-Status: GOOD (  19.86  )
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

This is the 5/18 step of fsck. Recover isize. There could be following
steps and possible errors:
 Step 1. Traverse size tree, lookup corresponding inode from TNC
  a. corrupted node searched from TNC: skip node for danger mode and
     normal mode with 'yes' answer, other modes will exit.
  b. corrupted index node read from TNC: danger mode with rebuild_fs and
     normal mode with 'yes' answer will turn to rebuild filesystem, other
     modes will exit.
 Step 2. update isize for inode. Keep <inum, isize> in size tree for check
 mode, update inode node in place for other modes.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/fsck.ubifs.c |  1 +
 ubifs-utils/fsck.ubifs/load_fs.c    | 79 +++++++++++++++++++++----------------
 ubifs-utils/libubifs/recovery.c     | 34 +++++++++++++---
 3 files changed, 75 insertions(+), 39 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index 83c8a2c5..616ed81a 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -434,6 +434,7 @@ int main(int argc, char *argv[])
 	 * Step 2: Replay journal
 	 * Step 3: Handle orphan nodes
 	 * Step 4: Consolidate log
+	 * Step 5: Recover isize
 	 */
 	err = ubifs_load_filesystem(c);
 	if (err) {
diff --git a/ubifs-utils/fsck.ubifs/load_fs.c b/ubifs-utils/fsck.ubifs/load_fs.c
index 42b1afaa..58540543 100644
--- a/ubifs-utils/fsck.ubifs/load_fs.c
+++ b/ubifs-utils/fsck.ubifs/load_fs.c
@@ -17,6 +17,33 @@
 #include "misc.h"
 #include "fsck.ubifs.h"
 
+enum { HAS_DATA_CORRUPTED = 1, HAS_TNC_CORRUPTED = 2 };
+
+static void handle_error(const struct ubifs_info *c, int reason_set)
+{
+	bool handled = false;
+	unsigned int reason = get_failure_reason_callback(c);
+
+	clear_failure_reason_callback(c);
+	if ((reason_set & HAS_DATA_CORRUPTED) && (reason & FR_DATA_CORRUPTED)) {
+		handled = true;
+		reason &= ~FR_DATA_CORRUPTED;
+		if (fix_problem(c, LOG_CORRUPTED, NULL))
+			FSCK(c)->try_rebuild = true;
+	}
+	if ((reason_set & HAS_TNC_CORRUPTED) && (reason & FR_TNC_CORRUPTED)) {
+		ubifs_assert(c, !handled);
+		handled = true;
+		reason &= ~FR_TNC_CORRUPTED;
+		if (fix_problem(c, TNC_CORRUPTED, NULL))
+			FSCK(c)->try_rebuild = true;
+	}
+
+	ubifs_assert(c, reason == 0);
+	if (!handled)
+		exit_code |= FSCK_ERROR;
+}
+
 int ubifs_load_filesystem(struct ubifs_info *c)
 {
 	int err;
@@ -164,19 +191,7 @@ int ubifs_load_filesystem(struct ubifs_info *c)
 	log_out(c, "Replay journal");
 	err = ubifs_replay_journal(c);
 	if (err) {
-		unsigned int reason = get_failure_reason_callback(c);
-
-		clear_failure_reason_callback(c);
-		if (reason & FR_DATA_CORRUPTED) {
-			if (fix_problem(c, LOG_CORRUPTED, NULL))
-				FSCK(c)->try_rebuild = true;
-		} else if (reason & FR_TNC_CORRUPTED) {
-			if (fix_problem(c, TNC_CORRUPTED, NULL))
-				FSCK(c)->try_rebuild = true;
-		} else {
-			ubifs_assert(c, reason == 0);
-			exit_code |= FSCK_ERROR;
-		}
+		handle_error(c, HAS_DATA_CORRUPTED | HAS_TNC_CORRUPTED);
 		goto out_journal;
 	}
 
@@ -186,16 +201,7 @@ int ubifs_load_filesystem(struct ubifs_info *c)
 	log_out(c, "Handle orphan nodes");
 	err = ubifs_mount_orphans(c, c->need_recovery, c->ro_mount);
 	if (err) {
-		unsigned int reason = get_failure_reason_callback(c);
-
-		clear_failure_reason_callback(c);
-		if (reason & FR_TNC_CORRUPTED) {
-			if (fix_problem(c, TNC_CORRUPTED, NULL))
-				FSCK(c)->try_rebuild = true;
-		} else {
-			ubifs_assert(c, reason == 0);
-			exit_code |= FSCK_ERROR;
-		}
+		handle_error(c, HAS_TNC_CORRUPTED);
 		goto out_orphans;
 	}
 
@@ -210,19 +216,26 @@ int ubifs_load_filesystem(struct ubifs_info *c)
 			log_out(c, "Consolidate log");
 			err = ubifs_consolidate_log(c);
 			if (err) {
-				unsigned int reason = get_failure_reason_callback(c);
-
-				clear_failure_reason_callback(c);
-				if (reason & FR_DATA_CORRUPTED) {
-					if (fix_problem(c, LOG_CORRUPTED, NULL))
-						FSCK(c)->try_rebuild = true;
-				} else {
-					ubifs_assert(c, reason == 0);
-					exit_code |= FSCK_ERROR;
-				}
+				handle_error(c, HAS_DATA_CORRUPTED);
+				goto out_orphans;
+			}
+		}
+
+		if (c->need_recovery) {
+			log_out(c, "Recover isize");
+			err = ubifs_recover_size(c, true);
+			if (err) {
+				handle_error(c, HAS_TNC_CORRUPTED);
 				goto out_orphans;
 			}
 		}
+	} else if (c->need_recovery) {
+		log_out(c, "Recover isize");
+		err = ubifs_recover_size(c, false);
+		if (err) {
+			handle_error(c, HAS_TNC_CORRUPTED);
+			goto out_orphans;
+		}
 	}
 
 	c->mounting = 0;
diff --git a/ubifs-utils/libubifs/recovery.c b/ubifs-utils/libubifs/recovery.c
index 9115b17a..a5133a0f 100644
--- a/ubifs-utils/libubifs/recovery.c
+++ b/ubifs-utils/libubifs/recovery.c
@@ -1272,8 +1272,18 @@ static int fix_size_in_place(struct ubifs_info *c, struct size_entry *e)
 	/* Locate the inode node LEB number and offset */
 	ino_key_init(c, &key, e->inum);
 	err = ubifs_tnc_locate(c, &key, ino, &lnum, &offs);
-	if (err)
+	if (err) {
+		unsigned int reason = get_failure_reason_callback(c);
+
+		if (reason & FR_DATA_CORRUPTED) {
+			test_and_clear_failure_reason_callback(c, FR_DATA_CORRUPTED);
+			if (handle_failure_callback(c, FR_H_TNC_DATA_CORRUPTED, NULL)) {
+				/* Leave the inode to be deleted by subsequent steps */
+				return 0;
+			}
+		}
 		goto out;
+	}
 	/*
 	 * If the size recorded on the inode node is greater than the size that
 	 * was calculated from nodes in the journal then don't change the inode.
@@ -1320,10 +1330,10 @@ out:
  */
 static int inode_fix_size(struct ubifs_info *c, __unused struct size_entry *e)
 {
-	ubifs_assert(c, 0);
-
-	// To be implemented
-	return -EINVAL;
+	/* Don't remove entry, keep it in the size tree. */
+	/* Remove this assertion after supporting authentication. */
+	ubifs_assert(c, c->ro_mount);
+	return 0;
 }
 
 /**
@@ -1353,8 +1363,19 @@ int ubifs_recover_size(struct ubifs_info *c, bool in_place)
 
 			ino_key_init(c, &key, e->inum);
 			err = ubifs_tnc_lookup(c, &key, c->sbuf);
-			if (err && err != -ENOENT)
+			if (err && err != -ENOENT) {
+				unsigned int reason;
+
+				reason = get_failure_reason_callback(c);
+				if (reason & FR_DATA_CORRUPTED) {
+					test_and_clear_failure_reason_callback(c, FR_DATA_CORRUPTED);
+					if (handle_failure_callback(c, FR_H_TNC_DATA_CORRUPTED, NULL)) {
+						/* Leave the inode to be deleted by subsequent steps */
+						goto delete_entry;
+					}
+				}
 				return err;
+			}
 			if (err == -ENOENT) {
 				/* Remove data nodes that have no inode */
 				dbg_rcvry("removing ino %lu",
@@ -1390,6 +1411,7 @@ int ubifs_recover_size(struct ubifs_info *c, bool in_place)
 			}
 		}
 
+delete_entry:
 		rb_erase(&e->rb, &c->size_tree);
 		kfree(e);
 	}
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
