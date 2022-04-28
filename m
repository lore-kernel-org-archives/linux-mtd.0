Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C842C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Apr 2022 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zhPpP8yUS8OWOa/vQAKSTfrAO4PabtrmERNhYAF7i8Q=; b=eWBvPKjpMq2EwW
	5znPD99Kkm8xJxbvU1zJ/nSU28qcC+R9oy/Pxly8CSD2TN+2G5W7zYau9arl9fTOlEdBz2p66L+tp
	lDpRHYwUHpbP3IvUkUWRQDxt0rM3mhYMrhLlnutray27lpZZgLqKufkY5NDOpEhVdxhb0GML5FGzc
	2+u6iGxXkSfrFCS+4NyqTG5w6xLpWKtXNvrlyOcFnLSlxKsRawXkpAZ/oS5ir8+dWVjk90e2CvEDd
	2usbqPURaQN+Ks6oLWiamgTjXF4CWcrtOqvvhKtJmMQK4CHStxFLjchN0NVDK6t3pqvhFF64/kt/S
	VlAPGRSf8IbF+6QVTTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4fb-007GXt-92; Thu, 28 Apr 2022 13:58:59 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk4SD-007AM4-MD; Thu, 28 Apr 2022 13:45:11 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M8QFi-1noSAq3GG8-004QIo; Thu, 28 Apr 2022 15:45:04 +0200
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-2f7bb893309so53166397b3.12; 
 Thu, 28 Apr 2022 06:45:04 -0700 (PDT)
X-Gm-Message-State: AOAM533L54BAxwcKYLhxjj0ZmqukdmGZsBIkKUAlzfN/oDJdbojJRL2X
 oTl2YFOwvTsQmiemVzBfVgdDl2Kp0CyTfz7dhJQ=
X-Google-Smtp-Source: ABdhPJzhKdbLezBOw+onlWys2HjSNrb5hSb6f6j0ogYNPd9ax1npbHyo1Y6CrpuYIOWED3Pgr1SGQ4YvAKDaJmP/tmM=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr33063062ywf.347.1651153503029; Thu, 28
 Apr 2022 06:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
 <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
 <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
 <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
In-Reply-To: <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Apr 2022 15:44:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
Message-ID: <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Marek Vasut <marek.vasut@gmail.com>, Philipp Zabel <philipp.zabel@gmail.com>, 
 Lubomir Rintel <lkundrak@v3.sk>, Paul Parsons <lost.distance@yahoo.com>, 
 Sergey Lapin <slapin@ossfans.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Dominik Brodowski <linux@dominikbrodowski.net>, Helge Deller <deller@gmx.de>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
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
X-Provags-ID: V03:K1:lQ49Wz6MxxbXTsE5mSp8wTwH9h5tNb2lEEUge3IgjygeQ8PJmLQ
 639iqK+v5a4KkwDMkHjWKOEAEyn95V9sJ0F6ALEx+VMHmE+W7yPdx4ZpP8Gh+JVI90WaAgz
 8Om2v3pTmB5Ga5QyC+QFb5cMx+taHB8961UxXJculXaoWHDL+6kBWJZKlTvblk+4nPNckd7
 1mLTmvC/UZjt39TcQ1q/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3cAH55PbbTY=:OAh3rwvNn96OmO0gdIKOjq
 Br6z3YWl2ZGfzLqzNDUbqDZ4nE2vBOkI52YLXSHA5NAg8LAOn93EeLov5YSWGZsUHW/le+jBe
 snXF5msP4gN/2UHIWCfLpLOdxIsiS7Oj+PJdE+xd8PKv5sENJJq07z9dl3FjQhz5UDf0ZESbB
 P1wTW00E4pS/b0k7AreU3FE05kQIlqRyKQWaeu6lLtlK0ltXMuNKkRRENtZF7Gsh8K+wpYaQl
 JZs8A8stxfOZcr4EPP2CI8RSRVEfwR4qZcX0FrQwN5MdvJubQH0LP8qXnHKdQTbzG6sD2R7UC
 qMGlN+05lAvjUN3fy528hoOdIoA3f704jjvRXqGiSQqiKcBTL/rhDI46vwr+5E6pGUD0YrKBL
 gu9ZrjF48i2Vuqpn24kyy8z2SGg13GLxBgcgDMlCAQatA+96Bb9SXWRVQW9QtUUeJ4vHAhcAh
 X25qdWje0IZP2ZNvIcBfGf7SbXxwgOhSIYq8AMx5LKS1CcVCpUPuox2HQygYYk2uv3WbDdQNx
 Yci2YZyK/XTUKUmm4/jarRFrEEHfBgXZA1lPV3JqVdlxCTaCIBWJJlFDCBJ2Vs/gCif0GPN8J
 BZJqpQPzZ9Mz/PNNJlyWwwTHs+/3yzyvz8ecR1N8LMIkuEPiNrVRd9h6hYqmWVOdPjKADM7xw
 D3E8pXHtbaR/iu8ybjMT7DVG1DbVqt1smTq4H3HgfOWQo6fE0ogzC0unksaHcXBherxRX0PYr
 WBJLaGUDQJTGC9Dk2jDkZu4QlWCXTLq+VYENwOCYbwEdUmhJFKSeXp9mNBC/B9TEIEsJPK5Ju
 4Ka3QyvoWiYvgBhv9ha+O92uTka/2+JYYbMdmTkPbf0hgCgpvs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_064510_107350_1F3706EA 
X-CRM114-Status: GOOD (  26.65  )
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

On Sun, Apr 24, 2022 at 8:48 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Sun, Apr 24, 2022 at 5:28 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > On 4/24/22 01:52, Arnd Bergmann wrote:
> > > On Sun, Apr 24, 2022 at 4:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > > into the defconfig file, otherwise the multiplatform target defaults to
> > > an ARMv7 instead of ARMv5 build. For an OMAP15xx as in the SX1,
> > > you also need to enable CONFIG_ARCH_MULTI_V4T.
> > >
> > > This is slightly unfortunate, but I don't see any way to avoid it, and the
> > > modified defconfig will still work fine with older kernel trees.
> > >
> >
> > Yes, that works. I changed it in my configuration.
>
> Ok, great!. I managed to boot the z2 machine with PCMCIA support
> and it gets around the issue with my patch, correctly detecting the
> CF card.

Hi Guenter,

I have now sent out a fix that I'm happy with, and applied it to the
pxa-multiplatform-5.18 branch of the soc tree as well as the
combined arm/multiplatform tree.

I have not merged this new version into the for-next branch
since I would like to see if there are any other regressions first.

Can you run your boot tests on the arm/multiplatform branch
and let me know if that fixes everything you found? If that
takes a lot of manual steps on your side, I'd just wait for the
build bots and merge it after all there are no new compile-time
issues.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
