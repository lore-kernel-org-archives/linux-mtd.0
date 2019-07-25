Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FB4C76190
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 20:46:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45F99216C8
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 20:46:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XgAVDfaQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45F99216C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=pDQd6sAtd3dHw+hu2pXqO5w5ufKrauXNHcDIklYOiBw=; b=XgA
	VDfaQMJXPatm8h1Mhcf2C3mEYl4nqKfpSScPy37l6NkTadY7RgU3qin6gsd2xcz8XcLnEDuTFwzvb
	V5MPP/vj867pZf2E7Z69pjh887tDt9GqdFrnTft8474Q91nAAk9DiF8m0xoT4dmXMxJbsz2AWbQbj
	cwMFaZ8LHreB2voh9uDbH4u/CJ7BwS0byEtTDq5rFI0hAQ8Bc1nJ/ba4X5rCPyPGYzAMpSFFhuGr5
	k97FhaoX3cM+KQVfzOwSn3gRMF1H0DCcSWgXm13CTH6MQJ5+AK37cDd4ZPiGEWH29gOkVWqIhee7o
	oDbZVk3A0Lyqv7wWKO51pcKPG2VVh3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqkcx-0001wy-7M; Thu, 25 Jul 2019 20:46:15 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqkct-0001uF-QO
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 20:46:13 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 67D2D181821E2;
 Thu, 25 Jul 2019 22:46:10 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id m1DZp134zG_d; Thu, 25 Jul 2019 22:46:08 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bh7zGY6KuOSy; Thu, 25 Jul 2019 22:46:08 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubi: Don't do anchor move within fastmap area
Date: Thu, 25 Jul 2019 22:46:01 +0200
Message-Id: <20190725204601.30642-1-richard@nod.at>
X-Mailer: git-send-email 2.16.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_134612_017061_C2DA2E2B 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

To make sure that Fastmap can use a PEB within the first 64
PEBs, UBI moves blocks away from that area.
It uses regular wear-leveling for that job.

An anchor move can be triggered if no PEB is free in this area
or because of anticipation. In the latter case it can happen
that UBI decides to move a block but finds a free PEB
within the same area.
This case is in vain an increases only erase counters.

Catch this case and cancel wear-leveling if this happens.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 949700a9bb4b..3fcdefe2714d 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -710,6 +710,12 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		if (!e2)
 			goto out_cancel;
 
+		/*
+		 * Anchor move within the anchor area is useless.
+		 */
+		if (e2->pnum < UBI_FM_MAX_START)
+			goto out_cancel;
+
 		self_check_in_wl_tree(ubi, e1, &ubi->used);
 		rb_erase(&e1->u.rb, &ubi->used);
 		dbg_wl("anchor-move PEB %d to PEB %d", e1->pnum, e2->pnum);
-- 
2.16.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
