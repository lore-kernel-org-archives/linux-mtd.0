Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B174C38A02
	for <linux-mtd@archiver.kernel.org>; Sun, 30 Oct 2022 13:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xkwa49v1LmtZjpARuuHeZbc+XyDSx5KlOQbYcFLKXLs=; b=yS45m0fMxBKFcr
	lD0TLLSGGrwaRfHB3dA3PcV2ZnQxpJDacs/NRtXgYmF+8U+Zf8pm/922/js4t5QBPedD8iBPHvfJB
	II1O/FEPi+p01+I2LyikIkscLGB1GgTEUXiSlf9SellW0/TUfIlKU3ZCiUsrrJWqRHzITzVScZtWV
	0XgBsZ83C0x+UFgZNlqpXd2Bt7M0vjUiUHcEFPGrVQvBcmQVn+fM/ZzHyfgPS4Za15pEHsfgCQkTc
	CU/DAZhkl6dswLGxCf4Zh1qUGKJAAO/D9CUFYIdnW7QkH56EN40uKihRXuNGTUh7/vwjkszsmVqLA
	5lxZdL4e70thryvA7cMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op8hz-00Gb1b-IL; Sun, 30 Oct 2022 13:50:39 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op8hm-00Gau8-IB; Sun, 30 Oct 2022 13:50:28 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-13be3ef361dso11137817fac.12;
        Sun, 30 Oct 2022 06:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hw01HOuryg79no8aMleCKIAZAkXFo9PVrSnrQ3NItHg=;
        b=UMEbPfELGM0h4tojlbgYTVdpVMm9tRfORznDigW7aWaeMg3t9ojckFJrEU2Yb3EQIt
         rCVtirX2+Ejp2VRp4Uyd/IJEuK3bJFZ8F+Kv1iEFJXvrJo4Q1pIj+/Ds6DHblRQQhU0A
         cEWpkZunO1PqlvBwnpPq6a2rok1ztOrnu61SiUgIYRtGnjNhZVV1YNJKhMQ6KwDYwJL8
         XP8+LYpFsGSP5yu83LiKkXfgdYEy/bDHvZEcFnDxtErJV0mAzFpstLNCHb04HAZ/CxzU
         cvb9PrVWxI44eyO6zcANEyWNgA8jWZ0IVaTAXWldrhodKrDtRcR1ee1ve5uHb9EwO9WI
         pAmw==
X-Gm-Message-State: ACrzQf1XBB0ZnqPWdLSW09ylrFdi8PtsXnO0nun3ksyrAhq1kC4iTuQi
	jEFetcbeaoZiB4k0YRPZug==
X-Google-Smtp-Source: AMsMyM6HN4/vLJC1yWt+A8WWnZkp+11IcygTJEWrLtMHxk3x/m5N+dKkTENhuNR66OXIOrZIW/02AA==
X-Received: by 2002:a05:6870:d285:b0:12b:cdce:63d8 with SMTP id d5-20020a056870d28500b0012bcdce63d8mr14117853oae.140.1667137822201;
        Sun, 30 Oct 2022 06:50:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a11-20020a9d5c8b000000b0066c3b6eff00sm1728680oti.2.2022.10.30.06.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 06:50:21 -0700 (PDT)
Received: (nullmailer pid 992217 invoked by uid 1000);
	Sun, 30 Oct 2022 13:50:23 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <michael@walle.cc>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, Pratyush Yadav <p.yadav@ti.com>, linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
In-Reply-To: <20221028235933.934850-5-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-5-miquel.raynal@bootlin.com>
Message-Id: <166713668385.965763.9400218413404488593.robh@kernel.org>
Subject: Re: [PATCH 04/12] dt-bindings: mtd: ingenic: Mark partitions in the
 controller node as deprecated
Date: Sun, 30 Oct 2022 08:50:23 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_065026_630196_825ADAAC 
X-CRM114-Status: GOOD (  13.02  )
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


On Sat, 29 Oct 2022 01:59:25 +0200, Miquel Raynal wrote:
> Defining partitions as subnodes of the controller has been deprecated
> long time ago, but unlike having partitions within the controller node,
> having an enveloppe named "partitions" (which is not itself within a
> chip subnode) is not that common, so keep this deprecated definition in
> this file.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/ingenic,nand.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 



My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/mtd/atmel-nand.txt references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: Documentation/devicetree/bindings/mtd/ingenic,nand.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: Documentation/devicetree/bindings/mtd/mtk-nand.txt references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: drivers/mtd/parsers/Kconfig references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/atmel-nand.txt: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/ingenic,nand.yaml: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/mtk-nand.txt: Documentation/devicetree/bindings/mtd/partition.txt
drivers/mtd/parsers/Kconfig: Documentation/devicetree/bindings/mtd/partition.txt

See https://patchwork.ozlabs.org/patch/

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
