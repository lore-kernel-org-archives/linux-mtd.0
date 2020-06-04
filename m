Return-Path: <SRS0=fXJS=7R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A71C433DF
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jun 2020 23:08:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E992A207F9
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jun 2020 23:08:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKnoQxqx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E992A207F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQ+SZxNaETu0neq5+XxExlt3AUhahG7B5eKi+XOT0oY=; b=UKnoQxqxi5Z3kT
	3QVNlT8zfVlZIodFyoglkVio7GdP7nrfBGsvQV/JvHhUJGQH4/shadNoh35ceCEbIkf/dJOEKp+/P
	u6aTr2yBykjFRDYhsqOwjv9b2dRaj8gVejILl2I8XsSdj72NOmxpJDHdWe+yUdeakv+8tY6Bcj67H
	8WmE4fTpxPn1C7GOfvC4PloSNZ+ba52ak8AoHrk/NU3DSC+Pnq5OvFDem3jcaUlFPZQ4E6Fd2fm7J
	dtA2Rnt/PkLtmgTDSmGHbo5uBJbfzADMhuEhmmubrpTTejI5n+R9CliiErMaMYTqpG1bcUZDIGti4
	4kMrBKkcOqRPclZlOXDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgyy5-00077P-SO; Thu, 04 Jun 2020 23:08:13 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgyy0-00076t-Ha; Thu, 04 Jun 2020 23:08:09 +0000
Received: by mail-il1-f195.google.com with SMTP id t8so7757211ilm.7;
 Thu, 04 Jun 2020 16:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jRy2xtFWKNlAqAVXEHvJHfSiEZWhYR4CV8B2YeBv94Q=;
 b=hNESlPgEFzJ6RerIGB0UB5R66b2Uzv5h+0jeyFs5bN3Wqqst60YTV4nsxFUGe9qa8k
 eDD8QrvztKPd1sF1xYJCsKBQxZ0T03G1Xh3MHWPghQRI/6KI2cLIAwfd0bGBAXXM3nxx
 L2LvcOR9yXZS0+plfUVXLuNhYVwxZOEQTIm8G59trA2jwGM10TqSa0WxYPEhn4MWRaUO
 PnnBrKn9Svteghq1JzNSmRM/DVENnNVWqJT5iGPum06pkdxsNwvRs7l8W7Ak0rzNlmXS
 jqhB+r+UaONwt8z3OkCWE3Qvum+FHz3U1mLRQtjr/nJtxQnFm7ety24WC0VKvXzoNyBn
 aR8Q==
X-Gm-Message-State: AOAM531xg8a2Hsy6tcDYeNvmghKiZGxeQO0a9L/glJ/rUIBTytteTsl7
 qNJLGQopS/bQw/ir9UkSyg==
X-Google-Smtp-Source: ABdhPJxBwqg2KjhkMQTT+Bjb8yKCzHP3CMKvZqePsJSASFJh55N1HQlDha382TaJKKuPgN6f4WReOQ==
X-Received: by 2002:a92:7901:: with SMTP id u1mr6285248ilc.52.1591312086941;
 Thu, 04 Jun 2020 16:08:06 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id z16sm2022433ilz.64.2020.06.04.16.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 16:08:05 -0700 (PDT)
Received: (nullmailer pid 17414 invoked by uid 1000);
 Thu, 04 Jun 2020 23:08:04 -0000
Date: Thu, 4 Jun 2020 17:08:04 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v10 07/20] dt-bindings: mtd: Document boolean NAND ECC
 properties
Message-ID: <20200604230804.GA13821@bogus>
References: <20200603175759.19948-1-miquel.raynal@bootlin.com>
 <20200603175759.19948-8-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603175759.19948-8-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_160808_580158_D50F537F 
X-CRM114-Status: GOOD (  16.29  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jun 03, 2020 at 07:57:46PM +0200, Miquel Raynal wrote:
> Document nand-use-soft-ecc-engine and nand-no-ecc-engine properties.
> The former is here to force software correction, the latter prevents
> any correction to happen.
> 
> These properties (along with nand-ecc-engine) are supposed to be more
> accurate than the current nand-ecc-modes wich is very misleading and
> very often people think it is mandatory while the core should be
> relied upon to decide which correction to handle.
> 
> nand-ecc-mode was already inacurate, but it becomes totally
> problematic with setups where there are several hardware engines.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index 0969d2e6720b..a3750978ebb8 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -68,6 +68,12 @@ patternProperties:
>            3/ The ECC engine is external, in this case the phandle should
>            reference the specific ECC engine node.
>  
> +      nand-use-soft-ecc-engine: true
> +        description: Use a software ECC engine.

Humm, I'm surprised this is valid YAML. nand-use-soft-ecc-engine can't 
be both a boolean and a map (aka schema, aka dict).

nand-use-soft-ecc-engine:
  type: boolean
  description: ...

> +
> +      nand-no-ecc-engine: true
> +        description: Do not use any ECC correction.
> +
>        nand-ecc-placement:
>          allOf:
>            - $ref: /schemas/types.yaml#/definitions/string
> -- 
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
