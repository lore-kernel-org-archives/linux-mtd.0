Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06664ECAAD3
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Aug 2022 08:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GiROiXTXPSLBJuK2bJvs22mvcVpt3Jm9c1diqG9zho=; b=r8eEFgmQIoAS+H
	p1vAZK7HRWC3gpMcZZfNlONemGZyhOHIiyxaPD+97KZs1XKnVcOrR0u0d4E9KiAehdkCTkOGlD1O4
	B6kp8OdgO0lifJY9MPnkpxEig+WEYkGVDAWIKVRFn1hENIlcpCCiufz1F4FigCYX6jnqC27W/U89s
	OoD4umQTDCtkMQJO3d64Rtl77eGrbEVeVgb4tESoY4c/+t+NuzgGF5L4ULYvuxvggVpG4H0VcTFds
	QY0rH4kMrTiF8pLvWKqOfrZZXUvp31o1/wfIlpdSKOmTFMyXjv7fmhUqNPOWXe29jX6ogV5G7nLAr
	q/HBy5p+DZDwTNMgky7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTIgp-004mfR-Nc; Wed, 31 Aug 2022 08:03:12 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTIYy-004jNg-9Z
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2022 07:55:05 +0000
Received: by mail-lj1-x22d.google.com with SMTP id bx38so13732450ljb.10
        for <linux-mtd@lists.infradead.org>; Wed, 31 Aug 2022 00:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=EjNp+7haJJSgy95sPk2VW8hRKYlROSxGZaohd5CN+EI=;
        b=CwqpdxtS9UCgIfqRkt6+aIZ0njmYiIrSHVdD82RbExYkj+ULE08yVapfltsyJ9hvSW
         Rb6AyDPrPUcT6w7doSdjava+dERXsqEeqkJ/OdD9iIWnhGyYr2pbtl8OVMc5f2KR9nKS
         Qejeur1bzAP74t/mQ82tyWDbqmUDC9AhxRI4X9KatAxvosA3H+xbR59V13PI2JEk8yY4
         qWl8JtRsZaoZqu2Oosv2IdDv4tHuE5U72Xa7zFNCUlFfBxSJzmT7ZvD/IY2EURuy74eP
         vqquwYSd+wYFYdE4xfwCK7GOhmxagKAy3tb2bHzXyZ0n2wc2lCB65CjuZc7jHCba/tZX
         bOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=EjNp+7haJJSgy95sPk2VW8hRKYlROSxGZaohd5CN+EI=;
        b=vcJcuj2nB+yG5tg+jVfEJtSfoBS9claitZxfrhxYArcj3VQEgDU0GXeZgoGMIyKuvP
         K7Idg03MbnF+zqHYbEI7W1ImbpxAKL6HKE0Ew12gFP494nGj6jK/n6hZPXSgrk0HUeQo
         nDwZR063q2Ga+QrY08OulgbRgklzVZHhFJXslrH0qkd3wjoqvZTPdk6xXrfgcfRpWOeR
         lknhiHNVk82IHJtTSLQsoBynKUEWTTBuNmhy14vv4jWjHEoExhCaSjetz9YII3plLkax
         et4bjDGimEW0PzWbK2HmWFQ3sKdm/HkKaJrcfBw2XWhhWucsJ24ceZmNe4l12KLdRoD6
         Vu8A==
X-Gm-Message-State: ACgBeo3RGqfetIszuyhCUhm7z8pUPGk5n6tGdyvre/8Rjt9ccQg7uJmx
	06Cf4BQVQwykGj+X55kpFtEuMw==
X-Google-Smtp-Source: AA6agR5TonQq2egwGvsmAbtSJj7KC2P5OqTK7X6niXiRLekmSFrg4NY6LC2zIVdsJmcKXe2E6Q9IwA==
X-Received: by 2002:a2e:9d8b:0:b0:265:b87d:b43b with SMTP id c11-20020a2e9d8b000000b00265b87db43bmr3660954ljj.531.1661932501985;
        Wed, 31 Aug 2022 00:55:01 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id bn38-20020a05651c17a600b0025e778f6f13sm2030296ljb.4.2022.08.31.00.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 00:55:01 -0700 (PDT)
Message-ID: <ffe0e6a8-96ba-e5ed-70c9-f7c6cd9c9ade@linaro.org>
Date: Wed, 31 Aug 2022 10:55:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 08/14] dt-bindings: mtd: relax the nvmem compatible
 string
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-9-michael@walle.cc>
 <e0afa0fc-4718-2aa1-2555-4ebb2274850b@linaro.org>
 <c8aea3ecb0fcf08c42852f99a4f265b6@walle.cc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c8aea3ecb0fcf08c42852f99a4f265b6@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_005504_397287_E17921AA 
X-CRM114-Status: GOOD (  21.55  )
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

On 31/08/2022 10:48, Michael Walle wrote:
> Am 2022-08-31 09:37, schrieb Krzysztof Kozlowski:
>> On 26/08/2022 00:44, Michael Walle wrote:
>>> The "user-otp" and "factory-otp" compatible string just depicts a
>>> generic NVMEM device. But an actual device tree node might as well
>>> contain a more specific compatible string. Make it possible to add
>>> more specific binding elsewere and just match part of the compatibles
>>
>> typo: elsewhere
>>
>>> here.
>>>
>>> Signed-off-by: Michael Walle <michael@walle.cc>
>>> ---
>>>  Documentation/devicetree/bindings/mtd/mtd.yaml | 7 ++++---
>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml 
>>> b/Documentation/devicetree/bindings/mtd/mtd.yaml
>>> index 376b679cfc70..0291e439b6a6 100644
>>> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
>>> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
>>> @@ -33,9 +33,10 @@ patternProperties:
>>>
>>>      properties:
>>>        compatible:
>>> -        enum:
>>> -          - user-otp
>>> -          - factory-otp
>>> +        contains:
>>> +          enum:
>>> +            - user-otp
>>> +            - factory-otp
>>
>> This does not work in the "elsewhere" place. You need to use similar
>> approach as we do for syscon or primecell.
> 
> I'm a bit confused. Looking at
>    Documentation/devicetree/bindings/arm/primecell.yaml
> it is done in the same way as this binding.

Yes. primecell is like your mtd here. And how are other places with
primcell (like other places with user-otp) done?

> 
> Whereas, the syscon use a "select:" on top of it. I'm
> pretty sure, I've tested it without the select and the
> validator picked up the constraints.
> 
> Could you elaborate on what is wrong here? Select missing?

You got warning from Rob, so run tests. I think you will see the errors,
just like bot reported them.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
