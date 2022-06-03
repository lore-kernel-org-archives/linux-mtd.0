Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2529AC43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 12:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lQ61+oGWsQFmknTEZgGcUWbNGMTMl10J9m8lSsyRB6Q=; b=ZYjd34rTfXT1da
	CFkBuSOEPy7xW5JHsdD+h1BvzOn+S8ZDhE4kQ/JwzAeMukJcN9dW2yY3BbPpyCiNcJO3IifptD8uB
	C2tJ1jD8wUU8of3G18ZQSMxLRLosWODjoS5yGWy7/PAaULWXF+1igqAQL8/0QQ8qqy6f/29APq3u7
	GS5wB0LiQy/d6lrW/GzL4VGgTr40jCxuYpopNfJAcBJfry0pwWIwqgKVeS4pTQpbyV+9ZAJ4Ybd5N
	6/CsMCc+4J47c9+a6STbtR+oRFKq/EJP/QGelua/sEfBJq55dAOxDaS9WzoL5+9G5iUDem68yhxGE
	vRxtQ0ULHlAAEaOeGsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx6i0-007TsY-CY; Fri, 03 Jun 2022 12:47:20 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx6hw-007TqX-7y
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 12:47:19 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 51AF4609B3C1;
	Fri,  3 Jun 2022 14:47:09 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id CPGJgO34VG6Q; Fri,  3 Jun 2022 14:47:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C2DD5609B3C2;
	Fri,  3 Jun 2022 14:47:08 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PlKBWE2AaC1S; Fri,  3 Jun 2022 14:47:08 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 994E7609B3C1;
	Fri,  3 Jun 2022 14:47:08 +0200 (CEST)
Date: Fri, 3 Jun 2022 14:47:08 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <735024820.130152.1654260428562.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] JFFS2, UBI and UBIFS updates for v5.19-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: 1D42N45nL6ShMgyGtxZkZMfsOi2J+w==
Thread-Topic: JFFS2, UBI and UBIFS updates for v5.19-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_054716_483571_AE4252B3 
X-CRM114-Status: UNSURE (   6.17  )
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

The following changes since commit 42226c989789d8da4af1de0c31070c96726d990c:

  Linux 5.18-rc7 (2022-05-15 18:08:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.19-rc1

for you to fetch changes up to 8c03a1c21d72210f81cb369cc528e3fde4b45411:

  ubi: ubi_create_volume: Fix use-after-free when volume creation failed (2022-05-27 16:49:41 +0200)

----------------------------------------------------------------
This pull request contains fixes for JFFS2, UBI and UBIFS

JFFS2:
        - Fixes for a memory leak

UBI:
        - Fixes for fastmap (UAF, high CPU usage)

UBIFS:
        - Minor cleanups

----------------------------------------------------------------
Baokun Li (1):
      jffs2: fix memory leak in jffs2_do_fill_super

Haowen Bai (2):
      jffs2: Use kzalloc instead of kmalloc/memset
      ubifs: Use NULL instead of using plain integer as pointer

Minghao Chi (1):
      ubifs: Simplify the return expression of run_gc()

Zhihao Cheng (3):
      ubi: fastmap: Fix high cpu usage of ubi_bgt by making sure wl_pool not empty
      ubi: fastmap: Check wl_pool for free peb before wear leveling
      ubi: ubi_create_volume: Fix use-after-free when volume creation failed

 drivers/mtd/ubi/fastmap-wl.c | 121 +++++++++++++++++++++++++++++++++++--------
 drivers/mtd/ubi/fastmap.c    |  11 ----
 drivers/mtd/ubi/ubi.h        |   4 +-
 drivers/mtd/ubi/vmt.c        |   1 -
 drivers/mtd/ubi/wl.c         |  33 ++++++++----
 drivers/mtd/ubi/wl.h         |   2 +
 fs/jffs2/erase.c             |   6 +--
 fs/jffs2/fs.c                |   1 +
 fs/ubifs/budget.c            |   7 +--
 fs/ubifs/xattr.c             |   2 +-
 10 files changed, 129 insertions(+), 59 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
