Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A999DC27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8YgrPc9a4jvnsJRkxGn2dEImTIJVV3okfo+2b47UvY=; b=vFdRz8m5KxBwaq
	+I1ihyq+BC3k3nLIJKFDkKGTlAfOUOlJljCNhw1qKFQegNPUD6NlUWYlmrI8kdGUqB6qaY6tykj4B
	CxSK5I9Jlu7iFzQwplOPPLrb+zDHEj9+t9Gzhejzob2GCBRvSTgMXLY1idU5dVO4VdBgZn1d9HP2A
	HKPqPVanw+W/CoiiFBC1r08lBEE3T4orUa8nd7WpYM2z5hLnpuv9i51nKEVytkLAc4sBny3IRPCe9
	ocrGQi+nRkc6c3M4u4lRltkWToj2xG+yzmoHougKYlMw97Fxgeu2fP2YhRLO6UGM8tYwvTDugZ8kz
	/Jfku07aYtBxw+BTv07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCq-0000000CH9C-3W2S;
	Fri, 07 Jun 2024 04:28:00 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBp-0000000CGFH-1hrL
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:08 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwShl6mSbzmYTF;
	Fri,  7 Jun 2024 12:22:15 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id C1F0B14038F;
	Fri,  7 Jun 2024 12:26:51 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:45 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 025/110] ubifs-utils: Add spinlock implementations
Date: Fri, 7 Jun 2024 12:24:50 +0800
Message-ID: <20240607042615.2069840-26-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212657_687588_572EE6EC 
X-CRM114-Status: GOOD (  11.26  )
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

Add spinlock implementations, because there are some spinlocks
(eg. c->cnt_lock, c->buds_lock) used in UBIFS linux kernel libs.
The spinlock is implementated based on pthread mutex.

This is a preparation for replacing implementation of UBIFS utils with
linux kernel libs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am     |  3 ++-
 ubifs-utils/common/spinlock.h | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 ubifs-utils/common/spinlock.h

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 9e075071..7849114e 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -5,6 +5,7 @@ common_SOURCES = \
 	ubifs-utils/common/atomic.h \
 	ubifs-utils/common/bitops.h \
 	ubifs-utils/common/bitops.c \
+	ubifs-utils/common/spinlock.h \
 	ubifs-utils/common/kmem.h \
 	ubifs-utils/common/kmem.c \
 	ubifs-utils/common/defs.h \
@@ -39,7 +40,7 @@ mkfs_ubifs_SOURCES = \
 	$(common_SOURCES) \
 	ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
 
-mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) -lm
+mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) -lm -lpthread
 mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/common
 
diff --git a/ubifs-utils/common/spinlock.h b/ubifs-utils/common/spinlock.h
new file mode 100644
index 00000000..b9ed3938
--- /dev/null
+++ b/ubifs-utils/common/spinlock.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_SPINLOCK_H_
+#define __LINUX_SPINLOCK_H_
+
+#include <pthread.h>
+
+#define spinlock_t		pthread_mutex_t
+#define DEFINE_SPINLOCK(x)	pthread_mutex_t x = PTHREAD_MUTEX_INITIALIZER
+#define spin_lock_init(x)	pthread_mutex_init(x, NULL)
+
+#define spin_lock(x)		pthread_mutex_lock(x)
+#define spin_unlock(x)		pthread_mutex_unlock(x)
+
+#endif
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
