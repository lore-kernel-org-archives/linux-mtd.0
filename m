Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202EEC47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 15:56:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEB8760E08
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 15:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEB8760E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CXC3aXBlF16vMADtxJxJYX4h5httMZ4AKNNYrBoD54=; b=Ln7u3K3hrq5cu8
	c/pyU+uTqJTRGbNwATjzniec8QP7purO6e3XKUja//gqUu3LesU7RUBSDkqX9hqii3IoLFlIUdcch
	E85J37C1I0SvASGqVg3FKwS6aCSEm8AnVza3sOBNZEVzAJ1M2WGlNZ7CcPWO0Yn80ZkSycPLt4Dxb
	8mglziwMo0yuJrDpN8zRvHgv1J+xMqSp9pj/JAz7itYOT8BSUkxhQw/OGP5qxfELl+SiEOf3AxVjH
	dG6t/6+gbP464tIVyPydFOw44vwxtVOVRoEvV5KFBhaspu0KFovDNOf7iaxv4fIZxbmxFZ6Vbigj4
	MKj66iJzxyNf7AuymVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrN2Z-001W34-P4; Thu, 10 Jun 2021 15:56:20 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrN0D-001V9a-Cy; Thu, 10 Jun 2021 15:53:54 +0000
Received: by mail-oi1-f181.google.com with SMTP id s23so2596133oiw.9;
 Thu, 10 Jun 2021 08:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VRySpPzJlLYhI3h/JIF31rTc1KoHGLh9s0BINnZ+x9M=;
 b=rNVaUKNfji12qguvmn7Lq+z2HhLZrJwNc4qFzYjOuZugokgspCU2Rbf4gDMipKpTph
 vEnUBKbyQ3DPBvpacD5dABwNTjUttG/mwD+qRlu4meihhi1xMpJXaCxUCxfE3SG10BqT
 4eM3RUbm8P2h8y2WvnDJoPutMhh2jBQHhUUz1QLUHk9ScHUhysTutp/jdA7DUrtggBzH
 91Im+xVIcFvLbiF2b9Eeq/w0c8+3RgCAqCaTk6ob4JwBz8xq+EHqfPGD1gUTT8I1f13M
 DMetdgNKr0SQzY+/CdghfVtGZ0JdJf6tDYwEnanSvMsMd+h92prVEVq+++Mt5E1xkb+K
 lqXw==
X-Gm-Message-State: AOAM5323RJNck4fuLlsRCFE71/2yHtQTNpgbMBCVrIhA521T7t05MRaH
 Qx2Z80n+3cKLUMhe71jK+Q==
X-Google-Smtp-Source: ABdhPJy1S0NCE5ntUuS+7phY6/iHJ2rMqyiVziT1ZAtosDKXBmthXoUwpRdOtZBBEhZ1W70GFFQXfg==
X-Received: by 2002:a05:6808:8fb:: with SMTP id
 d27mr6116265oic.115.1623340432085; 
 Thu, 10 Jun 2021 08:53:52 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
 by smtp.gmail.com with ESMTPSA id f25sm677899oto.26.2021.06.10.08.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 08:53:51 -0700 (PDT)
Received: (nullmailer pid 1877730 invoked by uid 1000);
 Thu, 10 Jun 2021 15:53:45 -0000
Date: Thu, 10 Jun 2021 10:53:45 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Michal Simek <monstr@monstr.eu>, Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>
Subject: Re: [PATCH v23 08/18] dt-binding: memory: pl353-smc: Enhance the
 description of the reg property
Message-ID: <20210610155345.GA1873816@robh.at.kernel.org>
References: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
 <20210610082040.2075611-9-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610082040.2075611-9-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_085353_496987_9B7337B4 
X-CRM114-Status: GOOD (  19.04  )
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

On Thu, Jun 10, 2021 at 10:20:30AM +0200, Miquel Raynal wrote:
> The SMC bus controller features several register sets. The one pointed
> by the reg property is for the SMC configuration (impacts the
> sub-controllers configuration), while the others are meant to be used to
> send regular cycles on the memory bus (eg. CMD, ADDR, DATA for a NAND
> device). Detail this a little bit for the sake of clarity.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/memory-controllers/pl353-smc.txt       | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> index ecd46856f139..ba6a5426f62b 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> @@ -5,7 +5,8 @@ of memory interfaces: NAND and memory mapped interfaces (such as SRAM or NOR).
>  
>  Required properties:
>  - compatible		: Should be "arm,pl353-smc-r2p1", "arm,primecell".
> -- reg			: Controller registers map and length.
> +- reg			: SMC controller and sub-controllers configuration
> +			  registers.

I think you could just drop this patch. Otherwise, this doesn't match 
what's now in the yaml file.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
