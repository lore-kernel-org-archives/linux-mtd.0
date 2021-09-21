Return-Path: <SRS0=R+0z=OL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD854C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 20:45:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 731AF61156
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 20:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 731AF61156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzQCzdo/rymwYnhMFvFZ/jSFjxVVZ5TzHR9hHKrHjLI=; b=crjAZR4g7dUYlI
	ihnmPpGun2dda9WfPgHc4QzdzePDLWc8aFKeTek3/3uqdeAFvIUAC+urBO4yDH8nNS0NfKnKXBGuQ
	PowW16F2e73it3ctejG1W6P5yvRNnsH8YivSlhCTobqujBUIMWdYsTzmHr3PNxQRnaTULI3rQZWV8
	f4wTSfFOekxq4OnaFKXVSjDdzrwUD7jA6AkIeAKbAV6XLDtw1gjniE9z7pOW+kAzaPBIJRFS3bfx0
	Yq0I2lDgJrcrzLQMJCIU6zyR0FG3SWITIDCE4yT3UbL6rTEriDb02AmqI8/YxBgyoW04uOAIhti4j
	O0GGtwtIQ6mbYevp8fBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSmdn-005jq7-5L; Tue, 21 Sep 2021 20:45:23 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSmdk-005joO-3N
 for linux-mtd@lists.infradead.org; Tue, 21 Sep 2021 20:45:21 +0000
Received: by mail-oi1-f180.google.com with SMTP id 6so1018907oiy.8
 for <linux-mtd@lists.infradead.org>; Tue, 21 Sep 2021 13:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zpy6wlQMyxZRii14nKzfROrLUS3Znsn0Gu8ZUDhspq8=;
 b=wun9OJMn3VlUMJ97fZoHlGNRDyd+lrWtKGTGXVP6mkqu+jZJl2B1+5IvtDbZXuLTBE
 7TFZCxQkxuB0oeqBvYQ9Vt8tsi89mxDJ21h7wpwlcrgkcqPXXgorUPKFNF3LeAKwnWuT
 1uSoL2sjKBlobJG75GG+febHyxbIGzgVu1VISKysKQiuIDmApyo3Xx521Fki2uljOb4M
 UYtzLGWnFYcF5tR6zl8TVjZ5WJI9WxJ45HsSdTxE04cxd1q5isBLa71f0EQyskR679e0
 5NPXSWT90zLkU0fGhPcbpeIo9s8oX3oZXuSVyt6KlYDfbLKFvYBz++7s9yTMT1cwyQAz
 zVkg==
X-Gm-Message-State: AOAM530197hAJuZtAPox8zJBgBPBZyHdAF13fjpi35pr5vF2FgzYyO8D
 SV7ythRhQ9s2HdjkUW9VPA==
X-Google-Smtp-Source: ABdhPJyMoya3BEsqcEIje9TIzlBPUkeGKtV/fbfz2dCjpCa1tMJ0e7mFAl7SQ6FLcs/Qdl5gaTf2iQ==
X-Received: by 2002:a05:6808:bcb:: with SMTP id
 o11mr5243912oik.168.1632257117121; 
 Tue, 21 Sep 2021 13:45:17 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com.
 [192.154.179.36])
 by smtp.gmail.com with ESMTPSA id 10sm19774otw.53.2021.09.21.13.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 13:45:16 -0700 (PDT)
Received: (nullmailer pid 3297343 invoked by uid 1000);
 Tue, 21 Sep 2021 20:45:14 -0000
Date: Tue, 21 Sep 2021 15:45:14 -0500
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: tony@atomide.com, grygorii.strashko@ti.com, nm@ti.com, lokeshvutla@ti.com,
 nsekhar@ti.com, krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/8] dt-bindings: mtd: ti, gpmc-onenand: Convert to yaml
Message-ID: <YUpEWslQSEbppnBk@robh.at.kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-7-rogerq@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914122705.15421-7-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_134520_203389_A4554290 
X-CRM114-Status: GOOD (  22.94  )
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

On Tue, Sep 14, 2021 at 03:27:03PM +0300, Roger Quadros wrote:
> Convert gpmc-onenand.txt to ti,gpmc-onenand.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../devicetree/bindings/mtd/gpmc-onenand.txt  | 48 -----------
>  .../bindings/mtd/ti,gpmc-onenand.yaml         | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> deleted file mode 100644
> index e9f01a963a0a..000000000000
> --- a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -Device tree bindings for GPMC connected OneNANDs
> -
> -GPMC connected OneNAND (found on OMAP boards) are represented as child nodes of
> -the GPMC controller with a name of "onenand".
> -
> -All timing relevant properties as well as generic gpmc child properties are
> -explained in a separate documents - please refer to
> -Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
> -
> -Required properties:
> -
> - - compatible:		"ti,omap2-onenand"
> - - reg:			The CS line the peripheral is connected to
> - - gpmc,device-width:	Width of the ONENAND device connected to the GPMC
> -			in bytes. Must be 1 or 2.
> -
> -Optional properties:
> -
> - - int-gpios:		GPIO specifier for the INT pin.
> -
> -For inline partition table parsing (optional):
> -
> - - #address-cells: should be set to 1
> - - #size-cells: should be set to 1
> -
> -Example for an OMAP3430 board:
> -
> -	gpmc: gpmc@6e000000 {
> -		compatible = "ti,omap3430-gpmc";
> -		ti,hwmods = "gpmc";
> -		reg = <0x6e000000 0x1000000>;
> -		interrupts = <20>;
> -		gpmc,num-cs = <8>;
> -		gpmc,num-waitpins = <4>;
> -		#address-cells = <2>;
> -		#size-cells = <1>;
> -
> -		onenand@0 {
> -			compatible = "ti,omap2-onenand";
> -			reg = <0 0 0>; /* CS0, offset 0 */
> -			gpmc,device-width = <2>;
> -
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -
> -			/* partitions go here */
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> new file mode 100644
> index 000000000000..42149a9c3a8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/ti,gpmc-onenand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OneNAND over Texas Instruments GPMC bus.
> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +  - Roger Quadros <rogerq@kernel.org>
> +
> +description:
> +  GPMC connected OneNAND (found on OMAP boards) are represented
> +  as child nodes of the GPMC controller.
> +
> +properties:
> +  compatible:
> +    const: ti,omap2-onenand
> +
> +  reg:
> +    items:
> +      - description: |
> +          Chip Select number, register offset and size of
> +          OneNAND register window.
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true
> +
> +  int-gpios:
> +    description: GPIO specifier for the INT pin.
> +
> +patternProperties:
> +  "@[0-9a-f]+$":
> +    $ref: "/schemas/mtd/partitions/partition.yaml"
> +
> +allOf:
> +  - $ref: "/schemas/memory-controllers/ti,gpmc-child.yaml"
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    gpmc: memory-controller@6e000000 {
> +      compatible = "ti,omap3430-gpmc";
> +      reg = <0x6e000000 0x02d0>;
> +      interrupts = <20>;
> +      gpmc,num-cs = <8>;
> +      gpmc,num-waitpins = <4>;
> +      clocks = <&l3s_clkctrl>;
> +      clock-names = "fck";
> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +
> +      ranges = <0 0 0x01000000 0x01000000>,   /* 16 MB for OneNAND */
> +               <1 0 0x02000000 0x01000000>;   /* 16 MB for smc91c96 */
> +
> +      onenand@0,0 {
> +        compatible = "ti,omap2-onenand";
> +        reg = <0 0 0x20000>;    /* CS0, offset 0, IO size 128K */
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        partition@0 {
> +          label = "bootloader";
> +          reg = <0x00000000 0x00100000>;
> +        };
> +
> +        partition@1 {

partition@100000

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +          label = "config";
> +          reg = <0x00100000 0x002c0000>;
> +        };
> +      };
> +    };
> -- 
> 2.17.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
