Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08707C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 09:28:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC64217D4
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 09:28:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="inTVFgSl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAC64217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uxsUMNt9glhiv/EGokmorQkLH6zuSzPi9xnlZv0OYPE=; b=inTVFgSlaN908VmRyWEOcTaSM
	gxMcy/ZQpwLQR7vTu61ohpfUiCBhz9JVNujCmEaOLbZwX2aHyqKUcaFs9WQrt2w04ZRUFuZqcyfvR
	KuuudQGuI3YE5XGT43dqWWzv1WufISNQbGiZ9lN6M8LwMIaMqfTr8Sdi4WMv1oulkndTQPdc5ugRY
	3rWXTDWPnfxxpolLVVrd6/a/o89lG0e3aJgPj60qZdy8MxQk2CSP69Of2GM+GK+kcePJw0hywbh8l
	AugcgLK2/VJOOHaBnnXyWD3zETYLa4DzWhJVQxt4Yk4ZeC2iDgQusQ/rtAIkGABEeoghTDLvc6qGy
	ObAbOnoVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCL9a-0007xo-MX; Fri, 05 Apr 2019 09:28:54 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCL9P-0007mt-5b; Fri, 05 Apr 2019 09:28:44 +0000
Received: from xps13 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id E83DF100015;
 Fri,  5 Apr 2019 09:28:37 +0000 (UTC)
Date: Fri, 5 Apr 2019 11:28:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: sunxi: Add new compatible
Message-ID: <20190405112813.07d89534@xps13>
In-Reply-To: <20190405091302.mz3gox5jvoy3ygjr@flea>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-2-miquel.raynal@bootlin.com>
 <20190405091302.mz3gox5jvoy3ygjr@flea>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_022843_510258_30EC4E13 
X-CRM114-Status: GOOD (  24.63  )
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
Content-Type: multipart/mixed; boundary="===============8233914665028756430=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8233914665028756430==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/Mt2zQUa2GT7rjMNkmTVG+Na"; protocol="application/pgp-signature"

--Sig_/Mt2zQUa2GT7rjMNkmTVG+Na
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Maxime Ripard <maxime.ripard@bootlin.com> wrote on Fri, 5 Apr 2019
11:13:02 +0200:

> Hi,
>=20
> On Thu, Apr 04, 2019 at 06:21:09PM +0200, Miquel Raynal wrote:
> > The A33 NAND controller is slightly different than the A10+ ones,
> > eg. DMA handling is a bit different and a few register offsets
> > changed.
> >
> > Introduce a new compatible to represent this version of the IP.
> >
> > Also append '-controller' to the new compatible (which is required for
> > new compatibles) as this is describing a NAND controller and not a
> > NAND chip. =20
>=20
> Out of curiosity, why are you requiring that suffix now?

Because people are confused with the terminology and we see people
mixing all the terms very often: NAND controller, NAND bus, NAND
chip, ECC engine, etc. This node only describes a NAND controller, so
let be more precise and stop naming everything just "NAND".

>=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/sunxi-nand.txt | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Doc=
umentation/devicetree/bindings/mtd/sunxi-nand.txt
> > index dcd5a5d80dc0..6128d41d8c59 100644
> > --- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> > @@ -1,7 +1,12 @@
> >  Allwinner NAND Flash Controller (NFC)
> >
> >  Required properties:
> > -- compatible : "allwinner,sun4i-a10-nand".
> > +- compatible : Must be one of:
> > +	       - "allwinner,sun4i-a10-nand"
> > +	       - "allwinner,sun8i-a33-nand-controller"
> > +	       The former may be used by all IPs, however sun8i family
> > +	       will need the second one in order to make use of the
> > +	       internal DMA capabilities. =20
>=20
> I'm not sure we should have that statement. We have no idea whether or
> not this can be used by all IPs *today*, and we surely don't know
> about the one that are going to come out.

Shall I just drop the whole comment ("The former" ... "capabilities.")?


Thanks,
Miqu=C3=A8l

--Sig_/Mt2zQUa2GT7rjMNkmTVG+Na
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE9HuaYnbmDhq/XIDIJWrqGEe9VoQFAlynH60ACgkQJWrqGEe9
VoQdwAgAtbI64ZDpawZ2HLgjTSLevz/kBR4Lu21liULYWueW5kEtaPmOPt2kBsdz
vgL+ZQvAWEDy+dq64Sx0RYOwP4F5D6xSkvPIbZPRtGuhIa5Zn+5vuu7BQQpXZrwD
Ca5LGh8UNUM4xkF/XQcJogymFrwG3MVjUW0T1Kes9vT5q7IML+4qDszShB/mIJ5t
HlSsAVYNicOxRlMZfCogFgp5CvlHESX9IMZa0HJd9z8LMBJK7roXq3Lh2bui8D+e
ilomXghjGuoxQeMJu+i3vPeCNE5XAxwZbTDjFUUyvKaEK7kPzXSEqCSOyIlBqk/2
vl0n+rDQffi/njJjxfB708IYEvWgdw==
=BJHf
-----END PGP SIGNATURE-----

--Sig_/Mt2zQUa2GT7rjMNkmTVG+Na--


--===============8233914665028756430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8233914665028756430==--

