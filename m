Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56922C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Apr 2022 13:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5Zy5npCMZyDfAIcEG9GbGPYm5GwlEXmkt7EV7COiwk=; b=yOoGV5BOb10gGx
	IKa6R1KC+YnKNPzQtygydOIxtr0uNhzUfzyTZnH8wcryMGxmaov9JkxPZBR91BSWMFqwB6PWVJlNS
	V+FMflrCah20lPwljDA+6rI5mNWp0yhJZd1RjvHXQdJPI7tXryKSugWPwa99l0YIYA2eUpx57zyVW
	7xuDF8mOaqzXtEaMzbYAgVq9MgqQ3ukKRSWGMhyR0smBhTLxtm9Qasg9TIFbCCXeMd7sLicO1U8QF
	5K5sqE5Pmw3EURMrGV7tM+ytpUxnN+bfu7gpJy2itTKo6YpPbl6Qj54VAa+u3yBFpuXcBSAAksIoE
	Xa5r92rhPy011GgLXykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nknD6-00ELW4-8u; Sat, 30 Apr 2022 13:32:32 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nknD3-00ELVK-9n; Sat, 30 Apr 2022 13:32:30 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MirfI-1oNPos0Cgu-00evef; Sat, 30 Apr 2022 15:32:26 +0200
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2f7c424c66cso110779297b3.1; 
 Sat, 30 Apr 2022 06:32:25 -0700 (PDT)
X-Gm-Message-State: AOAM530WrBKSYPHAj9foNx158qOzq9mVUwft39XBvFMqvQcd2wRZ1wk+
 e+HujISy7FP+LZB3mqDkuK09bedm9EgcBflvCC8=
X-Google-Smtp-Source: ABdhPJyQsAuOXuwqNSnE+0RumiMVY+a1YoHyKhCVHMghGQo3frV3I1QOJWPIvakdR8DFKer+m5ZGRHZJ5RFDwaJx/vI=
X-Received: by 2002:a81:1dd1:0:b0:2ea:c38b:65a8 with SMTP id
 d200-20020a811dd1000000b002eac38b65a8mr3834670ywd.135.1651325544544; Sat, 30
 Apr 2022 06:32:24 -0700 (PDT)
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
 <CAK8P3a05vFdBnXXAMPVS82xX29+uinvWPcWxAgvj0TfoOk+1kg@mail.gmail.com>
 <b13783aa-9225-d52a-3800-c97ad772688b@roeck-us.net>
In-Reply-To: <b13783aa-9225-d52a-3800-c97ad772688b@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 30 Apr 2022 15:32:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
Message-ID: <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
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
X-Provags-ID: V03:K1:0EU4C3mdJlSVn423U1wg8pDWGRFooUoL3n/v4mrwvm8sNv4ZCaA
 +t+rXc4y928weMxRRlYwf2hjoJIkhIg0ND4FBy4eik6j2YrjAyT+n7bYL5Gvjsd0fksQ+Zb
 0267o5T1XSRgyWFlh06ZhW0kTl3EF1FVvBq0JZ1GY/TeLE1OBvEpdoHaxSwIuPC1HB2OcvZ
 08X/y2Y1WNX+3yHoa2CxQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uCx7IqH8l9Y=:1yGouRO0n4ZEoiAEA5Dni+
 6Gnhi6Q7gNirBE4l4YxGeDpK9aupUmbZpogyNNTvQVsq1385APRppI59pFGnEaAc477xIyyt7
 fPXiIOaLctrH6pKvTYudjAj2B4YIeV3ZQ98IHWRPIl2+/ElFsHE6qF9dVqitXA6eR7BL+K5zF
 1+8d5jsEAV/u7x13ZpOgJ8t5H3zagAEasD3556dGq1n4YcBGbPcjvbux+wIGHWCZwNN6vtcSB
 DZJdN7j5Ra2SbYB6H2XOqBypDH6/7jsBv3niXn392VvA5iuiJoxQyFMzMJgo2yUikSe4+BgxN
 s9zU4rGRWzcX7VBKQcHacm2J67uq7xZGIswt+MLTnI+VcsMWoESimM01ov1OQ3cXO4Pala00o
 ZSSsbJerrxXqYOUXwCmyOERlTqQaYfRDpQDzuWm/04fZStN4q9znVhe9bijrwFJyvzaCVJA2Y
 76IUjSyJhmYDTjUnYHh0CEsv6FwCvQGT1bqGCGKN7YMMVDwRkwuanNQNwOHU+smwBSxdaPZxO
 XB5R4xyrPdGz8dnLmfI80s+hq10cSD/deKKY2+F/NlNZ02ec2xkaYIZHyq894/eGNguZJ0UQe
 8M5v9/22rr0rD92FBpcDC2yRWU8P5ajGWLksqjlKLlZH+D/luppJ2cIL5zgcJIMJr9NmtFhby
 URQ4m167kTp5UbShKQKC8DJd9sNjk4WZRvrLFgAgVhajp/GzEW4tK0+xItTQzyXWzw2y0RQhp
 pJtr433O4Lhzx2cQHQHbZ4TSCfhUFtE6lyc021nve4q9ynQaDd2y/yeq0paiRH93RC2AVyrAW
 IBLXF3Nmn0Mudr/qO+O/NN3Nq4S5iLjIuPC6sZsimZji1I4mJk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_063229_668333_883FA3C8 
X-CRM114-Status: GOOD (  20.17  )
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

On Sat, Apr 30, 2022 at 2:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 4/30/22 01:04, Arnd Bergmann wrote:
> > and concluded that it must have done this for a long time. In my own qemu
> > instance, I see a crash from iWMMXt, but that works fine on your machine.
> > OTOH, your failed instances all look like they either time out or
> > failed to find a
> > rootfs. I tried passing an MMC device as root, and that works here.
> >
>
> Booting from mmc works for me as well. Booting from pcmcia worked before,
> so I assume that there must be some regression.

Ok, got it, and managed to reproduce the hang now. My "ARM: pxa/sa1100: move
I/O space to PCI_IOBASE" patch managed to get it to the point of detecting
the pcmcia device instead of crashing, so I assumed it was enough when it
clearly was not. Before that patch, it still works, afterwards it hangs with
"pata_pcmcia: probe of 0.0 failed with error -12" as mentioned above. I'll
have another look.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
