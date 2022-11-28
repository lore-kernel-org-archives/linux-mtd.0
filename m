Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0DFC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 12:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTGPMm5V3CI9A75xu2fAXq3rbyQ80bSsi0G72D+cO0Y=; b=IMOMFuCcQDXCtJ
	syvNikcbqQRVhDYrZR0ng62yPG9HHsbkxk8+2A4NDWrKPz3O/lTiEXX3wQLMKGMNV2yFaxi2WD8Hc
	o7xhKqscGuuzUIXckcEYgfKgjN1tIePZ+yQcgRRVfl8O4JkJuvIF+Vp1PAysj1wkoLDaCnmVZzSv9
	VSOsqPMK23SIcqBHo53FqeVKuCXQezIIWaJ0Lojj9c6gYblwbhM66CN8qYYf4XsZSd6/FjeegZ0G5
	AG/BgwBSBIP/29k4OA4+AEat67/jGiJhhT1fBXAnvV3HocV401jjLSjcRnFRBRnZjF5rPEgpY3W2h
	o4qIJjCsYp3/r6b9Wl5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozd82-001VeL-JH; Mon, 28 Nov 2022 12:20:54 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozd80-001VdS-BY; Mon, 28 Nov 2022 12:20:53 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-142faa7a207so12681168fac.13;
        Mon, 28 Nov 2022 04:20:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CZfqieASnhH+cyHXFa4EKAUAtyWhOd13pMXBilnYNUI=;
        b=XWhIsIn9zr3xOVkkfYrrSD7T/+crg5a7cYZx9OZoWlQvgHLTj5/fBBbsiPANMid6sB
         dKVZMdJaR6M7+WwFNspxquS5QMvjhkpEjq7Z89Am05vdcJfcgATD2YH7kLvZnRUw1Mit
         /9bJYaAM2p+KnSnWGorsEpbDb8Ni91ni1AY5TeVYrDPkYopXqBJpxJv/kfW5uCP0cFs5
         1wc5kkJYyc2sODmvQZHoiIx1ky+PJT9DrnIbQ74N6HkQOf00lj5gSsJe+94h3abA3SRp
         B5vlMbQBki8mOfNWduh3ahPVw6xNRYsPnyy8XgAufWsL9G3H7IPbINCmyPmaFa+VVSb1
         pDUA==
X-Gm-Message-State: ANoB5pkiONXNvkuow/7tEx2L3QeXfy5CBsHAfzxwf4+lWey9Yu7TomzD
	ipwqxcocQvztyreeeJXcTA==
X-Google-Smtp-Source: AA0mqf4RKqWQ3b691Fmb1KfiNQtiJj0CsVedJ+SQsQPxogZKCvZwUN6fcq8rYa/OZuGhmhfmOTgZLQ==
X-Received: by 2002:a05:6870:d799:b0:143:8f03:f4a1 with SMTP id bd25-20020a056870d79900b001438f03f4a1mr4879849oab.66.1669638048598;
        Mon, 28 Nov 2022 04:20:48 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j16-20020a056830271000b0066bb73cce68sm4620796otu.69.2022.11.28.04.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 04:20:48 -0800 (PST)
Received: (nullmailer pid 477521 invoked by uid 1000);
	Mon, 28 Nov 2022 12:20:47 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, bin.zhang@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>, benliang.zhao@mediatek.com, Richard Weinberger <richard@nod.at>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mediatek@lists.infradead.org
In-Reply-To: <20221128020613.14821-8-xiangsheng.hou@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
 <20221128020613.14821-8-xiangsheng.hou@mediatek.com>
Message-Id: <166963790250.472824.6710482280926376664.robh@kernel.org>
Subject:  Re: [PATCH 7/9] dt-bindings: spi: mtk-snfi: add two timing delay property
Date: Mon, 28 Nov 2022 06:20:47 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_042052_494304_3E54A7CA 
X-CRM114-Status: GOOD (  11.62  )
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


On Mon, 28 Nov 2022 10:06:11 +0800, Xiangsheng Hou wrote:
> add rx-sample-delay and rx-latch-latency property.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>  .../bindings/spi/mediatek,spi-mtk-snfi.yaml      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml: properties:rx-sample-delay:minItems: 0 is less than the minimum of 1
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml: properties:rx-sample-delay:maxItems: False schema does not allow 47
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml: properties:rx-sample-delay:minItems: False schema does not allow 0
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221128020613.14821-8-xiangsheng.hou@mediatek.com

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
