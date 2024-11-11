Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BA5D12D7F
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlNsG8DOOCC4FLsmByQYxNh4QVXaRo63I+4fIiT0t1Y=; b=E7GwTop1FiSYkk
	1SOZ4LLKTXorECGFo/CSORyrw7ECOoAF6jK83Dtl6booWn8g0SLUd6gzfgC6+Y3wAy2qNYqESXERJ
	Xmqr2I4WrW70TyPSIpRrBLiX2/w6q5jPv+GOIdIeGSfHQHClLLJak3XbORCx4n/uW97DmlMG0jZe5
	IE6Eo6MWo9OeAlbRRlFmgD4oJxTUF3c7jLfgK9Uh6ZggiugUMzVS6wMtNZeNN1risIKSm4I+eNPU/
	ogJVfL+4Jkll00RyYaSW5YeOYVdZso2S03koBP4x2xKWIxseV0GhSJQiLJvdwI3xyGYieSBJWvryY
	Nd16CsJ4YIfsGrn9tS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUH-0000000GZCU-1qE9;
	Mon, 11 Nov 2024 07:05:25 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOU3-0000000GZ3S-10LC
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:15 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rB3YL9z2DgyY;
	Mon, 11 Nov 2024 15:03:22 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B93E014011F;
	Mon, 11 Nov 2024 15:05:09 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:09 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 017/102] ubifs-utils: Add mutexlock implementations
Date: Mon, 11 Nov 2024 15:02:20 +0800
Message-ID: <20241111070346.1314122-18-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_230511_566129_2111C4FF 
X-CRM114-Status: GOOD (  11.60  )
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

Add mutexlock implementations, because there are some mutexlocks
(eg. c->tnc_mutex, c->log_mutex) used in UBIFS linux kernel libs.
The mutexlock is implemented based on pthread mutex.

This is a preparation for replacing implementation of UBIFS utils with
linux kernel libs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am  |  1 +
 ubifs-utils/common/mutex.h | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 ubifs-utils/common/mutex.h

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 7849114e..9f33f0db 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -6,6 +6,7 @@ common_SOURCES = \
 	ubifs-utils/common/bitops.h \
 	ubifs-utils/common/bitops.c \
 	ubifs-utils/common/spinlock.h \
+	ubifs-utils/common/mutex.h \
 	ubifs-utils/common/kmem.h \
 	ubifs-utils/common/kmem.c \
 	ubifs-utils/common/defs.h \
diff --git a/ubifs-utils/common/mutex.h b/ubifs-utils/common/mutex.h
new file mode 100644
index 00000000..4bf018b0
--- /dev/null
+++ b/ubifs-utils/common/mutex.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_MUTEX_H_
+#define __LINUX_MUTEX_H_
+
+#include <pthread.h>
+
+struct mutex {
+	pthread_mutex_t lock;
+};
+
+#define mutex_init(x)		pthread_mutex_init(&(x)->lock, NULL)
+
+#define mutex_lock(x)		pthread_mutex_lock(&(x)->lock)
+#define mutex_lock_nested(x, c)	pthread_mutex_lock(&(x)->lock)
+#define mutex_unlock(x)		pthread_mutex_unlock(&(x)->lock)
+#define mutex_is_locked(x)	(pthread_mutex_trylock(&(x)->lock) == EBUSY)
+
+#endif
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
