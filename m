Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3DAECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 19:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDCstUj0Twcrv0vjkXEiSBOYTICsaiaicLQYqu9D9Z8=; b=uIQ1+oDtu3zHaN
	z3VmDCGKKFUWykLYIMdUz660fhkS2saRktaUy7RAixtOtPdrz+1KpxgNX3nWkQCIo9oMAvN9aFQWG
	aCzRpSK+l80W+C5VF1HnrAPSZQMCxjwRgZDCV8YgTCv5st/bY8/5f8MGtHtGGOofQLUUi/ldXbtxy
	6r2i/ytxXqDvy48cm0Z5pIwHIdMH+SoaeW3LYxY4UPdmc3sLexXb1XCCp/8FcayVyF2u95q4ESInZ
	Ia1e1ZHGewkwCqPoEWH907oV6QcZoRv3X32BuHllYfjeB0MV8ReBXZzz6wSOf6EDXbuhA07cfjSJE
	cYYmhIv0/oHgxLVZkgwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaZK-00EGtP-PU; Mon, 31 Oct 2022 19:35:34 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaZF-00EGq8-2t; Mon, 31 Oct 2022 19:35:32 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-13c2cfd1126so14551701fac.10;
        Mon, 31 Oct 2022 12:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPb0kmVeswZtbGBLrKOCmvBH/nbTOqL9MgWShnMw8Tg=;
        b=aAm0ee3fgrty2nDASiDZ0Tp9boVHzm+rd3Xl+doc1gpg/ezu9i2eQO0FcCZgkDy2/U
         qqJJBLRNQBfINAm02Au+HX3Otc+zt/ZS5Ys8UW0auGmNbY6a5+pnT6fMSP8BPQT6orvT
         VS6HjjMPi4j71n25ncWhPeUh6oPoiXpSkFvU+1s8qRseRs5x6B3hBMVjEMS15S5Fem1B
         OOLfsnoWpfvX3aRW2wE/qCeEkjb9y7JAsdUIU4/a1Qd773Tdcoq5oofrvCLBw3amY1ay
         KdE2F5GVIGFPAUz/u3TEo8nBwtg+CMxq5ETVF9KhJ79Q/c/z3KxoWAUbRQuYsyID+8ms
         8DWQ==
X-Gm-Message-State: ACrzQf30ldodWuECJdIV1oAAWhqsjlOknGQGzQTXBcDlhmgCm6O5RXKm
	cTyBJXsqagViavhIVQ/Ojg==
X-Google-Smtp-Source: AMsMyM5JUFYZAqWZZIR+hRiehCPtmwqBAy3Pe0MPElCht3CsSW377O0x1+4mZmM3hg/qVtlZieuyjw==
X-Received: by 2002:a05:6870:f61a:b0:132:49:bd11 with SMTP id ek26-20020a056870f61a00b001320049bd11mr17306072oab.228.1667244928296;
        Mon, 31 Oct 2022 12:35:28 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b5-20020a056870d1c500b0013ae5246449sm3473506oac.22.2022.10.31.12.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:35:27 -0700 (PDT)
Received: (nullmailer pid 3296342 invoked by uid 1000);
	Mon, 31 Oct 2022 19:35:29 -0000
Date: Mon, 31 Oct 2022 14:35:29 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 03/12] dt-bindings: mtd: Remove useless file about
 partitions
Message-ID: <20221031193529.GC3291000-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_123529_141783_D6C2D26E 
X-CRM114-Status: GOOD (  11.76  )
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

On Sat, Oct 29, 2022 at 01:59:24AM +0200, Miquel Raynal wrote:
> There is already a real partitions.yaml file, nothing in this text file
> is actually needed so drop it.

There's a bunch of references to this file still. Run the doc ref check.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/partition.txt     | 33 -------------------
>  1 file changed, 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/partition.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
