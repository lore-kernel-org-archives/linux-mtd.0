Return-Path: <SRS0=yokd=EK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BD5C4742C
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 18:57:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAF012080D
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 18:57:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hQpYZ7Kq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAF012080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NiZ/oFrw9+BnqKvJkTqYSUYGCv6w3c3JgdEAahGUGwc=; b=hQpYZ7KqL94bSYyihprdkWKNv
	rd+1iMG22Rk3eZUpcJp2Rick/4yu2dQ12BZ5cTV5Uw8jJ1DSaWm8X0DxVIvU0YTsoc355758uMXDz
	jUAal8QyYfk2+LTmNFLnEF+Mw3IYd9bbVH1zxOiPpHV3MvAuNj96vyQ8ocECSOQR5tQOV3Ge0l1nG
	UvXiCUMYwa39q0SRGJFz1irnj3urXaDDGpZOdqaQ3qg5eFRRDgwXfL4gCSQnXaQBFzFMNqjaSr/UQ
	8tiG/YSsvdAumm+w/234HCffAISj8i2RsLWJcSJUQRL04jAAnmIfZCjx9G6uU6t2ibmXzqu8qoDsY
	v3DRqtDMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaNxV-0002Km-QS; Wed, 04 Nov 2020 18:56:37 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaNxR-0002K0-IO
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2020 18:56:34 +0000
Received: by mail-oi1-f196.google.com with SMTP id j7so23217931oie.12
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2020 10:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0XEiHKaxPQoGBzkJTgPLIitnCQW5/vfKvy+CJgTVM8Q=;
 b=hBpCVbC700xDduRUJIHAyGDnco10KvqCu5kBSZB7UDjfF2KkPRC3vHcRGhBxpN9Wzs
 Rk+7RjuCGe4QiuBQavV8buOHfmduJUG3lfKY93ZL7yrfVx15c3c3mESWzOnewV9/OUhE
 nUqv0a484PByCdzZoSrgxiARKRqzxvWXlSIySgoj/VvhwpHHDGsSqdsbegD0IE6FiN1q
 fFy14Kgx1XOl84kGEdrGhiLQKno5Bp2J15w3ci28gMjbDcx1Wa/zfjs16759j9zn24i4
 pzx/L9n+MgsPyM+uNjRIc/6bwOOh0wFgyI2r0e0wHxgeSKVk9B7Eg00FEhFNX+PIfhTw
 gO9A==
X-Gm-Message-State: AOAM530A/agPcIHiHIWh4l+zJUZPfiWPwtuoNZEdqJVa8o1mXDXVSvAd
 dA7g3swkwfwTiOKjAWFUPA==
X-Google-Smtp-Source: ABdhPJyaOibrhV7F8kOT261dvo4CbhNDDnJYzlIf57VZltVSNy8xE+XIZlEnlvTbKIfwioYeAT3SoA==
X-Received: by 2002:aca:d6d3:: with SMTP id n202mr3299298oig.74.1604516192680; 
 Wed, 04 Nov 2020 10:56:32 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w79sm645606oia.28.2020.11.04.10.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 10:56:32 -0800 (PST)
Received: (nullmailer pid 3946584 invoked by uid 1000);
 Wed, 04 Nov 2020 18:56:31 -0000
Date: Wed, 4 Nov 2020 12:56:31 -0600
From: Rob Herring <robh@kernel.org>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v16 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
Message-ID: <20201104185631.GA3946406@bogus>
References: <20201103075655.18699-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20201103075655.18699-2-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103075655.18699-2-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_135633_625562_D085B743 
X-CRM114-Status: GOOD (  13.02  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 tudor.ambarus@microchip.com, richard@nod.at, simon.k.r.goldschmidt@gmail.com,
 linux-kernel@vger.kernel.org, dinguyen@kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, qi-ming.wu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 03 Nov 2020 15:56:54 +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add YAML file for dt-bindings to support NAND Flash Controller
> on Intel's Lightning Mountain SoC.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 99 ++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml:24:8: [warning] wrong indentation: expected 6 but found 7 (indentation)

dtschema/dtc warnings/errors:


See https://patchwork.ozlabs.org/patch/1392698

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
