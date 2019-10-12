Return-Path: <SRS0=XqRS=YF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38230C4360C
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Oct 2019 20:29:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3EAA20700
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Oct 2019 20:29:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OeYOTD6U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3EAA20700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qK30X2rdYq6hKwk32lzTLlMU9pEz3jxraKbtbqUuslY=; b=OeYOTD6UtyGdYU
	+xTc/sjX1hMlE7CHskx3t4tiGLJPwIZgQyJk2B99v3ZrBLepeMV+SptXuJ2q1opAp6CYLIrx+f2IQ
	swrGbA0J/raes3PinH04YzgB+DmHgsJhcRCUhjs9exfJ1AaSGNgrF1jqe1kRYHuEzukO6xMNrhYnG
	8YJtkCyN/AFTxNG8YlJRQAleM3OGmIvEyrClwq/fVIvP9zif2fMmZi9gwa7OWIgXMDiAIFuNLejK6
	/Cq9uNppYCd/gfAr6hr+E9Js7HpfOcAA8h502vHUlWCNQleKE+FC2f+6YlYeoHGWzsgtpmNNwC2P2
	YLZB74msY+BAEeewtqiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJO16-000471-Ub; Sat, 12 Oct 2019 20:29:32 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJO13-00045i-5B
 for linux-mtd@lists.infradead.org; Sat, 12 Oct 2019 20:29:30 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 682C4609D2F2;
 Sat, 12 Oct 2019 22:29:17 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id DCpYQgfqV-ok; Sat, 12 Oct 2019 22:29:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1E788609D2F1;
 Sat, 12 Oct 2019 22:29:17 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2rXCj63ki4Po; Sat, 12 Oct 2019 22:29:17 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id E0AAF609D2C6;
 Sat, 12 Oct 2019 22:29:16 +0200 (CEST)
Date: Sat, 12 Oct 2019 22:29:16 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <1615396520.21318.1570912156820.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] mtd: Fixes for v5.4-rc3
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Index: smKon1qr3Q9KM5c1y0Y1Qg5DoWAx3A==
Thread-Topic: Fixes for v5.4-rc3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191012_132929_355925_A3850EB1 
X-CRM114-Status: UNSURE (   6.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Linus,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/fixes-for-5.4-rc3

for you to fetch changes up to df8fed831cbcdce7b283b2d9c1aadadcf8940d05:

  mtd: rawnand: au1550nd: Fix au_read_buf16() prototype (2019-10-07 09:56:36 +0200)

----------------------------------------------------------------
This pull request contains two fixes for MTD:

- spi-nor: Fix for a regression in write_sr()
- rawnand: Regression fix for the au1550nd driver

----------------------------------------------------------------
Paul Burton (1):
      mtd: rawnand: au1550nd: Fix au_read_buf16() prototype

Tudor Ambarus (1):
      mtd: spi-nor: Fix direction of the write_sr() transfer

 drivers/mtd/nand/raw/au1550nd.c | 5 ++---
 drivers/mtd/spi-nor/spi-nor.c   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
