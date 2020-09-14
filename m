Return-Path: <SRS0=tjU8=CX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13816C433E2
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 14:00:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9087208E4
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 14:00:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mtBG5pKz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9087208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4wRKPoCF3p5nnGL5YjcO6I0Y24y9/3c46JPiuXy8ysY=; b=mtBG5pKzUZ5HvFH3IEsETO6my
	+oh3jOMvOwYfBdnYEEYHNmcboOtkM2L2cQf989Cs/caxmRZUDcSMa35SFJ9S7lPjmevDIhEvnXShH
	/fjzkgJAIV+9puZCJc6zfIgjSlYz/ICrwUDieCjYxe6G0I4u6DaCdZUVCPMbm4Ic02rBN7kFAHQ48
	liV/3dz/VV5I3XijdTR/K5q6jmU6i/nmR3UWs3ay78BRQNmmYFjqDW74VbBLIVwUUic/twL7ZsKVn
	CSI7XRw/bvLOe39Cq5P/NRoJm3ov15PqwQoeHukEu8LpdStjRJFeAwLWRCwE3O60fAjW9vOCfCKhI
	dp62rX+AQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHp1f-00039Y-Rr; Mon, 14 Sep 2020 14:00:11 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHp1X-00035R-Dc
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2020 14:00:05 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 901A18449679F6E808C5;
 Mon, 14 Sep 2020 21:59:48 +0800 (CST)
Received: from huawei.com (10.175.113.133) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Mon, 14 Sep 2020
 21:59:44 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <richard@nod.at>
Subject: [PATCH -next 2/4] ubifs: Fix some kernel-doc warnings in gc.c
Date: Mon, 14 Sep 2020 21:56:52 +0800
Message-ID: <20200914135654.55120-3-wanghai38@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914135654.55120-1-wanghai38@huawei.com>
References: <20200914135654.55120-1-wanghai38@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.133]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_100003_809461_0124F1B5 
X-CRM114-Status: UNSURE (   7.83  )
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

Fixes the following W=1 kernel build warning(s):

fs/ubifs/gc.c:70: warning: Excess function parameter 'buf' description in 'switch_gc_head'
fs/ubifs/gc.c:70: warning: Excess function parameter 'len' description in 'switch_gc_head'
fs/ubifs/gc.c:70: warning: Excess function parameter 'lnum' description in 'switch_gc_head'
fs/ubifs/gc.c:70: warning: Excess function parameter 'offs' description in 'switch_gc_head'

They're not in use. Remove them.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 fs/ubifs/gc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 62cb3db44e6e..a4aaeea63893 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -57,10 +57,6 @@
 /**
  * switch_gc_head - switch the garbage collection journal head.
  * @c: UBIFS file-system description object
- * @buf: buffer to write
- * @len: length of the buffer to write
- * @lnum: LEB number written is returned here
- * @offs: offset written is returned here
  *
  * This function switch the GC head to the next LEB which is reserved in
  * @c->gc_lnum. Returns %0 in case of success, %-EAGAIN if commit is required,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
