Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDA1C7EE31
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Jun 2025 02:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z8hUM9vxwv+28xr7QVr1mR82p/Rf/xlOANfBIEqil7E=; b=tPFLFGX2gewWhO
	NASgFfyeH+Ah7QlRM25rGCrmGzWqwhZ7dtIlIWvHKrdSFeA0Vn8/vqIJ8ssbB6terCTc4tuLR63S7
	ASAAneXGEX3ldNYkiBqEw1i49o53v0YwltHoml0H7uD3q9pCamvL4JEStbXj78pKXKQvAXUc6O/S1
	oh6RVXDGn/G5HrwexPRnWkbQ/g8TFOfqAo40JEIb7Q90RjOIlQ0AeCj15gSS9zlqCVGnfLCLkhYuT
	dTeFAsNN3WMxsA6zVSno82+NNrn6SfUjxhjlWrUosrWf2OlUHa4VXlG//WQRxpqQy2XWpiBCgiVfX
	gbx0K4SujnSglUqOHnlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUzDp-0000000DOSl-3NgP;
	Fri, 27 Jun 2025 02:53:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUzBC-0000000DO9l-0DOq;
	Fri, 27 Jun 2025 02:51:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7AB05C59F8;
	Fri, 27 Jun 2025 02:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520CCC4CEEB;
	Fri, 27 Jun 2025 02:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750992661;
	bh=QvL56MYYAxGslKpHG6OIwVOATz5SpWV3LVwYEEaG8xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhs+l2IPzVEfSqz+ZyLpUKmHpLk+PhU9q2xsNAknS98isbvCVCfFmxIADKanLz5Qf
	 xMKqCWdx4/9ROhJLSPkuwWK3MRa69cPRfsdjLQjJTaythSoHdIGCkk0mhcwtX6iAog
	 fOt9Y/chU0SgC16HOEkwGdGT56tIWuflmpiEI3WxYeHQd6bZ66JyucvoMkH0cPQwYc
	 Ov6emP8jKEsKpt5OHQG3GExWi3qtf2j0OKWgxCe2ItI4t5RzlJiOECKpq9Qh3301nD
	 4qGz4ZZAMS0kFE/FDIh+bOBCZcc9d9r/wm0TF7ZGNzigVUQNt+d+/jBcvacxTaRT1J
	 d2rNGMru/jS3g==
Date: Thu, 26 Jun 2025 21:51:00 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	"open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mtd: convert lpc32xx-slc.txt to yaml
 format
Message-ID: <20250627025100.GA1661037-robh@kernel.org>
References: <20250623202325.2468483-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623202325.2468483-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_195106_316165_D6742847 
X-CRM114-Status: GOOD (  19.16  )
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

On Mon, Jun 23, 2025 at 04:23:24PM -0400, Frank Li wrote:
> Convert lpc32xx-slc.txt to yaml format.
> 
> Additional changes:
> - add ref to nand-controller.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/mtd/lpc32xx-slc.txt   |  52 ---------
>  .../bindings/mtd/nxp,lpc3220-slc.yaml         | 101 ++++++++++++++++++
>  2 files changed, 101 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt b/Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
> deleted file mode 100644
> index 39f17630a3011..0000000000000
> --- a/Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -NXP LPC32xx SoC NAND SLC controller
> -
> -Required properties:
> -- compatible: "nxp,lpc3220-slc"
> -- reg: Address and size of the controller
> -- nand-on-flash-bbt: Use bad block table on flash
> -- gpios: GPIO specification for NAND write protect
> -
> -The following required properties are very controller specific. See the LPC32xx
> -User Manual:
> -- nxp,wdr-clks: Delay before Ready signal is tested on write (W_RDY)
> -- nxp,rdr-clks: Delay before Ready signal is tested on read (R_RDY)
> -(The following values are specified in Hz, to make them independent of actual
> -clock speed:)
> -- nxp,wwidth: Write pulse width (W_WIDTH)
> -- nxp,whold: Write hold time (W_HOLD)
> -- nxp,wsetup: Write setup time (W_SETUP)
> -- nxp,rwidth: Read pulse width (R_WIDTH)
> -- nxp,rhold: Read hold time (R_HOLD)
> -- nxp,rsetup: Read setup time (R_SETUP)
> -
> -Optional subnodes:
> -- Partitions, see Documentation/devicetree/bindings/mtd/mtd.yaml
> -
> -Example:
> -
> -	slc: flash@20020000 {
> -		compatible = "nxp,lpc3220-slc";
> -		reg = <0x20020000 0x1000>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -		nxp,wdr-clks = <14>;
> -		nxp,wwidth = <40000000>;
> -		nxp,whold = <100000000>;
> -		nxp,wsetup = <100000000>;
> -		nxp,rdr-clks = <14>;
> -		nxp,rwidth = <40000000>;
> -		nxp,rhold = <66666666>;
> -		nxp,rsetup = <100000000>;
> -		nand-on-flash-bbt;
> -		gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
> -
> -		mtd0@00000000 {
> -			label = "phy3250-boot";
> -			reg = <0x00000000 0x00064000>;
> -			read-only;
> -		};
> -
> -		...
> -
> -	};
> diff --git a/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml
> new file mode 100644
> index 0000000000000..db9cf4efb2212
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/nxp,lpc3220-slc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC32xx SoC NAND SLC controller
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc3220-slc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  gpios:
> +    maxItems: 1
> +    description:
> +      GPIO specification for NAND write protect
> +
> +  nand-on-flash-bbt: true
> +
> +  partitions:
> +    type: object
> +    $ref: partitions/partition.yaml

That's not right... You want partitions.yaml?

> +    unevaluatedProperties: false
> +
> +  nxp,wdr-clks:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Delay before Ready signal is tested on write (W_RDY)
> +
> +  nxp,rdr-clks:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Delay before Ready signal is tested on read (R_RDY)
> +
> +  nxp,wwidth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Write pulse width (W_WIDTH) in Hz
> +
> +  nxp,whold:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Write hold time (W_HOLD) in Hz
> +
> +  nxp,wsetup:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Write setup time (W_SETUP) in Hz
> +
> +  nxp,rwidth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Read pulse width (R_WIDTH) in Hz
> +
> +  nxp,rhold:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Read hold time (R_HOLD) in Hz
> +
> +  nxp,rsetup:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Read setup time (R_SETUP) in Hz
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpios
> +
> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    nand-controller@20020000 {
> +        compatible = "nxp,lpc3220-slc";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x20020000 0x1000>;
> +        nxp,wdr-clks = <14>;
> +        nxp,wwidth = <40000000>;
> +        nxp,whold = <100000000>;
> +        nxp,wsetup = <100000000>;
> +        nxp,rdr-clks = <14>;
> +        nxp,rwidth = <40000000>;
> +        nxp,rhold = <66666666>;
> +        nxp,rsetup = <100000000>;
> +        nand-on-flash-bbt;
> +        gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
> +    };
> -- 
> 2.34.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
