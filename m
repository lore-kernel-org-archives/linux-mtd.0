Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DDFC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 19:50:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E586960F02
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 19:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E586960F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FIbBjV4FqlXhfbDOeIkEpIoYjrm5aOZtNFSfAd2GKw=; b=r+HbIkR603uYtf
	kFg+z0249RCLFUewXF+bsDfTNoASwYzK8aIikY9PsX4GcHViluPG6L6um3N+00dmx/8WptsOT/LXG
	5I3SP0ydedmd3KPPsCePcdJBJLgK2Sx+5/DwcsQDRzwZ1UhNsY7fNTSm5RpXxHM7YrHCwKnul720q
	Kl9CMd3YZJz+s/JM68D/OSON5xC1IfujgYRuDvpUX4kqQEJWsduykBuqy6Lom2FxPTBNju+mwHqV7
	JE0Aq/Z2TCL0xS6nxGt9M7tnfOTlRRU4jLHL5MgCi2VHC9nkykdaDimNADe6EjXTG83rTBMDW590C
	0b5V0BGKCSedEH26paBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYvrp-0040Zf-9F; Fri, 08 Oct 2021 19:49:17 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYvrc-0040X3-HA
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 19:49:06 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 e6-20020a9d7306000000b0054e6119fc16so1064287otk.11
 for <linux-mtd@lists.infradead.org>; Fri, 08 Oct 2021 12:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=TCu09rsdz9qaZNlW814ROPgBIe73GMu1odd3xsCgFZE=;
 b=EVxLuBKFtpdVMvvlIw5FGMUBKkriAVr6vsynaPZnOVYhcCSXbrqMo28gMAZtdXFGXt
 Ka4kDr9wC8Kehg6pKeWcU+tZoAtGH+8UKu4t9gKUqV2Xp4+QWgyUOsUQZ1ctJVuUBvLP
 70g3H9VjBeSmyTbx37zdFGLx17BHSIP9pwzD1+Z+pmfTvV0+lcpzA6+kuBDZ/zbIUgs+
 mWpKPFMN06uQ51Sd5M4UJi5GNgDCMTkLFEczNFLSbEIBu1MNsAjf8ZU9HINrfP8GrEID
 AWqr8lMgvXJ7AMzy43e1J2crJrav0Hv7qVyRMW9kQQ/+WB8drXsgpBV0Zg0OXdH03ELB
 gLfw==
X-Gm-Message-State: AOAM5329kHx0hLZScJPLcZOWyzm1vkNOvDgoi6kgabFQT1332R6WSmA7
 oAZxXGUF/LrVeCysOtI8RA==
X-Google-Smtp-Source: ABdhPJyooYbBa5WC5aVtNl1rU8mTcfgxB8u7iK9YF1J28Lc/pabtIK+ms2WbyxzEMrlWnTKOqLWGGQ==
X-Received: by 2002:a9d:3b2:: with SMTP id f47mr10405415otf.253.1633722543650; 
 Fri, 08 Oct 2021 12:49:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b19sm57350otk.75.2021.10.08.12.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:49:03 -0700 (PDT)
Received: (nullmailer pid 3211955 invoked by uid 1000);
 Fri, 08 Oct 2021 19:48:56 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-spi@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 jaimeliao@mxic.com.tw, Rob Herring <robh+dt@kernel.org>, juliensu@mxic.com.tw,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Boris Brezillon <bbrezillon@kernel.org>
In-Reply-To: <20211008162228.1753083-5-miquel.raynal@bootlin.com>
References: <20211008162228.1753083-1-miquel.raynal@bootlin.com>
 <20211008162228.1753083-5-miquel.raynal@bootlin.com>
Subject: Re: [RFC PATCH 04/10] dt-bindings: mtd: Describe Macronix NAND ECC
 engine
Date: Fri, 08 Oct 2021 14:48:56 -0500
Message-Id: <1633722536.880854.3211954.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_124904_594526_7F5A7AC8 
X-CRM114-Status: GOOD (  13.04  )
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

On Fri, 08 Oct 2021 18:22:22 +0200, Miquel Raynal wrote:
> Describe Macronix NAND ECC engine. This engine may be used as an
> external engine or pipelined, both ways are shown in the examples.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/mtd/mxic,nand-ecc-engine.yaml    | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mxic,nand-ecc-engine.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mtd/mxic,nand-ecc-engine.example.dt.yaml:0:0: /example-0/spi@43c30000: failed to match any schema with compatible: ['mxicy,mx25f0a-spi']
Documentation/devicetree/bindings/mtd/mxic,nand-ecc-engine.example.dt.yaml:0:0: /example-0/spi@43c30000/flash@0: failed to match any schema with compatible: ['spi-nand']
Documentation/devicetree/bindings/mtd/mxic,nand-ecc-engine.example.dt.yaml:0:0: /example-1/spi@43c30000: failed to match any schema with compatible: ['mxicy,mx25f0a-spi']
Documentation/devicetree/bindings/mtd/mxic,nand-ecc-engine.example.dt.yaml:0:0: /example-1/spi@43c30000/flash@0: failed to match any schema with compatible: ['spi-nand']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1538445

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
