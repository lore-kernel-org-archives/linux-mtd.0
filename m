Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC41C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Apr 2022 12:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ThMLsZHtNY5wgu9GHeef/a0/KYpP1QAlIosJM1FvIM0=; b=vXSnRhrbFIGrww
	DlneI64Watj8tPPxHCeVBFUK3jXo9xqR61dXq6Ss09eksAeBTJ2Gtn33NbCgKOxz7DxLFGtJXCQCu
	/ZYlSXrXDexhjUk0B6vuLRDuwzKF9bSc33dM4AVQ2HfckQrQ7iSbS66O7D3/sCNW3tpuhL4HytjiW
	Ptbvv2NS5czfroFRlU0UTObdljKl88vffRGifUjlKAd/xuHaiqjK/y6Bj7BWOJfgwxnoB93t2X0bG
	6hulyVX/pk5vZWuHrlgxkdBv1cRvo48zyU6Omk1hNeQA4iA6Aj6QGtisS/+28u8wLpWgmPNx0f2XA
	Da0B8YOHeDxJEXyui6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkmQ1-00EFBe-ME; Sat, 30 Apr 2022 12:41:49 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkmPp-00EF7i-8r; Sat, 30 Apr 2022 12:41:38 +0000
Received: by mail-ot1-x331.google.com with SMTP id
 c5-20020a9d75c5000000b00605ff3b9997so1668500otl.0; 
 Sat, 30 Apr 2022 05:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+4KmgQYfIuFm8h1U7R2YwSpU4hiAkXj3VbXO1u4n31Y=;
 b=bOMCzvCOAKpdv9fXaje9jMI1pqeKHqZONG1kyrwpEn5SRSjZ3gWLYQa3I3V8E0XTqe
 23L3GQAWJeNEVk7g8b+1UkAgEnQmLz3wKCy7oL9ps0rKBiKWBGcNJePTi8yZdc7eAm1K
 drdd70QPm41ZeopLgQmmcBSPYqUdoh6aLM9KWSTIn7/lTrG/Cl6+v62W2AmGpZwfQKuG
 nJsb/pkjFRynFoTYu5l6pn8u9pt2CaT1jCMhsjk/5NBUgOkrkYq3BZENTznAZdLbqTNg
 OGQz6xI5kVYIDfriuLeWqba0UWos0/qt3bWMGA48AnxKNk/33rWth8ALS3TZQJlUqq9u
 /Xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+4KmgQYfIuFm8h1U7R2YwSpU4hiAkXj3VbXO1u4n31Y=;
 b=iqilMS7ueIo+5puFAHQ32klAL7v67vDGQKrv1jnUwHix3Wa/AmK9cE5swTW8fRo9d/
 fChM2dBGBYiJTarN+2myeEi3Mfk3EbHwneP2AR0sgyyEeLLpyHk0KTwvoCHpmI5wudIp
 lEWin9jAmIuQtt9LXx7pWSH9QkNzWoLYgAY/Po1/A2fCW+qEsLlkwxeKN9z4hl0DpK5i
 fN/OnzOx2N1kxvL2qmaneUFa2PzoPwa0MjtE6077XZE0S93upvGU4E7d6su8fTloKsPp
 Ay6qVh8N6kst4f7yoEh9sNFspmelIZYeOurMHXjnabzof69SAr8vfbfgEUImOUDl2XnB
 TrLw==
X-Gm-Message-State: AOAM5316217mz0P0tl5PUOBTJmsV7G6gpQ7vAr02TRaVo78zq3oeFJ5u
 aE/Nvyoy4OhO6CI9LUzHSZM=
X-Google-Smtp-Source: ABdhPJx/RnInjVQBRODIzLjFN1nUE8Qwa3akS1eWhsyayobpVL5cALhdflWKmFg+xyGlLB5eP7Dd1w==
X-Received: by 2002:a9d:6957:0:b0:605:de97:1ac9 with SMTP id
 p23-20020a9d6957000000b00605de971ac9mr1368958oto.83.1651322495923; 
 Sat, 30 Apr 2022 05:41:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a056870b28500b000e686d13881sm3932471oao.27.2022.04.30.05.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 05:41:35 -0700 (PDT)
Message-ID: <b13783aa-9225-d52a-3800-c97ad772688b@roeck-us.net>
Date: Sat, 30 Apr 2022 05:41:31 -0700
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
 <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
 <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
 <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
 <149509dd-f43d-1b27-4395-81eab4ff3455@roeck-us.net>
 <CAK8P3a05vFdBnXXAMPVS82xX29+uinvWPcWxAgvj0TfoOk+1kg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAK8P3a05vFdBnXXAMPVS82xX29+uinvWPcWxAgvj0TfoOk+1kg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_054137_366681_F1519842 
X-CRM114-Status: GOOD (  32.80  )
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

On 4/30/22 01:04, Arnd Bergmann wrote:
> On Sat, Apr 30, 2022 at 1:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 4/29/22 14:46, Arnd Bergmann wrote:
>>> On Fri, Apr 29, 2022 at 10:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> On 4/29/22 10:48, Guenter Roeck wrote:
>>>>>
>>>>> I tried the pxa-multiplatform-5.18 branch. Its failures match
>>>>> those in v5.18-rc1.
>>>>>
>>>>
>>>> Uuh, wait, the build wasn't complete. There are still some
>>>> failures. I'll report later.
>>>
>>> Sorry about the breakage, I got a few more reports about minor build errors
>>> and warnings, the newly uploaded branches should address all of the ones
>>> I got reports for.
>>>
>>
>> Unless I am missing something the failures are the same as before. See
>> https://kerneltests.org/builders/qemu-arm-testing/builds/74/steps/qemubuildcommand/logs/stdio
>>
>> This is with v5.18-rc1-49-ge8ab9a9a2745 which is the tip of
>> soc/pxa-multiplatform-5.18.
>>
>> Should I check a different branch ?
> 
> I only addressed the pcmcia probe failure that you reported for the
> final pxa patch, which
> previously caused a NULL pointer reference here:
> 
> [    1.405319] PC is at pcmcia_init_one+0xf8/0x27c
> [    1.405476] LR is at devres_add+0x40/0x6c
> [    1.405611] pc : [<c04bdea0>]    lr : [<c044d808>]    psr: a0000113
> [    1.405846] sp : c48a5d00  ip : c15f4220  fp : 60000113
> [    1.406026] r10: 00000000  r9 : c48b000e  r8 : c48b0000
> [    1.406195] r7 : feeb0000  r6 : feeb000e  r5 : c15ec090  r4 : c15ec020
> [    1.406395] r3 : 00000002  r2 : 00000000  r1 : c15f4200  r0 : feeb000e
> 
> This now seems to work:
> 
> [    1.435846] pcmcia_socket pcmcia_socket1: pccard: PCMCIA card
> inserted into slot 1
> [    1.456350] pcmcia_socket pcmcia_socket0: pccard: PCMCIA card
> inserted into slot 0
> [    1.457489] pcmcia 0.0: pcmcia: registering new device pcmcia0.0 (IRQ: 217)
> [    1.460275] pata_pcmcia: probe of 0.0 failed with error -12
> 
> So it sounds like there are additional bugs that I have to look at. I
> probably won't
> be able to do that in time for the merge window. The logs contain a number of
> warnings, but I have no idea which ones of those are preexisting issue. I had
> a look at
> 
> [    0.689982] pxa-dma pxa-dma.0: error -ENXIO: IRQ index 1 not found
> 
Yes, those messages are indeed old.

> and concluded that it must have done this for a long time. In my own qemu
> instance, I see a crash from iWMMXt, but that works fine on your machine.
> OTOH, your failed instances all look like they either time out or
> failed to find a
> rootfs. I tried passing an MMC device as root, and that works here.
> 

Booting from mmc works for me as well. Booting from pcmcia worked before,
so I assume that there must be some regression.

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
