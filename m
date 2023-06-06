Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF74C77B73
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 18:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amsRMuZaHI9Nsufx/gsIjjEpZPd5hy2W4ptiYV6S8Ys=; b=idKieLL7EylGIt
	/H3sBUIbjNZbNcP2vK0b0MD9ISwRiqn69dDR5UTyqfmjXpaIbgm8P1nIm7XhUUwBaqwXIydbv5PZT
	mMLUdUZpgMHIYvqCIzbV48eVs3I146IFJtknlbyas6hQHaBy9Oe4HjiWnthIRYLtRaFOFo6VQ/iDQ
	3F6gO1dvWFGDcAQm+kfrMhwPxnux6QhcfChwppgwN/dzgdfDGcKQzLNtY0gSZqqIDV+6vQ4zoCAE7
	Ux8ZDcIw3w5VjmsteS/E687hPtSLhmCHB3Ov8suVaBq7bzuI7qzdimhBss/y3x4JASickcH5NbNFb
	S2KQyH9tKH1F4JsUpydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bmz-002p96-32;
	Tue, 06 Jun 2023 18:52:17 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bmv-002p6Z-1a
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 18:52:15 +0000
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-77480507360so200187339f.3
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 11:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686077531; x=1688669531;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4UtFdrQxr+x2m/m2+ajxWGfnTRKEy+NoCjbexTZqOY=;
        b=JaJFUW3qnbxULAYeyvPiqbk6SzJjHEenzvMZwNZDknbX4RmIf3a362SxybRrQ3ODNw
         IzrpPm3erVdABofFYtpo2dr9A1Tdzo+whq6jYKIVYPwbuMES0n8d8W66Fp+3D7ZBeraM
         aRVT8LFswM16oP4yy17NBK3nVk012AP1sK4lKfYiOYcBYKNe4SxYWGeimAthRpKItAih
         kaIb3zBecHYxQDn8S8oFmLl5S4l1Wt6bZkRmi/ZT+pdSGe6IIPKG50a8UR1rlsZxQU9O
         GKBpUgn1i9u8V6vL5tARdHx65JyAV9GLIMJ7OnevPrmrAr8yrfjtSurefBdnZlBEfiJh
         riSw==
X-Gm-Message-State: AC+VfDzkppo64be9xMSYrfCLlyvDw0f90vEA6II541VAvBg3pHe38wwz
	ZBIjedN8sg2BgmJjPBE/Qg==
X-Google-Smtp-Source: ACHHUZ4fIkoCSunE75/vagzP4iimIRH8cgEnLx6hQgtecdv+bvAsmE9f8LmF5qlT6+ZZCq2QJnewkw==
X-Received: by 2002:a6b:e614:0:b0:760:f795:ccdf with SMTP id g20-20020a6be614000000b00760f795ccdfmr2556947ioh.8.1686077531375;
        Tue, 06 Jun 2023 11:52:11 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id b12-20020a029a0c000000b004090c67f155sm843420jal.91.2023.06.06.11.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 11:52:10 -0700 (PDT)
Received: (nullmailer pid 1468439 invoked by uid 1000);
	Tue, 06 Jun 2023 18:52:00 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, devicetree@vger.kernel.org, Michael Walle <michael@walle.cc>, Maxime Ripard <mripard@kernel.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <tudor.ambarus@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, Samuel Holland <samuel@sholland.org>, Pratyush Yadav <pratyush@kernel.org>, Chen-Yu Tsai <wens@csie.org>
In-Reply-To: <20230606175246.190465-9-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-9-miquel.raynal@bootlin.com>
Message-Id: <168607751082.1468254.16628055652368989203.robh@kernel.org>
Subject: Re: [PATCH v2 08/17] dt-bindings: mtd: sunxi: Prevent NAND chip
 unevaluated properties
Date: Tue, 06 Jun 2023 12:52:00 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_115213_523651_5CC8E6EE 
X-CRM114-Status: GOOD (  16.31  )
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


On Tue, 06 Jun 2023 19:52:37 +0200, Miquel Raynal wrote:
> nand-ecc-mode is a generic property which may apply to any raw NAND
> chip, it does not need to be listed in each controller
> description. Instead, let's reference the raw NAND chip description file
> which contains the property. The description contained
> "additionalProperties: false" which is wrong as other properties such as
> partitions might very well be added in the final .dts, and anyway needs
> to be converted into "unexpectedProperties: false" to fit the property
> change new requirements.
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml    | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230606175246.190465-9-miquel.raynal@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
