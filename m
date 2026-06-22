Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FDFCDB46F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jun 2026 09:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZjpsDHCPTw0hD9bhG8A0IsWq8QZfktnVTj+V23mimM=; b=LnbjV7+OJZrYUM
	tt1kWRpn9AcnGQ0MtGqAPZ0US+EcfotbXKckN9UsId5ku+lxNzHYAEElJ4IQZn1YgEuJ3n1Gk/R+C
	Wgvw66WHG/To79jCNz6T2RQJj2GRYxn9NhgXTcYB0zUDicqotvTZFmMWcObe6C6LjjXM7EAeWP3Ut
	mW5mML7UO/pLOo68tDbRQZWjCci4LKQpxgwQu2wQMkRPc8A2Yt6Qu0A16yh2SUVBruwW6mhw67JoM
	oFaIrdjbmjjhPD43XJ2BdlOCN1hoRBZHfTwe03yn25DnVLYSKSB6JQ66mVD3Zt4/LNVgTfNwcDpbU
	J6gAgMs9P+RJKp1QxWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbajm-00000004jb6-1NSq;
	Mon, 22 Jun 2026 09:14:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbajl-00000004jav-0I50
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jun 2026 09:14:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B1E860051;
	Mon, 22 Jun 2026 09:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E3F1F000E9;
	Mon, 22 Jun 2026 09:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782119676;
	bh=gxPlx+0hNm6aq+bA+rW2kkCALODHubAvdQ5zTQrGHtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S7H8jPlzMEuFHwKZdTYZ0Q34p8rpZscCuA+6n4V16hNndGzm+diMkeGUtcAhmTft2
	 11y8v94ytAB5e4dM1QaCcEXSaeiqwAj8s+SslOyPbABSHOA8TjO5oSbAxEUsB0jLpC
	 HjtTXJNCRGJtt2fDsaIhAyGrDFpVZ++gdvc4bGNI2iSyoPVPxVVCg6QmNIerKDNPrp
	 v9A8uK9cHcFaqBnyvjAAsEm+o7exjrIsVXHjOI+cS8aTu+sq3UJLlgTL4ufh/PXy8V
	 jlJ2mZgBvvfrWqcy2X9/tNjbwrJecyjNc5TuxhzTzR0polik2+SW31IceRjiR0iqLI
	 xU7cB3lvVDCZQ==
Date: Mon, 22 Jun 2026 11:14:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, praneeth@ti.com, u-kumar1@ti.com, a-dutta@ti.com
Subject: Re: [PATCH v4 01/16] spi: dt-bindings: add
 spi-max-post-config-frequency property
Message-ID: <20260622-private-curly-fennec-7e1ad0@quoll>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-2-s-k6@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260618073725.84733-2-s-k6@ti.com>
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

On Thu, Jun 18, 2026 at 01:07:10PM +0530, Santhosh Kumar K wrote:
> Add spi-max-post-config-frequency, a generic uint32 property for SPI
> peripherals that support two distinct clock rates: a conservative rate
> always reachable without controller configuration, and a higher rate
> reachable only after controller-side configuration such as PHY tuning.
> 
> When both properties are present, spi-max-frequency gives the
> conservative pre-configuration rate and spi-max-post-config-frequency
> gives the higher post-configuration target.
> 
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> ---
>  .../devicetree/bindings/spi/spi-peripheral-props.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index 880a9f624566..ece86f65930f 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -45,6 +45,12 @@ properties:
>      description:
>        Maximum SPI clocking speed of the device in Hz.
>  
> +  spi-max-post-config-frequency:

-hz
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml

and you need maxItems: 1.

Now, please take time and think if this should not be an array instead
(maxItems: ...) to cover other possible cases, e.g. different tuning
levels? IOW, having single spi-max-frequency turned out to be
insufficient. You address that insufficiency with one more frequency,
but what if this is going to be insufficient next month as well?

I don't know, answer is rather for domain experts.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Maximum SPI clock frequency in Hz achievable post controller-side
> +      configuration.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
