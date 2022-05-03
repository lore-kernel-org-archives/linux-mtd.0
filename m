Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2428C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 14:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48vBeo2uZQaKTBT9kVfzDaMh9XrXjivNdxWGeRGFGCQ=; b=3DFtghRNPlBcZe
	lqUK7Fus9s1lPzhJ/TbyDwOwYh3QUcDa8/nL05b9v+OB+gfxA2Ewt578i4x84SfGKMvv84cwEKDiX
	gVHkPuyQLJDhYM9NxrUnRzrOlMPIXqIwHPhl/M14LtCcBAWuE2JlzytscZUARaYAy/mUhtWVcEh0m
	2ouZV/tPpK+jDwGYfL5Gro4Vz3A3U6zXwYQBAuLX6idhv/W04lACb0JLQTT//oPzrXXO42g5ASFwx
	zCrNj0SdXM7Ak6ODs7tM+lNjx3jt0+RKusMZG3Bk8Yt+pFU+9ffEJrZ5JZwsIA1ktLBkrlGAGsRcw
	4Q2pHXDYIX804rV8iwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlt9S-0068fB-Hi; Tue, 03 May 2022 14:05:18 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlt9H-0068aj-6C; Tue, 03 May 2022 14:05:08 +0000
Received: by mail-oi1-x22e.google.com with SMTP id s131so18279563oie.1;
 Tue, 03 May 2022 07:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b5zcWYUFPO27QgFEnMVs+54HuZPkQ0FL3sPCUBagWEs=;
 b=nmtAO8elN+lD21aNW4PeFwV5qviuq6Y4sVLZWcQC9zZn6UqsLXYF5ciWRgl0+lA1Wo
 Q3rLe4Fskzg95B7RE9bBDzCWYoXQcNXwViucb5QcW8FGpQqDvUf5YZDsdBhza6rYepvt
 JfGvKjbu2S1tIWfgmVuDBkIJnidthNgLCkvix0KKZ/uKOs1c5s5gsxh2uVagQLRY6nw/
 ziKH7/MVdkOxup3VPlggEPris50qLUCDUg9E33r7OhDbS5bq0RNLc5yT2Ouqb/LH4LOT
 N/oRmt4dIHZssgokdRevfTbu/juuu2xeyRBaFEeQbqQW6cVYD7R5t3xz7Vo6hhn100CX
 OKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b5zcWYUFPO27QgFEnMVs+54HuZPkQ0FL3sPCUBagWEs=;
 b=KeLLVttFvENUUjZN0znVOUfFNdUts+oMRS3XbDTM99CvGz7B5FddmH3r0gKUMSaEfy
 8+n8CWgmn5T4B5f+hFZFBZbUNyRdyv6ykOTrIPVwKnm9XTQNZ1YMmOjbkKZqri5gPa2y
 Ynwimy4gKS1GTKWOOgEELb0Oialrvq3azMGZXgqjX26HC2jEh+XbVJw4cf/tfT3brr7x
 7McXvico/t/5m4ARg+o6e/DCeiMDjHOinMRWOXsd/ErhkGQbflKedIPJCJKqkql7S7uP
 2uM7WLUFik3f1tc9Whk0OYaYuZtkhmKmaTt2akgGtsq6Shuj0yFm1XEeRqlZWAl2Qb5k
 zFqQ==
X-Gm-Message-State: AOAM531s3mIXY+/zhKvGojbwg0JB2Kbp2LTyWeMyOer0UAmMXyeJmI2V
 /vMXbyU5rZJ7n3DslnxV720=
X-Google-Smtp-Source: ABdhPJzzGJEdAdih1u7jF2kiLOrOxmCv3lvE9XNEtKe9LYoSPKte95Aq4ECL/l2Oq3F4Q7XGCpzu3g==
X-Received: by 2002:a05:6808:2007:b0:325:7c10:475e with SMTP id
 q7-20020a056808200700b003257c10475emr1861677oiw.250.1651586703247; 
 Tue, 03 May 2022 07:05:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a056830168600b0060603221249sm4013581otr.25.2022.05.03.07.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 07:05:00 -0700 (PDT)
Message-ID: <d4eb4752-d8c0-715a-1d69-829f39c88d2e@roeck-us.net>
Date: Tue, 3 May 2022 07:04:56 -0700
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
 <04840b4f-5b9d-b29a-62f7-e5148d415313@roeck-us.net>
 <CAK8P3a39oiWyDwp=BHuCsBVwfzyZ802-NwL9G9r-t6X8KSr6nA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAK8P3a39oiWyDwp=BHuCsBVwfzyZ802-NwL9G9r-t6X8KSr6nA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_070507_259305_99FD27CF 
X-CRM114-Status: GOOD (  28.69  )
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

On 5/3/22 00:17, Arnd Bergmann wrote:
> On Tue, May 3, 2022 at 4:55 AM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 5/2/22 14:03, Arnd Bergmann wrote:
>>> On Mon, May 2, 2022 at 10:35 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> On 5/2/22 12:21, Arnd Bergmann wrote:
>>
>> qemu puts initrd in the middle of available memory. With the image size
>> being ~1MB larger than with v5.18-rc, this is too much, and the kernel
>> overwrites part of initrd. This causes it to be corrupted.
>>
>> It looks like that would have happened eventually, your patch series just
>> made it happen now. The kernel is just getting too large to run on such small
>> systems. I worked around the problem in my version of qemu by loading initrd
>> at the end of the (small) RAM. With that, I no longer see the boot failure.
> 
> Ok, thanks for confirming. If it's just the image size that changed,
> then I think
> we can live with it. Having the kernel image grow by 1MB seems excessive
> though, I'd like to understand better where that increase comes from.
> 
> Starting out from pxa_defconfig, I see a 40KB increase from the final patch
> that moves to multiplatform support, which I think is fine.
> 
> If you have a z2 specific config, that would probably not enable CONFIG_OF,
> which is always turned on for multiplatform, but again that only adds around
> 250KB in my builds (using gcc-11). This is more than I'd like it to be, but
> still much less than 1MB.
> 

Maybe it is a bit less; I only compared the size of "Image". Either case,
it is enough to cause the problem. I am not sure if it is worth the time
trying to track this down further.

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
