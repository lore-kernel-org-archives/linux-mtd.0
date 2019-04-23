Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACC2C10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 05:21:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78A9D20811
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 05:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gwsvEo89";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kffU1Du0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78A9D20811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3SErQB4sn7/BPInxuMmjps1Y3vBpvWuAUpJB7doZLg=; b=gwsvEo89Q5z+B8
	Qa73Y3FHCzHnLxWYIjIBB7Q095KNBJIo7UCHUphiCImiKtM63xnnYOaHaRnRHC/7nGU9vPlbyd4e/
	iYHy6aJHu89ftYrJ7fsusrhSN9v/smae5ZoywvNHjJIqvLPhcunfZeiYxbYpqya/1bvZqIuIsHRkt
	HegRCJpfLSt009pgq7V/M1eWse8nMnwwiXeHy+h9n/sTGsSdmVVHUbjdOis9JufvG38jFFFKIFm8V
	he4vQYhl9CaENorbkOFn167ef/SkwI4jGypXOImcbK1ozdBRKuhihePREQnLfCngGms0hXLxYZjmy
	2hcQabgSt9+pMMWfum9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hInrq-00079R-9u; Tue, 23 Apr 2019 05:21:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hInrn-000796-PX
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2019 05:21:16 +0000
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D7042064A;
 Tue, 23 Apr 2019 05:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555996875;
 bh=NDWobYZerLqZdOvwNgIr6x/XqPKoGf4pOZeHzLgn9f0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kffU1Du0UYyE3LG6YDCWEhM7xVDn4Fd9xvvIp8B80dooG+HJENVejXsGMyCnO8P3U
 Rbj1jiiXok5ZpAnEofRQKsYdNlP4uyGoyO2ysYFipxh1jhaufKykM7Ead2kCMZimW7
 lZqH5CxHXvB4DAO49h24MlkPMXgnkD0IohYcYErA=
Date: Tue, 23 Apr 2019 10:51:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 10/14] dma: mxs: Drop unnecessary flag
Message-ID: <20190423052109.GG28103@vkoul-mobl>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-11-s.hauer@pengutronix.de>
 <20190417101649.1e01ac0a@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190417101649.1e01ac0a@xps13>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_222115_843530_FC27BD67 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 17-04-19, 10:16, Miquel Raynal wrote:
> Hi Vinod,
> =

> Sascha Hauer <s.hauer@pengutronix.de> wrote on Tue,  9 Apr 2019
> 13:34:17 +0200:
> =

> > The mxs dma driver insists on having the DMA_PREP_INTERRUPT flag set
> > on all but the first transfer. There's no need to let the user set this
> > flag, the driver can do it internally whenever it needs it. Drop
> > handling of this flag from the driver.
> > =

> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> =

> Patches 10, 12, 13 of this series have repercussions on the
> other patches, I would like to apply the whole series through the MTD
> tree; is this okay for you?

Yeah I will check them. Sorry the tag was dma: so it got dropped by my filt=
ers
:( and I was on conference/vacation and didnt check other email...

> =

> Acked-by's welcome.
> =

> Thanks,
> Miqu=E8l

-- =

~Vinod

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
