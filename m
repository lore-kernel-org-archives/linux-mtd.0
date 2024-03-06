Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C501C5475B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2024 15:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqB9YsPFHTTQhcKSZKNEkv2ds7LyW0pPeHq1wv8fz6U=; b=2Hv21Y6QY7xLio
	mpAZ+O9bCSaPLEPj81oLPs0mGMKsSm2DvF/BjqIxyK3eaD391fGGdcGb1jpOxfukMfvhrnAGj2+Oa
	Z4+ALaNtju2WRHIcIiOjQ17hgnYJWzjKTOHbpmGFkr0t6m3a22TjWkaBSaA/oCGw2ygsp70qWTQx3
	w0AS/1h3ypW0K6hzgGNv/i1BlT8+vTZixLF/Nf7TkGcTTEWzHXIStJybKW6tjgea7ypckENQE6i9N
	4Xcq4xJxjgVHFKZpMMuvt7vo95ImN90CNeS/pAQYp234R4nrNkxzdLFouHzKgzJpRS79N3JwKoLC6
	/yKKn5SDyBhNQGv2YLHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rht1j-00000000kcm-3dOK;
	Wed, 06 Mar 2024 15:17:51 +0000
Received: from mail.thorsis.com ([92.198.35.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rht1g-00000000kbx-1qfS
	for linux-mtd@lists.infradead.org;
	Wed, 06 Mar 2024 15:17:50 +0000
From: Alexander Dahl <ada@thorsis.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=default;
	t=1709738265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fUMnD/6vW9NuKS/nt5Th0ViTDQ0l8XBA8uW2U71G7FA=;
	b=Qmy3zDxHcz0x49pC/oGsJguYnhheHUGXXvH2JG867cwvYVAeOAHo0ypIfzsbOkbHuGYgN5
	9+5P5PGUIcQNycCtnB7G42CLiZ6EFf5XvmWkjkFyHDNCr5H0uxHYpK187SgXUoIwI27LAL
	mhfjHvxb7syc0h68xmVStZGJpZq4QpcybMc1Fg41C5kmY3QJcsSnIn7beb3kRx1oKwqmnh
	RQacNViqmfMuRCHPFCNmvXVsEjuXJJu/AFEjnmm/tmSkPycUGFj3kXUq8yVlXfypKBJYb8
	2kuEjzUZWUuYuqLfoBgfLyeZAF4R+1owWY58GnHH3bN6hRGuyOWYWOv3aVBgaw==
To: linux-mtd@lists.infradead.org
Subject: Re: raw nand: Accessing R/B# through GPIO never used
Date: Wed, 06 Mar 2024 16:17:48 +0100
Message-ID: <8343299.T7Z3S40VBb@ada-pc>
In-Reply-To: <20230811-anyplace-backhand-4131de006e84@ifak-system.com>
References: <20230811-anyplace-backhand-4131de006e84@ifak-system.com>
X-Clacks-Overhead: GNU Terry Pratchett
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_071748_667993_8721E339 
X-CRM114-Status: GOOD (  36.40  )
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

meanwhile we made a custom board with SAM9X60 and a Spansion S34ML02G1 SLC =

flash, and I learned some more things here.

Am Freitag, 11. August 2023, 08:40:23 CET schrieb Alexander Dahl:
> Hello flash developers,
> =

> I'm currently evaluating the nice Microchip SAM9X60-Curiosity board
> for booting from NAND flash.  Is has a at91 SAM9X60 SoC, a Macronix
> MX30LF4G28AD 4Gbit flash chip and uses the new atmel raw nand driver
> contributed by Boris Brezillon back in 2017 based on different older
> drivers.  NAND flash access in Linux works fine and out of the box
> with current mainline, I did not expect anything else.

All things observed and mentioned here happen with the curiosity board, too.

> When trying to get the NAND flash access working in U-Boot I noticed a
> strange behaviour.  You can see the whole thread here:
> =

> https://lore.kernel.org/u-boot/20230809-marvelous-number-8e973a3bb5e0@ifa=
k-s
> ystem.com/T/#t
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

I tried again with recent U-Boot 2024.01 and the behaviour is still the sam=
e, =

you should be able to reproduce this with mainline U-Boot and the sam9x60-
curiosity board.

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

I was mistaken.  See this call:

https://elixir.bootlin.com/linux/v6.8-rc7/source/drivers/mtd/nand/raw/atmel/
nand-controller.c#L1688

Following the function devm_fwnode_gpiod_get_index() the parameter "con_id"=
 is =

passed along through several functions down to of_find_gpio() and when pass=
ed =

"foo" that says:

    /* Try GPIO property "foo-gpios" and "foo-gpio" */

So it tries several suffixes for "foo", that is why a simple grep does not =

find anything.  In the particular case passing "rb" to =

devm_fwnode_gpiod_get_index() would find the "rb-gpios" which is described =
in =

dt bindings.  =


Thanks to frieder in IRC for pointing me.  This mail is to have that wisdom =

archived.

> Bonus questions:
> =

> Has anyone tried to really access that line through GPIO if the SoC
> requires that and how does that R/B# line behave over different flash
> chips then?  Can this be a problem of the NAND flash chip itself?  Is it
> safe to go with "soft wait" through status bit access only?

Fun findings: unlike U-Boot where using that GPIO does _not_ work for me, t=
he =

NAND flash access on SAM9X60 in Linux _only_ works with that dts property =

present and thus the linux driver using nand_gpio_waitrdy() instead of =

nand_soft_waitrdy() (which it would use if that dts property would be =

missing).  In the latter case I only get zeros as data, making it impossibl=
e =

to read anything useful from the flash.

> (Note: it's not easily possible to analyse this with an oscilloscope
> or logic analyzer on the sam9x60-curiosity board, because the line in
> question is a direct pcb trace from a ball of one chip to a ball of
> the other chip.  Similar for other connections from NAND to SoC.)

Well on our custom board the flash comes in TSOP package, so we might be ab=
le =

to investigate that in depth later.  Of course any other insights welcome. =
:-)

Greets
Alex

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
