Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A5BD2E9C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v1Pjva0ljhHVzj+UIqCKqbjfPHtXEMxitgrPx3qoPo4=; b=rb28z0/q/YASaF
	gyjLwj2HJR7JluANcOQ2R7IJRzqtDf9dCr0NS4euohO4wv+q78ojjNIZKggi322DA0apbDbtYr0oq
	afU1tJrlXoNKOh21n3PFlMcstTpVBnU2PDshpBCQY62cRRlICIZ2eOyH8zTKOppuXdGUM5ErRmFsy
	+qANOile0vkK0csJvOHs2NOuMfC024zJvW0i9NaNaffiLN4xDy7nfNDDUqvCO/SvgH9P3+SYp0cWt
	EJcfhs7s/NHNT9NOpUMdqL8C68g9/i5v/ip10NPuOlPTadWjP2kDfR54bTCXv4b2SOl5SNGMFtqAq
	c8ifX24ktlonNKyI4mDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQGT-0000000Gvlk-3gFx;
	Mon, 11 Nov 2024 08:59:17 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQGA-0000000GvWP-2xUY
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:59:02 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xn3MN1QVKzpZQv;
	Mon, 11 Nov 2024 16:57:04 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 534B11800A5;
	Mon, 11 Nov 2024 16:58:57 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:58:56 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 051/102] fsck.ubifs: Load filesystem information from UBI volume
Date: Mon, 11 Nov 2024 16:57:22 +0800
Message-ID: <20241111085741.2066378-12-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111085741.2066378-1-chengzhihao1@huawei.com>
References: <20241111085741.2066378-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_005859_098300_39C7FE06 
X-CRM114-Status: GOOD (  18.45  )
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

Load filesystem information from UBI volume (Similar to UBIFS mounting
process), initialize kinds of buffers and read superblock. This is the
base step for both fsck and rebuild_fs. Subsequent pacthes will complete
this step by adding more steps(eg. read master, replay journal, etc.)
which are only used in fsck.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am           |   3 +-
 ubifs-utils/fsck.ubifs/fsck.ubifs.c |   7 ++
 ubifs-utils/fsck.ubifs/fsck.ubifs.h |   7 ++
 ubifs-utils/fsck.ubifs/load_fs.c    | 127 ++++++++++++++++++++++++++++++++++++
 ubifs-utils/fsck.ubifs/problem.c    |   4 +-
 5 files changed, 146 insertions(+), 2 deletions(-)
 create mode 100644 ubifs-utils/fsck.ubifs/load_fs.c

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 590f17b6..baba1853 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -81,7 +81,8 @@ fsck_ubifs_SOURCES = \
 	$(libubifs_SOURCES) \
 	ubifs-utils/fsck.ubifs/fsck.ubifs.h \
 	ubifs-utils/fsck.ubifs/fsck.ubifs.c \
-	ubifs-utils/fsck.ubifs/problem.c
+	ubifs-utils/fsck.ubifs/problem.c \
+	ubifs-utils/fsck.ubifs/load_fs.c
 
 fsck_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) \
 		   $(DUMP_STACK_LD) -lm -lpthread
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index a3672411..ef94fcfb 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -423,8 +423,15 @@ int main(int argc, char *argv[])
 		goto out_destroy_fsck;
 	}
 
+	/* Init: Read superblock */
+	err = ubifs_load_filesystem(c);
+	if (err)
+		goto out_close;
+
 	err = do_fsck();
 
+	ubifs_destroy_filesystem(c);
+out_close:
 	ubifs_close_volume(c);
 out_destroy_fsck:
 	destroy_fsck_info(c);
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index 762745f9..c21082e0 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -36,6 +36,9 @@
 enum { NORMAL_MODE = 0, SAFE_MODE, DANGER_MODE0,
        DANGER_MODE1, REBUILD_MODE, CHECK_MODE };
 
+/* Types of inconsistent problems */
+enum { SB_CORRUPTED = 0 };
+
 /**
  * struct ubifs_fsck_info - UBIFS fsck information.
  * @mode: working mode
@@ -95,4 +98,8 @@ extern int exit_code;
 /* problem.c */
 bool fix_problem(const struct ubifs_info *c, int problem_type);
 
+/* load_fs.c */
+int ubifs_load_filesystem(struct ubifs_info *c);
+void ubifs_destroy_filesystem(struct ubifs_info *c);
+
 #endif
diff --git a/ubifs-utils/fsck.ubifs/load_fs.c b/ubifs-utils/fsck.ubifs/load_fs.c
new file mode 100644
index 00000000..4a06b4c2
--- /dev/null
+++ b/ubifs-utils/fsck.ubifs/load_fs.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024, Huawei Technologies Co, Ltd.
+ *
+ * Authors: Zhihao Cheng <chengzhihao1@huawei.com>
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "bitops.h"
+#include "kmem.h"
+#include "ubifs.h"
+#include "defs.h"
+#include "debug.h"
+#include "key.h"
+#include "misc.h"
+#include "fsck.ubifs.h"
+
+int ubifs_load_filesystem(struct ubifs_info *c)
+{
+	int err;
+	size_t sz;
+
+	err = init_constants_early(c);
+	if (err) {
+		exit_code |= FSCK_ERROR;
+		return err;
+	}
+
+	err = check_volume_empty(c);
+	if (err <= 0) {
+		exit_code |= FSCK_ERROR;
+		log_err(c, 0, "%s UBI volume!", err < 0 ? "bad" : "empty");
+		return -EINVAL;
+	}
+
+	if (c->ro_media && !c->ro_mount) {
+		exit_code |= FSCK_ERROR;
+		log_err(c, 0, "cannot read-write on read-only media");
+		return -EROFS;
+	}
+
+	err = -ENOMEM;
+	c->bottom_up_buf = kmalloc_array(BOTTOM_UP_HEIGHT, sizeof(int),
+					 GFP_KERNEL);
+	if (!c->bottom_up_buf) {
+		exit_code |= FSCK_ERROR;
+		log_err(c, errno, "cannot allocate bottom_up_buf");
+		goto out_free;
+	}
+
+	c->sbuf = vmalloc(c->leb_size);
+	if (!c->sbuf) {
+		exit_code |= FSCK_ERROR;
+		log_err(c, errno, "cannot allocate sbuf");
+		goto out_free;
+	}
+
+	if (!c->ro_mount) {
+		c->ileb_buf = vmalloc(c->leb_size);
+		if (!c->ileb_buf) {
+			exit_code |= FSCK_ERROR;
+			log_err(c, errno, "cannot allocate ileb_buf");
+			goto out_free;
+		}
+	}
+
+	c->mounting = 1;
+
+	log_out(c, "Read superblock");
+	err = ubifs_read_superblock(c);
+	if (err) {
+		if (test_and_clear_failure_reason_callback(c, FR_DATA_CORRUPTED))
+			fix_problem(c, SB_CORRUPTED);
+		exit_code |= FSCK_ERROR;
+		goto out_mounting;
+	}
+
+	err = init_constants_sb(c);
+	if (err) {
+		exit_code |= FSCK_ERROR;
+		goto out_mounting;
+	}
+
+	sz = ALIGN(c->max_idx_node_sz, c->min_io_size) * 2;
+	c->cbuf = kmalloc(sz, GFP_NOFS);
+	if (!c->cbuf) {
+		err = -ENOMEM;
+		exit_code |= FSCK_ERROR;
+		log_err(c, errno, "cannot allocate cbuf");
+		goto out_mounting;
+	}
+
+	err = alloc_wbufs(c);
+	if (err) {
+		exit_code |= FSCK_ERROR;
+		log_err(c, 0, "cannot allocate wbuf");
+		goto out_mounting;
+	}
+
+	c->mounting = 0;
+
+	return 0;
+
+out_mounting:
+	c->mounting = 0;
+out_free:
+	kfree(c->cbuf);
+	kfree(c->ileb_buf);
+	kfree(c->sbuf);
+	kfree(c->bottom_up_buf);
+	kfree(c->sup_node);
+
+	return err;
+}
+
+void ubifs_destroy_filesystem(struct ubifs_info *c)
+{
+	free_wbufs(c);
+
+	kfree(c->cbuf);
+	kfree(c->ileb_buf);
+	kfree(c->sbuf);
+	kfree(c->bottom_up_buf);
+	kfree(c->sup_node);
+}
diff --git a/ubifs-utils/fsck.ubifs/problem.c b/ubifs-utils/fsck.ubifs/problem.c
index 9a8c2e06..acb9e45e 100644
--- a/ubifs-utils/fsck.ubifs/problem.c
+++ b/ubifs-utils/fsck.ubifs/problem.c
@@ -34,7 +34,9 @@ struct fsck_problem {
 	const char *desc;
 };
 
-static const struct fsck_problem problem_table[] = {};
+static const struct fsck_problem problem_table[] = {
+	{0, "Corrupted superblock"},	// SB_CORRUPTED
+};
 
 static void print_problem(const struct ubifs_info *c,
 			  const struct fsck_problem *problem)
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
