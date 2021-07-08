Return-Path: <SRS0=ilRB=MA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B2EC07E96
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jul 2021 21:11:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE12261878
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jul 2021 21:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE12261878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WqPLK0+TXxdfRdOmcnpKVnEX5eZ44it0q+s0MNYa+IU=; b=2dQbMrNj6b6B5O
	DTvQCwx7iCImTHOJILcjIY1ladjfFsb/bh4DF1Mj9sYUG4tAXo02zEfCukb9goQ0r8EJ5CEcD/tuI
	5JaHUIxbP0l1Em1LNQS5XXc0E0Qu5wVoE9mQOCwQtqhaXWphNFdKUUsypL+yOMrP0P10nBWE6cZVE
	BSteVjdqRuAXaZk7LfvNdRAwirsIUyuibMusQ/4rSwXUKDvP42nFn813WKWDqjcQU5n0D8ankvcid
	S/hiL07zPk4HmEWDW/tRZxLVT2on1WESr8qD2Kk6P5QzUnYFF8/WZp60lwiRDa34BMEcNep/QGKxE
	AF6EAQPoR+MWuD5uFcVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1bHn-000In5-M9; Thu, 08 Jul 2021 21:10:19 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1bHY-000Ikd-EJ
 for linux-mtd@lists.infradead.org; Thu, 08 Jul 2021 21:10:06 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 53F6561BC7D4;
 Thu,  8 Jul 2021 23:10:01 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id N0AvF8LrfPmE; Thu,  8 Jul 2021 23:10:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 03FC4625DE15;
 Thu,  8 Jul 2021 23:10:01 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4FXJT9thVQqR; Thu,  8 Jul 2021 23:10:00 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id E40C261BC7D4;
 Thu,  8 Jul 2021 23:10:00 +0200 (CEST)
Date: Thu, 8 Jul 2021 23:10:00 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <245242026.4934.1625778600867.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBIFS changes for 5.14
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Index: gccdygIs/rP4tTBt/0WbKQ2TL40HOw==
Thread-Topic: UBIFS changes for 5.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_141004_683117_71BD7442 
X-CRM114-Status: UNSURE (   5.63  )
X-CRM114-Notice: Please train this message.
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

Linus,

The following changes since commit 009c9aa5be652675a06d5211e1640e02bbb1c33d:

  Linux 5.13-rc6 (2021-06-13 14:43:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.14-rc1

for you to fetch changes up to a801fcfeef96702fa3f9b22ad56c5eb1989d9221:

  ubifs: Set/Clear I_LINKABLE under i_lock for whiteout inode (2021-06-22 09:21:39 +0200)

----------------------------------------------------------------
This pull request contains the following changes for UBIFS:

- Fix for a race xattr list and modification
- Various minor fixes (spelling, return codes, ...)

----------------------------------------------------------------
Dan Carpenter (1):
      ubifs: fix snprintf() checking

Zhen Lei (1):
      ubifs: journal: Fix error return code in ubifs_jnl_write_inode()

Zheng Yongjun (1):
      ubifs: Fix spelling mistakes

Zhihao Cheng (3):
      ubifs: Fix races between xattr_{set|get} and listxattr operations
      ubifs: Remove ui_mutex in ubifs_xattr_get and change_xattr
      ubifs: Set/Clear I_LINKABLE under i_lock for whiteout inode

 drivers/mtd/ubi/debug.c |  2 +-
 fs/ubifs/debug.c        |  2 +-
 fs/ubifs/dir.c          |  7 +++++++
 fs/ubifs/journal.c      |  3 ++-
 fs/ubifs/master.c       |  2 +-
 fs/ubifs/replay.c       |  2 +-
 fs/ubifs/super.c        |  3 ++-
 fs/ubifs/tnc_commit.c   |  2 +-
 fs/ubifs/ubifs.h        |  4 +++-
 fs/ubifs/xattr.c        | 48 +++++++++++++++++++++++++++++++++---------------
 10 files changed, 52 insertions(+), 23 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
