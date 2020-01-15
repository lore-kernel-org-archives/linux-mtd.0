Return-Path: <SRS0=8YuD=3E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0997CC33C9E
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 01:57:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D241D222C3
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 01:57:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d7w3psgd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D241D222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IlFkAX4slm1gKFTiYbN3aUfTFjxQdS6CDYmX2xXdodQ=; b=d7w3psgdU31jQ8
	sXYpQ5Quk7kysClVYuG8RtFsS3Uy9mjGZO52+p2bhMIhLq6ZnxPATZ2cI8GdtS+7NMbrVIckqeMWg
	nqcv0xTs3PqzjmBlVvs1YALWICqAYwXghMcrniqOfksc8vqjA2lcRzRMS6jkeDe+xPQyHVFalKTLR
	+5O5LlnyC1hdEVyMH/HkVQIt52CLPk/RXcGkYANjyhrnwPMuCBCbQfrcUvOaALAraxMJMt44gTQZq
	UoqmTwSuJRDNeaBIwi6Ukrum6QvjpddgO/onNvt4T/7TiXCKMw6eJl576RCxXKPZPGYyjupSzJCjx
	thzzIlgLIQGOqduK07sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irXw3-0001MN-RP; Wed, 15 Jan 2020 01:57:31 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irXvh-00014W-Ne
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2020 01:57:12 +0000
Received: by mail-ot1-f67.google.com with SMTP id b18so14740805otp.0
 for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2020 17:57:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XGLcLKcTFWSB66QXGtgKLA+04IUnUM9PoGpdYQjMx20=;
 b=h5wXoodx67G0fCJV2L+MH5q2FBKOPCVqLOmNFwE/+IxIsHEJd/bn479X4oTuikCJoT
 mWdB4pLJ20ci33X7YbDOZaLf6/Te+BB1Hu+PEbGrcA5rwSyHfMU73MWOldyOeRMHMtKK
 hsStX+jHZavNrSru1GRgsnJOvTx41ymaqtY2e/qEYjtYuRmoXVUNws24uno4A+iC/z6A
 QCNSdRhfJLcr1XVOhDbxsb1CR++JKB5qImBA15HtadVowEC96glplMswIcCeF1sYpvzl
 1sa9/JOih5esgIf5gup88GbrdZqVFiEmUUnxY6O2gnH4dumdDrjIcHT1hKA/wulqVTmU
 t3eA==
X-Gm-Message-State: APjAAAUzIgonFvNpod/4hLiqSpOubUJk6cdbfMa3m8dxm3CXRQtGekoN
 zmhKLYb4xcZez3fUZ6Q3tQJgd84=
X-Google-Smtp-Source: APXvYqz25i5PcRuLrIpvJqdjnMg0Qfd11XYdGxs0GiuKxMEvrgndCZoVoezS5dAdCI6Of9XmX1acyg==
X-Received: by 2002:a05:6830:11d2:: with SMTP id
 v18mr1106795otq.151.1579053428155; 
 Tue, 14 Jan 2020 17:57:08 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c10sm5995007otl.77.2020.01.14.17.57.07
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 17:57:07 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2209ae
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Tue, 14 Jan 2020 19:57:06 -0600
Date: Tue, 14 Jan 2020 19:57:06 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [RFC PATCH v1 01/10] dt-bindings: mtd: add rockchip nand
 controller bindings
Message-ID: <20200115015706.GA30647@bogus>
References: <20200108205338.11369-1-jbx6244@gmail.com>
 <20200108205338.11369-2-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108205338.11369-2-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_175709_794597_9188512C 
X-CRM114-Status: GOOD (  16.19  )
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
 richard@nod.at, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jan 08, 2020 at 09:53:29PM +0100, Johan Jonker wrote:
> Add the Rockchip NAND controller bindings.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../devicetree/bindings/mtd/rockchip,nandc.yaml    | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nandc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nandc.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nandc.yaml
> new file mode 100644
> index 000000000..573d1a580
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/rockchip,nandc.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/rockchip,nandc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip NAND Controller Device Tree Bindings
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"

Should end with a '#'.

> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,nandc-v6
> +      - rockchip,nandc-v9

Use SoC specific compatibles, not version numbers.

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
> +    oneOf:
> +      - items:
> +        - const: hclk_nandc
> +      - items:
> +        - const: clk_nandc
> +        - const: hclk_nandc

Can't you put hclk_nandc first so it's always index 0.

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
> +      compatible = "rockchip,nandc-v6";
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
