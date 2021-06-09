Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB848C48BCF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 17:08:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BADEF61287
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 17:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BADEF61287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9NpuM8nRnNzqO2aIzJl4Bkt2T3tAv0QlihjFm2wKN+M=; b=IpBNLeun8HCEEt
	oBnxou2LG6DUHeWMPhybgep7fqafFwqYpB+7e02aAKZO7GvEj6mASh1dAf7XNgwN8DzPAWxfGOQ3n
	dxgUW6/yX08VQRnlUMj3npnJ7z2d76BLEgHdIzzfFf591TUnbGzpw7CIN1ZZ8mM4I1vpCjSWontgX
	QvDTdaPi1N7mlQRrwTZFcLpjDxKbqfg0UIvzFeHxU21/VLJ4bnw+plzPptzqyKbeVqx1Xu1COOvT2
	U2fchgY+nPCyb1EdK7+DrijSuVhTKc0eiDwb/mx4WcX5nTSfWSfFS1XTUVNRnP86ywRwkPZpvU9u6
	ylpLrj6+Pe/QfmmVcdMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr1gH-00FC7a-6h; Wed, 09 Jun 2021 17:07:53 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr0st-00EquT-9n; Wed, 09 Jun 2021 16:16:52 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 l15-20020a05683016cfb02903fca0eacd15so557132otr.7; 
 Wed, 09 Jun 2021 09:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=T6NubXXmP4Pl+8RcuF0TyTLnZQ3F73+5dY/MZouj1JQ=;
 b=Us/8mlzgWB5Q7mG/maDctNcw9hF8k00w6HezGNbYcZN2G0jkSjVJHtwNFTDcYhvSF8
 yIJpvDXy0vxdsngLhpHpuTBySjJbxWYJKHi7M74cfVzAmMPt5pCRHb12N5tCImVry6wj
 aGxLxGaGXHAi0j0P+yyw7tUfMPqHfEIR3EhjnTBeYZd4LsKPM47TH2zEWKsAkj+eU0n/
 2+V67y06yORz1nZCvj2wu6O9ibVNq1mYZrZB9j4dBbbj9TOD+Lf4GYz3dF2ApKQqRrZ3
 /yyF+vI4pwQkFUYfcGSfWE3aKbHVwLKxH3zs5Dk2+dlfFrV4sdxDwxV9HUZ74S9ViTG8
 gbng==
X-Gm-Message-State: AOAM533GSim/M0RgG5SwWLnMJZ1jDx4MoohOJ27SJOzJSxCUqr0bzckQ
 tOqsCQaQRUQT4K0yPvRs5A==
X-Google-Smtp-Source: ABdhPJyE3GUID1b2bH9Fjo1YaKuk17805Kd9mlDyJwnE98gcNAbU23W3fIuIPkEB8ATStJfX44i5ow==
X-Received: by 2002:a05:6830:18c2:: with SMTP id
 v2mr154871ote.153.1623255409915; 
 Wed, 09 Jun 2021 09:16:49 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x31sm75163ota.24.2021.06.09.09.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 09:16:49 -0700 (PDT)
Received: (nullmailer pid 3763304 invoked by uid 1000);
 Wed, 09 Jun 2021 16:16:43 -0000
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>, linux-mtd@lists.infradead.org,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Richard Weinberger <richard@nod.at>, Michal Simek <monstr@monstr.eu>,
 linux-kernel@vger.kernel.org, Srinivas Goud <sgoud@xilinx.com>,
 helmut.grohne@intenta.de, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210609080112.1753221-10-miquel.raynal@bootlin.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-10-miquel.raynal@bootlin.com>
Subject: Re: [PATCH v22 09/18] dt-binding: memory: pl353-smc: Convert to yaml
Date: Wed, 09 Jun 2021 11:16:43 -0500
Message-Id: <1623255403.657922.3763303.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_091651_378057_B6ABDAA6 
X-CRM114-Status: GOOD (  11.17  )
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

On Wed, 09 Jun 2021 10:01:03 +0200, Miquel Raynal wrote:
> Convert this binding file to yaml schema.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../memory-controllers/arm,pl353-smc.yaml     | 133 ++++++++++++++++++
>  .../bindings/memory-controllers/pl353-smc.txt |  45 ------
>  2 files changed, 133 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.example.dt.yaml:0:0: /example-0/memory-controller@e000e000/nand-controller@0,0: failed to match any schema with compatible: ['arm,pl353-nand-r2p1']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1489728

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
