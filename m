Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EF6C7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 12:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PFow3FQ/ryokDP1En01I6FqjVCTGNhJroIMIp87Klg=; b=kBMkjH4HRCzpfR
	9ADthaUHAqr0rkJXEzbUrHdOMo7eq+t7ROSqqSK22x34hQceYEnF+Y/PH54CNqcAkLN/9sZDSZ2Pi
	LXgf7XnkYG9MTdxQm6V2Ba9XH7SqsocsH6MLztHoRZynf0/WshH4gvSeXztpvkPriT1YeKsENui8F
	FocNnH+a8NPCcHHiu7QLn5GUj6Q3W6iZHiWzfh7ui0dWb32CBMCGnTUqbKBo7uQphaqRFxp0eEd1w
	P771+QrpbT54mgAyXE87q5sBUXuTEKkn1vmFdg7h/t082KCSxY5Y8f6tX2rMOJP/Xlf3M44q2gMZB
	xEc4EeXbU3zHfpucF68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3yOs-00DpoI-2S;
	Tue, 30 May 2023 12:24:30 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3yOq-00Dpmy-1R
	for linux-mtd@lists.infradead.org;
	Tue, 30 May 2023 12:24:30 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f4f3ac389eso3423870e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 30 May 2023 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685449465; x=1688041465;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZmqQHgK2oKvKJ3i0nTHh0YlYTqhPDZR13cQC7G3a/Wc=;
        b=neDF1O85irLnlpQlEk3xwFJ6/dRh2Lk/naodpd1tWmi8+Rkux1bpS1OaHOxIRJ8dZK
         5Lx7nMR2heXiZNF8u45DgA+VwhsypvXUpEHzoP1In724lhQz1XL6dHSjSpa8QzAjH8TN
         DVng16gq6g8jAz2tAolpRfCgyywARcF33pax4pwo57JWvQNz9MPoTo9ElP9xyT1ZPJ0Q
         5EZovNDF55vrJhdryAWhLGtGLUJzILX0qF5TwqkQiELhE3da1hEUx/LqTTA1XSFt6Gpl
         zLd80C5RwHaDzgFdagi9FRjdn55HkWelgtLnTu1ZGeqkZ2KHpbPJXIlv8LZRzuxoOjt9
         7DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449465; x=1688041465;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmqQHgK2oKvKJ3i0nTHh0YlYTqhPDZR13cQC7G3a/Wc=;
        b=Pj/3Ge2D+wxlDDMfO/vnhKMS84Szk/Ra0SCm7Hbg+lHEKwT/+nqZ5vxeX5/I1PD3f1
         5p50Fb5sxuyFqGF9WvoM3n9sVe7ukV+ncidDYseFSqWBinIMD/lw8rRfS+hh4nDThL5x
         6ItGP36E4ckId6V6jjLOrrnFUs4NsQ8MZfNfQfSMyfsNU/5MxzcTKIBj31ky6qVd1JLR
         w7OQ1NZJK/rWM4uKoZSn78DpwEhPdkertH2Og7nyANYXZrmzE3buorqSV06RZiuufMLg
         jfl8E+Wgbew2FDU8Zysppp/bCjkJdvv9toKCZEF9hbuiVx+RYciOQHsdyRg4t5z/vcn7
         basg==
X-Gm-Message-State: AC+VfDwpkHNxKDs2JaQxSSAUEOg+UI6kEEPMUsYu7q4Xhio/ZrDXHy2t
	VizRTYvoH9mhyUSTtgSV9lUgOQ==
X-Google-Smtp-Source: ACHHUZ5UukllPljPGioGEYuGWV3HvwCEG8DF0RQC5VFx0310+KYgEGpJmmLACvniUVfkFDx3rdK4xQ==
X-Received: by 2002:ac2:59dc:0:b0:4f1:4040:8143 with SMTP id x28-20020ac259dc000000b004f140408143mr729871lfn.60.1685449465306;
        Tue, 30 May 2023 05:24:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id w5-20020aa7da45000000b005148e981bd3sm4101904eds.12.2023.05.30.05.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 05:24:24 -0700 (PDT)
Message-ID: <a1b2caed-b314-59db-ee00-92fc983150f6@linaro.org>
Date: Tue, 30 May 2023 14:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, vadym.kochan@plvision.eu
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 enachman@marvell.com
References: <20230530005337.3687938-1-chris.packham@alliedtelesis.co.nz>
 <20230530005337.3687938-2-chris.packham@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230530005337.3687938-2-chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_052428_485282_F327D681 
X-CRM114-Status: GOOD (  33.88  )
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

On 30/05/2023 02:53, Chris Packham wrote:
> From: Vadym Kochan <vadym.kochan@plvision.eu>
> 
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> Dropped deprecated compatibles and properties described in txt file.
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v6:
>     - remove properties covered by nand-controller.yaml
>     - add example using armada-8k compatible
>     
>     earlier changes:
>     
>     v5:
>        1) Get back "label" and "partitions" properties but without

Where are they? Did you drop them in v6?


>           ref to the "partition.yaml" which was wrongly used.


>     
>        2) Add "additionalProperties: false" for nand@ because all possible
>           properties are described.

Where? This cannot be silently dropped!

>     
>     v4:
>        1) Remove "label" and "partitions" properties
>     
>        2) Use 2 clocks for A7K/8K platform which is a requirement
>     
>     v3:
>       1) Remove txt version from the MAINTAINERS list
>     
>       2) Use enum for some of compatible strings
>     
>       3) Drop:
>             #address-cells
>             #size-cells:
>     
>          as they are inherited from the nand-controller.yaml
>     
>       4) Add restriction to use 2 clocks for A8K SoC
>     
>       5) Dropped description for clock-names and extend it with
>          minItems: 1
>     
>       6) Drop description for "dmas"
>     
>       7) Use "unevalautedProperties: false"
>     
>       8) Drop quites from yaml refs.
>     
>       9) Use 4-space indentation for the example section
>     
>     v2:
>       1) Fixed warning by yamllint with incorrect indentation for compatible list
> 
>  .../bindings/mtd/marvell,nand-controller.yaml | 190 ++++++++++++++++++
>  .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ------------
>  MAINTAINERS                                   |   1 -
>  3 files changed, 190 insertions(+), 127 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> new file mode 100644
> index 000000000000..c4b003f5fa9f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> @@ -0,0 +1,190 @@
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

Is it correct person for Marvell NAND? This should be not a subsystem
maintainer, but a device maintainer.

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

You miss here deprecated compatibles, which are BTW still used. Don't
drop properties and compatibles during conversion.

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

Missing minItems: 1

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

Missing unevaluatedProperties: false on this level.

> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +
> +      nand-rb:
> +        minimum: 0
> +        maximum: 1

It's an array, so this does not sound right. You might want to put it
under items:.  Then you also miss min/maxItems.

> +
> +      nand-ecc-step-size:
> +        const: 512
> +
> +      nand-ecc-strength:
> +        enum: [1, 4, 8]
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
> +    required:
> +      - reg
> +      - nand-rb
> +
> +allOf:
> +  - $ref: nand-controller.yaml
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
> +          maxItems: 2

Drop maxItems. You don't have it in clock-names.

> +
> +        clock-names:
> +          minItems: 2
> +
> +      required:
> +        - marvell,system-controller
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +        clock-names:
> +          maxItems: 1

I doubt that you tested it in above variant...

> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    nand_controller: nand-controller@d0000 {
> +        compatible = "marvell,armada370-nand-controller";
> +        reg = <0xd0000 0x54>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
