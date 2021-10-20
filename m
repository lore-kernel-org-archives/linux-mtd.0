Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA201C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 21:15:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9873A610EA
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 21:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9873A610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBzZqkZatVOYD6YUdlCdTVWU0oX0YYmZN7DkgFO7cR4=; b=xzZOny3a94vXZP
	lgUhU+Y+JEGvoaD3H14Q8BfOkD2pUJ3zTYbaw47KnUFseXybUjiETPuNHAwzd7dPZoc+oNy2xYuGZ
	R89u8odSCmooeWaur5WwE/Au1lObP3MItPbUDjXbUIUBCuqQTsF6zrOrhCDWSyGuhBz8Tdx/OZHLX
	tD9s1IvULxIXu5HQTqTSFOCFMgwFtviKIGacrgslYKm02H0kH+G2i2I3BvOKonQO8SNlB83ViMbPc
	WC75sePlT2lQKeummPfVXJpfzXNcEfzYdmcqQIg3NYezs53Vb9Zim7oGPqBgYiGKy9FEvjstO04Fz
	4Pd6aio1wh5plocMQVLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdIvG-005nzq-Vo; Wed, 20 Oct 2021 21:14:55 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdIvC-005nxx-O2
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 21:14:52 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 34-20020a9d0325000000b00552cae0decbso8159920otv.0
 for <linux-mtd@lists.infradead.org>; Wed, 20 Oct 2021 14:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=FqHQxiZxwpwoHOeUejJBI/puDRrvMLtd3ZP39nADFy4=;
 b=oJ8TbO+LiH/eBkEzoYbnyO2ULhYARlr6NQFctI0IZznbepkZlSgWMxBoKLCqc7Bqns
 sSyjAEjTmJlWUoNsYb6fMEy8cv0dnBImCxwxxNxJAQx0d9HABtM/bHoQu7EYdoB50JcI
 /NCtCu/qKCTwgZqUNZvEwe2xbyR432FWMmXmMOXc2a9j+fAEss0+DpI0pZvp6zV8mt+r
 wi4IUgwGlrb2FuKnerBkcBE+8Eu6Ianjw2dnTkJg85S+bs5GqQXwI+aR+5XjOHJNVZOR
 lcpw7H0LGLtHMT/Y52mzcccIaVgoZGlf7UikX/LFlWYVzmrA5p0OcJ1swU7wVbJg3Dk6
 htzg==
X-Gm-Message-State: AOAM5319YLcgybBSAokS0TduzWfog5eKOENxA716iVknNTsX+8VAla7c
 Ye4IweGjWqcrpLRrE8hHAA==
X-Google-Smtp-Source: ABdhPJydY4OKhyFAzzRNT+vCw1CPPIY1+7r+oim4QB91AmD3aJAyBsk5LyoVHeAHr7EjFFgg3a4JKg==
X-Received: by 2002:a9d:7283:: with SMTP id t3mr1383112otj.268.1634764489116; 
 Wed, 20 Oct 2021 14:14:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h91sm658707otb.38.2021.10.20.14.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 14:14:48 -0700 (PDT)
Received: (nullmailer pid 2962584 invoked by uid 1000);
 Wed, 20 Oct 2021 21:14:47 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Julien Su <juliensu@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mark Brown <broonie@kernel.org>, Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 devicetree@vger.kernel.org, Jaime Liao <jaimeliao@mxic.com.tw>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20211020142809.349347-4-miquel.raynal@bootlin.com>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
 <20211020142809.349347-4-miquel.raynal@bootlin.com>
Subject: Re: [PATCH 03/18] dt-bindings: mtd: nand-chip: Create a NAND chip
 description
Date: Wed, 20 Oct 2021 16:14:47 -0500
Message-Id: <1634764487.024191.2962583.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_141450_814373_B5F61919 
X-CRM114-Status: GOOD (  14.22  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 20 Oct 2021 16:27:54 +0200, Miquel Raynal wrote:
> Move the NAND chip description out of the NAND controller file. Indeed,
> a subsequent part of the properties supported by a raw NAND chip are
> also supported by SPI-NAND chips. So let's create a generic NAND chip
> description which will be pulled by nand-controller.yaml and later by
> spi-nand.yaml as well.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-chip.yaml    | 71 +++++++++++++++++++
>  .../bindings/mtd/nand-controller.yaml         | 53 ++------------
>  2 files changed, 75 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nand-chip.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/brcm,brcmnand.example.dt.yaml: nand-controller@f0442800: nand@1: '#address-cells', '#size-cells', 'compatible', 'nand-on-flash-bbt' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/brcm,brcmnand.example.dt.yaml: nand-controller@f0442800: nand@1: '#address-cells', '#size-cells', 'compatible', 'nand-on-flash-bbt' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/brcm,brcmnand.example.dt.yaml: nand-controller@10000200: nand@0: '#address-cells', '#size-cells', 'compatible', 'nand-on-flash-bbt' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/brcm,brcmnand.example.dt.yaml: nand-controller@10000200: nand@0: '#address-cells', '#size-cells', 'compatible', 'nand-on-flash-bbt' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/ingenic,nand.example.dt.yaml: nand-controller@1: nand@1: 'nand-ecc-mode', 'nand-on-flash-bbt', 'partitions' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/ingenic,nand.example.dt.yaml: nand-controller@1: nand@1: 'nand-ecc-mode', 'nand-on-flash-bbt', 'partitions' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.example.dt.yaml: nand-controller@ff4b0000: nand@0: 'label', 'nand-bus-width', 'nand-ecc-mode', 'nand-is-boot-medium', 'rockchip,boot-blks', 'rockchip,boot-ecc-strength' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.example.dt.yaml: nand-controller@ff4b0000: nand@0: 'label', 'nand-bus-width', 'nand-ecc-mode', 'nand-is-boot-medium', 'rockchip,boot-blks', 'rockchip,boot-ecc-strength' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.example.dt.yaml: nand-controller@58002000: nand@0: '#address-cells', '#size-cells', 'nand-on-flash-bbt' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.example.dt.yaml: nand-controller@58002000: nand@0: '#address-cells', '#size-cells', 'nand-on-flash-bbt' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: nand-controller@e0f00000: nand@0: 'nand-ecc-mode' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: nand-controller@e0f00000: nand@0: 'nand-ecc-mode' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/qcom,nandc.example.dt.yaml: nand-controller@1ac00000: nand@0: 'nand-bus-width', 'partitions' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/qcom,nandc.example.dt.yaml: nand-controller@1ac00000: nand@0: 'nand-bus-width', 'partitions' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/qcom,nandc.example.dt.yaml: nand-controller@79b0000: nand@0: 'nand-bus-width', 'partitions' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/qcom,nandc.example.dt.yaml: nand-controller@79b0000: nand@0: 'nand-bus-width', 'partitions' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.example.dt.yaml: nand-controller@4,0: nand@0: '#address-cells', '#size-cells', 'nand-on-flash-bbt' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.example.dt.yaml: nand-controller@4,0: nand@0: '#address-cells', '#size-cells', 'nand-on-flash-bbt' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/nand-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1543921

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
