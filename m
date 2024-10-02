Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E86CEB2E0
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 17:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/0byp+1MLpcsaoxOT3pseaf4sFmK4Q0je+zjxLEm+g=; b=AtQtSs1nLhiSOV
	Ug8BlnsZTRpgELa70ZwAvwT2PrW2QDSAcnLOXdi/4oI5NgGBYdWL8wTEuOB3oKTb4AbP7mk2dZA2i
	diBWhBUgmw6+t3N8yRBa/0+FqevVoQ1cOxoC492D0vjvtnquf9g1LLoU6YuG44M3Gz6trSc1IQ7mR
	SPVUR5bdT1RX8qITZe+O+JB1MXYpgcjnXHSWyJSbeWiXeXbeQzeHddI7B6ZzBoKVpS/PL2eSaeLxj
	+qd2ofMKMRXlG+GXpynuu/TGlY9FAFNGjzfUdm827UovVLSYAB/y+c3QpI0/R8RHp4RiWBoeELj58
	dDO2j0d1BHI8tMaKaX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw3An-000000073Yk-1jRi;
	Wed, 02 Oct 2024 17:30:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw3Ak-000000073YO-1G3w
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 17:29:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 656925C045A;
	Wed,  2 Oct 2024 17:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88CEC4CECD;
	Wed,  2 Oct 2024 17:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727890196;
	bh=euTbIsusSo0TN7GQC3gr8HVYHu0/z+hrLKfLWfB/pHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LgWwaYDl6Js4BsVRqODHfKzyEdBFSRxhFJzHY67W9nVfKtVPfnkm3QsZUZfXEL4Pf
	 XjA5UCvfqKpSMXVnb+FCFqBaWJSLjDkEgFYuwhYhqpTnE4FcKD6pCKRr5fI97rQ5nR
	 Nv+kbr8LZAa2digbaNtZR/BP0NtRcjCkhbqYUfe16SPPQjsixGqG5WZqByvL7QEuvb
	 ScQTuam4gy7UCU43ba7kKlrJ8gD+AytEwUpCUwP0joc/2uxS95x1WMid/MB/034DLx
	 cl3KWrw4zP3tva75Kt8SpQjotqFieejQUo20L/GGrIhzsfwDollxDzoHzYg5eNZ+LI
	 YR6vAxHblfXnQ==
Date: Wed, 2 Oct 2024 12:29:54 -0500
From: Rob Herring <robh@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: mtd: davinci: convert to yaml
Message-ID: <20241002172954.GA1001788-robh@kernel.org>
References: <20241002-ondie-v2-0-318156d8c7b4@gmail.com>
 <20241002-ondie-v2-2-318156d8c7b4@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241002-ondie-v2-2-318156d8c7b4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_102958_450260_D36B22EF 
X-CRM114-Status: GOOD (  20.98  )
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

On Wed, Oct 02, 2024 at 11:01:31AM +0200, Marcus Folkesson wrote:
> Convert the bindings to yaml format.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  .../devicetree/bindings/mtd/davinci-nand.txt       |  94 ------------------
>  .../devicetree/bindings/mtd/ti,davinci-nand.yaml   | 105 +++++++++++++++++++++
>  2 files changed, 105 insertions(+), 94 deletions(-)
> 

> diff --git a/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml b/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c0e09cccea8e65a6fcb98291c0cee0db56a97def
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI DaVinci NAND controller
> +
> +maintainers:
> +  - Marcus Folkesson <marcus.folkesson@gmail.com>
> +
> +allOf:
> +  - $ref: nand-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,davinci-nand
> +      - ti,keystone-nand
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,davinci-chipselect:
> +    description: |

Don't need '|' if no formatting.

> +      Number of chipselect. Indicate on the davinci_nand
> +      driver which chipselect is used for accessing
> +      the nand.

Wrap lines at 80 char.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +
> +  ti,davinci-mask-ale:
> +    description: |
> +      Mask for ALE. Needed for executing address
> +      phase. These offset will be added to the base
> +      address for the chip select space the NAND Flash
> +      device is connected to.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x08
> +
> +  ti,davinci-mask-cle:
> +    description: |
> +      Mask for CLE. Needed for executing command
> +      phase. These offset will be added to the base
> +      address for the chip select space the NAND Flash
> +      device is connected to.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x10
> +
> +  ti,davinci-mask-chipsel:
> +    description: |
> +      Mask for chipselect address. Needed to mask
> +      addresses for given chipselect.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +
> +  ti,davinci-ecc-bits:
> +    description: Used ECC bits.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 4]
> +
> +  ti,davinci-ecc-mode:
> +    description: Operation mode of the NAND ECC mode.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [none, soft, hw, on-die]
> +    deprecated: true
> +
> +  ti,davinci-nand-buswidth:
> +    description: Bus width to the NAND chip
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [8, 16]
> +    default: 8
> +    deprecated: true
> +
> +  ti,davinci-nand-use-bbt:
> +    type: boolean
> +    description: |
> +      Use flash based bad block table support. OOB
> +      identifier is saved in OOB area.
> +    deprecated: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - ti,davinci-chipselect
> +
> +examples:
> +  - |
> +    nand_cs3@62000000 {

nand-controller@...

> +    compatible = "ti,davinci-nand";
> +    reg = <0x62000000 0x807ff
> +    0x68000000 0x8000>;
> +    ti,davinci-chipselect = <1>;
> +    ti,davinci-mask-ale = <0>;
> +    ti,davinci-mask-cle = <0>;
> +    ti,davinci-mask-chipsel = <0>;
> +    nand-ecc-mode = "hw";
> +    ti,davinci-ecc-bits = <4>;
> +    nand-on-flash-bbt;

Wrong indentation.

> +
> +        partition@180000 {
> +            label = "ubifs";
> +            reg = <0x180000 0x7e80000>;
> +        };
> +    };
> 
> -- 
> 2.46.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
