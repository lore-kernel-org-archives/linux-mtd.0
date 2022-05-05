Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1D4C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  5 May 2022 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nug2aQ+bL7VxogVS9CT4BPHUfliji6Mjb+QD4hutjbo=; b=QTxvD0NUtsvmol
	YbI42d46RmiBla6BUNx3783DyPxisG85CQuBDjlnLBsCGk7fcuSXM99Oclm3Kej4siU41c3g6xx2a
	1PJNs4N7YT2Oi3B+A+73Ah+uE30PjcSrfkrh8e7/5TrgIgMISlB0LuciNaPIm6q8aXTjIYNRF+9/r
	esP6Ac3LIxxGwKpBfZTEAw72xXIgfHavF5WnEWVWmLuXHIxZV7FxwdOEiydPoVpezVpTHEqz0Lw0h
	e6rV87Opyde/7leegvuOWn9dhQHTedeOWEzWt1HzE+KsJO74JifgVbKlz/MFUTd0TsJ3XJm5VU4Wx
	oNxr362OBYajwvdTZLHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmcxq-00GVtC-B1; Thu, 05 May 2022 15:00:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmcxQ-00GVhk-A1; Thu, 05 May 2022 14:59:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6AD0F61CD1;
 Thu,  5 May 2022 14:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F3CC385C1;
 Thu,  5 May 2022 14:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651762794;
 bh=IhPlTG/RSP+SotNFea7Fr39MZz0OjsoIPseiihaGxkc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=skKE7CkSWJipKAwKJCBrR71hl9l5yOYjQoARS41ioF8PPh7bxColWxsD4vdtmnrMC
 mQBIqAunoSnIAL+eTFw6a87TENu1OZL3J0unpwvAapDjehQbL4dIYPVxYDr5E0f8H2
 2Ut88XHuXmqK6oXMnJsfP9eSc86Q5HJlHS7nBYfK8IZe39hShNsGm5F+uG6l3Ohx8q
 Y2qhl3pfwWmUs7JTRVGH5vJD27kQLOf6she+YLgBmzISzF3PWnvMRiH84FZiN5pT9f
 vZW1FeaKkpy+VomhCOcOZ66ZN31g3fbgxTh0Rr9f2+J3tXb9yK6yeSyrs1M6tkoYJl
 i07arWsPlHMPw==
Received: by mail-wr1-f42.google.com with SMTP id v12so6460281wrv.10;
 Thu, 05 May 2022 07:59:54 -0700 (PDT)
X-Gm-Message-State: AOAM5332KSIoaFfeCXY7uXmuhyJbxSAlfNnQkvD71gz12Dx/SEZoSXVt
 TTxVjV9hS3KmoLCaOgeySEVviSYQyI5usl/OeGg=
X-Google-Smtp-Source: ABdhPJyKl/lyubFIqlgFQkig5zNAs/zvVqV8InTOhcfpAoriY4j8URNODYiLewygje3f2WDNulvuU9Rfg/N1L0FjaiU=
X-Received: by 2002:a05:6000:707:b0:20c:4fd8:1d61 with SMTP id
 bs7-20020a056000070700b0020c4fd81d61mr21866057wrb.407.1651762791921; Thu, 05
 May 2022 07:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-19-arnd@kernel.org>
 <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
 <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
 <CACRpkdZNryYkidvdKuT57RM3fz6_X+3oOzF5xaOZd+TyScfUsw@mail.gmail.com>
 <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
 <CACRpkdaNRX0RDYJd_uaGo5jtiXu_qGHmEDGniaCmR=TZvcHH8A@mail.gmail.com>
 <YnPhna5h1+kQGFLa@sirena.org.uk>
In-Reply-To: <YnPhna5h1+kQGFLa@sirena.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 5 May 2022 16:59:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2cYUYMKSMo3VOLVTO0=LWc0sHf72Eph8t_es9axo_eeA@mail.gmail.com>
Message-ID: <CAK8P3a2cYUYMKSMo3VOLVTO0=LWc0sHf72Eph8t_es9axo_eeA@mail.gmail.com>
Subject: Re: [PATCH 18/48] ARM: pxa: hx4700: use gpio descriptors for audio
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, 
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
 Helge Deller <deller@gmx.de>,
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
X-CRM114-CacheID: sfid-20220505_075956_464264_87D971F1 
X-CRM114-Status: GOOD (  21.52  )
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

On Thu, May 5, 2022 at 4:39 PM Mark Brown <broonie@kernel.org> wrote:
> On Thu, May 05, 2022 at 04:33:06PM +0200, Linus Walleij wrote:
> > On Thu, May 5, 2022 at 8:04 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> > > /* Headphones jack detection DAPM pin */
> > > static struct snd_soc_jack_pin hs_jack_pin[] = {
> > >         {
> > >                 .pin    = "Headphone Jack",
> > >                 .mask   = SND_JACK_HEADPHONE,
> > >         },
> > >         {
> > >                 .pin    = "Speaker",
> > >                 /* disable speaker when hp jack is inserted */
> > >                 .mask   = SND_JACK_HEADPHONE,
> > >                 .invert = 1,
> > >         },
>
> > Hm some ASoC thingie. No idea what that is, but I suppose another
> > place where a subsystem for legacy reasons try to do the gpiolib
> > inversion on it's own accord. That one isn't flagged as active low in the
> > descriptor so it's fine I guess.
>
> It's saying that when the headphone is inserted the headphone output
> should be enabled and the speaker output should be disabled, and vice
> versa.

Ok, that sounds like I should remove the flag here if I declare the
GPIO line as GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH, right?

         Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
