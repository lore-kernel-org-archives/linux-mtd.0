Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CCFC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 12:08:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72CD8206A1
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 12:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ElEJB826"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72CD8206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/wdnjolhQgMNq0+0DI1gfVHet2xYhZIEP6EVG8krLoI=; b=ElEJB826dpvXAiVpM8f8hlSuG
	xLGYb/0NP0A+AMzxnVUh1F0AiRtU9vgKFZJ0coEsR/2BoLH1hStHBvfkfmn5eJMP3yisXbH+t4gRE
	gqbaRmLkmIpcsBBMWIhPq3IjdQtZDzR3rQn1+XMZNPzc52/fH6VV0y+J8YRovIt2uvY343p8YnZHG
	VLd9udqyZVJh36wChQ8rmm+AwV0fDrNZkGBtUsLZDIbz52vtf/SBVUbsoS4qRVyj/9fuknCjj2uvt
	OUv3j9vMGQrwUeQZAf2ft0rxlLO383DilGbQZXm0a/mjCGRcIb0k0p5G4ol+xTszw6/xiN8u3Xy1z
	nZB1PuVPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jon94-00051m-B7; Fri, 26 Jun 2020 12:07:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jomXe-0003fh-EQ
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 11:29:29 +0000
Received: from torbenh by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <torbenh@linutronix.de>)
 id 1jomXc-0001hG-2P; Fri, 26 Jun 2020 13:29:08 +0200
From: Torben Hohn <torben.hohn@linutronix.de>
To: richard@nod.at
Subject: [PATCH v2 0/4] ubifs: support authentication without hmac
Date: Fri, 26 Jun 2020 13:29:03 +0200
Message-Id: <20200626112907.13201-1-torben.hohn@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625155927.28430-1-torben.hohn@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
MIME-Version: 1.0
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
Cc: bigeasy@linutronix.de, linux-mtd@lists.infradead.org, tglx@linutronix.de,
 s.hauer@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This PQ adds support for ubifs authentication without HMAC,
which obviously only works for a read-only mount.

ubiblock and dm-verity are not supported by u-boot, and
the kernel on the target is loaded by u-boot out of the RFS.

This is a first try to implement this.
It boots fine, and the WARN_ON is not triggered.

I plan to update the docs also, but i would like to have
some positive comments on this before.

Changes since v1:

- apply comments from Sascha an revert the
  ubifs_authicated_(read|write) stuff.
  Use ubifs_assert(c, !c->ro_mount) instead.
- Prevent remount rw, when hmac-less authentication is used
- add missing check, for ro mode, when no auth_key_name is specified.

Torben Hohn (4):
  ubifs: move #include "debug.h" above auth.c
  ubifs: support authentication, for ro mount, when no key is given
  ubifs: sprinkle ubifs_assert(c, !c->ro_mount) in hmac auth
  ubifs: prevent remounting rw when no hmac key was given

 fs/ubifs/auth.c    | 62 +++++++++++++++++++++++++++++++++++++++++++++-
 fs/ubifs/gc.c      |  1 +
 fs/ubifs/journal.c |  8 ++++++
 fs/ubifs/replay.c  |  1 +
 fs/ubifs/sb.c      |  5 ++++
 fs/ubifs/super.c   | 28 ++++++++++++++++++++-
 fs/ubifs/ubifs.h   | 12 ++++++++-
 7 files changed, 114 insertions(+), 3 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
