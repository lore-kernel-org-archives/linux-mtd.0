Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9512C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 18:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PEr8349maqtAHwF4ZFxWwdYsuXPEMXtcWrfc5owJlw=; b=ihiFIa0soaMziK
	JAdTvot57R4gq52lKMFbwLBgeF4IWPsdi3FJHZJMk6biGYXEIIqdghkmr+n8qCcnQnfMPfAIFNhZ5
	zy310uiuTta/FRSUSyglvsOY/aoATimvCFZMkfyj8wLJKlijKkUgHrtbLbuYCzog+HoIwpoIJLZWT
	uFfO6jbl6o1gPS+1adH8QxRTSxEa1K2TF59Ltu+y3c/48bOIHVfgvjlWN7OIUVfOJ8RENo0P5L3l0
	lDnBWg8MVr7hvi4cIwWUBWzhLEMz5t7o4/Vu0SsowGopIxbPyVajhr6gKF3JkIUBnxPCe2Vp2ypF6
	M7u8fNIxx3ZEjvoIcaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bn6-002pDL-2O;
	Tue, 06 Jun 2023 18:52:24 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bn3-002pAN-0Z
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 18:52:22 +0000
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-33be5dbb90cso114725ab.0
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 11:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686077539; x=1688669539;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bpGuV4ylP5y+aGnKRHCBKkjEM1ME7odWnVStW6c6uLQ=;
        b=gnsfGSSW3EmYOGNjqgmIwniNj+7aM+2HecgFTrpq+mZCjhjKMJdKxx5jdKo5AiudAs
         6PXvExG/JfwhT05pEVAttOKhmx4e4XlUX7n0WhifMvpuNo0kwsD87kiGDqmW+4AQgMZA
         CbysXqVqXQJAI4W5COp6K9CpbBUcISz6+1OpR32yamnTDz40+ii0dSTeGiKlFmJQsNaF
         ABqQv0CcHA4kZLIT+nx697RD8PZ9VvlbSkad/AOFfCOVRyn57+PFWIhCchrqk02XuiJB
         UR500tp/NKQY0JPNwlZax1uDz4CA5ZlBIqVWM27Ov/LdGmjosokKyR2lbGvVYt58kcXk
         L9fw==
X-Gm-Message-State: AC+VfDwpmMI9OaMKk9TfLzfYGKYsII5UlaLWad9f0foV0K5Frzipv9SR
	+0rdw6YBSf+5mRnR5iqQ2w==
X-Google-Smtp-Source: ACHHUZ5TBa6xVydgvF6jjP9b1cwD1GwMqQ95Lw1tLxw0YFa0O7pviRyuU9tpBAvAjvavZx3uoEW4yw==
X-Received: by 2002:a05:6e02:4c4:b0:33a:c9dc:9d50 with SMTP id f4-20020a056e0204c400b0033ac9dc9d50mr2302376ils.1.1686077539210;
        Tue, 06 Jun 2023 11:52:19 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id u10-20020a02c04a000000b004167410a9bcsm1270242jam.113.2023.06.06.11.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 11:52:18 -0700 (PDT)
Received: (nullmailer pid 1468453 invoked by uid 1000);
	Tue, 06 Jun 2023 18:52:00 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Matthias Brugger <matthias.bgg@gmail.com>, Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>, Xiangsheng Hou <xiangsheng.hou@mediatek.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20230606175246.190465-17-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-17-miquel.raynal@bootlin.com>
Message-Id: <168607752058.1468418.10172367181635914044.robh@kernel.org>
Subject: Re: [PATCH v2 16/17] dt-bindings: mtd: mediatek: Prevent NAND chip
 unevaluated properties
Date: Tue, 06 Jun 2023 12:52:00 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_115221_221443_D01DA8F0 
X-CRM114-Status: GOOD (  15.45  )
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


On Tue, 06 Jun 2023 19:52:45 +0200, Miquel Raynal wrote:
> nand-on-flash-bbt is a generic property which may apply to any raw NAND
> chip, it does not need to be listed in each controller
> description. The raw NAND chip description file which contains the
> property is already referenced, so no need to mention the property here
> again.
> 
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.example.dtb: nand-controller@1100d000: nand@0: Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230606175246.190465-17-miquel.raynal@bootlin.com

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
