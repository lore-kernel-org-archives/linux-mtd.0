Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDD5C27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdVRHbTcx2mKDZiL0zocKayZqT8BTDNMggi8cjyNQ1I=; b=Si1uSw0Z4yTNzO
	YR9E421nkB76MpWduF2/sRVehuCFm4Lwo+BXDrxtLfmyUxnmg01hRlJIdLQ1fqYdeg0BXhpVsQqOZ
	0j1MvyulrqCZJK31ScXyY+MbiA4hF4P1g8RvcRKVxR9R0FTjW3gYWJYA28YtdHrTuJFJnSX60wJCF
	eStorlBCf/Pe7lSy20Viy0nsti2awW+7VKnvjBUdKFshB4zC49BPmNWlIK/5yQweS2EIiA6hKp1tC
	F24owJKbUZlgf7ELeg4LDQUi0LAdbbse652CKQeYEDrBRsAWifGTcZ7Uoei3MqIopdeS1dI2DPeYv
	sCouH9/wh3Kcu0WtTlWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSRb-0000000CYY6-1VW7;
	Fri, 07 Jun 2024 05:47:19 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRDe-0000000CHnW-3yOi
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:29:21 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSlk1VznzwS3S;
	Fri,  7 Jun 2024 12:24:50 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 24444140413;
	Fri,  7 Jun 2024 12:28:34 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:37 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 096/110] fsck.ubifs: Handle disconnected files
Date: Fri, 7 Jun 2024 12:26:01 +0800
Message-ID: <20240607042615.2069840-97-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212851_674577_0AA21C4A 
X-CRM114-Status: GOOD (  21.23  )
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

This is the 17/18 step of fsck. Recover disconnected files into
lost+found. If there is no free space left to recover the disconnected
files, fsck may delete the files to make filesystem be consistent.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/fsck.ubifs.c          |   8 ++
 ubifs-utils/fsck.ubifs/fsck.ubifs.h          |   3 +-
 ubifs-utils/fsck.ubifs/handle_disconnected.c | 107 +++++++++++++++++++++++++++
 ubifs-utils/fsck.ubifs/problem.c             |  10 +++
 4 files changed, 127 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index 0910676c..831a13db 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -541,6 +541,13 @@ static int do_fsck(void)
 		goto free_disconnected_files_2;
 	}
 
+	log_out(c, "Handle disconnected files");
+	err = handle_disonnected_files(c);
+	if (err) {
+		exit_code |= FSCK_ERROR;
+		goto free_disconnected_files_2;
+	}
+
 free_disconnected_files_2:
 	destroy_file_list(c, &FSCK(c)->disconnected_files);
 	return err;
@@ -596,6 +603,7 @@ int main(int argc, char *argv[])
 	 * Step 14: Check and correct the index size
 	 * Step 15: Check and create root dir
 	 * Step 16: Check and create lost+found
+	 * Step 17: Handle disconnected files
 	 */
 	err = do_fsck();
 	if (err && FSCK(c)->try_rebuild) {
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index dc24e83c..84159430 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -46,7 +46,7 @@ enum { SB_CORRUPTED = 0, MST_CORRUPTED, LOG_CORRUPTED, BUD_CORRUPTED,
        FILE_ROOT_HAS_DENT, DENTRY_IS_UNREACHABLE, FILE_IS_INCONSISTENT,
        EMPTY_TNC, LPT_CORRUPTED, NNODE_INCORRECT, PNODE_INCORRECT,
        LP_INCORRECT, SPACE_STAT_INCORRECT, LTAB_INCORRECT, INCORRECT_IDX_SZ,
-       ROOT_DIR_NOT_FOUND };
+       ROOT_DIR_NOT_FOUND, DISCONNECTED_FILE_CANNOT_BE_RECOVERED };
 
 enum { HAS_DATA_CORRUPTED = 1, HAS_TNC_CORRUPTED = 2 };
 
@@ -388,5 +388,6 @@ int check_and_correct_index_size(struct ubifs_info *c);
 
 /* handle_disconnected.c */
 int check_and_create_lost_found(struct ubifs_info *c);
+int handle_disonnected_files(struct ubifs_info *c);
 
 #endif
diff --git a/ubifs-utils/fsck.ubifs/handle_disconnected.c b/ubifs-utils/fsck.ubifs/handle_disconnected.c
index b9a380f9..5ca00c0c 100644
--- a/ubifs-utils/fsck.ubifs/handle_disconnected.c
+++ b/ubifs-utils/fsck.ubifs/handle_disconnected.c
@@ -19,6 +19,7 @@
 #include "fsck.ubifs.h"
 
 #define LOST_FOUND_DIR_NAME "lost+found"
+#define MAX_REPEAT_NAME_RETRY_TIMES 10000000
 
 /**
  * check_and_create_lost_found - Check and create the lost+found directory.
@@ -87,3 +88,109 @@ free_root:
 	kfree(root_ui);
 	return err;
 }
+
+static int handle_disonnected_file(struct ubifs_info *c,
+				   struct scanned_file *file)
+{
+	int err = 0;
+
+	if (FSCK(c)->lost_and_found) {
+		unsigned int index = 0;
+		char file_name[UBIFS_MAX_NLEN + 1];
+		struct fscrypt_name nm;
+		struct ubifs_inode *ui = NULL, *lost_found_ui = NULL;
+
+		lost_found_ui = ubifs_lookup_by_inum(c, FSCK(c)->lost_and_found);
+		if (IS_ERR(lost_found_ui)) {
+			err = PTR_ERR(lost_found_ui);
+			ubifs_assert(c, err != -ENOENT);
+			return err;
+		}
+		ui = ubifs_lookup_by_inum(c, file->inum);
+		if (IS_ERR(ui)) {
+			err = PTR_ERR(ui);
+			ubifs_assert(c, err != -ENOENT);
+			goto free_lost_found_ui;
+		}
+
+		while (index < MAX_REPEAT_NAME_RETRY_TIMES) {
+			struct ubifs_inode *target_ui;
+
+			err = snprintf(file_name, sizeof(file_name),
+				       "INO_%lu_%u", file->inum, index);
+			if (err < 0)
+				goto free_ui;
+			fname_name(&nm) = file_name;
+			fname_len(&nm) = strlen(file_name);
+			target_ui = ubifs_lookup(c, lost_found_ui, &nm);
+			if (IS_ERR(target_ui)) {
+				err = PTR_ERR(target_ui);
+				if (err == -ENOENT)
+					break;
+				goto free_ui;
+			}
+			kfree(target_ui);
+			index++;
+		}
+
+		if (err != -ENOENT) {
+			err = 0;
+			kfree(ui);
+			kfree(lost_found_ui);
+			log_out(c, "Too many duplicated names(%u) in lost+found for inum %lu",
+				index, file->inum);
+			goto delete_file;
+		}
+
+		/* Try to recover disconnected file into lost+found. */
+		err = ubifs_link_recovery(c, lost_found_ui, ui, &nm);
+		if (err && err == -ENOSPC) {
+			err = 0;
+			log_out(c, "No free space to recover disconnected file");
+			goto delete_file;
+		}
+		dbg_fsck("recover disconnected file %lu, in %s",
+			 file->inum, c->dev_name);
+
+free_ui:
+		kfree(ui);
+free_lost_found_ui:
+		kfree(lost_found_ui);
+		return err;
+	} else
+		log_out(c, "No valid lost+found");
+
+delete_file:
+	if (fix_problem(c, DISCONNECTED_FILE_CANNOT_BE_RECOVERED, file))
+		err = delete_file(c, file);
+	return err;
+}
+
+/**
+ * handle_disonnected_files - Handle disconnected files.
+ * @c: UBIFS file-system description object
+ *
+ * This function tries to recover disonnected files into lost+found directory.
+ * If there is no free space left to recover the disconnected files, fsck may
+ * delete the files to make filesystem be consistent. Returns zero in case of
+ * success, a negative error code in case of failure.
+ */
+int handle_disonnected_files(struct ubifs_info *c)
+{
+	int err, ret = 0;
+	struct scanned_file *file;
+
+	while (!list_empty(&FSCK(c)->disconnected_files)) {
+		file = list_entry(FSCK(c)->disconnected_files.next,
+				  struct scanned_file, list);
+
+		list_del(&file->list);
+		err = handle_disonnected_file(c, file);
+		if (err)
+			ret = ret ? ret : err;
+		destroy_file_content(c, file);
+		kfree(file);
+	}
+
+	return ret;
+}
diff --git a/ubifs-utils/fsck.ubifs/problem.c b/ubifs-utils/fsck.ubifs/problem.c
index 8e7e1e15..916c9762 100644
--- a/ubifs-utils/fsck.ubifs/problem.c
+++ b/ubifs-utils/fsck.ubifs/problem.c
@@ -69,6 +69,7 @@ static const struct fsck_problem problem_table[] = {
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX, "Inconsistent properties for lprops table"},	// LTAB_INCORRECT
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX, "Incorrect index size"},	// INCORRECT_IDX_SZ
 	{PROBLEM_FIXABLE | PROBLEM_MUST_FIX, "Root dir is lost"},	// ROOT_DIR_NOT_FOUND
+	{PROBLEM_FIXABLE | PROBLEM_DROP_DATA, "Disconnected file cannot be recovered"},	// DISCONNECTED_FILE_CANNOT_BE_RECOVERED
 };
 
 static const char *get_question(const struct fsck_problem *problem,
@@ -96,6 +97,7 @@ static const char *get_question(const struct fsck_problem *problem,
 	case FILE_HAS_NO_ENCRYPT:
 	case FILE_ROOT_HAS_DENT:
 	case DENTRY_IS_UNREACHABLE:
+	case DISCONNECTED_FILE_CANNOT_BE_RECOVERED:
 		return "Delete it?";
 	case FILE_HAS_INCONSIST_TYPE:
 	case FILE_HAS_TOO_MANY_DENT:
@@ -292,6 +294,14 @@ static void print_problem(const struct ubifs_info *c,
 			problem->desc, c->calc_idx_sz, *calc_sz);
 		break;
 	}
+	case DISCONNECTED_FILE_CANNOT_BE_RECOVERED:
+	{
+		const struct scanned_file *file = (const struct scanned_file *)priv;
+
+		log_out(c, "problem: %s, ino %lu, size %llu", problem->desc,
+			file->inum, file->ino.size);
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
