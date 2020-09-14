Return-Path: <SRS0=tjU8=CX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1E6C43461
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 14:00:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61D6B2068D
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 14:00:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2lMexaFj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61D6B2068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HAu/pEdUWJ9Ax0gzbBmZfHQT7D4YwFKsbkG6m/ZGm6s=; b=2lMexaFjvFtpNXmGMOlrIbvQn
	lhpd8Pr4pquACzm7tcKAEbzYbefVr4QczePV94rwlZNEoc1uGK10hF8WB0DBNJkar82KgiGkYTN4T
	B2Nq9LFboW/O6dA4jfxe5oKLge1kNr6gXQHjWjKGNg6g31W6vcsnIcwq8aYNwtXZWyfK4SpBSfrjr
	aq9eFND/1Z0hkfbEnNMvsmqH5g/H554QDcWS5Y7/acdM4x1wnIMPInCpFuvthiww5AF/Z2oh4iznU
	bnLfp9bkq6tS92GyyiCSJqGNaQv8y58jbKIUONxdr2Q9GWoCULstfpdXcqvkmCurWzq0ikD+1oEXl
	nnDRLYEDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHp1a-00038k-RQ; Mon, 14 Sep 2020 14:00:06 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHp1X-00035Q-Ew
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2020 14:00:04 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8C47C74032D5AE028E6D;
 Mon, 14 Sep 2020 21:59:48 +0800 (CST)
Received: from huawei.com (10.175.113.133) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Mon, 14 Sep 2020
 21:59:44 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <richard@nod.at>
Subject: [PATCH -next 3/4] ubifs: Fix some kernel-doc warnings in replay.c
Date: Mon, 14 Sep 2020 21:56:53 +0800
Message-ID: <20200914135654.55120-4-wanghai38@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914135654.55120-1-wanghai38@huawei.com>
References: <20200914135654.55120-1-wanghai38@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.133]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_100003_807821_82CE3B5A 
X-CRM114-Status: UNSURE (   8.94  )
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

fs/ubifs/replay.c:942: warning: Excess function parameter 'ref_lnum' description in 'validate_ref'
fs/ubifs/replay.c:942: warning: Excess function parameter 'ref_offs' description in 'validate_ref'

They're not in use. Remove them.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 fs/ubifs/replay.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index b69ffac7e415..2f8d8f4f411a 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -931,8 +931,6 @@ static int add_replay_bud(struct ubifs_info *c, int lnum, int offs, int jhead,
  * validate_ref - validate a reference node.
  * @c: UBIFS file-system description object
  * @ref: the reference node to validate
- * @ref_lnum: LEB number of the reference node
- * @ref_offs: reference node offset
  *
  * This function returns %1 if a bud reference already exists for the LEB. %0 is
  * returned if the reference node is new, otherwise %-EINVAL is returned if
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
