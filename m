Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880EDC77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 18:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZmGZFB0fxnAGH05o/JgYz9oX8l51Moa738ZEwprZBs=; b=gGX5orUOLcenQS
	N3AVpG7F40SWPr6mI2RG2d8RotEinw9r0jiB/zllayGQppUPNKkzdxmvEdVjaLJtx5vEfwpFEfDUz
	lgsroVI8WHnUfHRbsh5JW+uIUAIn8UuGwaeDGkSr/fhWodZHJPRub7AGVQtd+bYBU0hnnE+WJvbr/
	LQZ2CZrrtmXzt/MlFnf2WD26d6lUczCNwybf81KaqVDlVcxl8mMecftKKoRVW4D7/UXnsegG2f9Jm
	IG+yTBjmiGOZGoWD+/C7UH9q0Ag8Td1bzxwzrI87CZPDPf+rxfKA11KkXGC3mAyp1pdc4/gJf5iGh
	XxdugbNZrPbvt6tYBmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bmz-002p8q-11;
	Tue, 06 Jun 2023 18:52:17 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bmv-002p61-0h
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 18:52:14 +0000
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-77a62a84855so18313439f.1
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 11:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686077528; x=1688669528;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4EqDUqkk2l6bGo2T3M69+gamDexLSphWtgXxcDch4NU=;
        b=gIu0X+NtnUKwPkFYo2ZoPyc604Ziw1IqZj6kmslWiOhO9iZLGBYGHewatLiF+e8ioi
         cSqEDdY10CZAjfuwRZsYBPZE2sKOikhas1Pi8v/VPjpLhXklqcxak7v+ZsuBiqXv6JW3
         Yg/AFJbcc2lyYfdn91tMVXPLo3IusGtkNQFxgHtX5ccvy5TFiTcemrYY7zI5ghaXFoON
         POXUbqf5xLJ/K+Vec1OStM4UBbgTadpHUmp03yDxdT/Ru5tLr/yelzQqbsbNPv0Y5Lts
         ui56GOYjww9gE2MFD/FbyeHKRS01z4L3VQeTuHkVkpiC9O/Xw5wigpNVX5jvNkHkwWaX
         D8Vw==
X-Gm-Message-State: AC+VfDxPwGUxRUd24qxM+6LxnSy7TlZgUD4usB15pfKzQu9i2hCuLTrJ
	EZcstwiWduLfbbenAB6TJA==
X-Google-Smtp-Source: ACHHUZ661zHGE6oRFcgUHmGNq91eQinUuro8ZmtYkorwRJYMt7m9nHU1wERKDVKXj6qjeQYFNJU4jg==
X-Received: by 2002:a6b:ea0a:0:b0:777:b107:dd4d with SMTP id m10-20020a6bea0a000000b00777b107dd4dmr2668534ioc.16.1686077528672;
        Tue, 06 Jun 2023 11:52:08 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id r18-20020a6bd912000000b007749b2d1a6fsm3377076ioc.32.2023.06.06.11.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 11:52:08 -0700 (PDT)
Received: (nullmailer pid 1468441 invoked by uid 1000);
	Tue, 06 Jun 2023 18:52:00 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Liang Yang <liang.yang@amlogic.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mtd@lists.infradead.org, Michael Walle <michael@walle.cc>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230606175246.190465-10-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-10-miquel.raynal@bootlin.com>
Message-Id: <168607751220.1468277.13727658433890186184.robh@kernel.org>
Subject: Re: [PATCH v2 09/17] dt-bindings: mtd: meson: Prevent NAND chip
 unevaluated properties
Date: Tue, 06 Jun 2023 12:52:00 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_115213_257969_A7B23B8E 
X-CRM114-Status: GOOD (  13.23  )
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


On Tue, 06 Jun 2023 19:52:38 +0200, Miquel Raynal wrote:
> Ensure all raw NAND chip properties are valid by referencing the
> relevant schema and set unevaluatedProperties to false in the NAND chip
> section to avoid spurious additions of random properties.
> 
> Cc: Liang Yang <liang.yang@amlogic.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.example.dtb: nand-controller@ffe07800: nand@0: False schema does not allow {'reg': [[0]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230606175246.190465-10-miquel.raynal@bootlin.com

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
