Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0509C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 19:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crIO0ZGevb7qGzSxghy8Qc6bq2GaAZj9i/eKFEEVgZE=; b=3XO00DHuKL910K
	26Hssd039RMzrFnOffKg2F6x4uTWB/r0+eHqGCv3F+XAx8x9JIU5YUir9nAkiiwtA4lZyxOTJvN4V
	sRcCyxiZpjXFGCdZ3jCut+W1mb7WL4m5Br68NXzdfTBzps8DiDrMP3qNnCa/UXEXvT40Wi3ifjtzW
	AT4ds2YThYowz3eftjk22/ISmqFAniud9HFA0U0jvN3TaNAHddZZeZcAaJ9C0sa9WDo9HDRA4JR7r
	GWa6qb2pjZ4F/0Hjy6phIJ8Kz+dMDEO4BTAdtBOF04Ks9vwCojEJNAK1U7RjRz7WcokE84l87A6Ku
	5TD7EqpREwCMw1OM8BWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlbbx-002MOJ-9s; Mon, 02 May 2022 19:21:33 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlbbt-002MLk-9V; Mon, 02 May 2022 19:21:30 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MXH3Y-1nKh5R2zyI-00Ym1u; Mon, 02 May 2022 21:21:23 +0200
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-2f16645872fso158782007b3.4; 
 Mon, 02 May 2022 12:21:23 -0700 (PDT)
X-Gm-Message-State: AOAM533TT8Y23b0gUUWujpP8nvN2Gko8nMDwIA0432bIk+EKZ/T1KNvt
 8Qg9qJYUcZyB2gV0XyzdQOmDH3dJDkXQDdBFeII=
X-Google-Smtp-Source: ABdhPJwUfMAOks7BnV4AzKQEtr1EDQTOee83IkNCHoU3D+nfieXOKuWmJ4Tp85gou+YPOwWYc3gRkPoRLjpjhxYBTNE=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr12927652ywk.209.1651519282261; Mon, 02
 May 2022 12:21:22 -0700 (PDT)
MIME-Version: 1.0
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
 <4dcdbfe2-9edf-320b-d123-3b62c8b5e28e@roeck-us.net>
In-Reply-To: <4dcdbfe2-9edf-320b-d123-3b62c8b5e28e@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 2 May 2022 21:21:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ogn1wgPBDHkT=Fb8ufA+y8Ax1Qov2-vRXfC08QqnrQA@mail.gmail.com>
Message-ID: <CAK8P3a0ogn1wgPBDHkT=Fb8ufA+y8Ax1Qov2-vRXfC08QqnrQA@mail.gmail.com>
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
X-Provags-ID: V03:K1:j2ll6QwUBlsqVu3SQWv+S41OphUKyETfxeqQYvR4QEVc6qN6HED
 z4cNZ4hzT5cwlgKjn8VWqYA8lkIel4/3dvgDd1qD7COaNk3bW/nrF8zIBPLZ2fA4gLU48K6
 4scMIcTWmtkHVAdc9dkD8fHNIRjhVgawTFtcaPXyrtNx9qCAN8QVWGItqNoW2vr071QXhww
 dRjhu26phou9BYX5Ou7/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P58+2eHyFq0=:SyyjrINmoiPLOt1RBCKPQI
 CTitplKK9z4+i5PxziDxwwwksV5fWfw0r3QHFMgXL76cyxWQjxUi+V4W+Hmcfh68xEkb48qpL
 x2mn3PXipYe8wNUoDF5jLw/MnaYLSc2yY5U1WAIJjl1QQYTqI2saJDXE7/DWOpNXFVepgvm3a
 DkYRCzaXps50po6QH5I0mpAGue9wZ7UFxJys/ATlVLLGlP1zWaREjQM3NZXUBWI3tksayv68K
 hEJaEMKaxN+fifOUuMGvKnqMbm1ispdYJsjw7Zw+8f8c7qVdlaD50psmUJHRTAU6OLniTMs+X
 D7k/LRNdfuz3SmRONZBbY/9CdEhxnrAr++DvnBejF+77LRcyvliElRT/9HSavNLs5DQTO7Zvb
 pbTzcJ14llwrrRCwLftDfyDZAX8oK5oUUwcOH9lwxGo7EOr/7c60YBLfBw2PNwEjeSJLX1nRP
 FFF4QGR7bv6qj/2ukPOmIgnZ6+FlkgJTRSOghg1IGI8JONG37XY5yeaDwl1VjMDYhXbClR0o0
 lH2pL5EuRxcDeMmmy41yfyPcWoFdJjsDP9KOFEVac8FvQgmL/NWoF/GMJb0EcFfs61UoGJq8+
 jKnwg1+W9eU+WRkR4PWhdV3IR5QsBHIzxtjLN+VQSSlZ63x7gOxeN0ZEpl6G/FVeNx0FJszFu
 ZBKHwNI42RaROam9rC7mQvj4dIifa0KpCN8YWwploEovzjT2WRqjahy9TzkbVTngLmp/VhbRd
 rStRjYl/1opTnAvKwv4I1byWOEvd/lfIPbmGLg0nQyjSLNq2sVywsWlIhuAc3fSlvyOujdkdd
 730FdMG5jUDcpRATlf7QB2+Hca9aEcCuYvPHnVvJvpMQIPMXOQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_122129_678276_94EEE6D7 
X-CRM114-Status: GOOD (  15.76  )
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

On Mon, May 2, 2022 at 6:26 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> With v5.18-rc1-49-gcb813018b5c1, I still get:
>
> [    0.797668] RAMDISK: Couldn't find valid RAM disk image starting at 0.
> [    0.805262] /dev/root: Can't open blockdev
> [    0.805487] VFS: Cannot open root device "(null)" or unknown-block(0,0): error -6
> [    0.805674] Please append a correct "root=" boot option; here are the available partitions:
>
> when trying to boot z2 from initrd.
>
> The other problems are gone.

Ok, progress!

What is your qemu command line? I see that z2 has no pcmcia device, so
I tried booting
from MMC, but this already fails with 5.18-rc1 without any of my
patches, giving me

[    0.697481] Creating 3 MTD partitions on "physmap-flash":
[    0.698161] 0x000000000000-0x000000040000 : "U-Boot Bootloader"
[    0.702815] 0x000000040000-0x000000060000 : "U-Boot Environment"
[    0.706541] 0x000000060000-0x000000800000 : "Flash"
[    0.718066] pxa2xx-mci pxa2xx-mci.0: incomplete constraints, dummy
supplies not allowed
[    0.718501] pxa2xx-mci pxa2xx-mci.0: incomplete constraints, dummy
supplies not allowed

Do  you have MMC or some other rootfs working without my patch series?

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
