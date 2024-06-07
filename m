Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92822C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekJ6MLPCkA0/scdCcUDieOZEgvEU4Ah0yqvyYS9c5Kw=; b=koRY/cRAAvE+Ox
	WxtfnL7EuSv3panCJdS8hBU/MfDMldUarl4DmG6PyQplNl+bQzMtuDK858h1s1EZO1jMHw/lZGHBi
	6gkgwAkSTSnS+bXWI5al6fVu6wDHvgyGwC7Sa8lbVmx9zry6IHS7jsGK5KQUBgXZU9cC86QnyKgWQ
	edxETQOA/GItN8ezkrK18XkN7sSxDuFk7iX16PFSHrIMJGqiB7MMwYO/V3log1yZMVmWOK3UywVmQ
	gp4+RdL6k7H6BCWd75TAGIoBNxnt3ipOzVbcWviFjGAJIMR9MN6L3Qo6qlqlCsx49sZuNGYGPXGpT
	Ktez4j48u9iZLLyfbkiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRGE-0000000CJm8-2U46;
	Fri, 07 Jun 2024 04:31:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCt-0000000CHAL-0zP7
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Jx3RsWB8uk4l0PJlWfvUoAGOXJxaaT1aylj5Tfav1Jc=; b=Yr6P+DKp8WmOFuGWF0KjkO5s4t
	lqmO/q5u2BvS9NSNkMNTwnYM45uX2FacHDHTqCfeZmY0hHIOOqycNEj/rKYp9Pqa7bxChnPeDEufJ
	yRfd1FdPao5mi3RHUQWG8JDvpnh33Onjo0j+o+bHJHvuF+3clGwX/lOGysNupC374I+wALQpt08JL
	dE/tUc5zOzCLwf2Q+s4w1hHfDHj3RNY//bB5Ulws+EvXGRxNPyFgvNKQdEzGRHAEoA8NbwjPHQ6PX
	GrvsFsBUoATYPJPm3HmNgirBVBurtCbC5VDGoFfm6yA7bcSiiTLSn58JBj0G0OE7R7WzToXZgX+8y
	MM5CyXWg==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCo-00000004U6a-3K2d
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:28:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSk70d9BzsTSD;
	Fri,  7 Jun 2024 12:23:27 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id B8A53180085;
	Fri,  7 Jun 2024 12:27:25 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:09 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 058/110] fsck.ubifs: Add inconsistent problem handling asking function
Date: Fri, 7 Jun 2024 12:25:23 +0800
Message-ID: <20240607042615.2069840-59-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052759_459166_57D9EE33 
X-CRM114-Status: GOOD (  19.44  )
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
index 0ed91dff..faff911f 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -79,7 +79,8 @@ fsck_ubifs_SOURCES = \
 	$(common_SOURCES) \
 	$(libubifs_SOURCES) \
 	ubifs-utils/fsck.ubifs/fsck.ubifs.h \
-	ubifs-utils/fsck.ubifs/fsck.ubifs.c
+	ubifs-utils/fsck.ubifs/fsck.ubifs.c \
+	ubifs-utils/fsck.ubifs/problem.c
 
 fsck_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) -lm -lpthread
 fsck_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index d267dd24..b9783c15 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -88,4 +88,7 @@ static inline const char *mode_name(const struct ubifs_info *c)
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
