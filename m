Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F982C54EAA
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 19:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Esy2zVK/864Cn0KNsUzyKZ6UK0uuAZsh2NiS5uU+EwE=; b=MZ0mUqYEHuzoSH
	5cp86rUH3d8Q1zMwkMlx6ZLksR3rCeC+lDPQO8SLbfJ9IilGLrKJuhJrXD/HKO+mtrwUdaEOiYVyh
	ao8/sud4Io/LGvUdbaZV9WBg5t9jamIciDhPPHBDdEhSRr7Mx/+Ig4GapEyp/m7AYDfrmufumYw/g
	9O4/cokOwm7C8gNmcxN2PSHanmGlYM9WAzf4MnLeHySkS3MoGZpfCEWy0rkoBlOckHLBtYLugpakY
	mB/xtp49T6HtlvvWEIgcdUmfbYGFhH/rHZHr2ScPFnX0oVLpHttxkF4L/QnHw6ODolyf4xVIN/r+O
	fL6D0XlkNBN/c+K5EI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMZZt-005ALj-IF; Mon, 30 Jan 2023 19:12:29 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMZZi-005AI2-QA; Mon, 30 Jan 2023 19:12:20 +0000
Received: by mail-ot1-f53.google.com with SMTP id 70-20020a9d084c000000b0068bccf754f1so1322345oty.7;
        Mon, 30 Jan 2023 11:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZ2Q+GiXTf/jZDy+yWnBz+4LrVIM/HYVwYyT24sePUU=;
        b=LN3Ci4j9YgCfc0S9LShKJXELSbwmIf3EFkn87hL5n/HDaTLTZiHO/T03gfk3oygSby
         RSVnDd+poKppMh88VmT+rDUkUPzxr7quhLrEruMCGQr4nSmH+3d4EpbAkTLafvvqBMIW
         Gc3XF1Y8Zf4+XFlMwNIVLcSO+FPP172ji1hKxJp2lS/Zep0AgVxSQBRnKNSOte4nqYYX
         RISjsgYVoohUHxaiKFiCBo/b7chqf6gVej/k7ioY9kGl9awP5BYp+CmlDVWO3yzWkDkF
         fxCxLaJwVOorPFWaKn0T43YV1IwPw5oLXs0bVc/DAi6wkF+G8kmgoWFHwlhutPOoOTgr
         eeIA==
X-Gm-Message-State: AO0yUKUWBr2G0Z4Hehue+cDVffuB8clT3dOx+b1IK4mxjLzovMddrhBX
	NaXB66PRfd85wZVxecYlrw==
X-Google-Smtp-Source: AK7set/q/dB5JJ/S45vienphYuLJxho1PabdZkZ68lbop1g9F9Q7uUGEg6YNlXC0i+odnzx6VJM4AQ==
X-Received: by 2002:a05:6830:440b:b0:68b:dd36:ab17 with SMTP id q11-20020a056830440b00b0068bdd36ab17mr1043458otv.3.1675105936532;
        Mon, 30 Jan 2023 11:12:16 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 44-20020a9d02af000000b00684152e9ff2sm5724188otl.0.2023.01.30.11.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 11:12:16 -0800 (PST)
Received: (nullmailer pid 3186164 invoked by uid 1000);
	Mon, 30 Jan 2023 19:12:15 -0000
Date: Mon, 30 Jan 2023 13:12:15 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, Lubomir Rintel <lkundrak@v3.sk>, - <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: intel,ixp4xx-expansion-bus: split
 out peripheral properties
Message-ID: <20230130191215.GA3125737-robh@kernel.org>
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
 <20230127093217.60818-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127093217.60818-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_111218_879718_9D7D1314 
X-CRM114-Status: GOOD (  23.96  )
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

On Fri, Jan 27, 2023 at 10:32:15AM +0100, Krzysztof Kozlowski wrote:
> The properties of devices in IXP4xx expansion bus need to be also
> applied to actual devices' bindings.  Prepare for this by splitting them
> to separate intel,ixp4xx-expansion-peripheral-props binding, just like
> other memory-controller peripheral properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  ...intel,ixp4xx-expansion-bus-controller.yaml | 64 +--------------
>  ...tel,ixp4xx-expansion-peripheral-props.yaml | 80 +++++++++++++++++++

Kind of odd to have these in 2 directories. Can we move 
intel,ixp4xx-expansion-bus-controller.yaml to 
bindings/memory-controllers/?

Or maybe all the external/parallel bus interfaces need their own 
directory?

>  .../mc-peripheral-props.yaml                  |  1 +
>  3 files changed, 82 insertions(+), 63 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml b/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
> index 5fb4e7bfa4da..a771796ec499 100644
> --- a/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
> +++ b/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
> @@ -56,69 +56,7 @@ patternProperties:
>      description: Devices attached to chip selects are represented as
>        subnodes.
>      type: object
> -
> -    properties:
> -      intel,ixp4xx-eb-t1:
> -        description: Address timing, extend address phase with n cycles.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        maximum: 3
> -
> -      intel,ixp4xx-eb-t2:
> -        description: Setup chip select timing, extend setup phase with n cycles.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        maximum: 3
> -
> -      intel,ixp4xx-eb-t3:
> -        description: Strobe timing, extend strobe phase with n cycles.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        maximum: 15
> -
> -      intel,ixp4xx-eb-t4:
> -        description: Hold timing, extend hold phase with n cycles.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        maximum: 3
> -
> -      intel,ixp4xx-eb-t5:
> -        description: Recovery timing, extend recovery phase with n cycles.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        maximum: 15
> -
> -      intel,ixp4xx-eb-cycle-type:
> -        description: The type of cycles to use on the expansion bus for this
> -          chip select. 0 = Intel cycles, 1 = Motorola cycles, 2 = HPI cycles.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        enum: [0, 1, 2]
> -
> -      intel,ixp4xx-eb-byte-access-on-halfword:
> -        description: Allow byte read access on half word devices.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        enum: [0, 1]
> -
> -      intel,ixp4xx-eb-hpi-hrdy-pol-high:
> -        description: Set HPI HRDY polarity to active high when using HPI.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        enum: [0, 1]
> -
> -      intel,ixp4xx-eb-mux-address-and-data:
> -        description: Multiplex address and data on the data bus.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        enum: [0, 1]
> -
> -      intel,ixp4xx-eb-ahb-split-transfers:
> -        description: Enable AHB split transfers.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        enum: [0, 1]
> -
> -      intel,ixp4xx-eb-write-enable:
> -        description: Enable write cycles.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        enum: [0, 1]
> -
> -      intel,ixp4xx-eb-byte-access:
> -        description: Expansion bus uses only 8 bits. The default is to use
> -          16 bits.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        enum: [0, 1]
> +    $ref: /schemas/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml#
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml
> new file mode 100644
> index 000000000000..8f782c80e88b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Peripheral properties for Intel IXP4xx Expansion Bus
> +
> +description: |

Don't need '|'.

> +  The IXP4xx expansion bus controller handles access to devices on the
> +  memory-mapped expansion bus on the Intel IXP4xx family of system on chips,
> +  including IXP42x, IXP43x, IXP45x and IXP46x.
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +properties:
> +  intel,ixp4xx-eb-t1:
> +    description: Address timing, extend address phase with n cycles.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 3
> +
> +  intel,ixp4xx-eb-t2:
> +    description: Setup chip select timing, extend setup phase with n cycles.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 3
> +
> +  intel,ixp4xx-eb-t3:
> +    description: Strobe timing, extend strobe phase with n cycles.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 15
> +
> +  intel,ixp4xx-eb-t4:
> +    description: Hold timing, extend hold phase with n cycles.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 3
> +
> +  intel,ixp4xx-eb-t5:
> +    description: Recovery timing, extend recovery phase with n cycles.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 15
> +
> +  intel,ixp4xx-eb-cycle-type:
> +    description: The type of cycles to use on the expansion bus for this
> +      chip select. 0 = Intel cycles, 1 = Motorola cycles, 2 = HPI cycles.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2]
> +
> +  intel,ixp4xx-eb-byte-access-on-halfword:
> +    description: Allow byte read access on half word devices.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +
> +  intel,ixp4xx-eb-hpi-hrdy-pol-high:
> +    description: Set HPI HRDY polarity to active high when using HPI.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +
> +  intel,ixp4xx-eb-mux-address-and-data:
> +    description: Multiplex address and data on the data bus.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +
> +  intel,ixp4xx-eb-ahb-split-transfers:
> +    description: Enable AHB split transfers.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +
> +  intel,ixp4xx-eb-write-enable:
> +    description: Enable write cycles.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +
> +  intel,ixp4xx-eb-byte-access:
> +    description: Expansion bus uses only 8 bits. The default is to use
> +      16 bits.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
> index 53ae995462db..5acfcad12bb7 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
> @@ -34,5 +34,6 @@ required:
>  # The controller specific properties go here.
>  allOf:
>    - $ref: st,stm32-fmc2-ebi-props.yaml#
> +  - $ref: intel,ixp4xx-expansion-peripheral-props.yaml#
>  
>  additionalProperties: true
> -- 
> 2.34.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
