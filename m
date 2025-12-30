Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6AEE95A89
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Dec 2025 12:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YB1OalydYRYxWBBsPcdtbgHS0AMEsbv/1nY65uwdoI8=; b=FS874MRPiivqWP
	lJxQEl95lGXgn6Z9m+C3CvICUYtFmwdBtpMAZZhsQJcmvfNUyl7PF7RFvD7xXUPpDvg94yoEtz0K+
	rir0+ZxpT7LJiaLVJIBjFCD9Cx55PXyDMLqOdgyuec+1qdmQSHr/G18lQI+4fBjfyNsFpufNlafEh
	2VzsiaalSzRp8sklHQrEwDweWCb4bV0LPFqSN0d0GKMc3tu6GHHytRq4m0+yhYaDMrovaGbXCiczI
	179E6zMJLfndm3SOWYgacalHBFZ9hWTsAEc0oE6fBpgHQPEWSWqpuPplUuOk5fmn2kmRqkSDbuuj/
	ZWVQLL0p599eCLEMkyNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYu2-00000004nz2-3FcT;
	Tue, 30 Dec 2025 12:32:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYu1-00000004nyv-39gz
	for linux-mtd@lists.infradead.org;
	Tue, 30 Dec 2025 12:32:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C969460018;
	Tue, 30 Dec 2025 12:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED934C4CEFB;
	Tue, 30 Dec 2025 12:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767097960;
	bh=ooyFTLdDrbQcAmZ8GDeW6NgUKDDXOWJg5zX5aLDnNe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UINzatjlwj2jD4a0ktWOmOEUJqyd92UZVK5EEi0sDhtOs1je7sFz8Qr5a5EIDA+io
	 MaAJBoK2jhGzpb5vUW18MBGJnoi5fiEHrO1Tz7RsjharsDRN9ngnPH5C6s728X8EZT
	 HiSNwKVwoTALS1aa754wILkHf+lvqH7LXxzkMug/21ODjkUmuzYlNOCqdg0yndXgdM
	 48+LTpReB6jL660CRfGwEXNbwD/IOgFCcdt1t6ewrYD0Fs85ypfmJIdZM8bR1hyuPl
	 T0uo5n9RMLAMOyGGpmuSliiOq3SPaKcqOHuKhEqYpHTTnRpN/ct0p5xV2Qh51uYEmI
	 Rt68ed0voGtyw==
Date: Tue, 30 Dec 2025 13:32:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: microchip,mchp23k256: convert to DT
 schema
Message-ID: <20251230-kagu-of-scientific-enrichment-6fcd4c@quoll>
References: <20251229-nxp-v1-1-a415fe0080a8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251229-nxp-v1-1-a415fe0080a8@gmail.com>
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

On Mon, Dec 29, 2025 at 12:49:00PM +0000, Akhila YS wrote:
> +---
> +$id: http://devicetree.org/schemas/mtd/microchip,mchp23k256.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip 23K256 (and similar) SPI SRAM MTD driver

driver? Bindings are for hardware.

> +
> +maintainers:
> +  - Richard Weinberger <richard@nod.at>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Driver for Microchip 23K256 and compatible (e.g. 23LCV1024) serial SRAM devices

Don't describe drivers...

> +  accessed via SPI. The device exposes the SRAM as an MTD device and supports
> +  optional partitioning via child nodes.

nor DTS, but the hardware.

> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +

If this is SRAM, then it should go to sram directory. But maybe it is
MTD, so NOR or NAND? If so you would be missing here refs to NAND
chips.

Although docs are saying it is SRAM, so just place it there.

> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mchp23k256
> +      - microchip,mchp23lcv1024
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1

Pretty incomplete. Old binding and above cells claim there can be child
nodes, so please add them and test. Works? No. Shall work? Yes... so
either old binding was incorrect or new binding is incomplete. I did not
check the driver, though.

> +
> +required:
> +  - reg
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - spi-max-frequency
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        sram@0 {
> +            #address-cells = <1>;
> +            #size-cells = <1>;

They are redundant. Where are children?

> +            compatible = "microchip,mchp23k256";
> +            reg = <0>;
> +            spi-max-frequency = <20000000>;
> +        };
> +    };
> +...
> 
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20251229-nxp-526e29da9f29
> 
> Best regards,
> -- 
> Akhila YS <akhilayalmati@gmail.com>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
