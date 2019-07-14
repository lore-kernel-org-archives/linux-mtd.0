Return-Path: <SRS0=NuVS=VL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1D6C73C66
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Jul 2019 19:02:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26A2D20C01
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Jul 2019 19:02:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LjEcILC3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26A2D20C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9UJhbVDlmTfA34ZIaP9DxtoCgYDHIXWZ8Rj8zEyJFso=; b=LjEcILC3qvoRoa
	+BPG5p80Vbc93mUoNKOJ3lUqhNSw1BCb9DdM/m4gv0kN5nnEK1CzjbJZk/pW/in2zfTYg79agb0R/
	KyUowVTCHLmGmwgaetWHQnK8PBBGFQmNJyLIQbHjWWpX4kh2+7jjXexZs1yfBY5DhJoar99w8x+Bu
	5gl09tTbh1xq1ApQv+JWC5NbBzz6W85Y1WnQMLER07M6+PnBbVTIVBmt4/wriBFwOVH9ZHgA6eG7G
	RAhSH2iVxAOTOlXImj0NiQnl/2eJ9kD2fpfSteoHxkjtjjlDwJ7Am77U5JhDy5sMBIHAj+J0Ylsva
	SJw330xdYSFLEOyJYSaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hmjlG-000321-Cf; Sun, 14 Jul 2019 19:02:14 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hmjlD-00031R-Bt
 for linux-mtd@lists.infradead.org; Sun, 14 Jul 2019 19:02:12 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3545A6074CD5;
 Sun, 14 Jul 2019 21:02:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0CY1gMs9aDPi; Sun, 14 Jul 2019 21:02:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E126A6074CF8;
 Sun, 14 Jul 2019 21:02:09 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4uf6qr9J4IfK; Sun, 14 Jul 2019 21:02:09 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id BE16E6074CD5;
 Sun, 14 Jul 2019 21:02:09 +0200 (CEST)
Date: Sun, 14 Jul 2019 21:02:09 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <1267151613.38686.1563130929727.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBIFS changes for 5.3-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Index: lukcal4QcUCgWCO+vvtjPRX4XXI9kw==
Thread-Topic: UBIFS changes for 5.3-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190714_120211_553709_1852B3A2 
X-CRM114-Status: UNSURE (   7.63  )
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

The following changes since commit 6fbc7275c7a9ba97877050335f290341a1fd8dbf:

  Linux 5.2-rc7 (2019-06-30 11:25:36 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/upstream-5.3-rc1

for you to fetch changes up to 8009ce956c3d28022af6b122e50213ad830fc902:

  ubifs: Don't leak orphans on memory during commit (2019-07-08 20:01:34 +0200)

Please note there is a merge conflict between commits
334d581528b9 ("vfs: Convert ubifs to use the new mount API") and
eeabb9866e4c ("ubifs: Add support for zstd compression.")

For zstd we add a new mount parameter.
In case of doubt I'll happily review your merge resolution.

----------------------------------------------------------------
This pull request contains the following changes for UBIFS

- Support for zstd compression
- Support for offline signed filesystems
- Various fixes for regressions

----------------------------------------------------------------
Liu Song (3):
      ubifs: Simplify redundant code
      ubifs: Fix typo of output in get_cs_sqnum
      ubifs: remove unnecessary check in ubifs_log_start_commit

Michele Dionisio (1):
      ubifs: Add support for zstd compression.

Richard Weinberger (3):
      ubifs: Correctly use tnc_next() in search_dh_cookie()
      ubifs: Check link count of inodes when killing orphans.
      ubifs: Don't leak orphans on memory during commit

Sascha Hauer (1):
      ubifs: support offline signed images

 fs/ubifs/Kconfig       | 13 ++++++-
 fs/ubifs/auth.c        | 86 +++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/compress.c    | 27 ++++++++++++++-
 fs/ubifs/log.c         |  5 +--
 fs/ubifs/master.c      | 53 ++++++++++++++++++++++++----
 fs/ubifs/orphan.c      | 94 +++++++++++++++++++++++++++++++-------------------
 fs/ubifs/recovery.c    |  2 +-
 fs/ubifs/sb.c          | 52 ++++++++++++++--------------
 fs/ubifs/super.c       | 46 ++++++++++++++++++------
 fs/ubifs/tnc.c         | 16 ++++++---
 fs/ubifs/ubifs-media.h | 30 +++++++++++++++-
 fs/ubifs/ubifs.h       |  6 ++--
 12 files changed, 338 insertions(+), 92 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
