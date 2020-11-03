Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469B6C2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 11:49:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A88216C4
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 11:49:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EfvccF8f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7A88216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nnKmpRN6xI9vKniNnn2e0mQLAFJE3f855r/B0JJHlCw=; b=EfvccF8fBVSCZpDPkTc86P9LsE
	jqPoeOWOLIgxNFNSYpuDGD7hXlGr4a6g6ncC3jXKpFn6Fi76CDNntVLAsOkBgr5oXBrud25p+FIsl
	hvyk10m819+1I3abnbuP7SyAQqoOdsR5B58ADbyMcOIcdu3rViNi5RCoqEvtru5sSpENHSi/I45ku
	2Cmm32AwFGIrjQ6be3Pj98BJ9zG8BO9hKd7W53VgTq5V/3XKhEo3n/ddTfBDyK8fdvULlRkz1VVQd
	+9LDxHKzosAkIVJ+LEf1aZ0xfbFAk1I/c4yoIXOPnMpnbdmHLezK0bTb6wX72GfgITt32EuyixQBy
	xj1T6TxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZunD-0004GT-GM; Tue, 03 Nov 2020 11:48:03 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZunA-0004EP-N0
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 11:48:01 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQSh40ZV9zLt6T;
 Tue,  3 Nov 2020 19:47:32 +0800 (CST)
Received: from DESKTOP-2DH7KI2.china.huawei.com (10.67.101.108) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 19:47:34 +0800
From: Chengsong Ke <kechengsong@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>
Subject: [PATCH] ubifs: Remove useless code in bytes_str_to_int
Date: Tue, 3 Nov 2020 19:47:33 +0800
Message-ID: <20201103114733.16424-1-kechengsong@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.67.101.108]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_064801_062649_204F6173 
X-CRM114-Status: UNSURE (   7.97  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: k00524021 <kechengsong@huawei.com>

As a local variable, "endp" is neither refered nor returned
after this line "endp += 2", it looks like a useless code,
suggest to remove it.

Signed-off-by: Chengsong Ke <kechengsong@huawei.com>
---
 drivers/mtd/ubi/build.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index e85b04e9716b..46a6dd75e533 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1351,8 +1351,6 @@ static int bytes_str_to_int(const char *str)
 		fallthrough;
 	case 'K':
 		result *= 1024;
-		if (endp[1] == 'i' && endp[2] == 'B')
-			endp += 2;
 	case '\0':
 		break;
 	default:
-- 
2.12.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
