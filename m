Return-Path: <SRS0=GZUv=YM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12099CA9EAB
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Oct 2019 10:09:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E7F21D7C
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Oct 2019 10:09:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I96b7ReA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96E7F21D7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xAny/uyEEbLRoxdqM547VZCnYk6bKTm4NjMgC1pJY4=; b=I96b7ReAUL2YZo
	3Y33RduwuFu/YZug5Qv4ykQq5poAIsF8mc41rHzAzKrXlRLxUw6IFEWA88A79dkmKR7BmQ6bJqFZz
	HeVje06LF6/EousAc9j/UnkIlmcsh5pZLrcVActXLvJnIQr2xQP3G9gzoRqtMmsekRWdBt8Hv5A09
	P76J7RytJW1rhpfOhHNchkP1iFam/bmC6fbL0C6xN+PsYg3vqbrrOQ3A+5QTRhRgfN0lbnrFtxyS/
	RF17oDnaBKxvXD0yOxcjie3hlscNt76ofXWunVCXxTQd0CCjTH0k9eQ6Xo1XPxZMQqvYzyVGmfP+X
	IwILqu040yxcycqE93Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLlfU-0006qU-04; Sat, 19 Oct 2019 10:09:04 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLlfN-0006lg-S3; Sat, 19 Oct 2019 10:08:59 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M5PRT-1iN9F50own-001OOA; Sat, 19 Oct 2019 12:08:54 +0200
Received: by mail-qt1-f171.google.com with SMTP id c21so12872483qtj.12;
 Sat, 19 Oct 2019 03:08:52 -0700 (PDT)
X-Gm-Message-State: APjAAAWOAHxZfdHrIp4Xc1vRDRMeSsysyRc9yeRyHXPlkZH7/2BcwavV
 6kUpd3sU1J5MuFeX35hJh1GOXFd5m5EEh+DyaVs=
X-Google-Smtp-Source: APXvYqx0KL/4UEXxK6gF6MT84x40msmTgoc3wUmUnzQ2wz5CAlnxhFheu9zzXtORTNxkRfpad8/dgIDVulcScXUuQ7U=
X-Received: by 2002:ac8:33d4:: with SMTP id d20mr14268876qtb.204.1571479731943; 
 Sat, 19 Oct 2019 03:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de>
 <803f6fa5-b929-007c-5302-4a2d5042241c@roeck-us.net>
In-Reply-To: <803f6fa5-b929-007c-5302-4a2d5042241c@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 19 Oct 2019 12:08:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3gOn6qkvvKaBzqYUzZToMKv3E587_8fQHmaF2u7erd5w@mail.gmail.com>
Message-ID: <CAK8P3a3gOn6qkvvKaBzqYUzZToMKv3E587_8fQHmaF2u7erd5w@mail.gmail.com>
Subject: Re: [PATCH 00/46] ARM: pxa: towards multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
X-Provags-ID: V03:K1:ADUPOA71xPUayYJhitm++6aCsJepG0J0hKYF2rGg49y72xr3K7k
 6bh2WH8JAkT8YGsKAB+4TYKTYYfsIbNzNxctGumhnzKxt/wCEHEMKIdKrtZYT4QczBP+bjV
 dmigIOKaXQL9THcyCnWES54YRt6eJ8z1tzaUlqBoL59/m0/OdLCDKcW2TTrmx/mZcJTukwB
 FH4gGF/YPX5nGV67MRrQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cTnHUQ2c7rQ=:1NC4gfpagxuqo20u+bxaBO
 Q0NmJX8JXFeNe1ypcCgo0wqOyW5OJ4mRN/TSn9r50gMiboF5ovuHaKQw/BOSg9O4Mel3voXoM
 pIEQuC7XOi0GZOYQBLDsG5TUpvfOAIfm6MyBDZw/sUG7xwONut/D4TEFpE34wEJJ6VieBOXY2
 U1LcwNCszBHKQqhX/jTzmjzgaPCdom3HaD3uG0s3MJGgtr+HTSZUiK0a4bGdCUdKQQgNNY9Z8
 df2cYrj0yKE9AQMjgtE/UKa85tmTGDv9xEb8eLDxm1pPr3w3QTXj4+HKg8Xq6zzkIH/TF+lH3
 PjCHlxW9Ecn8mO7KA33OJs6lLT5CeceFYD+s+tD4Bb2XsykBGiZ/gnJtQ3Mmc2gcnA6d39FPO
 pN65tvBtMi0qTsUJ18oNQsY3za4/xV6G7aRDNWA/uGqmksjLOkGF4nQO5jSh2haPDQtXUxBRT
 C+uHfSxwdJxzDD8/7C0AWslZotOcnhFdSEjrnM9BFE30UR/8cXwUM6IQ/sPI2uu/EQ8hYShFp
 K780qYiBcWWbAlkGTzyR5ylyaZRJfe9nYOx3hsu9QjmiK/zhze6CAn9J4SEPPg0j6+ZzlZH9L
 BVBOzk03p6yZ9P+vydwtFxj958nGGdQubBFFFKm+Y83TGEanF1DN53qaBK/fUsAtEJMmIzC99
 eJ91+2iQu6M1Z2qlDW2SBrqkAl8cc/dktu6ZCbrhPz/9VE1GwV5Hns6ber9MvjXsGvDSCA5hw
 n3ZOx6HDc0M+NU8CEPrEdhRdfpHi4jRfOPrqmHaVkInwtDkwtEeMeqbW3CRzKB46sWwebRP/3
 piq8DoF80l94cBMfbGrcTi9SbHNZF/ZBHOGJAyQEhU4u6/2Fd4HQvxLnIOqsqQ85BLNqAPjE4
 XeMB5CFR9ermdb79qtGg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191019_030858_203045_C7E516B3 
X-CRM114-Status: GOOD (  18.10  )
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
Cc: linux-rtc@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, IDE-ML <linux-ide@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, Daniel Mack <daniel@zonque.org>,
 linux-leds@vger.kernel.org,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Oct 19, 2019 at 3:03 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/18/19 8:40 AM, Arnd Bergmann wrote:
> >
> > Hi PXA maintainers,
> >
> > I'm in the process of getting the old ARM platforms to all build
> > in a single kernel. The largest part of that work is changing all
> > the device drivers to no longer require mach/*.h header files.
> >
> > This series does it for arch/pxa/.
> >
> > As with the omap1 and s3c24xx series I sent before, I don't
> > expect this all to be correct in the first version, though
> > a lot of the patches are fairly simple and I did exhaustive
> > compile-time testing on them.
> >
> > Please test if you have the hardware, or review!
> >
>
> I don't get very far.
>
> $ make-arm pxa_defconfig
> arch/arm/Kconfig:677: can't open file "arch/arm/plat-pxa/Kconfig"
> scripts/kconfig/Makefile:90: recipe for target 'pxa_defconfig' failed
> make[1]: *** [pxa_defconfig] Error 1
> Makefile:567: recipe for target 'pxa_defconfig' failed
> make: *** [pxa_defconfig] Error 2
> $ git describe
> v5.4-rc3-52-gfcc4181cd625
>
> Also:
>
> $ git grep plat-pxa
> Documentation/arm/marvel.rst:   arch/arm/plat-pxa
> Documentation/arm/marvel.rst:   arch/arm/plat-pxa
> Documentation/arm/marvel.rst:   directory. The plat-pxa/ would therefore disappear.
> arch/arm/Kconfig:source "arch/arm/plat-pxa/Kconfig"
> arch/arm/mach-mmp/Makefile:ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/arch/arm/plat-pxa/include
> drivers/gpio/gpio-pxa.c: *  linux/arch/arm/plat-pxa/gpio.c
> drivers/soc/pxa/mfp.c: * linux/arch/arm/plat-pxa/mfp.c
>
> Did I pick the wrong tree ?
>
> Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
