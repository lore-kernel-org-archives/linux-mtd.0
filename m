Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EB1CCF9F8
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4zNF5s1XfzpDguMK5EHK/qmX7iTc2e5kD2qzPlkUe4=; b=l7y2tf87Ylz+EU
	o2q7s0DyQdgXctmPMKbRmpVlF9BgBW5GP/ZGfMs0+P+Uj5m9Nyt9OpisxklvmP6Jy1wDPJ1jiwQR5
	80Qv6YZlAVe1ACEIe/uAaxnU9GTKTvd/2ZBHrAgBEfpwUvyoM+f7h3k5UnJ6EZMUlqO5PmlZYkpyJ
	uqv6o8GscZoU5m/pFkKLiv8qSZ0eXowCoahznNhJg9ywIvi0pCraGl1+GnFEkDkr/vJKNb+Els5pt
	kjUGPbVMM4I9Bl0pXFPga4WoSNEX0XcAkrC4aoALieuR2s9F2FEpwswCxtNCUOi1Qdtn6yrF+Nkov
	R2L0UsIRUkmtL95GRMAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2qZ-0000000FvLy-1TYb;
	Thu, 06 Nov 2025 16:28:27 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2qW-0000000FvL7-3Sf7
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 16:28:26 +0000
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3737d0920e6so13787291fa.1
        for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2025 08:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446502; x=1763051302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plp2F71zo3wke225yJ4Ea1I1OPDOMxgAH1RlngZdvGo=;
        b=iu1v83qanlVRzxoU6VJzR+XJEvjM7VtA05693oCbjum4yhKSxdvSc+JjhfbGL4oUc9
         1RqDmzZy++/6ZPOS2hOB5wE66bFHpCkX3sFQacfmgC4MmKGSEcZFmGWcJCZh9xoiky6n
         KgEMKY1TcZn96BJwW/8XeD43219/9P1JP0ybr5hCEkOKRxSaiHmZGewS/j8y9qPH5KK6
         SMPS1Ro3lDnjcfHq5KjvsnAuZvI3b1HTiViv2HadX2BOBjAvdjchb7VRMgdwUlGlJcBn
         Qe13Dr4RXWmj6mHf2gBwmAecxcXWMD7c1odnqBVddmfS806ht+FfeGnecn5R3QjDlGzT
         4CiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNdKnPh5rUL4jcVwHhKAstifh0zg/ypkR5Qs/vE/BaUiPjxc7Vf9VxfaW8ElrRgGNlqKL3Kk/Jjuw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAaoYOHAISG9xfqZyxOaPyx06wxVg9T3vxeQ8F6nduxAVWEtAr
	tG4yn3ReD1s1Y147pQ2VwXOPvYVIvNPx/pBKA7WvwCEGc1BnHgksjdBEe0zN8Q2CamE=
X-Gm-Gg: ASbGncv837bjftwz+SR65fAfE4BcCnCedMz7z88T8FLoXIau77fJvCSRSPnSLd5oiTy
	RWqBq8V0D7iRzyGQRCZB73yU7WzVZ5oyXxLZGhLIii3nXaEEPzH4lFfdmGq7x2seQ9cX3WkT0Fh
	zD7oQXykJEJ2Cf2CvS2r6uM6DR0QiZuaL99cb/bTJxlCt3/l8Jjl5qYK3IZE0HzT02cmgR1hBvx
	OpJgBxjs7tNybEv0Wn7iSuBC/5Jo9pUY+71/1YNbp7uCLpYW8+Y2qq1TuAnHlgoEaWWRfsakgKN
	+q2ZWWLebgkEMc55MDJSUBtjU9Kob4GL3X2AtMuZlevEYqj8cK/HZ0HDtIUQ0AUuMUVyEATqYQ0
	5xNg515HFFY60Hey/hWPfMqXYWhtdW++RLeZKiKA6Hc3z7a2hw/6bfbCXuQv9UebMvQf9fsuFft
	tV4GvxiH7UuwKgbgpZA3aNDmIVXhZyHBPIkR+L5g==
X-Google-Smtp-Source: AGHT+IENC2PejM6dwJ9WDuxCtoNTn5ZBvh7RMXhfYfzaJp5FN/6kgEge4Hc3PVfONLEo7k/BzsTSTA==
X-Received: by 2002:a2e:a011:0:b0:37a:2e2a:da6f with SMTP id 38308e7fff4ca-37a5149fd1dmr18973711fa.44.1762446501506;
        Thu, 06 Nov 2025 08:28:21 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0ee99csm7408211fa.45.2025.11.06.08.28.20
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 08:28:20 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-592ff1d80feso1195316e87.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2025 08:28:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrBjX3JRL0BEew1ss4LtsYDdAAqbMEUQAwXBZWIUg97R+jZXV4ZBOXI41Shj1ZpiFXtotIuAUght8=@lists.infradead.org
X-Received: by 2002:a05:6402:3590:b0:640:fa38:7e4a with SMTP id
 4fb4d7f45d1cf-6410588d45bmr7763851a12.8.1762446022573; Thu, 06 Nov 2025
 08:20:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com> <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
 <aQzIIqNnTY41giH_@smile.fi.intel.com>
In-Reply-To: <aQzIIqNnTY41giH_@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 17:20:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW8ndAdGnSHopYFMWvw7wk7wKz_7+N91M1jRHoqK1KBrg@mail.gmail.com>
X-Gm-Features: AWmQ_blD_P8L06tcYy5Zd39ODOkLvksucIxy1SkcdgHAnKwygGve4Lbclr5ZO9k
Message-ID: <CAMuHMdW8ndAdGnSHopYFMWvw7wk7wKz_7+N91M1jRHoqK1KBrg@mail.gmail.com>
Subject: Re: [PATCH v6 12/26] bitfield: Add less-checking __FIELD_{GET,PREP}()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jianping Shen <Jianping.Shen@de.bosch.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ping-Ke Shih <pkshih@realtek.com>, linux-wireless <linux-wireless@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_082824_908681_B928A7C8 
X-CRM114-Status: GOOD (  32.05  )
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

Hi Andy,

On Thu, 6 Nov 2025 at 17:09, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Thu, Nov 06, 2025 at 03:49:03PM +0100, Geert Uytterhoeven wrote:
> > On Thu, 6 Nov 2025 at 15:44, Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Thu, Nov 06, 2025 at 02:34:00PM +0100, Geert Uytterhoeven wrote:
> > > > The BUILD_BUG_ON_MSG() check against "~0ull" works only with "unsigned
> > > > (long) long" _mask types.  For constant masks, that condition is usually
> > > > met, as GENMASK() yields an UL value.  The few places where the
> > > > constant mask is stored in an intermediate variable were fixed by
> > > > changing the variable type to u64 (see e.g. [1] and [2]).
> > > >
> > > > However, for non-constant masks, smaller unsigned types should be valid,
> > > > too, but currently lead to "result of comparison of constant
> > > > 18446744073709551615 with expression of type ... is always
> > > > false"-warnings with clang and W=1.
> > > >
> > > > Hence refactor the __BF_FIELD_CHECK() helper, and factor out
> > > > __FIELD_{GET,PREP}().  The later lack the single problematic check, but
> > > > are otherwise identical to FIELD_{GET,PREP}(), and are intended to be
> > > > used in the fully non-const variants later.

> > > > +     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
> > > > +                      __bf_cast_unsigned(reg, ~0ull),                \
> > > > +                      pfx "type of reg too small for mask")
> > >
> > > Perhaps we may convert this (and others?) to static_assert():s at some point?
> >
> > Nick tried that before, without success:
> > https://lore.kernel.org/all/CAKwvOdm_prtk1UQNJQGidZm44Lk582S3p=of0y46+rVjnSgXJg@mail.gmail.com
>
> Ah, this is unfortunate.

Of course, it might be an actual bug in the i915 driver...

The extra checking in field_prep() in case the compiler can
determine that the mask is a constant already found a possible bug
in drivers/net/wireless/realtek/rtw89/core.c:rtw89_roc_end():

    rtw89_write32_mask(rtwdev, reg, B_AX_RX_FLTR_CFG_MASK, rtwdev->hal.rx_fltr);

drivers/net/wireless/realtek/rtw89/reg.h:

    #define B_AX_RX_MPDU_MAX_LEN_MASK GENMASK(21, 16)
    #define B_AX_RX_FLTR_CFG_MASK ((u32)~B_AX_RX_MPDU_MAX_LEN_MASK)

so it looks like B_AX_RX_FLTR_CFG_MASK is not the proper mask for
this operation...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
