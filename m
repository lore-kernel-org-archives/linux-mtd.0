Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE56EB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 05:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ad5tSct+XW8jhMQN8E66g8yNuoE3Mt1HKUKPk0OtA5g=; b=SHG34uW9TbwYvw
	x/aXJnzAaCaFnrT9+aV2czh5YAt2EU0VrAnmnFCEll7F/Xa7eWMgwSLg8Sjq91r5B/NaOamY9GawW
	yrj88M7XiniCpx4yGENtqSAFQN1qUp84dZctldtqCwHnS7pI3MU1M4QZ4e3QWakddtOCxHoHF9VhA
	NBfG1mjCVJYcZp4nbmW79Td67TUKE/mri4ojGILdKRD/n48XJ/jrxxsEiQg2cPt9Qz/RTJtB8gGu6
	bMRJEhXHumgmXRFcSyNKVoWJeWTGEbUdbUviLnftzxYATA6FxADsSddakrlZh8KVgcfo9qc7+j3f3
	41x/hXMYkivKkXU3tl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB7F6-007T2a-1d;
	Mon, 19 Jun 2023 05:15:56 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB7F3-007T1s-1R
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 05:15:55 +0000
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-77de67139ccso159437139f.0
        for <linux-mtd@lists.infradead.org>; Sun, 18 Jun 2023 22:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687151752; x=1689743752;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hv4CEmAhj1Hi95VDdTjMuzk8MJM/EyaFg5RhCCtRkFc=;
        b=cVKbWA0R+8C95OCDADo9bL5lsTxeT0YhH4YjfqTj6eQ0Kek2xH5Ol/UZXWnMAYBbIF
         7DgJD+SX6TmOArJTvLwBpKtyUnc0VXu/ncEjvQZQ6dYrbTog+wEb75ckvCo4wgY6x5PP
         XLro+4W6/Qk/w4AAdSy0qqVlhv4pW4StvBucBvd4/z7CIP4PP60sMuWYCmiu01OKfyG8
         KHdzwnGRXjMDn1c6dvJ6wghJWJligxq56vA5fwrKZhPgAN1YqKynWqoMyJaQVlwU8Hx6
         Qd606DZD3MUAnfKQWcvTe32Rbg1DA9yM8+VgutiUWXzZXJGdnKArXJRVqDhDIfe+rJha
         3XMQ==
X-Gm-Message-State: AC+VfDyZHswZyRe05jMxYA4DZWjCBH/srWpdMj32WTUa+VChyRfS9Rnt
	0+0ENT1HrOUBFgweYd0b+Q==
X-Google-Smtp-Source: ACHHUZ7Fz0Fna1FCPaUxoew0s8JvdN7I9AHqi+3UkyUlgo1Jp7ZxcUpFDE2ePaiMg6nFm7fhKwaYyA==
X-Received: by 2002:a92:d482:0:b0:342:2727:92ea with SMTP id p2-20020a92d482000000b00342272792eamr4065576ilg.28.1687151751957;
        Sun, 18 Jun 2023 22:15:51 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id t12-20020a02c48c000000b0040f94261ab1sm7967930jam.12.2023.06.18.22.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 22:15:51 -0700 (PDT)
Received: (nullmailer pid 72683 invoked by uid 1000);
	Mon, 19 Jun 2023 05:15:49 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, Vadym Kochan <vadym.kochan@plvision.eu>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, richard@nod.at, miquel.raynal@bootlin.com, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <20230619040742.1108172-2-chris.packham@alliedtelesis.co.nz>
References: <20230619040742.1108172-1-chris.packham@alliedtelesis.co.nz>
 <20230619040742.1108172-2-chris.packham@alliedtelesis.co.nz>
Message-Id: <168715174979.72667.4900626634189785417.robh@kernel.org>
Subject: Re: [PATCH v10 1/1] dt-bindings: mtd: marvell-nand: Convert to
 YAML DT scheme
Date: Sun, 18 Jun 2023 23:15:49 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_221553_510350_51BAC0DF 
X-CRM114-Status: GOOD (  26.23  )
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


On Mon, 19 Jun 2023 16:07:42 +1200, Chris Packham wrote:
> From: Vadym Kochan <vadym.kochan@plvision.eu>
> 
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> There was also an incorrect reference to dma-names being "rxtx" where
> the driver and existing device trees actually use dma-names = "data" so
> this is corrected in the conversion.
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v10:
>     - Formatting for description
>     - Restrict clocks to 1 item for non-8K devices
>     - Don't allow "marvell,armada-8k-nand-controller" without
>       "marvell,armada370-nand-controller" (undoes a change from v8)
> 
>     Changes in v9:
>     - depend on series from Miquel
>       https://lore.kernel.org/linux-mtd/20230606175246.190465-1-miquel.raynal@bootlin.com/
>     - enforce minimum/maximum for nand-rb
>     - move required: block for controller
>     - move unevaluatedProperties: for nand chip
>     - remove label, partitions and nand-on-flash-bbt which are covered by
>       generic schema
> 
>     Changes in v8:
>     - Mark deprecated compatible values as such
>     - Allow "marvell,armada-8k-nand-controller" without
>       "marvell,armada370-nand-controller"
>     - Make dma-names usage reflect reality
>     - Update commit message
> 
>     Changes in v7:
>     - Restore "label" and "partitions" properties (should be picked up via
>       nand-controller.yaml but aren't)
>     - Add/restore nand-on-flash-bbt and nand-ecc-mode which aren't covered
>       by nand-controller.yaml.
>     - Use "unevalautedProperties: false"
>     - Corrections for clock-names, dma-names, nand-rb and nand-ecc-strength
>     - Add pxa3xx-nand-controller example
> 
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
>  .../bindings/mtd/marvell,nand-controller.yaml | 226 ++++++++++++++++++
>  .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ----------
>  MAINTAINERS                                   |   1 -
>  3 files changed, 226 insertions(+), 127 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/marvell,nand-controller.example.dtb: nand-controller@d0000: nand@0: False schema does not allow {'reg': [[0]], 'label': ['main-storage'], 'nand-rb': [[0]], 'nand-ecc-mode': ['hw'], 'marvell,nand-keep-config': True, 'nand-on-flash-bbt': True, 'nand-ecc-strength': [[4]], 'nand-ecc-step-size': [[512]], 'partitions': {'compatible': ['fixed-partitions'], '#address-cells': [[1]], '#size-cells': [[1]], 'partition@0': {'label': ['Rootfs'], 'reg': [[0, 1073741824]]}}}
	from schema $id: http://devicetree.org/schemas/mtd/marvell,nand-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/marvell,nand-controller.example.dtb: nand-controller@d0000: nand@0: Unevaluated properties are not allowed ('label', 'nand-on-flash-bbt', 'partitions' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/marvell,nand-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/marvell,nand-controller.example.dtb: nand-controller@720000: nand@0: False schema does not allow {'reg': [[0]], 'label': ['main-storage'], 'nand-rb': [[0]], 'nand-ecc-mode': ['hw'], 'nand-ecc-strength': [[8]], 'nand-ecc-step-size': [[512]]}
	from schema $id: http://devicetree.org/schemas/mtd/marvell,nand-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/marvell,nand-controller.example.dtb: nand-controller@720000: nand@0: Unevaluated properties are not allowed ('label' was unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/marvell,nand-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/marvell,nand-controller.example.dtb: nand-controller@43100000: nand@0: False schema does not allow {'reg': [[0]], 'nand-rb': [[0]], 'nand-ecc-mode': ['hw'], 'marvell,nand-keep-config': True}
	from schema $id: http://devicetree.org/schemas/mtd/marvell,nand-controller.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230619040742.1108172-2-chris.packham@alliedtelesis.co.nz

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
