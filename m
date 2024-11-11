Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7F5D2E9C0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlNsG8DOOCC4FLsmByQYxNh4QVXaRo63I+4fIiT0t1Y=; b=yYJndaYvLgQwZz
	jXoZYGePnBRauxe111t0drTqfh6EhIAJP16ifXduSoi7TZwMXvdCY/8J/Hub6xSnHgRuNk6op0Upv
	LcvVXQ2nTRTu0S5LPJU7CC301VfXrvjWm0ulzJ2vUnoPl35QL6Vly+yz0JNmSifklmrl/JD3tF6ut
	Hm2OSI4yzIcDav8lC7J2s/bY11VyRpncdfRgBrW+7wD/WER0aOobjplCnrAS2FVVl2jg+e+78i00B
	JIn6yaWPPNtGN6zsluIZB0575+3yKjPfllUf9L5y48o4sfQrMJ6rEhSnXENj7rBkvdzSSEVEoM07l
	1DIBURwIN/0G5EIMnfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQ7C-0000000GsMD-3QQ4;
	Mon, 11 Nov 2024 08:49:42 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPwP-0000000GphD-0ap6
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:38:42 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn2rY6Mgvz28fSR;
	Mon, 11 Nov 2024 16:33:49 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D5A31401F4;
	Mon, 11 Nov 2024 16:38:31 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:38:30 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 017/102] ubifs-utils: Add mutexlock implementations
Date: Mon, 11 Nov 2024 16:36:48 +0800
Message-ID: <20241111083711.1916125-18-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003833_531257_936EB8A5 
X-CRM114-Status: GOOD (  11.78  )
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
