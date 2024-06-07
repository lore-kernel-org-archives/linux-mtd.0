Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D94C27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejVIugrOq6/bG+E8n8XdVzUGv2DODtiQAo/KkPvBbS4=; b=S2Qnjjgd8OlCdG
	3JmbhUNVWq9mJXZoQz//yxOFVlC4M8okyvMhr5TTyw3TWKw7nIzgFDpWh9QbiFGJMJxanLvGpwbhp
	wxj+hhs5PzYOqfspugw4ElELSbP2zOXYJa9GD01AFbJMLhdoZEwjh9+yuTiilXCV9Yoavm01wTvs7
	/fTfJcFBq4SSzlu+U/nfGEaqo9AoUdIiX7YtAYeJIoftJj+gkIdD2V5/IHVdayZr2IGfdo4qWvP2N
	+kac2e7kfyBYYm5ySUmvPR1bNKI8AtP/q35Xs2UyqFeBTALN+aZawG/sBJSl69ly2CHB5KcW+SBKx
	gRRe1QDO5YUC57fmckhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSDl-0000000CVB3-1d14;
	Fri, 07 Jun 2024 05:33:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCU-0000000CGr3-3dxc
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ZUAr1ufFUsEm4sWui1HFEKc7WyQ9zaC1fX1tBHYuVyk=; b=bYWcozPC9HcAAWHl6Ko0IE41rD
	isn/uYnj9VsZiz6SOkV9Mj1pu4C1hHSebLPgieW46rURjmbRMbSUR/TQ/bOs61yT1pE8Ro77MJB6G
	s5lRP10ehQUxb+eDOeWvS+qr0I7YoH22LJveU/CxinNsmvIAN+9Im58sdRs3AVrbKZ/59eF0lM8J9
	o3PJL4nVKQ8X1Sptg0ENvaIrkdZF5euhYBis3Y+niQtgoeIMEzjFoGRQcT07sKwhYfuETw///YVxZ
	U4PUNK4a9PwI/lMkFZ6iTnnGXM28E4t5ZrZ4Xb8ou/VkHIjsiggBpxQ/9cgkVahoXpcX/I/4pFeHz
	9sN07j9w==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCN-00000004Tsd-0pY4
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwSn46w8QzdZdG;
	Fri,  7 Jun 2024 12:26:00 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id D8923180085;
	Fri,  7 Jun 2024 12:27:25 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:11 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 060/110] fsck.ubifs: Load filesystem information from UBI volume
Date: Fri, 7 Jun 2024 12:25:25 +0800
Message-ID: <20240607042615.2069840-61-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052732_012259_073BD2B6 
X-CRM114-Status: GOOD (  17.38  )
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
index faff911f..864271ab 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -80,7 +80,8 @@ fsck_ubifs_SOURCES = \
 	$(libubifs_SOURCES) \
 	ubifs-utils/fsck.ubifs/fsck.ubifs.h \
 	ubifs-utils/fsck.ubifs/fsck.ubifs.c \
-	ubifs-utils/fsck.ubifs/problem.c
+	ubifs-utils/fsck.ubifs/problem.c \
+	ubifs-utils/fsck.ubifs/load_fs.c
 
 fsck_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) -lm -lpthread
 fsck_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index 36a8e061..9bc9c259 100644
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
index 53dc5ff0..eb365b1a 100644
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
@@ -96,4 +99,8 @@ extern int exit_code;
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
