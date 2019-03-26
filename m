Return-Path: <SRS0=gzro=R5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B01C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 07:53:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4382220828
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 07:53:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YnIkDqIW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4382220828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aZXkx95rx1pye6Gvi6cXGf8c3Il6oDe+0OJvEaR4mvs=; b=YnIkDqIWYGG7oL
	Hfm1N1HH4CE/H6FasInPDiIunqMVduxbtgx7BNrEz7WCeiCdtotNt+RbVOiF6IR3Xhj9qtEMXIi9X
	rQT3M0n3QB6yVeU884txngKQlcUi8ppN4amBxpevfuFHxkeLL7jDqKjOqeLw2/d0jyt+YL7WN4tUE
	6qyWk49Hu+2WwTbiTSCnQtKJVESbUFkYSG7/w2eGOooMG7tZfURD7+8gWYC5pR58EJlOA5tqAkxiS
	Z4gNcIBrRr93SSLdJmxq2Y91KOL03uo2z8x7EDtSe9W/q//+GFCLTSYLIDuOtpLBjrmCj6JmYRE1i
	KuaFFO3LvX+pGzFWbtnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8gtQ-00037Z-4u; Tue, 26 Mar 2019 07:53:08 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8gtA-0002m1-7s
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2019 07:52:53 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1h8gss-0004MT-Ic; Tue, 26 Mar 2019 08:52:34 +0100
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1h8gsr-00038P-Mn; Tue, 26 Mar 2019 08:52:33 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] ubifs: Get rid of some ifdefs
Date: Tue, 26 Mar 2019 08:52:30 +0100
Message-Id: <20190326075232.11717-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_005252_436396_DAA246FD 
X-CRM114-Status: GOOD (  10.06  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series gets rid of some ifdefs in the UBFIS code. fscrypt folks are
on Cc because I introduce a static inline wrapper for setting the
super_block.s_cop ops so that filesystems do not have to add a
#ifdef CONFIG_FS_ENCRYPTION around setting the ops. I can do this as an
extra patch if that's desired.

Sascha

Sascha Hauer (2):
  ubifs: Remove #ifdef around CONFIG_FS_ENCRYPTION
  ubifs: Remove ifdefs around CONFIG_UBIFS_ATIME_SUPPORT

 fs/ubifs/dir.c          |  2 --
 fs/ubifs/file.c         | 16 +++++++---------
 fs/ubifs/ioctl.c        | 11 +----------
 fs/ubifs/sb.c           |  7 ++++---
 fs/ubifs/super.c        | 20 +++++++++-----------
 fs/ubifs/ubifs.h        |  2 --
 include/linux/fscrypt.h | 11 +++++++++++
 7 files changed, 32 insertions(+), 37 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
