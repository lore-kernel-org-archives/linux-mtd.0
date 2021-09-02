Return-Path: <SRS0=etPf=NY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51A9C4320A
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 12:05:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF2F8610D0
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 12:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF2F8610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXOxGlJ5vX2njDLpDyP68h0abu5hz/4eX9acVpWDwVo=; b=Yys6YXvDP+mIE5
	CUZ0oxNY6gXdSWvPIiD/F5/uBcVi0Sp4Lh8nwXY9AU5YTFRKxuRMGGQ7FV1P3hVy8XIk+tyh3sM3M
	TwkWO8q5dCOSkYP5Ku6dx/P3vpIGgEeA4dJygi+WsoaYK9dO3VFeNYyB6TTSu3Fwl0ElN6yRSEgVk
	N5StiWDXuVhgJZUul5MYqKp/Q3Empr8mRGWrqv9Gm/wGVVKU7QsxwvvSEUbv32NkrGo5zbRFHavWd
	qPvbUwdtUFQOHCqRIMg9WeTqUfkFeuObuFNPTBrziqZBs3qnScd8kOqMTvgUjGGFVsGCmuKbn2dIL
	fs7SsX3CTqaLIMXy6kbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLlS8-009Uxf-JR; Thu, 02 Sep 2021 12:04:20 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLlRt-009Usd-Ct
 for linux-mtd@lists.infradead.org; Thu, 02 Sep 2021 12:04:09 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso2145953ots.5
 for <linux-mtd@lists.infradead.org>; Thu, 02 Sep 2021 05:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=4lQGZdi5tntA6BsPwhp64eLbrT+gtAQmgNJFN6OA1qc=;
 b=skgy2L9VKJpmdQ5sJcvVADhBvtv+vUjk3QzmBVWE07g7bSsE2GBJJtyMBQcZ0D3db/
 EDC8vEUAxM/xia+k5NgDudW5zi1fOXXN/iy59np0CShh33NHqWQbn38ovn1eckpQjj6o
 xVsXnkeehSpK/Whw1AJLJaeGSVSCAX/34m8DJeH2RbOq1yeHTS6hXTytwh82ffuzsHBa
 va6vXrkrpTf/mVLgS5SS7LAVDvcFXzXAEjTNHuTZC9NWn/IzgACwOnwx0YHlxJ5O1nq4
 mz91KKHJvj+6mXFeLLgle6vNKofw2rc6RXAIVCgNCBD3VQ2A2CKUfY0fCDY0KTv5nuau
 AAoQ==
X-Gm-Message-State: AOAM533lFXNFPlRhA4TikMCT41JRLJruVJcZPHDItquoxJTS90aITbO4
 tql6McVTQ4HhIqGbTZ8MyQ==
X-Google-Smtp-Source: ABdhPJxDO5/iYXs1QRVb8yiWOSLcaulTYDEz99hFFV2MOsIg7wgK3bSY+VRAQ8IvzoJN4vdOP41y5g==
X-Received: by 2002:a9d:3a6:: with SMTP id f35mr2216699otf.144.1630584244536; 
 Thu, 02 Sep 2021 05:04:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 97sm302317otv.26.2021.09.02.05.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 05:04:04 -0700 (PDT)
Received: (nullmailer pid 685605 invoked by uid 1000);
 Thu, 02 Sep 2021 12:03:59 -0000
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: devicetree@vger.kernel.org, nm@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, lokeshvutla@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com, tony@atomide.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20210902095609.16583-3-rogerq@kernel.org>
References: <20210902095609.16583-1-rogerq@kernel.org>
 <20210902095609.16583-3-rogerq@kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: memory-controllers: ti,
 gpmc: Convert to yaml
Date: Thu, 02 Sep 2021 07:03:59 -0500
Message-Id: <1630584239.117607.685604.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_050405_475959_9260EC71 
X-CRM114-Status: GOOD (  12.18  )
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

On Thu, 02 Sep 2021 12:56:05 +0300, Roger Quadros wrote:
> Convert omap-gpmc.txt to ti,gpmc.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../bindings/memory-controllers/omap-gpmc.txt | 157 --------
>  .../bindings/memory-controllers/ti,gpmc.yaml  | 364 ++++++++++++++++++
>  .../devicetree/bindings/mtd/gpmc-nand.txt     |   2 +-
>  .../devicetree/bindings/mtd/gpmc-nor.txt      |   4 +-
>  .../devicetree/bindings/mtd/gpmc-onenand.txt  |   2 +-
>  .../devicetree/bindings/net/gpmc-eth.txt      |   4 +-
>  6 files changed, 370 insertions(+), 163 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/memory-controllers/ti,gpmc.example.dt.yaml:0:0: /example-0/memory-controller@50000000/nand@0,0: failed to match any schema with compatible: ['ti,omap2-nand']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1523568

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
