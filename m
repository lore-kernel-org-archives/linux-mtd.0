Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F32CCFA1A
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Nov 2025 13:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDaRhPpmsXIlOWd2pwr0UeUgUgyP40aT788pJ6z2InU=; b=p/xbjb+3jvx5cH
	hcru71m6T3UaFwrax0Gy4RRKam4PXkQZkUlgDZnNtavTZotRF5tsvfuhSr55UwtbPidEB8aeAQ4zD
	+/lKriztRqCUBJJmLIuLUBTJ3DohnURRGpfMZ6d50f9b6LDV8eVCkdQ7BgDU8mjgbbl54bHdNqSjj
	5nK874wOMenZ09vBqqBF6B9WBlGEfLTsroEVuwCJhb/Isf+H3nB9U+0VvOuUw8sn0a1HvQUmyhbB7
	tqPP8av8GVsKPJJayAn87A+gVQPXCKzWVPHMknqmgppDxhYDaHpkozl9jjA/19pbFPfOx74hG5t0L
	J6N/2q3x8q/1PL3IvDcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI5Zy-000000042LK-28vh;
	Sun, 09 Nov 2025 13:35:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI5Zv-000000042Kp-31lQ;
	Sun, 09 Nov 2025 13:35:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 482B74065F;
	Sun,  9 Nov 2025 13:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73F0C19423;
	Sun,  9 Nov 2025 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762695333;
	bh=75xVTH6rL41i5gNYi5D5wNYFSB4OID9FByUjwxNSe6Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OUq4YlScR9Yr3lqdI8+Yp0fI/C5dkrRC8Cq+F3uyLXMiZuA7Hfzg0VIC4P2u9QNCf
	 C9AHZ2WTv5ZZUwgeHDjJ7ysaW4HPELl7S/VLwzmiEWmH9x7XuuSN+Ln99YomjKvbMq
	 i3MhKBHc5WBbb6gdQpeOjbaUu7qebuQ00zSVfr+hMjBXHDv4tF+JB3hNcGYAPVP0Bg
	 YBFDxk8I51LYyPl31nWk18LZDNHXhTQPG0l9XQKqXzTP5bnECbCZypFzgHezD1SqP0
	 VkIWa5JPPo0EKvKltofU/ebvRFI1V7map8EhrzGaM4iK3tb4gIY5z3XHz3ztCpG+JO
	 I0PjTLazIvM+Q==
Date: Sun, 9 Nov 2025 13:35:13 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yury Norov <yury.norov@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, Lars-Peter
 Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun
 Hung <schung@nuvoton.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Johannes
 Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex
 Elder <elder@ieee.org>, David Laight <david.laight.linux@gmail.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Jason Baron
 <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
 <tony.luck@intel.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Kim Seer Paller <kimseer.paller@analog.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>,
 Cosmin Tanislav <demonsingur@gmail.com>, Biju Das
 <biju.das.jz@bp.renesas.com>, Jianping Shen <Jianping.Shen@de.bosch.com>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org,
 qat-linux@intel.com, linux-gpio@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 05/26] iio: dac: ad3530r: #undef field_prep() before
 local definition
Message-ID: <20251109133513.195e6baa@jic23-huawei>
In-Reply-To: <a2466d9201cb8c25504e25ac531a69ef8bd6e958.1762435376.git.geert+renesas@glider.be>
References: <cover.1762435376.git.geert+renesas@glider.be>
	<a2466d9201cb8c25504e25ac531a69ef8bd6e958.1762435376.git.geert+renesas@glider.be>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_053535_807035_D7EC443E 
X-CRM114-Status: GOOD (  14.69  )
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

On Thu,  6 Nov 2025 14:33:53 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> Prepare for the advent of a globally available common field_prep() macro
> by undefining the symbol before defining a local variant.  This prevents
> redefinition warnings from the C preprocessor when introducing the common
> macro later.
> 
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>


> ---
> v6:
>   - No changes,
> 
> v5:
>   - New.
> ---
>  drivers/iio/dac/ad3530r.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/dac/ad3530r.c b/drivers/iio/dac/ad3530r.c
> index 6134613777b8e1d4..5684d11137f29948 100644
> --- a/drivers/iio/dac/ad3530r.c
> +++ b/drivers/iio/dac/ad3530r.c
> @@ -54,6 +54,7 @@
>  #define AD3531R_MAX_CHANNELS			4
>  
>  /* Non-constant mask variant of FIELD_PREP() */
> +#undef field_prep
>  #define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
>  
>  enum ad3530r_mode {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
