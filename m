Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23993C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 15:17:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBEB9235DD
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 15:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBEB9235DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O6hxRqaNttNu7svmi91ErhWqJncGRw80ryVniFp70tw=; b=2SvWZsPU5jqva/3SoErMloTaI
	5xUXYPrfOICb5+mWsyX701CndoKSIF3Y7v0riUJcoPlCHXQZxfdst1aWhRIVJ5OOab13rIKOIY+Of
	t+WZO+xjj4eQcKa6YTfXYCzxiFIWQqYeiWeZi5FGod1Q6Oc2+uJrtTJNDiDhUIUneIQYDH2RpRRxW
	yuz4G66mmixlveWOnMJD0d40BK8Hg1WEU6TteX2ExLHv+v3WWsZTayo4wWf9CBAyhuXpf2J1hZX8Q
	k5yM2vJpusNCxoveV6HHhExnJM9SVmzdWcPGKst5TxLGWMNZHBWBTri7JT6tPdwudlyxXdwP2Wo+n
	NvsgHIP9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2yAX-0006vE-W5; Fri, 22 Jan 2021 15:16:14 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2yAR-0006sg-5W
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2021 15:16:08 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2yA1-0004Bw-H9; Fri, 22 Jan 2021 16:15:41 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2yA0-0003qx-TQ; Fri, 22 Jan 2021 16:15:40 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 5/8] ubifs: Factor out ubifs_set_feature_flag()
Date: Fri, 22 Jan 2021 16:15:33 +0100
Message-Id: <20210122151536.7982-6-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122151536.7982-1-s.hauer@pengutronix.de>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_101607_286718_D3A68C4C 
X-CRM114-Status: GOOD (  14.64  )
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
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The code setting a feature flag can be reused for upcoming projid
support. Factor out a function to share the code.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/sb.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index c160f718c288..87466836fcfc 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -924,28 +924,34 @@ int ubifs_fixup_free_space(struct ubifs_info *c)
 	return err;
 }
 
-int ubifs_enable_encryption(struct ubifs_info *c)
+static int ubifs_set_feature_flag(struct ubifs_info *c, unsigned int flag)
 {
-	int err;
 	struct ubifs_sb_node *sup = c->sup_node;
 
-	if (!IS_ENABLED(CONFIG_FS_ENCRYPTION))
-		return -EOPNOTSUPP;
-
-	if (c->encrypted)
+	if ((sup->flags & cpu_to_le32(flag)) == cpu_to_le32(flag))
 		return 0;
 
 	if (c->ro_mount || c->ro_media)
 		return -EROFS;
 
 	if (c->fmt_version < 5) {
-		ubifs_err(c, "on-flash format version 5 is needed for encryption");
+		ubifs_err(c, "on-flash format version 5 is needed for feature flags");
 		return -EINVAL;
 	}
 
-	sup->flags |= cpu_to_le32(UBIFS_FLG_ENCRYPTION);
+	sup->flags |= cpu_to_le32(flag);
+
+	return ubifs_write_sb_node(c, sup);
+}
+
+int ubifs_enable_encryption(struct ubifs_info *c)
+{
+	int err;
+
+	if (!IS_ENABLED(CONFIG_FS_ENCRYPTION))
+		return -EOPNOTSUPP;
 
-	err = ubifs_write_sb_node(c, sup);
+	err = ubifs_set_feature_flag(c, UBIFS_FLG_ENCRYPTION);
 	if (!err)
 		c->encrypted = 1;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
