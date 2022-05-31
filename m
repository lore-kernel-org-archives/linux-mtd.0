Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1B0C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 31 May 2022 15:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AicRwSkkyNRPNg72u2odE0eHVkvJKZbZkBkWKSviuyU=; b=P2SV8keUtIOgA7
	ZM1H4yGvNjeWXWka7thE00O0PD3UDuwU12JsyANjkcDPO/jMi1wCRChBUOMZaLJ83BPsVy4rlKjER
	kkioa8VGTawVTzcdfAY/PvjsLPu1AtShN84FvzQFGHLFWfve+zwD2a93dkePo/mq0KCDMzuigkza7
	SG5fyUq3e5Wi3bxuZnBR8FOiVKSnQWLFoqZg2rQvVf/5tfEu3PBGx1r2z/ZYWiG8mioa3njpVwBZZ
	8H0y8PbybJI7fC70A7SpnI4VyIfUucX1VXivGP9sPpNFsXGXQIMXY+iX5lDJVE4J4NZcPQVY3G5EE
	/UWnd8V6xYtPpN/6xvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw3S3-00BS2q-9i; Tue, 31 May 2022 15:06:31 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw3Qu-00BRKh-CW
	for linux-mtd@lists.infradead.org; Tue, 31 May 2022 15:05:21 +0000
Received: by mail-ot1-f41.google.com with SMTP id w19-20020a9d6393000000b0060aeb359ca8so9757236otk.6
        for <linux-mtd@lists.infradead.org>; Tue, 31 May 2022 08:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xj2Z1U92BdmttgU1EYX7laNcSPjSBas1ZZobptPzNlg=;
        b=1WD4MlDmaqww0t2gfLK+g0MkGyIvdPfl+JovmLzxEz+CfMRw9MFHgkTXOC4yDkt8Hg
         JPewFLgzJYIK5g1IwI9DGX8YkvpJaMb1fLgZOlzsOgYSUPm+lWh+OWrauFWnWi8Yff70
         +eStuopd88Kz1Sl+1IHqnQovw0XmvkbsOA4QfMPI6EL6/d7S/ub03wfQZE8YPg7Qw1RG
         /QFw+yilBV0K2V8RPS+Zyv53slyVdp89ufRiwScwxMKyUZMo/06T07PvGn/WtnwEGZ5o
         IUu09MLKClfdSRSO+X9Lut08QsPuMU0j9d6GwVpnp9xADBLFVo+4bWPqdHadKl5AI+ab
         gPvA==
X-Gm-Message-State: AOAM53266ltPpAYHwxocNGF4LVYjQQndthLt3HGOrCEw3mDBG944Rlw4
	pW/i55juyK32dJMA0wfkbA==
X-Google-Smtp-Source: ABdhPJxs1kMjW3sgzRoRm0kcPUc+pqAfy0T4ijYvdaT2jVqzv2rml3a5biHfLmIT6RRYnDEbgRuREQ==
X-Received: by 2002:a9d:72d9:0:b0:60a:fb20:e1e7 with SMTP id d25-20020a9d72d9000000b0060afb20e1e7mr18993036otk.13.1654009516882;
        Tue, 31 May 2022 08:05:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g3-20020a4ad303000000b0040ed6225457sm5733287oos.47.2022.05.31.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 08:05:16 -0700 (PDT)
Received: (nullmailer pid 1762683 invoked by uid 1000);
	Tue, 31 May 2022 15:05:15 -0000
Date: Tue, 31 May 2022 10:05:15 -0500
From: Rob Herring <robh@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: mxc-nand: Drop undocumented properties
 from example
Message-ID: <20220531150515.GB1742958-robh@kernel.org>
References: <20220525205947.2487165-1-robh@kernel.org>
 <20220527093839.3byc6r6ixuu5givt@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220527093839.3byc6r6ixuu5givt@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_080520_450575_2BB714BF 
X-CRM114-Status: GOOD (  22.25  )
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

On Fri, May 27, 2022 at 11:38:39AM +0200, Marc Kleine-Budde wrote:
> On 25.05.2022 15:59:46, Rob Herring wrote:
> > With unevaluatedProperties issues fixed, 'nand-bus-width' and
> > 'nand-ecc-mode' are flagged as undocumented. Removing them from the example
> > is the easiest solution to silence the warnings.
> > 
> > Signed-off-by: Rob Herring <robh@kernel.org>
> 
> At least the 'nand-bus-width' property is described in
> "nand-controller.yaml" and the "mxc-nand.yaml" refers to it.
> 
> | allOf:
> |   - $ref: "nand-controller.yaml"
> 
> Is this ref broken?

Nope, read my note below. 'nand-bus-width' is documented as a nand chip 
(child node) property, not a nand controller property.


> regards,
> Marc
> 
> > ---
> > These properties may be deprecated, but they are still widely used in
> > bindings. They either need to be documented (and marked deprecated) or
> > removed from current users (i.e. dts files).


^^^^

> > ---
> >  Documentation/devicetree/bindings/mtd/mxc-nand.yaml | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
> > index 73b86f2226c7..66da1b476ab7 100644
> > --- a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
> > @@ -37,6 +37,4 @@ examples:
> >          compatible = "fsl,imx27-nand";
> >          reg = <0xd8000000 0x1000>;
> >          interrupts = <29>;
> > -        nand-bus-width = <8>;
> > -        nand-ecc-mode = "hw";
> >      };
> > -- 
> > 2.34.1
> > 
> > 
> 
> -- 
> Pengutronix e.K.                 | Marc Kleine-Budde           |
> Embedded Linux                   | https://www.pengutronix.de  |
> Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
