Return-Path: <SRS0=Hh9c=LR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE8CC2B9F4
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jun 2021 01:13:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA04F6128C
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jun 2021 01:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA04F6128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bVh6EWkAU2NhTC8Vdu1oB7ptwLCnQJ2U95N2Mfnz3v4=; b=Es3DfEcIAzpa5l
	ZC2Qw9FrwVwsXW6QWUxDplsT6SG1NX4KHHbGeRs7VmrzTFjwzJ43h2nt0SACmXqcGFy1/THEoy1bT
	cG8BIOrbUsK0s65I1h96tFC1WqaaeTtOjz7En8FG7igAA4mxOGXS4KLZJKPOG6A5099nhttifbZmD
	wNT6Fsc2kMVgoC9dEwLqput4AAERuNUesf/RyhpwzdNj2w5mG/M2YTIufgh/PQbaSEIyjtBnXYs15
	3Qe0/538pLaOSnsm8EjrU0JROmqAaGrPR9vtGd5C9qk2lSC2Lk9UMjJdsc5tcNXS7hbNBEIj+cZX1
	/JAQc3AdWdIyt9O90d/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvrS0-008uu2-40; Wed, 23 Jun 2021 01:13:08 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvrRw-008utR-G1
 for linux-mtd@lists.infradead.org; Wed, 23 Jun 2021 01:13:06 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G8lVr0wx4zXk7B;
 Wed, 23 Jun 2021 09:07:48 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 23 Jun 2021 09:12:58 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 23
 Jun 2021 09:12:57 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dan.carpenter@oracle.com>, <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH -next] ubifs: ubifs_gc_start_commit: Fix error check for lp
 pointer
Date: Wed, 23 Jun 2021 09:21:46 +0800
Message-ID: <20210623012146.1418360-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_181304_736955_31837F70 
X-CRM114-Status: UNSURE (   7.95  )
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

Treating the NULL pointer returned from ubifs_fast_find_frdi_idx() as
ENOMEM will make ubifs_gc_start_commit() fails, which could make ubifs
read-only. Actually a returned NULL pointer is the termination
condition in while-loop in ubifs_gc_start_commit().

Fixes: c770cd5190ba ("ubifs: fix an IS_ERR() vs NULL check")
Reported-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/gc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 7cc22d7317ea..b1f276599b04 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -895,10 +895,6 @@ int ubifs_gc_start_commit(struct ubifs_info *c)
 	/* Record index freeable LEBs for unmapping after commit */
 	while (1) {
 		lp = ubifs_fast_find_frdi_idx(c);
-		if (!lp) {
-			err = -ENOMEM;
-			goto out;
-		}
 		if (!lp)
 			break;
 		idx_gc = kmalloc(sizeof(struct ubifs_gced_idx_leb), GFP_NOFS);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
