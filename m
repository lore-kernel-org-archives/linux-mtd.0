Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE99AC61D9B
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Nov 2023 11:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaFgeOIsSoJpMQRkCWQe9h1A32bOPJxDzaLYlL8zkXs=; b=DL6smqXlSp+5nG
	8OT2B/KOXHgUP3d0OGtwxD2VCgdHrSNiiVgrJVoshhoYlSTr1UlpT0tIDvuUbhr2tJ/nq5mKtSX6x
	oWZ73Omg6EV1MD68qJI8Ow4CRbzmE5xbo7JeyjKT9aFNvW1UhWEslV4HaqAHMfYokyOUH25Gwnc8x
	YWW8SMd1UXdzYVNJMYA6f9SnqWAa2WRa7KAjmQmVA+fsfIwvDrWKrwH1DhYYclNvv2Pr9yp2k0xqf
	FOhJ6ZXMw5JaCNejW23hzCyl40fRcy6arQI309h1TuO7ORgj8DcmEtBisqhWpkt34BomonlZzJMn7
	vAN00AqCPGvDp6N0Tp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5l0I-001VQo-38;
	Wed, 22 Nov 2023 11:02:46 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5l0G-001VPs-1R
	for linux-mtd@lists.infradead.org;
	Wed, 22 Nov 2023 11:02:45 +0000
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-357cf6725acso25372645ab.3
        for <linux-mtd@lists.infradead.org>; Wed, 22 Nov 2023 03:02:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700650964; x=1701255764;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X10iSrSJiLW8LyM0talGPqTy1zkMfImzMBighRZvlwg=;
        b=XAsPtgwNRmMVZJkE5x3f9D4J7rR77/xZn06X3H+3snEsVXwq5AJBexZAiqjnKGOJHN
         J1kWbEh7+5020A+TS81pjJUe9Zl2jVXSRrfr8jACJy/lCwNU6MaeVr0L0HgDWI2yawUz
         OZBD0LSjsEm6tPUJJd46V8hAS2eFhkWg8+ZqtdF5q426NpsmRxZ/9dU31Tr+h2FVSg4y
         TvaSPj3zrmIAu1gcogQeT77VIlPWRew5hWVc0unsD9iBAttPC/BwML1kVHPzzMWZkRGl
         xPEDfst5OxRt5YTRRA87Zy79A8v0CnZSdgKdgjYbM4xjX8/KcqOaBCPXznu+qHlLNYxu
         y0EQ==
X-Gm-Message-State: AOJu0YwzgwwFQ4wRz4xPioz3jcM6WAiH/KVkfv88N1hgsDUFChjGOlVO
	7nTmaxhZCSFTBQtqWXDvOw==
X-Google-Smtp-Source: AGHT+IH2mZ0askqoBGHQkIxYGw8nOgipZAyvI9PDUQ8iF4C0cRZP3ofm99PzzhdferLm2xLxnweLXQ==
X-Received: by 2002:a05:6e02:80e:b0:357:f41c:8bf6 with SMTP id u14-20020a056e02080e00b00357f41c8bf6mr1929799ilm.17.1700650963816;
        Wed, 22 Nov 2023 03:02:43 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id bc23-20020a056e02009700b0035742971dd3sm3874075ilb.16.2023.11.22.03.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 03:02:43 -0800 (PST)
Received: (nullmailer pid 116320 invoked by uid 1000);
	Wed, 22 Nov 2023 11:02:29 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Alexander Sverdlin <alexander.sverdlin@gmail.com>, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>
In-Reply-To: <20231122-ep93xx-v5-18-d59a76d5df29@maquefel.me>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
 <20231122-ep93xx-v5-18-d59a76d5df29@maquefel.me>
Message-Id: <170065093852.115999.17127754687917725425.robh@kernel.org>
Subject: Re: [PATCH v5 18/39] dt-bindings: mtd: Add ts7200 nand-controller
Date: Wed, 22 Nov 2023 04:02:29 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_030244_495361_6BB67CBF 
X-CRM114-Status: GOOD (  10.85  )
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


On Wed, 22 Nov 2023 11:59:56 +0300, Nikita Shubin wrote:
> Add YAML bindings for ts7200 NAND Controller.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  .../devicetree/bindings/mtd/technologic,nand.yaml  | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231122-ep93xx-v5-18-d59a76d5df29@maquefel.me

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
