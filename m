Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EF4C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 07:45:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28E292068F
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 07:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TlJ36Ar6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28E292068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8QFHYdKekTcN+4tAD3nR5FdWwGAovbfwuwzGK4U/uLA=; b=TlJ36Ar6c7rEywqDcS8fRBxUP
	4OQCVBGGiAbvgUukC2pg21NjfImbrDHGaBK2tzBMLi2wpZoc7lgJr6beBlhHKXy76/aCesoY3DGN2
	esIgqQF1abAEYn+XxwjJ3y0iazEodId0pEbdKJfo2/tYbT5ebRFvryKkGjJXwYNUtw/x/9JMUCef+
	/4Ju5OjOYhoUU0G7sROZUJsdRvsoaA+MyoGh76SSjsKP7xiYb6VTi25GS2DGcCzHC8zYjUj8eozXH
	Ke16aB1hgI8lApea1qk2zB6JAINEiMoUJfD/LFO9e9kMuEgVemmlvfo3qrpcuAFDQoJszarlIZEnP
	XVYqw+44A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kATdj-0007ie-5q; Tue, 25 Aug 2020 07:45:07 +0000
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kATdg-0007iB-DN; Tue, 25 Aug 2020 07:45:05 +0000
Received: by mail-wm1-f65.google.com with SMTP id a65so1370622wme.5;
 Tue, 25 Aug 2020 00:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PxsmdDcFch7c22J7JxfwpI7tti1SyAdvo+8oYjg1+2I=;
 b=W9x9LOADmcNOQivln5AcZRDKC+C4kM1VPqLo2EIxGupDZS0p3VldX5fMiA7VrexCSi
 FObL+hCWwJXIXMsq4Jr3LIqLoiE/HOGwYCwbLCwIizWXWBefu25FvMLm/6NcB4FCfLa/
 oJ4HNDOXRkxB/yJr4zUOQQRNcWzY6oMFUUBQSFKPavb8l+ruOV0DoG1krdfgl1L+0gcz
 UeOuyAceqLSmrEDiUNglmrYmKcDnfYqlsahlF47z5cuSc1mrmAFEL3CXHIGiQi7sfqbU
 4uxNZVdS6QH/tOa4X6GRdE2FM8I0AXCBKK/aV7jXXU5f6gpnJWmyqle8zBrLhO2W58Cz
 dyzw==
X-Gm-Message-State: AOAM5317CFTS5QTGYrJvo+PLTVlrckRGtjpiXzf1PHRl/fpuHd4Sk9o6
 tQXZo3awNQ0beNTzsJVSL2U=
X-Google-Smtp-Source: ABdhPJznfSTxJORBNcaOSIRYMPeV1drxg7rKMYcnYQCiCc89bTxVFyAryIoMQ5VngTiyECIcH0/2Yw==
X-Received: by 2002:a1c:a3c4:: with SMTP id m187mr717799wme.43.1598341503219; 
 Tue, 25 Aug 2020 00:45:03 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id h7sm4200304wmf.43.2020.08.25.00.45.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Aug 2020 00:45:02 -0700 (PDT)
Date: Tue, 25 Aug 2020 09:45:00 +0200
From: "krzk@kernel.org" <krzk@kernel.org>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH 03/16] arm64: dts: imx8mm-beacon-som.dtsi: Align
 regulator names with schema
Message-ID: <20200825074500.GA19323@kozik-lap>
References: <20200824190701.8447-1-krzk@kernel.org>
 <20200824190701.8447-3-krzk@kernel.org>
 <fa042a4f670775f340e88fca8f363252112fd538.camel@fi.rohmeurope.com>
 <20200825072537.GA5914@kozik-lap>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825072537.GA5914@kozik-lap>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_034504_558317_4DB19CF6 
X-CRM114-Status: GOOD (  32.57  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "daniel.baluta@nxp.com" <daniel.baluta@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "Anson.Huang@nxp.com" <Anson.Huang@nxp.com>,
 "aford173@gmail.com" <aford173@gmail.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "han.xu@nxp.com" <han.xu@nxp.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "yibin.gong@nxp.com" <yibin.gong@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "jun.li@nxp.com" <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Aug 25, 2020 at 09:25:37AM +0200, krzk@kernel.org wrote:
> On Tue, Aug 25, 2020 at 06:51:33AM +0000, Vaittinen, Matti wrote:
> > Hello Krzysztof,
> > 
> > Just some questions - please ignore if I misunderstood the impact of
> > the change.
> > 
> > On Mon, 2020-08-24 at 21:06 +0200, Krzysztof Kozlowski wrote:
> > > Device tree schema expects regulator names to be lowercase.  This
> > > fixes
> > > dtbs_check warnings like:
> > > 
> > >     arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml: pmic@4b:
> > > regulators:LDO1:regulator-name:0: 'LDO1' does not match '^ldo[1-6]$'
> > > 
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > ---
> > >  .../boot/dts/freescale/imx8mn-ddr4-evk.dts    | 22 +++++++++------
> > > ----
> > >  1 file changed, 11 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> > > b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> > > index a1e5483dbbbe..299caed5d46e 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> > > @@ -60,7 +60,7 @@
> > >  
> > >  		regulators {
> > >  			buck1_reg: BUCK1 {
> > > -				regulator-name = "BUCK1";
> > > +				regulator-name = "buck1";
> > 
> > I am not against this change but I would expect seeing some other
> > patches too? I guess this will change the regulator name in regulator
> > core, right? So maybe I am mistaken but it looks to me this change is
> > visible in suppliers, sysfs and debugfs too? Thus changing this sounds
> > a bit like asking for a nose bleed :) Am I right that the impact of
> > this change has been thoroughly tested? Are there any other patches
> > (that I have not seen) related to this change?
> 
> Oh, crap, the names of regulators in the driver are lowercase, but they
> use of_match_ptr for upper case. Seriously, why making a binding which
> is contradictory to the driver implementation on the first day?
> 
> The driver goes with binding, right? One expects uppercase, other
> lowercase...
> 
> And tell me, what is now the ABI? The binding or the incorrect
> implementation?

Wait, my mistake. I got confused by my own change. The node name stays
the same, so of_match will be correct.

The driver internally already uses lowercase names.

Everything looks good. I will just double check whether the constraints
did not change on the board after boot.

> 
> > 
> > >  				regulator-min-microvolt = <700000>;
> > >  				regulator-max-microvolt = <1300000>;
> > >  				regulator-boot-on;
> > > @@ -69,7 +69,7 @@
> > >  			};
> > >  
> > >  			buck2_reg: BUCK2 {
> > > -				regulator-name = "BUCK2";
> > > +				regulator-name = "buck2";
> > >  				regulator-min-microvolt = <700000>;
> > >  				regulator-max-microvolt = <1300000>;
> > >  				regulator-boot-on;
> > > @@ -79,14 +79,14 @@
> > >  
> > >  			buck3_reg: BUCK3 {
> > >  				// BUCK5 in datasheet
> > > -				regulator-name = "BUCK3";
> > > +				regulator-name = "buck3";
> > >  				regulator-min-microvolt = <700000>;
> > >  				regulator-max-microvolt = <1350000>;
> > >  			};
> > >  
> > >  			buck4_reg: BUCK4 {
> > >  				// BUCK6 in datasheet
> > > -				regulator-name = "BUCK4";
> > > +				regulator-name = "buck4";
> > >  				regulator-min-microvolt = <3000000>;
> > >  				regulator-max-microvolt = <3300000>;
> > >  				regulator-boot-on;
> > > @@ -95,7 +95,7 @@
> > >  
> > >  			buck5_reg: BUCK5 {
> > >  				// BUCK7 in datasheet
> > > -				regulator-name = "BUCK5";
> > > +				regulator-name = "buck5";
> > 
> > What I see in bd718x7-regulator.c for LDO6 desc is:
> > 
> >                         /* LDO6 is supplied by buck5 */
> >                         .supply_name = "buck5",
> > 
> > So, is this change going to change the supply-chain for the board? Is
> > this intended? (Or am I mistaken on what is the impact of regulator-
> > name property?)

Good point, let me check the supplies.

> 
> The names will take regulator names from the driver. The problem is with
> matching the of_node.
> 
> 
> Dear Rob,
> 
> Maybe you have an idea how to fix this driver-binding ABI
> incompatibility? Or better just leave it?

Not valid anymore, I just got confused...

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
