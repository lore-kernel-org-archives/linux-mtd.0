Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089AEC67871
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Oct 2022 21:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=of+dVenJhIUEBvo/tolfsLFnMXMg7DDFmhA30wyPwQA=; b=y8j9me5oKJbMbr
	hWbqsSLGPk6R7P8S5tb1Wju2uH0aHeOvPz7kkeoNCpppAeyLtygmMvW4rN4xVm6wAlc02RyWG0C+d
	sy1PAn4UQ91KIQDHB0ow2iLc9YuN8EmTcpW3KdSzIK0k+t3XW0z8ztLy8AoRS560sic0lL8pCXPBp
	SMUaE/LJBf9Uxl0VmXSgPquRdIcsUO+jI+3GQWeaHioh8eIh7IVStfHjknmIUTVLCpE4fGDe2GnaR
	GeyB2JnXfKJxFL3uNv2oXVhKktzRsn1/upN+sFq7IbuWj4hDyv5yOyqXVJ4+XNcCFw824q60XV663
	7bSlbmSUsW/GZUQ/Pxrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on53E-0034qg-O9; Mon, 24 Oct 2022 21:32:04 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on53A-0034pj-Rh
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2022 21:32:02 +0000
Received: by mail-qk1-x732.google.com with SMTP id o2so6899658qkk.10
        for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2022 14:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqdAlNyWzpxEkU/MFO8G8dv0LNUlhwviuS7EnguHLSg=;
        b=DV83/4RnyXOVWlrN68XexIY4HJUJsx1VFHmnrSIXpzkwAoNgxFZc/9r9OfOw9BB2py
         2CjVIxNBrWWH3qPaszABQ+IlPxg2PKtfcBeZ0uQqnyckndHV8F9NmiGchqb/h3VVTVW7
         8USKDCjsbwz5Oyk4XYlSnDiLwQmtRdAzEumeDCkjbMg2fOph5tHQAkBAaTSlUU7z5Hm0
         iuRGFveOXHssNeg332k32nsiGGCjCurvBqqM3LYWy86iy/VXHghi2xsJVSpAXNKHC3Qt
         8hQ11yI6Q8OW6D25RxIs/svV6XxQQSOLuDO+AC9zeEIgVYkNK64iyGsI4O9UMyvObGkb
         KCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqdAlNyWzpxEkU/MFO8G8dv0LNUlhwviuS7EnguHLSg=;
        b=0ORqq5Q0GIa8TQEmYpIxhAgBUR3UTEOyXPfw+RNNZBhWOaHrD6R2oxOhar2S2bGkCo
         VQJcAsmelr+X7TdB9HeFjm7lWzz4tTnx6tyZ/7lHAyEPNPNwAGJ5SIhAjH2idL/svGN+
         EkhWHZMRSNnRp0I14pHVhsGIPO3fq0YlsWHcDI4m4YUq2jtxLenJpcP2ht9d/XZefyxA
         wq9iVKTAYunvQ4h+W/4CwJ3Up87+6aqisnLztMNC0mE0nzXIs66/Pi2zkWIJ8pSnHoGY
         YWxRALVMFsmzH6GZyXtc0LKsXF4t4C6MU6Ib+8M00zPuONePKY1OBYjr9AigFSY729u2
         HXgA==
X-Gm-Message-State: ACrzQf05ajmcKhX2THJkSlr/o7GYTUxtb/tvK1xNPxUcCuHa7HBKJEs0
	YLV3GmtAh4c0L3NvS0JVP7KaIQ==
X-Google-Smtp-Source: AMsMyM5wlxnsR49L7btHoocprCyOk/ulL2WAi00lcwgUckP7xMzBPmdYJSTAFZizSbGUi/0SFuvUtg==
X-Received: by 2002:a05:620a:19a0:b0:6f6:cb1d:a5e1 with SMTP id bm32-20020a05620a19a000b006f6cb1da5e1mr2163722qkb.382.1666647111074;
        Mon, 24 Oct 2022 14:31:51 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id c6-20020ae9e206000000b006bb29d932e1sm649360qkc.105.2022.10.24.14.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 14:31:50 -0700 (PDT)
Message-ID: <ae7c86fd-5bc9-4cdb-857c-e686225f5966@linaro.org>
Date: Mon, 24 Oct 2022 17:31:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
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
References: <20221024210153.28852-1-vadym.kochan@plvision.eu>
 <20221024210153.28852-2-vadym.kochan@plvision.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024210153.28852-2-vadym.kochan@plvision.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_143200_912983_1E03D165 
X-CRM114-Status: GOOD (  34.50  )
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

On 24/10/2022 17:01, Vadym Kochan wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> Dropped deprecated compatibles and properties described in txt file.
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> ---
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

Hmm... In one place it makes sense. In "nand@" not really.

> 
>   8) Drop quites from yaml refs.
> 
>   9) Use 4-space indentation for the example section
> 
> v2:
>   1) Fixed warning by yamllint with incorrect indentation for compatible list
> 
>  .../bindings/mtd/marvell,nand-controller.yaml | 189 ++++++++++++++++++
>  .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ------------
>  MAINTAINERS                                   |   1 -
>  3 files changed, 189 insertions(+), 127 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> new file mode 100644
> index 000000000000..cb20f14d4aea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> @@ -0,0 +1,189 @@
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
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      Shall reference the NAND controller clocks, the second one is
> +      is only needed for the Armada 7K/8K SoCs
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
> +        $ref: /schemas/mtd/partitions/partition.yaml

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

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
> +    unevaluatedProperties: false

This looks wrong. I do not see referencing schema here and I did not ask
to change it.

> +
> +    required:
> +      - reg
> +      - nand-rb
> +
> +unevaluatedProperties: false

This one is ok.

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

Also for clock-names "minItems: 2"

> +    else:
> +      properties:
> +        marvell,system-controller: false

    clocks:
      maxItems: 1

and the same for clock-names... unless these variants also have two clocks?


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
