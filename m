Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D07ECDFA1
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Oct 2022 16:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OM5JndKbKGTfhPpgqLAoE/O6dq2wHfNOlM9xU0MEDtg=; b=QnVn6KVVwk4g51
	9DAnbUSCdE6Ei7YpDryvjtxbU6Ko1u99bRWz/9fo0IhnG3j60sm5eIPQvjIu48qsM4BaPLpwp52gB
	xfyrc6opXIWwN4dOKUNMr2EeXnRCDwlt20MEQtelGjYQ8ubPAZb1llM0pkl8WviyFFAFiP5jXtHnp
	oVIAGvYNVPXzJ4gftuEyM2DtEWmMtSDF0C7NC5G5YL1DE5EXpFqVHPKHumcIrDjx4OYHjOij0amir
	/f7LeJ4O6sFfyT2xSTejUmQSJwTR6b23VE7tO0pYU6Uv+s4SI5bLDB4IAf3NP/brrvJij5uZYHzoN
	xTT2fNRIswbPwDcGXIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omHDB-00DDBb-4a; Sat, 22 Oct 2022 16:19:01 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omHD7-00DDAP-Si
	for linux-mtd@lists.infradead.org; Sat, 22 Oct 2022 16:18:59 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-131dda37dddso7293170fac.0
        for <linux-mtd@lists.infradead.org>; Sat, 22 Oct 2022 09:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=br+HnS22isyDTm0T0WKGrqcorfoSfii9AXXj0ko/jkg=;
        b=GnRU0N9fVf/mVBhAHbuyEOC9wrQXeKfjaaUP1h6IBql8j3JnQHljnf3W9QeKGRXEGX
         iRMbsdsEp5DAFJpsdvVKayYxlT2jICNcluDcr1k05EoFzayaIcmQ8efe+Le0mWqxzDbF
         0pm3g3n55Q5V/4RBcXb7L9pCSGeONWOuIlY0+Dq73CUKFCbkLde5t2Iq4zBQXE+JNrue
         IBZjvA5W3twyqCQ7XNS3MzqBL5aU/zXX+vMtGjuwDpnF+V3hqgIcPb9YocxQ4QNFzvsY
         rn4O+DqilHeDAmZwCzwEtPtGuDZq+tBw/KeJmE2SBWUXhjzlZf9VraIizGYlvAqJBnxo
         Gijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=br+HnS22isyDTm0T0WKGrqcorfoSfii9AXXj0ko/jkg=;
        b=WgZS9NgmSVTVWCY7gIMuXPeSw8W+gacR0drYv0rjfuEjH/PBSUvSzOzDzJhC3ZYdb0
         kh/sDAg+cmH0lWFYwfPU+qs94vUz24pLw6AZw7k6YGcCX69HIEaaFo2cYacui174g6Gf
         RY/dykaow8uQbtyBAhxoiXh7ezQDxgYLmzXDhF6djlQ8r90N94+El6N8jdqnspIhQeB5
         VVuIMkHOr/hHq8rviIkPaYOcUaXYsYqMLjbyAQ2F7ZbeUewtHahRS9hMn7gf+etT2vDx
         28PLtIoLfBKSi6/t4s8BgxQR7N5ZeZfcrzFOFRBSYOJwzI4JkCg6OpQppt3Y3PJQvlSs
         rBMg==
X-Gm-Message-State: ACrzQf3TmpIsToRpsMppEzyrytdh93wf1U+bCwiK/yu6USmD1f3aLveC
	rbghScWnVXrpRQ+877Sxp7ynXQ==
X-Google-Smtp-Source: AMsMyM5LBTbSQmhRB3iN1nczIfrXMxrWAUYJE4+PUysGP/rfOMrysmsCkNiSRND3aYiduPG3kahmMA==
X-Received: by 2002:a05:6870:d107:b0:137:11e5:6a95 with SMTP id e7-20020a056870d10700b0013711e56a95mr16305190oac.146.1666455535738;
        Sat, 22 Oct 2022 09:18:55 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
        by smtp.gmail.com with ESMTPSA id d6-20020aca3606000000b0034d14c6ce3dsm2293236oia.16.2022.10.22.09.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 09:18:54 -0700 (PDT)
Message-ID: <a46c6a18-903d-2120-4876-509ce8ad19d5@linaro.org>
Date: Sat, 22 Oct 2022 12:18:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
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
Cc: Elad Nachman <enachman@marvell.com>
References: <20221021194552.683-1-vadym.kochan@plvision.eu>
 <20221021194552.683-2-vadym.kochan@plvision.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021194552.683-2-vadym.kochan@plvision.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_091857_998844_8C4B6B0E 
X-CRM114-Status: GOOD (  31.46  )
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

On 21/10/2022 15:45, Vadym Kochan wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> Dropped deprecated compatibles and properties described in txt file.
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> ---
>  .../bindings/mtd/marvell,nand-controller.yaml | 199 ++++++++++++++++++
>  .../devicetree/bindings/mtd/marvell-nand.txt  | 126 -----------
>  2 files changed, 199 insertions(+), 126 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> new file mode 100644
> index 000000000000..535b7f8903c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> @@ -0,0 +1,199 @@
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

This should be someone responsible for hardware, not subsystem
maintainer. Unless by coincidence Miquel matches both. :)

> +
> +properties:
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +        - const: marvell,armada-8k-nand-controller
> +        - const: marvell,armada370-nand-controller

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +      - const: marvell,armada370-nand-controller
> +      - const: marvell,pxa3xx-nand-controller

These two are just enum.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1

Drop, comes with nand-controller.yaml

> +
> +  "#size-cells":
> +    const: 0

Ditto

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +    description: |

No need for |

> +     Shall reference the NAND controller clocks, the second one is
> +     is only needed for the Armada 7K/8K SoCs

You need allOf:if:then restricting it further per variant.

> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: reg
> +    description: |
> +      Mandatory if there is a second clock, in this case there
> +      should be one clock named "core" and another one named "reg"

The message is confusing. What is mandatory if there is a second clock?
Plus, the binding requires two clocks.

Drop entire description.

minItems: 1


> +
> +  dmas:
> +    maxItems: 1
> +    description: rxtx DMA channel

Drop description.

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
> +

Drop blank line.

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
> +        const: 512

Why this is const?

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
> +        $ref: "/schemas/mtd/partitions/partition.yaml"

Drop quotes

        unevalautedProperties: false

and then you will see errors, because you referenced schema for one
partition.


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
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"

Drop these two - required by nand-controller.

> +  - interrupts
> +  - clocks
> +
> +allOf:
> +  - $ref: "nand-controller.yaml#"

Drop quotes.

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
> +    else:
> +      properties:
> +        marvell,system-controller: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    nand_controller: nand-controller@d0000 {
> +            compatible = "marvell,armada370-nand-controller";
> +            reg = <0xd0000 0x54>;

Use 4 spaces for example indentation.

> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&coredivclk 0>;
> +

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
