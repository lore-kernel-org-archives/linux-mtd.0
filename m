Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E06FC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 17:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfpFJ4gMizc9RutmsfY7GVfLoYtkjMJiS3B87wBmGZ0=; b=TaVTxUMLFFGiZx
	hQE25l4ecxqgqPP59kzEdRvEYZ+2dHFIckVZdHBup+9obRSmwUi4RM5IY1JkFwj+Xmsi4yvXF1FoZ
	h9zZzvT5EAQmeubh1RiPFPsLJ9YDpGm7P+yejmbF7G75/ibzFj/Uu8jPNO6n4/vALT4sBFOwTNdnw
	c6aQcg3fI7iG5iqKa+3oqsmLOZRZSuhOOo9BcAA7l7qqQN5n0vT5PUWINvbEp8H8wgd2Pn98z0smR
	sGcU2X5AB3g1KFX/c9j2Ymzoth0PlDLQzaN0Noctc0ftLwcX9qAnaCpUBl3NMHiC7fMXBuGgrxJ3N
	dYjKQmVSSO1kHLYOWjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkUje-00C86F-I9; Fri, 29 Apr 2022 17:48:54 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkUjQ-00C7zG-NA; Fri, 29 Apr 2022 17:48:42 +0000
Received: by mail-oi1-x22f.google.com with SMTP id q8so8838953oif.13;
 Fri, 29 Apr 2022 10:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m5t7cdt/CWgC/r7ZaFwRZ/Pe0JhVgK8SGggmxnAqq8E=;
 b=OnQlHi3ErSMC6qSiLPAQK9tsaNNmGUsK/yx8P84vl8ZH25FjCToTTPCP6xYzUtp823
 nQu8zFOChn7TRclx0bhUluxvWGG31ISy3vYfQGsDQqCS3EjmUrqIVRNyq2psGtG3IDpi
 1W6Ytq3a5RYAKQBAidu7fUxQYTQpt+5vW3SEkCPANbWWQlmsLBqc9x1cEkbQPaLnW01H
 /gSIWuD7kQ5j7LODOU/HAxL6B5EQxZzhqJDbdqVUp7cmUle2rokPIwVHwnAzyzTxiKGl
 riWnsbp5SbzhiGJgU3qP8CBvVkoxV+4fTE0nup4rFZ2hllcAmSpZXHHWttMly/Jd1ESk
 NA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m5t7cdt/CWgC/r7ZaFwRZ/Pe0JhVgK8SGggmxnAqq8E=;
 b=aNmLKpwY5SWt5bpPiVNvc5aistLXEqxbl68qM521Wi6pt79ZloGYMWZIT5jxYZxxhp
 FjLlUsa2u2lOwYwO/y2XcpGmmLiXzV1LiukvmtDG1RAXevPCxk9Dbwe59pqM3dLCtiiS
 OGIq3nBv8RbdiJUAeiLLC6QHXRg94knTduZx9F3wuXhRBoe/7d+LflBiozFyR+G3yD5A
 BgQFMfHPRe9qJCamkFIOMhDhqvg4+UJhScdwJHsWNtDK470Wntfeoj2wNjyYosvUCG98
 sogbhsKLjGkZ8aYk4cBVZkpgCLWrB6lLEJkIdAtGlVm8JTOsaWFnAZqWfcy9O/vXalhk
 f76w==
X-Gm-Message-State: AOAM5337SUA1EHZlI2ZP7bFepdyn2NwuZz+KuPfHrDSgPgIjktJBgNNg
 uBp98z7zdcVfdKaO5t+csNM=
X-Google-Smtp-Source: ABdhPJxkF8A90UBe5FIUXgDpVBp8codcF4hzbNyKrz59fIRSWDCgfC0jKHUvcyNxHQ5kW9qHkRB58A==
X-Received: by 2002:a05:6808:11ca:b0:2d4:6861:2a9e with SMTP id
 p10-20020a05680811ca00b002d468612a9emr282421oiv.114.1651254518245; 
 Fri, 29 Apr 2022 10:48:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a9d5d07000000b00605e7b6b19dsm1261051oti.39.2022.04.29.10.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 10:48:37 -0700 (PDT)
Message-ID: <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
Date: Fri, 29 Apr 2022 10:48:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Philipp Zabel
 <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
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
 <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
 <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
 <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_104840_806108_7C733A0B 
X-CRM114-Status: GOOD (  26.16  )
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

On 4/28/22 06:44, Arnd Bergmann wrote:
> On Sun, Apr 24, 2022 at 8:48 PM Arnd Bergmann <arnd@kernel.org> wrote:
>> On Sun, Apr 24, 2022 at 5:28 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>> On 4/24/22 01:52, Arnd Bergmann wrote:
>>>> On Sun, Apr 24, 2022 at 4:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> into the defconfig file, otherwise the multiplatform target defaults to
>>>> an ARMv7 instead of ARMv5 build. For an OMAP15xx as in the SX1,
>>>> you also need to enable CONFIG_ARCH_MULTI_V4T.
>>>>
>>>> This is slightly unfortunate, but I don't see any way to avoid it, and the
>>>> modified defconfig will still work fine with older kernel trees.
>>>>
>>>
>>> Yes, that works. I changed it in my configuration.
>>
>> Ok, great!. I managed to boot the z2 machine with PCMCIA support
>> and it gets around the issue with my patch, correctly detecting the
>> CF card.
> 
> Hi Guenter,
> 
> I have now sent out a fix that I'm happy with, and applied it to the
> pxa-multiplatform-5.18 branch of the soc tree as well as the
> combined arm/multiplatform tree.
> 
> I have not merged this new version into the for-next branch
> since I would like to see if there are any other regressions first.
> 
> Can you run your boot tests on the arm/multiplatform branch
> and let me know if that fixes everything you found? If that
> takes a lot of manual steps on your side, I'd just wait for the
> build bots and merge it after all there are no new compile-time
> issues.
> 

I tried the pxa-multiplatform-5.18 branch. Its failures match
those in v5.18-rc1.

Should I try soc/arm/multiplatform as well ?

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
