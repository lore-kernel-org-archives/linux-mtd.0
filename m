Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42464C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TvwOCmt3fn8gv3DkKjC96/lMHrzfIYLbMF762RyvkaA=; b=h1xnPKdQiqfjfz
	bv4xj/FIji8e5Yf4BUEoKLz7tLiTVEJ9MJHo+sTvCU3HWhzWW9xRzNb0RXbJNRqkfEEFAoM4GQSz7
	KMIUou4foMP+HU8feC9DT0qIZYi+7EKtx2daKBGOvItpNECuXd2wLOsky2DesnS2WwlJta9rCOg3e
	2BPypmevZWsYSwWLAOWzulA0VxDwarIv6hjkZuGGERCl1ZPkgBaOFvMyVbh/4Kbwfeb7m7hWrzqpX
	7UAzQk0hFAsgtzieR7j9YaU2rz5TDexLdWbt82fsPJ1DjJ3tz/cJGoqsX5k2J/yYSs8okHdP8pUkq
	Sjmyc7j68BaXlEp0Xu6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltXo-006H8C-IC; Tue, 03 May 2022 14:30:28 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nltXb-006H2b-Jf; Tue, 03 May 2022 14:30:17 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MKKdD-1nXvh83puB-00LjIV; Tue, 03 May 2022 16:30:09 +0200
Received: by mail-wr1-f48.google.com with SMTP id x18so23677451wrc.0;
 Tue, 03 May 2022 07:30:09 -0700 (PDT)
X-Gm-Message-State: AOAM530K0oWrMwgXkg2q/3TjLEhO1vJprDM+T65EfnFrp/4utsMPp5pC
 vNBWXUncrICgP2eVqcarGBW9281slbttVcJDXM4=
X-Google-Smtp-Source: ABdhPJzBrB6Hq8d9DfigwWJUnvR6JgldisGRuo8lFweHaJxUdm7WjYyRpRzeyy/XN6uA5q8KyUIXhqy6JFoQk/SEnPM=
X-Received: by 2002:a05:6000:707:b0:20c:4fd8:1d61 with SMTP id
 bs7-20020a056000070700b0020c4fd81d61mr13363100wrb.407.1651588209550; Tue, 03
 May 2022 07:30:09 -0700 (PDT)
MIME-Version: 1.0
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
 <d4eb4752-d8c0-715a-1d69-829f39c88d2e@roeck-us.net>
In-Reply-To: <d4eb4752-d8c0-715a-1d69-829f39c88d2e@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 May 2022 16:29:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0tgEwEJkrcGD5A2WnLsgUhbax+a_mFr8-a+kKc-dUDow@mail.gmail.com>
Message-ID: <CAK8P3a0tgEwEJkrcGD5A2WnLsgUhbax+a_mFr8-a+kKc-dUDow@mail.gmail.com>
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
X-Provags-ID: V03:K1:8S+xUlZg7gnacHwrWnrm9WPeRmbPy1y8LPTED2FFYcB2cxun37Q
 r2w4PRWjtTNCUMVwp+4RjGt+AjNoLdfv8GdeGi+jMK73W2fnurngb+pml1BWKeIIJdp7MWp
 jdft61kDykoZ48XUDQ9BucKRWEhMiQkgoXYA3aMyq0v1PflLNzRvVW035bXSgtY5CmEwdNm
 Ez/r4x3gaZsVif0eoyIRg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QaOhw/afxvQ=:/4Bjk1eIiNQd+IAZcvHTtf
 MSuz4rh296DzQp512OxEPGmF6dHoe5vp8kHRt8z7Re6INd7X3yTWuH7YMTvDvcMnXRJuS2yoH
 dWSuNXrxFd96kuj6XddqN0nusJj1JTSAtv/WWrLEkrSW5q4rHMNsvIkHvbTA38n6f47W0nZMu
 V1O49iKDJkFoAwhtV0Xs7k6IMYxIVq0xy58+NTFticdxxXa5hxXIy705izK6daTu/UK+CFAf6
 uXRwcAspgHbN1VXbamFU8Xy3NtmuhEEonI0k5bDVfil5xjP3NH7Z/JmW7giPP0mkZIgKgFFc3
 nXNgNSbDOEgkA2CqfhnHwT8E/eVat43vxcmPhIvDRNEqmOHxx4Lt1gWGzBT8yEHJ66p0lCGnl
 X/Fe+IXnT9yFtH7yKexqwtzeYY9Qaylpz4IfIJ4bteHbtmjIlbDO9BifrpSAMTJxXSqETU09b
 PG2ygC3B589z4pRN5zyTPsqkyV3+pbE3D9T/0W3mqFHvw5NQW9tINs+f3a6DF8IhbX6jbySeF
 Uaeex1VIOk0/kIZsc9SuyGhkjF0sz5lnsPRLT+stvYWPDg1JXeCAawbBaQhYFVRMTz2AAWEMF
 kszPRUVSoo1tACbgzTPHRWjhmb2GSUjR4uSDx0odTnoasZmJgOJwLOvSz5M8k7T0s+ykn3yPk
 7HKPi3H7KL91IM3YMzvCiLk2CJYGlR/14yFp4PJAfRjPxGT8CuP60bxBrJEVZKrD7afI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_073015_981235_9755DEEE 
X-CRM114-Status: GOOD (  22.88  )
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

On Tue, May 3, 2022 at 4:04 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 5/3/22 00:17, Arnd Bergmann wrote:
>
> > If you have a z2 specific config, that would probably not enable CONFIG_OF,
> > which is always turned on for multiplatform, but again that only adds around
> > 250KB in my builds (using gcc-11). This is more than I'd like it to be, but
> > still much less than 1MB.
> >
>
> Maybe it is a bit less; I only compared the size of "Image". Either case,
> it is enough to cause the problem. I am not sure if it is worth the time
> trying to track this down further.

Sure, I'm not worried about the boot regression any more, as that is definitely
explained by the size growth. The only question is whether the patches make
the kernel grow more than it should. The 40+250KB I measured seem
within my expectations, so unless you have specific data showing much
more, I think we're good.

Thanks for all the help!

        Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
