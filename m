Return-Path: <SRS0=qKgU=LP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BFEC48BE5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jun 2021 15:23:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8974C6023C
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jun 2021 15:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8974C6023C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nL7sKGf9DrLcqYteLXcskLrCLxSq+uvbF3VkZSt0I8A=; b=xtNIfJhTQHbpxv
	bmtMPen3fhiDTftmDhkU6m6NhcJxXIhvnc+fZW0koKTgKwtCpE0E+Db/xQSS/oar8RMRiFKXxEnPR
	/Bzbvn33t/kEPPL3vZxUrueai82iW0//norQM48zTExewVcSplnxmZ1G5lekxWJEdqXLrIqmFFiuy
	wVttMEoaw6RrY5Em7vsOqWzbQ3Dz4Jg3JhpgKU80bWiwURSkaIZEz9viLwdb0As4UX2Sjf0Q5dtWL
	W/B9yRg9/ayHf+1NIZdzSXKDGZYWS09SbytbXWTqBmsA7pMpaWusZvIrWOzmL0ERdhctzm9iTbvxO
	1HckFR+TzkZoUhk3PMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvLlK-003tt8-6S; Mon, 21 Jun 2021 15:22:58 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvLlH-003tsJ-Ar
 for linux-mtd@lists.infradead.org; Mon, 21 Jun 2021 15:22:56 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lvLlB-0001q5-GW; Mon, 21 Jun 2021 15:22:49 +0000
From: Colin King <colin.king@canonical.com>
To: Richard Weinberger <richard@nod.at>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: Remove a redundant null check on pointer lp
Date: Mon, 21 Jun 2021 16:22:49 +0100
Message-Id: <20210621152249.20901-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_082255_435330_405BF66E 
X-CRM114-Status: UNSURE (   8.11  )
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

From: Colin Ian King <colin.king@canonical.com>

An earlier fix to replace an IS_ERR check on lp with a null check
on lp didn't remove a following null check on lp. The second null
check is redundant and can be removed.

Addresses-Coverity: ("Logically dead code")
Fixes: c770cd5190ba ("ubifs: fix an IS_ERR() vs NULL check")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ubifs/gc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 7cc22d7317ea..465beea52176 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -899,8 +899,6 @@ int ubifs_gc_start_commit(struct ubifs_info *c)
 			err = -ENOMEM;
 			goto out;
 		}
-		if (!lp)
-			break;
 		idx_gc = kmalloc(sizeof(struct ubifs_gced_idx_leb), GFP_NOFS);
 		if (!idx_gc) {
 			err = -ENOMEM;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
