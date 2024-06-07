Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBA3C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIgnVn4koHz3DgcY/0d3gcrzwGSs3rCP8u6dZZhKFk4=; b=lU+Bf04xJuqdqc
	qrzEKUKHo1ohGKa3KgxOVXuAsm3LbGZVvptIIJF4xZLg9RFzTWAPA+HcWeQUcje0dfLjwP92IQOlL
	QUTI9Ovr0/POFAVSjiuT/XJ9bJVoi7g8A1b35g3v+9r7V4CZR/qtwoY0s8V9wU7OPGUGyRuVSo7Ll
	5wrVCb5hiR0VbQs34DLsSO1fAfU9hAKqbeuIVzY/3KUBc+HAoKnpz2T2yteGfq6j8rW22mlwx6pjP
	NNFA82vjTN60pFum3S/8zq0i+t2f86EDeq63vXAx/1qjYf28hyQz5mKPj3fc38Vys6PGLef+Gq8nR
	BhyrVIVULnbAmn/UJvSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRDV-0000000CHge-3NX7;
	Fri, 07 Jun 2024 04:28:41 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRC4-0000000CGS3-1fx6
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwSj649CMzmYRT;
	Fri,  7 Jun 2024 12:22:34 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 618D4180085;
	Fri,  7 Jun 2024 12:27:10 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:50 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 032/110] ubifs-utils: Add common definitions in linux kernel
Date: Fri, 7 Jun 2024 12:24:57 +0800
Message-ID: <20240607042615.2069840-33-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212713_163407_271766EB 
X-CRM114-Status: UNSURE (   8.71  )
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
index 548d9dfb..506f752c 100644
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
+static inline time_t ktime_get_seconds()
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
