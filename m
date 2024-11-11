Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC48D2E9C9
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Hh34ISQXbKkJqXphyv2slvXG7pmCfjKPVD/ijLF5aw=; b=xL/lO7xQwW8vZU
	VUpC6DfMa3bIdyaMFhrg+XBRmEBf8VpBPpI3xDJcI33/wHYjQouUHIcwFd11Omir0b1W9ZRYZUa9A
	1l5D9bxs1FCss2M3YgiVjrFDRzQBS11mc0091EJmutyEHP3WuiCP4k7gmOH4/bbxqGV/UXPqPoQic
	pQqGPCJP0amxC3hoQNsHqpW0j7NqnRf8lKKVZxZDxhgmPskqS2nh+JLCGSz0N2MKh8jU0SvT6Hf9o
	L+oEi8ifn1LRp1J5wqzgswvw3EHivYDgPDf8hMiOfoBOQ4BCITglpmJ4cn/wsScAFnch33K616+TY
	5gxf+cdsWYPfcEZbnUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQkw-0000000H6BM-3YiM;
	Mon, 11 Nov 2024 09:30:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUc-0000000GZTW-3Q1F
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EAjIhoC8PFHrJ+M8fxDxq/uNf4+4gccLTPgO/i76x74=; b=GKB/L4dW9HZ7BBEkxCIuInv2aT
	K7EspbUJgtbkobasc+5Neu7ZIWKATp8tIpPAQkymp5tnApC52xMwAFWj5ENULPpp97mWubMQqUHGM
	w1Da6T8RRUpsQGf8Qtpo35FNN2MAO+e1vb6VaEOZhmTygr+GdFsQXYjm8CKDZsgbC0ngoL7sqjEs+
	i7ltadTLYo88fkvBWDRH6AHDN36fi3xb0PSc7kIZPHcF1vOITyirJiGTGCMWL5JLmaC90EGBBvm/V
	hZJozm6OezhViFTiZFn2nzZHJ1ccyVzcvdsUzHlzCH0aSp4GtAhNa+PzjwraXBYs64oJsa228o2GP
	mgduxgvQ==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUZ-0000000CmFz-14Ki
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:45 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Xn0r92nwyz1hwTv;
	Mon, 11 Nov 2024 15:03:21 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3B23514011F;
	Mon, 11 Nov 2024 15:05:09 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:08 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 016/102] ubifs-utils: Add spinlock implementations
Date: Mon, 11 Nov 2024 15:02:19 +0800
Message-ID: <20241111070346.1314122-17-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070544_082632_62C84FA9 
X-CRM114-Status: GOOD (  11.43  )
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
The spinlock is implemented based on pthread mutex.

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
