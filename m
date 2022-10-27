Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8151FECAAA1
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Oct 2022 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mbzSy19jt7BbCUpamtCI6b7HMgxqnvsu6sVmWV6wJRY=; b=Qn4XAJalftzR4u
	3TJsEowmRaH1F2CAeDNbeCTHBs5qL9PcNq76nJi37+ZL0gmrFqSu8rhZZ5VhP9UPA/GHClmsTRtFu
	XxbU9IKZO5rHEo9mdulke8ElP/Sbaeo+c/vPXEmcOsahpRuip8jk6SVWCZwGLw5zKZO4OMoJpokQ9
	DYySkM17pju5AfnzDa8WcEGO1AQcqVPYOSd+hp1/kxg71b6odLVihhpif2ERQKCRGcR7MdGETb3TM
	bFsFqfnjlpzv6is3+/ojF642eypM5Uv7h+05Jr78aRdHDbxVe95KmrxjGEvEjn320i5Q0a1SO/tiQ
	GbOpQ5ciE6RHjEwN4yuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2X5-00DJ08-HR; Thu, 27 Oct 2022 13:02:51 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2X0-00DIx0-4T
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2022 13:02:48 +0000
Received: by mail-qt1-x82d.google.com with SMTP id ay12so348176qtb.12
        for <linux-mtd@lists.infradead.org>; Thu, 27 Oct 2022 06:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TGLKpxZOlMv1oQKhBXbn5pk4T3IOonLKRPQdZbP5eNY=;
        b=LiScULGbSZ7F7yQ6eDZyyJNC8WlGr54/jqCQ8LAKmrxPDy0pI5635ZhAGS9xQ+pcmo
         7OdEZDuJSOZyixcIu/7Ejicef5zw3l8V+mq+VXTcyy0n1OOHXu4vAH2+XvvVUPZCcjbN
         cHQVBE+pDYSV8Fv7exKtyUMwygV6n+ZH02IpuCsuqcveQJWxa7qkS57i7upFRtmHShFW
         3t0oPXNBt6DfCz0baGiIhdahL2GYIG10Oc/NCM82y1wOQpbBHF1eCscYhcW8LcaPPe8O
         aiORwRC/DTOY2RSl235uvv9qnguVCMTt6pxVYaf/zDXEtW6QMn8uwihektueJaKe/I2Y
         QbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TGLKpxZOlMv1oQKhBXbn5pk4T3IOonLKRPQdZbP5eNY=;
        b=pA2LMVr4e4OiYxC4V05hMojTngHBksRrfD8s67AzCDrdQgAbzgEiBxN3aou2eAdFBV
         HG5kJBIG6CIFKzgfGrnS3lqCF9iZImgwA6R4KBSYeKqjml6uxa6clGswxcmHOPznkxN1
         U91d203EHOJpGJphHmMp74qyELGOmlIpw6S4Xctmv0Cnc34M52CfQGULBn6NSxd/1Zxt
         v031dWfaRBumTjguV9/F1Fjz2WoQQ1fcJqfuGMugNNhwalIjD8eVT/zlbz8iHNXJ5Hog
         EQHk4Vsg72kpA+WYvTlakKpKDUEy3/3e8BOuZEHXKYbnptcgBAr4Q1nB78xoqZkDMcG8
         1zOA==
X-Gm-Message-State: ACrzQf0tefzUrjHpibaLiL2w/GlubS8U8Q97l7iLQWWasrnlLsSlvj8z
	UCZF0faidm98JyZKymYdzpt0cb3LR7txcg==
X-Google-Smtp-Source: AMsMyM6aU8WYV8rw/aGC3bW6/7M1Bt3B2qQh71bOJakmCD3pUdJq+SK17j5wVfG+En+ypNTByPcdXw==
X-Received: by 2002:a05:622a:512:b0:39a:d23a:431a with SMTP id l18-20020a05622a051200b0039ad23a431amr40746210qtx.370.1666875751577;
        Thu, 27 Oct 2022 06:02:31 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id n14-20020a05620a294e00b006eed094dcdasm935978qkp.70.2022.10.27.06.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 06:02:30 -0700 (PDT)
Message-ID: <10581088-e4ff-76db-3c9b-42a7a9c118ee@linaro.org>
Date: Thu, 27 Oct 2022 09:02:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Vadym Kochan <vadym.kochan@plvision.eu>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Elad Nachman <enachman@marvell.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
References: <20221026134545.7146-1-vadym.kochan@plvision.eu>
 <20221026134545.7146-2-vadym.kochan@plvision.eu>
 <33f04b06-dc00-b7ce-6a24-2282608b40dc@linaro.org>
 <VI1P190MB0317C739E2D39427CD2A771D95309@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <VI1P190MB0317C739E2D39427CD2A771D95309@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_060246_253884_459E2C56 
X-CRM114-Status: GOOD (  20.09  )
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

On 26/10/2022 17:57, Vadym Kochan wrote:
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>
>> What happened to maxItems here? This is wrong. You keep changing random
>> things, again. V3 was correct.
>>
> 
> It is not random, I tried to enforce to use 2 clocks for A7k/8K case.

I think I gave you example how these clocks are being enforced, but
let's paste it here one more time:
https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L38

If you have always two clocks, you just put here maxItems and skip the
allOf:if:then.

If you have here for some variants one clock, for some two, then define
wide constraints here and narrow them for each variant in allOf:if:then
("else:")

> 
>>
>>> +    description:
>>> +      Shall reference the NAND controller clocks, the second one is
>>> +      is only needed for the Armada 7K/8K SoCs
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: core
>>> +      - const: reg
>>> +
>>> +  dmas:
>>> +    maxItems: 1
>>> +
>>> +  dma-names:
>>> +    items:
>>> +      - const: rxtx
>>> +
>>> +  marvell,system-controller:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: Syscon node that handles NAND controller related registers
>>> +
>>> +patternProperties:
>>> +  "^nand@[0-3]$":
>>> +    type: object
>>> +    properties:
>>> +      reg:
>>> +        minimum: 0
>>> +        maximum: 3
>>> +
>>> +      nand-rb:
>>> +        minimum: 0
>>> +        maximum: 1
>>> +
>>> +      nand-ecc-strength:
>>> +        enum: [1, 4, 8]
>>> +
>>> +      nand-on-flash-bbt: true
>>> +
>>> +      nand-ecc-mode: true
>>> +
>>> +      nand-ecc-algo:
>>> +        description: |
>>> +          This property is essentially useful when not using hardware ECC.
>>> +          Howerver, it may be added when using hardware ECC for clarification
>>> +          but will be ignored by the driver because ECC mode is chosen depending
>>> +          on the page size and the strength required by the NAND chip.
>>> +          This value may be overwritten with nand-ecc-strength property.
>>> +
>>> +      nand-ecc-step-size:
>>> +        description: |
>>> +          Marvell's NAND flash controller does use fixed strength
>>> +          (1-bit for Hamming, 16-bit for BCH), so the actual step size
>>> +          will shrink or grow in order to fit the required strength.
>>> +          Step sizes are not completely random for all and follow certain
>>> +          patterns described in AN-379, "Marvell SoC NFC ECC".
>>> +
>>> +      label:
>>> +        $ref: /schemas/types.yaml#/definitions/string
>>> +
>>> +      partitions:
>>> +        type: object
>>
>> That's not what I asked for. Like four times I asked you to add here
>> unevaluatedProperties: false and I never said that ref to partition.yaml
>> should be removed and you... instead remove that ref.
>>
>> You need to define here children and specify their ref.
>>
>> You must use unevaluatedProperties: false here. So this is fifth time I
>> am writing this feedback.
>>
>>
> 
> It is a bit confusing that it is needed to define "partitions" and "label" rules particulary
> in this nand controller instead of some common place like nand-chip.yaml, these properties
> are common also for the other nand controllers.

No one speaks about label, I never commented about label, I think...

If you think the property is really generic and every NAND controller
bindings implement it, then feel free to include them there, in a
separate patch. It sounds sensible, but I did not check other bindings.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
