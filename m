Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76B1C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 23:09:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B409B20776
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 23:09:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rqx8BB+Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B409B20776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R4yeiDRc6PcDbsCfB7fgH5Km7RkfLJKpphIq8N6vjAc=; b=rqx8BB+QZGyl03hp50MyQtTDI
	iLib66XIgxldVovoOQ+s68ZDxprk7jGQYf81w1KWYej06bPHxD1WEL5rE4YJG0na6HzYzVDKJWaQc
	iPbRcna/QIRu1YWotnHf1GVXuKhY89wz+91IngAAG6zoeg7CNeyT1X/LIOPmZ9rHAhbvSOCm9DrUs
	es9IGXx0A7Q7/f6aeid76vBgFhod1yrcgoECEI08JHbtlkG5CMXjZaFDtkX5dIcImUL3iKBQGiPUt
	GqnWk37o36N6LDU5qGwR6YzRh01naJ2Dy7zqjHCdn2cTRY6UI7HHOK089eDeE/36OgoTMxJyJwMi8
	ZUsANhJdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq2sg-00046g-TC; Mon, 29 Jun 2020 23:08:06 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq2se-00046E-Bg
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 23:08:05 +0000
Received: by mail-io1-f65.google.com with SMTP id o5so18966166iow.8
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jun 2020 16:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qa+3ZZE8Xi4EQp7D6ptCyZsYc29I75iWQWq+6E6hJuQ=;
 b=ZkknA544wgGeLv+JqVNC5tFS21EDAJP03aqZRrUe+FcDH37Pwuzj8N4RyOWKg3E8hr
 gnGjXak96liqOxWXqDr64tO+SNc5SMtP14N22gi6ucqB8KiNPBn6IwRafM9OCL8kOuUH
 9mN35xVIDj02VFokN2SwnOzP4R+IDrO0jQtE/OJRh9dt0aRWNfuPXrvqy8FeD7OrZEy9
 KVWxDQG5W9w0TaefXcQE7+zBOGt/QrXyBa9ijnH3yZfJvH2Re5fLQ2cxiltnAHXuh4S4
 TMtNLAUNJAbws8DE3J3A2LXxRnqeekEn2C5eAzOaL8vwoaboyG9bxjCc1MkcJkRfzuUI
 zzQw==
X-Gm-Message-State: AOAM532N75nfMOkEM69Xnwvf6J++sgBZA1iEEUO3lezYlJ4kgW6ONRsK
 XCxwSttkbfMcP02TnSP9CzACz/nscA==
X-Google-Smtp-Source: ABdhPJzPC+YcCSiHde0I1w4PXp0jjmzG9gKLew/aF2XeLXJ93K8mT6sc6s0frikIJmOA8bwR7OYWvg==
X-Received: by 2002:a6b:ba06:: with SMTP id k6mr19478147iof.101.1593472082765; 
 Mon, 29 Jun 2020 16:08:02 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
 by smtp.gmail.com with ESMTPSA id u3sm585206iol.41.2020.06.29.16.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 16:08:01 -0700 (PDT)
Received: (nullmailer pid 3140981 invoked by uid 1000);
 Mon, 29 Jun 2020 23:08:00 -0000
Date: Mon, 29 Jun 2020 17:08:00 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v11 2/2] dt-bindings: mtd: Document boolean NAND ECC
 properties
Message-ID: <20200629230800.GA3136006@bogus>
References: <20200626071357.21421-1-miquel.raynal@bootlin.com>
 <20200626071357.21421-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626071357.21421-3-miquel.raynal@bootlin.com>
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, juliensu@mxic.com.tw,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, masonccyang@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jun 26, 2020 at 09:13:57AM +0200, Miquel Raynal wrote:
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
> +
> +      nand-no-ecc-engine: true
> +        description: Do not use any ECC correction.
> +

Still the same problem as v10.

You want:

nand-no-ecc-engine:
  type: boolean
  description: Do not use any ECC correction.

>        nand-ecc-placement:
>          allOf:
>            - $ref: /schemas/types.yaml#/definitions/string
> -- 
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
