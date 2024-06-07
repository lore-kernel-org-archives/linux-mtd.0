Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF9FC27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 05:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pbq5MuyfZsNSxfwvRqIGPP7VdaAlPydUpIfZa5XNk90=; b=ZRLiXrGDv5Q4M7
	MiHNW8hbnbSa54JnYF7JhX/8rmX7B4lMZWzHjuSmU4VNmGcyWdcp9+YaHJ1TsZJs8Va8dhY53zYOf
	CpJ/zoXnRvJYn2DxHA67Zy6Pk+ogFB8man4oy1TMS1gPvnLeiIQ6PFRtjbv3b4M08J0j25T5W6Cn6
	VqO2L3MIKvBVr0jWw9VyZA34MRIJBIABTfTEGCqfzVf4mNp9U9qz9fXR327LQ9BtH4fTUnRlkuL4P
	CHZxNEGnU98I6SYXMkyiI+gaHb+ORpXf2UrUONws7PwnsAljGGZp2/q9qxDsPsWao1b0ABiVVTFBW
	tHTpUrDZ8XooDvEv/9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSDM-0000000CUmO-441G;
	Fri, 07 Jun 2024 05:32:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCQ-0000000CGne-2EpU
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=2tm9AyXVu5zcWxLT0Bb7iayOe5Teguuw+cQsNQKRzNg=; b=TTZLDdj4c78CQwT5zMw31mnHvX
	C19wyqX/dRLM7Nd7KX7hmKrMlWQAL08FG7Sc/8atbYRUTYwd4NXmkcCpwGAxcf6kq1qeujiUicDpX
	Ds85IKgU7UeIi9JQ+/oikcXN2Fzc6SsnHahReS7BOJTIKdN+iC+F5l/die/XfIyVBTpuDPSLEAAOI
	uCwhuusmwRxKvYCt8C8h2PUfofkTWY8TLikO2TsBBU//qVyvUneSp8KuYXuHkkOpHskrbqBGDJqOo
	koLguTcP3Mlr4fwnjCXBnA+rcRcb4zt1PYZlexHFfMBQym00YkmnafI7GqoFeP+Tr91t6JHPEAyoK
	cCRJ+JuQ==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCN-00000004Tsg-0my1
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwSjP3X7JzmXhG;
	Fri,  7 Jun 2024 12:22:49 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D786180085;
	Fri,  7 Jun 2024 12:27:25 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:05 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 052/110] ubifs-utils: Adapt gc subsystem in libubifs
Date: Fri, 7 Jun 2024 12:25:17 +0800
Message-ID: <20240607042615.2069840-53-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052731_563809_213201E8 
X-CRM114-Status: UNSURE (   8.04  )
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
