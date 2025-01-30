Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39470C0218A
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jan 2025 22:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GRpDyFDsewaEhqQmpVjFkLKNladnncBESzZbfelZLRs=; b=k2pY16Ezy783eI
	3YTehLgvgik155Z+TnwQqOT9T84UyvCFC9apRgAV1N54P5/DR5uWVDg1oMkL9vy+pNeCVKpEVSLDS
	2xJoGeraysw6mJvtqO5GgOeAcQL4L78u3gFCL7ei/igxdlOOieTJ9WZVTvHrmYzddOBNRT9DDCtqA
	Z+6ysZAkb9jc3bbxvxL1HoK5J/3jK71wSY1b+HASlxgXPpDA4/+8DgvuBWe/+y/HHiJUAxDwQyK7w
	coRTODK0eiBa07D4a8i92DA6omaSLODv5lVfDXBBqnNSGPvX3hw+DqZGOFFF7b+SoDYRQ69b1Fw6z
	OyqxsF+r6wUMcEe+7VnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdclF-00000009hLu-0FF4;
	Thu, 30 Jan 2025 22:11:45 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdclB-00000009hKr-2lG5
	for linux-mtd@lists.infradead.org;
	Thu, 30 Jan 2025 22:11:43 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7B4D12D9984;
	Thu, 30 Jan 2025 23:11:36 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id awUR3DSUSUg4; Thu, 30 Jan 2025 23:11:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 217512D99A1;
	Thu, 30 Jan 2025 23:11:36 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pWl294mpN631; Thu, 30 Jan 2025 23:11:36 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0BEC02D9984;
	Thu, 30 Jan 2025 23:11:36 +0100 (CET)
Date: Thu, 30 Jan 2025 23:11:36 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <98948953.304331862.1738275096021.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI and UBIFS changes for v6.14
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133 (Linux)/8.8.12_GA_3809)
Thread-Index: V3EMhxVU1TKFaFfcr9R/3kCFiwG74w==
Thread-Topic: UBI and UBIFS changes for v6.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_141141_846673_4CDD3958 
X-CRM114-Status: UNSURE (   5.11  )
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

The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.14-rc1

for you to fetch changes up to 69146a8c893f734cefaac0af6f917f894f29077e:

  ubi: ubi_get_ec_info: Fix compiling error 'cast specifies array type' (2025-01-20 09:09:24 +0100)

----------------------------------------------------------------
This pull request contains updates for UBI and UBIFS:

UBI:
- New interface to dump detailed erase counters
- Fixes around wear-leveling

UBIFS:
- Minor cleanups
- Fix for TNC dumping code

----------------------------------------------------------------
Denis Arefev (1):
      ubi: Add a check for ubi_num

Pintu Kumar (2):
      ubifs: dump_lpt_leb: remove return at end of void function
      ubifs: ubifs_dump_leb: remove return from end of void function

Rickard Andersson (2):
      ubi: Expose interface for detailed erase counters
      ubi: Implement ioctl for detailed erase counters

Zhihao Cheng (2):
      ubi: Revert "ubi: wl: Close down wear-leveling before nand is suspended"
      ubi: ubi_get_ec_info: Fix compiling error 'cast specifies array type'

pangliyuan (1):
      ubifs: skip dumping tnc tree when zroot is null

 drivers/mtd/ubi/build.c     |  2 +-
 drivers/mtd/ubi/cdev.c      | 70 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/ubi.h       |  2 --
 drivers/mtd/ubi/wl.c        | 21 --------------
 fs/ubifs/debug.c            | 23 ++++++++-------
 fs/ubifs/lpt_commit.c       |  1 -
 include/uapi/mtd/ubi-user.h | 33 +++++++++++++++++++++
 7 files changed, 117 insertions(+), 35 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
