Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC25AD2E9CD
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pbq5MuyfZsNSxfwvRqIGPP7VdaAlPydUpIfZa5XNk90=; b=pcLxZrRxSNb00I
	Fh1OB0W9zyPbHzPbrlVcFSYggPshTgF5kUR5S8ZkQqXue/+2ht6K32UI+C43vCpDrdfFX8trTVzcI
	DhdEAypUml4Zujz6jyk/UQUHwqCNYABoq2fM2nk52HMbV1SmHMinWIjkMOr4nm39AoVE3XZuEEDBT
	bSUGbXS00GsrQM4ObqbFabtfmweXV5IeSeHDmAqxWIzMy42rSTg/bUXgOv9pv7gGw8/yZcl+WvN5V
	Un2zlO43eOqsnGniFXqJsYwOIxggDBdgtPqZXAAcBgzUfLByURocyd2XpSeVeftkC+PJgo7+J19JQ
	ei/Lx4X+oXmqy0iaL0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQky-0000000H6Bz-13Ip;
	Mon, 11 Nov 2024 09:30:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOV4-0000000GZsz-43Ku
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2tm9AyXVu5zcWxLT0Bb7iayOe5Teguuw+cQsNQKRzNg=; b=QAmFlSoarZxWVbWFIM6E+5kBIH
	KQ8rwrRnEVV6+dwR2lUL8A+uOpBYGjK2Sw6BHBvMP3iyz6S0FLv9atxqIZ2SmYqnK2CArjPhcoFlc
	0m8+PL/s3eZ/7dtTLROej/JrM0Q1alkqdpKMV9XLhC8SNEg3UUbYqssaU8PxSgQmmCey7pd6oyX4w
	yKQC1JbrKByA5UN2ITXZmgE4Anx8sW4eMVcyGRzD96NVljpcfWC9OcnUYNxnYgP/i01TwOAa2lxly
	teackmBNYbQ6pxIYxr5jqO4cBVTr0lsRMp/FSZBAZMW9YKKUFDm/Uza5772X55JC5k+LlyPAWYjHo
	vyanX32w==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUo-0000000CmMM-1h1N
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:06:09 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Xn0s63LHbzQsrv;
	Mon, 11 Nov 2024 15:04:10 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D4EA31401F1;
	Mon, 11 Nov 2024 15:05:22 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:22 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 043/102] ubifs-utils: Adapt gc subsystem in libubifs
Date: Mon, 11 Nov 2024 15:02:46 +0800
Message-ID: <20241111070346.1314122-44-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070603_920978_251DA269 
X-CRM114-Status: UNSURE (   8.18  )
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
