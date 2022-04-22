Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E04C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Apr 2022 23:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94PfgCubKHNPoSmmYHsCJz2KjuxjH3UIRmcwtTuxQ1k=; b=WzCnI7RX/JV29B
	UwHd9MCOhA/pf8Xa5V8oZPMYJlP3NHNQfUpGrUpxPelmb2r22XZwewMXK8AQU7/rc1l0HwXc3QKLr
	1GSz1XDOCOMeFzWrVK5EHbWdUos+eMKH4YOS7FBYQqjsG36OUe1Xx+T4HtjKMyJxWjoIcrUrPScAZ
	c2CNGvpJDcDa2WZu8/oMlbtR/HQPL36e5Rt1s+cJc7cO32ZmMAojEnr3KZ83aRs1GNMIdqRFP5Kba
	RHP3eBYHj8gG943JYl7xZe18uvMkYkIZtzBnaecA4GGhZhEbyhwqZDg1eRSxlpdTXGFahrSm0UGV5
	D+z4FAlFQp/HRJVcKkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni2YB-002pcy-Sx; Fri, 22 Apr 2022 23:18:55 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni2Xy-002pZa-Ib; Fri, 22 Apr 2022 23:18:44 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so6520366otu.4; 
 Fri, 22 Apr 2022 16:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KoWXKICOXrLwboX1KRSR8wabyc5tj+p6lrbCOGJNsB0=;
 b=WfyERyMX7R5AXo/rMMIl6y8nSXixykdVRLEdinY/MomqcCB5r5ZQbLs3BCON1JbJid
 SYBch1vH11Gbyyr7uHnb4uKt0rpEYLwWG6jPVzGB/6YTjnfP6B6nc9E72CRX17Qo8Nv0
 hqL9sBFF2f0anLzd4y4fWfHceVS7UFZj4OgGcGq3zFsQ1W26Ro4FtkgUsgVmFt6FTodv
 WJhhQLAQTlQE5ybgDgtXzSu4H0hkfGnY/mdPQk846Y0PZFkSuevMtu2SOCSNLfL6QGeG
 2/n/ZJOa7dCF4cmxGePvIEuDB/dkYth22mYrBof0ZAwoE1ogpw42s8W4hmZGYwun6WYu
 NaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=KoWXKICOXrLwboX1KRSR8wabyc5tj+p6lrbCOGJNsB0=;
 b=5KuFYDUkm6q3IxK0ybX+kBPG1f17LKehQn3rn926o6Af2FfnSEsHaZ0vNkuPP2a1jP
 wiKDupMXgWu8Tf2wADYWdAM7IMOjfNYT2gabFzUOoFr6O8aeJXFy/Jg2DFYl4j/PYUFh
 vHa9mGF7o/cJNxh6Cfbk5jGWUDqbJMF/9x+0TycVlC+R/SyX9QTugtARLd/Sw4obGTkD
 JcypDHxjgOuH707pmjUozVx0/FVERiK5+LiAouz30HTwvZmFPZ2hv4CGnB/lrzSpbofJ
 GH0ZFw6k+X3Qo0hWRJ8fR08YuicoP0/jWQ/RDIn4VTxoxpD/XqTPFaB5k4PAKTG7pxUS
 i3mA==
X-Gm-Message-State: AOAM532hVaFbtfPV4c/UbPohCN+A6Zaew9Xlc9pc68FwsTq8YiMk4TPQ
 jw8B9ojCTINRhrE/u3m4dgE=
X-Google-Smtp-Source: ABdhPJwKkrwKpAYwt9fhjngX1DM/06254YDKfs9CDiPU2Hx7eNlH3p/K4fmqYt8gQFcOM67kG0jDEA==
X-Received: by 2002:a05:6830:14cd:b0:605:4e77:6472 with SMTP id
 t13-20020a05683014cd00b006054e776472mr2672213otq.94.1650669519778; 
 Fri, 22 Apr 2022 16:18:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a9d5f0f000000b005e6b67945a3sm1256410oti.15.2022.04.22.16.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 16:18:38 -0700 (PDT)
Date: Fri, 22 Apr 2022 16:18:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Paul Parsons <lost.distance@yahoo.com>, Tomas Cech <sleep_walker@suse.com>,
 Sergey Lapin <slapin@ossfans.org>,
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
 IDE-ML <linux-ide@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-rtc@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
Message-ID: <20220422231836.GA3202260@roeck-us.net>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_161842_652555_4E03B091 
X-CRM114-Status: GOOD (  28.23  )
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

On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
> On Fri, Apr 22, 2022 at 10:55 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > On 4/22/22 12:16, Arnd Bergmann wrote:
> > > On Fri, Apr 22, 2022 at 7:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > Which machine did you hit this on? Is this on hardware or in qemu?
> > >
> > qemu, as always. borzoi, spitz, terrier, tosa, z2, and sx1 fail.
> > Also, I just noticed that the failure is not always the same.
> > z2 fails to boot from initrd, and sx1 fails to boot completely.
> 
> That's a lot of machines failing, I hope at least we got the same bugs more
> than once here.
> 
> For the I/O space, I found now that PXA was not using the standard
> virtual I/O address yet, but instead used a NULL-based offset.
> 
> I'm not entirely happy with this patch, but this is an outline of what
> I think we need to fix that: https://pastebin.com/3nVgQsEw
> This one is probably incomplete, at least it breaks sa1100 for now,
> and it adds a bogus CONFIG_PCI dependency. I'm also not sure
> in what way the last patch in the series triggers it, rather than the
> one that removed mach/io.h.
> 
> I had sx1 booting in qemu at least, with the omap1 multiplatform series only.
> If you have a custom config for this one, make sure you get the right
> DEBUG_LL address.
> 
> > I'll do another round of bisects.
> 

So ... z2 bisect points to the same patch, but the error is different.
As mentioned, it does not recognize the initrd. Oddly enough, booting
from initrd works for the other platforms.

The sx1 boot failure seems to be unrelated to your patch series. It boots
fine if built from the tip of your branch, but fails to boot in -next.
That will require a bisect from -next.

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
