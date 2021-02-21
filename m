Return-Path: <SRS0=BfTn=HX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FE2C433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Feb 2021 20:03:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4EF064E76
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Feb 2021 20:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4EF064E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hh9WQjQw72TrKjn8UEgejKx3YRgjuIxgxNZm9gr/ilI=; b=oBKm2OcJLcytaocyQ4dSg8BaOs
	h7OiAxuSwdDm3IZWIwsAr1NLpof/L7kG35VihGwrwK1K4XSg6Aif2Km97bLlbjUmW2sLVDG5QxO8d
	uEc4V/arh/xU4pOkF6LUyJXVsoG60MUlFX9ESyI+tVLG0Cr/oXqyoXHHEf9i68/DwNl1ix2PlPg9u
	asdAvzbNTc6QPuX5nqCZLmh1KNssvwVbQ92YSeFZBTm3Pb/6rFYHOSrAwJL4VO5S4I8tK0/krHjz+
	sGYbrHd2J+CUPhX3BF2GcNrAzBrXJbeFxJ7AEcKXcbd6jponmxARycHx8yLSAx/lfMVj939l4KJ8u
	LCisew1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDuvu-0006R1-JK; Sun, 21 Feb 2021 20:02:22 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDuvn-0006Q7-M4
 for linux-mtd@lists.infradead.org; Sun, 21 Feb 2021 20:02:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DECBB60A3582;
 Sun, 21 Feb 2021 21:02:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id CxQ-5D8vKsRy; Sun, 21 Feb 2021 21:02:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9B40660A3587;
 Sun, 21 Feb 2021 21:02:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jVmISwEKIoao; Sun, 21 Feb 2021 21:02:14 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8270B60A3582;
 Sun, 21 Feb 2021 21:02:14 +0100 (CET)
Date: Sun, 21 Feb 2021 21:02:14 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <2079847149.14899.1613937734472.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] JFFS2/UBIFS and UBI changes for 5.12
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Index: TrGKkieyaZn28el165n92fOXdblJ5w==
Thread-Topic: JFFS2/UBIFS and UBI changes for 5.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210221_150216_390641_933FF519 
X-CRM114-Status: UNSURE (   7.22  )
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

The following changes since commit 92bf22614b21a2706f4993b278017e437f7785b3:

  Linux 5.11-rc7 (2021-02-07 13:57:38 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.12-rc1

for you to fetch changes up to 42119dbe571eb419dae99b81dd20fa42f47464e1:

  ubifs: Fix error return code in alloc_wbufs() (2021-02-13 22:58:44 +0100)

----------------------------------------------------------------
This pull request contains changes (actually just fixes) for UBIFS

JFFS2:
- Fix for use-after-free in jffs2_sum_write_data()
- Fix for out-of-bounds access in jffs2_zlib_compress()

UBI:
- Remove dead/useless code

UBIFS:
- Fix for a memory leak in ubifs_init_authentication()
- Fix for high stack usage
- Fix for a off-by-one error in xattrs code

----------------------------------------------------------------
Arnd Bergmann (1):
      ubifs: replay: Fix high stack usage, again

Dinghao Liu (1):
      ubifs: Fix memleak in ubifs_init_authentication

Jubin Zhong (1):
      ubi: remove dead code in validate_vid_hdr()

Sascha Hauer (1):
      ubifs: Fix off-by-one error

Tom Rix (1):
      jffs2: fix use after free in jffs2_sum_write_data()

Wang ShaoBo (1):
      ubifs: Fix error return code in alloc_wbufs()

Yang Yang (1):
      jffs2: check the validity of dstlen in jffs2_zlib_compress()

Zheng Yongjun (1):
      ubi: eba: Delete useless kfree code

 drivers/mtd/ubi/eba.c  | 1 -
 drivers/mtd/ubi/io.c   | 7 +------
 fs/jffs2/compr_rtime.c | 3 +++
 fs/jffs2/summary.c     | 3 +++
 fs/ubifs/auth.c        | 2 +-
 fs/ubifs/journal.c     | 2 +-
 fs/ubifs/replay.c      | 4 +++-
 fs/ubifs/super.c       | 4 +++-
 fs/ubifs/xattr.c       | 2 +-
 9 files changed, 16 insertions(+), 12 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
