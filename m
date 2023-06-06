Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29A5C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 18:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvtZJ795tueeGRaHVwjtR0d+zW3mG6N+T1Tb0pdRMtk=; b=zbf39iNi00I6HX
	vBDelIShcT6LbF9Gllw8B2islpbG8i5A2pan23WLQiG/2UxM4SBzobstWXtIS6U5EFm/8mM5UkNNG
	U0VgSQD5ZoByoeZGLF07IZyNwSQnnlS4+Ae2vJXlBixpBVEfV9dmnp8xV12RMJF0qV4+o7kUyoSB/
	yz/NZzm9I/A3vOZzhOiZO3LtgS/r45quPbuV87vSrIXntLc2By8reWY48CWIb/4hvF9nRT30vQ/d3
	i38adQPcjhMz5RSYO62fY66zNrdqevgBKMz7RuIlAAJl1YFRXGlU2pd9KVXNMuEV/MB428VzFQAb7
	u7TD57LOfP0ozah1yrWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bn2-002pAl-20;
	Tue, 06 Jun 2023 18:52:20 +0000
Received: from mail-il1-f179.google.com ([209.85.166.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bmy-002p7j-3B
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 18:52:18 +0000
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-33d0b7114a9so206715ab.2
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 11:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686077534; x=1688669534;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=moBbk168uFHSvZ2f4zil6U2idBIOekExEazPbot20tk=;
        b=aBq0cjGRwHDIOEGM7xBDT3xMC3U75f61fqnpn5F6b0Zd4c40lm0rlhegCdftTnk9v9
         gveuGfz7xLBdyb5T1KyNrzN1lQ8xaCuwLdNukhinIWpkrURPXZuzL2xLjcdefdVLsIR4
         nUFj5CHhPDvwaELzEXnL/jo2lORPbOsx0YUGcGe1aJjEPov6Ltq8EDRutDZjEocmIUYr
         SbSmvWCFgMz3nv1rEiWSu6oqMW1u/okQHbPD4VGzMQ16XVMTVwgfe0rFz8EX4wpgk4cR
         EELJHKnRqXeAraimBjBxySVvdNhUZ6mJOnahQ8eD2VjM0QTeh7AFPM0YgYqT3kBOXPKE
         COjQ==
X-Gm-Message-State: AC+VfDxcwEq+WNcfUKqWTYitrOE7KYwPlSmCvbjrmB1f8vb+Jmv0Sf+V
	usywFEth6qYaZrfeOeJFQBeIZA4QCg==
X-Google-Smtp-Source: ACHHUZ4w64OUwkr/ktIj1u5/r8/DvrwqXepzViI8Nrzhwb1sFbkM36wRtuAEe/KXv/AIwTv4c5eifw==
X-Received: by 2002:a92:c848:0:b0:33d:6988:c000 with SMTP id b8-20020a92c848000000b0033d6988c000mr4346123ilq.8.1686077534127;
        Tue, 06 Jun 2023 11:52:14 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id dp37-20020a0566381ca500b0041ab9b6f5b0sm2108551jab.128.2023.06.06.11.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 11:52:13 -0700 (PDT)
Received: (nullmailer pid 1468443 invoked by uid 1000);
	Tue, 06 Jun 2023 18:52:00 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Michael Walle <michael@walle.cc>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <tudor.ambarus@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20230606175246.190465-11-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-11-miquel.raynal@bootlin.com>
Message-Id: <168607751367.1468300.592745867598480616.robh@kernel.org>
Subject: Re: [PATCH v2 10/17] dt-bindings: mtd: brcmnand: Prevent NAND chip
 unevaluated properties
Date: Tue, 06 Jun 2023 12:52:00 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_115217_023218_7429BC1F 
X-CRM114-Status: GOOD (  13.63  )
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


On Tue, 06 Jun 2023 19:52:39 +0200, Miquel Raynal wrote:
> Ensure all raw NAND chip properties are valid by referencing the
> relevant schema and set unevaluatedProperties to false in the NAND chip
> section to avoid spurious additions of random properties.
> 
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/brcm,brcmnand.example.dtb: nand-controller@f0442800: nand@1: False schema does not allow {'compatible': ['brcm,nandcs'], 'reg': [[1]], 'nand-on-flash-bbt': True, 'nand-ecc-strength': [[12]], 'nand-ecc-step-size': [[512]], '#address-cells': [[1]], '#size-cells': [[1]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/brcm,brcmnand.example.dtb: nand-controller@f0442800: nand@1: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nand-ecc-strength', 'nand-on-flash-bbt', 'reg' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/brcm,brcmnand.example.dtb: nand-controller@10000200: nand@0: False schema does not allow {'compatible': ['brcm,nandcs'], 'reg': [[0]], 'nand-on-flash-bbt': True, 'nand-ecc-strength': [[1]], 'nand-ecc-step-size': [[512]], '#address-cells': [[1]], '#size-cells': [[1]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/brcm,brcmnand.example.dtb: nand-controller@10000200: nand@0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nand-ecc-strength', 'nand-on-flash-bbt', 'reg' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230606175246.190465-11-miquel.raynal@bootlin.com

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
