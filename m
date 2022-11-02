Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BAAC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Nov 2022 21:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GARL4Y3nNrS1kU6nbPOCc+5s4a3e8xd5kL6wkZJ22k=; b=U0aCb84FHIw4j2
	W6A4GJGBALqHCjs/TWXiSkgS2M5lvjlHGOqmpIbi8iHnqK9Rk9ynWCpFWOffQVhhG3NWoKWdXEOBL
	iEbBoLtTFDvN6ZutOgxrGUy0MVkN2yi6ADCClxW6FZPFcQ99yrO2bds1aiWeUExltVYEf/q5yUI1J
	vgOv5et12RNyujQrtmRLzYacHf3GB8QdtZyz6Nt+1E7C0kVhFjSJJtoumBDf+ioRA6N5kfmbrEeTL
	6QL3o1AhBuB6hv2BopqwD6B/dmejDWtxURgGq1wPk3yOvX7CmqZz5mvkDJFS8HHsK0XNPpolM1LjA
	CT5h6hExm4npeablEouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqLZe-00EZVU-9q; Wed, 02 Nov 2022 21:47:02 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqLZc-00EZUA-2X; Wed, 02 Nov 2022 21:47:01 +0000
Received: by mail-ot1-f54.google.com with SMTP id w26-20020a056830061a00b0066c320f5b49so7799oti.5;
        Wed, 02 Nov 2022 14:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEKx0Shm1UKG9N4dHMtDn/VoOtRRsP7HnRMJ8KxzNPs=;
        b=Fw/DmSR8170MUxBtXnfHWqnpmFjEM4o1en2tnanYbEBlweF9Od0aD4Y+ZXepopaRSV
         pv3q9Vt/p4sW/7nbvs9VJyJ9wAUyNdaDFwTlAOTtOPgfES/WfZ9UyiDy8lRXBJJk/k+a
         8gmb2N/Tcs/brEmxoJMRbidOYp/wB8wjNidEiRt16c3a3UKSV5FjrrbeIrgvIJ2lmXm2
         K2WFHvoWnLt7U/fXsuGCe49TFTunPHSzFDzGsr0aRT1DVSokFo+eEZmHo2VYpmDZdo40
         hc+rBnk2hewoCALRifNtWVOtNa9vUOMwbI2ybLkDH0jhYLP/psu1ho+RbBQfS2TsuOBk
         Ck8Q==
X-Gm-Message-State: ACrzQf2tadMNLoqdky6pc6RhUNBD8tySarElmkr7aeRjS63eOf0QL48F
	Z2ABB7MY7HnA+ZGG9ppoNA==
X-Google-Smtp-Source: AMsMyM4ufTiUMCMAGmLmron3x5FQ9kYiwpyqxeU/VVzQh3J8El2uRf5SIGCRwa9kgLnn77z1Y9oBkQ==
X-Received: by 2002:a05:6830:4409:b0:66c:797d:5e07 with SMTP id q9-20020a056830440900b0066c797d5e07mr2098928otv.57.1667425616611;
        Wed, 02 Nov 2022 14:46:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k6-20020a056870148600b0011f00b027bdsm6503172oab.45.2022.11.02.14.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 14:46:56 -0700 (PDT)
Received: (nullmailer pid 524395 invoked by uid 1000);
	Wed, 02 Nov 2022 21:46:57 -0000
Date: Wed, 2 Nov 2022 16:46:57 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 05/12] dt-bindings: mtd: onenand: Mention the expected
 node name
Message-ID: <20221102214657.GC459441-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-6-miquel.raynal@bootlin.com>
 <20221031205442.GA3307775-robh@kernel.org>
 <20221102175007.4a4db2c9@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221102175007.4a4db2c9@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_144700_133686_812D235E 
X-CRM114-Status: GOOD (  28.50  )
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

On Wed, Nov 02, 2022 at 05:50:07PM +0100, Miquel Raynal wrote:
> Hi Rob,
> 
> robh@kernel.org wrote on Mon, 31 Oct 2022 15:54:42 -0500:
> 
> > On Sat, Oct 29, 2022 at 01:59:26AM +0200, Miquel Raynal wrote:
> > > The chip node name in this driver is expected to be different and should
> > > be prefixed with onenand instead of the regular "flash" string, so
> > > mention it.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> > > index a953f7397c40..8a79ad300216 100644
> > > --- a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> > > +++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> > > @@ -15,6 +15,9 @@ description:
> > >    as child nodes of the GPMC controller.
> > >  
> > >  properties:
> > > +  $nodename:
> > > +    pattern: "^onenand@[0-9],[0,9]$"  
> > 
> > I don't think it is worth enforcing node names that we 
> > haven't defined in the spec. Wouldn't 'nand-controller' be appropriate?
> 
> Actually I've added this pattern here because there are several users in
> the arm/boot/dts/ directory which use it, and the example below in this
> file also uses onenand@xxx.
> 
> I can either fix the example to use nand-controller or add this pattern
> (I guess "deprecated: true" would not mean anything?). What do you
> prefer?
> 
> If we decide to switch to the nand-controller@ name, shall I change the
> DTS as well?

I guess I'd just leave it as you have it.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
