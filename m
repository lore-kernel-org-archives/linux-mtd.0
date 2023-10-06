Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709B4E81E1B
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 16:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JoxD8TqzhlEe6G/LHb1MSPCedM15fCR8iWWxIAXUryk=; b=xGrjb4tKCEvP/B
	kdYAc2wp16U2SUB1ZMDq1lUK98DmawTbvGWpsE6v2ZkNRB2B+ULvco0LGNeMfs7C2/ToIPIegmRRL
	Txh2fjCoBqvmhHQ/RftkB8FFZT9K0uPKagLsht7datSQEMwzdmBXXfqe35qrouidiBW5AoJT9UBUa
	rprsBbq5q+o6awU3itQ76U7ZbpB7BLsnahpDi38faZfekUsc722e5u1PV/vsnMfUy+5VmXf9rdGFA
	pZiaVlxTeCBq7CqZ51KnrBrjEaMoPl7LqBP49H1PgzIegKI5KpHytShAQSiVdqwVFu0gEtzujmbQP
	P2znm3MbFm9z0r368YRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoo9l-006E0T-0G;
	Fri, 06 Oct 2023 16:58:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoo9f-006Dyw-30
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 16:58:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 68311B829FA;
	Fri,  6 Oct 2023 16:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76DDC433C8;
	Fri,  6 Oct 2023 16:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696611501;
	bh=iVc5ncutti07i299unS9e4aBYDPYiKeh0xWAD/nJg+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P080P8RwpkFq/3cYtN9/2Bgq3epTiSizjGICcW6rb4MM1j4YlBtZjaxuY8T6Pq1Sg
	 k+e0QouM67rmzIUS1usTeBsGjqi3ccy+DmB9EV+sfvc00GvvNEUyDCPvoeclnykoWZ
	 eDFRaGGXBZCVu3bcdKuBPDQMK9ZEM2ADLj67o0LW+VY79G0KlYvJUwb4GLyFV8amiM
	 o05vTUU4cqenrymPf//CbBe8p8FfWoEi9QOZnW7jl54DadSzRrLtwZ1pdmM7GGAlH+
	 CuAryxOtFuKptclCp+0JjZ6h1pQrtOXEQjSGm3bQRoThYKlA+84+vrJl+ZBhvRaK4H
	 ee7rEFuPelJmg==
Received: (nullmailer pid 4068792 invoked by uid 1000);
	Fri, 06 Oct 2023 16:58:19 -0000
Date: Fri, 6 Oct 2023 11:58:19 -0500
From: Rob Herring <robh@kernel.org>
To: niravkumar.l.rabara@intel.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mtd: cadence: convert
 cadence-nand-controller.txt to yaml
Message-ID: <20231006165819.GA4066666-robh@kernel.org>
References: <20231005051548.55122-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231005051548.55122-1-niravkumar.l.rabara@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_095824_269089_373612F3 
X-CRM114-Status: GOOD (  26.85  )
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

On Thu, Oct 05, 2023 at 01:15:48PM +0800, niravkumar.l.rabara@intel.com wrote:
> From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> 
> Convert cadence-nand-controller.txt to yaml format.
> Update cadence-nand-controller.txt to cadence,nand.yaml in MAINTAINER file.
> 
> Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> ---
>  .../devicetree/bindings/mtd/cadence,nand.yaml | 73 +++++++++++++++++++

Filename matching compatible.

>  .../bindings/mtd/cadence-nand-controller.txt  | 53 --------------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 74 insertions(+), 54 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cadence,nand.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence,nand.yaml b/Documentation/devicetree/bindings/mtd/cadence,nand.yaml
> new file mode 100644
> index 000000000000..781812ac702f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cadence,nand.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/cadence,nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence NAND controller
> +
> +maintainers:
> +  - Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> +
> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: cdns,hp-nfc
> +
> +  reg:
> +    items:
> +      - description: Address and length of the controller register set
> +      - description: Address and length of the Slave DMA data port
> +
> +  reg-names:
> +    items:
> +      - const: reg
> +      - const: sdma
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 1
> +
> +  cdns,board-delay-ps:
> +    description: |
> +      Estimated Board delay. The value includes the total round trip
> +      delay for the signals and is used for deciding on values associated
> +      with data read capture. The example formula for SDR mode is the
> +      following.
> +      board delay = RE#PAD delay + PCB trace to device + PCB trace from device
> +      + DQ PAD delay
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +      nand-controller@10b80000 {
> +        compatible = "cdns,hp-nfc";
> +        reg = <0x10b80000 0x10000>,
> +            <0x10840000 0x10000>;
> +        reg-names = "reg", "sdma";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        interrupts = <0 97 4>;
> +        clocks = <&nf_clk>;
> +        cdns,board-delay-ps = <4830>;
> +
> +        nand@0 {
> +            reg = <0>;
> +        };
> +      };
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> deleted file mode 100644
> index d2eada5044b2..000000000000
> --- a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -* Cadence NAND controller
> -
> -Required properties:
> -  - compatible : "cdns,hp-nfc"
> -  - reg : Contains two entries, each of which is a tuple consisting of a
> -	  physical address and length. The first entry is the address and
> -	  length of the controller register set. The second entry is the
> -	  address and length of the Slave DMA data port.
> -  - reg-names: should contain "reg" and "sdma"
> -  - #address-cells: should be 1. The cell encodes the chip select connection.
> -  - #size-cells : should be 0.
> -  - interrupts : The interrupt number.
> -  - clocks: phandle of the controller core clock (nf_clk).
> -
> -Optional properties:
> -  - dmas: shall reference DMA channel associated to the NAND controller
> -  - cdns,board-delay-ps : Estimated Board delay. The value includes the total
> -    round trip delay for the signals and is used for deciding on values
> -    associated with data read capture. The example formula for SDR mode is
> -    the following:
> -    board delay = RE#PAD delay + PCB trace to device + PCB trace from device
> -    + DQ PAD delay
> -
> -Child nodes represent the available NAND chips.
> -
> -Required properties of NAND chips:
> -  - reg: shall contain the native Chip Select ids from 0 to max supported by
> -    the cadence nand flash controller
> -
> -See Documentation/devicetree/bindings/mtd/nand-controller.yaml for more details on
> -generic bindings.
> -
> -Example:
> -
> -nand_controller: nand-controller@60000000 {
> -	  compatible = "cdns,hp-nfc";
> -	  #address-cells = <1>;
> -	  #size-cells = <0>;
> -	  reg = <0x60000000 0x10000>, <0x80000000 0x10000>;
> -	  reg-names = "reg", "sdma";
> -	  clocks = <&nf_clk>;
> -	  cdns,board-delay-ps = <4830>;
> -	  interrupts = <2 0>;
> -	  nand@0 {
> -	      reg = <0>;
> -	      label = "nand-1";
> -	  };
> -	  nand@1 {
> -	      reg = <1>;
> -	      label = "nand-2";
> -	  };
> -
> -};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..502963390646 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4474,7 +4474,7 @@ F:	drivers/media/platform/cadence/cdns-csi2*
>  CADENCE NAND DRIVER
>  L:	linux-mtd@lists.infradead.org
>  S:	Orphan
> -F:	Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> +F:	Documentation/devicetree/bindings/mtd/cadence,nand.yaml
>  F:	drivers/mtd/nand/raw/cadence-nand-controller.c
>  
>  CADENCE USB3 DRD IP DRIVER
> -- 
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
