Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CFCC2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 19:07:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7B87206A5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 19:07:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gjv/SBys"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7B87206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sJ4q3HRyO3kMKbRpm4v+4FG8W80cocU8Mq1xVRPbBB8=; b=Gjv/SBysTGfdQfdMmiEH44nKOf
	HqgQJ8lD3ZwCEffTwHHgjZv0CcT8bKcmOq99g3OrsT8+ZMCm9Z72TlPoepqYY5UAQpDXP4TZC5NfW
	JVm/At7yAA7xPhN/Fxn1Rf97tu2/p4hTcHrYZOIjJJqm1K6lwBi2xwyEL/NwfRGR12w+yO0h1C1+O
	ZkQnOLPsc7Dhq51PBokfPFlBax4Pv9FvGVRI0G3j4kjCB+/XU9Vcnc/iiVeqQtFeVYeJw5w1+Fh+m
	RJANwS1lYN2pvPFTMFe4aBRVlilQOWE7vZTW0IPI7EkbGRTUCsvaPQAnY+VnIbV9X4VJfkbV0xdsz
	wYQO1cHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMyTm-0002eP-OJ; Mon, 28 Sep 2020 19:06:30 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMyTk-0002cz-8V
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 19:06:29 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id D95401816FACD;
 Mon, 28 Sep 2020 21:06:24 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id RyaKbBkj8g-T; Mon, 28 Sep 2020 21:06:24 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id C2466gc1w1W9; Mon, 28 Sep 2020 21:06:24 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: journal: Make sure to not dirty twice for auth nodes
Date: Mon, 28 Sep 2020 21:06:12 +0200
Message-Id: <20200928190612.12074-1-richard@nod.at>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_150628_403180_8419C9DE 
X-CRM114-Status: GOOD (  13.57  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Kristof Havasi <havasiefr@gmail.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When removing the last reference of an inode the size of an auth node
is already part of write_len. So we must not call ubifs_add_auth_dirt().
Call it only when needed.

Cc: <stable@vger.kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Kristof Havasi <havasiefr@gmail.com>
Fixes: 6a98bc4614de ("ubifs: Add authentication nodes to journal")
Reported-by: Kristof Havasi <havasiefr@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index cb1fa0c37322..091c2ad8f211 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -938,8 +938,6 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 					  inode->i_ino);
 	release_head(c, BASEHD);
 
-	ubifs_add_auth_dirt(c, lnum);
-
 	if (last_reference) {
 		err = ubifs_tnc_remove_ino(c, inode->i_ino);
 		if (err)
@@ -949,6 +947,8 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 	} else {
 		union ubifs_key key;
 
+		ubifs_add_auth_dirt(c, lnum);
+
 		ino_key_init(c, &key, inode->i_ino);
 		err = ubifs_tnc_add(c, &key, lnum, offs, ilen, hash);
 	}
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
