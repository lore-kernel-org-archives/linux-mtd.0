Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6660AC433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Apr 2022 19:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iWpsNUTIwL8+yE9XzFQwfctQk3N0sPRuinJy4LTdl40=; b=pRilCTDQ5kvdxu
	zXPuqjoeGWp1fytP7dKH1NQ1RvkfU8OlLbbHQsES9KQ7rJ7QHKrLK9VC7Y7d5YiaAhXsbniM3yS02
	OozmFqWZiqTTDngwVP8e1ERsp+i5R4eo3x2KKmdPSwBQDPMBjDejAW9XglfaYdMgYHGBzpN9iLw14
	aq4C4xZYWvjHK11v3hT6JSCOBgNhkrAAamv9JRCovUlsJhDCWp0oQpV97ipcvHUuTgZkmbuh+oXo/
	GPMjqeYUtn6Nqj5dAVjoiitpYETOSK+y03BM53wiXCFpY10FKL/4F7GxE0F50Z9+dSdXOniocSv86
	nDo4vXxnGfVFV+T6V51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niLqz-004wVn-KM; Sat, 23 Apr 2022 19:55:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niLqn-004wTL-B5; Sat, 23 Apr 2022 19:55:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D117EB80D61;
 Sat, 23 Apr 2022 19:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485D9C385AE;
 Sat, 23 Apr 2022 19:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650743721;
 bh=f+gN5VFSk9TvNUY6oLSGkqRdwS9xhEyKvVqBzBXLs0k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PzAHzR20lzvPfCTqt/UUzx12IPhOfz+TRjqNJ8NxEoRI/bWqgErqlZjk7cfTM259a
 ES9ZLzK7AQ5x5SMPoX4fGuEBvk10IF/bYoYOZNrIybBirPtSW18FdAPqWZza8MudXV
 vG23F9GYtnFHpHrf84m9ZBvRrLCT6HR3YBoZ5rIdgNbcdWJ4WulW+Ag5txr/fArK/K
 8hzENh6M4DW/B6aRii4K02sQiyHAgWdV6wTeninHDFb9FTGsk1kC60BC8Ty7Z9oRiu
 uezNy/Q8OZSv9U2rlimKsK6lo1l+EW6dZRWZhxxZjuCiGNgZmaJtyoN+hSdEOEgF8G
 ZbIfS2Abjyb2Q==
Received: by mail-wm1-f41.google.com with SMTP id f6so616066wma.0;
 Sat, 23 Apr 2022 12:55:21 -0700 (PDT)
X-Gm-Message-State: AOAM533pCXIohy3blZr1C713as+5+lcfW+iFDBqnf70+e9Xrv4NOINCa
 OTkFBQkoR1MnKdgbq/myp9rKAjQhczstaLKJMnA=
X-Google-Smtp-Source: ABdhPJwI9oPHj0hjS6Y5T/XpNunPLjXzfhDb/y4TSIxWhFvis5ICGMzIa2Kp6ZajGKm/dLFayXeKiCmoNnJ4Fu7pVP8=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr18417513wmc.94.1650743719480; Sat, 23
 Apr 2022 12:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
In-Reply-To: <20220422234150.GA3442771@roeck-us.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 23 Apr 2022 21:55:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
Message-ID: <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Marek Vasut <marek.vasut@gmail.com>, Philipp Zabel <philipp.zabel@gmail.com>, 
 Lubomir Rintel <lkundrak@v3.sk>, Paul Parsons <lost.distance@yahoo.com>, 
 Tomas Cech <sleep_walker@suse.com>, Sergey Lapin <slapin@ossfans.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, 
 Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 patches@opensource.cirrus.com, 
 linux-leds@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, linux-rtc@vger.kernel.org, 
 USB list <linux-usb@vger.kernel.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_125525_723157_033939EE 
X-CRM114-Status: GOOD (  33.39  )
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

On Sat, Apr 23, 2022 at 1:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
> > On Fri, Apr 22, 2022 at 10:55 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > On 4/22/22 12:16, Arnd Bergmann wrote:
> > > > On Fri, Apr 22, 2022 at 7:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > >
> > > > Which machine did you hit this on? Is this on hardware or in qemu?
> > > >
> > > qemu, as always. borzoi, spitz, terrier, tosa, z2, and sx1 fail.
> > > Also, I just noticed that the failure is not always the same.
> > > z2 fails to boot from initrd, and sx1 fails to boot completely.
> >
> > That's a lot of machines failing, I hope at least we got the same bugs more
> > than once here.
> >
> > For the I/O space, I found now that PXA was not using the standard
> > virtual I/O address yet, but instead used a NULL-based offset.
> >
> > I'm not entirely happy with this patch, but this is an outline of what
> > I think we need to fix that: https://pastebin.com/3nVgQsEw
> > This one is probably incomplete, at least it breaks sa1100 for now,
> > and it adds a bogus CONFIG_PCI dependency. I'm also not sure
> > in what way the last patch in the series triggers it, rather than the
> > one that removed mach/io.h.
> >
> > I had sx1 booting in qemu at least, with the omap1 multiplatform series only.
> > If you have a custom config for this one, make sure you get the right
> > DEBUG_LL address.
> >
> > > I'll do another round of bisects.
> >
>
> Here is the bisect for the sx1 boot failure.

Odd, I can't reproduce this at all. Do you get any console output at
all for this?

Is this the plain omap1_defconfig, or something else?

One thing I keep having to apply myself is this snippet:

diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index 0bfad62ea858..87c695703580 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -441,7 +441,6 @@ __arm925_setup:

 #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
        mov     r0, #4                          @ disable write-back
on caches explicitly
-       mcr     p15, 7, r0, c15, c0, 0
 #endif

        adr     r5, arm925_crval

I don't remember what the story is behind this, but I can't actually manage
to boot omap1_defconfig on qemu with the instruction intact.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
