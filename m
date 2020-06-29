Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623CCC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 23:03:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B353206C3
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 23:03:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ndc0RVxw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B353206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0DuFW7De8dzYWWveFG7+kBj99cUrzPMGYj0Ps3nIplY=; b=Ndc0RVxwfdjHcLTsq2Oja3gqk
	lDopIbFLoVhHYxRyb5bXuQPE+qgH9Pc7/Hs8oxQSSvgDzSZBmyt6FCwy9j1eMb/sDqPp4f2wj55JD
	ttqX3586SYS6PJEovCW50ueI78AavCpwxuGRnSJQ/wzJY83cm/B3585BFzHtrU6VdGx+EIE/mFYbT
	dw2JjOajNwVPgnsdvmmNgDORuAXSJWA5ZZWggqAXekg4mVOir7MCnHFOwR5yCqnDgsoE47P7bVDO2
	TXwVp4dvKlG4Ff1GhdqG340T7tnFLG+ytPajDGBR60bsxHWekt75oMHCWR2bmrf/UvnyZ3hVKUfeV
	ngVqXe8vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq2lr-0003N4-9z; Mon, 29 Jun 2020 23:01:03 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq2ln-0003Mi-TD
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 23:01:00 +0000
Received: by mail-il1-f195.google.com with SMTP id x9so16039795ila.3
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jun 2020 16:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HDXW6Q7IXpGlVGwl/SyNPRj/AOT6XQANukWDkTboxtk=;
 b=Ew42rcXzs6mrmiNJ4xS6xG4deSFHvAEvcHQ8dkvWEOuqdsoWYyq1QqYX5l0ViVI3ri
 jIw6qWzbkUgRq0h+eKuJD6t0OE5gDTh7kGUQCacCJT0Z7ImCeKxsTAp3k53cgopyLkwD
 vu2O1ctJSLCXO2Ycau/5wYd7XR2hajnT9E4JkHcwgs3HO3Q+iXxJcuLQJo0asLzSSNNh
 tKCnAf8NbnB9UUhPxf2OXRLRTfmDL/cj/vXZZRGSzdGLp6uX6ln8HZfrZigmUF+v5nsR
 mmpQ8AdHNCYhwhEYqH5OlLvN6ZmOb2TqnsF9QKa/s7IitP8DuaHdjNHmBghCQZcDGOX/
 gp2g==
X-Gm-Message-State: AOAM531h0Lzv5dMld1H64GVUh57loFtw58GGqEcktLFRmBAz3wYFW6kN
 TvRwoP5S4wGz0HO6FGsaDg==
X-Google-Smtp-Source: ABdhPJzXkkFIvPP45YSjX5PdPoReaMw/SNOfn8/6F8zjpSyem/3bYxO4nHSPF1bbwwX2kqMox3e3DA==
X-Received: by 2002:a92:4001:: with SMTP id n1mr18469020ila.269.1593471658159; 
 Mon, 29 Jun 2020 16:00:58 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
 by smtp.gmail.com with ESMTPSA id y20sm601993ioc.30.2020.06.29.16.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 16:00:57 -0700 (PDT)
Received: (nullmailer pid 3129721 invoked by uid 1000);
 Mon, 29 Jun 2020 23:00:54 -0000
Date: Mon, 29 Jun 2020 17:00:54 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v11 1/2] dt-bindings: mtd: Document nand-ecc-engine
Message-ID: <20200629230054.GA3124427@bogus>
References: <20200626071357.21421-1-miquel.raynal@bootlin.com>
 <20200626071357.21421-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626071357.21421-2-miquel.raynal@bootlin.com>
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

On Fri, Jun 26, 2020 at 09:13:56AM +0200, Miquel Raynal wrote:
> This property is needed to precisely point to the hardware ECC engine
> to use when there are several of them available. Here, hardware also
> refers to the on-die possibility.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-controller.yaml     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index 4a0798247d2d..0969d2e6720b 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -56,6 +56,18 @@ patternProperties:
>            (Linux will handle the calculations). soft_bch is deprecated
>            and should be replaced by soft and nand-ecc-algo.
>  
> +      nand-ecc-engine:
> +        maxItems: 1

maxItems is for arrays and this is a phandle. It needs a type reference.

> +        description:

You need '|' at the end if you want the formatting preserved.

> +	  A phandle on the hardware ECC engine if any. There are

A tab is not valid YAML. 

> +          basically three possibilities:
> +          1/ The ECC engine is part of the NAND controller, in this
> +          case the phandle should reference the parent node.
> +          2/ The ECC engine is part of the NAND part (on-die), in this
> +          case the phandle should reference the node itself.
> +          3/ The ECC engine is external, in this case the phandle should
> +          reference the specific ECC engine node.
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
