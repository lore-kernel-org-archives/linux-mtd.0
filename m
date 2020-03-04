Return-Path: <SRS0=wBEz=4V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BC3C3F2D1
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2020 16:56:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 452E420674
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2020 16:56:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="osRdZ4SB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 452E420674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XqIpWe5cW4rdJyYuZ7NJkVNPTEsS2Mr7Pp/8dbapIkY=; b=osRdZ4SBQ4kSFU
	/47okXdlfz7QOn3gIrWtpx5aSinijb0c7yunZrcnn7woz2W8Utk14+OhMJkV7i9o6pRkb42/pE+cU
	dcjxO/N/D6luf3WtqwpL6IUzLzlxOToV4Fb+PrwoNJHBYmXydXHirsW0zOPlndBJg+1WVBuYuF8G6
	RtPLm4Lpb5FmDoy4POwTypHE7GB0XMuoIDI0lwl9eDFrELvaphU8qxP7f+CM3emPTJlz7mj03FrFE
	dQGfA7/2xoPkSzRA1iR4KspHKca22y9KQ8fKJSFDeUsLAJM1678PRdf1R6XpNHizoRnLDxtR7/jXC
	9GQhKNsbPQF5gEs1cOew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9XJu-00033L-NV; Wed, 04 Mar 2020 16:56:30 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9XJr-00031V-Bd; Wed, 04 Mar 2020 16:56:29 +0000
Received: by mail-oi1-f196.google.com with SMTP id i1so2766006oie.8;
 Wed, 04 Mar 2020 08:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1x6Tl4FkquqbFK2U7e561blQbQkLtLaOfZkxuV3Uifk=;
 b=gnmZBclf+jY+oMns5hLMUDdPwvPSFsPKHJUVOxSsLHgy1KNdvSWUZVx8WFrmljdHU4
 XCQ28jR0UD1osZx4zajukHk6EXtwy0Idiq87bKgVtoDvKLM01G4+6yGK21VImU3GazzO
 zxp1SnVc5ZZvlI61+45q9mUjXRmkq0CenA1y83EZT4I1CnXsJ9AY0ZdRD1LVgowT+NcJ
 +ussLjvkzM4WCnwvVFhzE5Sw/RgC3erqnpmXVuZe8IvtYs9qGBbHQ5B4s9amKa/FvEB8
 VAghaeZZHc1G69PBR7E/4FpOEYyzAhN3DTGfZ9fP0l4S/CH0ZKRlfJV9UwatgKc0Nh2t
 15NQ==
X-Gm-Message-State: ANhLgQ1ns7MIEwPG3rnYav6SrWRMwv4A9fO+hxY2+Nwyw9JcnGBXdZGm
 YWGoMJ5P/NU+xBm4fqLQnw==
X-Google-Smtp-Source: ADFU+vvN0s8xtsegXAsk83hpqJfBSA3bQkx7dF0MVL1rhBScQPKr6TdRvIrDvNFvUBC3bmvtUvwhqg==
X-Received: by 2002:aca:c0c5:: with SMTP id q188mr2299956oif.169.1583340986232; 
 Wed, 04 Mar 2020 08:56:26 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y14sm8992584oih.23.2020.03.04.08.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 08:56:25 -0800 (PST)
Received: (nullmailer pid 18755 invoked by uid 1000);
 Wed, 04 Mar 2020 16:56:24 -0000
Date: Wed, 4 Mar 2020 10:56:24 -0600
From: Rob Herring <robh@kernel.org>
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
Message-ID: <20200304165624.GA2630@bogus>
References: <20200303094736.7490-1-yifeng.zhao@rock-chips.com>
 <20200303094736.7490-3-yifeng.zhao@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303094736.7490-3-yifeng.zhao@rock-chips.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_085627_415385_48C0CE96 
X-CRM114-Status: GOOD (  17.10  )
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
Cc: devicetree@vger.kernel.org, heiko@sntech.de, richard@nod.at,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Mar 03, 2020 at 05:47:35PM +0800, Yifeng Zhao wrote:
> Documentation support for Rockchip RK3xxx NAND flash controllers
> 
> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> ---
> 
> Changes in v3:
> -change the title for the dt-bindings
> 
> Changes in v2: None
> 
>  .../bindings/mtd/rockchip,nand.yaml           | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand.yaml
> new file mode 100644
> index 000000000000..9a81f682ac01
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/rockchip,nand.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/rockchip,nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip SoCs NAND FLASH Controller (NFC) Device Tree Bindings
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +maintainers:
> +  - Yifeng Zhao <yifeng.zhao@rock-chips.com>
> +
> +properties:
> +  "#address-cells": true
> +  "#size-cells": true
> +
> +  compatible:
> +    const: rockchip,nfc

Should be SoC specific.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Module Clock
> +      - description: Bus Clock
> +
> +  clock-names:
> +    items:
> +      - const: clk_nfc
> +      - const: clk_ahb

'clk_' is redundant.

> +
> +  clock-rates:
> +      maximum: 150000000

Not a standard property. Should be implied by the compatible string.

> +
> +  pinctrl-names: true

No need to specify this, pinctrl properties are allowed on any node and 
added by the tool.

> +
> +patternProperties:
> +  "^pinctrl-[0-9]+$": true

Same here.

> +
> +  "^nand@[a-f0-9]$":

Based on reg, should be only '[0-3]'

> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +
> +      nand-ecc-step-size:
> +        const: 1024
> +
> +      nand-ecc-strength:
> +        enum: [16, 24 , 40, 60, 70]
> +
> +      nand-bus-width:
> +        const: 8
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/rk3308-cru.h>
> +    nfc: nand-controller@ff4b0000 {
> +      compatible = "rockchip,nfc";
> +      reg = <0x0 0xff4b0000 0x0 0x4000>;
> +      interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&cru SCLK_NANDC>, <&cru HCLK_NANDC>;
> +      clock-names = "clk_nfc", "clk_ahb";
> +      clock-rates = <150000000>;
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&flash_csn0 &flash_rdy &flash_ale &flash_cle
> +                  &flash_wrn &flash_rdn &flash_bus8>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      nand@0 {
> +        reg = <0>;
> +        nand-ecc-mode = "hw";
> +        nand-ecc-strength = <16>;
> +        nand-ecc-step-size = <1024>;
> +        nand-bus-width = <8>;
> +      };
> +    };
> +
> +...
> -- 
> 2.17.1
> 
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
