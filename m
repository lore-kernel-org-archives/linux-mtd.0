Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCE6D2E9C0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2SVAg8DPzdrElofHscgQe6K25Z2fwgB8Hd/p9pRhsw=; b=RmDF+jhk//L95t
	Gfzw5Ih7u8zwgHYMtq48Q2ii7jZ9Eli8S8rnIUD0oTVGrnY1CozXgk1RMXmIRN7h8b4XOrfDhdiWh
	/bHwf95Y+tcQzEENecEH89scvbTYdswJl/jr70jN7TfqEELIJZInVtr0PCclXJbi5+eLCFCWNf1Ws
	w7j1s1klaQrZyLQctgSn2y07z5kbNrzf0kuiaDW16GJ7Up0oJfqFL/4r0xoHBHBDkfglg5W6gh+SF
	nIUGs0ODIjHWdtjrkEJfsnMHhD9fwEZt9DVf0duQDM6V3XbILZzRHj7JiLc0Ov/9Wp++PkHN1NSQx
	hKK8idA8FfHrdHs7tEEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQ7O-0000000GsX2-2oob;
	Mon, 11 Nov 2024 08:49:55 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPwR-0000000GpjF-3LlK
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:38:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Xn2vD03j9z1TB5H;
	Mon, 11 Nov 2024 16:36:08 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 5E9991800A5;
	Mon, 11 Nov 2024 16:38:34 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:38:33 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 023/102] ubifs-utils: Add common definitions in linux kernel
Date: Mon, 11 Nov 2024 16:36:54 +0800
Message-ID: <20241111083711.1916125-24-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003836_188086_0849DBA8 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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

Add common definitions in linux kernel, which are used in UBIFS linux
kernel libs.

This is a preparation for replacing implementation of UBIFS utils with
linux kernel libs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/common/defs.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/ubifs-utils/common/defs.h b/ubifs-utils/common/defs.h
index 548d9dfb..ac46d839 100644
--- a/ubifs-utils/common/defs.h
+++ b/ubifs-utils/common/defs.h
@@ -11,8 +11,11 @@
 #include <unistd.h>
 #include <limits.h>
 #include <errno.h>
+#include <time.h>
+#include <assert.h>
 #include <execinfo.h>
 
+#include "linux_types.h"
 #include "ubifs.h"
 
 /* common.h requires the PROGRAM_NAME macro */
@@ -76,8 +79,41 @@ static inline void dump_stack(void)
 	free(strings);
 }
 
+static inline u32 get_random_u32(void)
+{
+	srand(time(NULL));
+	return rand();
+}
+
+static inline time_t ktime_get_seconds(void)
+{
+	return time(NULL);
+}
+
+#define likely(x) (x)
 #define unlikely(x) (x)
 
+#define cond_resched() do {} while(0)
+
+#define BUG() do {				\
+	assert(0);				\
+} while(0)
+#define BUG_ON(cond) do {			\
+	assert(!cond);				\
+} while(0)
+
+#define smp_wmb()		do {} while(0)
+#define smp_rmb()		do {} while(0)
+#define smp_mb__before_atomic()	do {} while(0)
+#define smp_mb__after_atomic()	do {} while(0)
+
+#define min3(x, y, z) min((typeof(x))min(x, y), z)
+
+static inline u64 div_u64(u64 dividend, u32 divisor)
+{
+	return dividend / divisor;
+}
+
 #define do_div(n,base) ({ \
 int __res; \
 __res = ((unsigned long) n) % (unsigned) base; \
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
