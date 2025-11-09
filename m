Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4BACCFA1A
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Nov 2025 13:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lDck2PXHVnyTSERP+Pi+L6fHwTEDdvK+dSdmxFR2JI=; b=O7YTJAiGRuNHgA
	+ZdPPGCxiutYIAUWucqkj40kTnNq0iW+gSuEL+vmcGEYnly7bUK/lj/GlXBkR6mjcWaXP3bcBeLoM
	STIaYhI65tgxUwWTlb4WRmQ4fL+rJxCDcb8AiaiY5AdUBJtmAoKSgWGoIxOiMtsb9Gj9Y1P8hCS6h
	BRb6QajaFBf6HYsHKOK97eFSxwESPoDUVesukw/wY0VYJ7QPOo2P6WMlZwEcCd/PCqeDxx+WUqUy2
	GnGwdWd2RAdD7kOngVRn+zjPewKvrAOrm8V9N0JAPFkgln+eFOa+nIK14tVFnO6V8Rkg63XJ/Xthw
	ts2gBYf31GB2/mRkscKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI5db-000000042gr-2VbB;
	Sun, 09 Nov 2025 13:39:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI5da-000000042gV-0p1C;
	Sun, 09 Nov 2025 13:39:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73F95600B0;
	Sun,  9 Nov 2025 13:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DF5C4CEF7;
	Sun,  9 Nov 2025 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762695561;
	bh=TmS8CkFMzA8p257zgP8ajlZZj7NKktorZzJfGu8kADk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eRuJdceFQsdR7lWVjZXcQ5eo2LTrpkwCjVnhqhWqMgsWHpPaOmCSWAruleR0rDa3c
	 zewmxH8r/ugX+Auz1z/GzwLYEmryJP7Yxt9ENJ0AKXlgrY5A6lsFG5/fgdl/WlQuI0
	 wm5J1acBHw4E/gK68u06+opel8VRhYcrJcvtOFcncyLFMAVSPe89x4T+DcAQy3aEQQ
	 oX85a3JCzSZAbUxwWvjBgSMTrD8mI2+wsSwQYY/Cvor7FYRe2eXlHmti2qvQabVS0/
	 o+scmlpg9ZtBwS6CeH2c/exLXcnhRK2SIJLAmWLQvpPhhKxsXEyIVR2Jv6uyzWZ37T
	 Qr+4vzbXZuRrg==
Date: Sun, 9 Nov 2025 13:39:04 +0000
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
Subject: Re: [PATCH -next v6 23/26] iio: imu: smi330: Convert to common
 field_{get,prep}() helpers
Message-ID: <20251109133904.5eff2558@jic23-huawei>
In-Reply-To: <a2275bd69f25d33f9fd3345409b2d8ae6285b9a7.1762435376.git.geert+renesas@glider.be>
References: <cover.1762435376.git.geert+renesas@glider.be>
	<a2275bd69f25d33f9fd3345409b2d8ae6285b9a7.1762435376.git.geert+renesas@glider.be>
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

On Thu,  6 Nov 2025 14:34:11 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> Drop the driver-specific field_get() and field_prep() macros, in favor
> of the globally available variants from <linux/bitfield.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This will need a revist next cycle. I preferred not to have
the odd looking undef in the driver at introduction so prefixed with smi330_
instead.  Only one instance so it wasn't worth comments to make ti clear what was going on.

J


> ---
> v6:
>   - No changes,
> 
> v5:
>   - New.
> ---
>  drivers/iio/imu/smi330/smi330_core.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/iio/imu/smi330/smi330_core.c b/drivers/iio/imu/smi330/smi330_core.c
> index a79964fe68fadf47..83e0dff5d973d046 100644
> --- a/drivers/iio/imu/smi330/smi330_core.c
> +++ b/drivers/iio/imu/smi330/smi330_core.c
> @@ -67,12 +67,6 @@
>  #define SMI330_CHIP_ID 0x42
>  #define SMI330_SOFT_RESET_DELAY 2000
>  
> -/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> -#undef field_get
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#undef field_prep
> -#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  #define SMI330_ACCEL_CHANNEL(_axis) {					\
>  	.type = IIO_ACCEL,						\
>  	.modified = 1,							\


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
