Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED74C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 14:28:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4201160F5C
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 14:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4201160F5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCiR2hMOcfIi7pj6BLMnpVmACBZRqc0kd9eTCqdZGY8=; b=tw7N71zsvqv3pZ
	uoqFdJHwvKsHQJmBKM1Cy7tyL5rq3DVCJ6Ed/uROeBLUYEqEOsUwUKQUY47PrZR8tcFF+IIN5v1wr
	VxOKQilGYrDkwfHih2Cc+QNtwBYdEwWqunjEm8bp6sPn7UQ1Hw2aHnJjkFLIRa8HWex3akZ04uMDW
	lmW9ltIERiSuLQ3BhnUXFlkgS3d2Dk1KUETXFkV8f16yiyw6gxuJ7zX1W+9lROOGNJUhQnbESxfrk
	XreWCbYhtuSjlhtV2fODkSxdL8bCilpUUZqiiqSgKtQJojEgF0uwnkeRnY8/jriKWMeaiO1Y2tyr7
	WB3JhYmHe0PuxTjPm/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFdaj-00HFEH-1p; Mon, 16 Aug 2021 14:27:53 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFda4-00HF6A-J6
 for linux-mtd@lists.infradead.org; Mon, 16 Aug 2021 14:27:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id CCA5810000E;
 Mon, 16 Aug 2021 14:27:08 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Young <sean@mess.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 1/5] mtd: rfd_ftl: allow use of MTD_RAM for testing
 purposes
Date: Mon, 16 Aug 2021 16:27:08 +0200
Message-Id: <20210816142708.15101-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210807214538.14484-2-sean@mess.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'fb2f82035a86ecc950cbd11166ad685e6a04a5be'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_072712_805250_B03B3C6A 
X-CRM114-Status: UNSURE (   6.30  )
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

On Sat, 2021-08-07 at 21:45:34 UTC, Sean Young wrote:
> This allows the rfd_ftl to be used with the mtdram module, so we can
> test different mtd sizes and test the rfd_ftl on machines without a
> physical nor flash device.
> 
> Signed-off-by: Sean Young <sean@mess.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
