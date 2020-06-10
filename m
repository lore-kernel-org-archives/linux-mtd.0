Return-Path: <SRS0=TxBo=7X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C742C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jun 2020 10:50:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DCFD206F7
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jun 2020 10:50:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cpJiBk92";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiyjWfmI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DCFD206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9QoeEB2zRUti0cO4sTBdRmlEzZKgjn3fGs1WYH7swQ=; b=cpJiBk92QEJGxr
	Rt69q5OwHtCNRFJsM/5+qxSxyTas46tKj26/g4k3/ZMGzzfjgVr02ND4JGJlfDAQZmAH/GFUmf7dz
	syEB9ziuGmRiNeh5ubhCmLLJ1XJzGdrZjWFmyk+MwHtrcRnrSlNKt1sbXcdcou93QUdoZzJLEOfkc
	wjMyfjRWdI/tic8yHtsllIx8L0t0JEmAphjV5cnmqU97uw7CV4dOV7CwbL79bxOmIDe6ctNleo3lR
	01vNTLWwf27tmvQfQ21JAiiEIwnEYBdffP9jnvAkpr3Cfo2dyOKdX0uq4iDNvdbe6p5V9DFUz10Su
	Ve8brvuY6E44FMQZ+odg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiyJd-0006OD-OM; Wed, 10 Jun 2020 10:50:41 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiyJS-0006Dx-B8; Wed, 10 Jun 2020 10:50:32 +0000
Received: by mail-ej1-x641.google.com with SMTP id w16so1473231ejj.5;
 Wed, 10 Jun 2020 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LOmMo1Zuovj+Zdo3Z6XAOGDBaVFrsQ/9KBjzRPBjkbw=;
 b=GiyjWfmI0+ptsGdFAbKzEtUr39pL6sas8NRHV1Xd76jZIF3Z6efJq7Am0xk+mtqecp
 RBzYkBejER5rqGdUF5FDTuPBmCTyJ8kfSY5VMCGvvBf1YHmBUOz96fwcdN60zmVn/Gtx
 AkJD1GtPY13pj7jSdVsUcoT8aPKiUESRq0v0Zc5Tm6sPQQmH37bd5TN4NIsjEmrAF2hq
 Gpa/NspwU58SfewG5TJpINBV/bVa4gmOkBu5wgZTT0fr0CgwUDNOJAxVlvDY62rP3N4e
 0jG5k0aNSlXNiifMNoZnk1YQMxWOJKO9Pjai7q6cvtjoLdLBL+YRfY5ITLPrL2nGrTaG
 gnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LOmMo1Zuovj+Zdo3Z6XAOGDBaVFrsQ/9KBjzRPBjkbw=;
 b=Wp4h42xuDM3PJ0MDF8AGjrrwQBCoHSngDOvMdfbAksFgQULWOBkTLyZKyrQ+Qw1ATU
 7AKJMGk7HuYWrwV8gXSlEdJhsvkXwCjoWg4r+pBV9fs6vULyFfsNt5oCnVic9mEfkQRS
 PyVDcJDFfLOUbaApyszNpePJE67mYxwH7PcA17OV7QkI7bRUbYVPTbEusHkZuohOcsfJ
 Vtp5d9ZWR/BMu2EVKfndY8V+04VFZTUcqzFbQ9jkWXVpSxVjg3vt3bH62D1HG9VH+Z1/
 acbswRSYeRxAQal/p5ddEeb/SCbHCp/tv6Dq7N9+TECgeQ95kfBO5h9zYXzvY+z3HyYE
 G5dw==
X-Gm-Message-State: AOAM5328I/bub/7bJ/GthXUdi7dpTta1JpmnHjX/I7oZ0WLOcQp7v6hp
 DDFKKd5vJOIAm3+BmM/aAxjOXAa1
X-Google-Smtp-Source: ABdhPJzn4MZoGhaJASFC13nnCPNyWmnoV1PGRcwEhafs4sNzzcFECzbBLrwZnlIYOAb/FnrC0G3zcA==
X-Received: by 2002:a17:906:fa03:: with SMTP id
 lo3mr2872150ejb.196.1591786228594; 
 Wed, 10 Jun 2020 03:50:28 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id q12sm15184929ejn.23.2020.06.10.03.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 03:50:27 -0700 (PDT)
Subject: Re: [PATCH v6 1/8] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org
References: <20200609074020.23860-1-yifeng.zhao@rock-chips.com>
 <20200609074020.23860-2-yifeng.zhao@rock-chips.com>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <e805f6c2-26a2-8163-d061-ce43026d4d3f@gmail.com>
Date: Wed, 10 Jun 2020 12:50:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609074020.23860-2-yifeng.zhao@rock-chips.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_035030_387912_C39B0676 
X-CRM114-Status: GOOD (  25.43  )
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
Cc: devicetree@vger.kernel.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Yifeng,

Just a few more comments (part 1).

About the name of the dts patches.

Currently this is used:
Subject [PATCH v6 6/8] arm: dts: rockchip: Add nfc dts for RV1108 SOC
Add nfc(nand flash controller) node for RV1108 Soc.

Dts is more file related. The patch adds a node, so maybe change it to:
Subject [PATCH v7 6/8] arm: dts: rockchip: Add nfc node for RV1108 SoC
Add NAND FLASH Controller(NFC) node for RV1108 SoC.

Johan

On 6/9/20 9:40 AM, Yifeng Zhao wrote:
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

In the mainline kernel rk3326.dtsi gets the nodes defined by including
px30.dtsi, so if nothing changed we don't need a compatible string for
rk3326. Or else add an extra patch to this serie where this compatible
string is needed.

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
> +
> +  power-domains:

> +     maxItems: 1

       ^
Use 2 spaces instead of 3.

> +
> +patternProperties:
> +  "^nand@[a-f0-9]$":
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

         NFC v600 ECC 16, 24, 40, 60
           RK2928, RK3066, RK3188

         NFC v622 ECC 16, 24, 40, 60
           RK3036, RK3128

         NFC v800 ECC 16
           RK3308, RV1108

         NFC v900 ECC 16, 40, 60, 70
           PX30, RK3326

Make it more in alphabetically order, so later things can easier be
inserted.
Maybe don't use the character '-' at the start of a line in a yaml file?

> +
> +      nand-bus-width:
> +        const: 8
> +
> +      rockchip,boot-blks:
> +        minimum: 2
> +        default: 16
> +        allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          The NFC driver need this information to select ECC
> +          algorithms supported by the BOOTROM.

boot ROM

> +          Only used in combination with 'nand-is-boot-medium'.
> +
> +      rockchip,boot-ecc-strength:
> +        enum: [16, 24, 40, 60, 70]
> +        allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          If specified it indicates that a different BCH/ECC setting is
> +          supported by the BOOTROM.

boot ROM

> +          - NFCv900(PX30 and RK3326) support ecc strength 16 and 70.

> +          - NFCv600(RK3066 and RK2928) support ecc strength 16, 24, 40 and 60.

Is ECC strength for rk3066 16, 24 correct?

> +          - NFCv622(RK3036 and RK3128) support ecc strength 16, 24, 40 and 60.
> +          - NFCv800(RK3308 and RV1108) support ecc strength 16.
         NFC v600 ECC 16, 24
           RK2928, RK3066, RK3188

         NFC v622 ECC 16, 24, 40, 60
           RK3036, RK3128

         NFC v800 ECC 16
           RK3308, RV1108

         NFC v900 ECC 16, 70
           PX30, RK3326

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

#include <dt-bindings/interrupt-controller/irq.h>

irq.h is included by arm-gic.h, however Heiko recently indicated that
both should be included.

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
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
