Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5460DEB64D9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 05:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T3Bu7NGoS8zGz72F/DqAkuD8nOpb7iXkIyW/HAzSmu4=; b=rI/Ia6jhtlIqPr
	a7TUd3HpITrw6yh3crXReR6ps/wGBSAHdlK5wZTrldizwkx5z+SQqD3vCXMsPtirSv5sJNwsvmkyV
	NY5Pqkp+eyxgrY5QacF4AV81Dhq0ezH44v7YFfniQMWfakMXBdqHGJYWuMwELvfMAw3GP5DxRq8EH
	CJyn/nzUe36ASCgXfyGMJN5U5obZdCXsk0uWBS/8RkA8PuBeE5bEsuRMRamkbWAFl6Cj71uiHfxbu
	V5BD8yQwAOM5dvOXMH6uxlPKMAJWEqpH+sfc2f+x5ZZ0vLvDopuAEbZquEoItLp6CJxwxLxITKj9t
	NehODo0DONtrEcIOyMgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9fUf-00Di4D-2o;
	Thu, 15 Jun 2023 05:26:01 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9fUb-00Di38-3A;
	Thu, 15 Jun 2023 05:25:59 +0000
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-77acb944bdfso404932439f.0;
        Wed, 14 Jun 2023 22:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686806756; x=1689398756;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8XvSUs++s8SCtB1NRYbEUottu+u+FOeTtSd2dCMIl4=;
        b=QNfcihyraNF19Ui8NH0hydb1jD1oNXB6ji7yCthZKc0a/gvUzJz+1SXD6+HwxffX8Q
         C+Tv0NF3VhcjW23ydE9v5Bh3nQ2B76jG9SycdIBwMa9EOt/zqhjySgLJW1ZffbUigI1u
         sWDbpZqq7caZPkp1ZlATrNxi3Y5zpSokp7GgSPF/ejPJsVJ61qCHU7TtMGBm/mKk3eew
         qgSktlJVEoP6ozl1oWnPZPFlpPjlXz93/0yeBAPKLXgxh5WyC08fXzwdNrLDd3USdYfZ
         4TTz6dtBrHu1+xerqIj11Ubql60qy9dOXOuEmGAauDPLAnOfzXnkKWehV5Gubq2bZSEI
         0Ghg==
X-Gm-Message-State: AC+VfDw7W0SL3R+J5xMMtR88n7LUJFfqBzryLqpLnQh5wKIrCT+RRSyE
	S0Lbkx33Lv1AbHd6LrYZtQ==
X-Google-Smtp-Source: ACHHUZ5QDYc4xJaaMz9XXahg84pWJ2bqFrHsJ0QmkRBa48Qll6rYChqgYKtFR7u+3VZBUkMpS5dA8w==
X-Received: by 2002:a5d:8513:0:b0:74c:c6ed:6de with SMTP id q19-20020a5d8513000000b0074cc6ed06demr17005254ion.12.1686806755909;
        Wed, 14 Jun 2023 22:25:55 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k8-20020a02c768000000b00416650ba62esm5415546jao.76.2023.06.14.22.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 22:25:55 -0700 (PDT)
Received: (nullmailer pid 3823193 invoked by uid 1000);
	Thu, 15 Jun 2023 05:25:53 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, vigneshr@ti.com, miquel.raynal@bootlin.com, krzysztof.kozlowski+dt@linaro.org, richard@nod.at, Vadym Kochan <vadym.kochan@plvision.eu>, linux-arm-kernel@lists.infradead.org, gregory.clement@bootlin.com, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20230615040447.3484564-4-chris.packham@alliedtelesis.co.nz>
References: <20230615040447.3484564-1-chris.packham@alliedtelesis.co.nz>
 <20230615040447.3484564-4-chris.packham@alliedtelesis.co.nz>
Message-Id: <168680675314.3823167.2320130564713925420.robh@kernel.org>
Subject: Re: [PATCH v9 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Date: Wed, 14 Jun 2023 23:25:53 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_222558_047266_57DB8A9E 
X-CRM114-Status: GOOD (  26.78  )
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


On Thu, 15 Jun 2023 16:04:47 +1200, Chris Packham wrote:
> From: Vadym Kochan <vadym.kochan@plvision.eu>
> 
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> The text binding didn't mention it as a requirement but existing usage
> has
> 
>    compatible = "marvell,armada-8k-nand-controller",
>                 "marvell,armada370-nand-controller";
> 
> so the YAML allows this in addition to the individual compatible values.
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
>  .../bindings/mtd/marvell,nand-controller.yaml | 218 ++++++++++++++++++
>  .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ----------
>  MAINTAINERS                                   |   1 -
>  3 files changed, 218 insertions(+), 127 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml: Error in referenced schema matching $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230615040447.3484564-4-chris.packham@alliedtelesis.co.nz

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
