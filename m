Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F273BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 13:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZDleccFsKTKyjYtEgUFdPPByCdl5Y7jBeRNxFgz77M=; b=oUqoR8cLi6k1u8
	8Zp5b+DGIVf9dyHsiPtuZ35wUbG5W3BR2wPrnYy2FQG6R2xt6/Z3ssdp9k/4w/ShN4h7guaz+YuoX
	flb7FOd5mmrLh7Jf6vTMRmre6zzY5qqkezPEm5bYGGTqfxCRKQwSZI342wfakrVxG+zn/uOTxlYw3
	Hx55szXScWGkEDmC+97BRRVYMDRRO3wNCR9iI4dNP55Tw1xvbddMBupZtWQfs+QsY06o5wgJo1hGb
	bgPtX7oBCQey5Xp3yNvQM3CIdcMYXPls1bx67FdduzCKLaEtDvgC79M9dwVQjtcFolPFv27Bmsvk4
	gTZVz8IHWNzhovIlCmAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhAhb-009J1Q-Vr; Wed, 20 Apr 2022 13:49:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhAhF-009Imt-0H; Wed, 20 Apr 2022 13:48:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D640DB81D6E;
 Wed, 20 Apr 2022 13:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3695C385A1;
 Wed, 20 Apr 2022 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650462517;
 bh=r5gIACVwFwXfu+L0SjHY63rmQTmlBYIcuCScaOsuAjk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E8Em2MQWztm+C2EmlV1FQe3I0FTSV2DiJcyK2iihaFQo51NM0DFE/rYOIE+wyx1wp
 /VWN0/71ZwssYkNVh129T8UpZm6AUkLIGuMiY6fzJStQ7ZZZzsLu+YfHMjswZ9W7YM
 mjdK3DJxHlIkGZPSUsh/8dFkbBcT5Jm8E77pDoGNiEZG4/4EPstw+51gVak16za2ga
 dhu7kZkcOynk9SMtnhYtXUgL6zQdymwzczZfSDpnrDpvJEhYxBXYfvKUUxyNISj4vp
 /lSN3yrqnyEcDKHRIhkxeNkjouxpUUs1/5w5lM+l5Iw8Csip1eFb3F0IQ3ctyogPeM
 5m+eazxPFDoqg==
Received: by mail-wr1-f46.google.com with SMTP id k22so2370595wrd.2;
 Wed, 20 Apr 2022 06:48:37 -0700 (PDT)
X-Gm-Message-State: AOAM532cloDcuHS8AlNX1S8rfxS2TP57RnguC94EAe1IEmfmoLrUbkaz
 6AGaXjoklo+kFaZtiC3p7CunzHamK8218ocFs+Y=
X-Google-Smtp-Source: ABdhPJwSpIclw+ZwqVR57edT/aQRpFn5BaY64Phs17aAgIE6n54XF3PED3yv14Fv9AL2uDPz7qCh2GbTzsHglUZV1DA=
X-Received: by 2002:a5d:6389:0:b0:207:a7d8:2b64 with SMTP id
 p9-20020a5d6389000000b00207a7d82b64mr15595597wru.12.1650462515957; Wed, 20
 Apr 2022 06:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-41-arnd@kernel.org>
 <20220420134305.fq7pc3fsz5fxkryj@mercury.elektranox.org>
In-Reply-To: <20220420134305.fq7pc3fsz5fxkryj@mercury.elektranox.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 20 Apr 2022 15:48:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Mv-gUoc3hpqvCa1tzvEEwHN6wXDxmy8K5rN8sULQnMw@mail.gmail.com>
Message-ID: <CAK8P3a2Mv-gUoc3hpqvCa1tzvEEwHN6wXDxmy8K5rN8sULQnMw@mail.gmail.com>
Subject: Re: [PATCH 40/48] ARM: pxa: tosa: use gpio lookup for battery
To: Sebastian Reichel <sre@kernel.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Marek Vasut <marek.vasut@gmail.com>, Philipp Zabel <philipp.zabel@gmail.com>, 
 Lubomir Rintel <lkundrak@v3.sk>, Paul Parsons <lost.distance@yahoo.com>, 
 Tomas Cech <sleep_walker@suse.com>, Sergey Lapin <slapin@ossfans.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_064841_224795_5957343C 
X-CRM114-Status: GOOD (  13.56  )
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

On Wed, Apr 20, 2022 at 3:43 PM Sebastian Reichel <sre@kernel.org> wrote:
> > @@ -15,11 +15,16 @@
> >  #include <linux/gpio.h>
>
> This should be <linux/gpio/consumer.h> now.
>
Fixed now, thanks!

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
