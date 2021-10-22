Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2EFC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 22:37:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76AA060FD9
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 22:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76AA060FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGtlU/YHC+n6PAL1kLI8VzMaxCwcmcUVdXwPkyNd6PM=; b=Q4vwsPJbjZpGLQ
	dav9wWps/04cBwoltjmizRsltUP2rUhWMQjrbDYacAnpLOd3wBlw6aroZD6pwoReLrPu+yLsR5cHh
	K72bNtod88v/CTV6/Kk0/xZsVCpSYnnkPZxdBIeQB6LLDhs5wYOgboSTTuAT+oYbXcwo7Zfsatad8
	/Mhz1APtD9/TqSZMnsfjcddEET9OEsVu5cXCE0TixSQSCMl+GU07lj+/kvp2h1tD21rsa1EmmSI+l
	WFahSivmXPzRmtxaIVPb2H0KCWf54dekIx9sZAujlVLFHN1LeMRFEUj6AIMbqv3GYzISwIap1CyvQ
	feXR58PxnChppol3Yuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1me39F-00C2un-Ey; Fri, 22 Oct 2021 22:36:25 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1me39C-00C2tq-RA
 for linux-mtd@lists.infradead.org; Fri, 22 Oct 2021 22:36:24 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 v2-20020a05683018c200b0054e3acddd91so3609534ote.8
 for <linux-mtd@lists.infradead.org>; Fri, 22 Oct 2021 15:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oOXe3VMjgKim4OsLC2/pNiSdoxCkW2CDkjd2aP4EASQ=;
 b=KRNn9F7Ygsl3kUfC2xt8/7ikQlxuKUGEAEGjMJCq8ql9MvJ5cNTqMwfEOu7Q/2+ngA
 /m9BOj8XT3Qx9YxRm/a9dDIwdyI1SmDOYRTB44gQt+Mkht14u+lTbKw71zeEZxu/QfGq
 QwaBx3w1jP2lf5Dotyx/011fbevTkdU0kzECakNbglkdvxuHHVtCR09SYlbPB1EycFoV
 tfrByAZ1yljlDzwoiK8PTCWbFEUyb5vxM3ueQiOyK1dtbRCHHCDnJzLV83BePIlgHgpO
 od5zALRCOJhuHX7pnpciaegl5Rm0cfp1t/fl+cuiOekllGyQ82gRnIr5sJxU70OTEeTY
 Tfnw==
X-Gm-Message-State: AOAM530I5Yy9fZd8lyn/XRT5hxnGu6NPFeoYDrImKw1vKe08I9MqBd2q
 yojmZ7I39uENSLBEAFm7og==
X-Google-Smtp-Source: ABdhPJz3YY0oBGgzE95RJYSfRS7Vop51WChSu23ig9VAzKncjIpwvEfV3xpMXLgwneL2AKN6pHrWgA==
X-Received: by 2002:a05:6830:2386:: with SMTP id
 l6mr2082728ots.88.1634942180249; 
 Fri, 22 Oct 2021 15:36:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w17sm1981116otm.50.2021.10.22.15.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 15:36:19 -0700 (PDT)
Received: (nullmailer pid 3294476 invoked by uid 1000);
 Fri, 22 Oct 2021 22:36:18 -0000
Date: Fri, 22 Oct 2021 17:36:18 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Julien Su <juliensu@mxic.com.tw>, linux-spi@vger.kernel.org,
 Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/18] dt-bindings: mtd: spi-nand: Convert spi-nand
 description file to yaml
Message-ID: <YXM84oCOAr6pSOw2@robh.at.kernel.org>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
 <20211020142809.349347-5-miquel.raynal@bootlin.com>
 <1634764487.038982.2962586.nullmailer@robh.at.kernel.org>
 <20211021160932.4169f66f@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021160932.4169f66f@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_153622_918912_84C5E264 
X-CRM114-Status: GOOD (  32.16  )
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

On Thu, Oct 21, 2021 at 04:09:32PM +0200, Miquel Raynal wrote:
> Hi Rob,
> 
> robh@kernel.org wrote on Wed, 20 Oct 2021 16:14:47 -0500:
> 
> > On Wed, 20 Oct 2021 16:27:55 +0200, Miquel Raynal wrote:
> > > Let's get rid of spi-nand.txt by converting it to yaml schema. While at
> > > converting this file, let's actually pull all the generic properties
> > > from nand-chip.yaml which might apply to a SPI-NAND chip.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  .../devicetree/bindings/mtd/spi-nand.txt      |  5 ----
> > >  .../devicetree/bindings/mtd/spi-nand.yaml     | 27 +++++++++++++++++++
> > >  2 files changed, 27 insertions(+), 5 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
> > >  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml
> > >   
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/mtd/nand-chip.yaml'
> > xargs: dt-doc-validate: exited with status 255; aborting
> > make[1]: *** Deleting file 'Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.example.dt.yaml'
> > Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/mtd/nand-chip.yaml'
> > make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.example.dt.yaml] Error 255
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1441: dt_binding_check] Error 2
> 
> I am not able to reproduce this error and in general I don't understand
> it. There is no relationship between this change and
> snps,dw-apb-ssi.yaml. Also the fact that nand-chip-yaml do not exist,
> it was just created in the patch before so I wonder how much I should
> trust this error.

I think you can ignore this. The prior patch should have been applied, 
but looks like it wasn't. My script's patch applying logic is not what 
I'd call robust.

> Also, maybe I am not using the tools properly, but it is very hard to
> send correct bindings at the first try. Running make dt_binding_check
> takes ages, any change in one yaml file will recheck the entire data
> base and filtering out on a single yaml file is generally too
> restrictive and still prints unrelated errors of syntax on other files.

Do you set 'DT_SCHEMA_FILES'? That will check just the schema you set 
it to. You still need to not set it at the end because any schema could 
apply to any example, so we have to check everything.

Also using DT_SCHEMA_FILES should be a bit faster with what's queued for 
5.16.

> I don't know how much of this is actually expected and/or if someone is
> working on it.

Due to python startup times being slow, it turns out to generally be 
faster to not have make track changes and do things incrementally. 
That's why all the schema are checked at once (though sharded with 
xargs). So I'm not really sure there's much we can do. I've certainly 
investigated it.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
