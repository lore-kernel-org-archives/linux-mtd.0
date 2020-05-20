Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22931C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 19:49:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEC11207D8
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 19:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jeYtBMzO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEC11207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YuH1dcWAPzWr+p9t7UkjHdOMpml3iVtzBbgJDkri/cU=; b=jeYtBMzONaTepg
	H7aQJ4iN0C5qYQ4szGkyNC4Ij3q7lswwvEEj1RdfXABmL0DC6NajrRrVPGf2QJKlHN8eb3im8MRpx
	9VpUkNVK/m1vrXyrggiVA7QZkwF5a3ATaLJbhNlDctcd8yml+sPCO7OUZ7aaUSdG0VcgXyYcmIaAp
	+804oi9KliZQ6tETxnURcC9EppkPAvWzyZ2MjSmBlGaJSYfZUsMbrnLhJ7w/nBPFas1+3KJHFD5R/
	Zh0sXa0UUj2u8+1AJb+nYOVHKSJvFes0egtJtwtFkX+K8P6NHBx6SnMHTCOp1Ponx0KMmq5CUuo1m
	PnMCjN29UmQ51zF23PbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbUiw-0003K0-0l; Wed, 20 May 2020 19:49:54 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbUiq-0003Ej-Od
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 19:49:50 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2A69E609D2FA;
 Wed, 20 May 2020 21:49:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id B_oiLUskh1rM; Wed, 20 May 2020 21:49:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DB8C0609D2CC;
 Wed, 20 May 2020 21:49:39 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HB01SdQYLnl2; Wed, 20 May 2020 21:49:39 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id BEA53623A7C5;
 Wed, 20 May 2020 21:49:39 +0200 (CEST)
Date: Wed, 20 May 2020 21:49:39 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <1270319593.249344.1590004179760.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] MTD fixes for 5.7 final
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Index: zzLpiIOUyD076SaYCqVKbuiKIraQlg==
Thread-Topic: MTD fixes for 5.7 final
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_124948_943158_433D79C8 
X-CRM114-Status: UNSURE (   7.89  )
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Linus,

The following changes since commit 9b1f2cbdb6d3062c468d3f9b579501f0f7ce330b:

  Merge tag 'clk-fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux (2020-05-17 12:33:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/fixes-for-5.7-rc6

for you to fetch changes up to f3a6a6c5e0f5a303fd8ec84ea33c0da5869d715f:

  mtd:rawnand: brcmnand: Fix PM resume crash (2020-05-19 10:24:49 +0200)

----------------------------------------------------------------
This pull request contains the following bug fixes for MTD:

- Fix a PM regression in brcmnand driver
- Propagate ECC information correctly on SPI-NAND
- Make sure no MTD name is used multiple time in nvmem

----------------------------------------------------------------
Kamal Dasu (1):
      mtd:rawnand: brcmnand: Fix PM resume crash

Miquel Raynal (1):
      mtd: spinand: Propagate ECC information to the MTD structure

Ricardo Ribalda Delgado (1):
      mtd: Fix mtd not registered due to nvmem name collision

 drivers/mtd/mtdcore.c                    | 2 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 3 +--
 drivers/mtd/nand/spi/core.c              | 4 ++++
 3 files changed, 6 insertions(+), 3 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
