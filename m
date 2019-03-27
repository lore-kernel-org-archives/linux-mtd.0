Return-Path: <SRS0=crBW=R6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E56FC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2019 15:06:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F89B2146F
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2019 15:06:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g9tkWWo5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F89B2146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PRzxJ3x6/u2BKcz375WqtSAmDKlPCKs4eQv0W4jSJkA=; b=g9tkWWo5g7takh
	keUPijFvCi1HdAKKNKQPVjQym9fQg7hwGQLhxAoyXPR7numhz8S8bGoQEkMkkzhL8xEzGyhAQb+FN
	RyaCTvHUe3fYVdqcOX104xpN1H0XUuB7bXJ7kq/LAmhmSIRGoLfPuNJChlVWLtMe3JTNM7uwUhodQ
	DQluWG4/jFpDkLQrLoSMUJhdNVCQgUgKK67vvZ+tTyK7i+21CUyqQqtPQKPg0Ggfz8WUWLf+FaZOJ
	pS5q2DVS8v54wHxjM/0c7Kv/1XBrgeX48hWUQKIwqix5aawoqouRDW5sgzE6w8WscHOJSDICWtiCk
	k8553kEChnu0QG5zWBKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9A7p-0002C8-PC; Wed, 27 Mar 2019 15:05:57 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9A7m-0002Ag-6B
 for linux-mtd@lists.infradead.org; Wed, 27 Mar 2019 15:05:55 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9E900C02DB1BED3E7BE3;
 Wed, 27 Mar 2019 23:05:39 +0800 (CST)
Received: from huawei.com (10.175.104.208) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.408.0; Wed, 27 Mar 2019
 23:05:29 +0800
From: Liu Jian <liujian56@huawei.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <bbrezillon@kernel.org>, <marek.vasut@gmail.com>, <richard@nod.at>,
 <joakim.tjernlund@infinera.com>, <ikegami@allied-telesis.co.jp>,
 <keescook@chromium.org>, <vigneshr@ti.com>
Subject: [PATCH v4] mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Date: Wed, 27 Mar 2019 23:03:53 +0800
Message-ID: <1553699033-103289-1-git-send-email-liujian56@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.175.104.208]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_080554_402564_8D78FDA9 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, liujian56@huawei.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In function do_write_buffer(), in the for loop, there is a case
chip_ready() returns 1 while chip_good() returns 0, so it never
break the loop.
To fix this, chip_good() is enough and it should timeout if it stay
not good status for a while.

Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
Signed-off-by: Yi Huaijie <yihuaijie@huawei.com>
Signed-off-by: Liu Jian <liujian56@huawei.com>
Reviewed-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
---
v3-v4:
1. add "mtd: " prefix to subject
2. add some comment suggested by reviewers

I forgot to resend this patch, I am very sorry.

 drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 72428b6..bcabc50 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1876,7 +1876,11 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
+		/*
+		 * We check "time_after" && "!chip_good" before checking
+		 * "chip_good" to avoid the failure due to scheduling.
+		 */
+		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum))
 			break;
 
 		if (chip_good(map, adr, datum)) {
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
