Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB0DD5E140
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pbq5MuyfZsNSxfwvRqIGPP7VdaAlPydUpIfZa5XNk90=; b=l3zMpPPcOG1oGr
	DjjSDAR6+JHhQR+4Uj28gryLnxyd2wScTWUFm8UV8UB7P+0bkIJyh4/+0fS1dRvYvuGu8j0fpqWEW
	WZgRQx4hKpWR9Pz/CzGyiI7qrsUbdR0cpLoaUETov0c0vAjIQARYZAISe55bTTsBLqxETP4cvIdxz
	bgh0uw3Hsg/ngc1RrvRAefrD1MC9vw31amn/GDUckuV6ZdQlugTTq8L4BGFSCZ6DxwSsh1UHZMicT
	+Amai1eEI9XEUFHzPcn6BD8doHMIdXyQW5Vdx6xXcJhzNWQUlWnC98QcYEJ13809Ld0s5Z2A3Uz/n
	F4vav3kF0mxqVjR8MjgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPTi-0000000GkRv-3d4l;
	Mon, 11 Nov 2024 08:08:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPSn-0000000GjlK-2ev4
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 08:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2tm9AyXVu5zcWxLT0Bb7iayOe5Teguuw+cQsNQKRzNg=; b=BGJUjhDLDUFSYNifpCTzWt15Xq
	EeJWJoiusBM9Qkl0xl1Ps67OQbgmRmc4ygqoNcI43qZwRguf4OACX6FHyflX886Njc5AMb57kHVBN
	FUu8UAvTFDh6Lhtn/q45rjFXSiXMWUXaui+WQovTh5UkzjR2qdAqMVdnRCs1PjrYSXRxzY2KiT8CZ
	lCTkiy5S4NFssfoOXnoC2zXcjsw8IrUO7KsWPn2JGZ8kD3DLSUUWHx/c3jSTjrE0IgzPh1d9l5hlb
	fERJ/xsIqiQsZURKO6KcwvSp3yX+cYLmPYwOqcSKdc9BG4UvAyEsOjDrHlJQCV7H0AxuaVmAkzifF
	h+jud18w==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPSi-0000000CnCf-2Poi
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:07:56 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xn2DJ4nsyz10V7P;
	Mon, 11 Nov 2024 16:05:52 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A42DD1800A2;
	Mon, 11 Nov 2024 16:07:44 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:07:44 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 043/102] ubifs-utils: Adapt gc subsystem in libubifs
Date: Mon, 11 Nov 2024 16:06:03 +0800
Message-ID: <20241111080621.1394382-24-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_080754_629446_1D12CFA2 
X-CRM114-Status: UNSURE (   8.65  )
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

Adapt gc subsystem(find.c, gc.c, scan.c) in libubifs, compared with
linux kernel implementations:
 1. Adapt print_hex_dump based on implementations in hexdump.c.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/libubifs/find.c |  9 ++++++++-
 ubifs-utils/libubifs/gc.c   | 10 +++++++---
 ubifs-utils/libubifs/scan.c |  7 ++++++-
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/ubifs-utils/libubifs/find.c b/ubifs-utils/libubifs/find.c
index 873e6e1c..ecf689c4 100644
--- a/ubifs-utils/libubifs/find.c
+++ b/ubifs-utils/libubifs/find.c
@@ -14,8 +14,15 @@
  * for fast access, falling back on scanning the LPT as a last resort.
  */
 
-#include <linux/sort.h>
+#include <sys/types.h>
+
+#include "linux_err.h"
+#include "bitops.h"
+#include "sort.h"
 #include "ubifs.h"
+#include "defs.h"
+#include "debug.h"
+#include "misc.h"
 
 /**
  * struct scan_data - data provided to scan callback functions
diff --git a/ubifs-utils/libubifs/gc.c b/ubifs-utils/libubifs/gc.c
index 3134d070..c3595358 100644
--- a/ubifs-utils/libubifs/gc.c
+++ b/ubifs-utils/libubifs/gc.c
@@ -41,10 +41,14 @@
  * good, and GC takes extra care when moving them.
  */
 
-#include <linux/slab.h>
-#include <linux/pagemap.h>
-#include <linux/list_sort.h>
+#include "linux_err.h"
+#include "bitops.h"
+#include "kmem.h"
 #include "ubifs.h"
+#include "defs.h"
+#include "debug.h"
+#include "key.h"
+#include "misc.h"
 
 /*
  * GC may need to move more than one LEB to make progress. The below constants
diff --git a/ubifs-utils/libubifs/scan.c b/ubifs-utils/libubifs/scan.c
index 84a9157d..74509fd0 100644
--- a/ubifs-utils/libubifs/scan.c
+++ b/ubifs-utils/libubifs/scan.c
@@ -15,7 +15,12 @@
  * debugging functions.
  */
 
+#include "linux_err.h"
+#include "kmem.h"
 #include "ubifs.h"
+#include "defs.h"
+#include "debug.h"
+#include "key.h"
 
 /**
  * scan_padding_bytes - scan for padding bytes.
@@ -232,7 +237,7 @@ void ubifs_scanned_corruption(const struct ubifs_info *c, int lnum, int offs,
 	if (len > 8192)
 		len = 8192;
 	ubifs_err(c, "first %d bytes from LEB %d:%d", len, lnum, offs);
-	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 4, buf, len, 1);
+	print_hex_dump("", DUMP_PREFIX_OFFSET, 32, 4, buf, len, 1);
 }
 
 /**
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
