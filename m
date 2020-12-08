Return-Path: <SRS0=eGw4=FM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2F0C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 12:38:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED24723975
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 12:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED24723975
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qq01WuUYDT8bDUpNXDkFDPLvqPd3NJu+gMm/sRAfHAU=; b=oS57+95CIDahO2/ICXgliFu0yf
	79apmEtpqgz9uwuKyttY2HovuTdeTShRAewSYHZacOVM6zgmZto3bQKwKAI1w+fTXLgHpOkQLGUQe
	4wSxY+1+3+P0hIzBhriCUZzL5dUrs2SRho5LfQUrQJZ71FF18JPyUsAdU7XeRll7ly7/Gd5iAgeLb
	yQdRFbQO/9x87VQAuqY4rhPTwLYGivCPDAo01zP7aQUE6otVccWcrBnKov2NSziXbpKjCSwFKg0PQ
	R3ewhEmhbu0U7bLZRJo5nCGuOIjyvdF77vkcsmNbvlvL7ryRozSVjTRMCQtElvfr27BitOUr4jbGx
	PuPpT+Iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmcFZ-00062U-Ss; Tue, 08 Dec 2020 12:37:49 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmcFW-00061D-Of
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2020 12:37:47 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cr0726V24z7BK7;
 Tue,  8 Dec 2020 20:37:02 +0800 (CST)
Received: from linux-tejb.huawei.com (10.90.53.232) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Tue, 8 Dec 2020 20:37:27 +0800
From: Fangping Liang <liangfangping@huawei.com>
To: <linux-mtd@lists.infradead.org>, <richard@nod.at>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] ubifs:Fixed print foramt mismatch in ubifs
Date: Tue, 8 Dec 2020 21:58:11 +0800
Message-ID: <20201208135811.92321-1-liangfangping@huawei.com>
X-Mailer: git-send-email 2.12.3
MIME-Version: 1.0
X-Originating-IP: [10.90.53.232]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_073747_047635_5A1A1BA5 
X-CRM114-Status: UNSURE (   9.18  )
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
Cc: liangfangping@huawei.com, wangfangpeng1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

fs/ubifs/super.c: function mount_ubifs:
the format specifier "lld" need arg type "long long",
but the according arg "old_idx_sz" has type
"unsigned long long"

Signed-off-by: Fangping Liang <liangfangping@huawei.com>
---
 fs/ubifs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index cb3acfb7dd1f..06612ca8a291 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1572,7 +1572,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	dbg_gen("main area LEBs:      %d (%d - %d)",
 		c->main_lebs, c->main_first, c->leb_cnt - 1);
 	dbg_gen("index LEBs:          %d", c->lst.idx_lebs);
-	dbg_gen("total index bytes:   %lld (%lld KiB, %lld MiB)",
+	dbg_gen("total index bytes:   %llu (%llu KiB, %llu MiB)",
 		c->bi.old_idx_sz, c->bi.old_idx_sz >> 10,
 		c->bi.old_idx_sz >> 20);
 	dbg_gen("key hash type:       %d", c->key_hash_type);
-- 
2.12.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
