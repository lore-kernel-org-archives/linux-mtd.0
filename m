Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2449AEB64DC
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jun 2023 22:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MM9Ty9KBAxAGsn8amtPSPGxhGamzIHUFL1xhFRMCXpM=; b=oi0YouEzKCS4fN
	txyGCx0il1cn6I/UY2RKaPW85P2tSfmzThNecCNG9Sp+bBXhruQIGEIWWc5hL8FX7tBI6q3PnH9h0
	+pz4/P7dQGC61XJKoVIh9VOfUlt5eLcm1csNGGS1bPrR96v9CvPkUfoZONB2tGu4Xu4lDa9riO6qp
	8xcdKL4/R/s+ZAIuR7ILqff726RiIfWRjEzmql1s7dKg4LP0NnQEuQVBUU0FtV0kMAUC2WHB86lvi
	zWzvhheC7qX4cLkx3uogIHa+NWpQnCEBNMmABMrGCwChWHNG9elA8zBsoFan+SI5xlNyXlTdk3Y76
	Z7mmdhRG++inGG+pjM8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9ZFk-00Ctgw-2k;
	Wed, 14 Jun 2023 22:46:12 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9ZFi-00CtgM-1P
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jun 2023 22:46:11 +0000
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-77b00bb3fd6so4754239f.1
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2023 15:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686782769; x=1689374769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzFbvoIJ4t4Nns2Tzp9MXVAK+Y2iKf78oAJPq6tM7i0=;
        b=LpNF9kZi1GsfzOPmV+iJH39wL54QoU9PADs3VLCzBc2KS+jwbpchmpL6KxIHM7FdE3
         V7Lz1uIGiAcgvJl1Xunee0qGhVaNHKT10h4LNk1Vjww1sUTZGPvxpVuu8mSoobD2Lzrj
         UPrTlLLSy/qBiI3zrMtXCwVMH4nao+A53ek1Bo3TxxiYi3SHrFYyvfkE0k+nFtvFdwyp
         UgIZK99dMJdIQ6yAvUiC2mt5Cd5CtEvcJepZu8yys1fPWYqmQ8RuxJkE5BEQ4BRjw1tu
         oLzMCBPvlLUmiN3tb/shVYD441aZbZcalQ7mL5t6ShxRTbfTlIqB3LVHl0JPDAz0b0nd
         MaYA==
X-Gm-Message-State: AC+VfDzvwZbmxCGa3nMspZqPxwFkyUJDZ7U2Tv3WSKjon3jxCR9whBvG
	eqJXJsPULXsefcx6gaZywA==
X-Google-Smtp-Source: ACHHUZ4vaIybEI80mWCKFbfdo6sDF5nVXQOHHmgAYr/oglK5WKoWospk26BObaNayqqpbT0oI+V27A==
X-Received: by 2002:a05:6e02:218f:b0:33e:747c:4ebb with SMTP id j15-20020a056e02218f00b0033e747c4ebbmr2353324ila.6.1686782769111;
        Wed, 14 Jun 2023 15:46:09 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id d20-20020a02a494000000b0042312dc690csm124319jam.132.2023.06.14.15.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 15:46:08 -0700 (PDT)
Received: (nullmailer pid 3003004 invoked by uid 1000);
	Wed, 14 Jun 2023 22:46:05 -0000
Date: Wed, 14 Jun 2023 16:46:05 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: William Zhang <william.zhang@broadcom.com>, Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, Linux MTD List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com, rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com, computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 05/12] dt-bindings: mtd: brcmnand: Updates for bcmbca SoCs
Message-ID: <20230614224605.GB2990941-robh@kernel.org>
References: <20230606231252.94838-1-william.zhang@broadcom.com>
 <20230606231252.94838-6-william.zhang@broadcom.com>
 <20230607101452.4c265d7e@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607101452.4c265d7e@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_154610_476090_AB9D170B 
X-CRM114-Status: GOOD (  33.55  )
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

On Wed, Jun 07, 2023 at 10:14:52AM +0200, Miquel Raynal wrote:
> Hi William,
> 
> william.zhang@broadcom.com wrote on Tue,  6 Jun 2023 16:12:45 -0700:
> 
> > Use new compatiable brcm,nand-bcmbca to support BCMBCA broadband
> > product. The old compatible string is still kept in the driver so old
> > dtb can still work.
> > 
> > Add brcm,nand-use-wp property to have an option for disabling this
> > feature on broadband board design that does not use write protection.
> > Add brcm,nand-ecc-use-strap to get ecc setting from board strap for
> > broadband board designs because they do not specify ecc setting in dts
> > but rather using the strap setting.
> > 
> > Remove the requirement of interrupts and interrupt-names properties to
> > reflect the driver code.
> > 
> > This patch also includes a few minor fixes to the BCM63xx compatibles
> > and add myself to the list of maintainers.
> > 
> > Signed-off-by: William Zhang <william.zhang@broadcom.com>
> > ---
> > 
> >  .../bindings/mtd/brcm,brcmnand.yaml           | 64 +++++++++++++------
> >  1 file changed, 43 insertions(+), 21 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> > index 1571024aa119..1fe1c166a9db 100644
> > --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> > @@ -9,6 +9,7 @@ title: Broadcom STB NAND Controller
> >  maintainers:
> >    - Brian Norris <computersforpeace@gmail.com>
> >    - Kamal Dasu <kdasu.kdev@gmail.com>
> > +  - William Zhang <william.zhang@broadcom.com>
> >  
> >  description: |
> >    The Broadcom Set-Top Box NAND controller supports low-level access to raw NAND
> > @@ -18,9 +19,10 @@ description: |
> >    supports basic PROGRAM and READ functions, among other features.
> >  
> >    This controller was originally designed for STB SoCs (BCM7xxx) but is now
> > -  available on a variety of Broadcom SoCs, including some BCM3xxx, BCM63xx, and
> > -  iProc/Cygnus. Its history includes several similar (but not fully register
> > -  compatible) versions.
> > +  available on a variety of Broadcom SoCs, including some BCM3xxx, MIPS based
> > +  Broadband SoC (BCM63xx), ARM based Broadband SoC (BCMBCA) and iProc/Cygnus.
> > +  Its history includes several similar (but not fully register compatible)
> > +  versions.
> >  
> >    -- Additional SoC-specific NAND controller properties --
> >  
> > @@ -53,9 +55,9 @@ properties:
> >                - brcm,brcmnand-v7.2
> >                - brcm,brcmnand-v7.3
> >            - const: brcm,brcmnand
> > -      - description: BCM63138 SoC-specific NAND controller
> > +      - description: BCMBCA SoC-specific NAND controller
> >          items:
> > -          - const: brcm,nand-bcm63138
> > +          - const: brcm,nand-bcmbca
> >            - enum:
> >                - brcm,brcmnand-v7.0
> >                - brcm,brcmnand-v7.1
> > @@ -65,11 +67,15 @@ properties:
> >            - const: brcm,nand-iproc
> >            - const: brcm,brcmnand-v6.1
> >            - const: brcm,brcmnand
> > -      - description: BCM63168 SoC-specific NAND controller
> > +      - description: BCM63xx SoC-specific NAND controller
> >          items:
> > -          - const: brcm,nand-bcm63168
> > -          - const: brcm,nand-bcm6368
> > -          - const: brcm,brcmnand-v4.0
> > +          - enum:
> > +              - brcm,nand-bcm63168
> > +              - brcm,nand-bcm6368
> > +          - enum:
> > +              - brcm,brcmnand-v2.1
> > +              - brcm,brcmnand-v2.2
> > +              - brcm,brcmnand-v4.0
> >            - const: brcm,brcmnand
> >  
> >    reg:
> > @@ -111,6 +117,19 @@ properties:
> >        earlier versions of this core that include WP
> >      type: boolean
> >  
> > +  brcm,nand-use-wp:
> > +    description:
> > +      Use this integer to indicate if board design uses
> > +      controller's write protection feature and connects its
> > +      NAND_WPb pin to nand chip's WP_L pin. Driver defaults to
> > +      use this feature when this property does not exist.
> > +      Set to 0 if WP pins are not connected and feature is not
> > +      used. Set to 1 if WP pins are connected and feature is used.
> > +      Set to 2 if WP pins are connected but disable this feature
> > +      through driver that sets controller to output high on NAND_WPb.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1, 2]
> 
> Perhaps strings would be welcome. I'll let binding maintainers say what
> they think of it.

1 is redundant as it is the same as not present. Seems like a 
'brcm,disable-wp' boolean would suffice here.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
