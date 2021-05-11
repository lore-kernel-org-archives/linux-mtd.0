Return-Path: <SRS0=fEar=KH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F92C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 12 May 2021 20:09:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEFAD61408
	for <linux-mtd@archiver.kernel.org>; Wed, 12 May 2021 20:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEFAD61408
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jGJR1eKzubvb4OyGgTlbhqTDJ+Q+kBrmuoTxtgxmu/o=; b=kp7iHfkRSyhVQwjvgUbE6QTiz
	S2Aga8LA0tOdUtbI+77JeXUetaDeawwMtleIdGotdhu/8Zj4dhyy4C/RZPCH827kwjR44gQ4Kwppf
	Hnu+FKYWjZo7nVHCZYz0DcT6spmJpM7k6TcH6+cG+PMxSjInj5kga2C6sthBPJqzaYhAl+ugOQo9a
	zko9z7a+PNjB7gKztlv/wM2OxQCF/lNjS7Cuj/PzKa17kg6jO4YofypOeArmnzTnrM5LY8MIK2QVP
	v9w/wyosmcmAcC/lAvbKVKZvO80t093m6JiBrlMO7yUIOm+iF7zvBNaYPhB0XqdCuo+vPZRSKMXBV
	mBBPzI9jQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgv9R-003rI8-QA; Wed, 12 May 2021 20:08:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgv7w-003qs7-6G
 for linux-mtd@desiato.infradead.org; Wed, 12 May 2021 20:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mhpVbi3cQ0EGsYKOMYQzIVlqfrLnOqg6o9Wpirz2Iqw=; b=sJrty8xGsrfjdutRsY2v+suLTL
 1LctN9MrcXHNpwY6pMiTLP2+Trz9fgJAiSy73WeNn7bjbStt9SEVDacgT3e8Jx6PvzrntxUd4Wt13
 CG+0e53EUnyvdU0RjZH+4QkRXEY2A8NT6o510kFdO/t67GmDLlUzC5wFIL9yqSGv1lgles2oX1fy+
 y+HGqJ9xdowdlBdv6kFPuLeYz2zFoeMfin8Jn0UdDFw+fjd44/XVyJm48udgdnuK305v4Bclx/J4U
 LfMLQHdkp+peHJ49axAXFmIHsAab8YORkLksJEKLSwnejPpYFbJQ9CStW8lI7YgEyDQW4UNgYrAev
 PDPfuVCw==;
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgv7t-00Amm3-QB
 for linux-mtd@lists.infradead.org; Wed, 12 May 2021 20:06:39 +0000
Received: by mail-oi1-f176.google.com with SMTP id j75so23359140oih.10
 for <linux-mtd@lists.infradead.org>; Wed, 12 May 2021 13:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mhpVbi3cQ0EGsYKOMYQzIVlqfrLnOqg6o9Wpirz2Iqw=;
 b=SYihbKWRoXjZaxCVRENEmiwAzxQ+zVePKIxvFhzSh+EWHkIxgP7xZ9PG6LO8JCc/XQ
 f/2cZisFxVtfxgb4WAdGqGqcsOJMexNfm8gm7ptRXTaJaYqaJt3UfUCtBkdRiLKDkJ5m
 WCEEWUdZ5Th5ojI2x0uwQvmHS9VtAdeKcFAvAvB8NKr05jClnnYaQNy6paqbpxljAKsK
 68ndgBoJOIUegbqqA5PyJCior6oKf7SAUoy++1wjD2fV/aJoTDGlk/jWad+jDLBJzAdN
 iBD0fPwuJVo0R9N6nVZT6Y9UOCfFpqYAXTuidSVNu+Jvnp+WaUCA/T/FGR6lB4X4S82y
 W69g==
X-Gm-Message-State: AOAM530hdagLWFlfzZBOsqAKQCcrVfOJLAH3MFV8VY9JqLNYCUVWaj6d
 J44RKJek63YkL4UAOk7Kyg==
X-Google-Smtp-Source: ABdhPJxV73spz7jlOZ+/ObE49mgGuVapQXl8RziXnYJDGDCgxiCCw1rYjMpCidY0PxE9jNdnhI1Vbg==
X-Received: by 2002:aca:d404:: with SMTP id l4mr160681oig.160.1620849996845;
 Wed, 12 May 2021 13:06:36 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x24sm170641otk.16.2021.05.12.13.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 13:06:36 -0700 (PDT)
Received: (nullmailer pid 2227429 invoked by uid 1000);
 Tue, 11 May 2021 16:24:40 -0000
Date: Tue, 11 May 2021 11:24:40 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Michal Simek <monstr@monstr.eu>, linux-mtd@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4] dt-binding: mtd: nand: Document the cs-gpios property
Message-ID: <20210511162440.GA2227381@robh.at.kernel.org>
References: <20210510171800.27225-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510171800.27225-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_130637_867098_9E0D070A 
X-CRM114-Status: GOOD (  15.85  )
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

On Mon, 10 May 2021 19:18:00 +0200, Miquel Raynal wrote:
> To reach higher capacities, arrays of chips are now pretty common.
> Unfortunately, most of the controllers have been designed a decade ago
> and did not all anticipate the need for several chip-selects. The new
> cs-gpios property allows to workaround this limitation by adding as many
> GPIO chip-select as needed.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Resending only the binding patch of the series, with the following
> changes requested by Rob:
> * Fixed the coherency between cs-gpios and gpios-cs
> * Added maxItems: 8 (this is a good enough value for most of the cases I
>   guess, this can be increased later if needed).
> * Adding maxItems: 8 lead to an error when checking the example,
>   minItems: 8 had to be added as well to the schema to fix it, not sure
>   this was expected or not.
> 
>  .../bindings/mtd/nand-controller.yaml          | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
