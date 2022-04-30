Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C679FC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Apr 2022 08:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YAI6pNHxTBUdnoyru3JM1wuYtPYTbOOKOgLCo8Lll8=; b=XsMTS5FPP5EJzs
	LX3/rlabTfN8N17MIWUJ7+SNez0zv4mTNnaa3l1MddoTtUsAMHTKgiMTEGhnj7W7MS9kFEsm1k2DS
	AtWdViI0+rpZRajJ5ZGftwZ1yUPnALT7sWyIlRthtXP4AuB0aCAzEAz2JauODtHgft+NG/gSOysHA
	frxkw1+HS2xSGasQtjrZs5+CnfjpzohAz6ZPSzhpjWPKKpMDtD55AuzVJYhH54aXMcT8/V02wpemi
	DEazIku6zkdwG1OI+TPKxOH41XsSho+Tg1MS79bSN+DuZZWEemVWr5VcGIPhP0m4kYDHwmWHMtNXV
	8yi563LBK9u9s/438AGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nki6W-00DsJY-Li; Sat, 30 Apr 2022 08:05:24 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nki6J-00DsEw-Gx; Sat, 30 Apr 2022 08:05:13 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N94FT-1nxPJm2pDL-0167Rn; Sat, 30 Apr 2022 10:05:05 +0200
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2ebf4b91212so105949137b3.8; 
 Sat, 30 Apr 2022 01:05:04 -0700 (PDT)
X-Gm-Message-State: AOAM532wcsT1WNn9As6guc8gn4JIngPn4m91pvUz5szeuOi/M5wLDeW5
 VHphF7MWcxLJY02PRpkzp52w/4sYUSvGNukAIc4=
X-Google-Smtp-Source: ABdhPJxIMDnLMjNypqGxsmgcfR7ZUL75Dsm3yzSBDwMin5TKOLRH68mEJhbPriu8EYo0bqonSau57unAkS8+mfbVn7s=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr3009265ywf.347.1651305903889; Sat, 30
 Apr 2022 01:05:03 -0700 (PDT)
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
 <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
 <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
 <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
 <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
 <149509dd-f43d-1b27-4395-81eab4ff3455@roeck-us.net>
In-Reply-To: <149509dd-f43d-1b27-4395-81eab4ff3455@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 30 Apr 2022 10:04:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a05vFdBnXXAMPVS82xX29+uinvWPcWxAgvj0TfoOk+1kg@mail.gmail.com>
Message-ID: <CAK8P3a05vFdBnXXAMPVS82xX29+uinvWPcWxAgvj0TfoOk+1kg@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>, 
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>, 
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
X-Provags-ID: V03:K1:GNRmX7cWbxVoxNx926s0XDVSxUHUYMbRjiCfaSPKHMz6+QFlBfd
 hy9NLErZUoY2oS9Ib6PGEIfZdxTL0yg0c3Knrmw3pnB9B0F7CI5lYuVNu3gZlqYau9wbdl5
 ecXvrPleTJaq1a+qSth449nuamajbgmnXLsxT0xC4dPdhT5G5NNse3Wgnb8IFKRP9iVyU1Y
 LCBcmykMXdJB+Dc8mjD2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Sa/dJDd6XzM=:ie8WuqpzuwK7Rsu/sj7rlM
 jgPK/tRCMELhmdcFpPfiqfnI5TsgTWpqSAKoa/AQjkaOkvPIC2xI6V0IonDYv9kIqVJAbPTlf
 4usZ8797dWCdf7kR/uioF+0SF77iMh1C4OuJqDnn85vhNMMHe5Z4a9egEtJZjazoJI1yyhyZm
 YouLoAx3jaN12Aq16OsvSBUkBShJOn7jwFySeW8bWYi2IUfTtoZHJtXsD8LZSnTafw8HwKfgh
 /Y4c79UIIBngeAsbt+WW+7NbYOve6PH2R+R8czh7sViaNh46TvT58hRhejt/hzYHZC6+sMPeQ
 9WJmwIKiWCUT82I28Q2nNknsZuvCu0uB7hZeuCQkscT+RsBnEGBrnwQotyntpIbacQB7l0c2U
 Wi7fJ8UX1Y7PHjTUOazjp4MVCbv+dU8WaRnzNBewu15Kbq4GalqovLqmfMWRMSMsilbynDuzz
 RLasMJQQMCFOf3TFlmX9XrYYFHU45F2tLJfN1Z4oFfSKf9nIt7v5FlwahYRMFdg3D5A0156WA
 4x0p04h2Nw4i1JVvJ6VNi+4vl14lajXyowRsnHR3fQY7VQDgReCb3qHHPCmi05/2A8dqF5uJa
 MA7Oi8/VoYLoVZ16YEh56S2n6CgmI5DQ1rzsPPB8R8M9pqVA/1LN6Dl7xSyrxa94fPbiVn6wS
 uNU3Itubkh1xlypQzPwZHm+1UgNKxdUSX+ipn1pSCRxzruCqHfHXy+RAqjgMi+bty2jLGVOtw
 gRnPLX5KdkyIrd8CFzgza8q+iDeWFKZ0cHWO4riKZSQ5mMOIURgmUD+GBlFQnA5IEnksPKeSR
 lMYhiL56AiCT35RcyTrI2c/hkga6irgtIhR2k+p///TZhw/fQQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_010511_907561_5EA83699 
X-CRM114-Status: GOOD (  29.79  )
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

On Sat, Apr 30, 2022 at 1:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 4/29/22 14:46, Arnd Bergmann wrote:
> > On Fri, Apr 29, 2022 at 10:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >> On 4/29/22 10:48, Guenter Roeck wrote:
> >>>
> >>> I tried the pxa-multiplatform-5.18 branch. Its failures match
> >>> those in v5.18-rc1.
> >>>
> >>
> >> Uuh, wait, the build wasn't complete. There are still some
> >> failures. I'll report later.
> >
> > Sorry about the breakage, I got a few more reports about minor build errors
> > and warnings, the newly uploaded branches should address all of the ones
> > I got reports for.
> >
>
> Unless I am missing something the failures are the same as before. See
> https://kerneltests.org/builders/qemu-arm-testing/builds/74/steps/qemubuildcommand/logs/stdio
>
> This is with v5.18-rc1-49-ge8ab9a9a2745 which is the tip of
> soc/pxa-multiplatform-5.18.
>
> Should I check a different branch ?

I only addressed the pcmcia probe failure that you reported for the
final pxa patch, which
previously caused a NULL pointer reference here:

[    1.405319] PC is at pcmcia_init_one+0xf8/0x27c
[    1.405476] LR is at devres_add+0x40/0x6c
[    1.405611] pc : [<c04bdea0>]    lr : [<c044d808>]    psr: a0000113
[    1.405846] sp : c48a5d00  ip : c15f4220  fp : 60000113
[    1.406026] r10: 00000000  r9 : c48b000e  r8 : c48b0000
[    1.406195] r7 : feeb0000  r6 : feeb000e  r5 : c15ec090  r4 : c15ec020
[    1.406395] r3 : 00000002  r2 : 00000000  r1 : c15f4200  r0 : feeb000e

This now seems to work:

[    1.435846] pcmcia_socket pcmcia_socket1: pccard: PCMCIA card
inserted into slot 1
[    1.456350] pcmcia_socket pcmcia_socket0: pccard: PCMCIA card
inserted into slot 0
[    1.457489] pcmcia 0.0: pcmcia: registering new device pcmcia0.0 (IRQ: 217)
[    1.460275] pata_pcmcia: probe of 0.0 failed with error -12

So it sounds like there are additional bugs that I have to look at. I
probably won't
be able to do that in time for the merge window. The logs contain a number of
warnings, but I have no idea which ones of those are preexisting issue. I had
a look at

[    0.689982] pxa-dma pxa-dma.0: error -ENXIO: IRQ index 1 not found

and concluded that it must have done this for a long time. In my own qemu
instance, I see a crash from iWMMXt, but that works fine on your machine.
OTOH, your failed instances all look like they either time out or
failed to find a
rootfs. I tried passing an MMC device as root, and that works here.

         Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
