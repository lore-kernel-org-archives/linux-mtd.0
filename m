Return-Path: <SRS0=Gzls=3N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E10FC2D0DB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 13:15:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0174206D5
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 13:15:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cyb2RKmF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0174206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fcCiatyMZUGfQGL3DFJmgOCD/VpoNYMxeLOI166lVA=; b=cyb2RKmFuGQIFp
	szatcyPqJVU0sI7JKik3FFQF4zfFdTjuGbB8wF5QjtKy/V6zHXRf/rtHCG+dSBN3Fu8u2G5+0swms
	JMUgqwusDWvin9u24SDrR0++xwubegYJY6i4JsGTA4qxkDDK15B33oELKVMhnkT1I0s0wNUm1fDp/
	7sY3E8ZaLE8VxgzcuPPg36us4ytzVpmg9L4blxKSDlxc/zCeXCKpcrg5RafhK4s0RLJRA+0aIlBN0
	9N9ZbxCBj4+hfYD2k1RYVzLEWZPc+SKjhSfDgvBe+Mi7jtWA+MBVzNO+b9KORHFHsVDGJn9Ly+ovP
	F1ggHAmtxShKduWL6e5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuynh-0007cU-S0; Fri, 24 Jan 2020 13:15:05 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuymN-0006Bi-8O
 for linux-mtd@lists.infradead.org; Fri, 24 Jan 2020 13:13:44 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iuym5-0003aI-Rf; Fri, 24 Jan 2020 14:13:25 +0100
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iuym5-0006ZM-3X; Fri, 24 Jan 2020 14:13:25 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 5/8] ubifs: Factor out ubifs_set_feature_flag()
Date: Fri, 24 Jan 2020 14:13:20 +0100
Message-Id: <20200124131323.23885-6-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124131323.23885-1-s.hauer@pengutronix.de>
References: <20200124131323.23885-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_051343_429212_C551299A 
X-CRM114-Status: GOOD (  11.81  )
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
index 2b7c04bf8983..628b9adec865 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -926,28 +926,34 @@ int ubifs_fixup_free_space(struct ubifs_info *c)
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
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
