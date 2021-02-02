Return-Path: <SRS0=4NdN=HE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEA4C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Feb 2021 12:50:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E092364F49
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Feb 2021 12:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E092364F49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a8Zb5yWMLS/YalifXKBewXWRM1JExCn1rJI/OQvGjQo=; b=0CM1/Dm2nHMc5vqI/ZkF5ITMIy
	bLhSyWmzLlRVsJwaxc+nHteDwJvowR23czs02n2ZQSwblLyXO/t9KK2oAHky8PF7QCeyKdjlZJ/X/
	knAzAejTkDKGy9gBxIAtSoW7/ESiOEl8MEvnHf9jR5yGKsdiJhlM/x2uRPHbLWU2W5vDQCeD7AvuT
	TgwwLTU9FO57XWxWaRYzGLcQkMlG7Ir130fg/PZIFvqYzI52ZqLMu85K1sM3O/GSv2ehfuTyE+iUx
	CDEadOfJ0qpq1zAKrWiMmJBKGFfu4LR3HWMVOSL1vD1WMjbZCh8yuSA+uRhzl/tmAeLsz9h4wEXll
	DX33UvTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6v6y-0003gD-OX; Tue, 02 Feb 2021 12:48:52 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6v6v-0003fq-TH
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2021 12:48:50 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <jbe@pengutronix.de>)
 id 1l6v6m-0000gP-8U; Tue, 02 Feb 2021 13:48:40 +0100
Received: from jbe by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <jbe@pengutronix.de>)
 id 1l6v6k-00081d-NI; Tue, 02 Feb 2021 13:48:38 +0100
From: Juergen Borleis <jbe@pengutronix.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] fs: ubifs: set s_uuid in super block to support ima/evm uuid
 options
Date: Tue,  2 Feb 2021 13:48:38 +0100
Message-Id: <20210202124838.30805-1-jbe@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: jbe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_074849_987797_3087CC70 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: richard@nod.at, Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Oleksij Rempel <o.rempel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Steffen Trumtrar <s.trumtrar@pengutronix.de>

This is required to provide uuid based integrity functionality for:
ima_policy (fsuuid option) and the 'evmctl' command ('--uuid' option).

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Acked-by: Juergen Borleis <jbe@pengutronix.de>
---
 fs/ubifs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index cb3acfb7dd1f..b990baed4de0 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2231,6 +2231,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 		err = -ENOMEM;
 		goto out_umount;
 	}
+	memcpy(&sb->s_uuid, &c->uuid, sizeof(c->uuid));
 
 	mutex_unlock(&c->umount_mutex);
 	return 0;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
