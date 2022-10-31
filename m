Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4965BECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 20:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5uIayruewxaK5co9x/K16ZHFD0MVVDut0rn6Nzplb8=; b=S7LNm4vvXuVOCO
	V7saMt0zC0vHRzMNohd6/OCRcQYtTM9m9U+mAWlBKu2H9rO7y+dv1zrCxPLNZOOB2fQGubjdqqXTt
	ldidzAWTvovaSbBFQpg1JYKtMqs/KMilxKgM8mxUgkYWZQ4snkIvQ312NmhNi2COS+opNQ9+TeIix
	E5FlC0pI4JeHp9HdDPvTwQF/4CGnzD31qWVTMA0hoVreSqGURlPfAsJNFFHQ/bhXy+htvsd9510AR
	d3JemUdxg/5SECiNHYGfpOATI1eX6G9vEjZBVUSM8O+6VRHYh6p6nLppaGB0WAPhScx7dSKw2Z1GM
	CBJr/sJG2x9ArValcC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opbor-00FLXr-SG; Mon, 31 Oct 2022 20:55:41 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opboo-00FLWD-Ql; Mon, 31 Oct 2022 20:55:40 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-13bef14ea06so14816456fac.3;
        Mon, 31 Oct 2022 13:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LIZ2dqSSBT+On4PWAgl6ETxuBttWHH8FQXx49BSlJI=;
        b=irQbSduRC02mL7zn8Xq6jSuQL3piGoa8PACk9iWM69FMMecpFEz+i1BnYCQuacvx1y
         EDC+T/eqXCkiOGSSjm1s99hKsNs6qGyEYkMK9Rikn5XmJylFKpAYo9nPoVnjIXcEyDAp
         DcYeNGPNHp8DEoXWUFQBetbphS9/6kpqcPahRYPiHl0WiXYTLwo12sEDK4XpL3aULfdS
         OFb6SAZD8wZ7D20GLCBkiWmv673nVSJsTfMb8zKCAKniGJOs3Vheja6m4lUMozjV/iOu
         Z7gusIfmTXWQYeE9ZyUveJO/5RP6DiNfOjlvmJ4lyLblGNT+cuf2k40r06xYO8UuYuDn
         LJ9w==
X-Gm-Message-State: ACrzQf0v6Q/aCtAHv0aaMugzb/jkDbpPLm2k+5jHVYjZvwty+AcMiGnH
	6JjuT5qJyddp4ht6IOWSVl+ouS058w==
X-Google-Smtp-Source: AMsMyM42H6rURv5CxNKKP6tU1K9paQFFoz/iq+4AdUhxq8YPqX+kj9on+V+Yw0UjKIjEGJDFW08Pmg==
X-Received: by 2002:a05:6870:f61a:b0:132:49:bd11 with SMTP id ek26-20020a056870f61a00b001320049bd11mr17509733oab.228.1667249737471;
        Mon, 31 Oct 2022 13:55:37 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q10-20020a4aa88a000000b0049bdee12662sm544026oom.6.2022.10.31.13.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:55:36 -0700 (PDT)
Received: (nullmailer pid 3505988 invoked by uid 1000);
	Mon, 31 Oct 2022 20:55:38 -0000
Date: Mon, 31 Oct 2022 15:55:38 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>, Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Michael Walle <michael@walle.cc>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Naga Sureshkumar Relli <nagasure@xilinx.com>, linux-mtd@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-msm@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 07/12] dt-bindings: mtd: Drop common properties from NAND
 controllers
Message-ID: <166724973801.3505934.3879671899387347829.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-8-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-8-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_135538_889057_C9588BF9 
X-CRM114-Status: GOOD (  10.92  )
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


On Sat, 29 Oct 2022 01:59:28 +0200, Miquel Raynal wrote:
> When redefining common properties does not bring any additional
> information, just drop them from the controller bindings because these
> properties already are definied in nand-controller.yaml.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/mtd/allwinner,sun4i-a10-nand.yaml       |  3 ---
>  .../bindings/mtd/arasan,nand-controller.yaml         |  3 ---
>  .../devicetree/bindings/mtd/ingenic,nand.yaml        | 12 ------------
>  .../devicetree/bindings/mtd/intel,lgm-ebunand.yaml   | 10 +---------
>  .../devicetree/bindings/mtd/qcom,nandc.yaml          |  3 ---
>  5 files changed, 1 insertion(+), 30 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
