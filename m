Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5C8D167E7
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 09:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBaewJORYrf7hTbZSnl/TuwwUF2xc8Yp+VZjJ38k0bw=; b=02NdvJDZq5xub9
	16eJbIBqU/C3f3LZPtI2235zl8gOyUsYNg4IY9FJj4FfnPLeXdcbnR35oe9P+TW5KIavMw8KAuIFC
	Sn26w4yRlDjp0GF8o9J4AjrHGYsqv391A3UXPdFrUAn7EJU8exHFF2fluv2LKZNoGSXUzcqFCxO8k
	sfYMICnzsyJwNpz1ERiF263PouskR3+/fSQJt1GqG4unTV5GzWpdwT9FiNz/qEodrL8X2nzEUDSEH
	1wypfzSjKzSOah78GDblnMBAUPHAJmCLYtu6kzMllE3balStczzTrWvX/Vi5bNcMRm+ZaS33LwDnF
	eoTAjwyPPncXxtkdH9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8se-000000021it-3QAY;
	Fri, 09 Jan 2026 09:34:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8sd-000000021iB-2ixs
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 09:34:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1637760166;
	Fri,  9 Jan 2026 09:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B11C4CEF1;
	Fri,  9 Jan 2026 09:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951242;
	bh=3AeINoDybmIWU2wLjbaEaippAGFl95KiJUHzFKs9IpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MFKg7AGW2kdubeInzebs0roxQzYOndkeGDjE7FGNdET4rl9eG+E1fkXngyCJoqeEc
	 lhD0JuN9odhgzLZc8Hmh/CeMZEe/25IXcZNQ37+0eG4KDvWsHa5lOlLbTPn1hkb2/0
	 mdB60FmAp8wB98yt76W3Gh9r4vU55elG3N7ROgvEFHLSxPtPcLZLmNU29sTrZPbEV0
	 zW7Z7E/JmsN+B0f/E7O5pHywpa03/kwqPTscCF0NSwopZQTa7WqSnIRrAgo9VFoJpm
	 eTa8/E2XEun+4Ox8SghYU3bl6T4QzA7P4B95J1v9FL8d/3ahqVaRaBVkFPsVkjEsvg
	 TqWqHLkvhY7Pw==
Date: Fri, 9 Jan 2026 10:34:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Simon Glass <sjg@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 06/10] dt-bindings: mtd: partitions: Drop partitions.yaml
Message-ID: <20260109-bright-purring-oyster-8c9f0b@quoll>
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-6-124a53ce6279@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-dt-mtd-partitions-v1-6-124a53ce6279@kernel.org>
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

On Thu, Jan 08, 2026 at 11:53:15AM -0600, Rob Herring (Arm) wrote:
>  patternProperties:
>    "^partitions(-boot[12]|-gp[14])?$":
> -    $ref: /schemas/mtd/partitions/partitions.yaml
> +    type: object
> +    additionalProperties: true
>  
> -    patternProperties:
> -      "^partition@[0-9a-f]+$":
> -        $ref: /schemas/mtd/partitions/partition.yaml
> -
> -        properties:
> -          reg:
> -            description: Must be multiple of 512 as it's converted
> -              internally from bytes to SECTOR_SIZE (512 bytes)
> -
> -        required:
> -          - reg
> -
> -        unevaluatedProperties: false
> +    properties:
> +      compatible:
> +        contains:
> +          const: fixed-partitions
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index bbb56216a4e2..e56dba83f00a 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -30,7 +30,7 @@ properties:
>      deprecated: true
>  
>    partitions:
> -    $ref: /schemas/mtd/partitions/partitions.yaml
> +    type: object

I think you need explicit, since we require it for incomplete nodes:

additionalProperties: true

>  
>      required:
>        - compatible

...

> -unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml b/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml
> index ed24b0ea86e5..7619b19e7a04 100644
> --- a/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml
> @@ -24,7 +24,9 @@ properties:
>        - description: AEMIF control registers.
>  
>    partitions:
> -    $ref: /schemas/mtd/partitions/partitions.yaml
> +    type: object
> +    required:
> +      - compatible

Same here

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
