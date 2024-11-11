Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C33D2E9C3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEkbpNOKmFrcTI52JM2oyewc1TLq9hEBWcQGUVh/xcA=; b=HV7Cnkv6jDHiRv
	aZtl7WgfcE0o8kWXDvHksA80JZ5dOrPA5D8OdaKcH0Y6PDIzhQdPNoOVwl4/ogP0Gvho0RjPi/6gE
	k6pl3dGgZmJroGWRVoYjyCJ0Wu2NS0x4/j9guG+yjtDav5fkfGPCXwReBMfI0VUHC9ypFxOHoRD5F
	5uajSBZt40PgsK0JnAjShPWy0CrtKIqj7i/AT/NHyRcW4Fw4B9enDzSUzIsoiUz+EEouYvES3HQSH
	YAU3DBmbUULbnHHy7VQo2G/pVIo23AIs3z373dW02UypOP5FHIjZez/G9Dbnz+VO3+7QjhVNftQK5
	tm6gcN2cgJ5jcWKrZbKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQGR-0000000Gvjb-0Q6U;
	Mon, 11 Nov 2024 08:59:15 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQG9-0000000GvVa-32ra
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:59:00 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xn3N80PvVz20t5J;
	Mon, 11 Nov 2024 16:57:44 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 51A541A016C;
	Mon, 11 Nov 2024 16:58:56 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:58:55 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 049/102] fsck.ubifs: Add inconsistent problem handling asking function
Date: Mon, 11 Nov 2024 16:57:20 +0800
Message-ID: <20241111085741.2066378-10-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111085741.2066378-1-chengzhihao1@huawei.com>
References: <20241111085741.2066378-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_005858_217537_3C23EB2E 
X-CRM114-Status: GOOD (  20.32  )
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

There are four dimensions to define the type of inconsistent problems:
 1. fixable: Some inconsistent problems can't be fixed, for example
    corrupted superblock. Un-fixable problem will abort program.
 2. must fix: Some inconsistent problems can be ignored(eg. incorrect
    isize), but some are not(eg. corrupted TNC), which will affect the
    subsequent fsck steps.
 3. drop data: Some fixing methods will drop user data, which is
    unacceptable for safe mode. If it happens, fsck will be aborted.
 4. need rebuild: Some inconsistent problems depends on rebuilding
    filesystem to be fixed(eg. corrupted master node, corrupted TNC).
Define an asking function to handle above kinds of inconsistent problems.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am           |   3 +-
 ubifs-utils/fsck.ubifs/fsck.ubifs.h |   3 +
 ubifs-utils/fsck.ubifs/problem.c    | 111 ++++++++++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 ubifs-utils/fsck.ubifs/problem.c

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 9f4bd429..590f17b6 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -80,7 +80,8 @@ fsck_ubifs_SOURCES = \
 	$(common_SOURCES) \
 	$(libubifs_SOURCES) \
 	ubifs-utils/fsck.ubifs/fsck.ubifs.h \
-	ubifs-utils/fsck.ubifs/fsck.ubifs.c
+	ubifs-utils/fsck.ubifs/fsck.ubifs.c \
+	ubifs-utils/fsck.ubifs/problem.c
 
 fsck_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) \
 		   $(DUMP_STACK_LD) -lm -lpthread
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index 531a3ab9..033a601e 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -87,4 +87,7 @@ static inline const char *mode_name(const struct ubifs_info *c)
 /* Exit code for fsck program. */
 extern int exit_code;
 
+/* problem.c */
+bool fix_problem(const struct ubifs_info *c, int problem_type);
+
 #endif
diff --git a/ubifs-utils/fsck.ubifs/problem.c b/ubifs-utils/fsck.ubifs/problem.c
new file mode 100644
index 00000000..9a8c2e06
--- /dev/null
+++ b/ubifs-utils/fsck.ubifs/problem.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024, Huawei Technologies Co, Ltd.
+ *
+ * Authors: Zhihao Cheng <chengzhihao1@huawei.com>
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <getopt.h>
+
+#include "ubifs.h"
+#include "defs.h"
+#include "debug.h"
+#include "fsck.ubifs.h"
+
+/*
+ * problem flags.
+ *
+ * PROBLEM_FIXABLE: problem is fixable, unsolvable problem such as corrupted
+ *		    super block will abort the fsck program
+ * PROBLEM_MUST_FIX: problem must be fixed because it will affect the subsequent
+ *		     fsck process, otherwise aborting the fsck program
+ * PROBLEM_DROP_DATA: user data could be dropped after fixing the problem
+ * PROBLEM_NEED_REBUILD: rebuilding filesystem is needed to fix the problem
+ */
+#define PROBLEM_FIXABLE		(1<<0)
+#define PROBLEM_MUST_FIX	(1<<1)
+#define PROBLEM_DROP_DATA	(1<<2)
+#define PROBLEM_NEED_REBUILD	(1<<3)
+
+struct fsck_problem {
+	unsigned int flags;
+	const char *desc;
+};
+
+static const struct fsck_problem problem_table[] = {};
+
+static void print_problem(const struct ubifs_info *c,
+			  const struct fsck_problem *problem)
+{
+	log_out(c, "problem: %s", problem->desc);
+}
+
+static void fatal_error(const struct ubifs_info *c,
+			const struct fsck_problem *problem)
+{
+	if (!(problem->flags & PROBLEM_FIXABLE))
+		log_out(c, "inconsistent problem cannot be fixed");
+	else
+		log_out(c, "inconsistent problem must be fixed");
+	exit(exit_code);
+}
+
+/**
+ * fix_problem - whether fixing the inconsistent problem
+ * @c: UBIFS file-system description object
+ * @problem_type: the type of inconsistent problem
+ *
+ * This function decides to fix/skip the inconsistent problem or abort the
+ * program according to @problem_type, returns %true if the problem should
+ * be fixed, returns %false if the problem will be skipped.
+ */
+bool fix_problem(const struct ubifs_info *c, int problem_type)
+{
+	bool ans, ask = true, def_y = true;
+	const struct fsck_problem *problem = &problem_table[problem_type];
+	const char *question = (problem->flags & PROBLEM_NEED_REBUILD) ?
+				"Rebuild filesystem?" : "Fix it?";
+
+	ubifs_assert(c, FSCK(c)->mode != REBUILD_MODE);
+
+	if (!(problem->flags & PROBLEM_FIXABLE)) {
+		exit_code |= FSCK_UNCORRECTED;
+		fatal_error(c, problem);
+	}
+
+	if (FSCK(c)->mode == CHECK_MODE ||
+	    ((problem->flags & PROBLEM_DROP_DATA) && FSCK(c)->mode == SAFE_MODE) ||
+	    ((problem->flags & PROBLEM_NEED_REBUILD) &&
+	     (FSCK(c)->mode == SAFE_MODE || FSCK(c)->mode == DANGER_MODE0)))
+		def_y = false;
+
+	if ((problem->flags & PROBLEM_NEED_REBUILD) &&
+	    (FSCK(c)->mode == DANGER_MODE0 || FSCK(c)->mode == DANGER_MODE1))
+		ask = false;
+
+	print_problem(c, problem);
+	ans = def_y;
+	if (FSCK(c)->mode == NORMAL_MODE) {
+		printf("%s[%d] (%s%s)", c->program_name, getpid(),
+		       c->dev_name ? : "-", mode_name(c));
+		if (prompt(question, def_y))
+			ans = true;
+		else
+			ans = false;
+	} else {
+		if (ask)
+			log_out(c, "%s %c\n", question, def_y ? 'y' : 'n');
+	}
+
+	if (!ans) {
+		exit_code |= FSCK_UNCORRECTED;
+		if (problem->flags & PROBLEM_MUST_FIX)
+			fatal_error(c, problem);
+	} else {
+		exit_code |= FSCK_NONDESTRUCT;
+	}
+
+	return ans;
+}
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
