Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A8CC56201
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 06:34:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD76D206CA
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 06:34:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DEtnBH8v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD76D206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yj+j15JXQobaKsLa+KoI96XalLQjdKe6Tkge0PILyps=; b=DEtnBH8vbpQc3hN5D9TJJq5Q3+
	1xtjd+UyKilbbxysf19FdeHwcWzOJKamFLJ/ed3xJTf4MxnwjGdLqSH/GvE5m7V7W3zj4n94txkkK
	hqfHIKeY/ylKerS4Hz5h1M8JotQMRMytF8Hn89WTiF14UIHdirN2bBZZ8v367Rryd5M8lfB805pEE
	U+NFDk0L8lDlyD5moArJCflI1XxCWupOxvsMZvKkI+pCBjoQK6PJZi5sOTGp/6QaHJCcEy33XkeEl
	QbL3AdFWGsg/uPR+ga+3M3LR1+Q6B2VpeU3bAdDtBKfk4CBCyxcfH+g0zhqjNY29jtY3NS1B1CTh2
	vTLpy57g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khRte-0001h2-7e; Tue, 24 Nov 2020 06:33:50 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khRtb-0001g9-LR
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 06:33:48 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CgDjn5nzLz72HV;
 Tue, 24 Nov 2020 14:33:17 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 24 Nov 2020
 14:33:26 +0800
From: Wang ShaoBo <bobo.shaobowang@huawei.com>
To: <richard@nod.at>
Subject: [PATCH] ubifs: Fix error return code in ubifs_init_authentication()
Date: Tue, 24 Nov 2020 14:33:20 +0800
Message-ID: <20201124063320.1799-1-bobo.shaobowang@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_013347_960698_3B5027BB 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: cj.chengjian@huawei.com, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 huawei.libin@huawei.com, herbert@gondor.apana.org.au
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix to return PTR_ERR() error code from the error handling case where
ubifs_hash_get_desc() failed instead of 0 in ubifs_init_authentication(),
as done elsewhere in this function.

Fixes: 49525e5eecca5 ("ubifs: Add helper functions for authentication support")
Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
---
 fs/ubifs/auth.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index b93b3cd10bfd..8c50de693e1d 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -338,8 +338,10 @@ int ubifs_init_authentication(struct ubifs_info *c)
 	c->authenticated = true;
 
 	c->log_hash = ubifs_hash_get_desc(c);
-	if (IS_ERR(c->log_hash))
+	if (IS_ERR(c->log_hash)) {
+		err = PTR_ERR(c->log_hash);
 		goto out_free_hmac;
+	}
 
 	err = 0;
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
