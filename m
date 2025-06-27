Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1438C7EE30
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Jun 2025 02:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGQZEZck30LcCr0BMC/2XmjLo7olFgFKhLlru+mlH1w=; b=4rPL4B9AjFqAMQ
	rj6pLkwERkAa/m8Bm+VYN4wAXog9SToJffI7jobP6PpTWEwldqq2uek0EsomDXEkyFPAdZYF6hqKD
	WJlNjTpSvXnysB2vfJ8de9ABAKCGXc3FjhTYgzLrKfgRPmhsUDID0ePSpUjdpJBSMmO4IT4yNO2Zo
	8nsBebyBO2POG7wX5Y+6KSGXMyp8hjbUmGnHmnaksl+t7+3MJFjXwqfmjcA5HVOCunxNlbTff0Scv
	5XzFYzbKHCSt9Pm8Tnm73kjwHHTfDPrbVGvBXRBIUSNnMj6qMSGwMN2xEYg/XrJ/wMWAp1Y/fSsgy
	qeJX6SpWCCgkHy4bwHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUzG7-0000000DOfR-0JLt;
	Fri, 27 Jun 2025 02:56:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUzD0-0000000DOJc-1LuH;
	Fri, 27 Jun 2025 02:52:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 91868A4F572;
	Fri, 27 Jun 2025 02:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAD7C4CEEB;
	Fri, 27 Jun 2025 02:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750992777;
	bh=n9ICYMZZEqjM/08AhUJdBy+aTbCUdAw+Vo2BHUQcYKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lctIc5oh7aLEMBRpJFfnllpBTr+Q+D5TEqPXHgSO4DsSloPU8hb4hBJXbpoAI5Set
	 7b4Sqhs/aAHgkgd5mw5IuVdOS+P3d13SowC83oIvevMUC1Et9Qa7oc/3rX4VBWsoxN
	 3bzSpeM6JXNWaSoJNSBwW12bqYIprbDI3L6IDtZUrsjwerkxTfim3oay1wwbqjJ+cO
	 2pnGnwkRBh/UxR6/qRExKChw/qyVMmzjItNK1mAjQHOcOdCgV4RpyeL7yc1o7SZoP/
	 nv4S04uPzYcCA3dz0Hs6ah+aHy/irgVhPLWrvJdU+0smmRG3uyhDHzmsDtOLQXlzd/
	 otqUn8rNKuNPg==
Date: Thu, 26 Jun 2025 21:52:56 -0500
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
Subject: Re: [PATCH 1/1] dt-bindings: mtd: convert lpc32xx-mlc.txt to yaml
 format
Message-ID: <20250627025256.GA1663635-robh@kernel.org>
References: <20250623202643.2468759-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623202643.2468759-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_195258_491961_8F80DA44 
X-CRM114-Status: GOOD (  18.31  )
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

On Mon, Jun 23, 2025 at 04:26:42PM -0400, Frank Li wrote:
> Convert lpc32xx-mlc.txt to yaml format.
> 
> Additional changes:
> - add ref to nand-controller.yaml.
> - replace _ with - in property names.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/mtd/lpc32xx-mlc.txt   | 50 ------------
>  .../bindings/mtd/nxp,lpc3220-mlc.yaml         | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt b/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
> deleted file mode 100644
> index 64c06aa05ac71..0000000000000
> --- a/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -NXP LPC32xx SoC NAND MLC controller
> -
> -Required properties:
> -- compatible: "nxp,lpc3220-mlc"
> -- reg: Address and size of the controller
> -- interrupts: The NAND interrupt specification
> -- gpios: GPIO specification for NAND write protect
> -
> -The following required properties are very controller specific. See the LPC32xx
> -User Manual 7.5.14 MLC NAND Timing Register (the values here are specified in
> -Hz, to make them independent of actual clock speed and to provide for good
> -accuracy:)
> -- nxp,tcea_delay: TCEA_DELAY
> -- nxp,busy_delay: BUSY_DELAY
> -- nxp,nand_ta: NAND_TA
> -- nxp,rd_high: RD_HIGH
> -- nxp,rd_low: RD_LOW
> -- nxp,wr_high: WR_HIGH
> -- nxp,wr_low: WR_LOW
> -
> -Optional subnodes:
> -- Partitions, see Documentation/devicetree/bindings/mtd/mtd.yaml
> -
> -Example:
> -
> -	mlc: flash@200a8000 {
> -		compatible = "nxp,lpc3220-mlc";
> -		reg = <0x200A8000 0x11000>;
> -		interrupts = <11 0>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -		nxp,tcea-delay = <333333333>;
> -		nxp,busy-delay = <10000000>;
> -		nxp,nand-ta = <18181818>;
> -		nxp,rd-high = <31250000>;
> -		nxp,rd-low = <45454545>;
> -		nxp,wr-high = <40000000>;
> -		nxp,wr-low = <83333333>;
> -		gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
> -
> -		mtd0@00000000 {
> -			label = "boot";
> -			reg = <0x00000000 0x00064000>;
> -			read-only;
> -		};
> -
> -		...
> -
> -	};
> diff --git a/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml
> new file mode 100644
> index 0000000000000..acc430db5244e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/nxp,lpc3220-mlc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC32xx SoC NAND MLC controller
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc3220-mlc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpios:
> +    maxItems: 1
> +    description: GPIO specification for NAND write protect
> +
> +  nxp,tcea-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: TCEA_DELAY in Hz
> +
> +  nxp,busy-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: BUSY_DELAY in Hz
> +
> +  nxp,nand-ta:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: NAND_TA in Hz
> +
> +  nxp,rd-high:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: RD_HIGH in Hz
> +
> +  nxp,rd-low:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: RD_LOW in Hz
> +
> +  nxp,wr-high:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: WR_HIGH in Hz
> +
> +  nxp,wr-low:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: WR_LOW in Hz
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - gpios
> +
> +allOf:
> +  - $ref: nand-controller.yaml

Do either of these use this? They don't define 'nand' chip nodes, do 
they?

No partitions on this one?

Rob


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
