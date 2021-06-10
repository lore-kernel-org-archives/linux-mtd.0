Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79949C47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 15:51:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4542C613CB
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 15:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4542C613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ELDE1LjN9k2Jv4dOeF7KfqPSZTj3hZS3/SZ7P4gw7A=; b=dK7bOBDJvw0O69
	ChMpvIOI9GOi5ZSDBcRVOLtZT6WSqXFwOrN48JpOr9QirVjpkjwzFejHN5RrUxEqWsSzzJHasCQor
	Q1ufLkN/D6PW12bbKKhWXZZoy8e4DYc5XwsIlF3DosED9m6JU4vdIz846Icng7esPOpRBF6ddv5pJ
	NZ1K4LNBs66IDsEcIaFUxBU9qkSvx2ooADs/QO2N5YAVd3b52PgZ3IHWz92mDY9RRY+zI+d4ukyqt
	NgBp25bxnBPcD1ntFagEjlYfV5cvNAI1pKQPzqsci+CTRgPKN3uj/QDgKFilr3m5q/b59+/zLWyPa
	kt5+pfdyM/7Y/j5Bxkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrMxb-001TVo-Sc; Thu, 10 Jun 2021 15:51:13 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrMvX-001Rpm-AO; Thu, 10 Jun 2021 15:49:05 +0000
Received: by mail-oi1-f178.google.com with SMTP id r17so2593875oic.7;
 Thu, 10 Jun 2021 08:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oofmloNBtAXODqa/Pc2gss4iGaD3a0Bn3YImB8xl1VI=;
 b=DRn8oloy8InjL00OCKl5wimzijGQgdCZ9ZrQWkqhh1xuRJZxKvmFHzju5EBG4QtW0V
 zX52Pg4yCwOnLdnsCyo+mbLT9FrizMiW/5n6jQLbeodZmNuxDwqvO1/yksWcJYXtw/ua
 wd+VksCRa6RM9HkovRyU74y5JncsBJseHxGGJjVx3z5ve25mG1PTlTNAWEZeFOu6RDw4
 VNIJ3NfHdgQkQsutH/hJ5BVak3M0dvFmmAsC5TfVaA/CjEUQlj4U8l6HBfSiaNKwA5RQ
 ymixV+oxzv44FQSIQCDdHZsYVIZKr7rKU+Ss/dUTuusWfMyJw2Bx6Sw9uakYvGyT+XdP
 uJ2Q==
X-Gm-Message-State: AOAM532JwcgWU9f2hNvq0nIevhaZ2FgtIlClOzkY4G99sUaM02HBz7rO
 LAvlV4QN29s4DlU9ImqgWQ==
X-Google-Smtp-Source: ABdhPJz1F49FcH57RVkPlhaAmm0oEjXoNQULmfhglMJ/ZNiGqGbcDOhQuSqpmYS0f+E0ltHncTz6IQ==
X-Received: by 2002:a54:448d:: with SMTP id v13mr3885281oiv.41.1623340141910; 
 Thu, 10 Jun 2021 08:49:01 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
 by smtp.gmail.com with ESMTPSA id s6sm653663otk.71.2021.06.10.08.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 08:49:01 -0700 (PDT)
Received: (nullmailer pid 1868332 invoked by uid 1000);
 Thu, 10 Jun 2021 15:48:58 -0000
Date: Thu, 10 Jun 2021 10:48:58 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>
Subject: Re: [PATCH v23 17/18] dt-bindings: mtd: pl353-nand: Describe this
 hardware controller
Message-ID: <20210610154858.GA1864637@robh.at.kernel.org>
References: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
 <20210610082040.2075611-18-miquel.raynal@bootlin.com>
 <ce97c460-14eb-a758-31f6-124585e733f1@canonical.com>
 <20210610105653.2d732c4b@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610105653.2d732c4b@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_084903_404813_89D2E998 
X-CRM114-Status: GOOD (  18.55  )
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

On Thu, Jun 10, 2021 at 10:56:53AM +0200, Miquel Raynal wrote:
> Hi Krzysztof,
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote on Thu,
> 10 Jun 2021 10:48:16 +0200:
> 
> > On 10/06/2021 10:20, Miquel Raynal wrote:
> > > Add a yaml description of this NAND controller which is described as a
> > > subnode of the SMC bus.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  .../bindings/mtd/arm,pl353-nand-r2p1.yaml     | 53 +++++++++++++++++++
> > >  1 file changed, 53 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml b/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> > > new file mode 100644
> > > index 000000000000..5f126bb9b202
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> > > @@ -0,0 +1,53 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mtd/arm,pl353-nand-r2p1.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: PL353 NAND Controller device tree bindings
> > > +
> > > +allOf:
> > > +  - $ref: "nand-controller.yaml"
> > > +
> > > +maintainers:
> > > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > > +  - Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:  
> > 
> > I think you can skip the "items" here and leave only "const: foo".
> 
> Crap, I missed that one, you're right. I'll wait a bit for Rob's
> feedback and eventually fix it when applying or resend (hopefully) only
> the NAND bits.

Either way is fine.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
