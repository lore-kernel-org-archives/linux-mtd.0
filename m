Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A697ECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 19:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gfn2XZ3Mj45ZqCRVvLKGlQLMBYqD1dTiy9lD1P33bvY=; b=WTLw1nSXZI8P4a
	H+Vbe81GGVzg0m4Bw9o49nijAXGHr2iY2s4MI2awNEb3KZmiMPoYvYwnAe0ETgZHwSUMVF5E0yZ+X
	9d8sV4iipEA6F66P01QS4v1gk86Wd5r1zi0NL5st3azPaJx5eqFsd9GD32CTjtVbI5NHLwvEYT43s
	DVLnJsGhOu29IUYoCkOdvNlUsGoAAcalsJMh7gTSBAmXlh/RaRNAkJX6dV5ttoAbp3luLZ2ztLzhr
	YraCk6F3ruw7GgE418fnEBVCjWOTmQzwHhtSrqMqXXJRhJbO4BP4waY0av1qadp16HbatS2LrYSzk
	oy2728OQNbz0beu1NqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHNe-008utp-8u; Mon, 05 Sep 2022 19:03:35 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVDnV-005jlP-9E; Mon, 05 Sep 2022 15:14:03 +0000
Received: by mail-pl1-x633.google.com with SMTP id 9so5552287plj.11;
        Mon, 05 Sep 2022 08:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=BaV7TSh2pF8riJo3FYVJlB4Fd0IV89ZBF58eyTHpzCY=;
        b=hkkpU5LscmWAGSEo3MfEtadx9VW4xDHJEup50A1r2cVLlq4cuETMEDvzQMWJ+25cub
         uKJeKBqoA/7oOn5M03KfF2SrWzMp8y/6jxlU6IOGtXhf5NBV25gS8epBm0aJ0S2QGuaI
         RjUYEWJv07AS8q77FSCkemAnzO0cF5SSPIB8vUM+JQ9+01vDbgKIvCwDLFJ0pxGW/o9D
         wfMCMCN77OXaTjmH8xcwvQmxfsPP25DPJzASvB1sg54cKUVgwF0SrI+mVebrCUQXQcEH
         UD6AosLEX29RH6M8jzXceVG7LBfIA3BiQKPCSDkkI0IwATFYFoPoughaGzGm0KCEERIH
         sz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=BaV7TSh2pF8riJo3FYVJlB4Fd0IV89ZBF58eyTHpzCY=;
        b=6jQcMaXjSA1QAelYr+o2/sP9iCyj0PRUIBdmNfOr/KFG0HmUaLEfajKRqxEdO82dk8
         +5vxw5ey/hgTmiyrzaDM8M/kyI1a2NEYbTdvYybDAe5q8qbvTAFLALnUaBZGPFHuG0/M
         JqHeL84bR3XIml1C5yEethFOSEbAbjiddAFLjq7HrRwQUQE/8JdHT7bwlRJygtPDnlSB
         GNyyXauzjucwKazX/pgeM53gOC0tls11TJJrp1vWY3rchnRWd7dkyg+haRJIZUbIfy0i
         toWqQqIfW/Xydb5YG67De3LR0JE3Pbk0Zv4nl0Z+nXC+04GbdQN90dr0IHzQe84p3eiP
         5DFw==
X-Gm-Message-State: ACgBeo0kEdp2dJ43M3x9BX9tHRAipxvgHZk7Hb3X2PpLkcnbGamRGpY5
	QD9AWpv8Vs3+kIIgw30AUMw=
X-Google-Smtp-Source: AA6agR759HBK1+PQYcZT7IJSAKYI4KNMvzd+GSuzCkEXpLGsOPIUySqoQ8VGjyqne3MH/nAfFroOyA==
X-Received: by 2002:a17:90b:164f:b0:1f5:4ced:ed81 with SMTP id il15-20020a17090b164f00b001f54ceded81mr19722762pjb.122.1662390835165;
        Mon, 05 Sep 2022 08:13:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u15-20020a170903124f00b00176ba091cd3sm1684281plh.196.2022.09.05.08.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 08:13:48 -0700 (PDT)
Message-ID: <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
Date: Mon, 5 Sep 2022 08:13:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using
 devm_fwnode_gpiod_get()
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Brown
 <broonie@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@kernel.org>,
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
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_081401_599216_71ED62B0 
X-CRM114-Status: GOOD (  24.49  )
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

On 9/5/22 04:09, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>>
>> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
>> so that gpiolib can be cleaned a bit, so let's switch to the generic
>> fwnode property API.
>>
>> While at it switch the rest of the calls to read properties in
> 
> it, switch
> 
>> bd9576_wdt_probe() to the generic device property API as well.
> 
> ...
> 
>>          struct device *dev = &pdev->dev;
> 
> struct device *parent = dev->parent;
> 
> can make your code slightly neater.
> 
> ...
> 
>> +       count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
>> +       if (count < 0 && count != -EINVAL)
>> +               return count;
>> +
>> +       if (count > 0) {
> 
>> +               if (count > ARRAY_SIZE(hw_margin))
>> +                       return -EINVAL;
> 
> Why double check? You may move it out of the (count > 0).
> 

Two checks will always be needed, so I don't entirely see
how that would be better.

> ...
> 
>> -       if (ret == 1)
>> -               hw_margin_max = hw_margin[0];
> 
>> +               ret = device_property_read_u32_array(dev->parent,
>> +                                                    "rohm,hw-timeout-ms",
>> +                                                    hw_margin, count);
>> +               if (ret < 0)
>> +                       return ret;
> 
> So, only this needs the count > 0 check since below already has it implicitly.
> 
Sorry, I don't understand this comment.

Guenter

>> -       if (ret == 2) {
>> -               hw_margin_max = hw_margin[1];
>> -               hw_margin_min = hw_margin[0];
>> +               if (count == 1)
>> +                       hw_margin_max = hw_margin[0];
>> +
>> +               if (count == 2) {
>> +                       hw_margin_max = hw_margin[1];
>> +                       hw_margin_min = hw_margin[0];
>> +               }
>>          }
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
