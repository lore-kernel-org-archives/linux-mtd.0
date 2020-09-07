Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560A0C433E2
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:37:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 015FD208C7
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:37:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vTpcoBio"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 015FD208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SW3cef6JC/y30i8/5Fjh/rMShB4szC78iU2rmXs0j2M=; b=vTpcoBioI5cUCjZkUgpFmipEc
	AaIzmMMdCocZ64l8hx/BLYyGz/pVb5MQ9MGucZ2YyVk6CSzu4tgXVk8l+kNlZFjYqjU7o/mNCkbbH
	BWz9Tia1c3HGXTvlTTmbfLTcc2fa2uMdubNnAnw4lZAVxqsRSZEIRNdGUvBQ0+zsAfvU6J7YlvXJv
	6CB1aLi0XvozNWx5tJcLQTIGx8KGlyDuxkPwkaeAylouiSzjk2x0z1ZCJh0W0hCkdfb4kOmGx2LEI
	s3gPNRBLqDtFkI/wzlcbxkRdQdDoUX24dh8bTVkzkTui9pHjQhijHWSNgBgXtTcF2J9wIAIpOH53N
	KmFhb3Qzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBha-0002HI-E4; Mon, 07 Sep 2020 07:36:34 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBfu-0001Jo-CY
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2020 07:34:51 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4524D60014;
 Mon,  7 Sep 2020 07:34:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mtd: lpddr: Fix bad logic in print_drs_error
Date: Mon,  7 Sep 2020 09:34:46 +0200
Message-Id: <20200907073446.27727-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <3fb0e29f5b601db8be2938a01d974b00c8788501.1588016644.git.gustavo@embeddedor.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 1c9c02bb22684f6949d2e7ddc0a3ff364fd5a6fc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_033450_562548_4AB60CC8 
X-CRM114-Status: GOOD (  11.09  )
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
Cc: Joe Perches <joe@perches.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-04-27 at 19:50:37 UTC, "Gustavo A. R. Silva" wrote:
> Update logic for broken test. Use a more common logging style.
> 
> It appears the logic in this function is broken for the
> consecutive tests of
> 
>         if (prog_status & 0x3)
>                 ...
>         else if (prog_status & 0x2)
>                 ...
>         else (prog_status & 0x1)
>                 ...
> 
> Likely the first test should be
> 
>         if ((prog_status & 0x3) == 0x3)
> 
> Found by inspection of include files using printk.
> 
> Fixes: eb3db27507f7 ("[MTD] LPDDR PFOW definition")
> Cc: stable@vger.kernel.org
> Reported-by: Joe Perches <joe@perches.com>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
