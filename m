Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B7CC4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 09:56:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FF0C21738
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 09:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d+aHfW75"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FF0C21738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s6Xc8zt+rS77u5vi3JWSvWRwEc8e16SmwUsPUVbAVtY=; b=d+aHfW75LHwKNInIyns8ozniq
	XZ0mWRXvgBDMW8MRFjN3tXZexvvTc52xNHCXlK6L62MNL+QHLrKi8DN/ToTiEajlA46uxgS3LGDM1
	vXg5xqQjbLD6RPOsBU7jSM7T7TOpj4nPQwC+Q1XPPVihvS9TZMTZ3I82gxPJZOkU7DEBybeRl7DHE
	c2GByy58Ve31L4+YJUMsK9qMeralaP9Cd1LDtn7GCSnG468FD6L39YTNA/NXlmiUoEfoL3woqLxN3
	Zn0zEvpz4ZqUbAhgv6J48NVctYh+0wb42et5Xtfc0XRdnfmpI4W/PfGdiqfKhd94Zefzkb7j+7Iui
	EiC9v9s6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCLaQ-00056s-AA; Fri, 05 Apr 2019 09:56:38 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCLaG-0004yD-ON; Fri, 05 Apr 2019 09:56:30 +0000
X-Originating-IP: 90.88.30.125
Received: from localhost (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BC29A1C000C;
 Fri,  5 Apr 2019 09:56:24 +0000 (UTC)
Date: Fri, 5 Apr 2019 11:56:24 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: sunxi: Add new compatible
Message-ID: <20190405095624.hv6mfxj7h2dt6mqt@flea>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-2-miquel.raynal@bootlin.com>
 <20190405091302.mz3gox5jvoy3ygjr@flea>
 <20190405112813.07d89534@xps13>
MIME-Version: 1.0
In-Reply-To: <20190405112813.07d89534@xps13>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_025629_103416_DF9CDF0A 
X-CRM114-Status: GOOD (  26.47  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1447236876626864845=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1447236876626864845==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g5oibzqcggl7e6i7"
Content-Disposition: inline


--g5oibzqcggl7e6i7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 05, 2019 at 11:28:13AM +0200, Miquel Raynal wrote:
> Hi Maxime,
>
> Maxime Ripard <maxime.ripard@bootlin.com> wrote on Fri, 5 Apr 2019
> 11:13:02 +0200:
>
> > Hi,
> >
> > On Thu, Apr 04, 2019 at 06:21:09PM +0200, Miquel Raynal wrote:
> > > The A33 NAND controller is slightly different than the A10+ ones,
> > > eg. DMA handling is a bit different and a few register offsets
> > > changed.
> > >
> > > Introduce a new compatible to represent this version of the IP.
> > >
> > > Also append '-controller' to the new compatible (which is required for
> > > new compatibles) as this is describing a NAND controller and not a
> > > NAND chip.
> >
> > Out of curiosity, why are you requiring that suffix now?
>
> Because people are confused with the terminology and we see people
> mixing all the terms very often: NAND controller, NAND bus, NAND
> chip, ECC engine, etc. This node only describes a NAND controller, so
> let be more precise and stop naming everything just "NAND".

Sounds reasonable :)

> >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  Documentation/devicetree/bindings/mtd/sunxi-nand.txt | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> > > index dcd5a5d80dc0..6128d41d8c59 100644
> > > --- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> > > +++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> > > @@ -1,7 +1,12 @@
> > >  Allwinner NAND Flash Controller (NFC)
> > >
> > >  Required properties:
> > > -- compatible : "allwinner,sun4i-a10-nand".
> > > +- compatible : Must be one of:
> > > +	       - "allwinner,sun4i-a10-nand"
> > > +	       - "allwinner,sun8i-a33-nand-controller"
> > > +	       The former may be used by all IPs, however sun8i family
> > > +	       will need the second one in order to make use of the
> > > +	       internal DMA capabilities.
> >
> > I'm not sure we should have that statement. We have no idea whether or
> > not this can be used by all IPs *today*, and we surely don't know
> > about the one that are going to come out.
>
> Shall I just drop the whole comment ("The former" ... "capabilities.")?

Yep.

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--g5oibzqcggl7e6i7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKcmRwAKCRDj7w1vZxhR
xW8MAQD4BNi7kYSu+KRgYjwK8X/4FeibzytfB2OaOveyw50krgEA20LHaPoBPDMS
VDZMN/6E/C3dpHAh9/06187+1GltOwY=
=DvlF
-----END PGP SIGNATURE-----

--g5oibzqcggl7e6i7--


--===============1447236876626864845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1447236876626864845==--

