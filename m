Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0F5F54AD6
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2026 01:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYCsepnVuuyzAQnh4ugWgMxbE+XU6l4BNqBnmJpoWXY=; b=uhGaoR5XlYtj3k
	UE1ekAumjcp3jO8RxnYXcjWBxOiv74AawX7h7oUxchn4puc27/12QsBGMj/SuUxGryIiz2vTNPePQ
	T6sakY9F3IpgQa3TgDWe/55FU1nefFW6Zdj783TOGYkaGm9bHgY1ExykSgsERF31LOAL4h8XicZGT
	2iDE77dwbwengDvcNyemDb3EQzHbwfzMOFlAmdXyIpsV3hREStKf3XtEtmj4ZeIZIfmL7rYzntWji
	XwDwc0yioSMd4E0CPxePKEWNZEAKQX7D+6N2lLfRX2k2ouKct/gYESaAN/7Q5z1kxodXK/jD2h3xy
	zBCPTzOlHjEH7g0N50GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ckz-00000002RAk-0ZcN;
	Wed, 25 Mar 2026 01:10:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ckw-00000002RA5-0vOx
	for linux-mtd@lists.infradead.org;
	Wed, 25 Mar 2026 01:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 931A443FDB;
	Wed, 25 Mar 2026 01:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43292C19424;
	Wed, 25 Mar 2026 01:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774400997;
	bh=YfBBgt1syU0ry/vvqRH6IoZ65DUjX8qoIovBPDPsdXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ji+MW3K55lmJ/YNUuQrJr97TBLTEsc2U0T04+aUZB1uLqa8Dv6DO04oUZy0v1SOVZ
	 p6/uPKBgh3Z3ibY09+mxnblC/vSpYadRvFQQ+gKed3LBTmtLdUf0WnY4E+2krHp9BV
	 6jiImP8ZVrdAMzv+/Wr2bnnrVrgxVF4NLER4UM5mwhnS8JxQe0w/beSVlIJgNDMaYh
	 nygmULv9Bq66XM2OoCVcCvkSU9pZzHqkjxoplI9/7c1mmJT5jfPiYD9WVOcwylzzfN
	 emwnYRAqUAZybDz2IwhZPhVrHliMLsmL76gZ+xLeIcOL1GAWGC/xfsMcOz81LAofcA
	 tuj8G6mSX46qA==
Date: Tue, 24 Mar 2026 20:09:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mtd: refactor NAND bindings and add
 nand-controller-legacy.yaml
Message-ID: <177440099590.2332534.9132007696467343522.robh@kernel.org>
References: <20260324221624.2424092-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260324221624.2424092-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_180958_309740_736C275B 
X-CRM114-Status: GOOD (  20.50  )
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


On Tue, 24 Mar 2026 18:16:18 -0400, Frank Li wrote:
> The modern NAND controller binding requires NAND chips to be described as
> child nodes of the controller, for example:
> 
>   nand-controller {
>           ...
>           nand@0 {
>                   /* raw NAND chip properties */
>           };
>   };
> 
> However, many existing device trees place NAND chip properties directly
> within the controller node because those controllers support only a single
> chip. This layout is still widely used by older platforms and by other DT
> consumers such as U-Boot. Migrating all existing users to the new layout
> will take time.
> 
> Several kernel drivers, such as ams-delta.c, davinci_nand.c and
> fsmc_nand.c, still expect the legacy layout where raw NAND properties are
> defined in the controller node.
> 
> To support both layouts during the transition:
> 
> - Extract NAND chip-related properties into separate schemas
>   (nand-property.yaml and raw-nand-property.yaml) from
>   nand-chip.yaml and raw-nand-chip.yaml.
> - Introduce nand-controller-legacy.yaml to allow both the
>   legacy and modern layouts.
> - Add a select condition in nand-controller.yaml to prevent
>   node name pattern matching for fsl,* NAND controllers.
> 
> Keep compatibility with existing device trees while allowing gradual
> migration to the modern binding structure.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - use select: false
> - s/under/within/
> - s/property/properties/
> 
> two problem left:
> 1. about "^nand@[a-f0-9]$" in nand-controller-legacy.yaml
> 
> allow dts to do mirgeration from legacy layout to modern layouts for different
> boards, which use the same compatible string.
> 
> 2. ref to mtd.yaml
> 
> mtd.yaml force node name as flash@, nand@  ..., but here is parent node
> name is nand-controller@.  Only two properties, duplicate these should be
> simple and clean enough now.
> 
> change in v2
> - none
> 
> change dts layout break boot
> https://lore.kernel.org/imx/177281063848.253518.12995342124719933118.b4-ty@nxp.com/T/#t
> ---
>  .../devicetree/bindings/mtd/nand-chip.yaml    | 46 +-----------
>  ...oller.yaml => nand-controller-legacy.yaml} | 46 +++++-------
>  .../bindings/mtd/nand-controller.yaml         |  2 +
>  .../{nand-chip.yaml => nand-property.yaml}    | 14 +---
>  .../bindings/mtd/raw-nand-chip.yaml           | 74 +------------------
>  ...-nand-chip.yaml => raw-nand-property.yaml} | 15 +---
>  6 files changed, 27 insertions(+), 170 deletions(-)
>  copy Documentation/devicetree/bindings/mtd/{nand-controller.yaml => nand-controller-legacy.yaml} (69%)
>  copy Documentation/devicetree/bindings/mtd/{nand-chip.yaml => nand-property.yaml} (89%)
>  copy Documentation/devicetree/bindings/mtd/{raw-nand-chip.yaml => raw-nand-property.yaml} (94%)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
