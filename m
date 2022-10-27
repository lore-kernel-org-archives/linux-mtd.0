Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6B6ECAAA1
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Oct 2022 13:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahGC0BjpJceeIPoA60jSVlYIPVtCabc4jgSePVyzNSM=; b=V+oyp8ZxHGVDJu
	5jFf2JcXgI7zOIikgUxViw9stwLpMa9Bd7bcFHe5ICx41hTFdd0hu+k/zx6rSld4I6I4LRGmC6RIl
	/+oOmkKAyLdqH8HXd23zqkAdWe05gq7AJpciu1uvmAIwkkf9+Fp4srZiUMjXV9A/AngOUmAQczQ8K
	6uZJ1N8X7mmZ4gDjpDwaJ0TmWSZkmsH3QZzLRD1pXIYF1Xk0Q8FFwkBGFIsvkMo9zKFeso++Ck7sc
	WsglfZa6y1uXFQutTf2jq7rZN5yt2gYruDWUqo7146CSivbIZOriWt42rdNKsmqQAhTb6glexu7uY
	aW14FmIQ42nBxLylRfsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo32h-00DZND-NI; Thu, 27 Oct 2022 13:35:32 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2s0-00DThK-Ga
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2022 13:24:30 +0000
Received: by mail-qv1-xf34.google.com with SMTP id o8so1228370qvw.5
        for <linux-mtd@lists.infradead.org>; Thu, 27 Oct 2022 06:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FrvGihGSU+1u1X6lPYtU3IF7qOhmUZAOvb+PS/jgHac=;
        b=f9fqfTdB1fpyw9ll0m7LUbllLfUf38kkeSjxVV7aZhw5mDk4hO2ZJ9EvWM/K3911VG
         e3SqJDJeAGXlVXUx2R90bRBkhfaHWeNxu3JXS/NRuAxKkzTPJiXIECpxX42R9l2DBZXE
         H2h1dWK2npn18uwc0m1bT3nKSYRYEXScqYkwr223en3bzFpvUexo+ssgysQC5+S3iQa9
         3jjMhP0a+wgRfH3KuT7BIPhog/Jl8YODPIxA0baLADpt7bpq07Dy1oelBzX3OapDp1bL
         QWDmDVwDlc40nLz41GArcVd3cCIO2vAusjcVcLq313hwpT+wENzsbKxgoAvgtClKw/ko
         UilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrvGihGSU+1u1X6lPYtU3IF7qOhmUZAOvb+PS/jgHac=;
        b=LBFWtH5WvhohHbT0kFtSqR2Ab0ViNTn5isU+vYfS975ZBndEArDgX35SxJc5asmSfQ
         IafsAqI0neuuv5K1NyoAfdAnao56/OW2rgNXrSAYfYWZZpYD3IYp9Oxw8yaY/XaJPn2w
         Mno5LHjsmr+4joDvf6uPLGcPVWBVcNIXthJxVc9iXJubOP76zskRVVinnGf00VZOFopK
         30lI+GqLstl2DCb8qU9N+tvAjMOLQPQuFMB0kW+EEQEPAzwy/J+DOWbeFc7MJxfM/gZT
         IK/2CF2V1/dam0SDZKu8HRLJd8KskXOyBUrm2qC7w2V3gWbBXsCyil19lzusBojATOMr
         +5QA==
X-Gm-Message-State: ACrzQf3lwZPIIcT81BQsR0ovRVVCoxIqpnTxkhg2Xhw13lz0lAiywiT+
	IHpgRCfoZGd2FEbnm0KufWLBuA==
X-Google-Smtp-Source: AMsMyM61Frw3vZeZksIO32h/W8s5AAQauq2DlgFazrqU6xzaSS6SP4kL+dwmG+J+YcbyV9IWBEvycQ==
X-Received: by 2002:ad4:574b:0:b0:4bb:86d1:7b89 with SMTP id q11-20020ad4574b000000b004bb86d17b89mr13050392qvx.32.1666877067200;
        Thu, 27 Oct 2022 06:24:27 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id p11-20020a05620a112b00b006cbc6e1478csm956979qkk.57.2022.10.27.06.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 06:24:26 -0700 (PDT)
Message-ID: <e937b059-4168-3bd4-b294-cbfff0519d1f@linaro.org>
Date: Thu, 27 Oct 2022 09:24:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vadym Kochan <vadym.kochan@plvision.eu>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Elad Nachman <enachman@marvell.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
References: <20221026134545.7146-1-vadym.kochan@plvision.eu>
 <20221026134545.7146-2-vadym.kochan@plvision.eu>
 <33f04b06-dc00-b7ce-6a24-2282608b40dc@linaro.org>
 <VI1P190MB0317C739E2D39427CD2A771D95309@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
 <10581088-e4ff-76db-3c9b-42a7a9c118ee@linaro.org>
 <20221027151825.166a9255@xps-13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027151825.166a9255@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_062428_619023_AA0FD94D 
X-CRM114-Status: GOOD (  20.69  )
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

On 27/10/2022 09:18, Miquel Raynal wrote:
> Hi Vadym,
> 
>>>>> +patternProperties:
>>>>> +  "^nand@[0-3]$":
>>>>> +    type: object
>>>>> +    properties:
>>>>> +      reg:
>>>>> +        minimum: 0
>>>>> +        maximum: 3
>>>>> +
>>>>> +      nand-rb:
>>>>> +        minimum: 0
>>>>> +        maximum: 1
>>>>> +
>>>>> +      nand-ecc-strength:
>>>>> +        enum: [1, 4, 8]
>>>>> +
>>>>> +      nand-on-flash-bbt: true
>>>>> +
>>>>> +      nand-ecc-mode: true
>>>>> +
>>>>> +      nand-ecc-algo:
>>>>> +        description: |
>>>>> +          This property is essentially useful when not using hardware ECC.
>>>>> +          Howerver, it may be added when using hardware ECC for clarification
>>>>> +          but will be ignored by the driver because ECC mode is chosen depending
>>>>> +          on the page size and the strength required by the NAND chip.
>>>>> +          This value may be overwritten with nand-ecc-strength property.
>>>>> +
>>>>> +      nand-ecc-step-size:
>>>>> +        description: |
>>>>> +          Marvell's NAND flash controller does use fixed strength
>>>>> +          (1-bit for Hamming, 16-bit for BCH), so the actual step size
>>>>> +          will shrink or grow in order to fit the required strength.
>>>>> +          Step sizes are not completely random for all and follow certain
>>>>> +          patterns described in AN-379, "Marvell SoC NFC ECC".
>>>>> +
>>>>> +      label:
>>>>> +        $ref: /schemas/types.yaml#/definitions/string
>>>>> +
>>>>> +      partitions:
>>>>> +        type: object  
>>>>
>>>> That's not what I asked for. Like four times I asked you to add here
>>>> unevaluatedProperties: false and I never said that ref to partition.yaml
>>>> should be removed and you... instead remove that ref.
>>>>
>>>> You need to define here children and specify their ref.
>>>>
>>>> You must use unevaluatedProperties: false here. So this is fifth time I
>>>> am writing this feedback.
>>>>
>>>>  
>>>
>>> It is a bit confusing that it is needed to define "partitions" and "label" rules particulary
>>> in this nand controller instead of some common place like nand-chip.yaml, these properties
>>> are common also for the other nand controllers.  
>>
>> No one speaks about label, I never commented about label, I think...
>>
>> If you think the property is really generic and every NAND controller
>> bindings implement it, then feel free to include them there, in a
>> separate patch. It sounds sensible, but I did not check other bindings.
> 
> FYI, label is already defined in mtd/mtd.yaml.

Which is not included here and in nand-controller.yaml

> Partitions do not need to be defined in your binding, just don't put
> any in your example and you'll be fine. These partitions are either
> static and may be described in the DT (see
> mtd/partition/partition.yaml) or there is some dynamic discovery
> involved and a proper parser shall be referenced (parsers have their
> own binding).

I don't think this is correct. Basically you allow any node to be under
partitions as there is no schema validating them (without compatibles).

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
