Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2BEC27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vFktHUuRf0rPRQGHJ4za+PyimwKLACiVDp3junKQgdY=; b=RCg7TZKvWKe4Sa
	CPe3F3eV1/IOWRor4gc3bFdgHF4nQrPTWyw5O6piQifLPTYr+ncwqcFZQLO+cJLezYLVCbcc3IGbu
	V74pTaKqjXIvglmyHVhzXDmTG2OtXtHL3GPG3AKg/NACGdaGX5fj6eLoyS5Tq/hytFrcEh/xCj2ju
	5hYSzjR7xihIkFiNLO1AXVRLqSAY+IMcSvVtWt/gDnxC36YqtXIW26bdg7IpJoEXGVz3fTEEtbKVF
	15Uji9yyQiO3ETdvQQdPxZ40tWbee8iS4KTupIFLxliY1fWY1WN4QpWcH/m1unJCL4Bz2iG35iZd2
	0g2iPm726p9oe3nFFKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCZ-0000000CGv6-0n0B;
	Fri, 07 Jun 2024 04:27:43 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBl-0000000CG9w-0tS4
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:01 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwShl5WxzzmYRx;
	Fri,  7 Jun 2024 12:22:15 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 978D51400D5;
	Fri,  7 Jun 2024 12:26:51 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:42 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 022/110] ubifs-utils: Add linux kernel memory allocation implementations
Date: Fri, 7 Jun 2024 12:24:47 +0800
Message-ID: <20240607042615.2069840-23-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212654_383888_40ECD3A7 
X-CRM114-Status: GOOD (  14.61  )
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

Add linux kernel memory allocation implementations, because there are many
memory allocations(eg. kmalloc, kzalloc) used in UBIFS linux kernel libs.

This is a preparation for replacing implementation of UBIFS utils with
linux kernel libs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am |  2 ++
 ubifs-utils/common/kmem.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++
 ubifs-utils/common/kmem.h | 56 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 ubifs-utils/common/kmem.c
 create mode 100644 ubifs-utils/common/kmem.h

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 69192ffd..13171b74 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -2,6 +2,8 @@ common_SOURCES = \
 	ubifs-utils/common/compiler_attributes.h \
 	ubifs-utils/common/linux_types.h \
 	ubifs-utils/common/linux_err.h \
+	ubifs-utils/common/kmem.h \
+	ubifs-utils/common/kmem.c \
 	ubifs-utils/common/defs.h \
 	ubifs-utils/common/crc16.h \
 	ubifs-utils/common/crc16.c \
diff --git a/ubifs-utils/common/kmem.c b/ubifs-utils/common/kmem.c
new file mode 100644
index 00000000..e926a137
--- /dev/null
+++ b/ubifs-utils/common/kmem.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Simple memory interface
+ */
+
+#include "compiler_attributes.h"
+#include "linux_types.h"
+#include "kmem.h"
+#include "defs.h"
+
+static void *kmem_alloc(size_t size)
+{
+	void *ptr = malloc(size);
+
+	if (ptr == NULL)
+		sys_errmsg("malloc failed (%d bytes)", (int)size);
+	return ptr;
+}
+
+static void *kmem_zalloc(size_t size)
+{
+	void *ptr = kmem_alloc(size);
+
+	if (!ptr)
+		return ptr;
+
+	memset(ptr, 0, size);
+	return ptr;
+}
+
+void *kmalloc(size_t size, gfp_t flags)
+{
+	if (flags & __GFP_ZERO)
+		return kmem_zalloc(size);
+	return kmem_alloc(size);
+}
+
+void *krealloc(void *ptr, size_t new_size, __unused gfp_t flags)
+{
+	ptr = realloc(ptr, new_size);
+	if (ptr == NULL)
+		sys_errmsg("realloc failed (%d bytes)", (int)new_size);
+	return ptr;
+}
+
+void *kmalloc_array(size_t n, size_t size, gfp_t flags)
+{
+	size_t bytes;
+
+	if (unlikely(check_mul_overflow(n, size, &bytes)))
+		return NULL;
+	return kmalloc(bytes, flags);
+}
+
+void *kmemdup(const void *src, size_t len, gfp_t gfp)
+{
+	void *p;
+
+	p = kmalloc(len, gfp);
+	if (p)
+		memcpy(p, src, len);
+
+	return p;
+}
diff --git a/ubifs-utils/common/kmem.h b/ubifs-utils/common/kmem.h
new file mode 100644
index 00000000..9fe2a364
--- /dev/null
+++ b/ubifs-utils/common/kmem.h
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2008 Silicon Graphics, Inc.
+ * All Rights Reserved.
+ */
+#ifndef __KMEM_H__
+#define __KMEM_H__
+
+#include <stdlib.h>
+
+typedef unsigned int gfp_t;
+
+#define GFP_KERNEL	0
+#define GFP_NOFS	0
+#define __GFP_NOWARN	0
+#define __GFP_ZERO	1
+
+#define vmalloc(size)	malloc(size)
+#define vfree(ptr)	free(ptr)
+
+extern void	*kmalloc(size_t, gfp_t);
+extern void	*krealloc(void *, size_t, __attribute__((unused)) gfp_t);
+extern void	*kmalloc_array(size_t, size_t, gfp_t);
+extern void	*kmemdup(const void *src, size_t len, gfp_t gfp);
+
+static inline void kfree(const void *ptr)
+{
+	free((void *)ptr);
+}
+
+static inline void kvfree(const void *ptr)
+{
+	kfree(ptr);
+}
+
+static inline void *kvmalloc(size_t size, gfp_t flags)
+{
+	return kmalloc(size, flags);
+}
+
+static inline void *kzalloc(size_t size, gfp_t flags)
+{
+	return kmalloc(size, flags | __GFP_ZERO);
+}
+
+static inline void *__vmalloc(unsigned long size, gfp_t gfp_mask)
+{
+	return kmalloc(size, gfp_mask);
+}
+
+static inline void *kcalloc(size_t n, size_t size, gfp_t flags)
+{
+	return kmalloc_array(n, size, flags | __GFP_ZERO);
+}
+
+#endif
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
