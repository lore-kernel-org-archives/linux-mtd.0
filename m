Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2114C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 07:25:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 458C564DDA
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 07:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 458C564DDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gsky07rw/yWAZHWRWd71QnjOU4gXBqFiFyNwXPxRiNw=; b=gWGN4JXyzsC7dq0GLjRfjJjh/
	zpY8zGfoPTB6Ho/pHpf0BnFG+VKq7SiVwUJyTe3UCW7QJJKi8Z6bXzMVRVy59z3ycARhNVzC4TsaM
	ijwEzmbVUQIeyBATOLAfQUVO5gLNDBRiLYz/EB+SbIM2D5weESjDip0QDjUQMjJvfjwYc4UxNOtT1
	cFiHu47YRQYfINAiLNvz1jbGwapWgZsJvFHYYgV7hyuLEOszFolMHx6iw7Sy4K2JHi+B3Mxlu4gFx
	IHLiQU6cI8Wm4qT3n/JgnLiRoKUwBXOD9dSUJRotmGn46E3MgEDyhDP1l08reiDCd+Tj4o8nyXbWf
	u0NwAPTSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBuiN-0000JP-8p; Tue, 16 Feb 2021 07:24:07 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBuiJ-0000I2-2K
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 07:24:03 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <jbe@pengutronix.de>)
 id 1lBuiG-0003lF-5E; Tue, 16 Feb 2021 08:24:00 +0100
Received: from jbe by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <jbe@pengutronix.de>)
 id 1lBuiF-0002Me-5u; Tue, 16 Feb 2021 08:23:59 +0100
From: Juergen Borleis <jbe@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH v2] fs: ubifs: set s_uuid in super block to support ima/evm
 uuid options
Date: Tue, 16 Feb 2021 08:23:34 +0100
Message-Id: <20210216072334.7575-2-jbe@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216072334.7575-1-jbe@pengutronix.de>
References: <20210216072334.7575-1-jbe@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: jbe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_022403_147717_721682D2 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: linux-kernel@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Steffen Trumtrar <s.trumtrar@pengutronix.de>

This is required to provide uuid based integrity functionality for:
ima_policy (fsuuid option) and the 'evmctl' command ('--uuid' option).

Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Co-developed-by: Juergen Borleis <jbe@pengutronix.de>
Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 fs/ubifs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 138b9426c6c1..a8383ca39a47 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2230,6 +2230,8 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 		goto out_umount;
 	}
 
+	import_uuid(&sb->s_uuid, c->uuid);
+
 	mutex_unlock(&c->umount_mutex);
 	return 0;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
