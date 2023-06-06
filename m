Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903C5C7EE2A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 18:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIqEqObjLqlSwFaAdnwTINhIAO0tarBzIi35mnT3kD8=; b=uqkBwvyVMe9CLc
	t2KWSf109kSespzZ6SR1WqGngGPTDCUm5sYEtZ4unijzc69+5vSATxNe+W24t4ZwFc51bUofHJuwr
	C5resSjg9qWaaDLmR9mrMdk+pwr46H15Cn2bCeeCwH3oejHpuH7lBj209MrqWOhePUFn80ogM91kM
	OjmPPXtYzNUY4pEr+CXm4KKaxyrVTUlQ9HZNmKQDK4SQkD2SBdbMPg1LXulIXsGxOZVcJrhS+NEfA
	chthnKvBXhBb2vqcHJUeQnnjbFfcTTqEyrgd9JPgrapS58aqYv44v8hw9ltcagTV1m3zi9ByL70nX
	PZO0khaL4C2FMmBEP9hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bn8-002pEU-1H;
	Tue, 06 Jun 2023 18:52:26 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bn5-002pCO-1B
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 18:52:24 +0000
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-33b3fa03738so232205ab.1
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 11:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686077542; x=1688669542;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g7ySt9S9+1IxxubjMQVvExdjJhwIi1vFWRB5NUPlv8I=;
        b=Era0S9PEjsdExg1HenAUTgdMTEQ8cH9AiTdmtxNR2eSh8o3CuaShv/+U/RFBGcr3Gg
         bHHdo+ZxJg+It9iZfjpBgFS6PBgInMS6svMzScHgBIXkSfU/DC3ArnEDk0fkFTHmRFoj
         t9d6lEYMBjTNN3PvUeEh3ff9ysmzwMgJYWcQPZ1Cgmo9qdqX2lgf6QIaj46HgRrqWPmi
         K33wnZUyXkqibj1V7dFn+BMbFGxTK4ccqGbHdMu6SShR9jQCyLAX60O3sSZvGbPOElG2
         VbVvEJDiw8ZdtBJvk101fImtR3P5OpZBy3dpZphRPWUXSMAi26fHJ5VsboF7OQQ4PXtl
         o/+g==
X-Gm-Message-State: AC+VfDyOPXVOOAnu9MO95hg5L1v4c78x/ry85MdtB9IulOQfAtGmM/kR
	2Bi4eiURGq7wkrd032y4Zg==
X-Google-Smtp-Source: ACHHUZ4HJV+ykjkCC5jDPohhB66SaTHJdLRvLFc/91wp0Ivo7MIooI5I9Se42TKUUDfgsbWsoFcHCg==
X-Received: by 2002:a92:dc86:0:b0:33d:7144:7b98 with SMTP id c6-20020a92dc86000000b0033d71447b98mr4144016iln.3.1686077542651;
        Tue, 06 Jun 2023 11:52:22 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id u26-20020a02cbda000000b0040fc9317650sm1148641jaq.62.2023.06.06.11.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 11:52:22 -0700 (PDT)
Received: (nullmailer pid 1468447 invoked by uid 1000);
	Tue, 06 Jun 2023 18:52:00 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Rob Herring <robh+dt@kernel.org>, Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
In-Reply-To: <20230606175246.190465-13-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-13-miquel.raynal@bootlin.com>
Message-Id: <168607751649.1468346.12620524659551431762.robh@kernel.org>
Subject: Re: [PATCH v2 12/17] dt-bindings: mtd: intel: Prevent NAND chip
 unevaluated properties
Date: Tue, 06 Jun 2023 12:52:00 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_115223_418276_DE68AD9C 
X-CRM114-Status: GOOD (  15.92  )
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


On Tue, 06 Jun 2023 19:52:41 +0200, Miquel Raynal wrote:
> nand-ecc-mode is a generic property which may apply to any raw NAND
> chip, it does not need to be listed in each controller
> description. Instead, let's reference the raw NAND chip description file
> which contains the property. The description contained
> "additionalProperties: false" which is wrong as other properties such as
> partitions might very well be added in the final .dts, and anyway needs
> to be converted into "unexpectedProperties: false" to fit the property
> change new requirements.
> 
> Cc: Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.example.dtb: nand-controller@e0f00000: nand@0: False schema does not allow {'reg': [[0]], 'nand-ecc-mode': ['hw']}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.example.dtb: nand-controller@e0f00000: nand@0: Unevaluated properties are not allowed ('nand-ecc-mode' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230606175246.190465-13-miquel.raynal@bootlin.com

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
