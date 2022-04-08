Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAD5C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Apr 2022 21:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXSAprXHkeqKg3mtGN6q4Rv8jc+Qg7cfrhfLsQn86fo=; b=HYQljpPSTZo8fv
	+j0NJ3f2nXUaIhCO/+34tlSnNC5pD/DqGF9u0u1o1+MCMGl/aKVCOk2TLuUiA6cBr3yjfWEUmuz3n
	+//EYL4op4xEFFe1s1LIlwqGyIXMEugQNIOKFNmeg+fWXbIcze60yWKxHWlDLcuPOTKfr1ITKFot2
	pNBfr3H1AU6dz83SPWWP8Wg618lM6jpa7TThTWJp76g5TFYtSxIspOJCo+wGR85sHMRYR1tzINlGX
	2M+8LMidS6uTdl5Rr5xwW+IJ5Lf/b/hBixZTkHUO2fUsv+qPCFuhAlK7V2TEAZkbwP/ckcEH4C7X7
	Et7ZBZ0gwozNCtJDbrMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncw5I-001JBV-D4; Fri, 08 Apr 2022 21:24:00 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncw5G-001JAu-F2
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2022 21:23:59 +0000
Received: by mail-oi1-f177.google.com with SMTP id z8so10132655oix.3
 for <linux-mtd@lists.infradead.org>; Fri, 08 Apr 2022 14:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0T6S7+QP7qWOZqAmU2HeursYTQCWQoHrmh79ye1Au6A=;
 b=YEQm3APlCuTychDiUZpegKfU6SK5YBBuRJCP2SaKSD/6PKl3h2IezbyxX4+6TxA60C
 x/TeshrdpGCEgSDi+1p5+9MJC2SaKlT0m8quRh8sC6ucW1k2bJfGj6G5kRMF7Qt0TVpU
 1hqXlVo9gO1soXCYRcfC/vufnEx/C2/SbWWkHD07okpv0O9fKKGo4HyZqOnffE5QeNfw
 h4J+3WHfxwUrs5ZT3fQljDyCR3nBZCZe5v/RzbQb2IlfbqzvAY/bDbPgkLTDTCQkwFWn
 pbQqJZ1ZsOdVCVpokVauU9LPFPy8q519zNYZcx/gawNbf0FLi64EE/xZmBHko8NQTEQ9
 3uHA==
X-Gm-Message-State: AOAM532c4E7xDlSY+1HhdW9IER4z9C114WQyBrRQ1ASuiLospTXSi1+q
 BoaZGTsS3E7cDzey8nF7VBEjsFEVlg==
X-Google-Smtp-Source: ABdhPJzJGJC0SnhPZeOBXHawRPojHmwZQHykZy3Yf4Unn2+H1trg/FFezSEv1rfslsihDjHVXco/Qg==
X-Received: by 2002:a05:6808:1b12:b0:2da:28e1:39f7 with SMTP id
 bx18-20020a0568081b1200b002da28e139f7mr786027oib.289.1649453037335; 
 Fri, 08 Apr 2022 14:23:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bp21-20020a056820199500b003298e6877c7sm2982402oob.29.2022.04.08.14.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 14:23:56 -0700 (PDT)
Received: (nullmailer pid 4094588 invoked by uid 1000);
 Fri, 08 Apr 2022 21:23:55 -0000
Date: Fri, 8 Apr 2022 16:23:55 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Pratyush Yadav <p.yadav@ti.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: mtd: jedec,spi-nor: remove unneeded
 properties
Message-ID: <YlCn639koXzXcAY8@robh.at.kernel.org>
References: <20220408063720.12826-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220408063720.12826-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_142358_538992_394F3261 
X-CRM114-Status: GOOD (  10.18  )
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

On Fri, 08 Apr 2022 08:37:20 +0200, Krzysztof Kozlowski wrote:
> After conversion the jedec,spi-nor DT schema to reference other schemas
> (SPI and MTD) and use unevaluatedProperties, few properties are
> redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> Changes since v1:
> 1. Do not remove address/size cells (Rob).
> 2. Add Pratyush review.
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 8 --------
>  1 file changed, 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
