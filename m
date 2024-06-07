Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E30C27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xGWdBjUpToUYZ/3/EYDxDmFj1MwZ7bwHiX+R2pFIPkw=; b=Pt0Y9JyD47CMPs
	lP18oRUzsVBkH2One4OwBTiLYHoWQSRbeWtdxRqAxpngks8hKoggWys+3CV8SYdDgL/OBFpLGUpfA
	h7IlG02blvT8utYI3hEE1e9ZbmJ7r1F4K+7DLgr/IyaOu+8EzKyXU7Opba1QD5ETbpQgNxd+miMda
	JNTF8XqUsemrQk9nJlpgKwy8ZAIyfwPqbPRfy7CyEwUp3956HUTNeAHQxVnZh/fMO3kQd6IMUEN3S
	dFX1Fa5ftRoEOd9kOewV9R/ztRWBLoRqzStiBqDfmFFbZuniaNVzrj14qHSDtAgfscN6P6M2U1nNe
	03o6I8fG9e7ZX6CCexxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRDQ-0000000CHcG-1atb;
	Fri, 07 Jun 2024 04:28:36 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRC4-0000000CGSa-3cnU
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:19 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSjr2m1jzsTRt;
	Fri,  7 Jun 2024 12:23:12 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 0EF8E18007E;
	Fri,  7 Jun 2024 12:27:11 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:55 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 039/110] ubifs-utils: Adapt log.c in libubifs
Date: Fri, 7 Jun 2024 12:25:04 +0800
Message-ID: <20240607042615.2069840-40-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212713_397248_E84B64F5 
X-CRM114-Status: GOOD (  10.14  )
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

Adapt log.c in libubifs, compared with linux kernel implementations:
 1. Remove debug related implementations(eg. dbg_check_bud_bytes), debug
    functions are not needed by fsck, because fsck will check fs in
    another way.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/libubifs/log.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/ubifs-utils/libubifs/log.c b/ubifs-utils/libubifs/log.c
index b6ac9c42..0d459261 100644
--- a/ubifs-utils/libubifs/log.c
+++ b/ubifs-utils/libubifs/log.c
@@ -15,7 +15,13 @@
  * journal.
  */
 
+#include "linux_err.h"
+#include "bitops.h"
+#include "kmem.h"
 #include "ubifs.h"
+#include "defs.h"
+#include "debug.h"
+#include "misc.h"
 
 static int dbg_check_bud_bytes(struct ubifs_info *c);
 
@@ -737,26 +743,7 @@ out_free:
  * ('c->bud_bytes' is correct). Returns zero in case of success and %-EINVAL in
  * case of failure.
  */
-static int dbg_check_bud_bytes(struct ubifs_info *c)
+static int dbg_check_bud_bytes(__unused struct ubifs_info *c)
 {
-	int i, err = 0;
-	struct ubifs_bud *bud;
-	long long bud_bytes = 0;
-
-	if (!dbg_is_chk_gen(c))
-		return 0;
-
-	spin_lock(&c->buds_lock);
-	for (i = 0; i < c->jhead_cnt; i++)
-		list_for_each_entry(bud, &c->jheads[i].buds_list, list)
-			bud_bytes += c->leb_size - bud->start;
-
-	if (c->bud_bytes != bud_bytes) {
-		ubifs_err(c, "bad bud_bytes %lld, calculated %lld",
-			  c->bud_bytes, bud_bytes);
-		err = -EINVAL;
-	}
-	spin_unlock(&c->buds_lock);
-
-	return err;
+	return 0;
 }
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
