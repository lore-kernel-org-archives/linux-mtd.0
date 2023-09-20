Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C310DCE79AD
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 06:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3re6nCiEyGiPJ1TY0cGrf/h19C7VgO8NLCQOxRpnELM=; b=qEcH5gcCMNdaaz
	2jc2r6Rk9CSSJgKgJ2C+/GrxUOOXNEn3ENcAAno7K3H5QbhFr7Dt7QsaPF8mon3cK1ngPwPpaUo5m
	x7SqGwKALv+Ad9mqEJwuUx7p3T0Os5XzTS8hlicC65z23OVem2y8Q4sYDRvRctCOoBrKtQWOO2VE4
	582QYFYfXa/zg0Xi+432qv/STRy/3bomgbLSsOfx6wk3aIsw5F/8EZejBFgup0r2jhLnmIPhNerOQ
	/JlvImsd41CqIIgz/1gQzbBSN3agFm7/PEYm7+ueDladc4W4TUxgEJv0QsUqRSMU9hfbjvi7Ifjb2
	o3suLWnN3cgxi/0uZp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqYD-0020U0-1q;
	Wed, 20 Sep 2023 06:19:05 +0000
Received: from mail.thorsis.com ([92.198.35.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqYA-0020S6-23
	for linux-mtd@lists.infradead.org;
	Wed, 20 Sep 2023 06:19:04 +0000
Date: Wed, 20 Sep 2023 08:18:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=default;
	t=1695190729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2upKPTyMZEP1FGpez8r0G9eLqkLJUkZZD75zt43gGZU=;
	b=v4Ns2PFzJRHhKHxrmTlqTDF2IST0U1R8Kw1AuD0F7JKM0K2gCMf0K6IFrAQB8frsl4OvUs
	09I2FBlo4b+e2wPlgQdoiqMolyZ45HVN3Z99Rn00x94HGIZVO1KU0IGSai6Pr9rvxRs14s
	nX0Sm/LFuoMWF0LSqqsLcRFIbO4rjAmmZ2Gstr7yG+nFMldvqF/NVpS9geYb9oyDKlHsXU
	oR1P2GL/DxY2CUHN3aVF9MNcHA7no/tiSMk97lPxkxSDuAFoHri3BLKOLgOGCJp6tFc5ge
	oC/sx7XYJ1O0ckVGzG6pfo3F/UHgn0hgjyUP3zMlB3xzkqI4Rzfq7nLaEd1UWA==
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Subject: Re: raw nand: Accessing R/B# through GPIO never used
Message-ID: <20230920-icing-running-ce7d38c724af@ifak-system.com>
Mail-Followup-To: linux-mtd@lists.infradead.org
References: <20230811-anyplace-backhand-4131de006e84@ifak-system.com>
Content-Disposition: inline
In-Reply-To: <20230811-anyplace-backhand-4131de006e84@ifak-system.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_231902_834354_5D102FF9 
X-CRM114-Status: GOOD (  34.95  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hei hei,

maybe that whole story was to long to grasp?  But gentle ping if
someone has some spare time to read.  I'm still curious why this
happens and why that device tree property is used all over numerous
device tree files but in no driver?!  See below.

Greets
Alex

Am Fri, Aug 11, 2023 at 08:40:23AM +0200 schrieb Alexander Dahl:
> Hello flash developers,
> =

> I'm currently evaluating the nice Microchip SAM9X60-Curiosity board
> for booting from NAND flash.  Is has a at91 SAM9X60 SoC, a Macronix
> MX30LF4G28AD 4Gbit flash chip and uses the new atmel raw nand driver
> contributed by Boris Brezillon back in 2017 based on different older
> drivers.  NAND flash access in Linux works fine and out of the box
> with current mainline, I did not expect anything else.
> =

> When trying to get the NAND flash access working in U-Boot I noticed a
> strange behaviour.  You can see the whole thread here:
> =

> https://lore.kernel.org/u-boot/20230809-marvelous-number-8e973a3bb5e0@ifa=
k-system.com/T/#t
> =

> What got me wondering is the behaviour with regard to the R/B# line of
> the flash chip.  According to the chips datasheet (and datasheet of
> other raw NAND flash chips we used before, e.g. a Spansion=AE S34ML02G1
> 2Gbit chip) that pin is somewhat optional to use, right?  You can get
> the same information through an access of bit 6 in the status register
> of the flash chip.  We learned this a few years ago when trying to
> make raw nand work with an at91 sama5d2 in U-Boot, where U-Boot had
> only an old driver for the atmel nand controller which did not work
> with the pio4 GPIO controller of the SoC, so accessing R/B# through
> GPIO was not possible, but thanks to the other way (status bit) you
> could get it to run.
> =

> Note: the SoC's nand flash controller we are talking about here (SMC
> in SAM9X60) has no native R/B# line support and the SAM9X60 datasheet
> explicitly recommends to connect that pin to a GPIO.
> =

> Now the problem in recent U-Boot with proper GPIO access is: it takes
> ages for some flash operations to complete.  The gpio signal stays 0
> for several hundrets (!) of milliseconds until the read from the pin
> gets 1 (confirmed by debug print in modified U-Boot source).  My
> workaround for now is removing the 'rb-gpios' property from U-Boot
> dts, that way flash access is reasonably fast.
> =

> So I wondered what the Linux driver makes different.
> =

> Turns out: if I am not mistaken, the Linux driver does not consider
> that R/B# line at all.  Why?  The GPIO is determined in DTS through
> the property 'rb-gpios' which is well documented in device tree
> bindings docs, and used in numerous dts files over different vendors.
> However that property is not evaluated in a single driver?!  My
> conclusion is: no driver ever accesses that pin and everything just
> works through status bit register access, right?
> =

> Can anyone confirm that?
> =

> Bonus questions:
> =

> Has anyone tried to really access that line through GPIO if the SoC
> requires that and how does that R/B# line behave over different flash
> chips then?  Can this be a problem of the NAND flash chip itself?  Is it
> safe to go with "soft wait" through status bit access only?
> =

> (Note: it's not easily possible to analyse this with an oscilloscope
> or logic analyzer on the sam9x60-curiosity board, because the line in
> question is a direct pcb trace from a ball of one chip to a ball of
> the other chip.  Similar for other connections from NAND to SoC.)
> =

> Hoping someone can shed some light on this topic.
> =

> Greets
> Alex
> =

> =

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
