Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D38C10F27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 14:22:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A42321313
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 14:22:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LA8qixKR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gkc0L1z8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A42321313
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3VuYs9cToVzo47dCN9DsbiGdtOmDdQ6UYfhTVk+TVsQ=; b=LA8qixKR/tZA1W
	0bG5PWZuoHaGnUw3z5DuAgIAKsISKJGj5dPgaucmRU6TNOcYlXmjFLCiLQYirWmEUR322uHZOzNwx
	rtTYiBxvL/R+nbrV23TbcaHkOtxPcsjIB3RmzCTj7mrVQzcgW/+f3VIXPCVjzBeHZWbYwlVbLcR17
	Ufpj78TTMY5seIpHSGwxjcXkTZ29rz71jrKtyEq08ZHGV6oA6S7OVuu0osCllYWwmtBdx6w8+nBgG
	KjKQ0fOsEc3nh1HhFeRbDTfLoW1jCDoYvQNa3T2G+bMJ1cQ81PKrsIH53ETjSJN+c5GZ3Oec8qRBm
	ER9RXhVGbFAncOmmjz9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC2Ev-00022G-0D; Wed, 11 Mar 2020 14:21:41 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC2Es-00021M-Gd
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 14:21:40 +0000
Received: by mail-vs1-xe43.google.com with SMTP id i25so1413445vsq.9
 for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2020 07:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AA36Z3gXSwJUntGmt4TTG30h5qvPXt0r2XDT/8zcsfI=;
 b=Gkc0L1z8chPU37ylfxfld8kL1758g6oY0Td7cWlPBhRSaljv0nEP9i+wF1FJLm0Drg
 7zQLQnQGtshFfkBxcXQOD8UJjfPEBJlxiQbOQQRDjlQyYcs4GHopCD3WQpPexAJCvhto
 8XN93qTBP25DLXymYoqMYfRDFiCDl00Tu7l7HwjPGS2KJhr2hl68CUYN42965CRUP9pQ
 ZDPNq0D/OlBZjkMIJz112kgpsvq2mG8Y0bHAG6O4T5kI9wyjM5tx9FQxhltw0y0ATKH4
 ttb7rdiO3me+gomGLr9dPZ6NNBAkBHLub4H4YSPSffAKhD/PJ/7fQfqhDsJtoj4Mb2vw
 xi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AA36Z3gXSwJUntGmt4TTG30h5qvPXt0r2XDT/8zcsfI=;
 b=eI1KLB/EwzpClUY7pu/vBClowseeLY9x8Zvt9M8MWlPn0FxeWbOjPz7HKh+Xq1FA6O
 +PC+4Ct+ExY8NjCO98+8ZTJb9yJaw67U3/XlJnmmCz9yEhpC0WywVydaBMI7XuBZrHW8
 GZSkVjY/WW8TwXy15m2W1NxvRT7B0SvuYifTs3Wdo3Fbw7z+sF++XZZrHuS51hhzz7UB
 iTBugp0hRQxTxPowVF92n2HxeXkC/pNavYXQivNfSHEHvoDRfJfED56DyOfBP8ht69la
 9K04yVNgXO2CCmNu7ITpAPELvqS9+4NmjDX1C/RSyRaqZjn7g8ZcRe03Palxk2bm+1x3
 qobQ==
X-Gm-Message-State: ANhLgQ2vZukm2SiwwUXlkP4vPzgN7w8iIlTBdujKDhZzV/4lZI3DxBtG
 a9CJ3tcPiPVbznYmZ5I1CsITgiZEG3Pka5FKYUKUAA==
X-Google-Smtp-Source: ADFU+vvAwSiaVqdqSV80/n9skavFztB4aCTDjE1foC884CVvIqJg8m9aPx1YictIGAray0JPA7so3t3+znzsKWxY1WY=
X-Received: by 2002:a05:6102:2051:: with SMTP id
 q17mr2225224vsr.165.1583936495390; 
 Wed, 11 Mar 2020 07:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583896344.git.joe@perches.com>
 <ad408ff8dc4e5fae0884312cb0aa618664e546e5.1583896348.git.joe@perches.com>
 <20200311084052.3ca3c331@xps13>
In-Reply-To: <20200311084052.3ca3c331@xps13>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 11 Mar 2020 15:20:59 +0100
Message-ID: <CAPDyKFo2UensmH_gYkH+u22bs=K9Xn0q3Dr9v6tq6GPNRg_Lew@mail.gmail.com>
Subject: Re: [PATCH -next 013/491] INGENIC JZ47xx SoCs: Use fallthrough;
To: Miquel Raynal <miquel.raynal@bootlin.com>, Joe Perches <joe@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_072138_558358_0CA97175 
X-CRM114-Status: GOOD (  12.91  )
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
Cc: alsa-devel@alsa-project.org, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>, Richard Weinberger <richard@nod.at>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 11 Mar 2020 at 08:40, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Joe,
>
> Joe Perches <joe@perches.com> wrote on Tue, 10 Mar 2020 21:51:27 -0700:
>
> > Convert the various uses of fallthrough comments to fallthrough;
> >
> > Done via script
> > Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/
> >
> > Signed-off-by: Joe Perches <joe@perches.com>
> > ---
> >  drivers/gpu/drm/ingenic/ingenic-drm.c           | 2 +-
> >  drivers/mmc/host/jz4740_mmc.c                   | 6 ++----
> >  drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 2 +-
> >  drivers/mtd/nand/raw/ingenic/jz4725b_bch.c      | 4 ++--
> >  drivers/mtd/nand/raw/ingenic/jz4780_bch.c       | 4 ++--
> >  sound/soc/codecs/jz4770.c                       | 2 +-
> >  6 files changed, 9 insertions(+), 11 deletions(-)
>
> I like very much the new way to advertise for fallthrough statements,
> but I am not willing to take any patch converting a single driver
> anymore. I had too many from Gustavo when these comments had to be
> inserted. I would really prefer a MTD-wide or a NAND-wide or at least a
> raw-NAND-wide single patch (anything inside drivers/mtd/nand/raw/).
>
> Hope you'll understand!

I fully agree (for mmc). One patch please.

Another option is to make a big fat tree wide patch and ask Linus if
he want to pick up immediately after an rc1. That should cause less
disturbance for everyone, no?

Kind regards
Uffe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
