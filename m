Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC976CF34B7
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYrr5cqRqB6LY4CR9TDqhWE5pzg8l0ndrgaqdXAnxeI=; b=ma0SSXuWb7mfuX
	QAmdtmy4HuVF5lx8+s2VSr1o877V7+r7+U1+WiO56WTdaUf0sxjWPJ5HY7IOhNmOfsRID7nKjm/+P
	XGs04grIAX5bDkjE8nUSIGe/+vuKlfbm3eHotxVbyNmGhTO4WhiS1n+pwjPqAYFiDPY8efMtGkxHR
	20Vt1tiC41ESKKnu2uT6XcBdDumaeBjIFDKqqln1//228eraj4JHRUodZCcCoKoEUS4N7u2UWgn44
	Gqe9HsmHx1zEHVpfTxhLObwGw97qhESZxT/zaYktfI3HSYI3NDx8e8DgXDBri49xCuPn20OGM6EKf
	XGKmg8c5MpTQmeTmEzzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjW1-00000003Puz-0BXH;
	Wed, 19 Nov 2025 14:50:37 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjVx-00000003Ptr-145B
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 14:50:35 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-88051279e87so72247866d6.3
        for <linux-mtd@lists.infradead.org>; Wed, 19 Nov 2025 06:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763563832; x=1764168632; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UEa5dU5h8VTkStggLA2EFBcu8SFqsu0VyRflw3qSQbY=;
        b=Ermq10M1B8TiAFSPiZBS4No0gfp0VF2PCPSlX1W6iLtJl1hcC80etK6UOcm88JbATA
         35N6pj2M1eZBQ6NLc7apRE1qm77n2tDnDW6a5QkxbSUdz77L3xnAXZEPooGXs6jdOtv+
         UqEBqbrLY/QBGEDsHixL7Pxf68GMt0beYbXonYgIZ0DVOcVzjX7zwpa2wPQddBI7Cu9H
         zV7IJ4J/LuLEHtxzHzMGzy/mLDgvLRYQSt2vuKJUcASnovaTYy8VhBhU/sZj9p/OmCbW
         CGDoxpErDKFkgOuP6/tj/pxksN8XndmJiCsewezVrzl+BSX2kvyfDk6LjO/9+B9d8OCs
         mxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763563832; x=1764168632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEa5dU5h8VTkStggLA2EFBcu8SFqsu0VyRflw3qSQbY=;
        b=Ias1W50Q42g+cqfjvMfPlyIHCJBY6CsUya/WHkvj8DTMrCugmhS2qD9s3BfDZlg/AD
         srlONHhXKpCIeA/NlkkDtsEP3iGdMQYctjaeg083M+KIZi4ksUNKtgjSLv5bD2Ee3b8P
         YemRZBd3m5kJ0wrETaSNB4tnJSFxNMEOOEFPO2Yw5MUA7it/Ab2LYL6hvlOvom02uCpQ
         4lwt/uPmVAcyTFZkJZNx793V5HhrnXFO3asl1jIrBbfvA6pJUXT0dA/RoxLcGACFD/y1
         ooCMk10yzynW7pLPft/EvAqW0e99JOm1zAzmSw0FsJCBbpOfFbUqEZmYJBkI4ruEHOoF
         vqMA==
X-Forwarded-Encrypted: i=1; AJvYcCX+m6RpB1Wa1YWNbjgC/h7xK5/HLjcKp1ateEumnZIqvdablc2bYxDjSXh68SgsEW36eoypz+t83Ys=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8BlvVNi6VI3we5HUymVA4yJDoclObio06sNLxotBohu+jRbV7
	zPQtG5m/rXpawIrRYGfBQffZJF1QmoPsRHI5jjPLVFoWh1uKCXLXIsIp
X-Gm-Gg: ASbGncsxSl6CyZWRYEPvZqXSSC2Dm3ljKWFXEae+s/F84CZ4CF0bISvOGo8OR/udCCx
	QoXqdCiyqoT8y3Zz22y52SJJleXddvrDv7or0k3FCfRaLsoP6kjOw/Y7Rr9PaJi2z4vcVZ1x5xJ
	3sP4Dsqnrdd5CgWnAs62yMhAm2zD7nWDUeXolnxfxB7eg4df7pRDBeilhZlvOc/OCxy4Vhd7tKP
	q6MAYBHxNfS2wflpVGC+bImjpv8tJ80CVPocC2ZT/Vq7Tdu3YoYdbQKg/nBN4gcEr7KJUXdizie
	Z07ylIpIKnTiZRWucSuFOeKdN/5UWzf5Hcec/6ICj1aYhZUxzocch40zuQAUN+rXAUv1+F6B6R2
	fbuXbDAqONN8YZHX88K59mZy9y7XpzCrbKnQcSc+g30eJsdO5R0SmxMW9cAuJ40rsz0AjQyKu4v
	zWrrfT3uCIKAKiFG7O8A==
X-Google-Smtp-Source: AGHT+IEl27VY0Fzg06WvTYKsPnTaG3CI8XR1O4Jx2OOSNMzexShqbizbMp95FvmlDbVG54xJ6MBR9A==
X-Received: by 2002:a05:6214:529d:b0:882:49f4:da25 with SMTP id 6a1803df08f44-8829269e07bmr301776726d6.39.1763563831679;
        Wed, 19 Nov 2025 06:50:31 -0800 (PST)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-882862d04e1sm135929226d6.7.2025.11.19.06.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 06:50:31 -0800 (PST)
Date: Wed, 19 Nov 2025 09:50:30 -0500
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
Message-ID: <aR3ZNmSMmtSsUR23@yury>
References: <cover.1762435376.git.geert+renesas@glider.be>
 <aQzQjSMOSrUIgMCL@yury>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQzQjSMOSrUIgMCL@yury>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_065033_337461_634CF01C 
X-CRM114-Status: GOOD (  24.37  )
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

On Thu, Nov 06, 2025 at 11:45:02AM -0500, Yury Norov wrote:
> On Thu, Nov 06, 2025 at 02:33:48PM +0100, Geert Uytterhoeven wrote:
> > 	Hi all,
> > 
> > <linux/bitfield.h> contains various helpers for accessing bitfields, as
> > typically used in hardware registers for memory-mapped I/O blocks.
> > These helpers ensure type safety, and deduce automatically shift values
> > from mask values, avoiding mistakes due to inconsistent shifts and
> > masks, and leading to a reduction in source code size.
> > 
> > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > constants.  However, it is very common to prepare or extract bitfield
> > elements where the bitfield mask is not a compile-time constant (e.g. it
> > comes from a table, or is created by shifting a compile-time constant).
> > To avoid this limitation, the AT91 clock driver introduced its own
> > field_{prep,get}() macros.  During the past four years, these have been
> > copied to multiple drivers, and more copies are on their way[1], leading
> > to the obvious review comment "please move this to <linux/bitfield.h>".
> > 
> > Hence this series
> >   1. Takes preparatory steps in drivers definining local
> >      field_{get,prep}() macros (patches 1-11),
> >   2. Introduces __FIELD_{PREP,GET}() helpers to avoid clang W=1 warnings
> >      (patch 12),
> >   3. Makes field_{prep,get}() available for general use (patch 13),
> >   4. Converts drivers with local variants to the common helpers (patches
> >      14-24),
> >   5. Converts a few Renesas drivers to the existing FIELD_{GET,PREP}()
> >      and the new field_{get,prep}() helpers (patches 25-26).
> > 
> > Alternatives would be to use the typed {u*,be*,le*,...}_{get,encode}_bits()
> > macros instead (which currently do not work with non-constant masks
> > either, and the first attempt to change that generates much worse code),
> > or to store the low bit and width of the mask instead (which would
> > require changing all code that passes masks directly, and also generates
> > worse code).
> 
> Everyone please send your tags. I'm going to merge it in
> bitmap-for-next before Monday.

Fortunately I didn't specify the exact Monday. :)

Now it's in my tree for local testing:

https://github.com/norov/linux/tree/field-prep-for-6.19

Will move in bitmap-for-next shortly.

Thanks,
Yury

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
