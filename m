Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D27C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pyq5Iiw6+VnABnTNqM5Ic/X1XAt90hRHIPpPNSWSdGk=; b=3ntNP07wcwaL9F
	M5JGuTQ27wThEDZUzggK73spPpbpSmbU/UmkcPvPP1PvEqJmlnFGw1BmwNTE2Huen7TRHkyOVYYeq
	HXujH8clRRfMHxl+0TuSA9YXskyP4Z9Bui90LmJe4hVkqRf2AAESIgeo0a27C1YDmhuZmXpeLIq7Y
	Q8Y9WVcXFP4DBob8cKc/P1NoagZoYOVCg07ORPxtW9c0FMxgv+/f7q+t4buFz1ia2hEHGo5/3Gfbg
	sR0PxSvWSCMDvyY8MZpPTXjSH4Z01sjBFMUOLQcZq5V9rKMTFxMH3rLLzOUC1MKUK0z4x2W+vaBB6
	mT6A7qn2SnCICme67bfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXbn-008Twq-Oj; Thu, 21 Jul 2022 14:56:59 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXan-008SUg-F1
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2022 14:55:59 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D280162B9C5F;
	Thu, 21 Jul 2022 16:55:50 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id eb-p_8buOLki; Thu, 21 Jul 2022 16:55:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7DF43615CC8F;
	Thu, 21 Jul 2022 16:55:50 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Hnghox_vwKZD; Thu, 21 Jul 2022 16:55:50 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4C8D862B9C5F;
	Thu, 21 Jul 2022 16:55:50 +0200 (CEST)
Date: Thu, 21 Jul 2022 16:55:49 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	miquel.raynal@bootlin.com, vigneshr@ti.com
Message-ID: <1803003448.13661.1658415349943.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] MTD fix for 5.19-final
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: xGq0B3rDLG5KF75EXGNeR2hH8Si0zQ==
Thread-Topic: MTD fix for 5.19-final
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_075557_712306_6C353414 
X-CRM114-Status: UNSURE (   3.64  )
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

The following changes since commit 32346491ddf24599decca06190ebca03ff9de7f8:

  Linux 5.19-rc6 (2022-07-10 14:40:51 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.19-final

for you to fetch changes up to 0fddf9ad06fd9f439f137139861556671673e31c:

  mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on program/erase times (2022-07-15 17:41:11 +0200)

----------------------------------------------------------------
NAND controller fix:
 * gpmi: Fix busy timeout setting (wrong calculation, yes again)

----------------------------------------------------------------
Sascha Hauer (1):
      mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on program/erase times

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
