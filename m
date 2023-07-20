Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAB5EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 13:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZUuVTtWc60tJd2Papa6L2qVMTtRzlDzaYnJ0lR4YsU=; b=uld1vw8loz1VpX
	BpfCk+MfrVlzld1XB2icVEsMOvG9tJbTJsE1jcw7H3NNU2SGFNnbR05K0tMxKrqLFoLbF9Ge4zcNI
	1zPjUoo7Ox6vJOtSK+KIpTkOTWCVSeSMu7F3KEiStg/4rTU8X+P7NWlh+XL2V1D5rZe8uq3n0rbQy
	V+bPGa39qIo9nbFig6UvUtvlZDpA20KbaPCqcJ8BrqwZo5yVObxvku8K/mBMB+58zwDpb8ptupY9Y
	h5L3lZBn2swyTStiS2pW2k5tvQC1f/uDXLVs3Tfjl1XQ+uj7KRCdkVr/1w5MhywmaTUZrT9bnl48h
	mVeIiXyJf59PVUfzeU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMTjg-00BG8f-2H;
	Thu, 20 Jul 2023 13:30:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMTjc-00BG7H-1x;
	Thu, 20 Jul 2023 13:30:25 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b8b318c5a7so5639485ad.3;
        Thu, 20 Jul 2023 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689859821; x=1690464621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qIe8rMdwGK8O6waPW6ElMhYZtqXBgjIAped1KS+Lxj0=;
        b=E36Ey4hpLP1aGERgJzQAv5oQWbjP2dfI/yJ9QSqsCcAZUQqYH2EJuPmluxVpniz94+
         SqRDS4pEtomXHfRXODYYhAlZIxAatRHID9D88YI+tj+w3vKM5JieqRypSlSHOTbf2v95
         PUlca0W45r887uApCqi/zn/yh3GyTCCrBBW1XguZKYFarRPPHvkGdKJALW7+s9TgEir3
         pVPeDdLYxOZSMJ8v3iGIKvATJZHgcVErXIREn7/pOR3ivfvJWVHJWWTf1p+PnK9L0sBz
         4nG3H7SIhmhoYiEqtjnis5Ppnyac+F2VaQ2UY7v0ygr32czvJ80e2mlstFNoj9axpszx
         inAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689859821; x=1690464621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIe8rMdwGK8O6waPW6ElMhYZtqXBgjIAped1KS+Lxj0=;
        b=FZG+6raS5LsVhFWoFX8JgqdY9d1tOgLNdJ+9ROuhoa3duUnObqDJVeei2GbeT882M4
         DqPAFgM2khkEUN8wRV6nA8mZUZp3jZwt2IruH/sWDNtZCz6WkWu2ifxX6Hop4FlCxV2m
         QxDjuUbHtoWcMIJAeYd1U08D8V6gy/J1Vre4HPwktmV9HrrzJMd46NRffhHXMRLAcUYV
         4RXPmJfkzkxy9K5iWOZoyFAJo6Aw7exOC0fmAXnycbMi+Yo4QAUVjHO2PdDB5T8i0YBY
         68VyRar341Fvi4reqUcnF4lsrHUtFhCiQOyaiwhge7Bw/gTRmtoKXPzfCudGkjH92N1t
         DiVQ==
X-Gm-Message-State: ABy/qLbnr0Fyfl4m6NdGra7Tl1ch01zQnqnvfizWCAczGjWc78Ry9sdL
	h5OOZbZ1Ch32rHCkvX0S/30=
X-Google-Smtp-Source: APBJJlFh1AyFX2+11T9yyn39CZ9ejJo7irpyerH5jDd4rJJqhGrNwsFMVrOCBzL5cXWCBiVM2usEnA==
X-Received: by 2002:a17:903:191:b0:1b8:9b5e:65c8 with SMTP id z17-20020a170903019100b001b89b5e65c8mr25796578plg.4.1689859821611;
        Thu, 20 Jul 2023 06:30:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d12-20020a170902728c00b001b86deba2f9sm1302975pll.284.2023.07.20.06.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 06:30:21 -0700 (PDT)
Message-ID: <1d8cf4f5-3004-3af1-2735-03fde48d69c7@roeck-us.net>
Date: Thu, 20 Jul 2023 06:30:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 32/42] wdt: ts72xx: add DT support for ts72xx
Content-Language: en-US
To: nikita.shubin@maquefel.me, Hartley Sweeten
 <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Sebastian Reichel
 <sre@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>,
 Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-32-3d63a5f1103e@maquefel.me>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230605-ep93xx-v3-32-3d63a5f1103e@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_063024_647695_1C363A99 
X-CRM114-Status: GOOD (  23.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 7/20/23 04:29, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> Add OF ID match table.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/ts72xx_wdt.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/watchdog/ts72xx_wdt.c b/drivers/watchdog/ts72xx_wdt.c
> index 3d57670befe1..ac709dc31a65 100644
> --- a/drivers/watchdog/ts72xx_wdt.c
> +++ b/drivers/watchdog/ts72xx_wdt.c
> @@ -12,6 +12,7 @@
>    */
>   
>   #include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/watchdog.h>
>   #include <linux/io.h>
> @@ -160,10 +161,17 @@ static int ts72xx_wdt_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static const struct of_device_id ts72xx_wdt_of_ids[] = {
> +	{ .compatible = "technologic,ts7200-wdt" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ts72xx_wdt_of_ids);
> +
>   static struct platform_driver ts72xx_wdt_driver = {
>   	.probe		= ts72xx_wdt_probe,
>   	.driver		= {
>   		.name	= "ts72xx-wdt",
> +		.of_match_table = ts72xx_wdt_of_ids,
>   	},
>   };
>   
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
