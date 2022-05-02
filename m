Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE54C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 16:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgFlb59pE0JAkOsTItlIXl0GMnIVvrQ7/UIYX8ZYVwY=; b=kn6jrWH4JtUA00
	TPyd0RKH01DPENQgubzF0Y0oQHk7g2JVR3Qf41hYO3Bq6gd0YkcCdoL3ao7RQtVvKFvBMHHxKn7R5
	C+LvwdlgIYrgRJZwXLnAtVxukTOg3rZPNp56eklwbbWTgWBKMIIWOFaW5QOp2yxxn2ZKX619lYvCu
	ViE79QL2i0tCPPkOBHN9uTh9BNOcB/bgCGSIrNN7Tsc59ZjN8iYdKfYjyVJGxKglPVpIS/LY0AR20
	2Rxjilp4RifdF93XGlwbixbiwvs01bugi4dKWkfhfbOdj/NYykw6X3nt3Dd7gZVoVeb18h9v7lbUT
	eN6reWMS2tV1bUTzCC1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlYsc-001hsT-Ga; Mon, 02 May 2022 16:26:34 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlYsN-001hnf-Ka; Mon, 02 May 2022 16:26:23 +0000
Received: by mail-oi1-x22f.google.com with SMTP id l203so15746540oif.0;
 Mon, 02 May 2022 09:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=64QIA6q/Jq1SXZtvXAHmkaqaem8y9EOcss9DFzQHU9s=;
 b=lSCTdreNcz/0Ozt6K1HBv4cRzX5rD5YkQNxljOsfS8tDiCYDoI+IPMQxP7X/EZIUm6
 nEUbOImYvwji0WLPLOr7WKakqkxdg7JpvGJPTfUXZcQQCuBLI6CBT8jIjTQ6snEColp+
 42NQ0U8dK6CrK0vLyvJNfr+ZWyi1wOVvde/g8GkgMS8kO99Le/sMzMeHcBDeFPgZnh0r
 LROiIiUnXvzBr+1b680itD4douFeeTEs3uEVAyKivH87Mp4cNraXu5PlswZdijptsHiy
 E/tGZIauqoE0htLx1qKBecZCr69Lv4Vi0nEVaQXlcbRczQ9R4I77j4rRVkbcch1Z44Nq
 l6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=64QIA6q/Jq1SXZtvXAHmkaqaem8y9EOcss9DFzQHU9s=;
 b=crhbXMGWuM4XwOLqZMD8poRYr4ZvTE/a/zDNboA27RgISgMCnTvO/yHEgeW/Q9BKUH
 7JWly91j3Lb4ntC9Q4juKP+WQNufZelox+gLWrn65rJ8X2R08YJG0ngmJlTQQaB/pmzr
 MF4iu1rbvTt8Brsg6UI2376NjgTB5GwYiBJ7CNyQ7xwSba2LwVyisiXciq7vyTzhPLD6
 h7uxXQf4xxBrVeNZSP7LyxoXxYWO/bVVU9BCYg0EtpWpcmEZOE+31CdASaGzPy6r0kew
 0WAV7OZjmU9EFHUW3gQV+detkM0a94Jn/vAAsLa2xY04nBP796rVpWwp1K7ViVAihGcQ
 hwJA==
X-Gm-Message-State: AOAM531901YBASCUIqR7yuh6a0lgILSboAZxTU+fVeGPWNFVHpvhXyV/
 KzQT0cKUdwm7TLyVEx+UN/M=
X-Google-Smtp-Source: ABdhPJw9C3TtXs+N7Y0xL4doHaW0x+AFJyxcg+z0+P8jqToBpOw3SVN62D2BXqS+EDk7pkn5yUYINw==
X-Received: by 2002:a05:6808:140f:b0:322:cbe9:8d29 with SMTP id
 w15-20020a056808140f00b00322cbe98d29mr7789910oiv.220.1651508777476; 
 Mon, 02 May 2022 09:26:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 l39-20020a0568302b2700b0060603221256sm3008945otv.38.2022.05.02.09.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 09:26:16 -0700 (PDT)
Message-ID: <4dcdbfe2-9edf-320b-d123-3b62c8b5e28e@roeck-us.net>
Date: Mon, 2 May 2022 09:26:12 -0700
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
 <CAK8P3a3S5OjkKq_u5FpnwzYv+0+typya6Z4MzTez5ZH+do00xQ@mail.gmail.com>
 <CAK8P3a3jiqf_zpBsZyvAb5ZtkwDa7KkqExqDAdpY_pYqkr_NgQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAK8P3a3jiqf_zpBsZyvAb5ZtkwDa7KkqExqDAdpY_pYqkr_NgQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_092619_748547_CFB254E1 
X-CRM114-Status: GOOD (  25.89  )
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

On 4/30/22 07:23, Arnd Bergmann wrote:
> On Sat, Apr 30, 2022 at 3:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Sat, Apr 30, 2022 at 2:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>> On 4/30/22 01:04, Arnd Bergmann wrote:
>>>> and concluded that it must have done this for a long time. In my own qemu
>>>> instance, I see a crash from iWMMXt, but that works fine on your machine.
>>>> OTOH, your failed instances all look like they either time out or
>>>> failed to find a
>>>> rootfs. I tried passing an MMC device as root, and that works here.
>>>>
>>>
>>> Booting from mmc works for me as well. Booting from pcmcia worked before,
>>> so I assume that there must be some regression.
>>
>> Ok, got it, and managed to reproduce the hang now. My "ARM: pxa/sa1100: move
>> I/O space to PCI_IOBASE" patch managed to get it to the point of detecting
>> the pcmcia device instead of crashing, so I assumed it was enough when it
>> clearly was not. Before that patch, it still works, afterwards it hangs with
>> "pata_pcmcia: probe of 0.0 failed with error -12" as mentioned above. I'll
>> have another look.
> 
> Got it: as the PCMCIA bus on this machine is the only thing with an I/O space,
> I assigned it port number range 0-0x1000, with an io_offset of 0, but this
> was apparently unexpected and triggered this sanity check:
> 
> static int static_find_io(struct pcmcia_socket *s, unsigned int attr,
>                          unsigned int *base, unsigned int num,
>                          unsigned int align, struct resource **parent)
> {
>        if (!s->io_offset)
>                return -EINVAL;
>        ...
>        return 0;
> }
> 
> I moved the devices around now, giving zeus/viper I/O space an offset of
> zero, and moving PCMCIA to offset 0x10000 and 0x11000 for the two slots,
> which now works because the io_offset is nonzero. I've regenerated the
> branches again, and confirmed the for-next branch still boots from pcmcia.
> 


With v5.18-rc1-49-gcb813018b5c1, I still get:

[    0.797668] RAMDISK: Couldn't find valid RAM disk image starting at 0.
[    0.805262] /dev/root: Can't open blockdev
[    0.805487] VFS: Cannot open root device "(null)" or unknown-block(0,0): error -6
[    0.805674] Please append a correct "root=" boot option; here are the available partitions:

when trying to boot z2 from initrd.

The other problems are gone.

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
