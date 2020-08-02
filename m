Return-Path: <SRS0=iZys=BM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D762C433E0
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 19:17:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DA45206F6
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 19:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gwtoj4Pu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DA45206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e/9Jy8ABa8biB/IyGvB1/WaVaWtmoK2laAFhSBVvVoE=; b=gwtoj4Pu5YDokG26y5nrdjlkbY
	ugaFEN2NSo2f4ZdiUKwqQ9aeyTsdFhvBKv3sxqir+9tLFgZdEuY7uVaCENTSVNr/iX0LbioDJvcwu
	wiphZXIDqCfz3lgBQAGSWyGf0drHdnrI/xgTJ3mB9X6ZDtBBKyWnZkFpqo8OUNDha4tLaeBy461jA
	eJS9Ub8UFf4WhdXtsW847zOdMMiwqSKFAAk4ugYxwAvZ09r8P4aoZ58s+SXbpqpWpbcnrN75TxD/V
	pdV2DPPXwwYuUh9kTwK6Ko1jYQyRMKv7mO9NUFXmbz087C70pQhAoFEx2NK0KMDU3/utuJYAti0rG
	YDO4IgXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2JU8-0004TU-7A; Sun, 02 Aug 2020 19:17:28 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2JU5-0004Qj-DH
 for linux-mtd@lists.infradead.org; Sun, 02 Aug 2020 19:17:26 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1AC0561D8AB3;
 Sun,  2 Aug 2020 21:17:22 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id euIn5lnh-NeA; Sun,  2 Aug 2020 21:17:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A674B61D8A8B;
 Sun,  2 Aug 2020 21:17:21 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id NR3dkTOCafhq; Sun,  2 Aug 2020 21:17:21 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7BDF96071A7C;
 Sun,  2 Aug 2020 21:17:21 +0200 (CEST)
Date: Sun, 2 Aug 2020 21:17:21 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <1401520472.201470.1596395841386.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] MTD fixes for 5.8 final
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Index: YSIOvvqeeCjsUO5zcWYbwcKUq1Gp2w==
Thread-Topic: MTD fixes for 5.8 final
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_151725_580786_DF801A7B 
X-CRM114-Status: UNSURE (   5.25  )
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
Cc: vigneshr@ti.com, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Linus,

sorry for the late PR, feel free to postpone it into the merge window.

The following changes since commit d15be546031cf65a0fc34879beca02fd90fe7ac7:

  Merge tag 'media/v5.8-3' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media into master (2020-07-22 11:56:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes

for you to fetch changes up to f7e6b19bc76471ba03725fe58e0c218a3d6266c3:

  mtd: properly check all write ioctls for permissions (2020-07-24 23:03:11 +0200)

----------------------------------------------------------------
Greg Kroah-Hartman (1):
      mtd: properly check all write ioctls for permissions

 drivers/mtd/mtdchar.c | 56 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 9 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
