Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFBDC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oeI/PxTqq4W8JFuIE9yrOapaQPeI7SyHmR6ukap1jA=; b=eR2kR50rj01WF8YKDP4upvgxZ3
	nKz7CfQcoFgH0ctALKcEUU0/UleMvW7eAwC6qNG/zmNnWTBh6BkCyvg1RXGcTAe4W0AeC15thwOGi
	8vFgX0lclpSlSTacnJFFlPbUQ4ACXrJoVf4WmOtdwY4BPFmhuvK1CQsX0aKum6shecJimW6hZ91cS
	bDy3bsBYG3JzLHJe2hBqDXFefjkyLLp1gzVOGOjZonkAxi94FQL3tQ4u5B3cOZoGZqYLM1ECtFtfl
	Osj6Z3+GwABFZhZ1haMwmkjZYEG8MrHT2IwonG9o6tkmWiA2VhYTe9mAuo/TLQ4qyadPMNOBVxXIM
	IaJ9GmBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8jC5-000iDe-PS; Tue, 05 Jul 2022 14:06:25 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8jBq-000i6c-IJ; Tue, 05 Jul 2022 14:06:16 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id DFACE2223E;
	Tue,  5 Jul 2022 16:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657029962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j7NwS041H2A7Av1dAuyz4ev4klbMrMlMS8fdSFJVby0=;
	b=rYoDNOwUzIU0r4i6jlRs02msbQ4lBYNejXJBFtTH49c+8b2klkF80wDkuYBDt6KJSdka//
	5mLtI5ihr7pLQX2MNAxj1/OO9avk4/GLuPyEYiAB++2/50uxK1jeqV53JZS+nql24KlWza
	lnmEtVGmJo3ZGK3Kzsx6PY2eJ7e1Byw=
MIME-Version: 1.0
Date: Tue, 05 Jul 2022 16:06:02 +0200
From: Michael Walle <michael@walle.cc>
To: Han Xu <han.xu@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bough Chen
 <haibo.chen@nxp.com>, ashish.kumar@nxp.com, yogeshgaur.83@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 singh.kuldeep87k@gmail.com, tudor.ambarus@microchip.com, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 festevam@gmail.com, dl-linux-imx <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, zhengxunli@mxic.com.tw
Subject: Re: [PATCH 07/11] dt-bindings: spi: spi-nxp-fspi: add a new property
 nxp,fspi-dll-slvdly
In-Reply-To: <DU2PR04MB877492F346BAA10B2AA7428497819@DU2PR04MB8774.eurprd04.prod.outlook.com>
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
 <1657012303-6464-7-git-send-email-haibo.chen@nxp.com>
 <ef676df1-77e0-b8ee-3950-97eade8ddd5b@linaro.org>
 <VI1PR04MB40167A70FBE772DF91047A4190819@VI1PR04MB4016.eurprd04.prod.outlook.com>
 <59d360ef-5374-c7a7-2995-854ab3715b25@linaro.org>
 <DU2PR04MB87747C9A8F18D8300461D6B197819@DU2PR04MB8774.eurprd04.prod.outlook.com>
 <f33ad190-f5c7-d9fa-088b-5538ab1f4d59@linaro.org>
 <DU2PR04MB877492F346BAA10B2AA7428497819@DU2PR04MB8774.eurprd04.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <62f113a0cdb0d58bf04ab0b274912eb7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_070611_398128_BBA454FD 
X-CRM114-Status: GOOD (  16.87  )
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

Am 2022-07-05 16:00, schrieb Han Xu:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Tuesday, July 5, 2022 8:29 AM
>> To: Han Xu <han.xu@nxp.com>; Bough Chen <haibo.chen@nxp.com>;
>> ashish.kumar@nxp.com; yogeshgaur.83@gmail.com; broonie@kernel.org;
>> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
>> singh.kuldeep87k@gmail.com; tudor.ambarus@microchip.com; 
>> p.yadav@ti.com;
>> michael@walle.cc; miquel.raynal@bootlin.com; richard@nod.at; 
>> vigneshr@ti.com;
>> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de
>> Cc: linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-mtd@lists.infradead.org; 
>> festevam@gmail.com;
>> dl-linux-imx <linux-imx@nxp.com>; 
>> linux-arm-kernel@lists.infradead.org;
>> zhengxunli@mxic.com.tw
>> Subject: Re: [PATCH 07/11] dt-bindings: spi: spi-nxp-fspi: add a new 
>> property
>> nxp,fspi-dll-slvdly
>> 
>> On 05/07/2022 15:19, Han Xu wrote:
>>>>>>> +  nxp,fspi-dll-slvdly:
>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>> +    description: |
>>>>>>> +      Specify the DLL slave line delay value.
>>>>>> 
>>>>>> What are the units?
>>>>> 
>>>>> Do you mean here need to give more detail explain about this 
>>>>> properity?
>>>>> 
>>>>> How about change like this?
>>>>>    Specify the DLL slave line delay value. The delay target for 
>>>>> slave delay line is:
>>>> ((nxp,fspi-dll-slvdly+1) * 1/32 * clock cycle of reference clock 
>>>> (serial root clock).
>>>> 
>>>> This would be good.
>>>> 
>>>>> The range of this value is 0~16.
>>>> 
>>>> This needs to go to schema instead as "maximum: 16".
>>>> 
>>>> But still the question is - what are the units used in this "delay"? 
>>>> ms? us?
>>> 
>>> HI Krzysztof,
>>> 
>>> According to the formula, the range should be 0~15, 16 should do 
>>> nothing or no
>> delay.
>> 
>> Sure, just add some constraint.
>> 
>>> 
>>> The unit should be clock phase. In other words, the delay can be in 
>>> range of
>> 1/32~1/2 clock cycle.
>> 
>> So we probably misunderstood each other... looking at the driver it 
>> also explains
>> the confusing. You encoded here register value which is pretty often 
>> wrong
>> approach.
>> 
>> This should be instead meaningful value for the user of the bindings, 
>> so usually
>> using one of property units:
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com
>> %2Fdevicetree-org%2Fdt-
>> schema%2Fblob%2Fmain%2Fdtschema%2Fschemas%2Fproperty-
>> units.yaml&amp;data=05%7C01%7Chan.xu%40nxp.com%7C0ffe3d706e064f14382
>> 108da5e8a5add%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6379262
>> 45564450475%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
>> 2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=Q4
>> SfVnBN%2BQ0vYKJzRf%2FXZkCA1WGyPV9doFcb%2BLSKx4w%3D&amp;reserved=0

Hm, you should fix your mail server.

>> 
>> I think you could use here clock cycles or clock phase, but then it 
>> has to be obvious
>> it is that unit.
> 
> Hi Krzysztof,
> 
> Let me clarify it, in the document a term "delay cell" was used to
> descript this register bit. Each delay cell equals "1/32 clock phase",
> so the unit of delay cell is clock phase. The value user need set in
> DT just number to define how many delay cells needed.

Then should the unit be "-degrees" and the possible range 0-180?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
