Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367BAC27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdJGVdoF3X93n1Ie1GITHmLhNSzSGi76IM4n05cj6Zo=; b=ncdtVsAfC63h4H
	L0DeturtN6WX797KPax/IMlBL6BDCZ96JJ+NPrLkLp0xNqtSmN3krzpNKj/1OCOICkxEZElSi/uPI
	84w4nUivYVqV2FJZivSiixjshWMnyTrIUUbAB14KvpIHeNU7r2g/XcsTgNiiNx8gPU7J/8kE3+6Me
	aHRTdbCVBcU6VsXw6F/G/FewInkZxz8ZixkgIpjgOzl6GdVRXQ5XeuNokhwgtSjlKFNrfQLmN2UDG
	p9Id7i5rY4KbOTr2pr5xBQx2hTfJkb+JsDma4+aijhvTxafDWVguWTLJ4WmjEgWhibkSs2D/ZkIdw
	PiEnFDmiufEhkmGs8P3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRDA-0000000CHPH-0c0B;
	Fri, 07 Jun 2024 04:28:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRC6-0000000CGTq-0Qv6
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=DX1Klfen353hKHcjBn3sKvc50XqIF978ddhWCMEoQsw=; b=kMQLtIE3x8DomeZCZNYnMwiZhO
	UjCCiyHSRNR+OUxFkUPtVWSe2HbC4f5u1sR7mdKVKHqDPEpnklaJ8IinlmqJimSFRsvA5jLmqMJPg
	0fkMe5dKr6lWvc2cbyzqtUTToaQDjIM73P3FaRw/e2LIyjx3pKBQ4XDgM/tZW2/OGPTjtW3x7sO3E
	IescOTxL8T7otBBECc6TJg5A01ilHBdPpW/jMr0RCqtXqNUUJ1WEWlmCtwHbg5qLowOeZ7e/oISv0
	WvAQGkpT6TWQRCEG5qPOur4cggsd7aUM8ZNhvhYg78w+2ceaLnju4LyT4aSXBKSoUCkrn9FxgPGMQ
	IvepfceA==;
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRC2-00000004To0-1H0D
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:12 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VwSjT0fYWz1SB5M;
	Fri,  7 Jun 2024 12:22:53 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id D01771400D5;
	Fri,  7 Jun 2024 12:26:51 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:46 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 026/110] ubifs-utils: Add mutexlock implementations
Date: Fri, 7 Jun 2024 12:24:51 +0800
Message-ID: <20240607042615.2069840-27-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052710_678659_5003279B 
X-CRM114-Status: GOOD (  10.43  )
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
The mutexlock is implementated based on pthread mutex.

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
