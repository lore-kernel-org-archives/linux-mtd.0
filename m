Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C04CCFA05
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 14:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pixhPOfKHPbS8F6aL5nCv1pC7FaUyJyKN3IegGRZzao=; b=hXZRo6CYHIpHCF
	LNrk03bqr0dzVXuO9iDNqQcJ5LG+N3rk2KNgIdgn98XNtyr/q0OFK/pKkA7DPV4MaPa9+aQZlnRnO
	c9b2F0FLduK5zE0FzoLPASsaLJkTy/Hfl3s/FuEADRE9cHz7LUmKZkJfo8AYrhD94MTgvU8qs7Lbe
	XeMcK58XuQpWfToPfz5lxhhaYbOuF6Jhp3hKFXiHNMmRhz+QXCkbNDlNqI3d0+xu526+q+vLq+4jn
	ZEPWYLrViPKTnmsGNZYP61VcWCIT5JGPCZ1RDZibLQ55HhooTCidonj9GVM5eW45vMQOnIDCA7viG
	REMdkojk+0zNoHE7eLJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1EK-0000000Filw-3SNC;
	Thu, 06 Nov 2025 14:44:52 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1EH-0000000FiiP-21th;
	Thu, 06 Nov 2025 14:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762440289; x=1793976289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CgKPrhlOB1S3JfrLDg6vTp5p6jX2SaUAEva586MhNWo=;
  b=fax+zxpMdBxZi35qiqTykfwB6NxjRR0GNIAr01NQb0RVM6mjAnSNDiCH
   vIa91xikfQjVpGD36bqnHrb+m0Zz3LAPg0IiENMJq01TrcXrorZstpwgF
   6ev/EQ6JHzEbB44agCHyyZbX3/T8Fi1PdZljmcibvU0bWLKalPJeFJaMr
   noF4o3RxCwDQbqtKbj1AIMaReTnn6Cdb6NGhUWj0I3au7eAJmLnCD3Rpv
   QK8o7vzY/fUxouq5OdaRzBXJuQQnoslS7UXfOxZO96NLsKhvPepPa3OZ4
   EecKtraIzDXm++jWkgA7liwsRrlVEty6aMQ7HHzhQWovKqDOeNKEhb5/J
   w==;
X-CSE-ConnectionGUID: y8D8ZsrCSxuA62Ah3xHvxg==
X-CSE-MsgGUID: IE62Yp7LTHW84FcpyHdMAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64612573"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="64612573"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 06:44:48 -0800
X-CSE-ConnectionGUID: kvm5eJDVRiSb47UCQQrdxA==
X-CSE-MsgGUID: 2tiTZfdERMmRL0zFQqehgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="192819498"
Received: from abityuts-desk.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.224])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 06:44:37 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vH1E0-00000006AO5-06YC;
	Thu, 06 Nov 2025 16:44:32 +0200
Date: Thu, 6 Nov 2025 16:44:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yury Norov <yury.norov@gmail.com>,
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
Message-ID: <aQy0T2vUINze_6_q@smile.fi.intel.com>
References: <cover.1762435376.git.geert+renesas@glider.be>
 <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_064449_566115_6A752AB9 
X-CRM114-Status: GOOD (  15.45  )
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

On Thu, Nov 06, 2025 at 02:34:00PM +0100, Geert Uytterhoeven wrote:
> The BUILD_BUG_ON_MSG() check against "~0ull" works only with "unsigned
> (long) long" _mask types.  For constant masks, that condition is usually
> met, as GENMASK() yields an UL value.  The few places where the
> constant mask is stored in an intermediate variable were fixed by
> changing the variable type to u64 (see e.g. [1] and [2]).
> 
> However, for non-constant masks, smaller unsigned types should be valid,
> too, but currently lead to "result of comparison of constant
> 18446744073709551615 with expression of type ... is always
> false"-warnings with clang and W=1.
> 
> Hence refactor the __BF_FIELD_CHECK() helper, and factor out
> __FIELD_{GET,PREP}().  The later lack the single problematic check, but
> are otherwise identical to FIELD_{GET,PREP}(), and are intended to be
> used in the fully non-const variants later.
> 
> [1] commit 5c667d5a5a3ec166 ("clk: sp7021: Adjust width of _m in
>     HWM_FIELD_PREP()")
> [2] commit cfd6fb45cfaf46fa ("crypto: ccree - avoid out-of-range
>     warnings from clang")


Also can be made as

Link: https://git.kernel.org/torvalds/c/5c667d5a5a3ec166 [1]

The positive effect that one may click that on Git Web.
Ideally, of course, would be an additional parses on Git Web kernel.org uses to
parse that standard "commit ...()" notation to add the respective HREF link.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

...

> +	BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >		\
> +			 __bf_cast_unsigned(reg, ~0ull),		\
> +			 pfx "type of reg too small for mask")

Perhaps we may convert this (and others?) to static_assert():s at some point?


-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
