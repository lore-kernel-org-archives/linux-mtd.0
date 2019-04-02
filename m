Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9D0C4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 11:12:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EDB920883
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 11:12:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hMawgPdT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EDB920883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LFRv6S/vY6A9Bp+u0i5ounwQRX9lraGNoCpXlRnqBPY=; b=hMawgPdTCb6ne1ISVDQgamvzU
	IzcMKwkubu2OQ3Cssyf4wbY+OsVIEs62s7kEoyi7XOgCNinZsACPhV7J5qx6v6+20sJDHQtuW4cKo
	HRO6BaX4u/W7Z5CxWEneSPORv8x2qDIwhWefudHMaL2nSy0392577TvccOJ5jzqne4IIGkr2ReXVn
	iV5tedrmEkMlbFxUBijxXhzJHiNAWdSdbgi17REoRzvxInPhNzlWsAHH6y0eTakX7Gz+URe2WQqet
	tEr1qc7UyZ7cUT6Mj6+yCco7KRiTABR35Mlnq8gF6v8I8SDHe/Z4S1TFuBKbZO7g0D+Tv3APxwTVQ
	dy4JtGXQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBHKn-0008P6-FU; Tue, 02 Apr 2019 11:12:05 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBHKd-0008HS-OY; Tue, 02 Apr 2019 11:11:57 +0000
X-Originating-IP: 90.88.32.136
Received: from localhost (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0A193C000B;
 Tue,  2 Apr 2019 11:11:39 +0000 (UTC)
Date: Tue, 2 Apr 2019 13:11:38 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 4/4] ARM: dts: sunxi: Remove useless address and size cells
Message-ID: <20190402111138.d2qnitlri3audk7r@flea>
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
 <8774db23f87fe401f8ac7b775decba3cde2a56ea.1554153146.git-series.maxime.ripard@bootlin.com>
 <20190402101952.657ee274@xps13>
MIME-Version: 1.0
In-Reply-To: <20190402101952.657ee274@xps13>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_041155_958912_B0DC5D2A 
X-CRM114-Status: GOOD (  13.40  )
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
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5602226076386593825=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5602226076386593825==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jyvuwjnoisiuqv2e"
Content-Disposition: inline


--jyvuwjnoisiuqv2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 02, 2019 at 10:19:52AM +0200, Miquel Raynal wrote:
> Hi Maxime,
>
> Maxime Ripard <maxime.ripard@bootlin.com> wrote on Mon,  1 Apr 2019
> 23:13:56 +0200:
>
> > The NAND chips in our DTs have address and size cells, even though they
> > don't have any child nodes. Remove them.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  arch/arm/boot/dts/sun5i-gr8-chip-pro.dts             | 2 --
> >  arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts | 2 --
> >  2 files changed, 4 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> > index 533a4ecc05e2..a32cde3e32eb 100644
> > --- a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> > +++ b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> > @@ -133,8 +133,6 @@
> >  	status = "okay";
> >
> >  	nand@0 {
> > -		#address-cells = <2>;
> > -		#size-cells = <2>;
> >  		reg = <0>;
> >  		allwinner,rb = <0>;
> >  		nand-ecc-mode = "hw";
> > diff --git a/arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts b/arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts
> > index 32cf1ab33aab..246dec5846a4 100644
> > --- a/arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts
> > +++ b/arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts
> > @@ -34,8 +34,6 @@
> >
> >  	/* 2Gb Macronix MX30LF2G18AC (3V) */
> >  	nand@0 {
> > -		#address-cells = <1>;
> > -		#size-cells = <1>;
> >  		reg = <0>;
> >  		allwinner,rb = <0>;
> >  		nand-ecc-mode = "hw";
>
>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied 3 and 4, thanks!

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--jyvuwjnoisiuqv2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKNDagAKCRDj7w1vZxhR
xUaQAP9A+69BOUo8X/jrSFvJ5KW/vBUAT8LQyk85JrIidgr9HgEA14ZaNVdq58Qd
mtku/ItH4H8wKVKIGWHw3FTEXg9GpAI=
=AHB1
-----END PGP SIGNATURE-----

--jyvuwjnoisiuqv2e--


--===============5602226076386593825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5602226076386593825==--

