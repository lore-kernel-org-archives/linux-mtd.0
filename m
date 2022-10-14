Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A445C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Oct 2022 21:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t0GJLD+bVbQf5eBmoGy7FOGMSW5khAlBRGmVCoU8Yd8=; b=gPkBbotWbGl3+r
	qDx1YWWEscCv0l00aAqWvbEdC9hg1aq3HiUaFJzFra8ow7t6Gsyat1caISLfgG/KCahpoHpd9ovsw
	q4EpJPkZhTD6eTXVBvIwHCUqP0rK2G3llNmQiaZ7CgSFQ07Tf7gIBwN0AWXbS6KtZyD3YS8++T1IO
	25X+R3Z869S22QFaXwPZ40LA+MEpGe6qUPd9PrkzrVR3NpYNSES6TRsblZ3O9jTg66XSgV8vDUcCE
	ksaIOAIAdCuHCsIkRBVydSfG7uCFaT6bU28jHm6bV//44sVX0y7iEIr2Gre/sxRZPMsWmLUuUfU63
	XYcsIVEVgKlCELfPFu3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojS3f-00FySl-CX; Fri, 14 Oct 2022 21:17:31 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojS3a-00FyOY-2L
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2022 21:17:28 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id AA050642172D;
	Fri, 14 Oct 2022 23:17:13 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8P4rzkYpvGek; Fri, 14 Oct 2022 23:17:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 55CDA642172E;
	Fri, 14 Oct 2022 23:17:13 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3J7kKppmRros; Fri, 14 Oct 2022 23:17:13 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 37D7B642172D;
	Fri, 14 Oct 2022 23:17:13 +0200 (CEST)
Date: Fri, 14 Oct 2022 23:17:13 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1135185122.30714.1665782233107.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI and UBIFS updates for 6.1-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: FAGGPxqkkN+sUwYBp4ISK0M1p6fJaQ==
Thread-Topic: UBI and UBIFS updates for 6.1-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_141726_437580_D7B7EAC8 
X-CRM114-Status: UNSURE (   6.71  )
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

The following changes since commit 521a547ced6477c54b4b0cc206000406c221b4d6:

  Linux 6.0-rc6 (2022-09-18 13:44:14 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-6.1-rc1

for you to fetch changes up to 669d204469c46e91d99da24914130f78277a71d3:

  ubi: fastmap: Add fastmap control support for 'UBI_IOCATT' ioctl (2022-09-21 18:29:18 +0200)

----------------------------------------------------------------
This pull request contains updates for UBI and UBIFS

UBI:
	- Use bitmap API to allocate bitmaps
	- New attach mode, disable_fm, to attach without fastmap
        - Fixes for various typos in comments

UBIFS:
	- Fix for a deadlock when setting xattrs for encrypted file
	- Fix for an assertion failures when truncating encrypted files
        - Fixes for various typos in comments

----------------------------------------------------------------
Christophe JAILLET (1):
      ubi: fastmap: Use the bitmap API to allocate bitmaps

Jason Wang (1):
      ubi: ubi-media.h: Fix comment typo

Jiang Jian (1):
      mtd: ubi: drop unexpected word 'a' in comments

Jilin Yuan (1):
      ubi: Fix repeated words in comments

Julia Lawall (1):
      ubi: block: Fix typos in comments

Li zeming (1):
      ubi: block: Remove in vain semicolon

Yang Li (1):
      ubifs: Fix ubifs_check_dir_empty() kernel-doc comment

Zhang Jiaming (1):
      ubi: fastmap: Fix typo in comments

ZhaoLong Wang (1):
      ubifs: Fix UBIFS ro fail due to truncate in the encrypted directory

Zhihao Cheng (2):
      ubifs: Fix AA deadlock when setting xattr for encrypted file
      ubi: fastmap: Add fastmap control support for 'UBI_IOCATT' ioctl

 drivers/mtd/ubi/block.c     |  4 ++--
 drivers/mtd/ubi/build.c     | 14 ++++++++++----
 drivers/mtd/ubi/cdev.c      |  4 ++--
 drivers/mtd/ubi/eba.c       |  2 +-
 drivers/mtd/ubi/fastmap.c   | 10 ++++------
 drivers/mtd/ubi/io.c        |  2 +-
 drivers/mtd/ubi/ubi-media.h |  2 +-
 drivers/mtd/ubi/ubi.h       |  9 +++++----
 drivers/mtd/ubi/vmt.c       |  4 ++--
 drivers/mtd/ubi/wl.c        |  8 ++++----
 fs/ubifs/crypto.c           | 11 +++++++++++
 fs/ubifs/dir.c              | 27 +++++++++++++++------------
 fs/ubifs/journal.c          | 28 +++++++++++++++++-----------
 fs/ubifs/ubifs.h            |  2 +-
 fs/ubifs/xattr.c            |  2 +-
 include/uapi/mtd/ubi-user.h |  8 +++++++-
 16 files changed, 84 insertions(+), 53 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
