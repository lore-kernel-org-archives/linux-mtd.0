Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F6DCCFA1A
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Nov 2025 13:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSiR2PWNVCWIx9BJJ7d0flIundmlxKMSLMzxZFL30F8=; b=xalPfK+2D3Vk8j
	DpIG49IgEtbrpdnFYCIGhT0r7HypjYuGvB/rpUqweNM8uuFsaCLRf7zNVoBD1GyXKY0AX4nzDkcUC
	7yZ/JWIP6pGqaxNPU0PowiiBvBN6TeU/MWUsplxZz9RnLtdqjJgXxjiotuZfvPeQdlaAsCMbFmwEz
	LzgZ/8vKpcErcnxFkZbGrY0Xj8laF1tngehTeYR5e22tGGyIV12odhhmna0ZYafo4H/VRVc0m82N6
	5AeENdpZvgAtYmi8XifUm759yPmiiSP+/EgXwVMuGnYFHpDNKOFVjzdI2bQ7q5LtG7izQjCqpP2os
	TJi3IUEhXpovLxV5lBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI5ZM-000000042Gm-1szB;
	Sun, 09 Nov 2025 13:35:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI5ZK-000000042Gb-09qH;
	Sun, 09 Nov 2025 13:34:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F094600AC;
	Sun,  9 Nov 2025 13:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06534C19422;
	Sun,  9 Nov 2025 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762695295;
	bh=RT2rRE/ELY9bGrDnosbnveAK4kjkneS/XTqVsxUylns=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NQyQz3Xu/4ch5jjTTPDSBjeBVRNEYduCHsh+EDx3P6FlYJVpOQX6pKco9OgMOx/in
	 F80rjoMsLS/7XLxYrF1FBo4MLkHRajQPKOTIZOaC/6fi4uIG17iRyOJ0/gCowNRs1d
	 ppYRn1q4Dml/h8MeJM8+xvbkn6hxSYS0Z2rnmdV3FUTzsqvHwhUI9R7XecGmL4AZ66
	 FwIhhM5L3YI62kDlehONx8TWE1Va+28/8EvO//yU3GevKDsQAA9ma5ZjkVGW1Wx847
	 0ivPCgE6pzDWEvB89x/gYKximcAcQCf/eOzmpaCr0FWO1PrXAbtfbX3KfScts9bAF9
	 YRGLPkFrZYHmA==
Date: Sun, 9 Nov 2025 13:34:39 +0000
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
Subject: Re: [PATCH -next v6 10/26] iio: imu: smi330: #undef
 field_{get,prep}() before definition
Message-ID: <20251109133439.3d841b5b@jic23-huawei>
In-Reply-To: <54c739d05673e512d091bf78e54cd00e3655d7d4.1762435376.git.geert+renesas@glider.be>
References: <cover.1762435376.git.geert+renesas@glider.be>
	<54c739d05673e512d091bf78e54cd00e3655d7d4.1762435376.git.geert+renesas@glider.be>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Thu,  6 Nov 2025 14:33:58 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> Prepare for the advent of globally available common field_get() and
> field_prep() macros by undefining the symbols before defining local
> variants.  This prevents redefinition warnings from the C preprocessor
> when introducing the common macros later.
> 
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
I tweaked the original driver to avoid the naming clash so this can be dropped
and we can replace with the new function next cycle.

Thanks,

Jonathan

> ---
> v6:
>   - No changes,
> 
> v5:
>   - New.
> ---
>  drivers/iio/imu/smi330/smi330_core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iio/imu/smi330/smi330_core.c b/drivers/iio/imu/smi330/smi330_core.c
> index d9178725ade3da83..a79964fe68fadf47 100644
> --- a/drivers/iio/imu/smi330/smi330_core.c
> +++ b/drivers/iio/imu/smi330/smi330_core.c
> @@ -68,7 +68,9 @@
>  #define SMI330_SOFT_RESET_DELAY 2000
>  
>  /* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> +#undef field_get
>  #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> +#undef field_prep
>  #define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
>  
>  #define SMI330_ACCEL_CHANNEL(_axis) {					\


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
