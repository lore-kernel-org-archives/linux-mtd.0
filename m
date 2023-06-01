Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC773C7EE23
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 07:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3kOeCCCgABOt7CQCGCv+QGKYviBasJ9QncZHWOHskp4=; b=sk/zSJwrnPlU8L
	hCMNzPpVnF/isNCp1nm408GrycE0PFUkJEhWgzD3uZvXXVK8qetgQ/UzpESAIx5Qf/yuETwMU5FkR
	rqTrq5ZvkHfYY7IuXFOz9vNm0wUZD8pShV+l1hZXhJeN5O7myVooNwx66+EMw7VrGqo9LHNTbNPCC
	5W52CWdmbJ9TtP9PH0yZ9yzYv0op7S58KZtFwhPV1yS7N4Xb09ze3xTE6GdHXhrG/XBurwZArDA77
	OYzevGW4UYSOGRfpgIYPFc2ivQhLEBjHtcjM+IVDhpRnB0pUEOiZJMySc7MUbAUK6pLkEHkIE5Qfy
	Bhz4kTlMgII7SLKfxMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4cNg-002Iq7-2V;
	Thu, 01 Jun 2023 07:05:56 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4cNc-002Iob-2u
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jun 2023 07:05:54 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-96f53c06babso53034566b.3
        for <linux-mtd@lists.infradead.org>; Thu, 01 Jun 2023 00:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685603150; x=1688195150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UdPKQt7YQaevMe9FaRHRErHd01W/8ZdQxg/qvlil77I=;
        b=qtaGX++9GCHkMv1VgHE/tZQElSx0TTN3LmL8o0IZxcGJCInYcIHzqZpkvAggonVCa4
         PjnMONDjQsfripiXcycIs7ObADAtw7dfR7kvy//i6d0GLMg+lF312wQk7UOhvJRdmTaO
         iBOt/g0HeMNWaE1e79rEsvW1SESF4AbNLoqpVzQCEK7S5tU1goK1tAtFQZzN5mxiYMiP
         M1GZApwLuxsLRUCInZFA//S5x5/zsZm/u9/V/9jenaWF7+mAdhi9aSFjnZfRIAX3Xkxp
         ZOCG+TFA8zzNOtqVp5Psfvz4G2+eQ30OURdKdfhOOzTly+mZgj9sSWPT1hH9QNhekRYZ
         Qs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685603150; x=1688195150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UdPKQt7YQaevMe9FaRHRErHd01W/8ZdQxg/qvlil77I=;
        b=eCILLPcu1+FQxad+l0WsSzrfPbSyBlozgHpui5YEw6lBclaLRx0lzqN/Fi8rZfXEGa
         E6c7vSjccCxo+DM91roLLJdigeB2AM0laFx1+q/XkokTQR7l9Gwzp+/Jeg+m04OTte84
         b0q0S9zTMD6E6DcUaTaBaSYJ1XXQTtxvtrlYUkT0AMps8ea+qC0g70h8vcSLqXGFu+q7
         /F0JrjtNf7kCLYQPrXe7uSngrkj/HsSaxX6Hn+DTR2JaURDskoGkjCPFwvFwq9BvtAKX
         XvP1Xvv4UN+idOIezUR/ua5Iy6mdE3+Gt9ykkj9fJL2aiYplPRSsptIhCoRcimyrMfzU
         tI9A==
X-Gm-Message-State: AC+VfDwJ17I+KuU+V+jep5McMI4OnnzwJxFBH9rvH3ME8hgQDQBvvP11
	7PHq3+4vKUnoHuPDHcBjoqDBzQ==
X-Google-Smtp-Source: ACHHUZ7iCqwfChtskRugaSiWPwtUsEfNufe1cDLS6IIi4UAtoXgXwGHYluWVhiAWfiMWS4S9mYmtEQ==
X-Received: by 2002:a17:907:3e12:b0:973:943e:2308 with SMTP id hp18-20020a1709073e1200b00973943e2308mr8349376ejc.76.1685603150290;
        Thu, 01 Jun 2023 00:05:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id c22-20020a170906695600b0094f3b18044bsm10004515ejs.218.2023.06.01.00.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 00:05:49 -0700 (PDT)
Message-ID: <a23dd485-a3d9-e31f-be3e-0ab293fcfc4a@linaro.org>
Date: Thu, 1 Jun 2023 09:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, conor@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 enachman@marvell.com, Vadym Kochan <vadym.kochan@plvision.eu>
References: <20230531234923.2307013-1-chris.packham@alliedtelesis.co.nz>
 <20230531234923.2307013-4-chris.packham@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531234923.2307013-4-chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_000552_946127_75FCD76D 
X-CRM114-Status: GOOD (  35.28  )
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

On 01/06/2023 01:49, Chris Packham wrote:
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
>     Changes in v8:
>     - Mark deprecated compatible values as such
>     - Allow "marvell,armada-8k-nand-controller" without
>       "marvell,armada370-nand-controller"
>     - Make dma-names usage reflect reality
>     - Update commit message
>     
>     Changes in v7:
>     - Restore "label" and "partitions" properties (should be picked up via
>       nand-controller.yaml but aren't)

What do you mean by "aren't"? They are not needed.

>     - Add/restore nand-on-flash-bbt and nand-ecc-mode which aren't covered
>       by nand-controller.yaml.
>     - Use "unevalautedProperties: false"
>     - Corrections for clock-names, dma-names, nand-rb and nand-ecc-strength
>     - Add pxa3xx-nand-controller example
>     
>     Changes in v6:
>     - remove properties covered by nand-controller.yaml
>     - add example using armada-8k compatible
>     
>     earlier changes:
>     
>     v5:
>        1) Get back "label" and "partitions" properties but without
>           ref to the "partition.yaml" which was wrongly used.
>     
>        2) Add "additionalProperties: false" for nand@ because all possible
>           properties are described.
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
>  .../bindings/mtd/marvell,nand-controller.yaml | 223 ++++++++++++++++++
>  .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ----------
>  MAINTAINERS                                   |   1 -
>  3 files changed, 223 insertions(+), 127 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> new file mode 100644
> index 000000000000..433feb430555
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> @@ -0,0 +1,223 @@
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
> +          - marvell,armada-8k-nand-controller
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
> +  "^nand@[0-3]$":
> +    type: object
> +    unevaluatedProperties: false
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +
> +      nand-rb:
> +        minItems: 1

Drop minItems.

> +        maxItems: 1

Didn't you have here minimum and maximum? I think I did not ask to
remove them.

> +
> +      nand-ecc-step-size:
> +        const: 512
> +
> +      nand-ecc-strength:
> +        enum: [1, 4, 8, 12, 16]
> +
> +      nand-on-flash-bbt:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      nand-ecc-mode:
> +        const: hw
> +
> +      label:
> +        $ref: /schemas/types.yaml#/definitions/string

Drop label

> +
> +      partitions:
> +        type: object

Drop partitions.

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
> +          it (otherwise it is harmless).
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        deprecated: true
> +
> +    additionalProperties: false

unevaluatedProperties: false

> +
> +    required:
> +      - reg
> +      - nand-rb
> +

required: block goes here

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
> +
> +        clock-names:
> +          minItems: 2
> +
> +      required:
> +        - marvell,system-controller
> +


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
