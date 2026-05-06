Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC80CD343B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2026 15:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Qo/duHA8kDCix+ZzqJS51kLRAU3MdTMyr7j/nsbHNc=; b=Rx5ozVUxJYXhtk
	tjAQhSGTdjSaA+aYWPufPVkE+XkKmIMCsbidSZW2kXsG5cNPhsKPEpjmsxiWj82G4EPstqmBlC9gi
	uxueUSKAZkDNuav4sJB3YQ7EaolxWJ7b2FYTYjvYHDHArPwm+j/R2UgVTm5ZYpF+mPKeZ1dxxAiEg
	sbS1+p5Z7Mpiexyy83idEqEJHDab/pXn3sgn9soOHIVSS7jpdSVfMjfMKkxwkdKj+CRsugz94lcyW
	fVPw2+Fh/bfKUoOszLB0mlT7hr3iIIkGEsD5irNi6bpcul9PvvTjO035E3Gh1BbEUSB9othZ0UTxT
	fVE0GjzDF6Erg9nHBH9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe4Z-00000001IFe-1CzH;
	Wed, 06 May 2026 15:22:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe4X-00000001IEk-1X71;
	Wed, 06 May 2026 15:22:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1495641987;
	Wed,  6 May 2026 15:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CA2C2BCB0;
	Wed,  6 May 2026 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778080921;
	bh=irybcLo3uyE+65mJf+bqaAsN/vMB7QXfzRfYKYjBRtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBg49DDbHmd4skBXAJTkUnm42TbQTgIORC78toZgV1RQnD6MiF1WthoBXlGtzKbKA
	 JyiOkutAMkyi2qOBKtVpbp/10iXvSwSZtnWaWrEdYFI/WRhg0HjF1mbIP/1yNoFTXW
	 MagCahNPmv9JzqLzc8mOFWkC1+vLiWBO4BoQnVjE69Q50Ha9MTUN9RB1WsqSwF1hpn
	 E70QEW9H5OyHqgJsgz1tTFzFB5mF46VgLrIYpoRBYyIb6Fl4Z3Q4izmCq6SccfnWWO
	 KaZHzOEqaUPrWNKjMdbJRhf7PuhHeQCo1Y6cwhxMn13ivJHLKQ6JVJ9L1Lvp7wO7aB
	 VIqSkZe9HxtcA==
Date: Wed, 6 May 2026 10:21:58 -0500
From: Rob Herring <robh@kernel.org>
To: Saravana Kannan <saravanak@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ARM: at91: remove unnecessary
 of_platform_default_populate calls
Message-ID: <20260506152158.GA2136148-robh@kernel.org>
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
 <20260105-at91-probe-v3-3-594013ff2965@kernel.org>
 <20260423-stoke-ocean-139dbe306256@thorsis.com>
 <20260424-worried-renewal-924d34ed945c@thorsis.com>
 <87tsswfnmy.fsf@bootlin.com>
 <20260429-lushly-greasily-c14c01c1aee8@thorsis.com>
 <87lde6cdc4.fsf@bootlin.com>
 <20260429-blazing-thus-c1a4eb9b6b0c@thorsis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260429-blazing-thus-c1a4eb9b6b0c@thorsis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_082201_442633_89D47723 
X-CRM114-Status: GOOD (  22.94  )
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

On Wed, Apr 29, 2026 at 03:02:22PM +0200, Alexander Dahl wrote:
> Hello Miquel,
> 
> Am Wed, Apr 29, 2026 at 11:42:19AM +0200 schrieb Miquel Raynal:
> > Hi Alexander,
> > 
> > >     [    0.958298] bus: 'platform': add driver atmel-ebi
> > >     [    0.958451] platform 10000000.ebi: bus: 'platform': __driver_probe_device: matched device with driver atmel-ebi
> > >     [    0.958566] platform 10000000.ebi: error -EPROBE_DEFER: wait for supplier /ahb/apb/pinctrl@fffff400/ebi/ebi-data-lsb
> > >     [    0.958649] platform 10000000.ebi: Added to deferred list
> > >     [    0.959429] bus: 'platform': remove driver atmel-ebi
> > >     [    0.959540] driver: 'atmel-ebi': driver_release
> > 
> > Interesting.
> > 
> > If you look at the very last line of the driver, the EBI driver does not
> > use a standard "module_platform_driver" macro, it uses some kind of
> > run-once probe that is kept in an __init section:
> > https://elixir.bootlin.com/linux/v7.0.1/source/drivers/memory/atmel-ebi.c#L637
> > 
> > And this seems to be incompatible with probe deferrals:
> > https://elixir.bootlin.com/linux/v7.0.1/source/drivers/base/platform.c#L948
> 
> Indeed. o.O

Saravana, Is there something we can do to make this issue more obvious?

> 
> > I would suggest trying something alone these lines:
> > 
> > --- a/drivers/memory/atmel-ebi.c
> > +++ b/drivers/memory/atmel-ebi.c
> > @@ -633,5 +633,6 @@ static struct platform_driver atmel_ebi_driver = {
> >                 .of_match_table = atmel_ebi_id_table,
> >                 .pm = &atmel_ebi_pm_ops,
> >         },
> > +       .probe = atmel_ebi_probe,
> >  };
> > -builtin_platform_driver_probe(atmel_ebi_driver, atmel_ebi_probe);
> > +builtin_platform_driver(atmel_ebi_driver);
> > 
> > Memory taken by the probe function will remain mapped. That seems to be
> > the drawback.
> 
> This works.  Sent a patch, see:
> 
> https://lore.kernel.org/all/20260429125930.844790-1-ada@thorsis.com/
> 
> Regarding the drawback: This can't be much memory, can it?
> 
> Greets
> Alex
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
