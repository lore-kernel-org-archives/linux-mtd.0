Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE30C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 08:54:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE49F20651
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 08:54:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gFtekQY9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE49F20651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QAaMoMaTCmk3o5pMzZRnYcMiVvNQkn7NAdhcm0W/Las=; b=gFtekQY9QKb8G0
	aZwEsmXGgOOobjit11TiNvLskh+5UFAxo0Rk9WPR+WfOy53VCU9Jh6g8mrnL9w/mZWBVjAbiMAjfK
	Jp+jKhLg/Qn/cdW/FxIoe9nugjQhcTp8VBPg06Qu4qYlgdRjjpAWnbiLuW32RkR0cO/VOFg+fLxxe
	nHJ2u1h2LkXDh4VPhU92NTcHOaI01aZKb0yQ9OHUHV/JBIOCkSW/8FONLGBOTPg/idsqXAE71uIEN
	DpKE73xFsqoKXaubim67MJY40UmfrX9JnsNSm1SdgvGQroo+hInyXokaL84uB0S7TpLFduU25P1e3
	AsNdCqzb9xJ84ZkCkkrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM7Ts-0002M4-4Y; Thu, 02 May 2019 08:54:16 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM7Tp-0002LM-2E
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 08:54:14 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 68A47608F44D;
 Thu,  2 May 2019 10:54:08 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id tCZgGT9srGJB; Thu,  2 May 2019 10:54:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E47066083114;
 Thu,  2 May 2019 10:54:07 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DSTtttNaDo7h; Thu,  2 May 2019 10:54:07 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2DB38608F44D;
 Thu,  2 May 2019 10:54:06 +0200 (CEST)
Date: Thu, 2 May 2019 10:54:06 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds@linux-foundation.org
Message-ID: <1906022472.41848.1556787246765.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] MTD fixes for 5.1 final
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Index: DfL9m5ltWhnTV5AkF4L36VKfZfOrxA==
Thread-Topic: MTD fixes for 5.1 final
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_015413_247652_B11051ED 
X-CRM114-Status: UNSURE (   6.26  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Linus,

The following changes since commit 085b7755808aa11f78ab9377257e1dad2e6fa4bb:

  Linux 5.1-rc6 (2019-04-21 10:45:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.1-rc6

for you to fetch changes up to 9a8f612ca0d6a436e6471c9bed516d34a2cc626f:

  mtd: rawnand: marvell: Clean the controller state before each operation (2019-04-25 23:21:51 +0200)

----------------------------------------------------------------
This pull request contains a single fix for MTD:

- Regression fix for the marvell nand driver.

----------------------------------------------------------------
Miquel Raynal (1):
      mtd: rawnand: marvell: Clean the controller state before each operation

 drivers/mtd/nand/raw/marvell_nand.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
