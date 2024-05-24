Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0CAC25B74
	for <linux-mtd@archiver.kernel.org>; Fri, 24 May 2024 21:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eE9fPkOyisY0lEtkmwQg7SWuueApau2wfJeshGDluQc=; b=yw8E6rYQBN3Ir8
	VUMry6MlUONmkPwKf0SYQZkZqQEDFZEDM19beAFOaA3+y4Q5LXNzFye/AQjrYWOLx6Ptixz7DnQip
	ggugN87fNQgiR82eWH4f7HYbw9Qn4alzcaYhRnOXpRImLaaSCqaBpxhxznwTRAr7Y6yPtxM09fwc2
	91m9EVEzKIvU7yP0rVO2EtcTJgYOKz3JLeo+TlPtwiMlf7aP6ROuDISS7yP5oK+0lVrSZPFjM+V69
	8ivrJEetd2AWdB+tnW7BWIOa1WSFtbTjFtGlq0vpnvbqPM5KUvHnvwwUr0UWRTH4xg3ovhAvpsmCA
	ArjmpAs2FnPGbYbYXH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAcQo-00000009vAi-3pFf;
	Fri, 24 May 2024 21:26:30 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAcQk-00000009v8i-3PIe
	for linux-mtd@lists.infradead.org;
	Fri, 24 May 2024 21:26:28 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 191566195FCC;
	Fri, 24 May 2024 23:26:18 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id BseJo4ok6U60; Fri, 24 May 2024 23:26:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D381462348A5;
	Fri, 24 May 2024 23:26:17 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wGqtls3FURQ2; Fri, 24 May 2024 23:26:17 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id BD35B6195FCC;
	Fri, 24 May 2024 23:26:17 +0200 (CEST)
Date: Fri, 24 May 2024 23:26:17 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1964508139.144819.1716585977753.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] JFFS2 changes for v6.10-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: nPIz3nA82xmA2mDanngZbL3Wwp7WGA==
Thread-Topic: JFFS2 changes for v6.10-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_142627_031084_375F18B4 
X-CRM114-Status: UNSURE (   4.74  )
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

The following changes since commit e67572cd2204894179d89bd7b984072f19313b03:

  Linux 6.9-rc6 (2024-04-28 13:47:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/jffs2-for-linus-6.10-rc1

for you to fetch changes up to af9a8730ddb6a4b2edd779ccc0aceb994d616830:

  jffs2: Fix potential illegal address access in jffs2_free_inode (2024-05-12 22:57:04 +0200)

----------------------------------------------------------------
This pull request contains the following changes for JFFS2:

- Fix Illegal memory access jffs2_free_inode()
- Kernel-doc fixes
- Print symbolic error names

----------------------------------------------------------------
Christian Heusel (1):
      jffs2: print symbolic error name instead of error code

Kunwu Chan (1):
      jffs2: Simplify the allocation of slab caches

Randy Dunlap (1):
      jffs2: nodemgmt: fix kernel-doc comments

Wang Yong (1):
      jffs2: Fix potential illegal address access in jffs2_free_inode

 fs/jffs2/background.c |  4 ++--
 fs/jffs2/malloc.c     | 32 ++++++++------------------------
 fs/jffs2/nodemgmt.c   | 24 +++++++++++++++---------
 fs/jffs2/super.c      |  1 +
 4 files changed, 26 insertions(+), 35 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
