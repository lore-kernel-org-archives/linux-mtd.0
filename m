Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E62ECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 19:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6wsqmyowIqSdAy5KS5Xc0KJNvbg6NksBsmaOjhw/CU=; b=RnEF1/u3HBGbgp
	z5zYdMqFw7F3PYttJIS2UZX1ukRlLJD5U97Gp9zAhRoVbNlUJoMJnwXGXFXeKBZbNxW4An4W0Zdzr
	9LrY1FHGzRMTfUsYFvUmJcSoqLSrcwUmYPd/NMZkK7cnBd9iqa8kI+0kn0e/epAhvWIMehTjBB5Kf
	gjl02r9Hv6DcX0AuwqVJtR111U2zC07w5QI8x5ywkk4x7H6JexXS+Ayw8mBDj8PsPIvxnxtm+kl3m
	oBrM93fn9sNiMLU5jUXhzfFq91CULgKE48viiGgfWsl+S5nYJ/+PnurEzd6OOLHNxkSMbt/6gvLog
	ALPRjCVz2oIDYbI9DIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVIAm-009jv4-BM; Mon, 05 Sep 2022 19:54:21 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVC0j-0032pW-TI; Mon, 05 Sep 2022 13:20:27 +0000
Received: by mail-lj1-x22b.google.com with SMTP id b19so9221480ljf.8;
        Mon, 05 Sep 2022 06:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date;
        bh=pGQesGh0xflxM2NNiwrV3vQAVchzpYhzdahDdSNlBVo=;
        b=aEV1rqBvjxeacCvbFAd75H8X+CLchRyr/9zk9hD5i+6fjI5goF+z+vIzX1EGx55/p9
         IfgVdpjG1lFai91AKbjODKz/lHpxARajtjO0/XKEwTClgiAl+jHg1q1ZtcTqJSaZrYig
         kR3nTls+hkJUs4NpQl2JVkq0vuRSRbe2NpaIwzLJ3K0lc2PYHZIJgtnpLxVkCAdOdqcg
         ifK8uUxAARVYld1UXOrpCEvf1+8Q58EAJpFgdgBI0Ykb1k2J1j5CvEJW09aSZVHcvkGr
         fxrI6jqgvxBr8C13oZ4g0Qi71fqmPNdwqufFP+tdxrdtH88X4uGtw6Kli6+zcfTbP5V8
         zGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=pGQesGh0xflxM2NNiwrV3vQAVchzpYhzdahDdSNlBVo=;
        b=12mFLqtpa4oFn1pHqODxO5RnGR0BYRGZ/gnvB3cO4rpG6GJavpdjPdixYJMf2wxYzK
         TqQtk6hkaefDNDCtYFl/rTK3WMN3qoFlx88zSw+W8pDRlu+dKPx65R+ehDgXEKrg4MsR
         kGGI3Qkanr62Pguw7IEiHxU3cYEMVjraevrt7UgUOm5JvTT4daJ3aj5sJVU3iipboLIv
         j56Sog/CB0QHP5kYZlrSWk/oELXRB2e47UN5uDFI7FvG0nAYqI4g+jIO8zuxGPeKn6X8
         arJ0QX30p8vABggVmiSFQSFPpPhGuUGJJVRWiQdTo8Db597wj+p3V+QQY8e+TjjOKtJr
         Qqkg==
X-Gm-Message-State: ACgBeo2bk34Q7lXnJSCoXAHX68pirU5gM+rFmy9ASFUFUzogrMF065Oo
	rlviZpb6/7G0eTWpP5p87q4=
X-Google-Smtp-Source: AA6agR6wIqHobJs4RjQ5AZ5zLGEJ30t4jOYW4FD1Y52S1XDgSMO7S1BLZYEyclCz9BqREtsj5+Cabg==
X-Received: by 2002:a05:651c:54c:b0:25f:dd42:5d06 with SMTP id q12-20020a05651c054c00b0025fdd425d06mr15535256ljp.161.1662383969981;
        Mon, 05 Sep 2022 06:19:29 -0700 (PDT)
Received: from [172.16.194.195] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b00261e8f25460sm1409150ljc.14.2022.09.05.06.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 06:19:29 -0700 (PDT)
Message-ID: <0fa0c09f-c801-a0c7-1f6e-b6cc8b45d961@gmail.com>
Date: Mon, 5 Sep 2022 16:19:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Brown
 <broonie@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>,
 Felipe Balbi <balbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
 David Airlie <airlied@linux.ie>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>, LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 USB <linux-usb@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
 <CAHp75VeA+oVPmsEOg+y0cvRcTU5qA+Y+9=Byp0C982EB7SAArQ@mail.gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v1 09/11] regulator: bd9576: switch to using
 devm_fwnode_gpiod_get()
In-Reply-To: <CAHp75VeA+oVPmsEOg+y0cvRcTU5qA+Y+9=Byp0C982EB7SAArQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_062022_315908_4CD72ED3 
X-CRM114-Status: GOOD (  23.52  )
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

On 9/5/22 13:40, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>>
>> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
>> so that gpiolib can be cleaned a bit, so let's switch to the generic
>> fwnode property API.
>>
>> While at it switch the rest of the calls to read properties in
>> bd957x_probe() to the generic device property API as well.
> 
> With or without below addressed,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>
>> diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
>> index aa42da4d141e..393c8693b327 100644
>> --- a/drivers/regulator/bd9576-regulator.c
>> +++ b/drivers/regulator/bd9576-regulator.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/property.h>
>>   #include <linux/regulator/driver.h>
>>   #include <linux/regulator/machine.h>
>>   #include <linux/regulator/of_regulator.h>
>> @@ -939,8 +940,8 @@ static int bd957x_probe(struct platform_device *pdev)
>>          }
>>
>>          ic_data->regmap = regmap;
>> -       vout_mode = of_property_read_bool(pdev->dev.parent->of_node,
>> -                                        "rohm,vout1-en-low");
>> +       vout_mode = device_property_read_bool(pdev->dev.parent,
>> +                                             "rohm,vout1-en-low");
> 
> They all using parent device and you may make code neater by adding
> 
>    struct device *parent = pdev->dev.parent;

This is a matter of personal preference. I prefer seeing 
pdev->dev.parent - as it is more obvious (to me) what the 'pdev' is than 
what 'parent' would be.

I'd use the local variable only when it shortens at least one of the 
lines so that we avoid splitting it. After that being said - I'm not 
going to argue over this change either if one who is improving the 
driver wants to use the "helper" variable here.

Best Regards
	-- Matti


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
