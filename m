Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A8CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 07:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTK4XbIpUIkQ9Mz7NOltIVTXHlbmjM6atPrzIzIofBk=; b=rO+2DQD858adB1
	WXprbTFm6k7PkRdHfa+btEHs5AzdkZQ6J96oWDr/CFN8qzpwsuJ7Z9To+rPzF/4kZ4D00oo4REB5J
	iSBcbz73Icr32LvsjQyBku/W+O9SPcS74Uuv1LWxZZkOLlgZoYLFbwSTnrNnM1h9lVcLZhdz2uhx3
	Z8jCCY+EIcbS7lvsIwJur3EZQYtxLjO1iDALNjSG2GftuY0VjPd4aRVyMul4z7SzOgzLwcQAOFPR+
	ymmv86Z3ddZtp9hHjnZjiaza+vEpQhPqPv2NRKWTzKYHfGpdbxeDWtuHVJd94xMWyRcKySAitlkFh
	/2oOT8evyEvXC08LkoVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlmnI-004BQO-SU; Tue, 03 May 2022 07:18:01 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlmnB-004BCt-8G; Tue, 03 May 2022 07:17:56 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M3DBb-1npMcu1w0j-003a9v; Tue, 03 May 2022 09:17:37 +0200
Received: by mail-yb1-f181.google.com with SMTP id y76so29742026ybe.1;
 Tue, 03 May 2022 00:17:37 -0700 (PDT)
X-Gm-Message-State: AOAM530cnrZF+o2g/W9r40Gneb9xkUlFta7vmTRXNv8iDeWiHZnKolOL
 fODwLWQ/6NTXK3oKZuKdDBLAb3p6PnM9N+MkO2s=
X-Google-Smtp-Source: ABdhPJxCVe3OWFLSxYuaWnZW2jE5tiG+RIFx0DlFR531d1DfX2PVw0Rn1+OoRgTZrm5UkwICv0JqKul27jNY+A9f6J8=
X-Received: by 2002:a25:c604:0:b0:645:d969:97a7 with SMTP id
 k4-20020a25c604000000b00645d96997a7mr12300750ybf.134.1651562256127; Tue, 03
 May 2022 00:17:36 -0700 (PDT)
MIME-Version: 1.0
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
 <04840b4f-5b9d-b29a-62f7-e5148d415313@roeck-us.net>
In-Reply-To: <04840b4f-5b9d-b29a-62f7-e5148d415313@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 May 2022 09:17:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a39oiWyDwp=BHuCsBVwfzyZ802-NwL9G9r-t6X8KSr6nA@mail.gmail.com>
Message-ID: <CAK8P3a39oiWyDwp=BHuCsBVwfzyZ802-NwL9G9r-t6X8KSr6nA@mail.gmail.com>
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
X-Provags-ID: V03:K1:ZGFyOeX7d0RPWkadCG58QMIGxqROgAjBTMvnnAiCl0Pa4uvEiMP
 0v0wPN0pyiVEUUUGJpMovSuzfphUHrTvxq1ho3lfYIikFUH388N14b7fkDrhqSPjRxiNaWG
 /sHf/0NVSNcBJ9VBBmgtVdBifIu6/ea1yupMsILKHaOyPU1I8D5wKTAMZhZ3SzwVkaiF8c8
 4A/zMupDeMnNLrSPxgbVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G7Cp4+y39/A=:ncgtjzDOQmKIHuiplAnnry
 DPFEOi29gpGEctx08Yn19Ue3zHWKDY8e1Hey8mEDy16IS1RpyTiHUIUWsGAFGp4n/Wljk7Fhh
 FMeJMI0oF6/vF4QIsX5BIQ9E3dbnEuAG81lY3nryU+ShdHMFp5o9kBgpt6IueJWJOSVNYBWXF
 g+qQBOtJKuVg+DYkGCVK7N0V3zNBRP8hdAUsw/isxVl0FpTFEqLOgS0ZduMysRnpxTA7bydSi
 u1xQ8hvQpRQl5hNH+yjvTJMbQHBojM6m1Ybffim38YalCc8NcgHhI98Mm2PmAv17KOCf4rufh
 7LoWy5k90k/tVRcnp3minuvH1eoCV3p7+4Bl2aAw9Te7YYGMgAJjRhXh4Lk7c0sW+UX3HBHUS
 iBIgNRV10qlL+tcB5SASDU0U/JpNFZXgfIzIxeQCkuIypq1cofX3kVyLCD5mKTwlmchtfLDDl
 hemvBrqjG5rCI7d1bm+NNM3P0T7xEG/vWKfg4qZpv45deZ8YSXG7X7rCnbw7xtMswe6E5i7mN
 jqZ5nK1Ygn+Zc2eUBYZsmjtkJzy4qzk7xdbulKWWN7ZzgB+eC6Ayg9egUo7MyHlIhcjyeIgnA
 YFjLWyqZOTxmwTppoQCyDIywwuL3uM8VRa9PQelxzow2NVRIgBGWWeYratmlLsSg31ANsayjD
 uNC/ty1V31xwBPDOM0Y+QKinYWcw75OUpsdZYoZx+34bhG208JhLUIuWJV2p6+rG9PJjtwRzv
 Du0IjX5o7NMAeqNx3vg8Nwg3oC+2dsBBjhiRqKAmsPRh+c3ZQsn9NPy81kctFai/eqYfHhFPZ
 IdarGPNKM+lX8wj0tMwaH8t3di7s1LuehVSTP60ZTV3Vg8yuFc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_001753_672729_AB04452C 
X-CRM114-Status: GOOD (  22.50  )
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

On Tue, May 3, 2022 at 4:55 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 5/2/22 14:03, Arnd Bergmann wrote:
> > On Mon, May 2, 2022 at 10:35 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >> On 5/2/22 12:21, Arnd Bergmann wrote:
>
> qemu puts initrd in the middle of available memory. With the image size
> being ~1MB larger than with v5.18-rc, this is too much, and the kernel
> overwrites part of initrd. This causes it to be corrupted.
>
> It looks like that would have happened eventually, your patch series just
> made it happen now. The kernel is just getting too large to run on such small
> systems. I worked around the problem in my version of qemu by loading initrd
> at the end of the (small) RAM. With that, I no longer see the boot failure.

Ok, thanks for confirming. If it's just the image size that changed,
then I think
we can live with it. Having the kernel image grow by 1MB seems excessive
though, I'd like to understand better where that increase comes from.

Starting out from pxa_defconfig, I see a 40KB increase from the final patch
that moves to multiplatform support, which I think is fine.

If you have a z2 specific config, that would probably not enable CONFIG_OF,
which is always turned on for multiplatform, but again that only adds around
250KB in my builds (using gcc-11). This is more than I'd like it to be, but
still much less than 1MB.

        Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
