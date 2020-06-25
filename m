Return-Path: <SRS0=eEdn=AG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80297C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jun 2020 16:01:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4618C20775
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jun 2020 16:01:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TdXD0L61"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4618C20775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mQaLcSOMaw9fLY9aHS7YQwG4+Rnm5qBK4bqk3eu4ENo=; b=TdXD0L613D2hhZoBRN5GmrdMhN
	CCTDBEleW8CoB8wWUQGFpmklD68FkSmmkPu+lezMHxV2TycuDdeBzFwDhphjdiGusfYCsmcEvT9Og
	Q4XTKnrFQIFoU+3xBFcIkmiRq/8M9TKhzMoYLpVoH0cPpV261uRfKnDKWE7Xq/opKcePsXtp1X3U+
	5H/gL8Yo4r8jb/lqvLrcSGA80HWXR4mKuiq4RMBLxI8T97QyqC2nyd1tFIxlrvfNCDcL4Pn+vrJU9
	DTxKHjgpqF6T7muaW/sYjZCYB/r8tnolBKLwIVl8iNgXg8jEIeM11jipCrg1RdTJ4wSXRPmGNT1+G
	hrDdnrrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joUHr-00070t-V2; Thu, 25 Jun 2020 15:59:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joUHl-00070D-MR
 for linux-mtd@lists.infradead.org; Thu, 25 Jun 2020 15:59:34 +0000
Received: from torbenh by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <torbenh@linutronix.de>)
 id 1joUHg-0003ks-Na; Thu, 25 Jun 2020 17:59:28 +0200
From: Torben Hohn <torben.hohn@linutronix.de>
To: richard@nod.at
Subject: [PATCH 0/1] ubifs: support authentication without hmac
Date: Thu, 25 Jun 2020 17:59:26 +0200
Message-Id: <20200625155927.28430-1-torben.hohn@linutronix.de>
X-Mailer: git-send-email 2.20.1
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

This patch adds support for ubifs authentication without HMAC,
which obviously only works for a read-only mount.

ubiblock and dm-verity are not supported by u-boot, and
the kernel on the target is loaded by u-boot out of the RFS.

This is a first try to implement this.
It boots fine, and the WARN_ON is not triggered.

I plan to update the docs also, but i would like to have
some positive comments on this before.


Torben Hohn (1):
  ubifs: support authentication, for ro mount, when no key is given

 fs/ubifs/auth.c    | 69 ++++++++++++++++++++++++++++++++++++++++++----
 fs/ubifs/gc.c      |  2 +-
 fs/ubifs/journal.c | 12 ++++----
 fs/ubifs/lpt.c     |  4 +--
 fs/ubifs/master.c  |  2 +-
 fs/ubifs/replay.c  |  2 +-
 fs/ubifs/sb.c      | 16 +++++++----
 fs/ubifs/super.c   | 21 ++++++++++----
 fs/ubifs/ubifs.h   | 48 +++++++++++++++++++++-----------
 9 files changed, 133 insertions(+), 43 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
