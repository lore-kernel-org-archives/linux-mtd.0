Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E385BC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Feb 2022 14:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MJu+MgpI5yqXT1aZj7+4eLS+b72zLZOpCcgJf8jIT8=; b=RuWL47lrgkwafu
	ux4lgZGdiFD4thAaHVNnEf10HagUp2j7Q4zYu4j+NvO91iKza/QgKhkAO1R9OH+7vvWPrEcM2YWH2
	ygkF0kXeymv2LVCeavKJgbdtOo9bTscRT1Lsp7//IOtEXGZC8/scBdqK0fLdntyB/S6XpSyIlgSDl
	Mya4OOXzg+FpfWOm8xcW2aAt1aujZ3NWadmYwo1N1lCjPl0zAkLlHDRbhe5p3dE/DjisjesZmx3Hb
	A1ncd+Z7aeOVKqvBILN8PWXvSzgeyuqDe63Jhgb//6OcFZtqsN1oyVwZ3TMAzLShq1O3ZnF00SqnQ
	BrdwizZs5g0T0shzov8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFdX4-001jLS-JR; Thu, 03 Feb 2022 14:56:22 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFdX0-001jIP-5O
 for linux-mtd@lists.infradead.org; Thu, 03 Feb 2022 14:56:21 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BA1C440041
 for <linux-mtd@lists.infradead.org>; Thu,  3 Feb 2022 14:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643900170;
 bh=JKwlxtatWZQCVG4GF4BszucWwjVQTt2PxoebrxL5ciY=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=rltei9Ru4gIglU2x++cOWijrRp0EQ9w2zzu32ru9wgBMSOMjo0aYMynG/q01y8/z7
 dDPyAAEr6WzlUdOyhgAFuqJ0Jbhmj/B82Ea6Hakwl5qEPfNWHvZQJIr5zIkafdEkML
 UF/rriwpdKkRdxsKkYwi7oOJxI3fcAiXbTmlssiAfD4pgcrK4WAEMYZXGwnDvOuHwe
 Bm4bh1rDD4mNKeXSFkG0U6xIWXYmcyaLQ0nSWbDI67BcjMr+//cMqd08ypDI+MmmBf
 JXb59Qr1qiSpgqFlT1ku6XXKfqwmify11dcZZFO/JNgDjsp67hHzc7pv3/ul8uRWAY
 8bLhpFdfQkX0Q==
Received: by mail-wr1-f70.google.com with SMTP id
 j21-20020adfa555000000b001db55dd5a1dso755894wrb.15
 for <linux-mtd@lists.infradead.org>; Thu, 03 Feb 2022 06:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JKwlxtatWZQCVG4GF4BszucWwjVQTt2PxoebrxL5ciY=;
 b=bnB5hgd598moOrRrmm+NJbDwaY2Tq/T7zGmEjKBxoQyHFq4CtSjIMzrhw9JSK2i41w
 1oFhx9SMNqjfog759c9ZQlNWsi8Z3Y2MUFNZ604m98aKO7gfhpX4XXnQOCdEChlYxTYW
 a4do/nl/Jbg5KknlaqzwfhNmeqjnngtg1aVeCjxLpvPoIWUnVX0Md4PV0lbwPBeAdPFT
 SBA5O4HKYSLvZ4x7+RBDD12Re/TFX4IWNuEcOvb08jlVSfS6z5ndPod1fWAdPGwY81cx
 2Eb5LmC+vJAbTiiAd1dHswPltxZ/JWq/lqsQ1qiizLaNpDUoIej7QDOqC+P+znkr/z4K
 xn0Q==
X-Gm-Message-State: AOAM531tYVI1S83p8YmCja1kjKroppGeNgZhpWsC91yRYIbD5wOeydRz
 glqHErvKPFp3d+VY6vbxlRBUAz2HBBdpbZkSTRQdViC9G4Iif2JqmZoPguIu1TwD7khkYViqbH5
 rlgvxKp9zTbZbwf4keU0NSboasexUyZiJkZzBOhDDjw8=
X-Received: by 2002:a17:907:c14:: with SMTP id
 ga20mr1992476ejc.243.1643900159515; 
 Thu, 03 Feb 2022 06:55:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxET41+skPJ0t2ws3cpvdAuE3SIGtoLLzPApxhNtKVWxdECIqy/nqXcAWE2tMCANk5h/+crhA==
X-Received: by 2002:a17:907:c14:: with SMTP id
 ga20mr1992450ejc.243.1643900159293; 
 Thu, 03 Feb 2022 06:55:59 -0800 (PST)
Received: from [192.168.0.81] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id z19sm7573934eja.18.2022.02.03.06.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 06:55:58 -0800 (PST)
Message-ID: <e79133f2-f872-3ed6-4038-526e94e84909@canonical.com>
Date: Thu, 3 Feb 2022 15:55:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>, nick.hawkins@hpe.com
Cc: verdun@hpe.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Corey Minyard <minyard@acm.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, Hao Fang <fanghao11@huawei.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Wang Kefeng <wangkefeng.wang@huawei.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 openipmi-developer@lists.sourceforge.net,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>, Linux PWM List <linux-pwm@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
 <CAL_Jsq+K2t5WYE056so1iZgZr7CBKvDEjAwnJVTyUFQcK-VFSA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAL_Jsq+K2t5WYE056so1iZgZr7CBKvDEjAwnJVTyUFQcK-VFSA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_065618_348601_5168FFE5 
X-CRM114-Status: GOOD (  20.74  )
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

On 03/02/2022 15:29, Rob Herring wrote:
> On Wed, Feb 2, 2022 at 10:55 AM <nick.hawkins@hpe.com> wrote:
>>
>> From: Nick Hawkins <nick.hawkins@hpe.com>
>>

(...)

>> +
>> +       vuart_a: vuart_a@80fd0200 {
> 
> serial@...

Maybe it does not look like, but this is actually a v2. Nick was asked
to change the naming for the nodes already in v1. Unfortunately it did
not happen, so we have vuart, spifi, vic and more.

It is a waste of reviewers' time to ask them to perform the same review
twice or to ignore their comments.

> 
>> +               compatible = "hpe,gxp-vuart";
>> +               reg = <0x80fd0200 0x100>;
>> +               interrupts = <2>;
>> +               interrupt-parent = <&vic1>;
>> +               clock-frequency = <1846153>;
>> +               reg-shift = <0>;
>> +               status = "okay";
>> +               serial-line = <3>;
>> +               vuart_cfg = <&vuart_a_cfg>;
>> +       };

(...)

>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index 294093d45a23..913f722a6b8d 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -514,7 +514,9 @@ patternProperties:
>>    "^hoperun,.*":
>>      description: Jiangsu HopeRun Software Co., Ltd.
>>    "^hp,.*":
>> -    description: Hewlett Packard
>> +    description: Hewlett Packard Inc.
> 
> Why are you changing this one?

I guess this is squashing of my patch:
https://lore.kernel.org/all/20220127075229.10299-1-krzysztof.kozlowski@canonical.com/

which is fine to me, but vendor changve should be a separate commit with
its own explanation. Now it looks indeed weird.

> 
>> +  "^hpe,.*":
> 
> You used HPE elsewhere... Lowercase is preferred.




Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
