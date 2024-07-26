Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737CCC3DA4A
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2024 20:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I9WQZhJRL23oDyu0M6uffRq4RD+j+R3BQ96hQ0+VM/M=; b=dUvRHgECBbcUC/
	tS1EbMQ1kaB6OPzp7QYvjBCi3xEeW3Z3EDxv7c+oSOrahTgj1odutBmv2UK/cA+Gw5IolOxX9WAb8
	RmNCR66rUOrNSaFe1DakDymnSBMHY4CPaiXofgKJIWaZf1qgh6hakfuvOlqQX4rQfnZ+S87FmP0A/
	Cm7rNyvm5k6aYl2NPem6Y7k22R+Oi5tksa6uKfeJhx9kKKwxz/2ngQqzJ1LMEXPyb75pRFtsYiR7+
	Hvdv/gnlT54YoWWQPpLE6CkYK6Od8tCykgs5vSZQ4geBdDrWCiVMKoC2uDZpTQhTI4xdZwmXgsWZj
	ZSU/rRIE654/sdJqfmjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXS1T-00000004zUS-36VT;
	Fri, 26 Jul 2024 20:58:43 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXS1Q-00000004zTh-1K7q
	for linux-mtd@lists.infradead.org;
	Fri, 26 Jul 2024 20:58:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2D5856196A41;
	Fri, 26 Jul 2024 22:58:35 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id IFwWMynNwQVd; Fri, 26 Jul 2024 22:58:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C29656196A48;
	Fri, 26 Jul 2024 22:58:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id u4xtvh4r-Tnn; Fri, 26 Jul 2024 22:58:34 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9AC946196A41;
	Fri, 26 Jul 2024 22:58:34 +0200 (CEST)
Date: Fri, 26 Jul 2024 22:58:34 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <896050924.123729.1722027514568.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI and UBIFS updates for v6.11-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: gbXApdcmd37b2LMIgXNqGyOlPMFBCg==
Thread-Topic: UBI and UBIFS updates for v6.11-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_135840_683214_56AA241C 
X-CRM114-Status: UNSURE (   7.33  )
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

The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826:

  Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.11-rc1

for you to fetch changes up to 054fd15984454f031611d6c63675fc578aad0cb1:

  ubifs: add check for crypto_shash_tfm_digest (2024-07-12 22:01:09 +0200)

----------------------------------------------------------------
This pull request contains updates (actually, just fixes) for UBI and UBIFS:

- Many fixes for power-cut issues by Zhihao Cheng
- Another ubiblock error path fix
- Misc fixes all over the place

----------------------------------------------------------------
Arnd Bergmann (1):
      mtd: ubi: avoid expensive do_div() on 32-bit machines

Ben Hutchings (1):
      mtd: ubi: Restore missing cleanup on ubi_init() failure path

Chen Ni (1):
      ubifs: add check for crypto_shash_tfm_digest

Fedor Pchelkin (1):
      ubi: eba: properly rollback inside self_check_eba

Jeff Johnson (1):
      ubifs: fix kernel-doc warnings

Li Nan (1):
      ubi: block: fix null-pointer-dereference in ubiblock_create()

Ricardo B. Marliere (1):
      mtd: ubi: make ubi_class constant

ZhaoLong Wang (1):
      ubifs: correct UBIFS_DFS_DIR_LEN macro definition and improve code clarity

Zhihao Cheng (10):
      ubifs: Fix unattached xattr inode if powercut happens after deleting
      ubifs: Don't add xattr inode into orphan area
      Revert "ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path"
      ubifs: Remove insert_dead_orphan from replaying orphan process
      ubifs: Fix adding orphan entry twice for the same inode
      ubifs: Move ui->data initialization after initializing security
      ubifs: Fix space leak when powercut happens in linking tmpfile
      ubifs: Fix unattached inode when powercut happens in creating
      ubifs: dbg_orphan_check: Fix missed key type checking
      ubifs: Fix inconsistent inode size when powercut happens during appendant writing

 drivers/mtd/ubi/block.c |   7 ++-
 drivers/mtd/ubi/build.c |   7 ++-
 drivers/mtd/ubi/debug.c |   4 +-
 drivers/mtd/ubi/eba.c   |   3 +-
 drivers/mtd/ubi/nvmem.c |   6 +-
 drivers/mtd/ubi/ubi.h   |   4 +-
 fs/ubifs/compress.c     |   2 +
 fs/ubifs/debug.c        |   4 +-
 fs/ubifs/debug.h        |   7 ++-
 fs/ubifs/dir.c          |  91 ++++++++++++++++------------
 fs/ubifs/file.c         |   2 +-
 fs/ubifs/find.c         |   8 +--
 fs/ubifs/journal.c      |  16 +++--
 fs/ubifs/lprops.c       |   2 +-
 fs/ubifs/lpt.c          |   1 +
 fs/ubifs/master.c       |   5 +-
 fs/ubifs/orphan.c       | 155 ++++++++----------------------------------------
 fs/ubifs/replay.c       |   1 +
 fs/ubifs/sysfs.c        |   6 +-
 fs/ubifs/ubifs.h        |  14 +----
 fs/ubifs/xattr.c        |   2 +-
 21 files changed, 134 insertions(+), 213 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
