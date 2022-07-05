Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0115C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 15:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byQX280Oe3bLOkG7EuE+ENpCE3c6y/Z08EwUR8xhfVI=; b=K3ZssSyMPK9m4Z
	p/7ieOlPvZ+2natxaONSm80jBChU+nB6JwvMxevm92fAvrd/Ryptrcl1zRlYtMvGR9FLjQPVhYn1s
	2yRGjETDkHDgFAJAePtUzkMjf3mp0sCKwJMdsjMrcDfUEQY27RV8Ac4YhqEAaM6GUq6SJdvCiEReN
	M8NC+yntOcCwfcjAP2ZsXltvHzuJGhpF3QEJaFp9DjTGYxgH8HZ5rIW/kVVQ3h90FLz4JInP1w+Vg
	xqttunqrSebcj/t2BlJ+p0Ciaydb98+tFHViNfXJhoi9UDXHd5kxTaTk03SB2WOsSoOzOoKsBLKXv
	MPbDibRaM/5XCL8jdWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8kdF-001Cdr-3i; Tue, 05 Jul 2022 15:38:33 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8kdB-001Cag-Mf
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2022 15:38:31 +0000
Received: by mail-lf1-x12d.google.com with SMTP id f39so21228171lfv.3
        for <linux-mtd@lists.infradead.org>; Tue, 05 Jul 2022 08:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5lac26hSsxq2bqnIIbfo8iISJEnKW0GSTyf9EVWeE/Q=;
        b=fQ22/amhPh/I/Xg9BYSELh7tZekP3MwvTy0jBXI7Rb8+FG2nRtPqMPqIHrO6WVwZIU
         lTv93pXJqRsza/X+5D34Cd/zOn6u6V5ksIiRnP1qwUgBY0uPPU8hP1+EAZLJAnD7Pyma
         Zk7HKsXc+Ql4z0/CA3osKYg3Z+PcTp65hZLDhsyw2SK0Bw8uR6+84F4vHVEszweSCXMP
         mi82fIrrjPFiaKbhBNDYhLDbK2OsDOUThTAaU0vb4MM3xHtG9QkCpRrzezOR2RNm6WnL
         Al8WFMIioAyE+5TIGbCNNzTl7rPsxHt1VYiUEexZuJxMctYm6XcTk159GzZPhpT8rAl3
         TmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5lac26hSsxq2bqnIIbfo8iISJEnKW0GSTyf9EVWeE/Q=;
        b=aTNHCPx/zwl0rb25f3+GbXT6D7ukQwcmRhAJ2tRoJa5/GgXTKDaCCS1/xOO8nEXCMu
         ESh5gFhggYFR30vDbQWO623iR069/55QDcmiItlEm0t4BePjxDkcGaHC8JMHa1LhD7/6
         3G35uhG12u8Z+RS0eY7TvARZa1W46+2JiQrR54dYfuiqB3qYzcNn18Krp0w5PPFeUw2x
         xrPJ4y/dWJ4mNhp0QKM6ZwlJ+5PptLGBJ0bXV4iGXZFNe6gWJQv0emXA0hnmFgsoliAx
         NriJHCZecsp6EsHo68OVXRqED4FnYhnfG1RwCWM5Q+oxS/OJdWU6S2EnU55RAehe86x8
         RB3Q==
X-Gm-Message-State: AJIora8blz6dCCQ0hCm6vGpyXo0Z/sGr63u5vq/uBHlxoylrcF0Rxqpi
	aywPVEj3xGyHCwNLjznkUtt6kw==
X-Google-Smtp-Source: AGRyM1tmXLh3z47oCGKtYz2FIn0NiD6p981KwThQufhF/Jz38GQV4qLcO+NFEqfJnt590d8d+yj6eQ==
X-Received: by 2002:a05:6512:6d4:b0:47f:74b4:4ec4 with SMTP id u20-20020a05651206d400b0047f74b44ec4mr22043767lff.654.1657035507235;
        Tue, 05 Jul 2022 08:38:27 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id a9-20020a19ca09000000b00477a6c86f17sm5746920lfg.8.2022.07.05.08.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 08:38:26 -0700 (PDT)
Message-ID: <0bd271e9-8d9b-7388-2d9b-65cc39a54f8c@linaro.org>
Date: Tue, 5 Jul 2022 17:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/11] dt-bindings: spi: spi-nxp-fspi: add a new property
 nxp,fspi-dll-slvdly
Content-Language: en-US
To: Han Xu <han.xu@nxp.com>
Cc: Michael Walle <michael@walle.cc>, Bough Chen <haibo.chen@nxp.com>,
 ashish.kumar@nxp.com, yogeshgaur.83@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 singh.kuldeep87k@gmail.com, tudor.ambarus@microchip.com, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 festevam@gmail.com, dl-linux-imx <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, zhengxunli@mxic.com.tw
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
 <1657012303-6464-7-git-send-email-haibo.chen@nxp.com>
 <ef676df1-77e0-b8ee-3950-97eade8ddd5b@linaro.org>
 <VI1PR04MB40167A70FBE772DF91047A4190819@VI1PR04MB4016.eurprd04.prod.outlook.com>
 <59d360ef-5374-c7a7-2995-854ab3715b25@linaro.org>
 <DU2PR04MB87747C9A8F18D8300461D6B197819@DU2PR04MB8774.eurprd04.prod.outlook.com>
 <f33ad190-f5c7-d9fa-088b-5538ab1f4d59@linaro.org>
 <DU2PR04MB877492F346BAA10B2AA7428497819@DU2PR04MB8774.eurprd04.prod.outlook.com>
 <62f113a0cdb0d58bf04ab0b274912eb7@walle.cc>
 <be521f90-97ce-c61d-d7d6-8f2bde24d824@linaro.org>
 <20220705145226.tarpvub6bh67tj63@umbrella>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705145226.tarpvub6bh67tj63@umbrella>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_083829_799307_D822F347 
X-CRM114-Status: GOOD (  17.59  )
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

On 05/07/2022 16:52, Han Xu wrote:
> On 22/07/05 04:12PM, Krzysztof Kozlowski wrote:
>> On 05/07/2022 16:06, Michael Walle wrote:
>>>
>>>>>
>>>>> I think you could use here clock cycles or clock phase, but then it 
>>>>> has to be obvious
>>>>> it is that unit.
>>>>
>>>> Hi Krzysztof,
>>>>
>>>> Let me clarify it, in the document a term "delay cell" was used to
>>>> descript this register bit. Each delay cell equals "1/32 clock phase",
>>>> so the unit of delay cell is clock phase. The value user need set in
>>>> DT just number to define how many delay cells needed.
>>>
>>> Then should the unit be "-degrees" and the possible range 0-180?
>>
>> Thanks. We don't have it documented currently, but the unit seems
>> reasonable.
> 
> IMO, use the unit "-degrees" makes it more complicate. Personaly I would
> calculate how many clock cycle delay needed, such as 1/4 clock cycle or half
> clock cycle. Using degree brings extra calculation.

And what if the next device uses a bit different divider? Like 1/16?
This is why we have standard units so people won't push register values
into the bindings.

> 
> The granularity of the clock phase change is 1/32 of 180 degree, but the range
> 0-180 make people feel it can be set in any degree in range.

Yes, because that's how the bindings are being written - allowing any
reasonable value, not register-specific value, to be used because it is
the most flexible, hardware-independent and allows further customization
of bindings (e.g. new devices). Embedding device programming model into
the bindings contradicts it.

Second, nothing stops you from narrowing the acceptable values with an
enum. This still allows extension. Your 1/32 does not.

> 
> If I describe all details of the relation between "nxp,fspi-dll-slvdly" and
> "delay cell" in patch v2, do you think it's clear for users?

1/32 could be a nice unit, but degrees is better. Just like uV is better
than 1/32 of V. Like 1 us is better than 1/32 of ms.

Do you see  in the bindings many other values like time, potential,
current or power described in 1/32 units?

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
