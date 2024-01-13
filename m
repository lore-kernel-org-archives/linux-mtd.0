Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3937C4707B
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Jan 2024 20:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vtfYZR8FmRAOKTKVM5L6BCiEQJB8ZesXPOxOx8xRVuQ=; b=A97WqzwqvYxmtQ
	2E1AXb5rH9LFIo6mCvNmL+nDvsjVutUoYMgOiyPmU8E3qF7C7pvPWzCJUagE+7C8uX8BsvdQqDOKT
	0j0KIFtTJE8Oz0kEGl9coWfa0WVoyBFb4QiNo9ijrKQ2/lqgPW3MBpf3cKxNkcLqLHlh2tZirluRm
	lwMrnEM/xn5918eES203j9Rz7GhHVvpxisA404APPjYFYIvgWyTF5fE/CFb1NHhyv2Z2MjoweSU0K
	3Kq9kZV4ei5kW7I8gDLZ2LCd2InRIMci+6QanWp7VvL9WkpwuBCmaINge+lHasahCGwx0l2fSWNlQ
	0f3OT57PgbvsNODUbGHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOkm4-005fM0-2I;
	Sat, 13 Jan 2024 20:38:36 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOkm0-005fKO-36
	for linux-mtd@lists.infradead.org;
	Sat, 13 Jan 2024 20:38:34 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C353B6343B29;
	Sat, 13 Jan 2024 21:38:21 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id M1Ys3QVfrw38; Sat, 13 Jan 2024 21:38:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5C91E63434F8;
	Sat, 13 Jan 2024 21:38:21 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Y4Fg9X_IlY7t; Sat, 13 Jan 2024 21:38:21 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 363A664103FF;
	Sat, 13 Jan 2024 21:38:21 +0100 (CET)
Date: Sat, 13 Jan 2024 21:38:21 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1338470076.231558.1705178301103.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI and UBIFS updates for v6.8-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: sjTu+G2rpOo2O3CccI1h9x6trSQ5MA==
Thread-Topic: UBI and UBIFS updates for v6.8-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_123833_168252_B1675F4A 
X-CRM114-Status: UNSURE (   6.34  )
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

The following changes since commit 861deac3b092f37b2c5e6871732f3e11486f7082:

  Linux 6.7-rc7 (2023-12-23 16:25:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.8-rc1

for you to fetch changes up to adbf4c4954e33e623897058a617c583d65a177f6:

  ubi: block: fix memleak in ubiblock_create() (2024-01-06 23:52:51 +0100)

----------------------------------------------------------------
This pull request contains updates for UBI and UBIFS:

UBI:
	- Use in-tree fault injection framework and add new injection types
	- Fix for a memory leak in the block driver

UBIFS:
	- kernel-doc fixes
	- Various minor fixes

----------------------------------------------------------------
Eric Biggers (1):
      ubifs: use crypto_shash_tfm_digest() in ubifs_hmac_wkm()

Li Nan (1):
      ubi: block: fix memleak in ubiblock_create()

Randy Dunlap (2):
      ubifs: auth.c: fix kernel-doc function prototype warning
      ubifs: fix kernel-doc warnings

Sascha Hauer (1):
      ubifs: describe function parameters

ZhaoLong Wang (5):
      ubi: Use the fault injection framework to enhance the fault injection capability
      ubi: Split io_failures into write_failure and erase_failure
      ubi: Add six fault injection type for testing
      ubi: Reserve sufficient buffer length for the input mask
      mtd: Add several functions to the fail_function list

Zhihao Cheng (2):
      ubifs: Check @c->dirty_[n|p]n_cnt and @c->nroot state under @c->lp_mutex
      ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path

 drivers/mtd/mtdcore.c   |   5 +
 drivers/mtd/ubi/Kconfig |   9 ++
 drivers/mtd/ubi/block.c |   2 +-
 drivers/mtd/ubi/debug.c | 108 +++++++++++++++--
 drivers/mtd/ubi/debug.h | 304 ++++++++++++++++++++++++++++++++++++++++++++----
 drivers/mtd/ubi/io.c    |  86 +++++++++++++-
 drivers/mtd/ubi/ubi.h   |  45 ++++---
 fs/ubifs/auth.c         |  21 +---
 fs/ubifs/commit.c       |  13 ++-
 fs/ubifs/dir.c          |   2 +
 fs/ubifs/file.c         |  30 +++--
 fs/ubifs/replay.c       |   2 +
 12 files changed, 539 insertions(+), 88 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
