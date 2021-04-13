Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6537C433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 20:06:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34761613CC
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 20:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34761613CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NwcmiTEXfaCvaixbMTMrJBFVpWIwxYzJrh5GmaHLj3Q=; b=olbl19XSqseaLYSXYndewM9Ybg
	ipitMxImEXi1IJ0QlPtNUUzfNzDRmBQe28I1wLoFopef5HLXyCLKORM1SxBRtefmfM2SYxHGcX1xn
	+8fPkqeXNyAOGWvt8AtNoIBFnFwdX8V6NI4RCo2HPY52wvst71wX6fLGh3slkB8i+Frdz9d7ojl4y
	sC3JXbbDQqhnDvVhDF+DYN2i6FUJAmkLWnBTmhj8oR5GhCDPaS5yijheOysnRAzNh7vGSwOjKTKEe
	ZF2/5UbZcXtzCgnmuWtOLc2rCEYkfnVwhvO19oKLqn6C7ZaVrHNGLMVU3RVxbaFK0vUAs/pze7bNE
	1jLF9TrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWPIQ-00ALVG-UR; Tue, 13 Apr 2021 20:06:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWPIK-00ALUm-PG
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 20:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Message-ID:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=F1c1OPzJlNqKmBSHaGQZwi7bCi+XoTHBKVy3Nl/Tc0Q=; b=LOFmktjxjvc/ZwIsDSjsq0mgyn
 tQdqO6DlJTKW0Bv9GbTp5UPylLbafNchku5bM55bd74ZCbiQAjZRU3q1RtBK2Pr9alDYtfDk/8xxB
 uaHENhoeKnDpLj0A5tgqpcQZV12WCRgl7APC0oCCgL+dhF0R2kQZ8UvTPj6TeM9gdriVizncy0E2o
 eysAZeXNyOJdq1QUSDhgOHL0H4g6u+miJtEwJJeC1UXVORdUF5iNR0EdgKfFZK8j5chU/abGuXGQS
 knKRyKgYXFMSB7u8GwgdOr3aiXtwTYeY/OsErS7pzFqv4f03YLm2SoBXG/vyMtv7on580hpWyxYQC
 dEABA3BA==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWPIH-007IJi-PJ
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 20:05:55 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5FE4B6122D44;
 Tue, 13 Apr 2021 22:05:42 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id pb2ba3nKQmwb; Tue, 13 Apr 2021 22:05:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0C271606BA5E;
 Tue, 13 Apr 2021 22:05:42 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id VDArCqsXGLPe; Tue, 13 Apr 2021 22:05:41 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id D4E4A6122D44;
 Tue, 13 Apr 2021 22:05:41 +0200 (CEST)
Date: Tue, 13 Apr 2021 22:05:41 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 miquel.raynal@bootlin.com, vigneshr@ti.com
Message-ID: <1678691098.178869.1618344341740.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] MTD fixes for 5.12-rc7
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Index: WK6HXCg3/KZU8vvevUTpx25CD/Z4vw==
Thread-Topic: MTD fixes for 5.12-rc7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_130554_027167_03E2D8F7 
X-CRM114-Status: UNSURE (   4.51  )
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

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/fixes-for-5.12-rc7

for you to fetch changes up to 2fb164f0ce95e504e2688b4f984893c29ebd19ab:

  mtd: rawnand: mtk: Fix WAITRDY break condition and timeout (2021-03-11 12:23:11 +0100)

----------------------------------------------------------------
This pull request contains the following bug fix for MTD:

- nand: Fix WAITRDY break condition and timeout in mtk driver

----------------------------------------------------------------
Hauke Mehrtens (1):
      mtd: rawnand: mtk: Fix WAITRDY break condition and timeout

 drivers/mtd/nand/raw/mtk_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
