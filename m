Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DF0D12D7B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDXQ+uci4CLFCb3vqhh6fOfG5i0+YQQU8GLOFpRRNMw=; b=GVoE0+BnbyQTkc
	/tv7gqwmef+u3iqtw8f9IUI1CKW16nMlOjwAf0vbKC/LyiYwwr/VKt0+X0U1FuKc5MEzeUZ/jLD8g
	alpziqX2CDdBPTPsZ4u0jARuwOleJBU2dxY/6mJKpDnikylilBMtBBLmkiZBBC2+pe+GtkEf3T86u
	Bgm7gF4q2JKAXTNOy/pZQwllNvyyZ1F1IJkfMpWT/9VDFEb54bPaEy4cfARPKnlzTLIfH4aiLh52v
	1nG2tmVHLotTsoP1J5PyNZafmZ98kE2dqy0pOSdVTYdDQwQ7fSytWGrpoiCs6Vfq+ArAxcSRHSJnR
	mFKqVGfQz0h53jH10xjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUo-0000000GZdt-0kqE;
	Mon, 11 Nov 2024 07:05:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUP-0000000GZGx-3MdU
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ADNoQID0HJkBqX2fP05JGLpSccGfOGQpeiHyEBERR0s=; b=Iqvif8Vsqxg8yBfSOZhZznm0WF
	q1fzCvZpB3fF8jRdGa6OlAAw3TwfshNiFSp8pAn8K4gIb+E5+J++ARoskkMdaitL6ooscMDSMGSpQ
	RBKdOIey0cNrX0l0GvQV4v8VcWYBoewQmp04YoA//WQ0vSVRJG9oBI/+IcFAwHIGUZFWlmajjuCmy
	UA1nmOdqkJAe1IYkwUxkxGgly29oxmLrO0fJGt4auOw/T/POgDzHDjWEZtobNridk98PSyF0AHOy/
	gn54fbPHKe9CLfuAFor6L7aS1RzW9mtQr2NvB3Hry6M4uXWM8vHsXjGxtjvjKJT9xhSihadlAJKzn
	f3aivFEg==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUK-0000000CmCb-3mi9
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:31 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Xn0tT2DlVz1ynKg;
	Mon, 11 Nov 2024 15:05:21 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3580F1A0188;
	Mon, 11 Nov 2024 15:05:10 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:09 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 018/102] ubifs-utils: Add rwsem implementations
Date: Mon, 11 Nov 2024 15:02:21 +0800
Message-ID: <20241111070346.1314122-19-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070529_886635_DF51E0BD 
X-CRM114-Status: GOOD (  11.68  )
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

Add rwsem implementations, because there are some rwsems
(eg. c->commit_sem) used in UBIFS linux kernel libs.
The rwsem is implemented based on pthread mutex.

This is a preparation for replacing implementation of UBIFS utils with
linux kernel libs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am  |  1 +
 ubifs-utils/common/rwsem.h | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 ubifs-utils/common/rwsem.h

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 9f33f0db..ece8a6e9 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -7,6 +7,7 @@ common_SOURCES = \
 	ubifs-utils/common/bitops.c \
 	ubifs-utils/common/spinlock.h \
 	ubifs-utils/common/mutex.h \
+	ubifs-utils/common/rwsem.h \
 	ubifs-utils/common/kmem.h \
 	ubifs-utils/common/kmem.c \
 	ubifs-utils/common/defs.h \
diff --git a/ubifs-utils/common/rwsem.h b/ubifs-utils/common/rwsem.h
new file mode 100644
index 00000000..3761724b
--- /dev/null
+++ b/ubifs-utils/common/rwsem.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_RWSEM_H_
+#define __LINUX_RWSEM_H_
+
+#include <pthread.h>
+
+struct rw_semaphore {
+	pthread_mutex_t lock;
+};
+
+#define init_rwsem(x)			pthread_mutex_init(&(x)->lock, NULL)
+
+#define down_read(x)			pthread_mutex_lock(&(x)->lock)
+#define down_write(x)			pthread_mutex_lock(&(x)->lock)
+#define up_read(x)			pthread_mutex_unlock(&(x)->lock)
+#define up_write(x)			pthread_mutex_unlock(&(x)->lock)
+#define down_write_trylock(x)		(pthread_mutex_trylock(&(x)->lock) == 0)
+
+#endif
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
