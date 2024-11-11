Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAF7D12D7B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2SVAg8DPzdrElofHscgQe6K25Z2fwgB8Hd/p9pRhsw=; b=iu/rNOoxsxgwlH
	5ZgTTwoCUKpVE5lY5JdSDU9Cj+E2TmrMmsGRkXs1kXo8aRqYbmYJXQjg0gqKkz/5fjpoCi0GLe3zI
	6m0pUcLOqvNje7/tnWoBnftQkiW9oPzj4jqMSnsey6/Ww/eVfHwtkSpsemXNxsq0XNaP538UYd1bC
	EyPvdvMYZQ4+FwEuotr/x+ZlfmKX/iregoR11PbyXhE38R5Fy9NTVulymvuAtLWWaMTaUbHsh0CNB
	kMr0PRmx0ay0FrZ8yY7lCn5cZx9YEBpAMVbNHlDapPe+6CvSNKm5rcOIahzcMhO16YvrS9svyLKVD
	gko7Pfk95cf7aeLUaJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOWS-0000000Gb0w-0kLo;
	Mon, 11 Nov 2024 07:07:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOV4-0000000GZsw-42Es
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=G+4UMs5DP+KOtFBYqxcHSH6VjsvpRVdiEtSwau75eMA=; b=cCB20CYHetZ20YZL1YnpIWLzo6
	60h6hsHUBb4rsioyidmeh4k1q/jhJ4iCMdYn3ZAw6Ie1voBrbIYyxpFWdOEIKjE5BwXwoTH32wLyl
	XLjbB8CCvFM7eyj2ZhNZkVzVXznk5iGitZ3IioQIAnvlXrnTiAWbdFmPZ0RnR1uDrRCXHYQqMlxkr
	60n2j2NZy/U975FwmJesaIp6UOePl/H/z5bIhhX06jHK05ivbYm4WxzBgPsBkw8z/WxmN1FuJ1qUW
	ANjkhjyJZ01Z7481yD5R6k4BFMCs4IJ3DeryoSVqqlKTzeZCij0FaRom2Hjf30xhzPRM/J768QrzF
	xWFNKgDQ==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUn-0000000CmMQ-3jeI
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:06:09 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rw3ymWz20t4m;
	Mon, 11 Nov 2024 15:04:00 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B60C71A0188;
	Mon, 11 Nov 2024 15:05:12 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:12 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 023/102] ubifs-utils: Add common definitions in linux kernel
Date: Mon, 11 Nov 2024 15:02:26 +0800
Message-ID: <20241111070346.1314122-24-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070604_030831_105447B8 
X-CRM114-Status: UNSURE (   8.78  )
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
