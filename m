Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EEAC7EE31
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 18:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWYOejlOQ9WjHBf8gGST0XEqJtG3A5YneMbQUCEtLkY=; b=DQP0P+PoTp8dov
	C2toPQBeubcMDnEfz0OKGjaShMjPne5YAo20eqjUBlEJdDyB57DAtfxjB9xGtuyOa8J/5p15ja60n
	TdJcMh4E7WiZU6EPvA+R8x9vgNsEa662oXxmKCpPqGReaHcQIJsRKuyTgRZB/OPXAJ4003OaOrBlJ
	Hmp5bEVM38yMm00dXVgNsnNQd/G/AfGsZTl8ktrPR+sWClwnKVY2re2QUDmAnTkwMD2yJCx+LXakO
	qUFGCbuzjhn5MI8sgySdRUJxSp+4UVYaRFwSGEMgpR3nMtGMRNHqRvqGHYh2eGhr/f8UIT2qdhjba
	uU+4+5SzJ8U6DZiBNBZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bmt-002p6Q-13;
	Tue, 06 Jun 2023 18:52:11 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bmq-002p4g-1n
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 18:52:10 +0000
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-777b4c9e341so108580039f.0
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 11:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686077523; x=1688669523;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7EAVpIrRn6QWhcISMayUZMcBokJpsHkZHf77Jv7Sy08=;
        b=bgkhIHRFR3po7ZmAgXnlVwr06Do+JrQM2b41/sip65IZzAiTGk925xXEveWSv/1dpX
         udxGtPZzCL5+sbmr3JC5Fbkvtx5t7VXxVVRGFoXXtZESH2WqttiGakauaUvH/3yNiu2J
         9AT4VZGyYng9T6erFYRFD/EguusUHhqi2ktVlKQV+YHkuRbO1dgOlg5vMenaVEQMHmbj
         txAUK/E7oa1NTVNglCE992V37SZtXYfHLrAIqEtT52n7lHg5fhx+K3VPNI5dgzHYbg3D
         jclLIplY0In25FO1xQmO27vE4RWX0KC20EE8VE0c1vntL2WNjNhZ5hD9ddugOxwhRjqc
         sg5g==
X-Gm-Message-State: AC+VfDyDENp0ocBQUWyOMPDLujpSwUTDeDoHwTgwdobya2LmvCZ6UBkO
	HDbDFBhUEYFW4sTTcaPiHg==
X-Google-Smtp-Source: ACHHUZ5JzpYJgWaSrOgMjIEvAY3GAqNx45s9u9vyU7PJx9ppmDzkN55/50vk5bE1tsxne0aIZf03zA==
X-Received: by 2002:a6b:e312:0:b0:774:9b75:b463 with SMTP id u18-20020a6be312000000b007749b75b463mr4968862ioc.7.1686077523347;
        Tue, 06 Jun 2023 11:52:03 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k17-20020a6b4011000000b00752f62cd3bdsm3360058ioa.12.2023.06.06.11.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 11:52:02 -0700 (PDT)
Received: (nullmailer pid 1468436 invoked by uid 1000);
	Tue, 06 Jun 2023 18:52:00 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Pratyush Yadav <pratyush@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Michael Walle <michael@walle.cc>, Paul Cercueil <paul@crapouillou.net>, Richard Weinberger <richard@nod.at>
In-Reply-To: <20230606175246.190465-8-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-8-miquel.raynal@bootlin.com>
Message-Id: <168607750937.1468225.8457774415279003681.robh@kernel.org>
Subject: Re: [PATCH v2 07/17] dt-bindings: mtd: ingenic: Prevent NAND chip
 unevaluated properties
Date: Tue, 06 Jun 2023 12:52:00 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_115208_597694_F942AE97 
X-CRM114-Status: GOOD (  13.29  )
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


On Tue, 06 Jun 2023 19:52:36 +0200, Miquel Raynal wrote:
> List all the possible properties in the NAND chip as per the example and
> set unevaluatedProperties to false in the NAND chip section.
> 
> Cc: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/ingenic,nand.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mtd/ingenic,nand.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ingenic,nand.example.dtb: nand-controller@1: nand@1: False schema does not allow {'reg': [[1]], 'nand-ecc-step-size': [[1024]], 'nand-ecc-strength': [[24]], 'nand-ecc-mode': ['hw'], 'nand-on-flash-bbt': True, 'pinctrl-names': ['default'], 'pinctrl-0': [[4294967295]], 'partitions': {'compatible': ['fixed-partitions'], '#address-cells': [[2]], '#size-cells': [[2]], 'partition@0': {'label': ['u-boot-spl'], 'reg': [[0, 0, 0, 8388608]]}, 'partition@800000': {'label': ['u-boot'], 'reg': [[0, 8388608, 0, 2097152]]}, 'partition@a00000': {'label': ['u-boot-env'], 'reg': [[0, 10485760, 0, 2097152]]}, 'partition@c00000': {'label': ['boot'], 'reg': [[0, 12582912, 0, 67108864]]}, 'partition@4c00000': {'label': ['system'], 'reg': [[0, 79691776, 1, 4215275520]]}}}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ingenic,nand.example.dtb: nand-controller@1: nand@1: Unevaluated properties are not allowed ('nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-bbt', 'partitions', 'reg' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230606175246.190465-8-miquel.raynal@bootlin.com

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
