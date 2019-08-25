Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D26C3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 14:02:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B16C2070B
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 14:02:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B9QStHjY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B16C2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mZfZca7SoTemEUAiAn4NzTSoNDmFr/2zRd7xKyaCFNw=; b=B9QStHjY1Q/HYo
	sWwYWoXbOa4LaIm+9MrbgKHn8SR0ho+8DbTyAjirmfmnAlB2OcD1jJcajedEPCHdfVxiwMy0gXwwO
	IC7T6ZocqYKQgAv8NXtWYPqKj6FENop7F8usxZXEmYzkCHn4SwcsI+7SnZdTuoT1OufnTAlU/hAP+
	3yb0w5VU9KcNlcx1hjrxzcBITGIxjWqaxGhSC1441n+OyyBa2Lq/BNP+mF0Qp3Y8miNwKB+FVn8/o
	UXjnzw+W2B2qIl8EpogxebtPhw359HzXtleAg7NFSgiioOH2gzg4dHX+lid2kbN9yTwkYuUwZUxBp
	W1ptb94UZCMqXnDRXAfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1t5u-0001Xv-6d; Sun, 25 Aug 2019 14:02:10 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1t5q-0001WG-Ah
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 14:02:07 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6C0CC6083139;
 Sun, 25 Aug 2019 16:01:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id tqJfLNQv7xsv; Sun, 25 Aug 2019 16:01:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2B6FB608311C;
 Sun, 25 Aug 2019 16:01:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id h9v8sJCiOh-s; Sun, 25 Aug 2019 16:01:51 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 05E1B6089354;
 Sun, 25 Aug 2019 16:01:50 +0200 (CEST)
Date: Sun, 25 Aug 2019 16:01:50 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <1811413787.73825.1566741710952.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBIFS/JFFS2 fixes for 5.3-rc6
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Index: 1z3uoU3loWp1K/Oo/z0waK5U/6Z3kw==
Thread-Topic: UBIFS/JFFS2 fixes for 5.3-rc6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_070206_519956_3D05F699 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit d1abaeb3be7b5fa6d7a1fbbd2e14e3310005c4c1:

  Linux 5.3-rc5 (2019-08-18 14:31:08 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.3-rc6

for you to fetch changes up to 0af83abbd4a6e36a4b209d8c57c26143e40eeec1:

  ubifs: Limit the number of pages in shrink_liability (2019-08-22 17:25:33 +0200)

----------------------------------------------------------------
This pull request contains the following fixes for UBIFS and JFFS2:

UBIFS:

- Don't block too long in writeback_inodes_sb()
- Fix for a possible overrun of the log head
- Fix double unlock in orphan_delete()

JFFS2:

- Remove C++ style from UAPI header and unbreak picky toolchains

----------------------------------------------------------------
Liu Song (1):
      ubifs: Limit the number of pages in shrink_liability

Masahiro Yamada (1):
      jffs2: Remove C++ style comments from uapi header

Richard Weinberger (2):
      ubifs: Fix double unlock around orphan_delete()
      ubifs: Correctly initialize c->min_log_bytes

 fs/ubifs/budget.c          | 2 +-
 fs/ubifs/orphan.c          | 2 --
 fs/ubifs/super.c           | 4 ++++
 include/uapi/linux/jffs2.h | 5 -----
 4 files changed, 5 insertions(+), 8 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
