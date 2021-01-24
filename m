Return-Path: <SRS0=HfhP=G3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97F4C433DB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 23:22:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D8E1229C7
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 23:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D8E1229C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3fLhdP8tOWLZMuWHFmpfxGuxWmxBnc07Dy85UCRpA8I=; b=lLmSHR/2caPIWDp1v3FZwO6Zc
	3bW3e3GF4vxtCr73KRVM+oM1d9mm7dpC8ez7VYMjUbh4e58UIP7NSKy2VImL5nFgf2b739idAe9Bt
	kW4iCaYn21WjDSEXH2YWA7VW9s5Q+JFNvZ+EVCP+5tTO6hV6KFd2Yvp7wX2jJNl96fdOa2YPapbU5
	GEdD3xG5T0Rzt9Vrxqe5JHi2WGp8wALfbl2on6a3ctyCgQ0DNjxNWnfamdRcxK4X8OnrwO5I+MXOx
	2AZ1XpT8Cdy9ZWBm4JrQgAFEDZtPsaQtNFCnw40Ij88iTsJ2W/Yo5UIdtyb7ib49ZfyXf3yRMfgPR
	kkhPkDuCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3ogu-00075c-UQ; Sun, 24 Jan 2021 23:21:08 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3ogq-00072T-Qj
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2021 23:21:06 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id D4ECC1809AD39;
 Mon, 25 Jan 2021 00:21:00 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id pR6BHobZVkWu; Mon, 25 Jan 2021 00:21:00 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id B8rN2csFaLzK; Mon, 25 Jan 2021 00:21:00 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miklos@szeredi.hu
Subject: [PATCH 1/8] fuse: Export fuse_simple_request
Date: Mon, 25 Jan 2021 00:20:00 +0100
Message-Id: <20210124232007.21639-2-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124232007.21639-1-richard@nod.at>
References: <20210124232007.21639-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_182104_962444_A84FCA65 
X-CRM114-Status: UNSURE (   8.52  )
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
Cc: vigneshr@ti.com, fuse-devel@lists.sourceforge.net,
 Richard Weinberger <richard@nod.at>, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, rminnich@google.com, sven@narfation.org
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
