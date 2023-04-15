Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73585C77B73
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Apr 2023 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dqNBgDeBtcuJ5g9eihFz91xteSoezWJpZTi90H5vhZU=; b=Y45/n4Y6lTh8IJ
	2DFyR/lCeAy5CfTSvDtxX0IdCXGuAEaKgL7FCQM+qe/pKITNqzrS1dEIT+R641LYCjYMY8La/KPbL
	e5yU20V/E9xegtSiv8GBQ3Y/CbYVnAibZc+/r/eeCKW756G6sXEGX4cMh1QM1rDK2Ar4iY2ceeO8d
	Ut5rdIurkdHGrKFzIExfnwfHRn0PY1Y6bE78+V25RDCNMSwQt1sy1ZxHt3Oo/oW46ElishQxFuBSY
	musymJS0NqiBOzaWqQvAP7oDqDFpkKrBIhTEM6QjLxEQOyXk+lLWOpRL/HlWOjGXXhSxHoZADZUxp
	gscZZZ3q4Hv+iL5vO1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnkZR-00Carg-19;
	Sat, 15 Apr 2023 18:24:21 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnkZN-00Caq9-3D
	for linux-mtd@lists.infradead.org;
	Sat, 15 Apr 2023 18:24:19 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EF9F0622623A;
	Sat, 15 Apr 2023 20:24:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id eleR2Tx-TXKj; Sat, 15 Apr 2023 20:24:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A7A9063CC171;
	Sat, 15 Apr 2023 20:24:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7nutnz1XVOKJ; Sat, 15 Apr 2023 20:24:06 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 842B6622623A;
	Sat, 15 Apr 2023 20:24:06 +0200 (CEST)
Date: Sat, 15 Apr 2023 20:24:06 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1571141363.69401.1681583046301.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] UBI fixes for 6.3-rc7
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: v8nQqJi8tbszwXdmGlenVhUJklBsvA==
Thread-Topic: UBI fixes for 6.3-rc7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_112418_205279_0CE7FA78 
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

The following changes since commit 0988a0ea791999ebbf95693f2676381825b05033:

  Merge tag 'for-v6.3-part2' of git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply (2023-03-03 16:33:28 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.3-rc7

for you to fetch changes up to 1e020e1b96afdecd20680b5b5be2a6ffc3d27628:

  ubi: Fix failure attaching when vid_hdr offset equals to (sub)page size (2023-03-29 23:32:57 +0200)

----------------------------------------------------------------
This pull request contains the following bug fixes for UBI and UBIFS:

- Fix for a stable patch: Fix failure attaching when vid_hdr offset equals to (sub)page size
- Fix for a deadlock in UBI's worker thread

----------------------------------------------------------------
ZhaoLong Wang (1):
      ubi: Fix deadlock caused by recursively holding work_sem

Zhihao Cheng (1):
      ubi: Fix failure attaching when vid_hdr offset equals to (sub)page size

 drivers/mtd/ubi/build.c | 21 +++++++++++++++------
 drivers/mtd/ubi/wl.c    |  4 ++--
 2 files changed, 17 insertions(+), 8 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
