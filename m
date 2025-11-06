Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6561ECCFA05
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 16:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmV5Y7joMjbZkX0JWn7VCMble/JTdq8+275+0myqDRI=; b=Rqf7PYt+ql8atf
	eLWI1qVF0N/pTVV7uGGglz8sqRCLwuV2DSKrEU7NHyI/NgzyuK67pFODkVzYXvISwFZ7ZyGovKTaK
	sP4AUu/X8+jA0nUGdeRPxQG7QJ1zsCsq7Kidt0B8uE93BTbaFIgbt30MM/kb2YYTZKIPWjHLeih0M
	ERqWISN09EBHcylTZ58JCI99k7Txwn2H8EEx+7aPWHKRfnZYitq/2Bq4S3AJDHSNAvt/RqmYGnyZV
	EYuVqaUlPGElzXVaeYiwpB0rL2R4+kDR2LpioFym7Pb58YBbW0QO1N5DJ0OlFPxytfqzZdnROFCCt
	tld4PuPu2oJZXRDXj+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2Ql-0000000FriI-3aLX;
	Thu, 06 Nov 2025 16:01:47 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2Qj-0000000FrhZ-0odj
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 16:01:46 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-7864cef1976so32906797b3.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2025 08:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762444902; x=1763049702; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uDqvdpSXd7EVG4K3GSPuN1+lwa+x8rxJ7aM50JiFwXE=;
        b=jFrHqowt8RqTdQ8xo7YEuo53gwB/94aajjBi+Of+k6LqNhEVdgRLYxrMoHrxC7am9N
         GSC1WpVtYNQuy5AoXgItSmUIDPNDBrxfdi7uc71gjE1wru7QJNRrqmZkgwVrGh6fq+ZQ
         WfCpIKBZO62tb+xDqcHTVwjXFXKdtf2ktaj8c8Qaui3PQ6XIjPALDEHa+k7SWAHsaYiw
         VtBUT8pTdoKBYZyTP1uxFi2SvPu6IDHxUx1RdaEBKYp3uJxQ4f/RhZyqOdMXAQaebaQx
         +NKc5gSSCO8ZInVH/+7NKrUIflzL6nsBixXxAMcI8XkCBvj9WM1b4gUQRAUp3RBQDh2Q
         hOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762444902; x=1763049702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDqvdpSXd7EVG4K3GSPuN1+lwa+x8rxJ7aM50JiFwXE=;
        b=stPyNMHpfKtx4SQXktP5Rll/Ac+hesRTbAwOWTICjrK695LHZXpbWPacLodbnz1NkS
         QVwPOyMfqzxVjV/4HLO9tK9IpErzgt0YwY3ZDfcl3g14DGPiM8CXXiR0eKH1w/tNTRAi
         s5A9RgR4PCY/jkeDfJSgtCrV9PVfF9dpawGVDaITK5ivpNvcCyFP8zlIwTcwYx3oDflQ
         bdTmbwLRFi8pzRkS85QizZV2yx25LhKswsSjBQ/S7+fepZlWDmCnM/XQ02Z4oTIQdO9b
         p6iIY98Wm/s2jLltvt8kErZ5BNyhoZRNCdISAviIvi+x0QQMc1GGWE4KXJpaRxjN1iN5
         vJcg==
X-Forwarded-Encrypted: i=1; AJvYcCWIccy6vSysRncQqdEnJq53W+btpkZxe6a0FMlfK9P2UEeV/B4rnnMripv6RLqyr5I8csBVRaabteA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdORNZXweRGmqNIC+H8I2nXnZSn3kgR4XuvxphbPs4chpn8Dei
	pBQtcp4hW9rBA8AObqvc50HPkVmVxr3TtIMRQg2YVg4YZVBesHn6G0+i
X-Gm-Gg: ASbGncsHUsOckBDxdDbA9bgw6xvgU7s7bG61YfzbJzSm6B6ErE/PCtebcbobd89bRXk
	0GmunW7T/xbG4kqMHeJ+xmf+QRSKvzRv9ZeWw8mIyvhni13xK81ULJ4rrsUg01UF363axW06P9t
	iHivD3sxp5/ck3gX2gXigqbJtm0iBaZcyH+5aqo4cimvzbzWtHr7J26+h//n4r+kRwOvfciQpkO
	j87IB+lpnpaSZL2QpGYHxMoOYdFEAcHlkuIrZk6bwaqRxYCJDuQj05Sqv71XOcb7eyseeOdxTPx
	O6EfxHCJ6iN+VsDYXm/UrwjgeU7XszDVfV+DNlKP5xPejznYVO8FZGWsYQPP+Rhlk1CNaTCRgP9
	uSxzOG8yWQZArUp4sALZcYt/Vj5EAOLLYV9vn2UIpwMq5psL0QyxNhLoVkLqG2Qc5GiVbW4qW3Q
	otnXNCa7VRWCaE8q1TSeRBEabK9Qrsg7Sw
X-Google-Smtp-Source: AGHT+IHH1OiCGEbzPId419SmPeowjgjZvd2uwuBPgu14uOeMTfnhF3EzyBaZ3Vf1fe9K5qAqRN9gOQ==
X-Received: by 2002:a05:690e:2405:b0:63f:b1fd:3850 with SMTP id 956f58d0204a3-640c3b56ae5mr33952d50.33.1762444901924;
        Thu, 06 Nov 2025 08:01:41 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-787b15d6379sm9121887b3.45.2025.11.06.08.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:01:40 -0800 (PST)
Date: Thu, 6 Nov 2025 11:01:39 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Miller <davem@davemloft.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Crt Mori <cmo@melexis.com>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>,
	David Laight <david.laight.linux@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jianping Shen <Jianping.Shen@de.bosch.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-edac@vger.kernel.org, qat-linux@intel.com,
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 12/26] bitfield: Add less-checking __FIELD_{GET,PREP}()
Message-ID: <aQzGY4AKiMQpuL0R@yury>
References: <cover.1762435376.git.geert+renesas@glider.be>
 <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQy0T2vUINze_6_q@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_080145_236494_52B806A7 
X-CRM114-Status: GOOD (  24.11  )
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

On Thu, Nov 06, 2025 at 04:44:31PM +0200, Andy Shevchenko wrote:
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
> 
> Also can be made as
> 
> Link: https://git.kernel.org/torvalds/c/5c667d5a5a3ec166 [1]
> 
> The positive effect that one may click that on Git Web.
> Ideally, of course, would be an additional parses on Git Web kernel.org uses to
> parse that standard "commit ...()" notation to add the respective HREF link.

Those flying over Atlantic or cruising cross Caribbean would disagree. :)
 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ...
> 
> > +	BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >		\
> > +			 __bf_cast_unsigned(reg, ~0ull),		\
> > +			 pfx "type of reg too small for mask")
> 
> Perhaps we may convert this (and others?) to static_assert():s at some point?
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
