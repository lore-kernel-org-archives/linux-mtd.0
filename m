Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F128DC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Apr 2022 22:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVJvBEeiqp4F7gpGueJspvOfNLbfR/f9drUWljY6Atk=; b=Fvvk12CoD4lWLe
	iHjocuP4to8ahiz/7VhX8TdFLdsh61S976+rWvzEFeZZZzdxhpWXGU1VpVfq4ZSrIoUGb1C90Yl5p
	4ad52grc6IV1RWwoKmZ2CtNbbY6o1VrjjSpA+Q0345GdSVAF1vm8gLOdJzHTsRd1OBbO8u4orist1
	UVWUqddVnGFwWV9I1+yHaBPrwwBndCqPf2avAB7UwNwAYDhMyHpXg6wqMTB1nf1TEOvrh5WqcNF6d
	XnIi9DSkXpEKwCKNcQuNcHYoGoZUyCvvpdTQ04+cbdO19GqoAJULrubOI0uUIWR7CH8tFngv2GuNU
	sTbC1GTVL9PjnWCtx6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni1Oj-002e66-RV; Fri, 22 Apr 2022 22:05:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni1OV-002e1U-8W; Fri, 22 Apr 2022 22:04:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96C4A6206A;
 Fri, 22 Apr 2022 22:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665B8C385B6;
 Fri, 22 Apr 2022 22:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650665089;
 bh=zuNw6j1TShfoNbLYYIZxrZxreBGq9IdbmgqrCDzwCoE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GJHnYGm7kS7OYKfkAu61QcQIzQsPpKgiX8ZwFOEZB2cc8bdXfKuICeePb/LdLDWns
 VNg0u6qUYqau/LeOFrayBulaQJxkihHPe/A2FqLymKPNdePaoUDSIGdGevpo7L/zJM
 aFPhStRd09KzzfNR1joe6PwVDpjMzpbeziX7fgPmvokEvCi/0oFrjnwBTaaGfP/BOU
 IUNNTQDtVNPw7mpJSpA99kiRdBDjanYdKye5l82yB0eqq3zLotqrujW7fvCIf2Ejkd
 dAqJEF/tV2gwSfcpwtPVTrB+Lh9rnVah9UvWO9BhrH9MflpU1vh20qiOa/U8KRRaYH
 giaZNTf1zCHIw==
Received: by mail-wm1-f47.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so8811837wma.3; 
 Fri, 22 Apr 2022 15:04:49 -0700 (PDT)
X-Gm-Message-State: AOAM531QEcO9fV1UKU4mtEn16JhIgBIoYKpfZ1ii7YeP800M7EhGHeHm
 cx5TdEvSGy4uxQ1lGhabkVMBFbtHcroSdiGrIwQ=
X-Google-Smtp-Source: ABdhPJxxyzPCyBaxXq4e/OKv6ds/3UgnpcR0jFo6uX7QoEAMCxGf0GP6zkRcnylbgWRsSBmj2Bdv9puvN/pDeVMDIcQ=
X-Received: by 2002:a05:600c:4ed4:b0:392:90a5:b7e6 with SMTP id
 g20-20020a05600c4ed400b0039290a5b7e6mr15508304wmq.33.1650665087477; Fri, 22
 Apr 2022 15:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
In-Reply-To: <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 23 Apr 2022 00:04:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
Message-ID: <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220422_150451_452919_B53DA6A4 
X-CRM114-Status: GOOD (  21.11  )
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

On Fri, Apr 22, 2022 at 10:55 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 4/22/22 12:16, Arnd Bergmann wrote:
> > On Fri, Apr 22, 2022 at 7:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > Which machine did you hit this on? Is this on hardware or in qemu?
> >
> qemu, as always. borzoi, spitz, terrier, tosa, z2, and sx1 fail.
> Also, I just noticed that the failure is not always the same.
> z2 fails to boot from initrd, and sx1 fails to boot completely.

That's a lot of machines failing, I hope at least we got the same bugs more
than once here.

For the I/O space, I found now that PXA was not using the standard
virtual I/O address yet, but instead used a NULL-based offset.

I'm not entirely happy with this patch, but this is an outline of what
I think we need to fix that: https://pastebin.com/3nVgQsEw
This one is probably incomplete, at least it breaks sa1100 for now,
and it adds a bogus CONFIG_PCI dependency. I'm also not sure
in what way the last patch in the series triggers it, rather than the
one that removed mach/io.h.

I had sx1 booting in qemu at least, with the omap1 multiplatform series only.
If you have a custom config for this one, make sure you get the right
DEBUG_LL address.

> I'll do another round of bisects.

Thanks!

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
