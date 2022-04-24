Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D554FC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Apr 2022 15:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDqy9GjKnTemiTcPvKzPPsTQxDCenQLg+kiarZD0pHw=; b=vcKWLDZIOYSPn7
	HGzEGIfGfICSmp+2HcuYpcc1ww4ryxlSq3zNFIaq7ureCe6BWVtyOwp+mwCzdcTlLbic8yzoPJq/7
	g1hdwfcZ1rN7zsRYm3YAH0UPqqcm+Bo3VzsmdT8wBekrtT1QLsaMyZNIfSv/8qgO+Ra+k1Eg1iArh
	+howajwlA/z+PQejhXdTPwPJbg9CHprYejAalCV77vCDbzX92ZDMsIXiCvneiatdeEmtjDJQIvPYg
	dPI2pRO5/k9m11pwJO8aydwAhgfDVZPtkaArORbUDzjAG9LpAfaWpEOO3JtkTAooS3SWq/W5Jr/JF
	Q6Y3MP0YMwm5W3Y1ZSkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nieBt-006pwY-Ql; Sun, 24 Apr 2022 15:30:25 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nie9x-006pDn-Kt; Sun, 24 Apr 2022 15:28:29 +0000
Received: by mail-oi1-x229.google.com with SMTP id l203so3700250oif.0;
 Sun, 24 Apr 2022 08:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=yr0/AkbMMu8pn1dkU35YlQmF7na7yjrNnK/horRQvq8=;
 b=YTsJBncPwlsdJoy0clMDPkRYsap010NbelrrDwP4gT2p8VkAeOwyCadOMVg4EkLC3g
 BU6v4rcHRP7TcChruJdux/6WqtJmUToOWUlOimc0ldD0p/STL+v6YSxQqTz/SiEj3JGk
 6SfYzDXOC60C+Zk6YtFsjMz2c7gYsvaefbEF/eKAM03STJHCFm25OuC/Z0YH/2cfNqkA
 U538FM4O480tv4oZ6rwPTTcYDvIV4RyyrEvA6n7gY5KKJPB4B+s22HrjImpN8j9osv2G
 SEdJ9k63zxNOgRDgM+KmfcxMquHhbq8CJJjUKerT4sEDujG7ogRPrwOnyNIjdLCE9lFh
 BU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=yr0/AkbMMu8pn1dkU35YlQmF7na7yjrNnK/horRQvq8=;
 b=GFMZEKhblxFuOxvbMuBjIQ7rdzRX/0WOmHOubLvApD4N1D4X8HytGLj7P2XsZnceRx
 xYhUw9+RbK/thFCdR2mfIKKPsrDVhEWiZBXbC527ChENPKQKHt8HBac7+aaduy5ybbLe
 JTeU0YFoiJdfy+wneKiaKhL5uaKv17soIqKPh2i+a0VuN6dX8DRi+cDxW1ynIAatw/6M
 4OTnmTlc5EGlLaO5e2PHW3EJJwr/3pDL0PVcbR23YLhcIZ0gC2ilXgOgUWisSsx4PuJ8
 MI1aOtrKXQ5FtrZhUqb33t/cvHZiDKA3J5C9i8x8QI3n2eV+R3iw5C1bU5toIwexHbl7
 D5BQ==
X-Gm-Message-State: AOAM532xzhXILjEgCnDvY7ywgM2WsBGXtWLXGLsU+Iq4+AKF2kVka9yD
 knX1fQrRfrvOoBHOE+5gskIeUR8UmoY=
X-Google-Smtp-Source: ABdhPJy+gDyQI+jYYZai2x5URiEV01l+fMZDWT8YjU8/GgIriEk0FB5ZVdkvpb6NfVQx+IMk0aUfQA==
X-Received: by 2002:aca:f286:0:b0:2da:58ba:c578 with SMTP id
 q128-20020acaf286000000b002da58bac578mr6576017oih.127.1650814104777; 
 Sun, 24 Apr 2022 08:28:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056830410800b00605b48122eesm53063ott.14.2022.04.24.08.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 08:28:23 -0700 (PDT)
Message-ID: <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
Date: Sun, 24 Apr 2022 08:28:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Philipp Zabel
 <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Paul Parsons <lost.distance@yahoo.com>, Tomas Cech <sleep_walker@suse.com>,
 Sergey Lapin <slapin@ossfans.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, Helge Deller
 <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, linux-rtc@vger.kernel.org,
 USB list <linux-usb@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
 <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
In-Reply-To: <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_082825_769512_ACBCE073 
X-CRM114-Status: GOOD (  29.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 4/24/22 01:52, Arnd Bergmann wrote:
> On Sun, Apr 24, 2022 at 4:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 4/23/22 12:55, Arnd Bergmann wrote:
>>> On Sat, Apr 23, 2022 at 1:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
>>>
>>> Odd, I can't reproduce this at all. Do you get any console output at
>>> all for this?
>>>
>>> Is this the plain omap1_defconfig, or something else?
>>>
>>
>> No, it is my own sx1 specific configuration.
>>
>> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/qemu_sx1_defconfig
>>
>> I don't recall where I got it from but ...
> 
> Ok, that explains it, thanks!
> 
> I fixed all the defconfig files that come with the kernel, but for your own
> ones you have to add
> 
> # CONFIG_ARCH_MULTI_V7 is not set
> 
> into the defconfig file, otherwise the multiplatform target defaults to
> an ARMv7 instead of ARMv5 build. For an OMAP15xx as in the SX1,
> you also need to enable CONFIG_ARCH_MULTI_V4T.
> 
> This is slightly unfortunate, but I don't see any way to avoid it, and the
> modified defconfig will still work fine with older kernel trees.
> 

Yes, that works. I changed it in my configuration.

>>> One thing I keep having to apply myself is this snippet:
>>>
>>> diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
>>> index 0bfad62ea858..87c695703580 100644
>>> --- a/arch/arm/mm/proc-arm925.S
>>> +++ b/arch/arm/mm/proc-arm925.S
>>> @@ -441,7 +441,6 @@ __arm925_setup:
>>>
>>>    #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
>>>           mov     r0, #4                          @ disable write-back
>>> on caches explicitly
>>> -       mcr     p15, 7, r0, c15, c0, 0
>>>    #endif
>>
>> it does not have CONFIG_CPU_DCACHE_WRITETHROUGH enabled.
> 
> Maybe it was disabled explicitly for the sx1_defconfig because of this
> bug. I would think that this is required for actual sx1 hardware because the
> option is default-enabled for ARM925T, and that CPU core is exclusively
> used in OMAP15xx.
> 

That looks like a bug in qemu. ARM925T instruction support is limited to V4T
instructions. qemu doesn't have explicit 5T support. It is either V4T
or V5.

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
