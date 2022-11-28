Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1882CC43217
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 12:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfHwBEAcw6U/16qqWzRbEvIAu2gzrEzn5TbwRphp3cw=; b=pob2b74BTz88hc
	UCe15pcVD+pLUfw2qNbDtDxPI5eN8JZWQWBzdT8sYk8OC1sPYBszaM2BmzTfW/sZ1NSJ3Q2qWTnwj
	DuDWHevEC7frT5dLIJT8NFc4PHTGNfcVNO/7Zm4baA7gdqJLTpeGzJJ2H49zv14/U3Qok+hcefLiI
	VGXLfvaH61u5H9AJKHUR53gVy1vF8u4svCpFbP6llfjJeWRvTuBRC8B/ZepUehUI1tGmqfW5sXBIS
	DJ22HpSixJl/GgkJOvQnaNR9OiCv5jV1xz3VoxmNe97nQWqkw4tc6LLwgIrM1WnIXFPT3vtvn4Foh
	bvNF/n9/S1JFHo7GZqpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozd84-001VeR-42; Mon, 28 Nov 2022 12:20:56 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozd80-001VdT-E8; Mon, 28 Nov 2022 12:20:53 +0000
Received: by mail-oi1-f171.google.com with SMTP id m204so11330199oib.6;
        Mon, 28 Nov 2022 04:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+FPo2WMjz1oPDzlV6ADoN3PSIwjDDQpgyYjmLqfyYX4=;
        b=DNJngixakw0wea+CTLjOtEB8EyvqzwVMSi6iQ0TKULMMvATURdLrrigfUFXDep9xl+
         RIFR/Td4/pdwkb3CeAEa94qaHLFqDhFu4sCm3zCkRijgIkWryxSxuPBd9CMQ/i0RQOx2
         0FojA6j/V1qG7hNXqKrhm1Ty54ezW8hAZOg0uliH/9+C6sAqS35BXzfbQxUsrzfmeDV1
         1SSskUtCyJOFsmllfl57Rnm9iVdzS4TwwPMwSqruOhLj0vgRDzpHU8V6klxfQ8cdidCe
         n4N/vAYXx2SwlKViFXwheNrASS0WYpuhqsrVOqKPUNVTv25fP3MMO5cXJEZUEqo07wtb
         0zXA==
X-Gm-Message-State: ANoB5pmou/5galit+zzyLSEDR6LRyT2pWZZmoIp3b1WUwnisfpbWnOZI
	qD6S67Dp3fQ6A5jzcu+wug==
X-Google-Smtp-Source: AA0mqf726uGB6ogpr3Btlm8KuLBoxYKdgRYv9DIjeQ+3++fQwmGhSRWBEq9qcHeRZ3+S2KCe9EqMhw==
X-Received: by 2002:a05:6808:159a:b0:35a:f68e:7ddf with SMTP id t26-20020a056808159a00b0035af68e7ddfmr15811418oiw.34.1669638051227;
        Mon, 28 Nov 2022 04:20:51 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a11-20020a544e0b000000b00359ba124b07sm4281045oiy.36.2022.11.28.04.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 04:20:50 -0800 (PST)
Received: (nullmailer pid 477524 invoked by uid 1000);
	Mon, 28 Nov 2022 12:20:47 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, bin.zhang@mediatek.com, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-spi@vger.kernel.org, benliang.zhao@mediatek.com, devicetree@vger.kernel.org
In-Reply-To: <20221128020613.14821-9-xiangsheng.hou@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
 <20221128020613.14821-9-xiangsheng.hou@mediatek.com>
Message-Id: <166963790318.472861.17415602940881967423.robh@kernel.org>
Subject:  Re: [PATCH 8/9] dt-bindings: mtd: Split ECC engine with rawnand controller
Date: Mon, 28 Nov 2022 06:20:47 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_042052_494316_575742A1 
X-CRM114-Status: GOOD (  13.46  )
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


On Mon, 28 Nov 2022 10:06:12 +0800, Xiangsheng Hou wrote:
> Split MediaTek ECC engine with rawnand controller and convert to
> YAML schema.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>  .../bindings/mtd/mtk,nand-ecc-engine.yaml     |  60 ++++++
>  .../devicetree/bindings/mtd/mtk-nand.txt      | 176 ------------------
>  .../devicetree/bindings/mtd/mtk-nand.yaml     |  92 +++++++++
>  3 files changed, 152 insertions(+), 176 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtk,nand-ecc-engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mtk-nand.yaml: properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'nfi_clk'}, {'const': 'pad_clk'}] is too long
	[{'const': 'nfi_clk'}, {'const': 'pad_clk'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mtk-nand.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'clock used for the controller'}, {'description': 'clock used for the pad'}] is too long
	[{'description': 'clock used for the controller'}, {'description': 'clock used for the pad'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mtk,nand-ecc-engine.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'clock used for the controller'}] is too short
	False schema does not allow 1
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mtk-nand.example.dtb: nfi@1100d000: $nodename:0: 'nfi@1100d000' does not match '^nand-controller(@.*)?'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mtk-nand.yaml

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/mtk-nand.txt
MAINTAINERS: Documentation/devicetree/bindings/mtd/mtk-nand.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221128020613.14821-9-xiangsheng.hou@mediatek.com

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
