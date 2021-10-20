Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48FBC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 21:15:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A3D9611ED
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 21:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A3D9611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxB0RyJ0i2DvVApSxZQaB6FQgtoLBbUp56toaw2rctE=; b=UxJR/o0cf6XgQn
	PP5h1klaAcOfWlV1rqO68MUBBQ/myIzRyJhWMO7QnJaHOgzQ+kpqE6Q3QSayLPJ5NI6e+Y9gfaBA5
	LtYhIFXT9Q5SqHkt1hVGBPMQP6IIJi+pYGnbufgdbLMKCGJXcUoju88pBtIgyafzsq0yQ3TRzm2LY
	jcNip6URuhH7aWCnLnazygu0gJQZS0PBndSR0boKfG2qR04Q85neeRXNnZKGNSQtzmIo9xh3nLL7V
	ttiAbEEWv7yN4dWHuMk+XHGlTRwOSa3ttkI6JJ+sWxUaLnr8lGdHa88bEtYuid3CzB4YXE49DMGox
	hzeB8PYBgPCp4jMLwoxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdIvU-005o50-1t; Wed, 20 Oct 2021 21:15:08 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdIvF-005nz8-7M
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 21:14:54 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 s18-20020a0568301e1200b0054e77a16651so9854024otr.7
 for <linux-mtd@lists.infradead.org>; Wed, 20 Oct 2021 14:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=dmICp/48/qSEs70Ri+eIX62qUssRgZltzHF+47kbHhk=;
 b=ohpmGKGyC7SOOfqKfIapa8SmwawuVI/LrJrWuUK9oHfzghT/BspJvMYSieDWkLtEXq
 +iI4j7rmhPDzoBW1ffqN/SLCzmR6vBfd+ZCKcRHe+zQQbdxpaxsafBSgJEQhaZRhqbf/
 LzLZpzL7oKJl6fkOP2sLA2Ke7n6oaUyP0t2dzOKNkXtzI4f6kJmzxDZirlgVVNXtK9U4
 Bd8YGdFgdlvOEKgKlK+fU+tpUeeIOv9YMx40feP8x/uX88dFv9irZ0c6bLfMXmtyc/v4
 kcsKmgR2MxHgCvHGLRxvRi2DoFhXmtXHv4y7WGB6BitwtrmQV/PqxC+L67ms3fT1iTrD
 AndA==
X-Gm-Message-State: AOAM533/gz5GTZQvcNbkgltVDm4o/Um0SnAfXX7Xfs0Vwq92Er5SOEjf
 kDam3UZUmzXm2msL/T17nA==
X-Google-Smtp-Source: ABdhPJzFQpY139+LDDMM4EG73vjZiHXnA+KX2/jVPuaZ0J/OUKjeaw7YvzggrjVYGN3KqAOf2IVyhw==
X-Received: by 2002:a05:6830:236b:: with SMTP id
 r11mr1333531oth.145.1634764492353; 
 Wed, 20 Oct 2021 14:14:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n187sm639709oif.52.2021.10.20.14.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 14:14:51 -0700 (PDT)
Received: (nullmailer pid 2962587 invoked by uid 1000);
 Wed, 20 Oct 2021 21:14:47 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Julien Su <juliensu@mxic.com.tw>, linux-spi@vger.kernel.org,
 Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20211020142809.349347-5-miquel.raynal@bootlin.com>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
 <20211020142809.349347-5-miquel.raynal@bootlin.com>
Subject: Re: [PATCH 04/18] dt-bindings: mtd: spi-nand: Convert spi-nand
 description file to yaml
Date: Wed, 20 Oct 2021 16:14:47 -0500
Message-Id: <1634764487.038982.2962586.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_141453_287396_4D69A8FF 
X-CRM114-Status: GOOD (  14.26  )
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

On Wed, 20 Oct 2021 16:27:55 +0200, Miquel Raynal wrote:
> Let's get rid of spi-nand.txt by converting it to yaml schema. While at
> converting this file, let's actually pull all the generic properties
> from nand-chip.yaml which might apply to a SPI-NAND chip.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/spi-nand.txt      |  5 ----
>  .../devicetree/bindings/mtd/spi-nand.yaml     | 27 +++++++++++++++++++
>  2 files changed, 27 insertions(+), 5 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/mtd/nand-chip.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** Deleting file 'Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/mtd/nand-chip.yaml'
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.example.dt.yaml] Error 255
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1543922

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
