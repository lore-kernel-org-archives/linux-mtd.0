Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E753C77B73
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 18:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tz+KZVxTzOUgYRd3ejxMtnTHn3J2YQNKs/BfZxnnnaw=; b=2sSY1FuJqFBaTl
	3M5/FP2rHe+7KRQo/BTVH5vl11P0pvgTVFnZrElcdJrn0J8M8V8kfSrrrU755lxaMcGVC4Os6wJyU
	fjakJ9wABNjgl24jk3f0NSdYrDl/OlJQtLer9kMQc1F4V+x2yHQa7/O0d9eKOZ2EiYgMMCii3Raqw
	7ZA4ZFBKyjDL0wIaRIPQ+geKbBAHTSHdq2u8/fBHjxwdCJQh3Fyzo9s2Gj8/GW/7TXDhBA+H6bo+G
	EChaSegBMYYyMIfhBtkqImzPjRrjMeh5wjH3WYjktosdoHbJLTiBYvi4NEZWExXJL6HKz1RqxdMEd
	yokXHN5fpuzP+ypWYeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bn4-002pBg-0u;
	Tue, 06 Jun 2023 18:52:22 +0000
Received: from mail-il1-f180.google.com ([209.85.166.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bn1-002p8Y-0i
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 18:52:20 +0000
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-33b0bfb76cfso153765ab.2
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 11:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686077536; x=1688669536;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pBMEN+nt0y4256CRdPwMmK5SiiX7bkhje9VaIgEwu5o=;
        b=gONBjU4QLvtB8HUT9OND51W80izcZ6tYp9WvDvAR3FQSzbEEa3RSnqW4aIKqjlHMS8
         NeWs4fv6voF9a6+KBHFr3fewHJ/1s6KLMxXkAc2SnpScQdSHHFxqHtHbcvKdFin4DVDe
         UAoM2gppnGXeiK5mNDvp1Qep1tQmnoYnhHflbX2rN4HBN1p5Vg827UxYuPbj3Sh3Va/T
         N4uxvjY9zUlGbAkpOCqG7ILD5CE8gwvf+nfp39qAW0hK6hCY1LscfGvy4rQzYqPpk38l
         QchCRBbGMxLk1mfxC7AVgAfhNlQYCtxokjGfCtNUqaOn7O8xBoMz4WgPmvwndLxwfAPG
         HGkg==
X-Gm-Message-State: AC+VfDxjb8IokQ9m0jYcfjbAu6k33BVig3h5B6DEDWZnfBT1kK5ifITD
	8CDgr55l2LIPnjO73nkPzg==
X-Google-Smtp-Source: ACHHUZ4BAO024hmJwkdQzBpDU4BEynaZrPy+uuSqhUBaTcdROm1yuNk5vuNWpav/kSNZ4//TDH9Rzw==
X-Received: by 2002:a05:6e02:4c9:b0:33b:f0f1:dd04 with SMTP id f9-20020a056e0204c900b0033bf0f1dd04mr2515255ils.11.1686077536531;
        Tue, 06 Jun 2023 11:52:16 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id y4-20020a92c744000000b0033b2f5fe9bdsm3187424ilp.36.2023.06.06.11.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 11:52:15 -0700 (PDT)
Received: (nullmailer pid 1468449 invoked by uid 1000);
	Tue, 06 Jun 2023 18:52:00 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Michael Walle <michael@walle.cc>, Tudor Ambarus <tudor.ambarus@linaro.org>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>, Heiko Stuebner <heiko@sntech.de>
In-Reply-To: <20230606175246.190465-14-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-14-miquel.raynal@bootlin.com>
Message-Id: <168607751780.1468369.13951329348059073046.robh@kernel.org>
Subject: Re: [PATCH v2 13/17] dt-bindings: mtd: rockchip: Prevent NAND chip
 unevaluated properties
Date: Tue, 06 Jun 2023 12:52:00 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_115219_258748_C270FDDE 
X-CRM114-Status: GOOD (  13.41  )
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


On Tue, 06 Jun 2023 19:52:42 +0200, Miquel Raynal wrote:
> List all the possible properties in the NAND chip as per the example and
> set unevaluatedProperties to false in the NAND chip section.
> 
> Cc: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/rockchip,nand-controller.yaml      | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.example.dtb: nand-controller@ff4b0000: nand@0: False schema does not allow {'reg': [[0]], 'label': ['rk-nand'], 'nand-bus-width': [[8]], 'nand-ecc-mode': ['hw'], 'nand-ecc-step-size': [[1024]], 'nand-ecc-strength': [[16]], 'nand-is-boot-medium': True, 'rockchip,boot-blks': [[8]], 'rockchip,boot-ecc-strength': [[16]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.example.dtb: nand-controller@ff4b0000: nand@0: Unevaluated properties are not allowed ('label', 'nand-is-boot-medium' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230606175246.190465-14-miquel.raynal@bootlin.com

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
