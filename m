Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474A1D12D7E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xGWdBjUpToUYZ/3/EYDxDmFj1MwZ7bwHiX+R2pFIPkw=; b=SX71rhaTTl56dU
	PmlY9JotH0jXboJhUeZ43zNs8ItXlK+KTMBVMQwRlOqe8kb4N8OoeFnVcIe6/qgA4feakLnd78fcE
	zGDIA2OGw3HLZfA46BDUGd8Wn1JpHndDVfv+XSObr5zuHflxrAXgU/znfcefjDHN1G6OK0yE8LjB8
	LBScqNqqqDhqPB1mqDIL4LLshC9Vf12PmxTemIpmSKshWkOXMhw7f7r72Lb69mWhhBvXw1VxaP6IG
	z+L9UHiD6TuzxdwceiKNyA1UmmUvsLjsKegasKsnoVMsWPmB0dmq4dYt3yJTZXcRfYYpvgaH28GNA
	DGSwNqfJF6aaTpF2ASng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVh-0000000GaMl-2H4g;
	Mon, 11 Nov 2024 07:06:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUR-0000000GZIo-379d
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TBqPC8Y9Bf/vSRtjw7LIuHLamLs3tiakmjDzh7uPdYs=; b=RdzxkfqyBY2+6pcJXoQcQXEusV
	2XY2eJZnYCPKOztOpUrj3DlOcQsAXbJ1vvUshF6FNsdWruDB9AC2aRgOzrPkGkf2BtCZKmgtaBjeF
	QUWOMjs4IsT2i/hRfG4eUFn5biFhe1X/9ejOLjterqmAnatBKt04JQUNg8Lr9AB9sjAB4m9UeasI2
	20gJU+0RxFMVVXfnGuMrE5ZkZu1SMWxXSeQTunVc+ESVKtzmyx8XPdBpwnGNcQKetZHeHvdOpioZ0
	DWqq1xfWaYvuZLqlaB4EP30O6nsJ75VOwLsMpKMWJI7Rltt0NvK5sP3L28l1yh8eZqMCfwc07i6oO
	uyI/P4Qw==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUM-0000000CmCs-2Cpe
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:34 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xn0qY4pDgz10Qvv;
	Mon, 11 Nov 2024 15:02:49 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3FA6118007C;
	Mon, 11 Nov 2024 15:05:16 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:15 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 030/102] ubifs-utils: Adapt log.c in libubifs
Date: Mon, 11 Nov 2024 15:02:33 +0800
Message-ID: <20241111070346.1314122-31-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070532_594218_DA76C6A7 
X-CRM114-Status: GOOD (  10.30  )
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
