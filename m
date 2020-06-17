Return-Path: <SRS0=1DMU=76=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B5FC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jun 2020 21:15:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8561E21883
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jun 2020 21:15:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h1SDw3Fa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8561E21883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ir0BE6YuCzVe12/XIx1FS03G6vRniy1ezQzgijQ2WXo=; b=h1SDw3FafalSfJ
	tQlxf9eIBPGlj13AT7C8U2OciLM9pZjjbbp0ez//fF74+tB8giAZ8uVaoGmIGjfPXvcdE0V5oRHzo
	FKPZMvJ5PZzCG4GSy/T3Bf6oBaFpcblYBiz3TIAsosSHUBTdY/TAXQHGh/wTJQqqizSr+SBUQen29
	5ffBSMWrW/YnBVHul6hi598yvimNNB1eo2ZKfD5NJslqvyGCBoINnaMS8xlfOymmTqLU7vIRAwEPg
	byLdfV+DM7J4GTOt9hoKLhAM+YwSrxGq6OZj0W3LFDChzTjdBIqEDSFg9yQjsWJpCicfVL2vezxIG
	cuxkSHEzuBVqM7C6lZoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlfOZ-00036e-Cf; Wed, 17 Jun 2020 21:14:55 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlfOW-000363-PZ; Wed, 17 Jun 2020 21:14:54 +0000
Received: by mail-io1-f67.google.com with SMTP id u13so4607818iol.10;
 Wed, 17 Jun 2020 14:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VWO5LGmEg8Ig2cq5eIpV/Gm4FJwOWAH3M+GOgTvadrI=;
 b=e8/xbij37h7/hr/0gO5TApVgbNUevvftH/kzPNe0b9W5PuVMufzlInSANOdTL2V1Q/
 KxJB8hRSAILBLnNTxGCYUJjlhN2BK8Wt0HDnliiKb9fFIcWu43a9nGXTTnJxEwLDxuaf
 H2z4q7y6DFHGQOfBsj/mgY49j8696SEh0gWEbsuAZvCLs2WNimRJTyX9DQc8h1PxXwVK
 7W879BSilRdXJe+HSbg+0IlX3TCxr+O87zm+IlzoLPRRyB4mpWXn8rJqzl4yuQl25wG3
 7FUAUrwvJcXfv+QH79/W/JENAx3nVGG0aIZo0MXzAwfLOhBlgBZQDMysYPCG0lo+amAw
 wVCw==
X-Gm-Message-State: AOAM5311x0z4AYuiRxdmUKFG56R8nyWRcZ7rTzNpF9kd2KYGZgC3Qqc0
 dzjklN4BOYdTRwYlkB+FyQ==
X-Google-Smtp-Source: ABdhPJy7XP0pSsuCKM5EibaN3mFwRa16qdK+sQARWZ0lMWqklFY1HprY+VlevFhTg9YxT29C3724dQ==
X-Received: by 2002:a05:6602:809:: with SMTP id
 z9mr1454740iow.79.1592428491937; 
 Wed, 17 Jun 2020 14:14:51 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id w15sm430303ilj.21.2020.06.17.14.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 14:14:51 -0700 (PDT)
Received: (nullmailer pid 2834025 invoked by uid 1000);
 Wed, 17 Jun 2020 21:14:50 -0000
Date: Wed, 17 Jun 2020 15:14:50 -0600
From: Rob Herring <robh@kernel.org>
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH v6 1/8] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
Message-ID: <20200617211450.GA2811091@bogus>
References: <20200609074020.23860-1-yifeng.zhao@rock-chips.com>
 <20200609074020.23860-2-yifeng.zhao@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609074020.23860-2-yifeng.zhao@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_141452_831334_F9708C1C 
X-CRM114-Status: GOOD (  19.89  )
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
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jun 09, 2020 at 03:40:18PM +0800, Yifeng Zhao wrote:
> Documentation support for Rockchip RK3xxx NAND flash controllers
> 
> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> ---
> 
> Changes in v6:
> - Fix some wrong define
> - Modified the definition of compatible
> 
> Changes in v5:
> - Fix some wrong define
> - Add boot-medium define
> - Remove some compatible define
> 
> Changes in v4:
> - The compatible define with rkxx_nfc
> - Add assigned-clocks
> - Fix some wrong define
> 
> Changes in v3:
> - Change the title for the dt-bindings
> 
> Changes in v2: None
> 
>  .../mtd/rockchip,nand-controller.yaml         | 154 ++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> new file mode 100644
> index 000000000000..f753fe8248aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/rockchip,nand-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip SoCs NAND FLASH Controller (NFC)
> +
> +allOf:
> +  - $ref: "nand-controller.yaml#"
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: rockchip,px30-nfc
> +      - const: rockchip,rk2928-nfc
> +      - const: rockchip,rv1108-nfc
> +      - items:
> +          - const: rockchip,rk3326-nfc
> +          - const: rockchip,px30-nfc
> +      - items:
> +          - const: rockchip,rk3036-nfc
> +          - const: rockchip,rk2928-nfc
> +      - items:
> +          - const: rockchip,rk3308-nfc
> +          - const: rockchip,rv1108-nfc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: Bus Clock
> +      - description: Module Clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: ahb
> +      - const: nfc
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +
> +  pinctrl-0:
> +    maxItems: 1
> +
> +  pinctrl-names:
> +    const: default

You can drop pinctrl-*. They are automatically supported.

> +
> +  power-domains:
> +     maxItems: 1
> +
> +patternProperties:
> +  "^nand@[a-f0-9]$":

'[0-7]' is correct here.

Out of bounds nodes and other unknown properties should be prevented 
with 'unevaluatedProperties: false' (though not yet until the tooling 
supports it).

> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 7
> +
> +      nand-ecc-mode:
> +        const: hw
> +
> +      nand-ecc-step-size:
> +        const: 1024
> +
> +      nand-ecc-strength:
> +        enum: [16, 24, 40, 60, 70]
> +        description:
> +          The ECC configurations that can be supported are as follows.
> +          - NFCv900(PX30 and RK3326) support ecc strength 16, 40, 60 and 70.
> +          - NFCv600(RK3066 and RK2928) support ecc strength 16, 24, 40 and 60.
> +          - NFCv622(RK3036 and RK3128) support ecc strength 16, 24, 40 and 60.
> +          - NFCv800(RK3308 and RV1108) support ecc strength 16.
> +
> +      nand-bus-width:
> +        const: 8
> +
> +      rockchip,boot-blks:
> +        minimum: 2
> +        default: 16
> +        allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32

You can drop 'allOf' now.

> +        description:
> +          The NFC driver need this information to select ECC
> +          algorithms supported by the BOOTROM.
> +          Only used in combination with 'nand-is-boot-medium'.
> +
> +      rockchip,boot-ecc-strength:
> +        enum: [16, 24, 40, 60, 70]
> +        allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          If specified it indicates that a different BCH/ECC setting is
> +          supported by the BOOTROM.
> +          - NFCv900(PX30 and RK3326) support ecc strength 16 and 70.
> +          - NFCv600(RK3066 and RK2928) support ecc strength 16, 24, 40 and 60.
> +          - NFCv622(RK3036 and RK3128) support ecc strength 16, 24, 40 and 60.
> +          - NFCv800(RK3308 and RV1108) support ecc strength 16.
> +          Only used in combination with 'nand-is-boot-medium'.
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
> +    #include <dt-bindings/clock/rk3308-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    nfc: nand-controller@ff4b0000 {
> +      compatible = "rockchip,rk3308-nfc",
> +                   "rockchip,rv1108-nfc";
> +      reg = <0x0 0xff4b0000 0x0 0x4000>;
> +      interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&cru HCLK_NANDC>, <&cru SCLK_NANDC>;
> +      clock-names = "ahb", "nfc";
> +      assigned-clocks = <&clks SCLK_NANDC>;
> +      assigned-clock-rates = <150000000>;
> +
> +      pinctrl-0 = <&flash_ale &flash_bus8 &flash_cle &flash_csn0
> +                   &flash_rdn &flash_rdy &flash_wrn>;
> +      pinctrl-names = "default";
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      nand@0 {
> +        reg = <0>;
> +        label = "rk-nand";
> +        nand-bus-width = <8>;
> +        nand-ecc-mode = "hw";
> +        nand-ecc-step-size = <1024>;
> +        nand-ecc-strength = <16>;
> +        nand-is-boot-medium;
> +        rockchip,boot-blks = <8>;
> +        rockchip,boot-ecc-strength = <16>;
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
