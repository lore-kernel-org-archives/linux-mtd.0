Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C18C7EE2A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 18:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqeuWl/xoNIhML296EsQ2eNROQeNvsHmBzl6d3D6rfQ=; b=qIcLv0B9OB+Hnj
	cITvx6mkJxQ+MDqkwOI3Qlq+sYZiet+gQ3OHwdRojE05s62WzL5oxJpDxsVBIsrMblmbF7SwYSD/x
	D7kA0zRCvEf8Hzpkh37Eg4VCFBs+cJw8MsADPYw/AQf36PjQJ6pLLH2jWi353t7SM5hGfVav+mOuz
	uzHHAawfmyFDNmsZZiepAeSvg3GkeHfQUrrmxPo1L1ptoGN+ZSpTOQl1U0sI6C6TTvZdVGESTGmK3
	vNEKoQ6Yavn1lq+6AEJWsZsbFev5woCX6fuV3rDtF04OrOO+3rD5MTECDt3RpFVHby0k+TSI6DNOy
	U+CgqPhOiTGSC+nbHjbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bnC-002pIF-0q;
	Tue, 06 Jun 2023 18:52:30 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bn9-002pDo-0Q
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 18:52:28 +0000
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-33b4b70693eso102655ab.1
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 11:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686077545; x=1688669545;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=urm8ce+1iipWcrlD9S+gUpEnVuPcFWqbKSQklkKSxQY=;
        b=NB7FnE29aER3+SU8YPX63R2DzpsUKC83AtvONVxlwAUYBL4a4UK/UQz25qb8ZrvTzP
         j1wtQCySmsbUwCDpG5zIeUZdgc8FrLHGxGF1DLq0o//y7smcS0Mqe29Wp/hWmN+Tlr8I
         hCPqOVAlKH6AbeHBfmjSepV6hS3zEbJNBT4GqXpnVhuw14mTbS6th+nB0knNx/4ZZe9F
         KGJmk+EtXhmAHHki0plvmnddp3cDO6QWWspYUN6BkfjtVV/K1AGe4pEUEYVR/doBm/DH
         HP6L5qgZ+awBigurZD1LeaNL8WQugjKg0E0qDsIHTMblwXVPwO8rUlyzA3L/VNm1Fczb
         J9bg==
X-Gm-Message-State: AC+VfDyFMkXtn0IxebheyO/wwuu5xQARB69BQtq0TNmFML9DHKSBLs7/
	FC6gWXKI1Jm2yvpzh1TcWw==
X-Google-Smtp-Source: ACHHUZ5ZFK9Hl4tGFDogaHTkcUWjA4I1EGQ37EoXguCckQ6O9Dm/RgiafS6YdmwfEdDORWgPo3aDCw==
X-Received: by 2002:a05:6e02:5d2:b0:33d:3b69:2d2c with SMTP id l18-20020a056e0205d200b0033d3b692d2cmr4762693ils.20.1686077545024;
        Tue, 06 Jun 2023 11:52:25 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id b12-20020a92c84c000000b0032ca1426ddesm3182832ilq.55.2023.06.06.11.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 11:52:24 -0700 (PDT)
Received: (nullmailer pid 1468445 invoked by uid 1000);
	Tue, 06 Jun 2023 18:52:00 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Pratyush Yadav <pratyush@kernel.org>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>
In-Reply-To: <20230606175246.190465-12-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-12-miquel.raynal@bootlin.com>
Message-Id: <168607751516.1468323.4234519739247750228.robh@kernel.org>
Subject: Re: [PATCH v2 11/17] dt-bindings: mtd: denali: Prevent NAND chip
 unevaluated properties
Date: Tue, 06 Jun 2023 12:52:00 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_115227_167987_CDEFD219 
X-CRM114-Status: GOOD (  14.98  )
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


On Tue, 06 Jun 2023 19:52:40 +0200, Miquel Raynal wrote:
> Ensure all raw NAND chip properties are valid by referencing the
> relevant schema and set unevaluatedProperties to false in the NAND chip
> section to avoid spurious additions of random properties.
> 
> Doing this in one location also saves us from dupplicating the
> description of the NAND chip object.
> 
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/denali,nand.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mtd/denali,nand.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/denali,nand.example.dtb: nand-controller@ff900000: nand@0: False schema does not allow {'reg': [[0]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/denali,nand.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/denali,nand.example.dtb: nand-controller@ff900000: nand@0: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/denali,nand.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230606175246.190465-12-miquel.raynal@bootlin.com

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
