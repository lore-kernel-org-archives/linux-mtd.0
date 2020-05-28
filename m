Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9029AC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 21:42:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 610412072D
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 21:42:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A+1Yu0Bc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 610412072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6gN7MqQq/6iXD+D0xREPQhFEN/z/CXgyLbffLfSmrus=; b=A+1Yu0BcqVT30x
	+lnDN19niKAMuwdKGJkYPy5VfX9/OKcFO3dyzTTLjBzsHXWEx4SjROKScHP4TsMekzwPkN5L+S9fT
	MI2oo1khZS7eIAYyPEixnoMT5NR8aBf4G1wuiQkL40lg0yvRC6L8Cyy3QBpAhgHHFRbDls3FQQXyz
	Z6kZFBOwWMCEXqgRi244JN570C2qwVcv8CY36DX4+lKCTdpS/xOr3Z7OtmsD3dOCjoMqLyQKaOUEz
	s7tMXhMIXp3gX15O8jU68rhtkD0/Yx6gwEsqfVYcQxPJtzj+UMqNupzU5gO9/uexUo2d/EMpcjGEa
	4U+DbYee4unkVcy9ippw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeQIb-00043c-Aa; Thu, 28 May 2020 21:42:49 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeQIX-00042m-WE
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 21:42:47 +0000
Received: by mail-il1-f194.google.com with SMTP id h3so414347ilh.13
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2020 14:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kKfMEdEPf1qQORIeLe3Cv29R1EeXGe6brVInGMzh/i8=;
 b=DXWBNnkFECgN+T4qrCmKyEH2wFiFW2mrZ0XxI9XnMW2+KD6Ru8UEQX09sAKug9i6zH
 icXn7BFpouO+gNk2+v4OogkfoJxjro6HPo4ssOVqN4Jf9x80wL7vPTHTSrq40Cbn2rMi
 bzbj6dK8RP423uuLjRTT9DvJML/qK6E2tai99+p7LqELeSgALmB4SEDv0F6TbIj9zH9b
 AUlpe+kSc9a8yZ5wPbchbUy79clT7Q8RjwM/wSqcnF/aAJGTJ7fMNyEGFykRuNMarXE3
 wLp/IPOGvLIjujB97vrwHZsFcpiGJFJwDYf06b39z4MHlA01u/hiZaqGsbHLcIhMl1Rf
 ueKQ==
X-Gm-Message-State: AOAM531H4XbgWf/V6fTNxt19KTMoIDFpfWp7kQUu4rh++7W3shCL8jke
 wcmZEiOMH9BW5ZkE9qRSnA==
X-Google-Smtp-Source: ABdhPJwzMqJMjsR6qnJhFZThxIFACTIgnQWqf3/oGxPMvS4qxVMWPovqxkHZ6ABDo7bKbNCpywwDYQ==
X-Received: by 2002:a05:6e02:11a5:: with SMTP id
 5mr4857068ilj.108.1590702165155; 
 Thu, 28 May 2020 14:42:45 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id h10sm3115504ioe.3.2020.05.28.14.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 14:42:44 -0700 (PDT)
Received: (nullmailer pid 735075 invoked by uid 1000);
 Thu, 28 May 2020 21:42:43 -0000
Date: Thu, 28 May 2020 15:42:43 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Convert ingenic, pinctrl.txt
 to YAML
Message-ID: <20200528214243.GA711753@bogus>
References: <20200520002234.418025-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520002234.418025-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_144246_038231_E93C04AE 
X-CRM114-Status: GOOD (  20.60  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, od@zcrc.me,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 20, 2020 at 02:22:32AM +0200, Paul Cercueil wrote:
> Convert the ingenic,pinctrl.txt doc file to ingenic,pinctrl.yaml.
> 
> In the process, some compatible strings now require a fallback, as the
> corresponding SoCs are pin-compatible with their fallback variant.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: - Use 'pinctrl' instead of 'pin-controller' as the node name
>         - remove 'additionalProperties: false' since we will have pin conf nodes

You need to describe those nodes and not just allow anything.

> 
>  .../bindings/pinctrl/ingenic,pinctrl.txt      |  81 -----------
>  .../bindings/pinctrl/ingenic,pinctrl.yaml     | 136 ++++++++++++++++++
>  2 files changed, 136 insertions(+), 81 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml


> diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> new file mode 100644
> index 000000000000..5be2b1e95b36
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic SoCs pin controller devicetree bindings
> +
> +description: >
> +  Please refer to pinctrl-bindings.txt in this directory for details of the
> +  common pinctrl bindings used by client devices, including the meaning of the
> +  phrase "pin configuration node".
> +
> +  For the Ingenic SoCs, pin control is tightly bound with GPIO ports. All pins
> +  may be used as GPIOs, multiplexed device functions are configured within the
> +  GPIO port configuration registers and it is typical to refer to pins using the
> +  naming scheme "PxN" where x is a character identifying the GPIO port with
> +  which the pin is associated and N is an integer from 0 to 31 identifying the
> +  pin within that GPIO port. For example PA0 is the first pin in GPIO port A,
> +  and PB31 is the last pin in GPIO port B. The JZ4740, the X1000 and the X1830
> +  contains 4 GPIO ports, PA to PD, for a total of 128 pins. The JZ4760, the
> +  JZ4770 and the JZ4780 contains 6 GPIO ports, PA to PF, for a total of 192
> +  pins.
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +properties:
> +  nodename:

It's $nodename as that's not a real property. And that will expose the 
error in the example for you.

> +    pattern: "^pinctrl@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +        - ingenic,jz4740-pinctrl
> +        - ingenic,jz4725b-pinctrl
> +        - ingenic,jz4760-pinctrl
> +        - ingenic,jz4770-pinctrl
> +        - ingenic,jz4780-pinctrl
> +        - ingenic,x1000-pinctrl
> +        - ingenic,x1500-pinctrl
> +        - ingenic,x1830-pinctrl
> +      - items:
> +        - const: ingenic,jz4760b-pinctrl
> +        - const: ingenic,jz4760-pinctrl
> +      - items:
> +        - const: ingenic,x1000e-pinctrl
> +        - const: ingenic,x1000-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^gpio@[0-9]$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - ingenic,jz4740-gpio
> +          - ingenic,jz4725b-gpio
> +          - ingenic,jz4760-gpio
> +          - ingenic,jz4770-gpio
> +          - ingenic,jz4780-gpio
> +          - ingenic,x1000-gpio
> +          - ingenic,x1500-gpio
> +          - ingenic,x1830-gpio
> +
> +      reg:
> +        items:
> +          - description: The GPIO bank number
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges:
> +        maxItems: 1
> +
> +      interrupt-controller: true
> +
> +      "#interrupt-cells":
> +        const: 2
> +        description:
> +          Refer to ../interrupt-controller/interrupts.txt for more details.
> +
> +      interrupts:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - interrupts
> +      - interrupt-controller
> +      - "#interrupt-cells"
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +examples:
> +  - |
> +    pin-controller@10010000 {
> +      compatible = "ingenic,jz4770-pinctrl";
> +      reg = <0x10010000 0x600>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      gpio@0 {
> +        compatible = "ingenic,jz4770-gpio";
> +        reg = <0>;
> +
> +        gpio-controller;
> +        gpio-ranges = <&pinctrl 0 0 32>;
> +        #gpio-cells = <2>;
> +
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +
> +        interrupt-parent = <&intc>;
> +        interrupts = <17>;
> +      };
> +    };
> -- 
> 2.26.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
