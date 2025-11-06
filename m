Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907B6CCF9F8
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GX5QZ9haCRpJf26MIklf8XnvVcGKq5TiTz0afotG/Yc=; b=uSus9efoSoB9C8
	B3qWYW5j3qixN1BUxTba0rkRYA0sh3ifQ9D+WMI45J2H6e5vNqxTbN486z/6tYxanI8Xdh+ZKzpAD
	9+NMOjBKcc/oGhU8ML3GxxAHdoBa+gfGGXOTtyawFEN9Ail2UU3C8NZJRN9zvCJzPIjEZVPxAql2v
	V6qq0ObcjWhCBh0y5qq4Zxyzj92jGfoBBrZEpJbIkY2Vvc4NERkikytIs9/KwciEbNI3Ptbb6bLbI
	FerLZdc333LwgFsKPLCxyyk4Kl7lZmSYhjQ7B9J8jiOSnthCsWf4mQ2xaGprxhoWMWCgz2gYnJMCq
	pPaMYw0TsWWOgKXUQcEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2tv-0000000Fvm9-0Flt;
	Thu, 06 Nov 2025 16:31:55 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2ts-0000000FvlK-0q2u
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 16:31:53 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-63f96d5038dso1240003d50.1
        for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2025 08:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762446711; x=1763051511; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mLV2PDnl4Ik3dMiBcJ6vRzCiNGFzAVWq7I4DrxmSPKg=;
        b=Uq/PzfNCLtboA9D2iO7q4wgB57B+LHEre389cw+C9LdUPzlTJ7bFDR4gQ0a3EuFArb
         GhY8r77dMnN/4d6JWR52oGfwNbGTDKxuI04UUyTddjZBeY+5yb6JaUz2XMYaxi5egBUZ
         mo5AD1QHl6JpYWnockomkHrGLMu+ktZLifuNK7Nee/kNOvUwWVtLnMHNH4XEOuEu3VKG
         U/hymygze82HH5dQQw25Qs4Ib8tMta39J5ZAX7UXGClRQbQN73XrBA9CVF1tSqTtfiMr
         /Au5JjTYQUGGXFm2eUAD59g3EaA2eOQc1gMYDxuAc5/TJQMnvUt8MS86DeOxfgRHwxMq
         ZFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446711; x=1763051511;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLV2PDnl4Ik3dMiBcJ6vRzCiNGFzAVWq7I4DrxmSPKg=;
        b=dqq/F15v722G3nKMXSLamsvQ4DTf48BPUJBcTz6ozq8wHx7yD9naY56hW9BTUaolNE
         KpAuo4gaFcTOb0Ffv4h5Eeq5F/DHCjq+R/aBH0UHiByZtgsm2PH7H4IbXtuOoYrlhRFI
         More1kqd+tB1U4DfPd1WURwXZLdQ3uwbuUy78vHk3nGJjydsoNu81MyeuCe+8Fz8Vi1c
         hhRdqhQbEzgfB8JMw5Cc7TD+8FbS1o26knEEjdqXaJOpwIEt3fQGyzLU31QICxzbkqe6
         9sNMIrpKw5cUm+IUAAP8SUF/0asC8ewmvBnhI9jYmsCyljdtJzCPG9NZtwBTWJ3bEg2d
         6Z2g==
X-Forwarded-Encrypted: i=1; AJvYcCVUF4iyJ29UCOaDvw1pVrM39FhKZMXrmH1AhpM6cOFyaq4cwV/Zy76o5mE21D9LGx0mijMM4N1biPQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7t/raUmx8cPBpuNx319YrzPQtwgZartxKN1Ph+WvcPHZu2tjO
	hEiP4lCJVL8bfQh3/tRGKomPcuxjhDO0ZasCwK3F7pHgawOI3aA87RNT
X-Gm-Gg: ASbGncviAU1P5pe/d3gxSPOIy60jWruuYozCz7UMVK7Bxrim2SWk7hdIBOXAMUUpS5x
	nROZB2nqluDqezZGp1vsm2hch6F9+ywtDOmBcnPA9F4mXlSUh4+KwyayRcoxDC8VJ+8Na2bs7qx
	thYlDlS8/jfJtkV5UPAhXmaFLDQmIDQka/4E5xEs0selEYR8qKsk+7sibf6HOSe8xPGicbfdibJ
	h4d92dZerG/UgcaA7bxxHCgaAKIoPyKP1y74Fon0XVktib22+kZjpWg6vD21srw8HgHKPllB+fR
	IAEQUDG28cyaDVzSbxJZPsYvy60OBvob6KA/1ptpb2PnFi2+o7qm9Q4OYodI4RBaW0uuIz9aN5W
	a2PN9i3RVlTFcU2CAsMy59kzHKc6Iusq+E+/JJeJBWWYxRM5cs4vNuwPfiQiI+AaFOMq/vmNJ2c
	3VcGqNCCZ5W/HSoRV/jxcPG/r2cbECEA2P
X-Google-Smtp-Source: AGHT+IEpqWmkZjuH3DQIeoTdW2YBETsoULiRC/YJVd9G+NTFiGKOkPxXPnseVKzqKGSB50LDoYAi6w==
X-Received: by 2002:a05:690e:4109:b0:63f:b9d1:b165 with SMTP id 956f58d0204a3-63fd359be98mr4428593d50.50.1762446710597;
        Thu, 06 Nov 2025 08:31:50 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-640b5d94487sm902855d50.21.2025.11.06.08.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:31:49 -0800 (PST)
Date: Thu, 6 Nov 2025 11:31:48 -0500
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
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v6 13/26] bitfield: Add non-constant field_{prep,get}()
 helpers
Message-ID: <aQzNdJFcStVak5jS@yury>
References: <cover.1762435376.git.geert+renesas@glider.be>
 <62a5058e460129155e4e7539e37140bd0f0d4abc.1762435376.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62a5058e460129155e4e7539e37140bd0f0d4abc.1762435376.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_083152_264825_B93C9F82 
X-CRM114-Status: GOOD (  35.38  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 06, 2025 at 02:34:01PM +0100, Geert Uytterhoeven wrote:
> The existing FIELD_{GET,PREP}() macros are limited to compile-time
> constants.  However, it is very common to prepare or extract bitfield
> elements where the bitfield mask is not a compile-time constant.
> =

> To avoid this limitation, the AT91 clock driver and several other
> drivers already have their own non-const field_{prep,get}() macros.
> Make them available for general use by adding them to
> <linux/bitfield.h>, and improve them slightly:
>   1. Avoid evaluating macro parameters more than once,
>   2. Replace "ffs() - 1" by "__ffs()",
>   3. Support 64-bit use on 32-bit architectures,
>   4. Wire field_{get,prep}() to FIELD_{GET,PREP}() when mask is
>      actually constant.
> =

> This is deliberately not merged into the existing FIELD_{GET,PREP}()
> macros, as people expressed the desire to keep stricter variants for
> increased safety, or for performance critical paths.
> =

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Acked-by: Crt Mori <cmo@melexis.com>
> Acked-by: Nuno S=E1 <nuno.sa@analog.com>
> Acked-by: Richard Genoud <richard.genoud@bootlin.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> ---
> v6:
>   - Align \,
>   - Add Return sections to kerneldoc,
>   - Add Reviewed-by,
>   - Document field_{get,prep} in top comment block,
>   - Use less-checking __FIELD_{GET,PREP}() to avoid build issues with
>     clang and W=3D1:
>     https://lore.kernel.org/all/202510281335.UpSLYJG9-lkp@intel.com
>     https://lore.kernel.org/all/202510281414.DnejZh4n-lkp@intel.com
>     https://lore.kernel.org/all/202510281304.RK3J3c3t-lkp@intel.com
> =

> v5:
>   - Add Acked-by,
>   - Split off changes outside <linux/bitfield.h>,
>   - Document that mask must be non-zero,
>   - Document typical usage pattern,
>   - Recommend using FIELD_{PREP,GET}() directly to ensure compile-time
>     constant masks,
>   - Check BITS_PER_TYPE(mask) instead of sizeof(mask),
>   - Wire field_{get,prep}() to FIELD_{GET,PREP}() when mask is
>     constant, to improve type checking.
> =

> v4:
>   - Add Acked-by,
>   - Rebase on top of commit 7c68005a46108ffa ("crypto: qat - relocate
>     power management debugfs helper APIs") in v6.17-rc1,
>   - Convert more recently introduced upstream copies:
>       - drivers/edac/ie31200_edac.c
>       - drivers/iio/dac/ad3530r.c
> =

> v3:
>   - Add Acked-by,
>   - Drop underscores from macro parameters,
>   - Use __auto_type where possible,
>   - Correctly cast reg to the mask type,
>   - Introduces __val and __reg intermediates to simplify the actual
>     operation,
>   - Drop unneeded parentheses,
>   - Clarify having both FIELD_{GET,PREP}() and field_{get,prep}(),
> =

> v2:
>   - Cast val resp. reg to the mask type,
>   - Fix 64-bit use on 32-bit architectures,
>   - Convert new upstream users:
>       - drivers/crypto/intel/qat/qat_common/adf_gen4_pm_debugfs.c
>       - drivers/gpio/gpio-aspeed.c
>       - drivers/iio/temperature/mlx90614.c
>       - drivers/pinctrl/nuvoton/pinctrl-ma35.c
>       - sound/usb/mixer_quirks.c
>   - Convert new user queued in renesas-devel for v6.15:
>       - drivers/soc/renesas/rz-sysc.c
> ---
>  include/linux/bitfield.h | 59 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> =

> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index bf8e0ae4b5b41038..f92e18c9629a59c6 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -17,6 +17,7 @@
>   * FIELD_{GET,PREP} macros take as first parameter shifted mask
>   * from which they extract the base mask and shift amount.
>   * Mask must be a compilation time constant.
> + * field_{get,prep} are variants that take a non-const mask.
>   *
>   * Example:
>   *
> @@ -240,4 +241,62 @@ __MAKE_OP(64)
>  #undef __MAKE_OP
>  #undef ____MAKE_OP
>  =

> +#define __field_prep(mask, val)						\
> +	({								\
> +		__auto_type __mask =3D (mask);				\
> +		typeof(mask) __val =3D (val);				\

typeof(__mask), I guess.

> +		unsigned int __shift =3D BITS_PER_TYPE(mask) <=3D 32 ?	\

Same here: BITS_PER_TYPE(__mask). BITS_PER_TYPE() doesn't evaluate the
expression because it is based on sizeof(). But we definitely don't
want people check it every time they read the code.

No need to send another version for this. I can fix it inplace.

Reviewed-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

> +				       __ffs(__mask) : __ffs64(__mask);	\
> +		(__val << __shift) & __mask;				\
> +	})
> +
> +#define __field_get(mask, reg)						\
> +	({								\
> +		__auto_type __mask =3D (mask);				\
> +		typeof(mask) __reg =3D  (reg);				\
> +		unsigned int __shift =3D BITS_PER_TYPE(mask) <=3D 32 ?	\
> +				       __ffs(__mask) : __ffs64(__mask);	\
> +		(__reg & __mask) >> __shift;				\
> +	})
> +
> +/**
> + * field_prep() - prepare a bitfield element
> + * @mask: shifted mask defining the field's length and position, must be
> + *        non-zero
> + * @val:  value to put in the field
> + *
> + * Return: field value masked and shifted to its final destination
> + *
> + * field_prep() masks and shifts up the value.  The result should be
> + * combined with other fields of the bitfield using logical OR.
> + * Unlike FIELD_PREP(), @mask is not limited to a compile-time constant.
> + * Typical usage patterns are a value stored in a table, or calculated by
> + * shifting a constant by a variable number of bits.
> + * If you want to ensure that @mask is a compile-time constant, please u=
se
> + * FIELD_PREP() directly instead.
> + */
> +#define field_prep(mask, val)						\
> +	(__builtin_constant_p(mask) ? __FIELD_PREP(mask, val, "field_prep: ") \
> +				    : __field_prep(mask, val))
> +
> +/**
> + * field_get() - extract a bitfield element
> + * @mask: shifted mask defining the field's length and position, must be
> + *        non-zero
> + * @reg:  value of entire bitfield
> + *
> + * Return: extracted field value
> + *
> + * field_get() extracts the field specified by @mask from the
> + * bitfield passed in as @reg by masking and shifting it down.
> + * Unlike FIELD_GET(), @mask is not limited to a compile-time constant.
> + * Typical usage patterns are a value stored in a table, or calculated by
> + * shifting a constant by a variable number of bits.
> + * If you want to ensure that @mask is a compile-time constant, please u=
se
> + * FIELD_GET() directly instead.
> + */
> +#define field_get(mask, reg)						\
> +	(__builtin_constant_p(mask) ? __FIELD_GET(mask, reg, "field_get: ") \
> +				    : __field_get(mask, reg))
> +
>  #endif
> -- =

> 2.43.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
