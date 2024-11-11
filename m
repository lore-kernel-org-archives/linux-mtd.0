Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C81D2E9D7
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 10:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUwLT+UxBqa1VgIk8Z9P6NcKcPAduOdSOYu3mlK16L0=; b=k2zUilb24f7Rqo
	bbCC3H302Uf52zXTVpht8Y485VAz0hlrwWt2FoHT9MGaVw0Ijqib0TCAsJ4WVEaN6fG/+5UgnJTfM
	lHU3mYqZIH9LszgulJGKJyIBBvSaVpVXCT0wRsHXxN2+NN7UeuKAo0cdkkCrFRUpj6guTH40NFo1v
	jQQo62+5x/PVX9ROdGgfNol++69tyByXLJb1+FnKMEQVhMNXpbNQ1u1f64v+GPrv3F6NpBtvQTGqU
	dZejKw/zFKeg6X616Z723SOQjPYJk8kk2z3mYSHrNx/lsZvqtKRaw+wVKPX7Z8UccWvsf75Fg/SYK
	h9GMSH4FKABVIYURSI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARSa-0000000HFB1-2AV0;
	Mon, 11 Nov 2024 10:15:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQs-0000000H0Td-3sEm
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 09:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=66uJ2SCoXJbJSM1eB421hiOJjzLhjTJFlXBr/VTFtEE=; b=GFopOUC3QOeX5Xih9eBwEGBfNB
	SxeTpvIHxnSR1005dbPthUWHBSyH5FLu4enDLS7HF5xZMd3Xo7t3QXXXXMqARkfoVcptoXWIGz5Ho
	NNZ0XZCiSlJDgVLCVq/kg25YxpkoUYivDPIIyZlUXX56KuL26DCa+Q+t8IzD5pZoKBuwv3dMWfjvz
	pwEZCFe8K1uZA792DtxMgWwzYj1BnALIoDjySZd6tr62DIx8c2kP6PobJkEMNW8zuTPW3mS/HVwOg
	/li0XLCeOpZnC3XdedSULc9DicLSPn5gGfcxsG+tRTfFbKJgpmKFBMmt0oET+vewwtZ2AET/WODS6
	aOWTaImQ==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQn-0000000CoYx-3LRB
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:10:00 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn3c352HDz1jy1h;
	Mon, 11 Nov 2024 17:08:03 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D9F351402CE;
	Mon, 11 Nov 2024 17:09:50 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:09:50 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 086/102] fsck.ubifs: Check and create the lost+found
Date: Mon, 11 Nov 2024 17:08:14 +0800
Message-ID: <20241111090832.2093596-17-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_090958_941650_A8D9C51F 
X-CRM114-Status: GOOD (  24.52  )
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

From: Huang Xiaojia <huangxiaojia2@huawei.com>

This is the 16/18 step of fsck. Check whether the lost+found is existed,
create a new one if it is not found. This step makes sure that disconnected
file can be recovered under the lost+found.

Signed-off-by: Huang Xiaojia <huangxiaojia2@huawei.com>
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am                    |  3 +-
 ubifs-utils/fsck.ubifs/fsck.ubifs.c          | 15 ++++-
 ubifs-utils/fsck.ubifs/fsck.ubifs.h          |  5 ++
 ubifs-utils/fsck.ubifs/handle_disconnected.c | 89 ++++++++++++++++++++++++++++
 4 files changed, 110 insertions(+), 2 deletions(-)
 create mode 100644 ubifs-utils/fsck.ubifs/handle_disconnected.c

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index b80196a3..a511c40d 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -86,7 +86,8 @@ fsck_ubifs_SOURCES = \
 	ubifs-utils/fsck.ubifs/extract_files.c \
 	ubifs-utils/fsck.ubifs/rebuild_fs.c \
 	ubifs-utils/fsck.ubifs/check_files.c \
-	ubifs-utils/fsck.ubifs/check_space.c
+	ubifs-utils/fsck.ubifs/check_space.c \
+	ubifs-utils/fsck.ubifs/handle_disconnected.c
 
 fsck_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) \
 		   $(DUMP_STACK_LD) -lm -lpthread
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index b97c8e3b..550d3f98 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -526,8 +526,20 @@ static int do_fsck(void)
 
 	log_out(c, "Check and create root dir");
 	err = check_and_create_root(c);
-	if (err)
+	if (err) {
+		exit_code |= FSCK_ERROR;
+		goto free_disconnected_files_2;
+	}
+
+	if (list_empty(&FSCK(c)->disconnected_files))
+		return err;
+
+	log_out(c, "Check and create lost+found");
+	err = check_and_create_lost_found(c);
+	if (err) {
 		exit_code |= FSCK_ERROR;
+		goto free_disconnected_files_2;
+	}
 
 free_disconnected_files_2:
 	destroy_file_list(c, &FSCK(c)->disconnected_files);
@@ -583,6 +595,7 @@ int main(int argc, char *argv[])
 	 * Step 13: Commit problem fixing modifications
 	 * Step 14: Check and correct the index size
 	 * Step 15: Check and create root dir
+	 * Step 16: Check and create lost+found
 	 */
 	err = do_fsck();
 	if (err && FSCK(c)->try_rebuild) {
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index fb7ccca0..0e2a0811 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -277,6 +277,7 @@ struct ubifs_rebuild_info {
  * @lpts: lprops table
  * @try_rebuild: %true means that try to rebuild fs when fsck failed
  * @rebuild: rebuilding-related information
+ * @lost_and_found: inode number of the lost+found directory, %0 means invalid
  */
 struct ubifs_fsck_info {
 	int mode;
@@ -288,6 +289,7 @@ struct ubifs_fsck_info {
 	struct ubifs_lprops *lpts;
 	bool try_rebuild;
 	struct ubifs_rebuild_info *rebuild;
+	ino_t lost_and_found;
 };
 
 #define FSCK(c) ((struct ubifs_fsck_info*)c->private)
@@ -383,4 +385,7 @@ int build_lpt(struct ubifs_info *c, calculate_lp_callback calculate_lp_cb,
 int check_and_correct_space(struct ubifs_info *c);
 int check_and_correct_index_size(struct ubifs_info *c);
 
+/* handle_disconnected.c */
+int check_and_create_lost_found(struct ubifs_info *c);
+
 #endif
diff --git a/ubifs-utils/fsck.ubifs/handle_disconnected.c b/ubifs-utils/fsck.ubifs/handle_disconnected.c
new file mode 100644
index 00000000..b9a380f9
--- /dev/null
+++ b/ubifs-utils/fsck.ubifs/handle_disconnected.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024, Huawei Technologies Co, Ltd.
+ *
+ * Authors: Huang Xiaojia <huangxiaojia2@huawei.com>
+ *          Zhihao Cheng <chengzhihao1@huawei.com>
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/stat.h>
+
+#include "linux_err.h"
+#include "kmem.h"
+#include "ubifs.h"
+#include "defs.h"
+#include "debug.h"
+#include "key.h"
+#include "fsck.ubifs.h"
+
+#define LOST_FOUND_DIR_NAME "lost+found"
+
+/**
+ * check_and_create_lost_found - Check and create the lost+found directory.
+ * @c: UBIFS file-system description object
+ *
+ * This function checks whether the lost+found directory exists and creates a
+ * new one if no valid lost+found existing. If there is a valid lost+found
+ * directory, inode number is stored in @FSCK(c)->lost_and_found. Returns zero
+ * in case of success, a negative error code in case of failure.
+ */
+int check_and_create_lost_found(struct ubifs_info *c)
+{
+	struct ubifs_inode *root_ui, *lost_found_ui;
+	struct fscrypt_name nm;
+	int err = 0;
+
+	root_ui = ubifs_lookup_by_inum(c, UBIFS_ROOT_INO);
+	if (IS_ERR(root_ui)) {
+		err = PTR_ERR(root_ui);
+		/* Previous step ensures that the root dir is valid. */
+		ubifs_assert(c, err != -ENOENT);
+		return err;
+	}
+
+	if (root_ui->flags & UBIFS_CRYPT_FL) {
+		ubifs_msg(c, "The root dir is encrypted, skip checking lost+found");
+		goto free_root;
+	}
+
+	fname_name(&nm) = LOST_FOUND_DIR_NAME;
+	fname_len(&nm) = strlen(LOST_FOUND_DIR_NAME);
+	lost_found_ui = ubifs_lookup(c, root_ui, &nm);
+	if (IS_ERR(lost_found_ui)) {
+		err = PTR_ERR(lost_found_ui);
+		if (err != -ENOENT)
+			goto free_root;
+
+		/* Not found. Create a new lost+found. */
+		err = ubifs_mkdir(c, root_ui, &nm, S_IRUGO | S_IWUSR | S_IXUSR);
+		if (err < 0) {
+			if (err == -ENOSPC) {
+				ubifs_msg(c, "No free space to create lost+found");
+				err = 0;
+			}
+			goto free_root;
+		}
+		lost_found_ui = ubifs_lookup(c, root_ui, &nm);
+		if (IS_ERR(lost_found_ui)) {
+			err = PTR_ERR(lost_found_ui);
+			ubifs_assert(c, err != -ENOENT);
+			goto free_root;
+		}
+		FSCK(c)->lost_and_found = lost_found_ui->vfs_inode.inum;
+		ubifs_msg(c, "Create the lost+found");
+	} else if (!(lost_found_ui->flags & UBIFS_CRYPT_FL) &&
+		   S_ISDIR(lost_found_ui->vfs_inode.mode)) {
+		FSCK(c)->lost_and_found = lost_found_ui->vfs_inode.inum;
+	} else {
+		ubifs_msg(c, "The type of lost+found is %s%s",
+			  ubifs_get_type_name(ubifs_get_dent_type(lost_found_ui->vfs_inode.mode)),
+			  lost_found_ui->flags & UBIFS_CRYPT_FL ? ", encrypted" : "");
+	}
+
+	kfree(lost_found_ui);
+free_root:
+	kfree(root_ui);
+	return err;
+}
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
