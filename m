Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321C0C7EE2C
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 18:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBSskbzUddGR2WYV2A2vIcex9K4Bebv7+N/TtyXN7TI=; b=EId3WYr0OTC/xC
	Wpaw8bCppqdRswLDhpiAsSru35yGE4p0kf2BCz/DF12omcBBq9o2sf3QP4ISv5mRWvlqaAkcEoprb
	hIDeFb358RZBGiXe6vd3T7BvnfiQAsCIzgcnDjGL+sbvI8Q655WgetWJQHWVg6Felo95Cz1a+wP+P
	KwkiiJJ6rMsI/5XZAu1vY14yiWOVwqvv7aTU4jEsYs4wGgnI9iTq8R85gU0Kbuf5+3eIga6Jxh218
	JLPQpBJY/7MLhTzg4k6dKhkBLOQB/IlUPzS22nbtx9FAB+jb/hDSxEBcstLSFzy3nMe0FNAgv881c
	aXRpxdhADReqdTWzYw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bmw-002p7n-37;
	Tue, 06 Jun 2023 18:52:14 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bmu-002p5V-1F
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 18:52:13 +0000
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-777b4c9e341so108589939f.0
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 11:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686077526; x=1688669526;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mbTz3L0KOieu2PiZ8/3f4rcShzBA+Lhe0vv5LvOZlFQ=;
        b=cLoCIQ0FlFV2G6IK2LSrnyIuwMPCliersPjFEZy0U2qy1IXxrXQI5m3ir4ZTVuCKUt
         VnhZq07nu/uxkfmTOcdBngnP+pAFVW1UQhxnn9rnYk6yDLtMGtPvQ57zegZx1putlsIp
         YZBJVQwR0dETSHC99v7VJVCLPPj8MGcO4GcCoOaFE+zgcWADV+AHy3u9JO36E8jfybaJ
         Hu/chXs+PbQDyRz3V5Xgkhk5c3vng/3wE/j9SNk1lJAlSo8A6SJktNYorJZwTkiKJfqY
         Q6E8V2Gtnpi1FBtYnGtSx1yiXsEOVTFtLkDn3vYoU+Du1Gh4ZHm9cTXFXhKDLa636oA7
         iaHw==
X-Gm-Message-State: AC+VfDw4nmQ3g+/VCQSV3vwLapE2Ia7hgu2sFmo1RrSPlg5Ce9dp8zUa
	HiGD0mgXq7OtFE6LoJ69BQ==
X-Google-Smtp-Source: ACHHUZ5Sq/LO+6kNTTuEb8BcXJe7Qx8KdEQpo/fTTTmeNTLsvky/8jqy90OxORpqg+yw44P6jflFTg==
X-Received: by 2002:a05:6602:1859:b0:766:48cf:6ca9 with SMTP id d25-20020a056602185900b0076648cf6ca9mr4506499ioi.12.1686077526284;
        Tue, 06 Jun 2023 11:52:06 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id t2-20020a05663801e200b0041643b78cbesm3045952jaq.120.2023.06.06.11.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 11:52:05 -0700 (PDT)
Received: (nullmailer pid 1468451 invoked by uid 1000);
	Tue, 06 Jun 2023 18:52:00 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Vignesh Raghavendra <vigneshr@ti.com>, Xiangsheng Hou <xiangsheng.hou@mediatek.com>, linux-mtd@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Michael Walle <michael@walle.cc>
In-Reply-To: <20230606175246.190465-16-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-16-miquel.raynal@bootlin.com>
Message-Id: <168607751913.1468392.4718392727141734461.robh@kernel.org>
Subject: Re: [PATCH v2 15/17] dt-bindings: mtd: mediatek: Reference
 raw-nand-chip.yaml
Date: Tue, 06 Jun 2023 12:52:00 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_115212_429764_9FAF40F0 
X-CRM114-Status: GOOD (  14.36  )
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


On Tue, 06 Jun 2023 19:52:44 +0200, Miquel Raynal wrote:
> The mediatek NAND controller should reference the new raw-nand-chip.yaml
> binding instead of the original nand-chip.yaml which does not contain
> *all* the properties that may be used to fully describe the NAND
> devices, certain properties being actually described under
> nand-controller.yaml.
> 
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.example.dtb: nand-controller@1100d000: nand@0: False schema does not allow {'reg': [[0]], 'nand-on-flash-bbt': True, 'nand-ecc-mode': ['hw'], 'nand-ecc-step-size': [[1024]], 'nand-ecc-strength': [[24]], 'partitions': {'compatible': ['fixed-partitions'], '#address-cells': [[1]], '#size-cells': [[1]], 'preloader@0': {'label': ['pl'], 'read-only': True, 'reg': [[0, 4194304]]}, 'android@400000': {'label': ['android'], 'reg': [[4194304, 314572800]]}}}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.example.dtb: nand-controller@1100d000: nand@0: Unevaluated properties are not allowed ('nand-ecc-step-size', 'nand-ecc-strength', 'partitions' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230606175246.190465-16-miquel.raynal@bootlin.com

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
