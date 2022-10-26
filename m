Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76670C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Oct 2022 14:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FXcvbjsaKA0JUnpfnU5RXfuq2mBs31ghDAzkBeeA4SQ=; b=cveL763qQgGawf
	04+5IGHWXp37jnkpBn0037I1Xh/3bf+9bL5u8wPjYNMqyCPT8zKdUCKkmbv+NO2c7aRBbj4RMXOCE
	odplWof9F1p46ZkMwA8aNJiaizTehEr8o4Ojh51pRuhHnAIfxD9Fr9Elc/xRAsuYaoAxIV5U2uuq+
	OiA0vd2+q5wEbEnmfru3YA80z65n+ugXLZhEp1b72H/3FAVlKiuAsNRbzhdk05J8cFExT3p1uz9Lf
	1qMJkyYwGL6EL+DrLcx1N8amqXSWdh3FUd3Dqpfq6Nl4dCzpfuuDoa2W2yHm5mngs4A2gSGP5NxzA
	12Ut77tMDdHsX3aUj+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onh0v-009cJp-Ew; Wed, 26 Oct 2022 14:04:13 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onh0f-009cDK-4A
	for linux-mtd@lists.infradead.org; Wed, 26 Oct 2022 14:04:01 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id mi9so2281420qvb.8
        for <linux-mtd@lists.infradead.org>; Wed, 26 Oct 2022 07:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K0FMCAGU99/gxxhND5LQd2WT40JLl3+xM4j0E8CMTig=;
        b=aCmgmOvVXyPeDPFTfhq44BjCMgqwzhf9h0eyAJW9zQNzWVHsFJ7VX9dklLkVQTmdZF
         xmbAITE2zV5jGAdm0r2OqPku577248qMFXxdYbevR61hE8fv8Rwvv6uiNqeLn7d+0W3J
         ulbYkKZtH+9LK6YRpjK+viCtEb6tK/oxwzmFsc2NNDCqmvKPDsKFKdJirFDy1s7sJBxZ
         GH5bhTjEolhLNLc/eTqjC4EPeRN1yDGu6p/cFX9UV2Tt6Uv9SDsm/yuqtK/naKH2W1FY
         AwpSEU8baUG0L1SGS0PcsUviQ0+6hFolwsC1lALAcn4tIdHo7kXf5Ptopdx/ixsv+fS1
         vOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0FMCAGU99/gxxhND5LQd2WT40JLl3+xM4j0E8CMTig=;
        b=ZJKOkAA+f13OsVT/XPHyrTwtkcSbLsf3PbTldSJ9sJXkirGo67vB5vB7uwLMTzNzVl
         JOZtJL61zwspBdNRs7JQi0ZHKGUoslwkZc//d1Di8RB/u/znsMqwUGTZdmpCXbuHLBAZ
         vlSE52b1WJfy6UueX4YLFS407lHz0tL7Y6CUSa4wv3bYpCePRxvSpHVNLUHOT1Ec9XJ2
         5gejPJ0OQ3O0LuBFrVAX/IpmNMgqJCsn466Tyj33gSH2+zQehWdsdtRe6LuLoUENan1o
         7I3oVpFp4W+SRagZmaa5+qDpkMkl0yoWfuS3IDd5XwpMmuxIvcuICzsm2BoX/wDXT/ml
         snxA==
X-Gm-Message-State: ACrzQf3OKOt4rePHHo22aRjNQtky1XiB21+IqaGkHGh/AjXcwI5um5P0
	8+1XIawJaJH2IGSYg0bfR6Gf4Q==
X-Google-Smtp-Source: AMsMyM5EhQnp5hGwivmyhMJy+Hy50jBQP1AEowqi9ENw6car1HQoKTCSA+gBXin3YXpW4Y4ZY9sWgg==
X-Received: by 2002:ad4:5f8d:0:b0:4bb:6d57:cfea with SMTP id jp13-20020ad45f8d000000b004bb6d57cfeamr13907050qvb.98.1666793034792;
        Wed, 26 Oct 2022 07:03:54 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id q8-20020a37f708000000b006ce0733caebsm3886409qkj.14.2022.10.26.07.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 07:03:53 -0700 (PDT)
Message-ID: <33f04b06-dc00-b7ce-6a24-2282608b40dc@linaro.org>
Date: Wed, 26 Oct 2022 10:03:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026134545.7146-2-vadym.kochan@plvision.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_070357_310991_8E98E9FE 
X-CRM114-Status: GOOD (  33.00  )
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

On 26/10/2022 09:45, Vadym Kochan wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> Dropped deprecated compatibles and properties described in txt file.
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> ---
> 
> v5:
>    1) Get back "label" and "partitions" properties but without
>       ref to the "partition.yaml" which was wrongly used.
> 
>    2) Add "additionalProperties: false" for nand@ because all possible
>       properties are described.
> 
> v4:
>    1) Remove "label" and "partitions" properties
> 
>    2) Use 2 clocks for A7K/8K platform which is a requirement
> 
> v3:
>   1) Remove txt version from the MAINTAINERS list
> 
>   2) Use enum for some of compatible strings
> 
>   3) Drop:
>         #address-cells
>         #size-cells:
> 
>      as they are inherited from the nand-controller.yaml
> 
>   4) Add restriction to use 2 clocks for A8K SoC
> 
>   5) Dropped description for clock-names and extend it with 
>      minItems: 1
> 
>   6) Drop description for "dmas"
> 
>   7) Use "unevalautedProperties: false"
> 
>   8) Drop quites from yaml refs.
> 
>   9) Use 4-space indentation for the example section
> 
> v2:
>   1) Fixed warning by yamllint with incorrect indentation for compatible list
> 
>  .../bindings/mtd/marvell,nand-controller.yaml | 195 ++++++++++++++++++
>  .../devicetree/bindings/mtd/marvell-nand.txt  | 126 -----------
>  MAINTAINERS                                   |   1 -
>  3 files changed, 195 insertions(+), 127 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> new file mode 100644
> index 000000000000..544e98ed12bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> @@ -0,0 +1,195 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/marvell,nand-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell NAND Flash Controller (NFC)
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: marvell,armada-8k-nand-controller
> +          - const: marvell,armada370-nand-controller
> +      - enum:
> +          - marvell,armada370-nand-controller
> +          - marvell,pxa3xx-nand-controller
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:

What happened to maxItems here? This is wrong. You keep changing random
things, again. V3 was correct.


> +    description:
> +      Shall reference the NAND controller clocks, the second one is
> +      is only needed for the Armada 7K/8K SoCs
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: reg
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: rxtx
> +
> +  marvell,system-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Syscon node that handles NAND controller related registers
> +
> +patternProperties:
> +  "^nand@[0-3]$":
> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +
> +      nand-rb:
> +        minimum: 0
> +        maximum: 1
> +
> +      nand-ecc-strength:
> +        enum: [1, 4, 8]
> +
> +      nand-on-flash-bbt: true
> +
> +      nand-ecc-mode: true
> +
> +      nand-ecc-algo:
> +        description: |
> +          This property is essentially useful when not using hardware ECC.
> +          Howerver, it may be added when using hardware ECC for clarification
> +          but will be ignored by the driver because ECC mode is chosen depending
> +          on the page size and the strength required by the NAND chip.
> +          This value may be overwritten with nand-ecc-strength property.
> +
> +      nand-ecc-step-size:
> +        description: |
> +          Marvell's NAND flash controller does use fixed strength
> +          (1-bit for Hamming, 16-bit for BCH), so the actual step size
> +          will shrink or grow in order to fit the required strength.
> +          Step sizes are not completely random for all and follow certain
> +          patterns described in AN-379, "Marvell SoC NFC ECC".
> +
> +      label:
> +        $ref: /schemas/types.yaml#/definitions/string
> +
> +      partitions:
> +        type: object

That's not what I asked for. Like four times I asked you to add here
unevaluatedProperties: false and I never said that ref to partition.yaml
should be removed and you... instead remove that ref.

You need to define here children and specify their ref.

You must use unevaluatedProperties: false here. So this is fifth time I
am writing this feedback.



> +
> +      marvell,nand-keep-config:
> +        description: |
> +          Orders the driver not to take the timings from the core and
> +          leaving them completely untouched. Bootloader timings will then
> +          be used.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      marvell,nand-enable-arbiter:
> +        description: |
> +          To enable the arbiter, all boards blindly used it,
> +          this bit was set by the bootloader for many boards and even if
> +          it is marked reserved in several datasheets, it might be needed to set
> +          it (otherwise it is harmless) so whether or not this property is set,
> +          the bit is selected by the driver.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        deprecated: true
> +
> +    additionalProperties: false
> +
> +    required:
> +      - reg
> +      - nand-rb
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +allOf:
> +  - $ref: nand-controller.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: marvell,pxa3xx-nand-controller
> +    then:
> +      required:
> +        - dmas
> +        - dma-names
> +    else:
> +      properties:
> +        dmas: false
> +        dma-names: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: marvell,armada-8k-nand-controller
> +    then:
> +      required:
> +        - marvell,system-controller
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2

This does not make sense now...

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
