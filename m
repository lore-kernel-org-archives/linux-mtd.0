Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B183DC433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 10:48:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2750961985
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 10:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2750961985
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lVcpM/mxWD/S3Gl3EApaLxaJRYvyCjgmJjaKjksYO3Y=; b=DFzPmyVfAqhKepmlniIR1XvmQ
	udI5j07+TqeE7n//OdNn/UAQX49ezmT1Bs0IZpD/A3zbpAPab0cBesI3CDcgxrwxvdiORHTz1qkoS
	gIn+jSVccUnU/lj9pDtkXwkmvLnGRdnFg+1W4M41JgVHtBBZFenco03RdIbeo3cyw1vgS6mn7Hznb
	CaBF4RF+4b5a6u5CtXJoev/EeQHOArsi64J5MrSK1pFtw7EJNOLoNql4+/I9zg1D9W66/73527Qbq
	LfahqHS9USEyuGIH2iEdgTu0+hkSJAWRklgEyg3w202kkVftpy4Y+xW1WEDgtoIS38Sn89UlQo3X4
	0YxfSoxcQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRBuU-003SFI-My; Tue, 30 Mar 2021 10:47:46 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBrB-003RGd-Bo
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 10:45:04 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1lRBqu-0006SL-NU; Tue, 30 Mar 2021 12:44:04 +0200
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1lRBqt-0006On-Rr; Tue, 30 Mar 2021 12:44:03 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: kernel@pengutronix.de, Jan Kara <jack@suse.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 4/7] ubifs: Factor out ubifs_set_feature_flag()
Date: Tue, 30 Mar 2021 12:43:48 +0200
Message-Id: <20210330104351.21328-5-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330104351.21328-1-s.hauer@pengutronix.de>
References: <20210330104351.21328-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_114421_704854_0B72B1DF 
X-CRM114-Status: GOOD (  13.26  )
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
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
