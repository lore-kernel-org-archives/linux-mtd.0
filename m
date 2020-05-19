Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEB0C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 18:44:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE3EB207D3
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 18:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jLmY5Joa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE3EB207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IReRiGXLNSYAKWoc1ip6kYwSnu0eGGa4tAHeaJitDgI=; b=jLmY5JoabXkAKn
	dAPtvYIZXfyc1i6Wxy1DFBwZPmKcA6Q/mhf4x+ME5ZEzt4gIeuFScSuALnJsbzhOFjEnmH0q8agwC
	E0HLma+xrRHjZsnSASjy3kIGPkfdy45ghGnsULxXiE6Qs2I8IJ2BRItuQqukUnKIVBXedewLQU5Bz
	Ky/HcoobUFYMH7ldjIQTbJYWpRuqdtwAYTJOScEXCWCw7OBpzznUQfr7KJ0RU7ZPY+I0U+AVN5pEg
	tCuFk53mJWQULeVjJ0O2fgvPHd4yBU/lPqQBrwVS6fcQPWuoudX9nSvtbMcywRGM1ULha5eUe4n7Y
	dbfhDFbZgX7jZA2sMLMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb7Dw-00013S-Rv; Tue, 19 May 2020 18:44:20 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb7Du-00012U-3q
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 18:44:19 +0000
Received: by mail-io1-f67.google.com with SMTP id e18so254021iog.9
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2020 11:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oKuBz8CT4YNMj4ZnHpQjCUGYGAJGXHvYzlhr9H8ejRA=;
 b=kGYkw237jaPPF4xaq5lYAWTy/5ANvgfHcj28dyhV8QvLPFqeRMCcIwL3BaUTQ80q5P
 iaUDRNXTRKLyVNVDv1M+Bhis4War3SRxGN6PbPutF1iyp817dhD8JuBVMEnIFQBckFRy
 6dZ3ELOUQbtjzvR1ncnchBuyecdzGrBPKUFemClIAwd8fsmtGCbhBMbtXLWeuZLUeYEX
 InzjexgA477OQN1tUrTlf5qtsPwHvXxcQza2aoRCWCTgSmO8MJgJlE4Z3vJsBWGYOS88
 /LfbFdks3W4LL2EsH3kXO5MVwKkvxkrEF5LXrYslSmsgkTfZ2PxI9TPfW7+WeGYJ5Oo3
 OR6A==
X-Gm-Message-State: AOAM533DiWS/AiN9OszFmgWCZ1MC30qXEs6mXE9iBueLNFDz1aNrMGE+
 wZ29EsAg62XHw4jp2pXOHQ==
X-Google-Smtp-Source: ABdhPJw2lGHq+eIu05e783dq35VMFsu2OhQXKoEWACYt2JqvIlpVB8GFIMm53lfTjTenTunwatMR+A==
X-Received: by 2002:a05:6638:44e:: with SMTP id
 r14mr1046656jap.53.1589913857137; 
 Tue, 19 May 2020 11:44:17 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id k16sm182001iog.14.2020.05.19.11.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 11:44:16 -0700 (PDT)
Received: (nullmailer pid 452653 invoked by uid 1000);
 Tue, 19 May 2020 18:44:15 -0000
Date: Tue, 19 May 2020 12:44:15 -0600
From: Rob Herring <robh@kernel.org>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v1] dt-bindings: spi: Add schema for Cadence QSPI
 Controller driver
Message-ID: <20200519184415.GA441457@bogus>
References: <20200512004919.40685-1-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512004919.40685-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_114418_156916_69B623B1 
X-CRM114-Status: GOOD (  26.35  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, qi-ming.wu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, May 12, 2020 at 08:49:19AM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add dt-bindings documentation for Cadence-QSPI controller to support
> spi based flash memories.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/cadence-quadspi.txt    |  67 -----------
>  .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 127 +++++++++++++++++++++
>  2 files changed, 127 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
>  create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> deleted file mode 100644
> index 945be7d5b236..000000000000
> --- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -* Cadence Quad SPI controller
> -
> -Required properties:
> -- compatible : should be one of the following:
> -	Generic default - "cdns,qspi-nor".
> -	For TI 66AK2G SoC - "ti,k2g-qspi", "cdns,qspi-nor".
> -	For TI AM654 SoC  - "ti,am654-ospi", "cdns,qspi-nor".
> -- reg : Contains two entries, each of which is a tuple consisting of a
> -	physical address and length. The first entry is the address and
> -	length of the controller register set. The second entry is the
> -	address and length of the QSPI Controller data area.
> -- interrupts : Unit interrupt specifier for the controller interrupt.
> -- clocks : phandle to the Quad SPI clock.
> -- cdns,fifo-depth : Size of the data FIFO in words.
> -- cdns,fifo-width : Bus width of the data FIFO in bytes.
> -- cdns,trigger-address : 32-bit indirect AHB trigger address.
> -
> -Optional properties:
> -- cdns,is-decoded-cs : Flag to indicate whether decoder is used or not.
> -- cdns,rclk-en : Flag to indicate that QSPI return clock is used to latch
> -  the read data rather than the QSPI clock. Make sure that QSPI return
> -  clock is populated on the board before using this property.
> -
> -Optional subnodes:
> -Subnodes of the Cadence Quad SPI controller are spi slave nodes with additional
> -custom properties:
> -- cdns,read-delay : Delay for read capture logic, in clock cycles
> -- cdns,tshsl-ns : Delay in nanoseconds for the length that the master
> -                  mode chip select outputs are de-asserted between
> -		  transactions.
> -- cdns,tsd2d-ns : Delay in nanoseconds between one chip select being
> -                  de-activated and the activation of another.
> -- cdns,tchsh-ns : Delay in nanoseconds between last bit of current
> -                  transaction and deasserting the device chip select
> -		  (qspi_n_ss_out).
> -- cdns,tslch-ns : Delay in nanoseconds between setting qspi_n_ss_out low
> -                  and first bit transfer.
> -- resets	: Must contain an entry for each entry in reset-names.
> -		  See ../reset/reset.txt for details.
> -- reset-names	: Must include either "qspi" and/or "qspi-ocp".
> -
> -Example:
> -
> -	qspi: spi@ff705000 {
> -		compatible = "cdns,qspi-nor";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		reg = <0xff705000 0x1000>,
> -		      <0xffa00000 0x1000>;
> -		interrupts = <0 151 4>;
> -		clocks = <&qspi_clk>;
> -		cdns,is-decoded-cs;
> -		cdns,fifo-depth = <128>;
> -		cdns,fifo-width = <4>;
> -		cdns,trigger-address = <0x00000000>;
> -		resets = <&rst QSPI_RESET>, <&rst QSPI_OCP_RESET>;
> -		reset-names = "qspi", "qspi-ocp";
> -
> -		flash0: n25q00@0 {
> -			...
> -			cdns,read-delay = <4>;
> -			cdns,tshsl-ns = <50>;
> -			cdns,tsd2d-ns = <50>;
> -			cdns,tchsh-ns = <4>;
> -			cdns,tslch-ns = <4>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> new file mode 100644
> index 000000000000..28112b38e6a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Cadence QSPI Flash Controller support
> +
> +maintainers:
> +  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> +
> +allOf:
> +  - $ref: "spi-controller.yaml#"
> +
> +description: |
> +  Binding Documentation for Cadence QSPI controller,This controller is
> +  present in the Intel LGM, Altera SoCFPGA and TI SoCs and this driver
> +  has been tested On Intel's LGM SoC.
> +
> +properties:
> +  compatible:
> +     enum:
> +       - cdns,qspi-nor
> +       - ti,k2g-qspi
> +       - ti,am654-ospi
> +       - intel,lgm-qspi
> +
> +  reg:
> +    maxItems: 2

Need to define what each entry is.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  cdns,fifo-depth:
> +    description:
> +     Depth of hardware FIFOs.

...FIFO in words.

> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +      - enum: [ 128, 256 ]
> +      - default: 128
> +
> +  cdns,fifo-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      4 byte bus width of the data FIFO in bytes.

Constraints? Perhaps:

multipleOf: 4

if an enum doesn't work here.

> +
> +  cdns,trigger-address:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      32-bit indirect AHB trigger address.
> +
> +  cdns,rclk-en:
> +    type: boolean
> +    description: |
> +      Flag to indicate that QSPI return clock is used to latch the read data
> +      rather than the QSPI clock. Make sure that QSPI return clock is populated
> +      on the board before using this property.
> +
> +# subnode's properties
> +patternProperties:
> +  "^.*@[0-9a-fa-f]+$":

'a-f' is twice. What's the max number of chip selects? If less than 10, 
then '@[0-9]$' is enough. '^.*' can be dropped too.

> +    type: object
> +    description:
> +      flash device uses the subnodes below defined properties.
> +
> +  cdns,read-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Delay for read capture logic, in clock cycles.
> +
> +  cdns,tshsl-ns:
> +    description: |
> +      Delay in nanoseconds for the length that the master mode chip select
> +      outputs are de-asserted between transactions.
> +
> +  cdns,tsd2d-ns:
> +    description: |
> +      Delay in nanoseconds between one chip select being de-activated
> +      and the activation of another.
> +
> +  cdns,tchsh-ns:
> +    description: |
> +      Delay in nanoseconds between last bit of current transaction and
> +      deasserting the device chip select (qspi_n_ss_out).
> +
> +  cdns,tslch-ns:
> +    description: |
> +      Delay in nanoseconds between setting qspi_n_ss_out low and
> +      first bit transfer.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - cdns,fifo-depth
> +  - cdns,fifo-width
> +  - cdns,trigger-address
> +
> +examples:
> +  - |
> +    spi@ff705000 {
> +          compatible = "cdns,qspi-nor";
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          reg = <0xff705000 0x1000>,
> +                <0xffa00000 0x1000>;

Seems kind of small for a data area if this is like most SPI flash 
controllers.

> +          interrupts = <0 151 4>;
> +          clocks = <&qspi_clk>;
> +          cdns,fifo-depth = <128>;
> +          cdns,fifo-width = <4>;
> +          cdns,trigger-address = <0x00000000>;
> +
> +          flash@0 {
> +              compatible = "jedec,spi-nor";
> +              reg = <0x0>;
> +              cdns,read-delay = <4>;
> +              cdns,tshsl-ns = <50>;
> +              cdns,tsd2d-ns = <50>;
> +              cdns,tchsh-ns = <4>;
> +              cdns,tslch-ns = <4>;
> +          };
> +    };
> +
> -- 
> 2.11.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
