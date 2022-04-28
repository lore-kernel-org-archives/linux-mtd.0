Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5BCC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Apr 2022 16:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vx1jI+G+lDcp6Fi5US45AxA0tGVbS0NKpHOTWbJyYw=; b=cR01gGi4kJ8pl8
	z1gdvkrVeW1ZJ+Vk+nrNE6gBj8d1hV5fmX4vKUDoke85VTvIx1iSn4LvA+me84Ci6jZp1uZPFLho0
	xh5DF8pnCsJpR2NPbx5+BXuQAv/elL9BH8bjcVD+A+QewtexSUsYPzEcFuZIj9HJvNvq4imgB+cJi
	Pp6GvushFJb9/9+b7IIpir4Lt31FQrGKItLh+YfT0KESUqP8KQ4KvXqodZZKMDtFZ7uR7ffm4d/h8
	bdOzQvpMrSifTvM/yjkr8XUfg0TWLFgt1WSM+l7PYt7Yn4/duJGtUDdqJvA5ON/tv/9QjTJm4ge/X
	+veOv/R5HnXOdgRcWhhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk7L1-007xCi-FY; Thu, 28 Apr 2022 16:49:55 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk7Ko-007x7w-U9; Thu, 28 Apr 2022 16:49:44 +0000
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so5690468fac.12; 
 Thu, 28 Apr 2022 09:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=XISky4EfFFruGvnkmI6B4SFkxFQ52ohN9Fu2cRfYJfw=;
 b=OkCy3r1S0ZpJd0xw0VfvdODlVptYGtGD/s68vjFfu+cv5VfksDwVTELspFMjzyqn2l
 o3HoJm03XsZQdwbEbRWjI+Lb63jSRMQLNDN7FFeOkhyetGmz/gAbkEhkV3TcaKgGRG82
 vuwvRZEQI4XV6kVyb9AK1+aJWoE9PIAQbe2raaE3M+WY6coymTsE71a+p721Tp/oJ1tu
 En+rQbHzGa1KawncckJtHDkTWA14zP+YTiLHoNAAclpt3pPZZQzCVaSg0pgbdjB43usw
 AxIfxdOHjkKVb6pAsbdhR1cE59eZyAmq6cI4Gd58mfC+2jQzc1Zta0D378ut2yf8lfbd
 NqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=XISky4EfFFruGvnkmI6B4SFkxFQ52ohN9Fu2cRfYJfw=;
 b=aeLO1L7Kau0d8IPX6CYppXRZU31HT8g6luC+RsHN87/7Mrhi0O4hDgzn9xAH+BroyO
 ZV3fTQd1VMFNGVQAZ2SsmwdqhcuCkRtQG09/HylRZPCBkNLtTYj9j2M0671+65hgS9+w
 0lQE8C9L9X0ZsA6QUucz6QfKbgBCka43gfz9jgUlBM7J3K4Pw6LXPDRbFlTIFYpaJJjB
 J8l2748X+ht3KGkfHkq4geJ4FCjWbjTetm6onqz0G17IdSWvoB+tX/8WohdGoyI+ppWM
 Sj5i0hL/b7dGVaucmwqdXrzHflJJJK9ZQYvhaPG5rFQMAbxCV1yC81qVUm2bw2pSpIZa
 z4+w==
X-Gm-Message-State: AOAM5320XDrreL46JHaIGfkBm8sXPfvYsWdH4jvfA2veBX6khx8nwJsk
 5uEVeOC/NEJZaXraSjkpe5o=
X-Google-Smtp-Source: ABdhPJzrsKYpUtqCt/iZ06NVVnsLxq83abuM+0rz/PmqCRR+0Jas/OQpo6w5mfl9KOVI8b7KjTk3bw==
X-Received: by 2002:a05:6870:3289:b0:e9:1a82:c010 with SMTP id
 q9-20020a056870328900b000e91a82c010mr11417956oac.25.1651164580861; 
 Thu, 28 Apr 2022 09:49:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a4a3651000000b0035d9b838f21sm205539ooe.10.2022.04.28.09.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 09:49:40 -0700 (PDT)
Message-ID: <dd3ac1fa-67c2-8bdf-f275-9210a9e23054@roeck-us.net>
Date: Thu, 28 Apr 2022 09:49:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
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
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
In-Reply-To: <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_094943_044697_31EA80D8 
X-CRM114-Status: GOOD (  26.22  )
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

-next is pretty badly broken right now due to a series of less than
perfect mm patches, so testing there won't do any good.

I'll see if I can dig up the multiplatform branch and push it into
my 'testing' branch.

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
