Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFEFD2E9C2
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xGWdBjUpToUYZ/3/EYDxDmFj1MwZ7bwHiX+R2pFIPkw=; b=i6lBetpU0AnkFo
	udsfax0pukWKkPcJMs293dpRqTLxj/0dqLmVP3I1aCJ90BdOyw0QMAqQHBThymAe+Yludk5WCOxsV
	WWA9x9ULeoGePCVt7CXtm8APEEAC6UszREeZUxvH3DZERmpKauF0It9pwVgbTodwdk8jMaw72FsXL
	qhzljGUOxv/I5aAg5KcwgU74SdsPBLH8vjB78gci5g6C45uZzilMrtNBy7CcUESWGu4YZvM5BUOOc
	43Zfs3SUJFUrNPdURSvhUug3rh3ifb6TpnHKfBcHvc5SWvL1CJdaLfF0JTcK2KSM1nwM0mIjN9v7h
	bNI4fGxDVxIsyixPcsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQ7p-0000000Gstv-2MNI;
	Mon, 11 Nov 2024 08:50:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPwe-0000000GpqS-06UR
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 08:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TBqPC8Y9Bf/vSRtjw7LIuHLamLs3tiakmjDzh7uPdYs=; b=bblIvZ0vBneoEhRgV32y++9wuV
	QeGSekncKoTsfyAPr8h8SdgGAm8BgkjP5WYLpbz9p+cGzuRWSHJbm1ZuhWUzaj/MWbxJzSAp1npef
	k88R2KFzQjtq4vBdMXPEvIcQGMnBKDAH2WapgWZ9Cg0hOLOKLXA5wy0eR7Bfk0lyCJOrd5LMyozLG
	AyG5mHlfqYAYy4spNBn0tF3qODfNFuZG7bSaAbTXPew/1hRRldCJ97tvhhC+Epl7JVt9T9x9vAV9Q
	z8drYy3TezPsC5UKfuUAtc5LBifkt8FZG0sgJSFgr8iHW81o446i6RdwPkr2FDVzPxChn7LQxfpOA
	ONcOYVPA==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPwZ-0000000Cnnj-2ApD
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:38:46 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Xn2wj3W8GzQsQK;
	Mon, 11 Nov 2024 16:37:25 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id ED676180064;
	Mon, 11 Nov 2024 16:38:37 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:38:37 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 030/102] ubifs-utils: Adapt log.c in libubifs
Date: Mon, 11 Nov 2024 16:37:01 +0800
Message-ID: <20241111083711.1916125-31-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_083844_840690_6008BC6E 
X-CRM114-Status: UNSURE (   9.93  )
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
