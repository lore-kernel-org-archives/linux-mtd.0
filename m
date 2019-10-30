Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E251CA9EC5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 14:52:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48D5120856
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 14:52:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LPWxl26U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48D5120856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hqh1Xc2pw5jYgFxUbOTXHANbXR6Y9sBUiB7fy+tWhmw=; b=LPWxl26Uhbksob
	030nh1E1ei9NDwr3NS7+zNzHrTW0ZiHERX9jkFUkHibeaMgAp+PEv0xDd3FQVeTRASDi1a/rIc2Wh
	fUilfGT3fnAXtuF0wnkW8BMbyCYFtFyvNcqDB18XAt2wE1J0AiHSZMitE72TRJyEEnUl7Qa7YzttY
	cBwNhosCn2xVufT5gZNfFORXJpCs9I5Rh/V4IcgT2rhJuPTZsCUkj7/9Ogb8iJfhtoMy92pCLSIjO
	JWhCr3LAU4I6HRxrTT442d6mu0e1Jnx+5BECvt0krEUKbsj75Rf0JX1UJ2o7/CBMyupbr2nNLuVR4
	dCgSWCiBpo+WiS/X1VkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPpKb-0005FK-2F; Wed, 30 Oct 2019 14:52:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPpKY-0005EL-1P
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 14:52:15 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iPpKU-0008AY-31; Wed, 30 Oct 2019 15:52:10 +0100
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iPpKL-0000wl-W2; Wed, 30 Oct 2019 15:52:01 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Revert "ubifs: Fix memory leak bug in alloc_ubifs_info()
 error path"
Date: Wed, 30 Oct 2019 15:52:01 +0100
Message-Id: <20191030145201.3597-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_075214_079140_F0E94CF9 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: Richard Weinberger <richard@nod.at>, Wenwen Wang <wenwen@cs.uga.edu>,
 Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This reverts commit 9163e0184bd7d5f779934d34581843f699ad2ffd.

There actually is no memory leak. After an sget() the ubifs info
structure will be freed in the kill_sb hook. Doing it again here
leads to a double free.
As this is non obvious leave a comment where c is freed.

Fixes: 9163e0184bd7 ("ubifs: Fix memory leak bug in alloc_ubifs_info() error path")
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/super.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 7d4547e5202d..ce1515d693a0 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2267,10 +2267,9 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
 		}
 	} else {
 		err = ubifs_fill_super(sb, data, flags & SB_SILENT ? 1 : 0);
-		if (err) {
-			kfree(c);
+		if (err)
+			/* c will be freed in ubifs_fs_type.kill_sb */
 			goto out_deact;
-		}
 		/* We do not support atime */
 		sb->s_flags |= SB_ACTIVE;
 		if (IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
-- 
2.24.0.rc1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
