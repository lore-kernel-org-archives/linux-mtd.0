Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E73BC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jan 2022 08:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Aytrf92w0TxJNXrXaAV7ZMR5DJlV1G/pgVwbgdG/Txo=; b=bcmEfh59bRbgDE
	PnRI+iygUB0rfiQTpppOBNdrFErIwqAT+tTuznG056bgip2tOLGjxpYA72STohMK93o69CplTm2/W
	oszqh9e8Lg3BDK5Fk69FQKI7TbzBQhfIU+30Fepgs4HhQgrsyVJ/DTR3IGFfsEehUA1WWYVl7uVPh
	E3z7t8i53zEcaHZwta3v3EVfxG2Anb3/UKjezdIQNQ95+T/4eQqhHwaTrl05M2+sAK0m7K/xWy7/w
	ZkyTEO3OjJdoqvtzTI96WA5PnpldzWSGmtFGUlHb5Brmfzvv2q1KDeIe7pEJ9Hz8V2FfDiSRLfA6h
	PDfs1vKoVjzJ/jVwWhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7C7Q-00FEb7-0G; Tue, 11 Jan 2022 08:03:00 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7C7N-00FEa1-2I
 for linux-mtd@lists.infradead.org; Tue, 11 Jan 2022 08:02:58 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C3C03614E2CB;
 Tue, 11 Jan 2022 09:02:55 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id wfkZJKRbZZQs; Tue, 11 Jan 2022 09:02:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 62121614E2CF;
 Tue, 11 Jan 2022 09:02:55 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ixt6GZdbcyyU; Tue, 11 Jan 2022 09:02:55 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 392BC614E2CB;
 Tue, 11 Jan 2022 09:02:55 +0100 (CET)
Date: Tue, 11 Jan 2022 09:02:55 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1617448966.248428.1641888175120.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] JFFS2, UBI and UBIFS changes for 5.17
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Index: fyrxjW5e9rHUHWYPDWEjg37yKpfbtw==
Thread-Topic: JFFS2, UBI and UBIFS changes for 5.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_000257_300726_44885F06 
X-CRM114-Status: UNSURE (   7.45  )
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

The following changes since commit a7904a538933c525096ca2ccde1e60d0ee62c08e:

  Linux 5.16-rc6 (2021-12-19 14:14:33 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.17-rc1

for you to fetch changes up to aa39cc675799bc92da153af9a13d6f969c348e82:

  jffs2: GC deadlock reading a page that is used in jffs2_write_begin() (2021-12-23 22:33:41 +0100)

----------------------------------------------------------------
This pull request contains the following changes for JFFS2, UBI and UBIFS:

JFFS2:
- Fix for a deadlock in jffs2_write_begin()

UBI:
- Fixes in comments

UBIFS:
- Expose error counters in sysfs
- Many bugfixes found by Hulk Robot and others

----------------------------------------------------------------
Alexander Dahl (1):
      ubifs: Fix spelling mistakes

Baokun Li (3):
      ubifs: fix slab-out-of-bounds in ubifs_change_lp
      ubifs: fix double return leb in ubifs_garbage_collect
      ubifs: read-only if LEB may always be taken in ubifs_garbage_collect

Cai Huoqing (1):
      ubifs: Make use of the helper macro kthread_run()

Dan Carpenter (1):
      ubifs: fix snprintf() length check

Kai Song (1):
      ubi: Fix a mistake in comment

Kyeong Yoo (1):
      jffs2: GC deadlock reading a page that is used in jffs2_write_begin()

Petr Cvachoucek (1):
      ubifs: Error path in ubifs_remount_rw() seems to wrongly free write buffers

Stefan Schaeckeler (2):
      ubifs: Export filesystem error counters
      ubifs: Document sysfs nodes

 Documentation/ABI/testing/sysfs-fs-ubifs |  35 +++++++
 MAINTAINERS                              |   1 +
 drivers/mtd/ubi/debug.c                  |   2 +-
 fs/jffs2/file.c                          |  40 +++++---
 fs/ubifs/Makefile                        |   2 +-
 fs/ubifs/dir.c                           |   4 +-
 fs/ubifs/gc.c                            |  19 +++-
 fs/ubifs/io.c                            |  21 +++++
 fs/ubifs/replay.c                        |   2 +-
 fs/ubifs/super.c                         |  23 +++--
 fs/ubifs/sysfs.c                         | 153 +++++++++++++++++++++++++++++++
 fs/ubifs/ubifs.h                         |  35 +++++++
 12 files changed, 309 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-fs-ubifs
 create mode 100644 fs/ubifs/sysfs.c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
