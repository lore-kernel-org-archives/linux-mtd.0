Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3114CC63697
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 14:19:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACB8222226
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 14:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qD6+t+23"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACB8222226
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3fLhdP8tOWLZMuWHFmpfxGuxWmxBnc07Dy85UCRpA8I=; b=qD6+t+23rYnelAfrnGqNxi5iU
	kw2rABud1VuiKKRYpDWANyrlqSb41zAll0PbeWtOexGyFzPIZ37PcyFvX6BIbmez1ssjYTVvQYOJb
	BFCisPgAalYT6iUSu3gffpFmRIWTPZ/yZ24us/ZubW3RdO2U+MheT8L4yspvL1ni+yUZ5glPoWNx/
	iTkelvSWgpOkhqCdY/oF9Noa7SaqL0o9TuXd+dG+TipxXJC0FdRt/ZEPEu9RbgD9lPYlAsfQO9jA/
	0LHvuWWHvRcUisU6nW+RQaLRcjh4qzqafnkzozJP0sQAt6hmyWF/Ddm7DMQvTpcd/c0Jba3Y/T8SN
	XVEZInFxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfkll-0003MO-Ax; Thu, 19 Nov 2020 14:18:41 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfklg-0003JK-PG
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 14:18:37 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id CEE1F181C88E4;
 Thu, 19 Nov 2020 15:18:26 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8Geu4G_KY9Fm; Thu, 19 Nov 2020 15:18:26 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9Y_VR-WpkaVL; Thu, 19 Nov 2020 15:18:26 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miklos@szeredi.hu
Subject: [PATCH 2/5] fuse: Export fuse_simple_request
Date: Thu, 19 Nov 2020 15:16:56 +0100
Message-Id: <20201119141659.26176-3-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201119141659.26176-1-richard@nod.at>
References: <20201119141659.26176-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_091836_988924_8D579279 
X-CRM114-Status: UNSURE (   9.62  )
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
Cc: vigneshr@ti.com, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

MUSE will use this function to issue requests,
so export it.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/fuse/dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 588f8d1240aa..8b7209537683 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -522,6 +522,7 @@ ssize_t fuse_simple_request(struct fuse_mount *fm, struct fuse_args *args)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(fuse_simple_request);
 
 static bool fuse_request_queue_background(struct fuse_req *req)
 {
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
