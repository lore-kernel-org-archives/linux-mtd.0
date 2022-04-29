Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE171C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 20:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vyRi8uk21uoq8Qci6gDGWj5NrTE34jGjjXTz/02m/w=; b=SUU9gN3auOwMjR
	tUsfLqJ3lwFGuGjMGClW8wg4A0cDizFM83MYApHvOj6jxeY3olMoUBO66kGe8+Blo5DjZhCu7sYAU
	AF39O0d0daBIR3vn5ReN9WhYyt08ycodts7CnFOEjoIjVUvBHFrDlk/ioDow3xFtbLW2Z4DexgCN9
	Afd3OKPsiQKxivdUQAQzW6erO/7q6RxPEY5JFq6hOe9FIZu1EA2TWjxgobYCkNfWDGBbw5m+BZwA+
	aasNFW3VSAAmzDYhxL7HbPjykXiUDRx4IhDnNKFOHW/j1LXvKm9d57i8BRmhzeLI0gkmRQlvaxXdO
	lDT88fDqhMbZDZFmlHaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkX9u-00CUNM-My; Fri, 29 Apr 2022 20:24:10 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkX9i-00CUHc-0u; Fri, 29 Apr 2022 20:23:59 +0000
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so9211870fac.7; 
 Fri, 29 Apr 2022 13:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=SFIOKWJe2JhWRyQ+23tvbYEj6baZGKnP/u3z5kRMOi8=;
 b=BahK7/YeJ4+uX3TzsNp83MyBHnpLrE/qMu4xIBQ+ZS6zy01DaiHuUoeMxTPloX76K5
 Ubgax4WkYffJVNJHfHbej2xMadXBqbARWF06vNjo4iI2fpzfmtqnvbFUit+eVhoT1JhV
 L/oOL5XftssttI+3dl8EE8ip+1SLDGWPYT/KGiBuWq9m2dSZpPqkNlOUQZQhXWucL9yn
 1fTqb9x/Wr6wFFu0woyAx4hT7nL1jqWbVXQZqXhqHEX6+b6K6K/EYkfUjIg0dufd9cmz
 QpF+Wag/CjwN6tGuBEbwsUj/v1JxGTP/6FWWqjwteWqgFXZ5FfZeR3y6GbuGNkqHg17F
 kvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=SFIOKWJe2JhWRyQ+23tvbYEj6baZGKnP/u3z5kRMOi8=;
 b=VfZsMNZ3SQ4L5/fVIhRfH6tH7vSffROwV3ZtT/C22qfxhBpRuutPxIAcfDfrxr5V8K
 cB7oW5u7grODYSjgGXb9daXu8WdbVvRG0IXp/hBRqSiyVWr7Do69e+eVyV5ytOyBdb5R
 0f3z+rYb+Mt0ZS1qkye5tyLhq9XWUq236AY/232ZyfmMexB3Kc3voNecFIJUQxdGD0D3
 IajvEiTgMQ4pAjml48olN6noVzIXY3XlNuPoaB6CBVvCt64sNArbug7SCYa2oJRuy1Hp
 MubtnCiRG4Jb0DvQEIM+fzOnPxtyMzTrLJXav0HSh38NxOldrY4dGiK8f8AEl37dx8cr
 bdcQ==
X-Gm-Message-State: AOAM530NSq6FIoJXB88DzTBY5FTPBQ5Nb+LeYUS8ZZcVsEPikMGLKa+4
 dz4EDAKr+yjeWsjA/bTb7/k=
X-Google-Smtp-Source: ABdhPJzws2nk+8IQUdLMQ/UW+L134oqTe0mAkrmJ+izKxrmouBw2DYvgJERUyyz49n7YZEOnnZehOg==
X-Received: by 2002:a05:6870:60a1:b0:e2:b6b8:3e67 with SMTP id
 t33-20020a05687060a100b000e2b6b83e67mr2057906oae.137.1651263837158; 
 Fri, 29 Apr 2022 13:23:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a4ae28e000000b0035eb4e5a6cfsm1153965oot.37.2022.04.29.13.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 13:23:56 -0700 (PDT)
Message-ID: <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
Date: Fri, 29 Apr 2022 13:23:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
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
 <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
In-Reply-To: <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_132358_113557_F457C3B1 
X-CRM114-Status: GOOD (  23.73  )
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

On 4/29/22 10:48, Guenter Roeck wrote:
> On 4/28/22 06:44, Arnd Bergmann wrote:
>> On Sun, Apr 24, 2022 at 8:48 PM Arnd Bergmann <arnd@kernel.org> wrote:
>>> On Sun, Apr 24, 2022 at 5:28 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> On 4/24/22 01:52, Arnd Bergmann wrote:
>>>>> On Sun, Apr 24, 2022 at 4:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>> into the defconfig file, otherwise the multiplatform target defaults to
>>>>> an ARMv7 instead of ARMv5 build. For an OMAP15xx as in the SX1,
>>>>> you also need to enable CONFIG_ARCH_MULTI_V4T.
>>>>>
>>>>> This is slightly unfortunate, but I don't see any way to avoid it, and the
>>>>> modified defconfig will still work fine with older kernel trees.
>>>>>
>>>>
>>>> Yes, that works. I changed it in my configuration.
>>>
>>> Ok, great!. I managed to boot the z2 machine with PCMCIA support
>>> and it gets around the issue with my patch, correctly detecting the
>>> CF card.
>>
>> Hi Guenter,
>>
>> I have now sent out a fix that I'm happy with, and applied it to the
>> pxa-multiplatform-5.18 branch of the soc tree as well as the
>> combined arm/multiplatform tree.
>>
>> I have not merged this new version into the for-next branch
>> since I would like to see if there are any other regressions first.
>>
>> Can you run your boot tests on the arm/multiplatform branch
>> and let me know if that fixes everything you found? If that
>> takes a lot of manual steps on your side, I'd just wait for the
>> build bots and merge it after all there are no new compile-time
>> issues.
>>
> 
> I tried the pxa-multiplatform-5.18 branch. Its failures match
> those in v5.18-rc1.
> 

Uuh, wait, the build wasn't complete. There are still some
failures. I'll report later.

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
