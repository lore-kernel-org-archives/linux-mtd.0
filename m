Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3B8FA3743
	for <linux-mtd@archiver.kernel.org>; Sun, 30 Oct 2022 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NNfbZB+bf4K821u+R/t45s+2Nyde1v4Vf1YFZUWOaQ=; b=iiPkCP6vew+Gym
	aDcUFXLbZJxbWEhy8hzEAlKkUL/iv7qyl/K0q594mv5QnuEXbgdDL/UO6risOPaJelffzCzdIGaqt
	R/K/Cvj2FQW3YAgcac520/R1vi7OP0VjekOXXm81dhkEUBTnU+2pr6BRL+Ei8AhzOu/6E5WAnjoLE
	K9bGRj19FhqoRFwYpD66xcLBEVwjfzTfAFWE/yx0AbCmxCzMzwHm+oTzrA3l+YH1urP+ANA4hivVh
	ix+cpWPlf2GysucRCO7p+YznKKUbetZPHp7pY3J7JyAa4sDYcBCfgxyfdUXteWMbsG2AhSieORIhu
	zx+djDFtjizibacfXveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op8i1-00Gb2V-8t; Sun, 30 Oct 2022 13:50:41 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op8hn-00GavU-14; Sun, 30 Oct 2022 13:50:28 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-13c569e5ff5so10774046fac.6;
        Sun, 30 Oct 2022 06:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QM+uLtn35cNBB8WShoztahWkyNeyqqGV8AL7ZS4noIw=;
        b=anXukLP9QRJbkivrn/i5WdjuLyw9Xs6TgBo+B3kG27ODH3+ji42c5Y3AbSZYB6UapO
         UlLw9Bl3r9aNJUNpUtePgY/XOcHl4qU0X5lPQWTsPGBvxYZgGUAfJqQU9sMTU8Y8Kinl
         GUB7AZiqUS/m/qUflk43gm8+loj7co+J/bs91nOIIawr7p/Kf4SZf0XoDk3c8Ubc/xcs
         BWR9yISCAHNFLwNJX35Pkn3DVuY4i/BdrgIZY1HhSaL/L56CKIJqhEO0d43Ty7G25ahX
         dLYmkAMuNY+AtjeOFIN1/9HbDqusa4XfrBW/C5l2LYsYsCChTFIOMR7Ywp7ot+0ML2Pr
         jfww==
X-Gm-Message-State: ACrzQf3oCKihYhuKc/1dDbAb4AKQIca6vKdw3NOG/ws5cLlyS6Cm43Hd
	4GHIDO0R3YnfEMU4XEJk6g==
X-Google-Smtp-Source: AMsMyM4ekD+KyJWMr4GSGQ0Ji2kUPt3lAnlfD1u4S/wAA6L9dkzw4WsHzE7oFxxtxteJsfH9/11fzg==
X-Received: by 2002:a05:6870:5b9d:b0:12b:5871:22f4 with SMTP id em29-20020a0568705b9d00b0012b587122f4mr4949428oab.211.1667137825562;
        Sun, 30 Oct 2022 06:50:25 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 11-20020aca280b000000b00353fe4fb4casm1394805oix.48.2022.10.30.06.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 06:50:25 -0700 (PDT)
Received: (nullmailer pid 992220 invoked by uid 1000);
	Sun, 30 Oct 2022 13:50:23 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-sunxi@lists.linux.dev, linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Walle <michael@walle.cc>, Manivannan Sadhasivam <mani@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, linux-arm-msm@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20221028235933.934850-10-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-10-miquel.raynal@bootlin.com>
Message-Id: <166713668466.965796.13624922237162086174.robh@kernel.org>
Subject:  Re: [PATCH 09/12] dt-bindings: mtd: phymap: Reuse the generic definitions
Date: Sun, 30 Oct 2022 08:50:23 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_065027_097471_BD302FB6 
X-CRM114-Status: GOOD (  13.06  )
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


On Sat, 29 Oct 2022 01:59:30 +0200, Miquel Raynal wrote:
> The memory mapped MTD devices also share a lot with all the other MTD
> devices, so let's share the properties by referencing mtd.yaml. We can
> then drop mentioning the properties, to the cost of mentioning the
> possible "sram" node name prefix.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd-physmap.yaml | 7 +++----
>  Documentation/devicetree/bindings/mtd/mtd.yaml         | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 



My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.example.dtb: psram@0,0: $nodename:0: 'psram@0,0' does not match '^(flash|sram)(@.*)?$'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml

doc reference errors (make refcheckdocs):

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
