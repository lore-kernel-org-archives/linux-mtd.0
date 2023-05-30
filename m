Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57CEC7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 12:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejb6NKAFVBGb1SXwhFZjG/SC7oUg/JjKoVyWBv/n29Q=; b=civi7iRxsEexiE
	A0ulbXI30BD8BlTZoASxdYYysr/33I2t8Cq2mM2g2XZAZOVmJPZmdv3li0gS5GR4O+N+zgwBJ9B7I
	E+P1xVp2tJbJqM613lPQfAnRBT2Zz80yK9FwrJKu+4HEvqJZvkrNUmiEbFLGd05PZFojvHIJdIELb
	4uNRKcJk6P2PSMSoaH70+Ok1QcD5IUemGb31P2B1bfp8ZGaaN0tDeJll1+EIc6b7jW3cTyAxVJenq
	4BKyGPLAjNOCqbmtUGd2KD7n+isKszMaVUdL+2Vi6rqSHk6U1cmKu1daWayg3ser0dkUwwzVcqKN6
	ASW9i7wzv1pPRM/ctqcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3yQu-00DqJg-0f;
	Tue, 30 May 2023 12:26:36 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3yQq-00DqHH-0E
	for linux-mtd@lists.infradead.org;
	Tue, 30 May 2023 12:26:33 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51458e3af68so7662811a12.2
        for <linux-mtd@lists.infradead.org>; Tue, 30 May 2023 05:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685449589; x=1688041589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ub2jFuE5gMHKMlSzwzuEodjcrijcn62V/6/B6MhqQhc=;
        b=qh/qvot4P8OSccQ721U0TbPfiUZ2MkUkLg6GYmqJl98rznbMj+QrOBvbFVbkPydASF
         LzW5QP1KmXdqZpRPgQVXcOSeptA6FqvQIOjFIfSwbSMdqfUOBLzOTXZLQi3y6/EEcw0J
         aD4o2QYEVfOLOB3agcEmZ/iWEeqDC6pOp2aQFq/VKFpZJRVK7wcYRvse34daaVzlbkxr
         9e6J8/OYAfxrmpm2Iot/cKE+rrBAmHt8RC13B3ex7bGKN5KvfezycTJkbxqT0/R4MKQW
         ApqDL6AwTMuOUROHrTmqYSminYZWxQkGV+a4moxtBiev6iTHUD3einSrepKu7jpJYVsO
         /TjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449589; x=1688041589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub2jFuE5gMHKMlSzwzuEodjcrijcn62V/6/B6MhqQhc=;
        b=OObZc1yXd/nsjzLO3AzUYdTgqhm3aKCYOnN08lFYG40it38IwyEynR/3xFpcvXsnZl
         orn/YMmhxuCgMzw+c2e6Grsgb8BXJlOMEMnCfw1awyPR6kVF0VG629bjS9YSwsDIeU1r
         UfYk1M7RVuRRoiCcfytUxCdrwGz9cSc2Wu3fo8Cp+O8AqYu2bbviISbmOQ6xhp2C/6Wj
         xucYDIVi1dvhbyvXD9nQ4MK8wwxRPE7d3TKaCuXgm3p2VRecsfsqyxxo7AxEGkRWGy95
         uIWERnpBeZ06c9ON9BkCuWi7VWWwmPJHD+03BgICoC6eQx/wxHEIqWOffYZtb5ChZGbc
         xqwQ==
X-Gm-Message-State: AC+VfDwKDlN9dYpSfovmfa1CV0ZGj5n4i1N+EBY9wiA8LXIsiYxDeJoU
	9YsLf8QRB9DkpGwIoOEPOzm9MQ==
X-Google-Smtp-Source: ACHHUZ5N9YGr7jhYOHfatMd2J3ATCqrXHGlWqINWgXg89tGAE4MPMAg3iZYD7ksIssI/7q2AiyJ5Mg==
X-Received: by 2002:a17:907:d88:b0:96a:43b9:95b1 with SMTP id go8-20020a1709070d8800b0096a43b995b1mr2447111ejc.59.1685449588892;
        Tue, 30 May 2023 05:26:28 -0700 (PDT)
Received: from krzk-bin ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id k17-20020a170906681100b0096f7105b3a6sm7242500ejr.189.2023.05.30.05.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:26:28 -0700 (PDT)
Date: Tue, 30 May 2023 14:26:25 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: miquel.raynal@bootlin.com, sebastian.hesselbarth@gmail.com,
	gregory.clement@bootlin.com, vadym.kochan@plvision.eu,
	linux-kernel@vger.kernel.org, vigneshr@ti.com, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, andrew@lunn.ch,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-mtd@lists.infradead.org, enachman@marvell.com,
	devicetree@vger.kernel.org, richard@nod.at
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Message-ID: <20230530122625.7zu3ey5dnn6izeli@krzk-bin>
References: <20230530005337.3687938-1-chris.packham@alliedtelesis.co.nz>
 <20230530005337.3687938-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230530005337.3687938-2-chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_052632_109732_29924B00 
X-CRM114-Status: GOOD (  20.07  )
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

On Tue, 30 May 2023 12:53:36 +1200, Chris Packham wrote:
> From: Vadym Kochan <vadym.kochan@plvision.eu>
> 
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> Dropped deprecated compatibles and properties described in txt file.
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v6:
>     - remove properties covered by nand-controller.yaml
>     - add example using armada-8k compatible
> 
>     earlier changes:
> 
>     v5:
>        1) Get back "label" and "partitions" properties but without
>           ref to the "partition.yaml" which was wrongly used.
> 
>        2) Add "additionalProperties: false" for nand@ because all possible
>           properties are described.
> 
>     v4:
>        1) Remove "label" and "partitions" properties
> 
>        2) Use 2 clocks for A7K/8K platform which is a requirement
> 
>     v3:
>       1) Remove txt version from the MAINTAINERS list
> 
>       2) Use enum for some of compatible strings
> 
>       3) Drop:
>             #address-cells
>             #size-cells:
> 
>          as they are inherited from the nand-controller.yaml
> 
>       4) Add restriction to use 2 clocks for A8K SoC
> 
>       5) Dropped description for clock-names and extend it with
>          minItems: 1
> 
>       6) Drop description for "dmas"
> 
>       7) Use "unevalautedProperties: false"
> 
>       8) Drop quites from yaml refs.
> 
>       9) Use 4-space indentation for the example section
> 
>     v2:
>       1) Fixed warning by yamllint with incorrect indentation for compatible list
> 
>  .../bindings/mtd/marvell,nand-controller.yaml | 190 ++++++++++++++++++
>  .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ------------
>  MAINTAINERS                                   |   1 -
>  3 files changed, 190 insertions(+), 127 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1787248


nand@720000: $nodename:0: 'nand@720000' does not match '^nand-controller(@.*)?'
	arch/arm64/boot/dts/marvell/armada-7040-db.dtb
	arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb
	arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb
	arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb
	arch/arm64/boot/dts/marvell/armada-8040-db.dtb
	arch/arm64/boot/dts/marvell/armada-8040-db.dtb
	arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb
	arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb
	arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb
	arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb
	arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb
	arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb
	arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb
	arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb
	arch/arm64/boot/dts/marvell/cn9130-db-B.dtb
	arch/arm64/boot/dts/marvell/cn9130-db.dtb
	arch/arm64/boot/dts/marvell/cn9131-db-B.dtb
	arch/arm64/boot/dts/marvell/cn9131-db-B.dtb
	arch/arm64/boot/dts/marvell/cn9131-db.dtb
	arch/arm64/boot/dts/marvell/cn9131-db.dtb
	arch/arm64/boot/dts/marvell/cn9132-db-B.dtb
	arch/arm64/boot/dts/marvell/cn9132-db-B.dtb
	arch/arm64/boot/dts/marvell/cn9132-db-B.dtb
	arch/arm64/boot/dts/marvell/cn9132-db.dtb
	arch/arm64/boot/dts/marvell/cn9132-db.dtb
	arch/arm64/boot/dts/marvell/cn9132-db.dtb

nand@720000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
	arch/arm64/boot/dts/marvell/cn9130-db-B.dtb
	arch/arm64/boot/dts/marvell/cn9131-db-B.dtb
	arch/arm64/boot/dts/marvell/cn9132-db-B.dtb

nand-controller@43100000: clock-names: ['core'] is too short
	arch/arm/boot/dts/pxa300-raumfeld-connector.dtb
	arch/arm/boot/dts/pxa300-raumfeld-controller.dtb
	arch/arm/boot/dts/pxa300-raumfeld-speaker-l.dtb
	arch/arm/boot/dts/pxa300-raumfeld-speaker-m.dtb
	arch/arm/boot/dts/pxa300-raumfeld-speaker-one.dtb
	arch/arm/boot/dts/pxa300-raumfeld-speaker-s.dtb

nand-controller@43100000: dma-names:0: 'rxtx' was expected
	arch/arm/boot/dts/pxa300-raumfeld-connector.dtb
	arch/arm/boot/dts/pxa300-raumfeld-controller.dtb
	arch/arm/boot/dts/pxa300-raumfeld-speaker-l.dtb
	arch/arm/boot/dts/pxa300-raumfeld-speaker-m.dtb
	arch/arm/boot/dts/pxa300-raumfeld-speaker-one.dtb
	arch/arm/boot/dts/pxa300-raumfeld-speaker-s.dtb

nand-controller@43100000: Unevaluated properties are not allowed ('dma-names' was unexpected)
	arch/arm/boot/dts/pxa300-raumfeld-connector.dtb
	arch/arm/boot/dts/pxa300-raumfeld-controller.dtb
	arch/arm/boot/dts/pxa300-raumfeld-speaker-l.dtb
	arch/arm/boot/dts/pxa300-raumfeld-speaker-m.dtb
	arch/arm/boot/dts/pxa300-raumfeld-speaker-one.dtb
	arch/arm/boot/dts/pxa300-raumfeld-speaker-s.dtb

nand-controller@d0000: nand@0:partitions: Unevaluated properties are not allowed ('partition@errlog', 'partition@nand-bbt', 'partition@user' were unexpected)
	arch/arm/boot/dts/armada-385-atl-x530.dtb

nand-controller@d0000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
	arch/arm/boot/dts/armada-385-atl-x530.dtb

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
