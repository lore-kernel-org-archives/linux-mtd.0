Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8C4EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 13:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hF/4XgqA7xVlJQdyUHbLF++Dv1lHQokMyntIWWVwKO8=; b=e5SQQabOGsXskQ
	7tex1aD5xN1XcaNiuaiO6Q9eJv1rTKsGPGnWUPW/dGPXh6ZShlnY3ZVFw9IqynYWtsBe7mGnImYmG
	b+om09y0Q7TG0DT2WHfcictGBFKfWz9NyNIZI1NOAxcIeh0JutlbX1nkxXU25swu44pIdlxTzr7/N
	0Y9+FZN4apq3qVD3BZbyJ5dpPnliG2MnsJl7EEsWOK0bffw2wBhpegT9a1q3fQbgWetE4jQQxsRor
	8I4ns3g570Q9wx7T9LF5T556J206Ih77j9TY//8r2Ge9e1sVMuN7eRIx5BD9Y/IyH7nHBAzxQW4TG
	SRHfv/Pov3UGlCluccNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMTij-00BFtl-2i;
	Thu, 20 Jul 2023 13:29:29 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMTif-00BFsF-1Q;
	Thu, 20 Jul 2023 13:29:26 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3487d75e4c5so4192645ab.0;
        Thu, 20 Jul 2023 06:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689859762; x=1690464562;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=x7oP+tgkV5g5gPIWjsy0lzcqUnb7CSAq9qZKlzt2F6c=;
        b=rIQoiENQDVB93EfK7Iwx+E2mxs3LQ0YPdhj/iK7ys8ALeunIn8wezadJpkQTW+Sjif
         UlzB5oAiRo65QeGsQurJ0qXGhqKvssdTu16jb/Fhkf9SqC8Bc+Rk/BsoxsRJLBYJLXie
         qSkDkv93lfgJS9eeZoTTuLFqvnVba5pEa9rxlsf2P4+u/2Q9YgNlA8/OlETqH0QdCUIx
         f+omEBPKkwxj2rkDHti14N9qCY7Jh/R98b9DjfJKJo0LqwlJxUz0B1WIH6XLq/3Tsr/q
         4DXjtnqzPe7gvYhNRU0XZVUqawMJUtcZ5iUFQMGml0Di+4pHyvV3iE4sXw0M7Z/OaTcz
         y40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689859762; x=1690464562;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7oP+tgkV5g5gPIWjsy0lzcqUnb7CSAq9qZKlzt2F6c=;
        b=ScAdKokzHYSgAY6QCWagDTTvxsYnVD5ZpKWUy2UB7ex/a4oDR48ccNyt+EuHUX/4aK
         CqiZ5Gfomr5JhDE1alJMGgarY/gijvW9ebXZOxVnEGTKsL3+w3WyDgKeE9i/ls/ScdY2
         vMPBgyFeNCWWD2wliQmT72rp4dtKLXymvo4pDePm6LI9JJF0SyKSEeMPV4gwZF8M2+us
         8kznytdXTZnXs1gSsuURtGcWe0TkgbMCptHTKzWvCBkcjaJvdqKBIQDxjsXqZCZzkstF
         hK1sZWmZCd/sBpxKcY8Bvk+kySSwypZtxPt21EqodpFyY/6zkTvfIb0fZJB6CYhXdnBC
         qM2w==
X-Gm-Message-State: ABy/qLbYdNwBbcaY0gEKnTOmm3rmLtobrVlCMc1qkY32Gwj4hTJbif27
	vRYJznDJKNZMvicaowWsn7c=
X-Google-Smtp-Source: APBJJlE+ImiGpXR+XhiWfpQ8DqRAptYIM/vmmrqcxub/OhO7f7vQvGYjfcGO6fmJR6FGooFnlcTVMw==
X-Received: by 2002:a05:6e02:1d83:b0:348:936e:d01c with SMTP id h3-20020a056e021d8300b00348936ed01cmr9173098ila.1.1689859762259;
        Thu, 20 Jul 2023 06:29:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 66-20020a17090a09c800b0025be7b69d73sm1065543pjo.12.2023.07.20.06.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 06:29:21 -0700 (PDT)
Message-ID: <f7d7ed7b-5a12-b393-54cf-eafd51bf72e7@roeck-us.net>
Date: Thu, 20 Jul 2023 06:29:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 13/42] watchdog: ep93xx: add DT support for Cirrus
 EP93xx
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
 <20230605-ep93xx-v3-13-3d63a5f1103e@maquefel.me>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230605-ep93xx-v3-13-3d63a5f1103e@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_062925_480537_433BB958 
X-CRM114-Status: GOOD (  23.43  )
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
>   drivers/watchdog/ep93xx_wdt.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/watchdog/ep93xx_wdt.c b/drivers/watchdog/ep93xx_wdt.c
> index 59dfd7f6bf0b..af89b7bb8f66 100644
> --- a/drivers/watchdog/ep93xx_wdt.c
> +++ b/drivers/watchdog/ep93xx_wdt.c
> @@ -19,6 +19,7 @@
>    */
>   
>   #include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/watchdog.h>
>   #include <linux/io.h>
> @@ -127,9 +128,16 @@ static int ep93xx_wdt_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static const struct of_device_id ep93xx_wdt_of_ids[] = {
> +	{ .compatible = "cirrus,ep9301-wdt" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ep93xx_wdt_of_ids);
> +
>   static struct platform_driver ep93xx_wdt_driver = {
>   	.driver		= {
>   		.name	= "ep93xx-wdt",
> +		.of_match_table = ep93xx_wdt_of_ids,
>   	},
>   	.probe		= ep93xx_wdt_probe,
>   };
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
