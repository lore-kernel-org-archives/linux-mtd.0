Return-Path: <SRS0=QGqy=EV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D2BC2D0E4
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Nov 2020 08:25:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 672C7223FB
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Nov 2020 08:25:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XGA+Pex6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 672C7223FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8xwTHaz8rx5x76/ELY7eoSQM2tSpm811Tu5Bng64pGQ=; b=XGA+Pex6QY2rawJ6Jvsu6QKn1g
	l2OWsJza54nJ8aubUgKtnCHxU0zCfOQ5kiq/wy6dXRElHnymlHhlCeRKWpQD8CXeBbHHYv7AJQ/T4
	sI5fzAkG+vFZy3OJjbZgQfwe9Uw5eP0QC4yxwujIwshjha1U05x5/QpU7naTCPmIUEeWuKk2qS0kT
	KHVS/a40Wq1GhQpeV0OjXPq9nVt5odffIwi+3R1JEjkmZk7HFiaZSxTb+A7nTk4btlmRIb8zwTvjq
	TX5T82FqjoFGnmRusWQwp+lDtYd1eerAexAAwbG83/VmcOLuI2UDnlofPnJvNlPLf9WWKfshxQW/+
	OhVxh2uA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keDKk-0007tY-Rs; Sun, 15 Nov 2020 08:24:26 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keDKe-0007sL-HG
 for linux-mtd@lists.infradead.org; Sun, 15 Nov 2020 08:24:21 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CYlbN17z3z15LFN;
 Sun, 15 Nov 2020 16:23:44 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Sun, 15 Nov 2020
 16:23:47 +0800
From: Wang ShaoBo <bobo.shaobowang@huawei.com>
To: <richard@nod.at>
Subject: [PATCH] bdi: Fix error return code in alloc_wbufs()
Date: Sun, 15 Nov 2020 16:23:43 +0800
Message-ID: <20201115082343.35645-1-bobo.shaobowang@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_032420_844101_886F891D 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, huawei.libin@huawei.com, cj.chengjian@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix to return PTR_ERR() error code from the error handling case instead
fo 0 in function alloc_wbufs(), as done elsewhere in this function.

Fixes: 6a98bc4614de ("ubifs: Add authentication nodes to journal")
Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
---
 fs/ubifs/super.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index cb3acfb7dd1f..dacbb999ae34 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -838,8 +838,10 @@ static int alloc_wbufs(struct ubifs_info *c)
 		c->jheads[i].wbuf.jhead = i;
 		c->jheads[i].grouped = 1;
 		c->jheads[i].log_hash = ubifs_hash_get_desc(c);
-		if (IS_ERR(c->jheads[i].log_hash))
+		if (IS_ERR(c->jheads[i].log_hash)) {
+			err = PTR_ERR(c->jheads[i].log_hash);
 			goto out;
+		}
 	}
 
 	/*
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
