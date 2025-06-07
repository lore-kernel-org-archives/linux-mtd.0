Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC60C5B543
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Jun 2025 06:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PHawKkK9TCLaWsQttt7a21jaIxYsc74YgSNG0dQnjXs=; b=byIzXKrOP3ODIW
	nHmyCXNy3KTdKUwsGA2RyTnIx1BrD67Kwbawlmd0quuOOgK5A54oozdRQ8OqUdlZltvKZjEGYA+Xe
	Uvca8NqEcKMrdSOKRdwBUsZwG0N3qXres172nj7UvW5G94lSWVrYeGuv7P17Md7orWLhfOZ4rRgfF
	GefpmUJFj53H4fcECBarOBF98wNrI46YhbXBlb6zsRZSZZkh+NCb5tku1MSa2D7ReOahGVpD9isBE
	kovPLrful/lpRQ83mwRNHThrAYkUxNNxDTJ/Ya6CKDBbaqejKj0FD8wdri+aq89AODq8vZftq2xeh
	FJXiSnMX3FUsaKhslqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNmb9-00000001MXJ-0qgH;
	Sat, 07 Jun 2025 06:00:07 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNmb6-00000001MWK-19jC
	for linux-mtd@lists.infradead.org;
	Sat, 07 Jun 2025 06:00:05 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 26749298565;
	Sat,  7 Jun 2025 07:59:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id azAygTOnLH8o; Sat,  7 Jun 2025 07:59:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C748A298566;
	Sat,  7 Jun 2025 07:59:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id D7REw3I2mWVN; Sat,  7 Jun 2025 07:59:51 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id A4254298565;
	Sat,  7 Jun 2025 07:59:51 +0200 (CEST)
Date: Sat, 7 Jun 2025 07:59:51 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1612150437.134340417.1749275991560.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] JFFS2 and UBIFS fixes for v6.16-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF139 (Linux)/8.8.12_GA_3809)
Thread-Index: 6RWfHAlZCt5fxVFhT6XPyoY6x8qpSQ==
Thread-Topic: JFFS2 and UBIFS fixes for v6.16-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_230004_494353_B4B6FD4D 
X-CRM114-Status: UNSURE (   4.04  )
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

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.16-rc1

for you to fetch changes up to 2b6d96503255a3ed676cd70f8368870c6d6a25c6:

  jffs2: check jffs2_prealloc_raw_node_refs() result in few other places (2025-05-22 20:54:38 +0200)

----------------------------------------------------------------
This pull request contains the following fixes for JFFS2 and UBIFS:

JFFS2:
	- Correctly check return code of jffs2_prealloc_raw_node_refs()

UBIFS:
	- Spelling fixes

----------------------------------------------------------------
Artem Sadovnikov (1):
      jffs2: check that raw node were preallocated before writing summary

Fedor Pchelkin (1):
      jffs2: check jffs2_prealloc_raw_node_refs() result in few other places

Thorsten Blum (1):
      ubifs: Fix grammar in error message

 fs/jffs2/erase.c   | 4 +++-
 fs/jffs2/scan.c    | 4 +++-
 fs/jffs2/summary.c | 7 ++++++-
 fs/ubifs/journal.c | 2 +-
 4 files changed, 13 insertions(+), 4 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
