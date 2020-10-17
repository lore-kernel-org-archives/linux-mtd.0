Return-Path: <SRS0=9jYX=DY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C393C433E7
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2020 19:38:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B289D207EA
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2020 19:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i5JdQnhF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B289D207EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OrWR7sBhjBne7KULF0Emgn1ghSxlf9s6T68QXbvSKZM=; b=i5JdQnhFeyQbIUuNFft2GmfADh
	bjayehQVuRUedgFKnolqeA2APeR6AcqUoiKrRluzV9obR6TPRT9gGVcmp+sq7TNzOdbiiInWPt82R
	IZho31m5GphDKVrMAsW9xCahw5y8/UNqhPJRWXxVlngG8IAHAF219ITgp+ndxCjt4lBNOTlVy+QUF
	mtE3V8k/b8HUSvvXfV8+Q6pc5BI0ND8yGGSrZBfdLl/LeTxC4AWqeDjFsroog88E+K8hh3gW3vY7P
	V6um8021BQ86ptLP6f0fH0JSRlKjTlGK4CXWrIpAmcUChsWJThWw42IqasWmrCHCedNqHCC+VtA1Y
	NUG2T2wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTs1e-0007BA-Vz; Sat, 17 Oct 2020 19:37:59 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTs1a-0007A2-7W
 for linux-mtd@lists.infradead.org; Sat, 17 Oct 2020 19:37:55 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2D2BB60D08E2;
 Sat, 17 Oct 2020 21:37:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Eip9PB_mMbxU; Sat, 17 Oct 2020 21:37:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id BD75960CEF32;
 Sat, 17 Oct 2020 21:37:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id arRzhrWI9mlK; Sat, 17 Oct 2020 21:37:40 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 955DE60D08E2;
 Sat, 17 Oct 2020 21:37:40 +0200 (CEST)
Date: Sat, 17 Oct 2020 21:37:40 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <725261806.204163.1602963460565.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBIFS updates for 5.10
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Index: h11JVjUYgazpIXZdDEKxuvhAbDCKPQ==
Thread-Topic: UBIFS updates for 5.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_153754_418079_6987340F 
X-CRM114-Status: UNSURE (   7.71  )
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

The following changes since commit f4d51dffc6c01a9e94650d95ce0104964f8ae822:

  Linux 5.9-rc4 (2020-09-06 17:11:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.10-rc1

for you to fetch changes up to e2a05cc7f8229e150243cdae40f2af9021d67a4a:

  ubifs: mount_ubifs: Release authentication resource in error handling path (2020-10-11 22:05:50 +0200)

----------------------------------------------------------------
This pull request contains changes for UBIFS

- Kernel-doc fixes
- Fixes for memory leaks in authentication option parsing

----------------------------------------------------------------
Wang Hai (4):
      ubifs: Fix 'hash' kernel-doc warning in auth.c
      ubifs: Fix some kernel-doc warnings in gc.c
      ubifs: Fix some kernel-doc warnings in replay.c
      ubifs: Fix some kernel-doc warnings in tnc.c

Zhihao Cheng (3):
      ubifs: Fix a memleak after dumping authentication mount options
      ubifs: Don't parse authentication mount options in remount process
      ubifs: mount_ubifs: Release authentication resource in error handling path

 fs/ubifs/auth.c   |  2 +-
 fs/ubifs/gc.c     |  4 ----
 fs/ubifs/replay.c |  2 --
 fs/ubifs/super.c  | 44 ++++++++++++++++++++++++++++++++------------
 fs/ubifs/tnc.c    |  3 +--
 5 files changed, 34 insertions(+), 21 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
