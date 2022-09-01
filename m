Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B42ECAAD3
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEcEv6ia8kpUM9V63djAnK6EEB0iWpQ7bso3iVs/brc=; b=1d4JFnxV1q1ybb
	8zOgL64UX8mNeYcjfHACnOrOfrxoGAZyqpVTlv2iMnKtkQ3IUJw9BqrhX7E4OwD9g4hd866WtbG67
	M+7BocMJuJGdB2pfkHpHmnWeCbCqJjq+Ft/qQlH+hwyF9RLuEVgM0y8XR96Fnb16CaOlvdUmWL5uU
	LMLrC3af9VH6xRvtMX0TVITNWEHx7GhfuhPpzNbPt09bFsgCOcsc8KDx/2GP6kB9eytBpHsEbnizB
	NgpHV6FQZfbuW5/Qluzn/xiEZGWlXuUAmFZ9/oXmvTBfs8a/h2SQN7vmQvem+qTHS538u9mKDh58K
	bQkPqfqq2D37eJfEBoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThQk-00B21M-9l; Thu, 01 Sep 2022 10:28:14 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThQh-00B20c-Ln
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2022 10:28:13 +0000
Received: by mail-lj1-x236.google.com with SMTP id w19so14425026ljj.7
        for <linux-mtd@lists.infradead.org>; Thu, 01 Sep 2022 03:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=DkA60aHXUfXyi0nOhFCnOaprQpFzB9d74uuCfob9M9Y=;
        b=R2ykrLQLnN/v/taRF0q2wdgnD/2x5hNUVxYi7Cew//ZOohEsNfVGeIv+OhOIsWrGu4
         J4ArT5c2Aia1E2y4mziTvEj/j8xUE5sFLBLPv3vVM5fhieut/0Lo2f63FQTZrnuZuDqF
         Uq9jGoa6bceQpKyL0hkULrcvZaBZV+faczRCvlA/DY+SoAkJn05YFTEgTaDNT+rP9ChO
         KWJ/zaGAVVxZd32zPSGfZpJPeZXo5vPc96NzSnr3Z5L8PYiuH/Rmp24LIIMWg9JYOXJw
         rB+em91jo4Gwt5134X9NT7tCoXay0IiutbZbcAdUU6ODSvPv0hxHeisEkIMIdahXHD7g
         lFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=DkA60aHXUfXyi0nOhFCnOaprQpFzB9d74uuCfob9M9Y=;
        b=n+/0XSKsvwhh+kW4/08YyfqANt6we4d2kXFbg/IEc149a0RLXyVpePvmQ6MkIwO3LL
         51YZPULqi35+bMHt7oaVSOuuUo/uw9kO+vdI12Q8cdkRGPLe3Ya2/lh9MZOrf7/jOIYw
         bCeVE6PQgnjeU4fYq4HP0JSIKZoxwT8V6ID1EqDINysdIRSsGQvaF8GjTZv7OXi6qTkU
         eqG2a8qtr4Mji6r6ZoQGwaQl9f9T69l0wKY6F8PsocX6c0K1jZxWEgYMk03ICjO6WriB
         4LiMM1wkBA7f97NFq2xdfFQHkeBuqcBN+UxruhD2GS+lVNRX3Hn08eSNDmbVY4ZAiN4h
         8rXw==
X-Gm-Message-State: ACgBeo32Y2MECJZPD77DeRQ7AC0SjjH4h80dxB6LN5vv76CJod6hYuVR
	2jmGezLaTMSet4P/uHPrk8yyKA==
X-Google-Smtp-Source: AA6agR6j051ZvEzRZDhENnuXOdSvboBa0B4KfPg8jC3+6DdT1t+/XHiLhrYxcbM+ZLP0NrFzbEHkPA==
X-Received: by 2002:a2e:a594:0:b0:25f:e891:b6a with SMTP id m20-20020a2ea594000000b0025fe8910b6amr10299222ljp.242.1662028089794;
        Thu, 01 Sep 2022 03:28:09 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id g9-20020a19ac09000000b004948868f326sm628998lfc.154.2022.09.01.03.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 03:28:09 -0700 (PDT)
Message-ID: <83444851-14ef-b293-6581-1307331fb1c4@linaro.org>
Date: Thu, 1 Sep 2022 13:28:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nor: Add reset-gpios
 property
Content-Language: en-US
To: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>,
 "git (AMD-Xilinx)" <git@amd.com>
References: <20220901072914.30205-1-sai.krishna.potthuri@amd.com>
 <20220901072914.30205-2-sai.krishna.potthuri@amd.com>
 <6b06f88e-128d-7ce6-b97b-b5cacfc4834d@linaro.org>
 <BY5PR12MB4258128603AA297DD8FAB168DB7B9@BY5PR12MB4258.namprd12.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <BY5PR12MB4258128603AA297DD8FAB168DB7B9@BY5PR12MB4258.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_032811_745567_9DF43F75 
X-CRM114-Status: GOOD (  14.38  )
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

On 01/09/2022 13:18, Potthuri, Sai Krishna wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, September 1, 2022 1:26 PM
>> To: Potthuri, Sai Krishna <sai.krishna.potthuri@amd.com>; Tudor Ambarus
>> <tudor.ambarus@microchip.com>; Pratyush Yadav <pratyush@kernel.org>;
>> Michael Walle <michael@walle.cc>; Miquel Raynal
>> <miquel.raynal@bootlin.com>; Richard Weinberger <richard@nod.at>;
>> Vignesh Raghavendra <vigneshr@ti.com>; Rob Herring
>> <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>
>> Cc: devicetree@vger.kernel.org; linux-mtd@lists.infradead.org; linux-
>> kernel@vger.kernel.org; saikrishna12468@gmail.com; git (AMD-Xilinx)
>> <git@amd.com>
>> Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nor: Add reset-gpios
>> property
>>
>> On 01/09/2022 10:29, Sai Krishna Potthuri wrote:
>>> SPI-NOR flashes have RESET pin which can be toggled using GPIO
>>> controller, for those platforms reset-gpios property can be used to
>>> reset the flash device.
>>>
>>> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>>> ---
>>
>> You still miss the user (DTS) of this change...
> Do you mean to have this property in example DTS in this yaml?

No, I want to see in-tree DTS using it.

> 
>> The JEDEC spec did not mention
>> a reset pin. Can you provide the user?
> Xilinx Octal SPI (cdns,qspi-nor.yaml) is using this reset pin to reset the
> flash device on Versal platform.> Do you want me to update the example dts in cdns,qspi-nor.yaml file
> to reflect this property in this patch?
> 


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
