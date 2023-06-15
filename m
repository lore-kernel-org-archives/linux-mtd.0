Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B206EB64D9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 07:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y3wJCQz7UZ63TVXpOmInQ/e+k5AyKWyw1NlFSDgEfxk=; b=Jq8Qcv9WkEKxjP
	OuQ2JdN+Qgf4rceNhHpNAOjJpzro3EjN2+OaUTbiFK9zmzn/9eSm/vXC3Faih7rFDRW9dv/I3IVTD
	kurn+XBgWwA6CUvU6eHa+zOLC3ZxaFPJaqj7ujpi22aR7EXlM+wG48BoOlbdol4YFnxfrVCuyi03y
	DKxVE3igm90IU/vmtW7GMCasaPEh4mRWWKgV1SDZefbGJL+pkiUwz/Ou7VG8ShwiY5ztkmbSr3G3/
	Furw2HIjBfUZK8QJUw47p9VA+PUCZZ46Tvq3qcOuuPdOy05q9R+sPT3SdvEqp5lt+6h82dGqrWg7b
	V6c9OlHPUgMcU+3lMu9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hff-00E3yB-02;
	Thu, 15 Jun 2023 07:45:31 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hfb-00E3wN-0a
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 07:45:28 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-97467e06511so232144266b.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 Jun 2023 00:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686815122; x=1689407122;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GShQN3aNeb/7szyOAsiAwnXDqLh1QR1gf41/K50luCM=;
        b=SqSio0bSvHU9qKGsCc/ZYZRiw60stlxeWgphdgk06A11rBVv/rM5MDeiRuYtth2CV3
         m2a01lcAf6P8y0X+eQ9pnNAjL8YtpHW3piO4T9dVixCuWuhO24pRvQIFtB7iJAHKwV7T
         d2gigFLi0nqg/m7CQ8hgquYF6FlsdEn37vButF3jwbnQE7Y2vW+MDmIazSdSKft1/kh6
         nS5j/9YiimTsBX3hfgyy9rD0K8aJEjg6+BAzqqZpUo3KAaUMjaPPnrluLuhDgf/IoJaq
         DKY/fjwdv4lwvDdyRpCyUzlDys3OtUb/vRpuFfOLy7VxxZ07V95BOTsprxts/RQcE1lD
         rsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686815122; x=1689407122;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GShQN3aNeb/7szyOAsiAwnXDqLh1QR1gf41/K50luCM=;
        b=A0ib7MhdUqFTfwSRdLOgE6dPZhRj2A/AxX56ktK8QaxB+S3ir+Os6wRv7ZL+x6ta6V
         pgj9ximTBauZzGVHv6DL2DDMt9G6zFxUyEuUZ9ivm9XE1pWH6GyPjxUeRZ33bMUnmk6C
         yO/Yh2/QZImBds/X2adVcrPor3Ow64ZEYKqmNr5nB3EqdiDbD6aB31Lj0dQdSlmsRyaB
         NCHn8M2JIdc7EF84alt+NxMEfrAS7+KFmHkQV8QAGqv4KmSJuvLgD2F2VRocCZxacwaT
         RI6y7CvO+6ACrZh8Eu9km4Q4PcGuvGydgnp7j83Ah7pnvVpK7/io6FWtnWJ86JKCUzNb
         7uUg==
X-Gm-Message-State: AC+VfDx6A1dHp0JcYGvzvM3oDePA5UJ2/Lfl2xGDZq5GPmvJBHzZVrPa
	y57lgvc4sYj5+5G/NN2yyykx5g==
X-Google-Smtp-Source: ACHHUZ4pJSvwAenolK+mWB2JCajqR5hFQLSmeiE6Bf/3XMsDiYfnIdxnsdy4W2q12qVAnyu1p3SRDw==
X-Received: by 2002:a17:906:7308:b0:968:1e8:a754 with SMTP id di8-20020a170906730800b0096801e8a754mr18444931ejc.72.1686815122438;
        Thu, 15 Jun 2023 00:45:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bi9-20020a170906a24900b009745417ca38sm8967577ejb.21.2023.06.15.00.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 00:45:22 -0700 (PDT)
Message-ID: <f16e742f-e6f2-9761-e70d-e0e7cadcba4a@linaro.org>
Date: Thu, 15 Jun 2023 09:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v9 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, andrew@lunn.ch,
 gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Vadym Kochan <vadym.kochan@plvision.eu>
References: <20230615040447.3484564-1-chris.packham@alliedtelesis.co.nz>
 <20230615040447.3484564-4-chris.packham@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230615040447.3484564-4-chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_004527_265095_3B548C19 
X-CRM114-Status: GOOD (  25.97  )
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

On 15/06/2023 06:04, Chris Packham wrote:
> From: Vadym Kochan <vadym.kochan@plvision.eu>
> 
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> The text binding didn't mention it as a requirement but existing usage
> has
> 
>    compatible = "marvell,armada-8k-nand-controller",
>                 "marvell,armada370-nand-controller";
> 
> so the YAML allows this in addition to the individual compatible values.
> 
> There was also an incorrect reference to dma-names being "rxtx" where
> the driver and existing device trees actually use dma-names = "data" so
> this is corrected in the conversion.
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v9:
>     - depend on series from Miquel
>       https://lore.kernel.org/linux-mtd/20230606175246.190465-1-miquel.raynal@bootlin.com/
>     - enforce minimum/maximum for nand-rb
>     - move required: block for controller
>     - move unevaluatedProperties: for nand chip
>     - remove label, partitions and nand-on-flash-bbt which are covered by
>       generic schema
>     
>     Changes in v8:
>     - Mark deprecated compatible values as such
>     - Allow "marvell,armada-8k-nand-controller" without
>       "marvell,armada370-nand-controller"

???


> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: marvell,armada-8k-nand-controller
> +          - const: marvell,armada370-nand-controller
> +      - enum:
> +          - marvell,armada-8k-nand-controller

This is wrong. 8k cannot be both: compatible and not compatible with
370. It's not someone's cat to be in both states at the same time...

> +          - marvell,armada370-nand-controller
> +          - marvell,pxa3xx-nand-controller
> +      - description: legacy bindings
> +        deprecated: true
> +        enum:
> +          - marvell,armada-8k-nand
> +          - marvell,armada370-nand
> +          - marvell,pxa3xx-nand
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      Shall reference the NAND controller clocks, the second one is
> +      is only needed for the Armada 7K/8K SoCs
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: core
> +      - const: reg
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: data
> +
> +  marvell,system-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Syscon node that handles NAND controller related registers
> +
> +patternProperties:
> +  "^nand@[a-f0-9]$":
> +    type: object
> +    $ref: raw-nand-chip.yaml
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +
> +      nand-rb:
> +        items:
> +          - minimum: 0
> +            maximum: 1
> +
> +      nand-ecc-step-size:
> +        const: 512
> +
> +      nand-ecc-strength:
> +        enum: [1, 4, 8, 12, 16]
> +
> +      nand-ecc-mode:
> +        const: hw
> +
> +      marvell,nand-keep-config:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: |

Do not need '|' unless you need to preserve formatting.

> +          Orders the driver not to take the timings from the core and
> +          leaving them completely untouched. Bootloader timings will then
> +          be used.
> +
> +      marvell,nand-enable-arbiter:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: |

Do not need '|' unless you need to preserve formatting.

> +          To enable the arbiter, all boards blindly used it,
> +          this bit was set by the bootloader for many boards and even if
> +          it is marked reserved in several datasheets, it might be needed to set
> +          it (otherwise it is harmless).
> +        deprecated: true
> +
> +    required:
> +      - reg
> +      - nand-rb
> +
> +    unevaluatedProperties: false
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
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: marvell,armada-8k-nand-controller
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +
> +        clock-names:
> +          minItems: 2
> +
> +      required:
> +        - marvell,system-controller

else:
narrow clocks to 1? Or is the second clod also valid for other variants?
Does not look like from your example.


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
