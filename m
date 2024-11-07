Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92669D35E5D
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 10:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n8C/O/XrKPWqpraWQad/CPqVxEjLvjfzxB3oW3ZuWaA=; b=QPyNaG9bx8bLAK
	8cqyg2+XpfECbaRUBBBPZegkhsdF2lOz49Pr9hAV2lYRJppT/LtjcwTaJnFjoneJ1LtLK8hRgY8Gt
	umlRfOx/M51UCm8ft69NMqFEZJTK6NXc++xVRaqqmd+v3uKo8hXjVTP8Ycpom/TZuaQMn9dO2ZNGC
	qHyomRwBo1eSH5fR7Fng117I/9pFaoLGmDEDiPGyawPv4/w9KfKX3gtC0FjOfcUfQ0U3E3Ttiv/le
	kzXeJQTEhathdmLlvoLfyY4dMYOkVDTovh4jqlxiDBLft+aEYTXKr1D3NyEiI4wr2AMuSV7foTPLo
	hXuWmmjbNciijifqj40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zgz-00000006SWN-3fTY;
	Thu, 07 Nov 2024 10:24:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zZn-00000006R7U-3OFE
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 10:17:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99E7A5C5653;
	Thu,  7 Nov 2024 10:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A13DC4CED2;
	Thu,  7 Nov 2024 10:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730974639;
	bh=ftccsi9pXS5GYpa1yQsXJVtN5jjl2k8iuGKq2B9q32U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QxSjIUBdjmWTtcRcpmXznk3+uzGx6OZ5MaP2TX2QpIktW0c55qCsSgWRsaDfYQweM
	 341FnzzKv+aeXrcsVWZ98VZhEQBUum4/BB0KyDkHouTN179BqBuo33OrOULgnNRAjh
	 ChLGyerJKxLGrvYmxRToZhkqEd/FtFbwqLtaRz+we03h3FOPh7YlyPwzBOVMz8+70M
	 hMojf8oF8caz1SC7Za8td11CknAeoMMoTnMbx4UmH9PxUJuO2XqKoMFuxaf2EEjp9c
	 bX57oyk8qKYLDjvd1EnG3FJqg7PZB4G5OK6pOYwPJvfKNYS3WfL61CnI9iHZEL4qLu
	 3iv1tBJGKBsyw==
Date: Thu, 7 Nov 2024 11:17:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/2] dt-bindings: mtd: davinci: convert to yaml
Message-ID: <5r6j26qwcxyppxicdqih6tskb2qxkb5phzjtwqv47iqb4qupkp@zxujctq7ot6k>
References: <20241107-ondie-v6-0-f70905dc12bf@gmail.com>
 <20241107-ondie-v6-2-f70905dc12bf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241107-ondie-v6-2-f70905dc12bf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_021719_957450_4DB783E0 
X-CRM114-Status: GOOD (  18.73  )
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

On Thu, Nov 07, 2024 at 10:19:54AM +0100, Marcus Folkesson wrote:
> Convert the bindings to yaml format.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  .../devicetree/bindings/mtd/davinci-nand.txt       |  94 ---------------
>  .../devicetree/bindings/mtd/ti,davinci-nand.yaml   | 134 +++++++++++++++++++++
>  2 files changed, 134 insertions(+), 94 deletions(-)

...

> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,davinci-nand
> +      - ti,keystone-nand
> +
> +  reg:
> +    items:
> +      - description:
> +          Access window.

Merge two lines. See other files how they do it.

> +      - description:
> +          AEMIF control registers

Merge two lines

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

These two properties are not needed, drop. I don't understand why did
they appear here. Changelog also does no explain it.

> +
> +  partitions:
> +    $ref: /schemas/mtd/partitions/partitions.yaml
> +
> +  ti,davinci-chipselect:
> +    description:
> +      Number of chipselect. Indicate on the davinci_nand driver which
> +      chipselect is used for accessing the nand.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +
> +  ti,davinci-mask-ale:
> +    description:
> +      Mask for ALE. Needed for executing address phase. These offset will be
> +      added to the base address for the chip select space the NAND Flash
> +      device is connected to.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x08
> +
> +  ti,davinci-mask-cle:
> +    description:
> +      Mask for CLE. Needed for executing command phase. These offset will be
> +      added to the base address for the chip select space the NAND Flash device
> +      is connected to.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x10
> +
> +  ti,davinci-mask-chipsel:
> +    description:
> +      Mask for chipselect address. Needed to mask addresses for given
> +      chipselect.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +
> +  ti,davinci-ecc-bits:
> +    description: Used ECC bits.
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
> +    description:
> +      Use flash based bad block table support. OOB identifier is saved in OOB
> +      area.
> +    deprecated: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"

Drop these two.

> +  - ti,davinci-chipselect
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    bus {
> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +
> +      nand-controller@2000000,0 {
> +        compatible = "ti,davinci-nand";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0 0x02000000 0x02000000
> +        1 0x00000000 0x00008000>;

Two items must be encoded as two items, so two <> <>
Also messed alignment. See DTS coding style.

> +
> +        ti,davinci-chipselect = <1>;
> +        ti,davinci-mask-ale = <0>;
> +        ti,davinci-mask-cle = <0>;
> +        ti,davinci-mask-chipsel = <0>;
> +
> +        ti,davinci-nand-buswidth = <16>;
> +        ti,davinci-ecc-mode = "hw";
> +        ti,davinci-ecc-bits = <4>;
> +        ti,davinci-nand-use-bbt;
> +
> +        partitions {

Where are the partitions documented? In which binding? Don't you miss
mtd.yaml? I think this binding misses some references, but I am not sure
which ones.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
