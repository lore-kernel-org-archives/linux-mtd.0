Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF1BD2E9C5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eaz3HaJwa+tOzhI6CzlsM3o/wUMZF7BWamrcFyEf96Y=; b=XFtI/6wcwewdRT
	IbEfjUUBBwRZkTucjyxsAlekyLor7skGsGUF6u1TUZoT2/ocZuls0qVy7aV0NOpHBTefQjM3CpzCw
	1nTPUMgSzgsS6XM1oSWD2b7UTiKKBcoDDHxbwCSa1IUfKnh1sOvqOuqzfKl6wdNCUB50/IGYL3Z1z
	BGptx5drZ3A8zYRU2/nYG+aJRaaKVA449FTnFmKmosPUtE3YsbLOUcVggU4ZOxTdH6zZhaNuQVBDL
	CIsD6g6BMo2sIPrbaoLpTaZmJesZdh/9w2CYkbva1IKcK2WwDuSRaGulc9meEuTWklu38noTvyiec
	FbiiuT6sxJOINro9b3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQ6Z-0000000GrnG-3oJA;
	Mon, 11 Nov 2024 08:49:03 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPwM-0000000Gpdj-1jtu
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:38:35 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn2vs4Sy4z1jy0r;
	Mon, 11 Nov 2024 16:36:41 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id BFBB4180043;
	Mon, 11 Nov 2024 16:38:28 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:38:28 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 012/102] ubifs-utils: Add linux kernel error conversion definitions
Date: Mon, 11 Nov 2024 16:36:43 +0800
Message-ID: <20241111083711.1916125-13-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003830_690121_61C5407C 
X-CRM114-Status: GOOD (  17.85  )
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

Add linux kernel error conversion definitions, because there are
many error type conversions(eg. PTR_ERR, ERR_PTR) used in UBIFS
linux kernel libs.

This is a preparation for replacing implementation of UBIFS utils with
linux kernel libs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am      |  1 +
 ubifs-utils/common/linux_err.h | 62 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 ubifs-utils/common/linux_err.h

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 0f9c0fa6..69192ffd 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -1,6 +1,7 @@
 common_SOURCES = \
 	ubifs-utils/common/compiler_attributes.h \
 	ubifs-utils/common/linux_types.h \
+	ubifs-utils/common/linux_err.h \
 	ubifs-utils/common/defs.h \
 	ubifs-utils/common/crc16.h \
 	ubifs-utils/common/crc16.c \
diff --git a/ubifs-utils/common/linux_err.h b/ubifs-utils/common/linux_err.h
new file mode 100644
index 00000000..5c6ddc3f
--- /dev/null
+++ b/ubifs-utils/common/linux_err.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_ERR_H
+#define _LINUX_ERR_H
+
+/* Adapted from include/linux/err.h */
+
+#include <stdbool.h>
+
+/*
+ * Kernel pointers have redundant information, so we can use a
+ * scheme where we can return either an error code or a normal
+ * pointer with the same return value.
+ *
+ * This should be a per-architecture thing, to allow different
+ * error and pointer decisions.
+ */
+#define MAX_ERRNO	4095
+
+#define IS_ERR_VALUE(x) ((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
+
+static inline void * ERR_PTR(long error)
+{
+	return (void *) error;
+}
+
+static inline long PTR_ERR(const void *ptr)
+{
+	return (long) ptr;
+}
+
+static inline bool IS_ERR(const void *ptr)
+{
+	return IS_ERR_VALUE((unsigned long)ptr);
+}
+
+static inline bool IS_ERR_OR_NULL(const void *ptr)
+{
+	return !ptr || IS_ERR_VALUE((unsigned long)ptr);
+}
+
+/**
+ * ERR_CAST - Explicitly cast an error-valued pointer to another pointer type
+ * @ptr: The pointer to cast.
+ *
+ * Explicitly cast an error-valued pointer to another pointer type in such a
+ * way as to make it clear that's what's going on.
+ */
+static inline void * ERR_CAST(const void *ptr)
+{
+	/* cast away the const */
+	return (void *) ptr;
+}
+
+static inline int PTR_ERR_OR_ZERO(const void *ptr)
+{
+	if (IS_ERR(ptr))
+		return PTR_ERR(ptr);
+	else
+		return 0;
+}
+
+#endif /* _LINUX_ERR_H */
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
