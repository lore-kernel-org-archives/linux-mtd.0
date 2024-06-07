Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A07C27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2PIjtWivF8qtgLCnqi0qLvzrg/PRrObF1The0Jx5F8=; b=HOEvdH9inDE1gh
	fSR310Sf9HrVZbvPvCl7A9ou/kf6DvX44z+2bTXFg7jxhYjxTOv/gWtgQpfTATsYsNwp+b74Plxwv
	UrxUyESCK+AgVFvg0xcxV/7YDC2T0+ReknlM2i54SxhgOVSLT2/3Fb5ApBHre605+n/+xCvDSGVPx
	oNIcyncpqGKzo0RKUaz9Y+ztvJIxecTXHqr26ohr/PzJCel/aycgjAK/OX641uv3qPvFbbj+okrOY
	z5VPIoQp4D9mLEDqV8bhWrmHh/ROGXdJFtBGJJoHEGEOBanjWz1tXv4/I8zzPI1mw2T9lZlxJt/JA
	SG1fuN9KTEXq8uB8kzsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCt-0000000CHBE-3lea;
	Fri, 07 Jun 2024 04:28:03 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBr-0000000CGH9-3TQv
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:10 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwShm0VlHzmYTL;
	Fri,  7 Jun 2024 12:22:16 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id DE10A14038F;
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
Subject: [RFC PATCH mtd-utils 027/110] ubifs-utils: Add rwsem implementations
Date: Fri, 7 Jun 2024 12:24:52 +0800
Message-ID: <20240607042615.2069840-28-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212700_568250_E9FF44EE 
X-CRM114-Status: GOOD (  11.40  )
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
The rwsem is implementated based on pthread mutex.

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
