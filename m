Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADF1C2A072
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jan 2026 08:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cbC80Hs4LoX4xyJ2BeQ4akt62/rLc/wKx9ok70SMZU=; b=RTnjPdRyEcd3gf
	qeP8qO7QdrsS108NHW8KkwCJzDhZpzv8NldTiZO8+JEbkSCg3tALHXLqGRGigv9BMCWT1DThp1L7T
	MJrAyjTQwSfVZgS+a9xiKqHBLPDE2wRyQHl/hUr7lZZhAPvLweq6rZgmgRZU9qfdggAdCxUoP++6k
	55gzr3nOzSZhVAYl60P57JVsIlh+S0qQDhF33rcJ4zke8/Nglt1VtMeDwWcOZYC567ugNOvxHC8bq
	uero8Cn3twPhKQzDUfPHDfi86oo0YF0Pi2zlxOvvBIGOSFSvFsUSuF+ILSaRGKLi7MsZAMxZs6LnQ
	oix4DdrNR5vcwabf5zhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfuB-0000000AyuZ-2MLP;
	Mon, 05 Jan 2026 08:25:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfu9-0000000AyuR-2vCK
	for linux-mtd@lists.infradead.org;
	Mon, 05 Jan 2026 08:25:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DF3060010;
	Mon,  5 Jan 2026 08:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698D3C116D0;
	Mon,  5 Jan 2026 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767601532;
	bh=dEuKUiM7enbU5BuBSdWzImGTW/K1m42BcWF1WWhcFAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsbsOeG1CwNZN63c6gvGfWGCY912R4avPoyYt74adRNS+GiECns3CM4IcMiQ/BsGq
	 m2YP54TQnnE+Gii5cH5aw5n7ukmu1QI88t5bzRjaj27csHmG28YaGluQo6Bl10vtsl
	 mWXHgpYqFMlemZ5E1rUncmNp89/dqHbSuNrpi/J/8tv6UnEVwkErPKFYkOZGDGv0rV
	 Aq4hfttZWflZFB7ki2tWjmtu8e4TGmicIxeJihbtnSXUmQhEjg0p3uZzxUZM+506st
	 3VTmpaElQ7GD0MOKui16m6oJ4P9aQ9f1DDfpCj11yq0Bs5oTxnj/X45xbXVbIlMD9X
	 Ad0VLzTwlco0w==
Date: Mon, 5 Jan 2026 09:25:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mtd: microchip,mchp23k256: convert to DT
 schema
Message-ID: <20260105-curvy-demonic-whippet-1704f7@quoll>
References: <20260102-nxp-v2-1-05f5dd947459@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260102-nxp-v2-1-05f5dd947459@gmail.com>
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

On Fri, Jan 02, 2026 at 10:48:50AM +0000, Akhila YS wrote:
> Convert Microchip 23K256 SPI SRAM MTD binding to YAML format.

You changed silently the binding. Every change - like dropping
properties - must be explicitly documented and EXPLAINED WHY in the
commit msg.



> 
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
> Changes in v2:
> - Removed "#address-cells" and "#size-cells" from the required, properties
>   and example. 
> - Changed description and title for yaml.
> - Link to v1: https://lore.kernel.org/r/20251229-nxp-v1-1-a415fe0080a8@gmail.com
> ---
>  .../bindings/mtd/microchip,mchp23k256.txt          | 18 --------
>  .../bindings/mtd/microchip,mchp23k256.yaml         | 49 ++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
> deleted file mode 100644
> index 7328eb92a03c..000000000000
> --- a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -* MTD SPI driver for Microchip 23K256 (and similar) serial SRAM
> -
> -Required properties:
> -- #address-cells, #size-cells : Must be present if the device has sub-nodes
> -  representing partitions.
> -- compatible : Must be one of "microchip,mchp23k256" or "microchip,mchp23lcv1024"
> -- reg : Chip-Select number
> -- spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
> -
> -Example:
> -
> -	spi-sram@0 {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		compatible = "microchip,mchp23k256";
> -		reg = <0>;
> -		spi-max-frequency = <20000000>;
> -	};
> diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.yaml b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.yaml
> new file mode 100644
> index 000000000000..e928d375ae81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/microchip,mchp23k256.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip 23K256 SPI SRAM
> +
> +maintainers:
> +  - Richard Weinberger <richard@nod.at>
> +
> +description:
> +  The Microchip 23K256 is a 256 Kbit (32 Kbyte) serial SRAM with an
> +  SPI interface,supporting clock frequencies up to 20 MHz. It features
> +  a 32-byte page size for writes and supports byte, page, and
> +  sequential access modes.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mchp23k256
> +      - microchip,mchp23lcv1024
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - reg
> +  - compatible
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
> +            compatible = "microchip,mchp23k256";
> +            reg = <0>;
> +            spi-max-frequency = <20000000>;
> +       };

Messed indentation now.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
