Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03678C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  5 May 2022 14:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBhU0USAYt8og4nrUiwFTwtmPzGpEM5sxAGR8m+mHmo=; b=Yq9rQmxIRnd7Zw
	i1fWzIQuq8rvMbMIdtJIPm9I30kkbG3YqJTnFXmovmdxTIXhJFciapG4+GpOKUSMPv3rb3BvRC8hE
	fX3lHlzMX79sqdXrZVpCLOFWGBMd6Ak/RL3dcPRXJTig4p6oT6ZItmqtbK7IOdJwRGgeUKf1bQhGB
	zMSOGehp39IQojk5P5hasDMP8c/9uqBLNm9gAQPyv9UwJAjFrs4kFAhofr10qb9mLihZEDTiUhd/M
	ZVAOAajobfMNVqGvARyy3SaryHbZIA8Tv8UMdmXDB/O4heLUZGVFKsG4HsH9i1Kajt05unAmPsGdp
	Wxa2026NCygDVDZ6FYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmcXj-00GOgt-KK; Thu, 05 May 2022 14:33:23 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmcXg-00GOfR-8M
 for linux-mtd@lists.infradead.org; Thu, 05 May 2022 14:33:21 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id m128so7940499ybm.5
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2022 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mjPMNwsrp6J5GYko2SAtRJngBnVXhB8jFuWLYKEwiPY=;
 b=fewd6t0m8AlbJsOL8rMMtmdSbrblLC+tou4WQa5Ukx0fDLML8yOTTiI03IEYZHxp2c
 5W5CFU2Qo00NadwNz4fu2sdMo4N/fhzCDiGLHlJnCCs1Ua3dcldY61sEg61hMdSawUir
 7eSZQI2CebwLUn4u4p9Bz1nt0xWXEswSQ1mxvA/ee4Uu5XXGOucd4+6oSzUonl+Kg0LI
 8uOzDzX7qYjSqNbAmA90tOmmW4qdH/x0e5n5IbhGhckydFuX0s17/FQo0madWUU2q0+q
 rIcDxGLzvzfaBFeSvXHNgwp/tqsLvfCOnU4JqRfERHcRhzltPIYSlpBkJGsKowlUJZN7
 2CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjPMNwsrp6J5GYko2SAtRJngBnVXhB8jFuWLYKEwiPY=;
 b=VaiZM4yV6Gd8XhRkuxA0OoVzN9yitFhhm+l5f2jLK2PJkoHXRmUPx4+DpaaopL+Yom
 V6bkp286cg6wC5i1yi/AVDfTJ7X1uqlNWiPEbDcULU9tS4/gM6Oz81Px8WwrwtpPe7JJ
 KpdCNqI+7qIqJb+aAnyZ0XEBLDoQz7Ld0DenM4bBWRlEVmaUXUVyPfg+4c6ZyvYIc7DH
 XNdlzBET/z+jGW65s73iUg3W/hn9sgBzZ/Z+WSVsTncz9Oj26cpFmCW50ZQVwCB48mkL
 RcKCq4AP2zwl2XEEQPcETd5AcEgw/qdYnmKIaE5tm2je4K7u3h5vGk49yS0Eu5m3/Ido
 Rj8w==
X-Gm-Message-State: AOAM532NZNbqOGM5dLHJKNjRyqowg+/QHSmn/E3imTB86FRKfXRcP1n6
 vAMbGVq2cgIo90N8njs7zAvYhl4WxYlplI83hqYcFQ==
X-Google-Smtp-Source: ABdhPJwo8Hf6LSoTaiB2cHkTaFM0+gz3ZfG++D4wXVwew3EevAVlxRmwDqgoKNolEWO5oTKK+x6Cg+35P6TVPloh+u0=
X-Received: by 2002:a25:bcc7:0:b0:648:d728:d39 with SMTP id
 l7-20020a25bcc7000000b00648d7280d39mr22199185ybm.514.1651761198027; Thu, 05
 May 2022 07:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-19-arnd@kernel.org>
 <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
 <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
 <CACRpkdZNryYkidvdKuT57RM3fz6_X+3oOzF5xaOZd+TyScfUsw@mail.gmail.com>
 <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
In-Reply-To: <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 May 2022 16:33:06 +0200
Message-ID: <CACRpkdaNRX0RDYJd_uaGo5jtiXu_qGHmEDGniaCmR=TZvcHH8A@mail.gmail.com>
Subject: Re: [PATCH 18/48] ARM: pxa: hx4700: use gpio descriptors for audio
To: Arnd Bergmann <arnd@kernel.org>
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
X-CRM114-CacheID: sfid-20220505_073320_338400_72D89268 
X-CRM114-Status: GOOD (  15.94  )
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

On Thu, May 5, 2022 at 8:04 AM Arnd Bergmann <arnd@kernel.org> wrote:
> On Wed, May 4, 2022 at 11:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > Thus drop one ! in front of the expression, just !SND_SOC_DAPM_EVENT_ON(event)
>
> Ok, done. But I still leave the extra 'invert=1' in hs_jack_pin[], right?
>
> /* Headphones jack detection DAPM pin */
> static struct snd_soc_jack_pin hs_jack_pin[] = {
>         {
>                 .pin    = "Headphone Jack",
>                 .mask   = SND_JACK_HEADPHONE,
>         },
>         {
>                 .pin    = "Speaker",
>                 /* disable speaker when hp jack is inserted */
>                 .mask   = SND_JACK_HEADPHONE,
>                 .invert = 1,
>         },

Hm some ASoC thingie. No idea what that is, but I suppose another
place where a subsystem for legacy reasons try to do the gpiolib
inversion on it's own accord. That one isn't flagged as active low in the
descriptor so it's fine I guess.

Possible this should be fixed in ASoC to rely on gpiolib but we can't
fix the entire world.

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
