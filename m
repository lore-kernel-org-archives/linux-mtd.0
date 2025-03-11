Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD552C282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Mar 2025 15:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=up3nByDCoQluSRno+Y+ziVMYSBM1dQGPbJF9oW8Acd0=; b=46a6ab4bnyMuPB
	zTJVZQDeoSo+WAkIFg74youbCq+EFRaij1BBo4wKGsJFQXQh++Lfq1PybSzAEJcvql95N2GEHHD6m
	kIIRzXhPABMiwgsIRZWzLUt7UsO0Dle1ZVGCqhA5DfHfiCcyiNfMePFKarGlvC9FDMAvDyXIQVAFF
	PgzF/32JlzqoQmH3BerEHRi+NeIftJIi6Cf4zwWLCUq+NWycaF5RDmxbwpwW/pDuN+kAbKK+EsGG7
	ealdQO3nDPaC86AF+BNGIt5+J09w0C8WcW/zE36s9Nk32lNtHxSq/HCgIhOOUKmxNvz3rt3Q9Ws7I
	jgRPO8ToZb9710HDQaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1XC-000000069QL-3n6G;
	Tue, 11 Mar 2025 15:28:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1VX-0000000699S-2nGi;
	Tue, 11 Mar 2025 15:27:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ABF1DA4385A;
	Tue, 11 Mar 2025 15:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33633C4CEF0;
	Tue, 11 Mar 2025 15:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741706822;
	bh=N5pBHs40qF4tSGmpD9K2uV1M+O09K7VOkhy8h8RS8Cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GWk1KiOh3m6e+EycK2ezspHCiAKChk9bAQpHOkzhS+et6nLFjCIGFUTniCV2PhePq
	 2UV2jTRAGNhmVy7lVbO0o0CVx/Rk+xRcuYSyLYI8lUZYDtiCnRt2lQyg+PNNRkU/rE
	 YXZcXw7MiCZF1kXQroKTsBm9YIr02t4KLz18Pk6zMimjPLD447Gix4kv1o1d3HHtHj
	 UXKmfDmec0HR2/xkk1x9feLXyPzUJSqoQnTur7F3SuQZaobAq3xxeWr+8ZqWQxfPyp
	 I7wRUWw+pTdq8pKvykzlO5KEkOOVzSi5I27oTo/7F00LQnSFC3NC9Jb7TzFRXz1XNU
	 bzUpsOPq8Vk1Q==
Date: Tue, 11 Mar 2025 10:27:00 -0500
From: Rob Herring <robh@kernel.org>
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, krzysztof.kozlowski+dt@linaro.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: mtd: microchip-nand: add atmel pmecc
Message-ID: <20250311152700.GA3573545-robh@kernel.org>
References: <20250311122847.90081-1-balamanikandan.gunasundar@microchip.com>
 <20250311122847.90081-3-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250311122847.90081-3-balamanikandan.gunasundar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_082703_831254_207D64D5 
X-CRM114-Status: GOOD (  25.89  )
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

On Tue, Mar 11, 2025 at 05:58:46PM +0530, Balamanikandan Gunasundar wrote:
> Add bindings for programmable multibit error correction code controller
> (PMECC).
> 
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> ---
> 
> Changes in v2:
> - Rename filename to match compatible string
> - Add constraints for sam9x7
> - Droped unused dt labels 
> 
> .../devicetree/bindings/mtd/atmel-nand.txt    | 61 -----------------
>  .../bindings/mtd/microchip,pmecc.yaml         | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 61 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index dbbc17a866f2..1934614a9298 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -1,64 +1,3 @@
> -* ECC engine (PMECC) bindings:
> -
> -Required properties:
> -- compatible: should be one of the following
> -	"atmel,at91sam9g45-pmecc"
> -	"atmel,sama5d4-pmecc"
> -	"atmel,sama5d2-pmecc"
> -	"microchip,sam9x60-pmecc"
> -	"microchip,sam9x7-pmecc", "atmel,at91sam9g45-pmecc"
> -- reg: should contain 2 register ranges. The first one is pointing to the PMECC
> -       block, and the second one to the PMECC_ERRLOC block.
> -
> -Example:
> -
> -	nfc_io: nfc-io@70000000 {
> -		compatible = "atmel,sama5d3-nfc-io", "syscon";
> -		reg = <0x70000000 0x8000000>;
> -	};
> -
> -	pmecc: ecc-engine@ffffc070 {
> -		compatible = "atmel,at91sam9g45-pmecc";
> -                reg = <0xffffc070 0x490>,
> -                      <0xffffc500 0x100>;
> -	};
> -
> -	ebi: ebi@10000000 {
> -		compatible = "atmel,sama5d3-ebi";
> -		#address-cells = <2>;
> -		#size-cells = <1>;
> -		atmel,smc = <&hsmc>;
> -		reg = <0x10000000 0x10000000
> -		       0x40000000 0x30000000>;
> -		ranges = <0x0 0x0 0x10000000 0x10000000
> -			  0x1 0x0 0x40000000 0x10000000
> -			  0x2 0x0 0x50000000 0x10000000
> -			  0x3 0x0 0x60000000 0x10000000>;
> -		clocks = <&mck>;
> -
> -                nand_controller: nand-controller {
> -			compatible = "atmel,sama5d3-nand-controller";
> -			atmel,nfc-sram = <&nfc_sram>;
> -			atmel,nfc-io = <&nfc_io>;
> -			ecc-engine = <&pmecc>;
> -			#address-cells = <2>;
> -			#size-cells = <1>;
> -			ranges;
> -
> -			nand@3 {
> -				reg = <0x3 0x0 0x800000>;
> -				atmel,rb = <0>;
> -
> -				/*
> -				 * Put generic NAND/MTD properties and
> -				 * subnodes here.
> -				 */
> -			};
> -		};
> -	};
> -
> ------------------------------------------------------------------------
> -
>  Deprecated bindings (should not be used in new device trees):
>  
>  Required properties:
> diff --git a/Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml b/Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml
> new file mode 100644
> index 000000000000..98260a691a2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/microchip,pmecc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip pmecc controller
> +
> +maintainers:
> +  - Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> +
> +description: |

Don't need '|' if no formatting to preserve.

> +  Bindings for microchip Programmable Multibit Error Correction Code
> +  Controller (PMECC). pmecc is a programmable BCH encoder/decoder. This
> +  block is passed as the value to the "ecc-engine" property of microchip
> +  nand flash controller node.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - atmel,at91sam9g45-pmecc
> +          - atmel,sama5d2-pmecc
> +          - atmel,sama5d4-pmecc
> +          - microchip,sam9x60-pmecc
> +          - microchip,sam9x7-pmecc

Both alone and with a fallback should not be allowed. Pick one. A 
fallback is only useful if there's a driver/client that only understands 
the fallback and would work with the new implementation. IOW, if 'they 
are the same'.

> +      - items:
> +          - const: microchip,sam9x7-pmecc
> +          - const: atmel,at91sam9g45-pmecc
> +      - items:
> +          - const: microchip,sam9x60-pmecc
> +          - const: atmel,at91sam9g45-pmecc

Combine the last 2 'items' to 1 as the fallback is the same for both.

> +
> +  reg:
> +    items:
> +      - description: Base address and size of PMECC controller registers
> +      - description: Base address and size of PMECC_ERRLOC controller

Drop 'Base address and size of '.

> +
> +  clocks:
> +    description: The clock source for pmecc controller

For a single clock, what else would it be? Drop.

> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: microchip,sam9x7-pmecc
> +    then:
> +      properties:
> +        clocks:
> +          description: The clock source for pmecc controller

What's the purpose of this if/then? It doesn't do anything.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    ecc-engine@ffffc070 {
> +        compatible = "microchip,sam9x7-pmecc";
> +        reg = <0xffffe000 0x300>,
> +              <0xffffe600 0x100>;
> +        clocks = <&pmc 2 48>;
> +    };
> -- 
> 2.34.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
