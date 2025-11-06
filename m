Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA125CCF9F8
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 16:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZk/CBvV+3TByF+UaJ/mZibaYpESWjOGBv6QsLJnz24=; b=Ikr70wjzvQFsjG
	B/rVfgn5JD+ypJM+Lkm2x3sb4dZy/DX+JUai+Qg6rbJ7/LucYAdRjdRa3T2xBj5IC7vq7Kj+FWq03
	mdczQv0Z39Jzcx2x0A4h1IOoKPwscUPJKi08JV4OcqCRH8zYGxaNc3n+XlqTFPg25u5dDPvtpiBwZ
	+pd7Zic9kGNPSN69FeVO/D11mWGTGJ53f4lP7Ui77ElH0ZGTa6fKvpbYMZKDgNwyNpMp9dKOwPbtb
	vlon5cZDIw8jVVkWRwT6wpBZ8lZoH8JsxXsewDYsSojxy4oQPQQ5ZbZG1DKSjgnpzCT7N7C874A1X
	MwRnsggULWkh6kbSk+Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH36i-0000000FxOJ-45kX;
	Thu, 06 Nov 2025 16:45:08 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH36e-0000000FxNR-0LEe
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 16:45:06 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-7864ab69f01so10534227b3.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2025 08:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762447503; x=1763052303; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YCzuZ/teXYU7yevuP9B3flHK19xr/xlr710i4rE8skU=;
        b=Rs/tPb5UxR4cCNTll03lXhVZXyNTm8sGYno+1X6NCiYtmar3HVCTGgKZQxPK5M2OaC
         X0B0vE35zqgjtlCLmT7sJiWtIlEoT6zc/iYyeZGWS6HpRvZotzOcFtBrthcdKuMp0x1t
         JP3lrAtYqWnB2H5hVLOBTFK8RbJTmdVMj+4MllEArDhCgvdio5tjHNosl0CyZtOnEhYv
         WRVLnnAOiw2cOWCae9U1Zj9uypT2+RDxfGahIqbraCWOi4WaS5szfNR04CKNoT4QW+o/
         7KeaTySKBEtpOqpKImoF39YEOfg6LwSOGuqaWdKo3d7AZG2YKmLKdsI74UQar7F9qh2h
         myJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762447503; x=1763052303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCzuZ/teXYU7yevuP9B3flHK19xr/xlr710i4rE8skU=;
        b=w2EldyqD3QnDQDTdXpM7u36kCsGNsDgiRe0ZnxQrNaIxpo09dqVlonQTMTFjweFc9B
         GR5bORrib5orSQMEjN26n859wnPU4kxYZVLLPdG499Y/3sm0z1NmSj9evJ7krtiQzM8y
         JW6KlnHodRtUrWuOt+ebOoCAo9SLYibIHJ8Q0Vn1Cc1ykparWtR6B1FHMmuthpI8HyBF
         3NYZeCktrdLkJUE4DuP1p6Gh4JdbdxGd8q15rBixpBWSgV6zlhM7JYOFE6I53rwY/E1c
         7bwDeK9sK6jTixaCGMQ418ihO2kMS8XIA3mlTv6SlpohewivMV0sZN6heEHG0y5vb1Uw
         bsrA==
X-Forwarded-Encrypted: i=1; AJvYcCU96Sr53ncqcftYqTfwkIZ5/G9+3rrbsGnoSQAT+o/Vv2RPVoFzAQS3XaE6R6zEmUbZZ/oK1oxMRuU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQroa1gwALAmuOx8c8bKde5NCdMxlFZrnwnrXKr0Hmmx7DQvxY
	/lnyXycLyC/TOdLj4VGyB9okV6FcY9OwnOfnyVHg1QT/FNrcTecEYPnu
X-Gm-Gg: ASbGncugrmcJCAyb8XsGulyJ2QeVLzq+j86246xmz+QvSJEgelnRtOHMaCMg3ullIaJ
	UAxYVOniU5oDotM+MYynBZLkVzFboXszBOteJeQg5LTQadlrrgHOEIiptXSrsETnT45f8HKvS8v
	Elu+YWsUlT1jDy7LiK9ZB3CMS2JfyrO7hLDd+b4u2jQUtLdiDvTwAlDflW1DZIZLKQvrylgyNHS
	yOidWO85J6VXoybXEFIDTNcLeOBRDQryctVCBA0K13DMoot892H83r2S4+kn4Wpz4HFUTML+ogv
	Gvjy5DhKrWwn1Q8xxLIVYWfB2yrDASXRD0WdhJykJU/xjZTOmXdJAJF1DhAWPgjxTP5n/aJ8Bl0
	klAXhipbpq44OKV/tSoAHSzYxSLej/ONjPLFHk21zTCsc5RhoxjrvTCz8dByT92RnUP9Ro8etHf
	rt+LVgdxLxnzeobbuzCbdzVUkgUu6/LLuyvjhxoVAvVFQ=
X-Google-Smtp-Source: AGHT+IFgqblsjDg64jVhZU34czKFHTApBwHTvzKvobAZn60rv4BaSs97biLpVcByf7R85pQynTZCWw==
X-Received: by 2002:a05:690c:46c3:b0:786:45ce:9bd3 with SMTP id 00721157ae682-786a41b2455mr71656237b3.34.1762447502815;
        Thu, 06 Nov 2025 08:45:02 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-787b13b6954sm9471997b3.5.2025.11.06.08.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:45:02 -0800 (PST)
Date: Thu, 6 Nov 2025 11:45:01 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
Subject: Re: [PATCH v6 00/26] Non-const bitfield helpers
Message-ID: <aQzQjSMOSrUIgMCL@yury>
References: <cover.1762435376.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1762435376.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_084504_141911_D9E3A728 
X-CRM114-Status: GOOD (  19.47  )
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

On Thu, Nov 06, 2025 at 02:33:48PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> <linux/bitfield.h> contains various helpers for accessing bitfields, as
> typically used in hardware registers for memory-mapped I/O blocks.
> These helpers ensure type safety, and deduce automatically shift values
> from mask values, avoiding mistakes due to inconsistent shifts and
> masks, and leading to a reduction in source code size.
> 
> The existing FIELD_{GET,PREP}() macros are limited to compile-time
> constants.  However, it is very common to prepare or extract bitfield
> elements where the bitfield mask is not a compile-time constant (e.g. it
> comes from a table, or is created by shifting a compile-time constant).
> To avoid this limitation, the AT91 clock driver introduced its own
> field_{prep,get}() macros.  During the past four years, these have been
> copied to multiple drivers, and more copies are on their way[1], leading
> to the obvious review comment "please move this to <linux/bitfield.h>".
> 
> Hence this series
>   1. Takes preparatory steps in drivers definining local
>      field_{get,prep}() macros (patches 1-11),
>   2. Introduces __FIELD_{PREP,GET}() helpers to avoid clang W=1 warnings
>      (patch 12),
>   3. Makes field_{prep,get}() available for general use (patch 13),
>   4. Converts drivers with local variants to the common helpers (patches
>      14-24),
>   5. Converts a few Renesas drivers to the existing FIELD_{GET,PREP}()
>      and the new field_{get,prep}() helpers (patches 25-26).
> 
> Alternatives would be to use the typed {u*,be*,le*,...}_{get,encode}_bits()
> macros instead (which currently do not work with non-constant masks
> either, and the first attempt to change that generates much worse code),
> or to store the low bit and width of the mask instead (which would
> require changing all code that passes masks directly, and also generates
> worse code).

Everyone please send your tags. I'm going to merge it in
bitmap-for-next before Monday.

Thanks,
Yury

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
