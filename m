Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CEAC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 02:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRQXHzQHPJeLL6waaKFQdh5E+hG2XaO30kgQyalyZU4=; b=PED3CjyNQnbOUg
	RMVS8lZzz7aSWLo6skdREmQy3ffztHHV+f+ejWAZMmzJrymp5yJhpEVQkoqEb2OrZVMo5IwKDO3S5
	sM2Wr/lVQJy36uP2d3j/QniJwlVVK1r1pvfVe0TCSrpNuQ7UAWHqbx2A0dEyTyvMlEqpaNY4pIZBX
	F3dzxkYo0ihI8qQTZ1W7YAL7Hzfi9Xbu9DdhQ5CnpwiwQ+5PXov3YcE9hg1pKBwOWGmC8meHVM7rT
	A4TIwl8/LmL4o8vv1MKfxldhzO+5I3Y7VEkP9aODIAU00NGU8OElDNM8XT0XraLRVBYqHoskfHbf8
	PAW96aqkrAZ76DjA4jKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlihe-003Uvy-Fq; Tue, 03 May 2022 02:55:54 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlihR-003UrL-U4; Tue, 03 May 2022 02:55:43 +0000
Received: by mail-oi1-x231.google.com with SMTP id y63so17043327oia.7;
 Mon, 02 May 2022 19:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=ML+ALf4muC9UINFB1D+jUSUaT6Yc1q590//LqncXPBg=;
 b=i7O9COFXjCPh9mubsfg4ugisxlHT5wiyH0MXCmkS/E9xJKUh9gtudd7mJOdt/lRU5s
 XviWqp4uUxdnstDiOc3faSUjpvZagNsoavB45X1ONbSZGvYwKqCS3Q4EtrJCw38BFSTy
 GfNBd7eRD5cCXw35f/BALZfCm/WuBWvrvy8CHiiL2yrOPGPoRYnxiuE92NR59Xn+HZB5
 KmWN9JXFhIw1dIK45cEVSlCPHBcxANoVGaomRAUVkCZ8j7FysnRmKK/nqDi0QqiAU5qN
 jRYD07RpfwKLRhTaIOHoyPVauNdPj2DaFQwX8xWbJUP/uVrx5krbwy8PAtKyqKnZh5Fk
 0gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=ML+ALf4muC9UINFB1D+jUSUaT6Yc1q590//LqncXPBg=;
 b=bhrPqX0tbeOe1FJkJr7MjE4g0lYqnb1IAaKu+mudEQ2MqV8PRTbeL3LZmEMiC5ToWp
 0PhIFgrY3uJNnCE7EtfeFVaIY5YIdhNTx8bAUvUXeMG0fsK2KHn0fu04VkC3aCcHa/5g
 lNwOFZp6tavhtiNQvowAF/X55CNIZ19nTmYcQg+Lg8XQs8Qfk/SmNDq1MarwddzXnjr2
 gikoaH0T1fYhQv2AQAqHVMxeI/hjmC4IpkzOkpZJlMoLdgzbz/lZVaj6dq7URC60DpGo
 VjCGV2uFcwgZs6xZYLiDuhVCvPli/bSylXpTpCqllUZ5LJU00efsfzogL7Xf5xVdrNCK
 +9lg==
X-Gm-Message-State: AOAM5304DWu46jkhTsmcbqRFdN0HzxuZTvWMEqBpBN+8UzrizorEu1N3
 3bDjRlUn0MyboSEOi3gsQDs=
X-Google-Smtp-Source: ABdhPJznbXpW7jRNt5UM7xwEtyewbcsNlzza6ofH1kXi3NQqMh/99I9VMArk+DRpxcBP+PFc4iZ78A==
X-Received: by 2002:a05:6808:1115:b0:2ec:e78e:3fc0 with SMTP id
 e21-20020a056808111500b002ece78e3fc0mr978131oih.207.1651546539238; 
 Mon, 02 May 2022 19:55:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a9d7e91000000b006060322126csm1564658otp.60.2022.05.02.19.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 19:55:38 -0700 (PDT)
Message-ID: <04840b4f-5b9d-b29a-62f7-e5148d415313@roeck-us.net>
Date: Mon, 2 May 2022 19:55:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
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
 <4dcdbfe2-9edf-320b-d123-3b62c8b5e28e@roeck-us.net>
 <CAK8P3a0ogn1wgPBDHkT=Fb8ufA+y8Ax1Qov2-vRXfC08QqnrQA@mail.gmail.com>
 <c001d58e-9a78-6338-a533-d0f215b3dfd1@roeck-us.net>
 <CAK8P3a1X3YH0RqqmqgqFAaY94yreD-PfY-pvyMf+xU3nGeqvsg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
In-Reply-To: <CAK8P3a1X3YH0RqqmqgqFAaY94yreD-PfY-pvyMf+xU3nGeqvsg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_195542_090792_CEAD3DC4 
X-CRM114-Status: GOOD (  20.78  )
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

On 5/2/22 14:03, Arnd Bergmann wrote:
> On Mon, May 2, 2022 at 10:35 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 5/2/22 12:21, Arnd Bergmann wrote:
>>>
>>
>> To boot from initrd:
>>
>> qemu-system-arm -M z2 -kernel \
>>        arch/arm/boot/zImage -no-reboot -initrd \
>>        rootfs-armv5.cpio --append \
>>        "panic=-1 slub_debug=FZPUA rdinit=/sbin/init console=ttyS0" -nographic \
>>        -monitor null -serial stdio
>>
>> where rootfs-armv5.cpio is from my repository at github.com.
>>
>> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/rootfs-armv5.cpio.gz
>>
> 
> Ok, that works here with any configuration, I don't see a regression.
> Could this be a problem with the size increase? The machine only has
> 32MB of RAM, so it's possible that the multiplatform-enabled kernel
> with DT support etc pushes it over the edge, especially with an initramfs.
> 

qemu puts initrd in the middle of available memory. With the image size
being ~1MB larger than with v5.18-rc, this is too much, and the kernel
overwrites part of initrd. This causes it to be corrupted.

It looks like that would have happened eventually, your patch series just
made it happen now. The kernel is just getting too large to run on such small
systems. I worked around the problem in my version of qemu by loading initrd
at the end of the (small) RAM. With that, I no longer see the boot failure.

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
