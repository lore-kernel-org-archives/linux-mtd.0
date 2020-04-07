Return-Path: <SRS0=nDBX=5X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE5EC2BB1D
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Apr 2020 12:38:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3140020719
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Apr 2020 12:38:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bLbHB8rs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3140020719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0vnBXFsdFnWAiQ0i1QWgVqhvHov69J8gjlsF5CORGBU=; b=bLbHB8rskECqLU
	ljc4KSG/mdNZ1xfIxW++lDpTHEaNPrmtsMlnkD1xIXdyQTOL06gcmv/+w3OG1DvDGjTiLVJJWScrI
	IWemJhWNGtbkRlhZFFvKN47AgUMMi/mlL5QZxMhAO2wbrK031PprJ1ScUGEzqA7J42riqXnUlj0uz
	HmL4UlcaflHSStxRbQiSv1Wqe1jSIycS5WssTQ21Crjzn7vy+GFnDn7ITF4h2R2Y0wxIJXiYuNUkJ
	xYbseVJZhs+Vl89xBE/W0KBoBYWVEutlt3hSZAfJ6s0YlzrbMiMA1DTgRnR6e0eG9HcKTBC57egTe
	ix76p7eUmNLBDnkLgLYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLnUd-0007D9-Rb; Tue, 07 Apr 2020 12:38:15 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLnUY-0007Ac-TE
 for linux-mtd@lists.infradead.org; Tue, 07 Apr 2020 12:38:12 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id AE750607BD9A;
 Tue,  7 Apr 2020 14:38:01 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mfUTYiUMQWeO; Tue,  7 Apr 2020 14:38:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4DF6C607BDBD;
 Tue,  7 Apr 2020 14:38:01 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bQr49hM-qh4C; Tue,  7 Apr 2020 14:38:01 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 30DC2607BD9A;
 Tue,  7 Apr 2020 14:38:01 +0200 (CEST)
Date: Tue, 7 Apr 2020 14:38:01 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <793490269.91815.1586263081165.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI/UBIFS fixes for v5.7-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Index: VK/uz/K9Ve0lIe+2IoztTTPv430b3g==
Thread-Topic: UBI/UBIFS fixes for v5.7-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_053811_086347_91C7FD95 
X-CRM114-Status: UNSURE (   7.64  )
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

The following changes since commit 16fbf79b0f83bc752cee8589279f1ebfe57b3b6e:

  Linux 5.6-rc7 (2020-03-22 18:31:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.7-rc1

for you to fetch changes up to 3676f32a98cd6ed4481c21bceb8b4829d4b6d1cf:

  ubi: ubi-media.h: Replace zero-length array with flexible-array member (2020-03-30 23:02:37 +0200)

----------------------------------------------------------------
This pull request contains fixes for UBI and UBIFS:

- Fix for memory leaks around UBIFS orphan handling
- Fix for memory leaks around UBI fastmap
- Remove zero-length array from ubi-media.h
- Fix for TNC lookup in UBIFS orphan code

----------------------------------------------------------------
Gustavo A. R. Silva (1):
      ubi: ubi-media.h: Replace zero-length array with flexible-array member

Hou Tao (2):
      ubi: fastmap: Free unused fastmap anchor peb during detach
      ubi: fastmap: Only produce the initial anchor PEB when fastmap is used

Liu Song (1):
      ubifs: Fix out-of-bounds memory access caused by abnormal value of node_len

Richard Weinberger (1):
      ubifs: Fix ubifs_tnc_lookup() usage in do_kill_orphans()

Zhihao Cheng (2):
      ubifs: ubifs_jnl_write_inode: Fix a memory leak bug
      ubifs: ubifs_add_orphan: Fix a memory leak bug

 drivers/mtd/ubi/fastmap-wl.c | 15 +++++++++++++--
 drivers/mtd/ubi/ubi-media.h  |  2 +-
 drivers/mtd/ubi/wl.c         |  3 ++-
 fs/ubifs/io.c                | 16 ++++++++++++++--
 fs/ubifs/journal.c           |  1 +
 fs/ubifs/orphan.c            | 13 +++++++++----
 6 files changed, 40 insertions(+), 10 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
