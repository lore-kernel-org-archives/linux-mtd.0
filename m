Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D853C433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 18:31:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E88FD610FB
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 18:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E88FD610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMRbLrpUa5NTxbt7HTfKdeMplMM0qqWaSMS03XM2nVU=; b=PYNtGkX4s+Ts7lcI3+fkrmEWg9
	wLVujGyhFT9tVJyoEQcbGmXMcNfXhruvdgEwTYz6ZcJD16KgCoRVjClF3Smhg9dhGvizkiHk/05CQ
	YcLw9hyxAYLugq/3ITjUKWq8xtODYUDFcfEg83H2NQ/EUZkBYddVjxbcdD847g0bVEIY2ZBaWBVwg
	0jr1J/CsGjAgD1ZxxFLGh2Q4F1IaGIwQV0JV5vJSLmpvzAjhMcrc8wrIuKXshTCTypBjG0TxjQ/yd
	0u9yTfw4VQ7AeUXvIoIvfwoK/2VUUZ238g1dh+pRmC1ZEAqQatbfwVqhJAGbZ5G65HYqT1svVjQSr
	V9Cr/m/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXTEe-00352R-9v; Fri, 16 Apr 2021 18:30:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTEJ-0034zS-Aw
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 18:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:References:
 In-Reply-To:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+4y5xD6FsO3vC5Ys9vRm1ilGC7bEb0/EsoeiI7VBKsE=; b=kLFYzaSXHfpywttLSfGhGHQHkV
 XydCQiOOOjGJKNrvuzY8YL/83pSI5EUxjBYycQXGKOdRfO1BuXi25Hr/Ah/EQqqhZzOP+2Rx5csbS
 rH+FbYMCKydIXXFwwenP1n7eUYWCjYjXWndMiNR3Ce/1KAoWmRIdRf1PuKo07KYbHRqfIFtu5zymx
 OjTB3ZuasdQJYvmNq79VLvHHVjNX9Q/VSArSa1RyHxZg9FIi6p0Jl6k1ttrRDiIiASpHkdZf+xZUR
 IO+dcC4pEWWt/roIzech8+X8CRYGdTR91qf56jj1q+WtBj4PXVlxY+3HhlKpvbMQn/2MM7DYVP/nv
 OGTwB4Vg==;
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTEE-009csH-7q
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 18:30:10 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 e89-20020a9d01e20000b0290294134181aeso795525ote.5
 for <linux-mtd@lists.infradead.org>; Fri, 16 Apr 2021 11:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=+4y5xD6FsO3vC5Ys9vRm1ilGC7bEb0/EsoeiI7VBKsE=;
 b=bPU5Hh9V7srQjT3k7u8QHCT6ioOs0vpYUvG04KZrXE34l1MwImpbdq+o1ugjE2MFev
 ZJejEejsZHo0j/m0APWefCUKfuxuuSzce6MGUAbLG4WX6a15O5BJwcTTp4kVS36Ddk6e
 PMQIL+oMerG6MUy6MOCDIw/1/UpeRcdGbO/oH6V3dTyDvKJFxmFDH+8iYLVjnhOqhGCQ
 Aco70kPRoJczesXRtBCILRaazkN3auTK2g2ueQWDmUUcBYWKDlOfn4cp7I5PD7ZhfGFG
 2AVRIOQqtC+YobTn8RlIN5oClfOZOibD3SoUboHiJCf25Scp+xwAkiyYoqxKZ4HSLtog
 KdVg==
X-Gm-Message-State: AOAM533BlfvT1rjj7/XM9Hke/DK/b/IXeIFyFgms7UlPr7/PvVm2sQgr
 stjk/jsNHX/E15WBsI3oUOhSS1/VEA==
X-Google-Smtp-Source: ABdhPJyn22RcL82sR7wG7S9QbI0HIP2dmwFaaZSa4uAL4UTjFklWGoLWwWVk1Ie+5Q84cXwJAx5pQg==
X-Received: by 2002:a9d:2de8:: with SMTP id g95mr4699080otb.162.1618597804995; 
 Fri, 16 Apr 2021 11:30:04 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n104sm1544410ota.27.2021.04.16.11.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 11:30:04 -0700 (PDT)
Received: (nullmailer pid 3708342 invoked by uid 1000);
 Fri, 16 Apr 2021 18:30:01 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20210416114928.27758-5-michael@walle.cc>
References: <20210416114928.27758-1-michael@walle.cc>
 <20210416114928.27758-5-michael@walle.cc>
Subject: Re: [PATCH 4/5] dt-bindings: mtd: spi-nor: add otp property
Date: Fri, 16 Apr 2021 13:30:01 -0500
Message-Id: <1618597801.613342.3708340.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_113006_299480_D3A95D67 
X-CRM114-Status: GOOD (  11.64  )
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

On Fri, 16 Apr 2021 13:49:27 +0200, Michael Walle wrote:
> SPI-NOR flashes may have OTP regions and have a nvmem binding. This
> binding is described in mtd.yaml.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Changes since RFC:
>  - new patch
> 
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/mtd/mtd.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** Deleting file 'Documentation/devicetree/bindings/spi/st,stm32-qspi.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/mtd/mtd.yaml'
make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/spi/st,stm32-qspi.example.dt.yaml] Error 255
make[1]: *** Waiting for unfinished jobs....
make[1]: *** Deleting file 'Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/mtd/mtd.yaml'
make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.example.dt.yaml] Error 255
make: *** [Makefile:1414: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1467025

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
