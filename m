Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B97CD041B
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jan 2026 22:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5e95w172Td0CGXaB7krwi3EHFDTcPoNn3ZPg+X71Q4=; b=l09D6y2q3mo60N
	Csnd1G56X8MWewIneRpj86lnT5S8rA2seELmIyQSWVboM50N3I0u1LdLh9Xe7hrnCln57r0oFnmcj
	xUuqeyeLvW85ym+xTh4wAsE0uU9Z1MptLnlN2ue3vgA8aVqk2uXY/IFfIgtJqn59hVtIGBxV07h/C
	FB3xgnK2bcs5FAdHKkGdAYQFd2X8QIEAjSXvyrccySmbNt+S8nhdwpMy/U/W3RZYKwTO7V8RgT7og
	f5tLdPaKzmPZv8oBP9bpSG6Q4G891CiXUIZ+kp4TjNr1mQUfeGegBXDtafnkSZ3WeREj67yUf5O0H
	MvHL4K53cTS1Kx2whq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsxj-0000000C9ir-0bjd;
	Mon, 05 Jan 2026 22:22:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsxh-0000000C9ia-1aQk
	for linux-mtd@lists.infradead.org;
	Mon, 05 Jan 2026 22:22:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80E8860010;
	Mon,  5 Jan 2026 22:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A28FC116D0;
	Mon,  5 Jan 2026 22:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767651724;
	bh=Rq6g/l9utXxueKr4jKBRBLc6p6iXOMwYYJrHMGcfRpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FA0w3RziFQZSrAKNxno9GZIZiUbz+WNTw0Oe/g0DlQYqoTyww3K+2pwJ+DyhrF1/J
	 UUtnymDpyI+S0deJTDUwCv0zthhPD7qrOJvgVA8T75oSxjnMDGX/EVNg2j66/Re4+P
	 QHtrkFQNsKiwRPFDfU6FF2WOd5KMpLbNQfMepUaHeibhWAVGikCVFJWs5ZMfcRG/Yh
	 H4zq8puVfbyBcz/DHDyRwQBWxPpeho13zIbUPoeYidZd2pvCAkLfqgFGvLflIYwOf9
	 1JfORXqcYOIB0F1IxLJEfECuld00A/gIfnVcoUqzNWxU7PkZ32GgT4unBK+iTyl3cp
	 qPS4LRiklC6Vg==
Date: Mon, 5 Jan 2026 16:22:03 -0600
From: Rob Herring <robh@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: st,spi-fsm: convert to DT schema
Message-ID: <20260105222203.GA3627973-robh@kernel.org>
References: <20260105-st-fsm-v1-1-d1dd935ccee4@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260105-st-fsm-v1-1-d1dd935ccee4@gmail.com>
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

On Mon, Jan 05, 2026 at 04:07:59PM +0000, Akhila YS wrote:
> Convert STMicroelectronics SPI FSM Serial NOR Flash Controller binding
> to YAML format.

s/YAML/DT Schema/

> 
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
>  .../devicetree/bindings/mtd/st,spi-fsm.yaml        | 72 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/mtd/st-fsm.txt   | 25 --------
>  2 files changed, 72 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/st,spi-fsm.yaml b/Documentation/devicetree/bindings/mtd/st,spi-fsm.yaml
> new file mode 100644
> index 000000000000..f374c6aaa185
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/st,spi-fsm.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/st,spi-fsm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics SPI FSM Serial NOR Flash Controller
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +  - Richard Weinberger <richard@nod.at>

This should be someone with this h/w, not the subsystem maintainers.

> +
> +description:
> +  The STMicroelectronics Fast Sequence Mode (FSM) controller is a dedicated
> +  hardware accelerator integrated in older STiH4xx/STiDxxx set-top box SoCs
> +  (such as STiH407, STiH416, STiD127). It connects directly to a single
> +  external serial flash device used as the primary boot device. The FSM
> +  executes hard-coded or configurable instruction sequences in hardware,
> +  providing low-latency reads suitable for execute-in-place (XIP) boot
> +  and high read bandwidth.
> +
> +properties:
> +  compatible:
> +    const: st,spi-fsm
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: spi-fsm
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  pinctrl-0:
> +    maxItems: 1

Drop. pinctrl properties are implicit.

> +
> +  st,syscfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the system configuration registers used for boot-device selection.
> +
> +  st,boot-device-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Offset of the boot-device register within the st,syscfg node.
> +
> +  st,boot-device-spi:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Expected boot-device value when booting from this SPI controller.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - pinctrl-0
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    spifsm@fe902000 {
> +        compatible = "st,spi-fsm";
> +        reg = <0xfe902000 0x1000>;
> +        reg-names = "spi-fsm";
> +        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +        pinctrl-0 = <&pinctrl_fsm>;
> +        st,syscfg = <&syscfg_rear>;
> +        st,boot-device-reg = <0x958>;
> +        st,boot-device-spi = <0x1a>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/mtd/st-fsm.txt b/Documentation/devicetree/bindings/mtd/st-fsm.txt
> deleted file mode 100644
> index 54cef9ef3083..000000000000
> --- a/Documentation/devicetree/bindings/mtd/st-fsm.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -* ST-Microelectronics SPI FSM Serial (NOR) Flash Controller
> -
> -Required properties:
> -  - compatible : Should be "st,spi-fsm"
> -  - reg        : Contains register's location and length.
> -  - reg-names  : Should contain the reg names "spi-fsm"
> -  - interrupts : The interrupt number
> -  - pinctrl-0  : Standard Pinctrl phandle (see: pinctrl/pinctrl-bindings.txt)
> -
> -Optional properties:
> -  - st,syscfg          : Phandle to boot-device system configuration registers
> -  - st,boot-device-reg : Address of the aforementioned boot-device register(s)
> -  - st,boot-device-spi : Expected boot-device value if booted via this device
> -
> -Example:
> -	spifsm: spifsm@fe902000{
> -	        compatible         = "st,spi-fsm";
> -	        reg                =  <0xfe902000 0x1000>;
> -	        reg-names          = "spi-fsm";
> -	        pinctrl-0          = <&pinctrl_fsm>;
> -		st,syscfg	   = <&syscfg_rear>;
> -	        st,boot-device-reg = <0x958>;
> -	        st,boot-device-spi = <0x1a>;
> -	};
> -
> 
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20251231-st-fsm-84b343517035
> 
> Best regards,
> -- 
> Akhila YS <akhilayalmati@gmail.com>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
