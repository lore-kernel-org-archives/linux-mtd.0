Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE4CEE4997
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Dec 2025 18:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Qeaiyj5iQAUUYs53ffaxG4cYMww/FMPHnB/PY2MxtI=; b=Bft80S6I161bV5
	tRwg3QXRe70VOsKqMKbPbbABThEO3wYOApLxT8QfMfpgVTCSN9G6b4HlT0ePZTpRC/aZAAHFs5s9K
	3fJanh6HB0pFClXhBri2WYj2DYOd4qS6qOHXlKNuzj80PCXZ7PYL1Vdo62yqBQGop/WMbAFSvnsbD
	Nudtij/5CXT0faViF5pQpXlFbLpkUulsWx3X4bznzZ8eanFMUFk0GBgUxRlfuaWXysQfue/cLCdDr
	xUiwsDCW8QLjTkok34/6WpyqO3HaST5YFX324ycqSno4f9SjEq9NLeie4pxYdYN82p+XXrZLGGup9
	jeuLY+IPeYg9ozzrO9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaeNK-00000005B2Q-0rsF;
	Tue, 30 Dec 2025 18:23:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaeNI-00000005B2H-2wXC
	for linux-mtd@lists.infradead.org;
	Tue, 30 Dec 2025 18:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC28360017;
	Tue, 30 Dec 2025 18:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE51C4CEFB;
	Tue, 30 Dec 2025 18:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767118995;
	bh=nyXZLufW4YKka3UMN2jMyA/LNOCsvOKVWgmNqovh6Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eC25xIQaYl1HUAmjjNKk205a0PqlUD3x2sAMRmWJ5G0P2A4+EvqSQj4vD10CnPGfb
	 wWz3khCAGiPlRmIeQXEUe85jHcWpYz+aVTt/jnB3X1b1eaqiJKCCaoEhzfIKMD65lA
	 MYkj1TDwuS6Y7Nbk5QSak0XS1BctyGF0B8w7R1sgiB+YwHlCDjOhHHwLBry47obCDn
	 ujpk1nea2yz5mn1qVETiV6cZyPiJLFy/+QOYmzSxcsyF/kmTct1CJgSN4J7/1gtFXx
	 feUkXq9pxHSuWCOMT5NytfYqJ+J8IY15vZL3hm1t4MXs64uml2xtj5I8nztKpInKjD
	 FoIToQVK/n4kA==
Date: Tue, 30 Dec 2025 12:23:14 -0600
From: Rob Herring <robh@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: nand-micronix: convert to DT schema
Message-ID: <20251230182314.GA898179-robh@kernel.org>
References: <20251230-macronix-v1-1-ff2aaab43644@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230-macronix-v1-1-ff2aaab43644@gmail.com>
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

On Tue, Dec 30, 2025 at 07:20:21AM +0000, Akhila YS wrote:
> Convert Macronix NAND Randomizer OTP Enable Property binding to YAML format.

I appreciate the conversion, but please focus on bindings which are 
actually used. We have no in tree users of this property.

There's daily builds which list undocumented (by schemas) compatibles:

https://gitlab.com/robherring/linux-dt/-/jobs?kind=BUILD

This repo has scripts to fetch and parse the logs from the above builds:

https://gitlab.com/robherring/ci-jobs

> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
>  .../devicetree/bindings/mtd/nand-macronix.txt      | 27 --------------
>  .../devicetree/bindings/mtd/nand-macronix.yaml     | 41 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand-macronix.txt b/Documentation/devicetree/bindings/mtd/nand-macronix.txt
> deleted file mode 100644
> index ffab28a2c4d1..000000000000
> --- a/Documentation/devicetree/bindings/mtd/nand-macronix.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Macronix NANDs Device Tree Bindings
> ------------------------------------
> -
> -Macronix NANDs support randomizer operation for scrambling user data,
> -which can be enabled with a SET_FEATURE. The penalty when using the
> -randomizer are subpage accesses prohibited and more time period needed
> -for program operation, i.e., tPROG 300us to 340us (randomizer enabled).
> -Enabling the randomizer is a one time persistent and non reversible
> -operation.
> -
> -For more high-reliability concern, if subpage write is not available
> -with hardware ECC and not enabled at UBI level, then enabling the
> -randomizer is recommended by default by adding a new specific property
> -in children nodes.
> -
> -Required NAND chip properties in children mode:
> -- randomizer enable: should be "mxic,enable-randomizer-otp"
> -
> -Example:
> -
> -	nand: nand-controller@unit-address {
> -
> -		nand@0 {
> -			reg = <0>;
> -			mxic,enable-randomizer-otp;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/mtd/nand-macronix.yaml b/Documentation/devicetree/bindings/mtd/nand-macronix.yaml
> new file mode 100644
> index 000000000000..10f1d58adcef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nand-macronix.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/nand-macronix.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Macronix NAND Randomizer OTP Enable Property
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +  - Richard Weinberger <richard@nod.at>
> +
> +description:
> +  Macronix NAND chips support an optional one-time programmable (OTP)
> +  data randomizer that scrambles user data to improve reliability.
> +  Enabling it is irreversible, prohibits subpage accesses, and slightly
> +  increases program time. This property requests the driver to enable
> +  the randomizer if not already set.
> +
> +properties:
> +  mxic,enable-randomizer-otp:
> +    type: boolean
> +    description:
> +      Presence of this property indicates that the data randomizer should
> +      be enabled in OTP mode on the NAND chip.
> +
> +unevaluatedProperties: false

This would not work unless this is the only property in a node. But this 
schema is never applied to anything without a compatible or node name to 
match on. This property needs to be added to nand-chip.yaml instead.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
