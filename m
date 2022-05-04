Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2518C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9D/uj2F3EltF0hK2PTjvkG56VOLlMLTnOCamQiZlN4=; b=CtRqgbFFVp14DF
	x35CPCodeLnWfzrTarHbGXFvVcR82TcqDeEuYW4NtwPaw8gT/TgmZrEQ6WlK+tmuks4m3K3orBU4X
	YDdacjibyNfOUFwRzumbAB9OKqf5FE1Ud05X4s3h2z4c66x/ZFH04ZhuyM/uyc0OjMSTltZ8djUDu
	r08geKemLIWBxjw4LqLqE/7sAYrpAaS2m6LCi7IrzFJVRAX5jpfErVBzPk0Br9zBMu18mEGcmarXA
	6czRqi3kEUvvSMjBzg5EWzqMMdb8uadmkt8+WZVXd3eVjAkziO/6NmXwghnH5Qg+lwxISQTanchEX
	Hx8prY6VLWeSwtyIt7kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmN2N-00D1CA-AM; Wed, 04 May 2022 21:59:59 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmN2A-00D17G-N8
 for linux-mtd@lists.infradead.org; Wed, 04 May 2022 21:59:48 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id v59so4676976ybi.12
 for <linux-mtd@lists.infradead.org>; Wed, 04 May 2022 14:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rmJxiEP7m5MkHAr9riUqfx3uT8FiWx1lLvenswbOwJo=;
 b=QoiC7QZe2hJyujp1ZRg0nlXjXopykN2j/DeYH65TBWATXUktJf0x/kyffuuacsI/Xo
 3U/WGyV+fixlajIQ09GKt1DZZYpxMas0dWaDYCL8jonCJtMRr4CSZtyBZVh8caz3Zhfm
 KLVYZqsNmH6MjXnLA95998XCfsQEg4LoRnNmHuqp/sQ2AApgVFWMqqZBdroSiC1gbSmN
 F4COMU/J9YGu52LHRSSP9wDA3f+g3bnizNxpCHxuTE9h/gJ7KhKhsdH72IujMMikVg4I
 fP3vyeXEvVrVnkAX/oRVPo4TmV6M5W4ptTtqSYXWLDxsKe5hoIl7+BOBmDpgqE7s/ubD
 8xlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rmJxiEP7m5MkHAr9riUqfx3uT8FiWx1lLvenswbOwJo=;
 b=5ZX/uJATIGoNJEW1InZgSHIdsr3ansTuu/YzwlWtUCOp2SlOB/JDnR4lTIwlY4elBl
 OSoayNgvX1MRG8XVtBZLDS5/kD2w2vInHJVF79kjLJjcYKCFFeA4+jNA8P+Zv0pfAsWP
 3NIkG8p4zGMOj1hZhjqr0LMuoW+jtv7JZciDSg+pSoUrbEZatM+NAR3hQe/Huiog0Fwn
 BSrLEtCUICBvg91jnlrCAaBMWHFh0rQpPIFjifnNOgv2F7Z7rCddMWCipbnT40W8JRZu
 V9dwTBA+iSKze16XyiVJkKEzlJXf2pXd7WsowubK4ITvNWzOa6w0QOk7Vk96T5/tDncr
 zQeQ==
X-Gm-Message-State: AOAM533CmZvKkoXGTIWyd9QJzTDP3Hr2PIlRW2f+S6I2/opXGfv9L1WC
 oKHhVKtgyu7M/DNj5ybmi5b4f1QhNyUiCREkvKvB4Q==
X-Google-Smtp-Source: ABdhPJws0kFu4uk8m+EBRW3/56Ag/4uZ6hdskWay/lA/R4RBYkLUb5oUPb5cyXOdcEWwAD5EvFRWUXI3Mh6lxHFGeY0=
X-Received: by 2002:a25:bcc7:0:b0:648:d728:d39 with SMTP id
 l7-20020a25bcc7000000b00648d7280d39mr19634791ybm.514.1651701582183; Wed, 04
 May 2022 14:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-19-arnd@kernel.org>
 <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
 <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 May 2022 23:59:30 +0200
Message-ID: <CACRpkdZNryYkidvdKuT57RM3fz6_X+3oOzF5xaOZd+TyScfUsw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220504_145946_799317_774441E9 
X-CRM114-Status: GOOD (  27.56  )
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

On Mon, May 2, 2022 at 9:08 AM Arnd Bergmann <arnd@kernel.org> wrote:
> On Sun, May 1, 2022 at 11:41 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > (...)
> > > +static struct gpiod_lookup_table hx4700_audio_gpio_table = {
> > > +       .dev_id = "hx4700-audio",
> > > +       .table = {
> > > +               GPIO_LOOKUP("gpio-pxa", GPIO75_HX4700_EARPHONE_nDET,
> > > +                           "earphone-ndet", GPIO_ACTIVE_HIGH),
> >
> > This looks wrong. The n in nDET in the end of the name of the GPIO line
> > means active low does it not?
> >
> > What I usually do when I see this is to properly set it to
> > GPIO_ACTIVE_LOW in the descriptor table, then invert the logic
> > where it's getting used.
> >
> > Also rename to earphone-det instead of -ndet
>
> Thanks for taking a look! I changed it now, but I don't know if
> I got the correct number of inversions in the end. How does this look?

Looks wrong, you can just invert the argument to any statement of set_value()
after tagging respective line as active low. Then gpilob will do a second
inversion.

> +               GPIO_LOOKUP("gpio-pxa", GPIO75_HX4700_EARPHONE_nDET,
> +                           "earphone-det", GPIO_ACTIVE_LOW),
> +               GPIO_LOOKUP("gpio-pxa", GPIO107_HX4700_SPK_nSD,
> +                           "spk-sd", GPIO_ACTIVE_LOW),

So those two have switched polarity.

> @@ -81,14 +79,14 @@ static const struct snd_soc_ops hx4700_ops = {
>  static int hx4700_spk_power(struct snd_soc_dapm_widget *w,
>                             struct snd_kcontrol *k, int event)
>  {
> -       gpio_set_value(GPIO107_HX4700_SPK_nSD, !!SND_SOC_DAPM_EVENT_ON(event));
> +       gpiod_set_value(gpiod_spk_sd, !!SND_SOC_DAPM_EVENT_ON(event));

Thus drop one ! in front of the expression, just !SND_SOC_DAPM_EVENT_ON(event)

> -       gpio_set_value(GPIO92_HX4700_HP_DRIVER, !!SND_SOC_DAPM_EVENT_ON(event));
> +       gpiod_set_value(gpiod_hp_driver, !!SND_SOC_DAPM_EVENT_ON(event));

But not this.

> +       gpiod_spk_sd = devm_gpiod_get(&pdev->dev, "spk-sd", GPIOD_OUT_LOW);

These initial values don't seem to be set in the old code you could
just use GPIOD_ASIS as flag to make sure the new code behaves
the same.

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
