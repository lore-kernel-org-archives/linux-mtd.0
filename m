Return-Path: <SRS0=yeSB=3X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCB0C35247
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2020 15:46:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B98102087E
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2020 15:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZmkSDNNi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B98102087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHySS7nsW6KO9CecXA99UtoHu4aDDiEnMM9WihDM7PE=; b=ZmkSDNNivjUK+r
	Izz2dxzzwYLyqtmN2m/V7snbIPE+D3uNBXB9FSSpn1LCvcR6Os6keN2CIuBR17fNxlKTJgw/QP7qa
	3b5p3JSOr4Gx8wRFnrwQKHlFFfwfRWNpjY+bPRfyahNO74ETyMNPqsHwG7dCugal951wy9UXc58Kj
	inqQbs9WAYX5YnLSXKqnz5zdCtPHmDT/UTSywtwPF396wlse0E1NRC8wocGnOcQuHue1uQ5xGJImZ
	NU2U99NXlJdPJO4vrW5FEOhrOTyTiQNgwLcz9efRy8AF1I+dhK9DeOe4ALgOeYHuDGTjTj+SqkWep
	YZCn08lZDUaldnEiI+mQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iydv5-0000wf-57; Mon, 03 Feb 2020 15:45:51 +0000
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iydv1-0000vS-CU; Mon, 03 Feb 2020 15:45:48 +0000
Received: by mail-wm1-f68.google.com with SMTP id t14so17747260wmi.5;
 Mon, 03 Feb 2020 07:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i4K3Yw7s0/p2VRy7WZBsheWIHTlpjbUAlC7ufzYvY3E=;
 b=ouhrK/ki9fL5EGA3f9ARDDTocSx8KpKPYw4igsVHriGfaVq4wWYj4hw6FCX3zlt3My
 rahn3UmMj9qYbuFyMP2MV3nLLICoJ4FQDEMsmKpqAiGo4x86fi9yaBbJ5bf8BFBAhZDy
 F72/mI3Q0Dj9zjYbyfQxrgvn7mlZ+YMjR0WON2cASzUQSdBYb2VDVWoYBBDnmk5LpCRe
 v1KFBvo69+nIsvwoKnTVetP5xQKBvp+xzFVkrC8rDfNsVzB76DRf0bYR7/9QKPzqV377
 XEVPIiirp07c5xD8WqwYbI6sXl788bYkgbfr+ONr/IRLrma+DUcE5ttJ58w/HWBda+oa
 yYdA==
X-Gm-Message-State: APjAAAXTuazjDitIXtAMSq1ebxXg6jCGuC34b1z+8tieXy+j6aiFYR+V
 z6JEWMq92uWwaCNU/iRBFw==
X-Google-Smtp-Source: APXvYqzUC53KksT1fJG8MNOZOKWNr3IVl/W0eL/KQgTAaS4Tm5DvJl1BsknoQ94mvSkDJuxs3SUf1Q==
X-Received: by 2002:a1c:5441:: with SMTP id p1mr31595887wmi.161.1580744744243; 
 Mon, 03 Feb 2020 07:45:44 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.163])
 by smtp.gmail.com with ESMTPSA id f189sm25558921wmf.16.2020.02.03.07.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 07:45:43 -0800 (PST)
Received: (nullmailer pid 17059 invoked by uid 1000);
 Mon, 03 Feb 2020 15:45:42 -0000
Date: Mon, 3 Feb 2020 15:45:42 +0000
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [RFC PATCH v2 01/10] dt-bindings: mtd: add rockchip nand
 controller bindings
Message-ID: <20200203154542.GA27866@bogus>
References: <20200124163001.28910-1-jbx6244@gmail.com>
 <20200124163001.28910-2-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124163001.28910-2-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_074547_425865_373ACF43 
X-CRM114-Status: GOOD (  16.42  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, heiko@sntech.de,
 richard@nod.at, shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, yifeng.zhao@rock-chips.com,
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jan 24, 2020 at 05:29:52PM +0100, Johan Jonker wrote:
> Add the Rockchip NAND controller bindings.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../bindings/mtd/rockchip,nand-controller.yaml     | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> new file mode 100644
> index 000000000..5c725f972
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/rockchip,nand-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip NAND Controller Device Tree Bindings
> +
> +allOf:
> +  - $ref: "nand-controller.yaml#"
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,px30-nand-controller
> +      - rockchip,rk3066-nand-controller
> +      - rockchip,rk3228-nand-controller
> +      - rockchip,rk3288-nand-controller
> +      - rockchip,rk3308-nand-controller
> +      - rockchip,rk3368-nand-controller
> +      - rockchip,rv1108-nand-controller
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
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: hclk_nandc
> +      - const: clk_nandc
> +
> +patternProperties:
> +  "^nand@[a-f0-9]+$":
> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +
> +      nand-is-boot-medium: true
> +
> +      rockchip,idb-res-blk-num:

What is idb? Rather than define, maybe just 'rockchip,boot-blks'?

> +        minimum: 2

is there a max?

> +        default: 16
> +        allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          For legacy devices where the bootrom can only handle 24 bit BCH/ECC.
> +          If specified it indicates the number of erase blocks in use by
> +          the bootloader that need a lower BCH/ECC setting.
> +          Only used in combination with 'nand-is-boot-medium'.
> +
> +    additionalProperties: false
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
> +    #include <dt-bindings/clock/rk3188-cru-common.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    nandc: nand-controller@10500000 {
> +      compatible = "rockchip,rk3066-nand-controller";
> +      reg = <0x10500000 0x4000>;
> +      interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&cru HCLK_NANDC0>;
> +      clock-names = "hclk_nandc";
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      nand@0 {
> +        reg = <0>;
> +        nand-is-boot-medium;
> +      };
> +    };
> +
> +...
> -- 
> 2.11.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
