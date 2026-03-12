Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16A01067044
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 15:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBlhNXEd2sR0++IfkN7DAlVHXVaveFqER+5a7Tnquqw=; b=SN4GS7tthdJnKX
	f5j7Ntj9upwC3tbzY//XJEnOEbHD1FeSKD6TBSGUXBJAoQUASUncgEvyliXn5nlXavkrh6d3fJseG
	AhC8gGRMFZsGH7agaKSvcSz9hi7YnJr8aGCUnsVeJkfzpT/eEpp3ePBLWu6Mp+I5pUQhLQQ7dwd0O
	5GJBud0D5jxmDi/JTbJXwImUqiBdqk9v2f3cR6/2o/JTQSro6JtEPzUajZFq8FbhGQW5y1kLYCfIe
	MXci5TpPask0ghLzALYHnGRkXvn1Bt2t446NLBIJf18FkgklVphFoED1l+F5K0CLdjtw35OV7Vx1p
	T63yyJQMPUIooIB80NTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hy4-0000000ENjZ-3RAM;
	Thu, 12 Mar 2026 15:28:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hy2-0000000ENiO-0ZJm
	for linux-mtd@lists.infradead.org;
	Thu, 12 Mar 2026 15:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A782140199;
	Thu, 12 Mar 2026 15:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1E6C4CEF7;
	Thu, 12 Mar 2026 15:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773329332;
	bh=evlB7UmYgfXR0LeObfNN35XybfXOCZeXbvVto+3/lcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFodYMLyNAGPQXugwNFC72H1iGvqR3UrCJVMCOPPy8Mto5tlMsMz+Y0leMQsoppvi
	 FZBoZgaILr9+s0zmv6f1PTedIvH6FbNOYFjUS/sOfeBXJUHwvQ+qsDkA60SGKRptAW
	 WHB5A0kLVm7eDLMndht6nDye7g1VvFmOXkOMpLn+a/02eQ5OSVRecdXiDiennCAYep
	 MloOn9u7q3U9uDY5k6Zik/SqOFsbiFhvZwLxpMli8s2yPm6rEcbXi9o4OrzpoO3vqX
	 mCRgdGtbI/rjC7h0lQhuxM7FSabdYQiU5JB5CuX3x+PLfXnGy/xl0fXYeVDBukXewO
	 SvuEmIZxkQaTg==
Date: Thu, 12 Mar 2026 10:28:51 -0500
From: Rob Herring <robh@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: hisilicon,504-nfc: convert to DT schema
Message-ID: <20260312152851.GA3190071-robh@kernel.org>
References: <20260307-hisi504-1-v1-1-8bf9a186faf2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260307-hisi504-1-v1-1-8bf9a186faf2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_082854_660848_0AD7204A 
X-CRM114-Status: GOOD (  20.82  )
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

On Sat, Mar 07, 2026 at 04:43:56PM +0000, Akhila YS wrote:
> Convert Hisilicon Hip04 Soc NAND controller DT binding to YAML format.
> 
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
>  .../devicetree/bindings/mtd/hisilicon,504-nfc.yaml | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)

Convert implies the removal of the .txt binding. Where is that? Could be 
missing? If so, say that.

> 
> diff --git a/Documentation/devicetree/bindings/mtd/hisilicon,504-nfc.yaml b/Documentation/devicetree/bindings/mtd/hisilicon,504-nfc.yaml
> new file mode 100644
> index 000000000000..805ef0af0e04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/hisilicon,504-nfc.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/hisilicon,504-nfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HiSilicon Hip04 NAND Flash Controller
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +  - Richard Weinberger <richard@nod.at>

This should be someone with the h/w. I would use the HiSilicon 
maintainer from MAINTAINERS.

> +
> +description:
> +  The HiSilicon 504 NFC is a NAND flash memory controller used in the
> +  Hip04 SoC. It supports hardware ECC for NAND devices and provides
> +  register and buffer regions for NAND operations.
> +
> +allOf:
> +  - $ref: nand-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: hisilicon,504-nfc
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2

Need to define what each entry is.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  nand-bus-width:
> +    enum: [8, 16]
> +
> +  nand-ecc-mode:
> +    enum:
> +      - none
> +      - hw
> +
> +  nand-ecc-strength:
> +    const: 16
> +
> +  nand-ecc-step-size:
> +    const: 1024
> +

> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

These can be dropped as the child (partitions) doesn't have an address.

> +
> +  partitions:
> +    $ref: /schemas/mtd/partitions/fixed-partitions.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - nand-bus-width
> +  - nand-ecc-mode
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    nand-controller@4020000 {
> +        compatible = "hisilicon,504-nfc";
> +        reg = <0x04020000 0x10000>, <0x05000000 0x1000>;
> +        interrupts = <0 379 4>;
> +        nand-bus-width = <8>;
> +        nand-ecc-mode = "hw";
> +        nand-ecc-strength = <16>;
> +        nand-ecc-step-size = <1024>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        partitions {
> +             compatible = "fixed-partitions";
> +             #address-cells = <1>;
> +             #size-cells = <1>;
> +
> +             partition@0 {
> +                 label = "nand_text";
> +                 reg = <0x0 0x400000>;
> +            };
> +        };
> +    };
> +...
> 
> ---
> base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
> change-id: 20260306-hisi504-1-d7aa09c70d93
> 
> Best regards,
> -- 
> Akhila YS <akhilayalmati@gmail.com>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
