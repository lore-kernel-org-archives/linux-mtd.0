Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367E3C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Apr 2022 08:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OXIC15xnvnl4P+RCtQSaMj3TxGXriZoiK3DdqGVFgg=; b=GpJZEvjid2SuXl
	rahwSghnSC+crgXOxNlJ7Bwtq7x3eUm64nXxJqsqbaiRMx7CYz4ms1JXgQe99g5+flKJa4HVRlT6W
	5xCjMvYHz/UqWlS2O7VZDoqm9p0B4BfIFaWGTL6NCidrmbSckAG/EopLgYqSlnwqSgIDW+MXc/Jx6
	XgVC4+9jI5yc32MsV/eh52PMwLGB1lgdQqayZdywrCSctFEVQL5kFVOH6gd/l6GeUtMmqScnPpiWo
	c7SRSsUcQLAwiNLMVlQuhfGo8qtl4u0vf5eJhortYM3OaPncLid1gmpxTTekDhFklHn4sXrfKabPl
	823nDUVmb9P96MeyjCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niXza-006BA8-Q9; Sun, 24 Apr 2022 08:53:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niXzG-006B25-A4; Sun, 24 Apr 2022 08:53:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 124EFB80DDB;
 Sun, 24 Apr 2022 08:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAD1C385B0;
 Sun, 24 Apr 2022 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650790374;
 bh=VAIS5RCD9giYhrbO5Hac6FpKh7We3My7pPHwyo54GI8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IlEUmxA7Upi/jZvwszo5tWXIcRM0EAFPHSwLNctN9Y58IvDFrOEsiQajUPCMH7Jvj
 ffMGYU3Am1eiuRxan/QEzVGZIU4/nZDiD4I9qyEihHwFs57oDBFuZkioK/aaH82E/D
 cafv1RJevyhRqAmfrOprDhzFhC5PdErVyqMypulLdZQgaDPE2OydWwwQC4+yvZmqbe
 cKfnbHuByU+9iCxgB+9sW82eJWEWf6s1YXcaaJOKEOR6FMrQj52g4nRCkxQaL9o5DE
 hRPjDgGmvEn6UrlX0oEzCHgEu1vF7VzmeRUbf/lMOXmL9MVlUAWdZQ45wrK1ipQsiq
 1YeW3uUpHXgig==
Received: by mail-wm1-f42.google.com with SMTP id y21so7552262wmi.2;
 Sun, 24 Apr 2022 01:52:54 -0700 (PDT)
X-Gm-Message-State: AOAM530XQEw+uUHcOq3TQ4d/yBB+4KILD6xAHaUsoEvRnb9NqFfXsT5B
 hzSTMcxSgCMMrT9b4zqst4U9v8FF809MPDNf3LE=
X-Google-Smtp-Source: ABdhPJwWxQyFReh1xxhP87snsCB/AySgR1dxVTGy6Gpi4+Uz2ZZzeirzOgx8S2o3MdbrdLkLr/78d+DVsl9RCKwJ5Q8=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr20347843wmc.94.1650790372472; Sun, 24
 Apr 2022 01:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
In-Reply-To: <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 24 Apr 2022 10:52:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
Message-ID: <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220424_015300_881430_0129AB14 
X-CRM114-Status: GOOD (  28.49  )
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

On Sun, Apr 24, 2022 at 4:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 4/23/22 12:55, Arnd Bergmann wrote:
> > On Sat, Apr 23, 2022 at 1:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >> On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
> >
> > Odd, I can't reproduce this at all. Do you get any console output at
> > all for this?
> >
> > Is this the plain omap1_defconfig, or something else?
> >
>
> No, it is my own sx1 specific configuration.
>
> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/qemu_sx1_defconfig
>
> I don't recall where I got it from but ...

Ok, that explains it, thanks!

I fixed all the defconfig files that come with the kernel, but for your own
ones you have to add

# CONFIG_ARCH_MULTI_V7 is not set

into the defconfig file, otherwise the multiplatform target defaults to
an ARMv7 instead of ARMv5 build. For an OMAP15xx as in the SX1,
you also need to enable CONFIG_ARCH_MULTI_V4T.

This is slightly unfortunate, but I don't see any way to avoid it, and the
modified defconfig will still work fine with older kernel trees.

> > One thing I keep having to apply myself is this snippet:
> >
> > diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
> > index 0bfad62ea858..87c695703580 100644
> > --- a/arch/arm/mm/proc-arm925.S
> > +++ b/arch/arm/mm/proc-arm925.S
> > @@ -441,7 +441,6 @@ __arm925_setup:
> >
> >   #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
> >          mov     r0, #4                          @ disable write-back
> > on caches explicitly
> > -       mcr     p15, 7, r0, c15, c0, 0
> >   #endif
>
> it does not have CONFIG_CPU_DCACHE_WRITETHROUGH enabled.

Maybe it was disabled explicitly for the sx1_defconfig because of this
bug. I would think that this is required for actual sx1 hardware because the
option is default-enabled for ARM925T, and that CPU core is exclusively
used in OMAP15xx.

        Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
