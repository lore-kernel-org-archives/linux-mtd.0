Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6B4EDEC6C
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 14:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=edVJ0otRAqyrJh/+Px5scVTtUNbcv5WNhx9sHvnJ1J8=; b=K/f0VJovFzeUOz
	fQ5cBDntU5KqKDD++39CjRxkRaUlX9RMWUEbrh5e+eB998dWc84klRYwt9NiX6yWfjJvfNgayZNlh
	8dUpo8o+WGd9t11OygompR+1fRjms9L9qQUTPdD1b7uBJR+jTNvkxnYQUOQzEQhL1o6uAJJJ2CfHR
	M58G8U+S6V66qUMTOcuu7t2JYVyTCcU6l4nw+GMVbb0Kt2jIjYLAdcLdu/M91dy/f7xCUMuXB9nVs
	RtIS0rfQxdTSidNAqJC0rJysqUoWQ/YT1glN3+Bw2VQ9t2aGb6J/JYfNZiTOIUMeYfpwHCdPuWUbz
	0WTfUAYMekicoL3gIwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgRCl-0069dx-02;
	Wed, 13 Sep 2023 14:50:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgRCh-0069dP-1s
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 14:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694616653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=48dU2hQLagIX9Pt08ex4VtPwEkzu69KnmACTk65vyqM=;
	b=SmPunnbk63JOIeDlEFY4SyMEudQEApGoa9etxptuCXALxxDchcouYiMHLipQe5mXz7rBoh
	oTtbGbz45x0WFDh/4iHsHppG5UiXj3VBS3jfsCltq4lbm5P8vmCIrvPTntsTAtlwM3I8v+
	5mySHhLeq5+E+7eipkYfOxM7DvQQ/yU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-3T_a8ae5N8qligy-G9YK5w-1; Wed, 13 Sep 2023 10:50:52 -0400
X-MC-Unique: 3T_a8ae5N8qligy-G9YK5w-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9ad8ab8bc9fso131855066b.0
        for <linux-mtd@lists.infradead.org>; Wed, 13 Sep 2023 07:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694616651; x=1695221451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48dU2hQLagIX9Pt08ex4VtPwEkzu69KnmACTk65vyqM=;
        b=A1MnwqNivk5lla0YIkEt8/PdJIC+Um+FZDFCnvwqKcjLEUCUWlHZE8YsqaWfNGeTSQ
         Z1IW1yHOMI/rvzKTPFmnG99RjSKJFsJHQy48N2t6dIMNHj9OEnyOpGWNs/Wzza/k/qd9
         f/MvbB7gzZEtn+dlIwYCZxwukPctnDm3+9A58cFXlteMOQ0j1DJNTboRjDN7eR6t46wq
         xsZVXR+1RF+0AcMjoDAjvvNGW60YYgswhpQHClKSyyfZtqPyqTdmEdW5TiuOM5nh4kH9
         EHvAJ2aT/Whb/7HTSUFY0uu5IE7N5LLDBGcxMXvsZ5x8vsNf1Za14DpgEt7vv+ae8s7G
         Do9Q==
X-Gm-Message-State: AOJu0YydoZXZ+qU0fVlXXkUkQ5cs7I7CFTszPETkJqxwUOE+YRD8jeyc
	lo++VtVc80CRx2YBXpRjreD1YL/NURDBfBV7bVsMmGN/DOdDy+w5/XL8vnEZOKsFFk0OZh79R/n
	wQd+vHhesYkcyUIQVYBlkHRDKGg==
X-Received: by 2002:a17:906:74c7:b0:9aa:1020:8c39 with SMTP id z7-20020a17090674c700b009aa10208c39mr2278141ejl.18.1694616650916;
        Wed, 13 Sep 2023 07:50:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhdz7s3zxkxrAka/iFct75EEOhxMraFKGaGoggnTBpq6sAIlALbnFygNuVs1AGvDyAjsOScA==
X-Received: by 2002:a17:906:74c7:b0:9aa:1020:8c39 with SMTP id z7-20020a17090674c700b009aa10208c39mr2278116ejl.18.1694616650569;
        Wed, 13 Sep 2023 07:50:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n3-20020a17090695c300b0099bc8bd9066sm8613848ejy.150.2023.09.13.07.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 07:50:50 -0700 (PDT)
Message-ID: <5cff2031-e25f-4222-4d1f-b0b7d87b355b@redhat.com>
Date: Wed, 13 Sep 2023 16:50:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/5] platform/x86: int3472/discrete: use
 gpiod_set_active_low()
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Daniel Scally <djrscally@gmail.com>, Mark Gross <markgross@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230913115001.23183-1-brgl@bgdev.pl>
 <20230913115001.23183-5-brgl@bgdev.pl>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230913115001.23183-5-brgl@bgdev.pl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_075055_738180_17D477E8 
X-CRM114-Status: GOOD (  16.83  )
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

Hi,

On 9/13/23 13:50, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use the new polarity setter instead of the more cumbersome toggle
> function.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/platform/x86/intel/int3472/clk_and_regulator.c | 2 +-
>  drivers/platform/x86/intel/int3472/led.c               | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index ef4b3141efcd..31e520838b95 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -183,7 +183,7 @@ int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3472,
>  	}
>  
>  	if (polarity == GPIO_ACTIVE_LOW)
> -		gpiod_toggle_active_low(int3472->clock.ena_gpio);
> +		gpiod_set_active_low(int3472->clock.ena_gpio);
>  
>  	/* Ensure the pin is in output mode and non-active state */
>  	gpiod_direction_output(int3472->clock.ena_gpio, 0);
> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
> index bca1ce7d0d0c..46c9c569df5e 100644
> --- a/drivers/platform/x86/intel/int3472/led.c
> +++ b/drivers/platform/x86/intel/int3472/led.c
> @@ -32,7 +32,7 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472,
>  				     "getting privacy LED GPIO\n");
>  
>  	if (polarity == GPIO_ACTIVE_LOW)
> -		gpiod_toggle_active_low(int3472->pled.gpio);
> +		gpiod_set_active_low(int3472->pled.gpio);
>  
>  	/* Ensure the pin is in output mode and non-active state */
>  	gpiod_direction_output(int3472->pled.gpio, 0);


Thanks. I agree that the new API is much better:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Feel free to merge this through the GPIO tree.

Regards,

Hans




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
