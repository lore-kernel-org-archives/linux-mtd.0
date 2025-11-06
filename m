Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1924BCCFA05
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDytWtYaoX1mpJPlMSRd2LaMfBSBEiKJngvaZ4PeHtM=; b=NKhGQ5fR4c19fo
	GwlGX6+bQ4aiSADToBi4qB17DK37b5TFm3uconDCPnSxRKX4AT0Q7zNq2glg4GLtO4Ku4TdhOxY7/
	dRUbQapgtIAvZJlsWnPYS0+feOo4nP189l7+yH7nBRfBglaSeNtpVx/oyjPWex9pYZ2HsYybxmcpT
	6xfcwbHcpfoYV2tgFVyIkH7XLXw0jY/QnJwiIyrhmqY1qDS0xzyo5RAPrWjeSolLLOkmn5qsFA38w
	al4DSyN7tHFg6XY22cZLboqemlh7rDtyVYVsem/5d/7haZG0+TFHeXKC14JWjXR6yqyhgPG3N/FLs
	xQuEwsuDCvoLUQ5oq7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Ns-0000000FjnK-3uJD;
	Thu, 06 Nov 2025 14:54:44 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Np-0000000Fjmw-2nUG
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 14:54:43 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so907971e87.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2025 06:54:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440879; x=1763045679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxZVtMOHoNocoyXPFvfejRTHivuCeFc8a9lYqiVNw1Y=;
        b=wD5tLqRxAKMzXg8yBwexC20qzSkpwsV4S/4jpIE1csguf4jLHHJ+Rj3HPJnoPsY0bE
         p/Enb2ievCbhPVqkeq9gT8KnH55tuYd6TbCnaHLX44yHVfPAzhBIpCm0tsPdmsvF9WgN
         EuFhA+/gkKMUkAdMxDVyiS3pvZUc50LjhK3pc/DK7xMp4bRx6vS9krrUh7ZMoWeC5bGJ
         PumYVmpfdG9d9xcX8GlhpwX0NLge6EbR2D0uU+1jucdFnsEdzQ/yuVOD6CL2OlbORA0F
         LSm8AjSkIJd4M/QA7JupZP97UjsdvUqeXjHvcATl+o/Ju9uQJMDnlbSEs4ZaSuzbgxu7
         zaFw==
X-Forwarded-Encrypted: i=1; AJvYcCXynYv+hquOWbGrK5jPYOBjRK2pdTzpnx9HOYK5v3y3bdrYwhTeJes2kbVxslRhfu8MHpia3L2A3+M=@lists.infradead.org
X-Gm-Message-State: AOJu0YyH5MEl8rbKVNU2SdaoX2OyrwrX6iKO5MAnNrPYzAnX/qQDHY1f
	biuQdfZnOozG66HAIeEOhn5klAIaAI9eiR5vQIQiGFVOQctesdY8YRpG+Uq62CNbHu8=
X-Gm-Gg: ASbGnctt7u+eJHaHFM822O0gj0x7a60/CVYowLoANFGNtB2z7UhsuW6U5G2B9/HqiJt
	NMlocIVitIglMu9TS1PbGM63nWst2qT3Fyanlxw2THUYjxUY2tJP61ezWeW0Rqy6PpmmN3W7vXv
	bRSK5Z7OaN+plPiDYf5ao1FDGhK7OX0iaB5QtRbN/YwcnJA9/RliLce0orvfyYseSgdoZMioROO
	qsga0wbGg4f1jaP1RPuzkm3cSXKccw4rg/JdWIDWhFffHZX/7SIHfVenYNAnB0oqZm7D4JfiVzm
	AR8AN8NiAtbpSiNDBJ0pGloEokhjnHhLTy16P4WkVJp43Qum92kkfhaxatfP+9aQ7QRAp5HLgjv
	OcIC+kM0JXk5tu2G8Ri/jN3/AsEvUZbHQVvSz8BavrCRanmmHRzrqRM/+b2s8EMMWgCkC4Bu7zD
	Cj0BeZSuPvgHOc9fRx9KklZfauSkMGXuKfbHbFQh7dO5dFuAMN
X-Google-Smtp-Source: AGHT+IE8jnvQeee4jfkUe0eNd4dGQ08MAZNTYzc8QSoRvga5Vrve+0ByWa9HTmuY8kRWFS1KbFWZ2Q==
X-Received: by 2002:a05:6512:3d87:b0:592:f441:9283 with SMTP id 2adb3069b0e04-5943d55bb8dmr2219934e87.5.1762440878650;
        Thu, 06 Nov 2025 06:54:38 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a59e83csm754676e87.106.2025.11.06.06.54.36
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:54:37 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59431f57bf6so1101636e87.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2025 06:54:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHFn9aut9rrRg02iacdX8iC2cEB4ngW4SrbeqvSVr19Y0hf4dGEoyzd9Sa0KDLwwX6IEyUZ5ttKu4=@lists.infradead.org
X-Received: by 2002:a05:6402:1ed5:b0:640:b643:f3c5 with SMTP id
 4fb4d7f45d1cf-641058cf323mr7301623a12.16.1762440555932; Thu, 06 Nov 2025
 06:49:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com>
In-Reply-To: <aQy0T2vUINze_6_q@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 15:49:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
X-Gm-Features: AWmQ_bnZOzLGAFcWzxKh1EIKjH4MNs7moeVCtN8xGb6mN65nYBliBYrABdUBf0M
Message-ID: <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
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
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_065441_747230_2BA78EE7 
X-CRM114-Status: GOOD (  28.11  )
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

On Thu, 6 Nov 2025 at 15:44, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Thu, Nov 06, 2025 at 02:34:00PM +0100, Geert Uytterhoeven wrote:
> > The BUILD_BUG_ON_MSG() check against "~0ull" works only with "unsigned
> > (long) long" _mask types.  For constant masks, that condition is usually
> > met, as GENMASK() yields an UL value.  The few places where the
> > constant mask is stored in an intermediate variable were fixed by
> > changing the variable type to u64 (see e.g. [1] and [2]).
> >
> > However, for non-constant masks, smaller unsigned types should be valid,
> > too, but currently lead to "result of comparison of constant
> > 18446744073709551615 with expression of type ... is always
> > false"-warnings with clang and W=1.
> >
> > Hence refactor the __BF_FIELD_CHECK() helper, and factor out
> > __FIELD_{GET,PREP}().  The later lack the single problematic check, but
> > are otherwise identical to FIELD_{GET,PREP}(), and are intended to be
> > used in the fully non-const variants later.
> >
> > [1] commit 5c667d5a5a3ec166 ("clk: sp7021: Adjust width of _m in
> >     HWM_FIELD_PREP()")
> > [2] commit cfd6fb45cfaf46fa ("crypto: ccree - avoid out-of-range
> >     warnings from clang")
>
> Also can be made as
>
> Link: https://git.kernel.org/torvalds/c/5c667d5a5a3ec166 [1]

Nooooh... torvalds might click on it, and complain ;-)

> > +     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
> > +                      __bf_cast_unsigned(reg, ~0ull),                \
> > +                      pfx "type of reg too small for mask")
>
> Perhaps we may convert this (and others?) to static_assert():s at some point?

Nick tried that before, without success:
https://lore.kernel.org/all/CAKwvOdm_prtk1UQNJQGidZm44Lk582S3p=of0y46+rVjnSgXJg@mail.gmail.com

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
