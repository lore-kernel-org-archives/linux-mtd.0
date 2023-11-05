Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D132C4332F
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Nov 2023 10:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l4SpVddctLp9cJiQ4Elle68jdNEIHVjInEDlCHmM+dA=; b=jT3+XpYQdm1IZt
	44Kms6F9cnMk8zA1G3VosZKQpy7r1koT9WtihZzHvlD/5H6Pbne1WcGAOzScfp0yjw2wN1AlDe+TZ
	Boz85X3dt0yQzWtEeRdUsM9yyu83Mog6Sr+AkFZlh8W7w7MxkJNNahW7n9k6EBhgpkJ5Ao3ZV5NYN
	QaLeqcO3MDgPTrfM88S8Dpo2RMszG8TdqF5YYuZLpgdF5rZD8vC57kj0y9uB8G2bQRSowy/jmuRIH
	peTKy88HF97tuIUgOV+9xMHhViH9cYmx8NkzBcW1T75Mk9ih0bBDjG1lc1d2BCYC8p4xfJHGSYlUj
	eovMNwW8RtSJtsG48wyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzaPY-00Ej9n-29;
	Sun, 05 Nov 2023 10:31:20 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzaPV-00Ej80-2O
	for linux-mtd@lists.infradead.org;
	Sun, 05 Nov 2023 10:31:19 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 120F96340DF2;
	Sun,  5 Nov 2023 11:31:03 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id fAgA4uaBlOak; Sun,  5 Nov 2023 11:31:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8B9336340E12;
	Sun,  5 Nov 2023 11:31:02 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xjuFIeJljwem; Sun,  5 Nov 2023 11:31:02 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6E6126340DF2;
	Sun,  5 Nov 2023 11:31:02 +0100 (CET)
Date: Sun, 5 Nov 2023 11:31:02 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <15692057.53962.1699180262386.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI and UBIFS Updates for v6.7-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: f1SHfvtc6D/rLNKsb3FlFunId/8Slg==
Thread-Topic: UBI and UBIFS Updates for v6.7-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_023118_158462_07CE271C 
X-CRM114-Status: UNSURE (   6.53  )
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

The following changes since commit 58720809f52779dc0f08e53e54b014209d13eebb:

  Linux 6.6-rc6 (2023-10-15 13:34:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.7-rc1

for you to fetch changes up to 75690493591fe283e4c92a3ba7c4420e9858abdb:

  ubifs: ubifs_link: Fix wrong name len calculating when UBIFS is encrypted (2023-10-28 23:19:08 +0200)

----------------------------------------------------------------
This pull request contains updates for UBI and UBIFS

- UBI Fastmap improvements
- Minor issues found by static analysis bots in both UBI and UBIFS
- Fix for wrong dentry length UBIFS in fscrypt mode

----------------------------------------------------------------
Ferry Meng (1):
      ubifs: Fix missing error code err

Konstantin Meskhidze (1):
      ubifs: fix possible dereference after free

Vincent Whitchurch (1):
      ubifs: Fix memory leak of bud->log_hash

Yang Li (1):
      ubifs: Fix some kernel-doc comments

ZhaoLong Wang (1):
      ubi: block: Fix use-after-free in ubiblock_cleanup

Zhihao Cheng (13):
      ubi: fastmap: Fix missed ec updating after erasing old fastmap data block
      ubi: fastmap: erase_block: Get erase counter from wl_entry rather than flash
      ubi: fastmap: Allocate memory with GFP_NOFS in ubi_update_fastmap
      ubi: Replace erase_block() with sync_erase()
      ubi: fastmap: Use free pebs reserved for bad block handling
      ubi: fastmap: Wait until there are enough free PEBs before filling pools
      ubi: fastmap: Remove unneeded break condition while filling pools
      ubi: fastmap: may_reserve_for_fm: Don't reserve PEB if fm_anchor exists
      ubi: fastmap: Get wl PEB even ec beyonds the 'max' if free PEBs are run out
      ubi: fastmap: Fix lapsed wear leveling for first 64 PEBs
      ubi: fastmap: Add module parameter to control reserving filling pool PEBs
      ubi: fastmap: Add control in 'UBI_IOCATT' ioctl to reserve PEBs for filling pools
      ubifs: ubifs_link: Fix wrong name len calculating when UBIFS is encrypted

 drivers/mtd/ubi/block.c      |   4 +++-
 drivers/mtd/ubi/build.c      |  25 ++++++++++++++++++++++---
 drivers/mtd/ubi/cdev.c       |   3 ++-
 drivers/mtd/ubi/eba.c        |   3 ---
 drivers/mtd/ubi/fastmap-wl.c | 112 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------
 drivers/mtd/ubi/fastmap.c    |  66 +++++++-----------------------------------------------------------
 drivers/mtd/ubi/ubi.h        |  10 ++++++++--
 drivers/mtd/ubi/wl.c         |  48 ++++++++++++++++++++++++++++++------------------
 drivers/mtd/ubi/wl.h         |   6 ++++--
 fs/ubifs/dir.c               |   4 +++-
 fs/ubifs/file.c              |   3 +++
 fs/ubifs/journal.c           |   1 +
 fs/ubifs/super.c             |   5 ++++-
 fs/ubifs/tnc.c               |   1 +
 include/uapi/mtd/ubi-user.h  |   4 +++-
 15 files changed, 179 insertions(+), 116 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
