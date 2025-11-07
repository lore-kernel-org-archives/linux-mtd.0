Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB138CCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Nov 2025 08:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/a7wRHJSp8Kn9Zy29okezJEAQQz31pSafh56uxGY4E=; b=WEq4XdS0PI1+BO
	4h8x9z+ctVPr6eo4PWdJ+oQh7YOZyeQ05DtFliwh/nf8Oejo4ZxtSifuqVq3RJb4NzMM5YWomOlgi
	lcDrvxOlEtZeqfGbPlnVpaBYRzyIwNU5FWfS9iVPsdjaVR6sy/nw5X+WPOVxO7IXZGraboiseGsES
	8PfL+7DGo/PuJkjRO9qqr6Hk7Cq6qhm9EM18RYG+rIY2wM79WkDY6Q81fOrT+lm2QZEWOloXOI/nc
	RGMNLE971F5fw52YYBPRaXzAz0dGRg2tJ6IUDBhYne7jFIXWUnft9dWcZtN6t2TffFUp/ff7hI6vC
	Zxv40QdbcxNjy4HiWeHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHwI-0000000GtbK-0WGs;
	Fri, 07 Nov 2025 08:35:22 +0000
Received: from mail-vk1-f174.google.com ([209.85.221.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHwD-0000000Gtar-0PEL
	for linux-mtd@lists.infradead.org;
	Fri, 07 Nov 2025 08:35:20 +0000
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5563c36f6d4so343074e0c.1
        for <linux-mtd@lists.infradead.org>; Fri, 07 Nov 2025 00:35:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762504515; x=1763109315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsHZezS59+NExnNGIIdIy6ER8EF0CQG8kO0yNppcdcI=;
        b=Lso4yBnr2WpibEjAEDYpCIfUJHH1bg3DR6yagTErt5sb/4gpQSykFvkpPOriDA9hVc
         paJkDBI35q1azzAkfMRWKilmtyfoJl0xB7B73X10auwRPyd/nsI9VkekupctF+1bgycS
         CtGsJ4z6dNWhdNVyhW76VYyU1rRQCseTkDTqHejXUfWEUAF/LftwPEh6GLarDHKu54ie
         M6Fv7YOs71iRi0CHFXviDuPaA9Vlqpn9GLCnPxUEXX8cFtqhfzHfb+cpkxoNFaZPbS/Q
         Flo3mGKxSZCU1ncX0jWFBnOEmt1XC0pwnaR4t8zvrpDSdF442FtaSNfu+YG/L3hA5Hc5
         4nSA==
X-Forwarded-Encrypted: i=1; AJvYcCU77t0BhEXYcjuwr0F6uVhSxCtr574hLEBMUEkSA+PemD6FdsM1Y1cgBpjNZTrqP+7b8hAitKghXh8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzkvnJBPq05+cpQm+DdpB5k5yaWHbv5QSiS7EH+dZK4mu9QcJsp
	AJaKXn9dz+lDrFChsQ0lJVx+ZfPT5D6CumiMQqC5iVVbEvxTNykEMMFDHRyR9ITxm+k=
X-Gm-Gg: ASbGncsvjGQ38/mytVCMglM/kkHJ/n5cpcqkk06ILol8ZoMfCwgOOI91vABavKcsXYt
	Vuq940zv27NIRhew1t296DJ4D0vcnJZadd4qHFVRdBj/LhHFD8YNCjNzMN/G28c27RaZ8zVFB3O
	MelnsBvQDXrjN4xDhWmqSjlbD5akzdVSoKI1j+GziHnmsUg0Cd2qER9ZugiPOYDCHllBKXd9DaU
	D/ME+g4HopZha4X1c3VMoXFndvYkpbjJwkeq34gFzetdFa5dHrIOD1Tn5mYVgnhiMfLvPfjz0lr
	+bG35UBeawo1CiWzy0BUph/N6wmF9geq+vL10WnBsHK5Na4p1xd+WUlrtSGTvUgVrvaewX2L3sY
	BXbXzZyH6ZesPyBRDaVR3zGW1LmiX48oF8VvIqL3wQiBx8swakelj7GopBtAJIqQ3O5IpEjFqjJ
	Rx2avUnzLnlNOxN8He57jc2/lWNoe3DFN1OF6zFw==
X-Google-Smtp-Source: AGHT+IGt8qAgxvNrl8zfzNEOiaiRI9mgwoZv6Rs2PVZ4ddgK7Qn63VrwXLjH/N5P8DttCwqJVXRXig==
X-Received: by 2002:a05:6122:787:b0:54a:a3b1:db63 with SMTP id 71dfb90a1353d-559aaecd177mr243851e0c.6.1762504515470;
        Fri, 07 Nov 2025 00:35:15 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5599582860asm2710309e0c.16.2025.11.07.00.35.14
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:35:15 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso455342137.1
        for <linux-mtd@lists.infradead.org>; Fri, 07 Nov 2025 00:35:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZKgA8NN/SBdjU+d2axzfAE9cNnRFqvByTwINaIh96ezfZtZMXzZkk6XMiGDFhh0oVq86jFCL9OZ4=@lists.infradead.org
X-Received: by 2002:a05:6102:4425:b0:5db:e32d:a3ff with SMTP id
 ada2fe7eead31-5ddb9e056aemr278996137.19.1762504514580; Fri, 07 Nov 2025
 00:35:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com> <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
 <aQzIIqNnTY41giH_@smile.fi.intel.com> <CAMuHMdW8ndAdGnSHopYFMWvw7wk7wKz_7+N91M1jRHoqK1KBrg@mail.gmail.com>
 <c62eb5a727f149fb9d8b4a4c8d77418a@realtek.com>
In-Reply-To: <c62eb5a727f149fb9d8b4a4c8d77418a@realtek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Nov 2025 09:35:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU3hWDOWXxuOJcBA7tphBT7X-0H+g0-oq0tZdKw+O5W3A@mail.gmail.com>
X-Gm-Features: AWmQ_bkZe8xF0tkRpW5gVlylkcfm2r3jZb2Xa1XdOQVS8F7wx8KXagIs6XSHJvI
Message-ID: <CAMuHMdU3hWDOWXxuOJcBA7tphBT7X-0H+g0-oq0tZdKw+O5W3A@mail.gmail.com>
Subject: Re: [PATCH v6 12/26] bitfield: Add less-checking __FIELD_{GET,PREP}()
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Yury Norov <yury.norov@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
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
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "qat-linux@intel.com" <qat-linux@intel.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_003519_007384_39FDE809 
X-CRM114-Status: GOOD (  30.09  )
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

Hi Ping-Ke,

On Fri, 7 Nov 2025 at 02:16, Ping-Ke Shih <pkshih@realtek.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > The extra checking in field_prep() in case the compiler can
> > determine that the mask is a constant already found a possible bug
> > in drivers/net/wireless/realtek/rtw89/core.c:rtw89_roc_end():
> >
> >     rtw89_write32_mask(rtwdev, reg, B_AX_RX_FLTR_CFG_MASK, rtwdev->hal.rx_fltr);
> >
> > drivers/net/wireless/realtek/rtw89/reg.h:
> >
> >     #define B_AX_RX_MPDU_MAX_LEN_MASK GENMASK(21, 16)
> >     #define B_AX_RX_FLTR_CFG_MASK ((u32)~B_AX_RX_MPDU_MAX_LEN_MASK)
> >
> > so it looks like B_AX_RX_FLTR_CFG_MASK is not the proper mask for
> > this operation...
>
> The purpose of the statements is to update values excluding bits of
> B_AX_RX_MPDU_MAX_LEN_MASK. The use of B_AX_RX_FLTR_CFG_MASK is tricky, but
> the operation is correct because bit 0 is set, so __ffs(mask) returns 0 in
> rtw89_write32_mask(). Then, operation looks like
>
>    orig = read(reg);
>    new = (orig & ~mask) | (data & mask);
>    write(new);

Thanks for your quick confirmation!
So the intention really is to clear bits 22-31, and write the rx_fltr
value to bits 0-15?

if the clearing is not needed, it would be better to use
#define B_AX_RX_FLTR_CFG_MASK GENMASK(15, 0)

If the clearing is needed, I still think it would be better to
change B_AX_RX_FLTR_CFG_MASK, and split the clearing off in a separate
operation, to make it more explicit and obvious for the casual reader.

> Since we don't use FIELD_{GET,PREP} macros with B_AX_RX_FLTR_CFG_MASK, how
> can you find the problem? Please guide us. Thanks.

I still have "[PATCH/RFC 17/17] rtw89: Use bitfield helpers"
https://lore.kernel.org/all/f7b81122f7596fa004188bfae68f25a68c2d2392.1637592133.git.geert+renesas@glider.be/
in my local tree, which started flagging the use of a discontiguous
mask with the improved checking in field_prep().

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
