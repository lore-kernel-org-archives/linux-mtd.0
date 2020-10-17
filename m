Return-Path: <SRS0=9jYX=DY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9001C433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2020 19:38:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65EBB207EA
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2020 19:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oaTSKFwq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65EBB207EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4vB4QK1Y/kcGUVjIcJw9TFRomNz/j7Da0duJGpRGmE8=; b=oaTSKFwqie2OKZBsfK+Q/hHLDM
	xEZgHQDz3XMIxA7pKmSCJav3JFn7ssORrmPiexYX2gC4y32hVLLJrOj2bPgJmpYznJDRQWSWxFhlz
	dwgrhLR8NWBgIprNru7G/olRFaDEyPWpAdJpLIPGramKgV8VvseWR88DvznLvNLf7FO2OQv9JUaBP
	WzB4RFMLUgPwAzR3paL5inX3DUdrXM39357ozoU1xzFF5Ui7UVoUPuT1nxJPEZqRp92SSWivPtFjB
	f1ER2ePaJ7NtoH+Esh8ZTeAlUg93CdZBG+8qqGOuzY6Riz+tBlGR5kvsgTs+5vwontkW4WQXKWnFJ
	iqHUkUew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTs1h-0007BM-30; Sat, 17 Oct 2020 19:38:01 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTs1a-0007AQ-6x
 for linux-mtd@lists.infradead.org; Sat, 17 Oct 2020 19:37:55 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 56E2B60CEF32;
 Sat, 17 Oct 2020 21:37:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id m0kJdn8TDqs2; Sat, 17 Oct 2020 21:37:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 03C7861BD1BE;
 Sat, 17 Oct 2020 21:37:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4dXnLFEmgykj; Sat, 17 Oct 2020 21:37:51 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id E1C9560CEF32;
 Sat, 17 Oct 2020 21:37:51 +0200 (CEST)
Date: Sat, 17 Oct 2020 21:37:51 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <1486301546.204164.1602963471897.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI and UBIFS fixes for 5.10
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Index: jaq7gxmyAA8IX8Qb9elec8UKhS+vww==
Thread-Topic: UBI and UBIFS fixes for 5.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_153754_389196_19D06513 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Linus,

sorry for sending you two UBIFS pull requests.
for-linus-5.10-rc1-part2 is material from my fixes branch, the plan
was sending it before the merge window closes but I got badly interrupted.
Therefore I'm sending it parallel to my regular UBIFS pull request.

The following changes since commit e4c26faa426c17274884f759f708bc9ee22fd59a:

  Merge tag 'usb-5.9-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb (2020-09-13 09:23:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.10-rc1-part2

for you to fetch changes up to 78c7d49f55d8631b67c09f9bfbe8155211a9ea06:

  ubifs: journal: Make sure to not dirty twice for auth nodes (2020-09-29 10:43:05 +0200)

----------------------------------------------------------------
This pull request contains fixes for UBI and UBIFS

UBI:
- Correctly use kthread_should_stop in ubi worker

UBIFS:

- Fixes for memory leaks while iterating directory entries
- Fix for a user triggerable error message
- Fix for a space accounting bug in authenticated mode

----------------------------------------------------------------
Richard Weinberger (1):
      ubifs: journal: Make sure to not dirty twice for auth nodes

Zhihao Cheng (5):
      ubifs: xattr: Fix some potential memory leaks while iterating entries
      ubifs: dent: Fix some potential memory leaks while iterating entries
      ubi: check kthread_should_stop() after the setting of task state
      ubifs: ubifs_jnl_change_xattr: Remove assertion 'nlink > 0' for host inode
      ubifs: setflags: Don't show error message when vfs_ioc_setflags_prepare() fails

 drivers/mtd/ubi/wl.c | 13 +++++++++++++
 fs/ubifs/debug.c     |  1 +
 fs/ubifs/ioctl.c     |  1 -
 fs/ubifs/journal.c   |  7 ++++---
 fs/ubifs/orphan.c    |  2 ++
 fs/ubifs/tnc.c       |  3 +++
 fs/ubifs/xattr.c     |  2 ++
 7 files changed, 25 insertions(+), 4 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
