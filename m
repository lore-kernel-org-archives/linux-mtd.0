Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BFAD2E9C3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDXQ+uci4CLFCb3vqhh6fOfG5i0+YQQU8GLOFpRRNMw=; b=eV1a35N2UYFuHj
	GTQPdMkoq8Uf01oV+qPE+oPmwWYE+wWO22mlOMmLaxp/9XDKRvX4Io5+ljkYiW7CQJPiF9D/iC7oN
	/vkEI9dT/BkdW/iuaDHvd2pkd/ltekPIwsdGAFWvgfDBNw6Hj5yW1sU1L1yvmBJ2xEYp54V7Mb53V
	5w79sxYMWHCuF02+miTxf+mtb2Prmdd+UqVIZM6sg69S8jK/LNuSbsO4hD//wZuzKTjqq/Z5jV25l
	T4YhsyNgrNHdGB9IV4xOWlpWz9rUNpmFYnhbRswKPkyhSW7B+/9ywfOyEXQDIx6nU0SBkb5R/T9SO
	VmDKjFeL8QGd60ga5PLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQ79-0000000GsJl-0vBi;
	Mon, 11 Nov 2024 08:49:39 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPwP-0000000GphR-13Li
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:38:42 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Xn2vv6M6Sz1hwN7;
	Mon, 11 Nov 2024 16:36:43 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id C70CC14022D;
	Mon, 11 Nov 2024 16:38:31 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:38:31 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 018/102] ubifs-utils: Add rwsem implementations
Date: Mon, 11 Nov 2024 16:36:49 +0800
Message-ID: <20241111083711.1916125-19-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003833_623828_D2B95912 
X-CRM114-Status: GOOD (  11.91  )
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
