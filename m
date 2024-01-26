Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322E3C47DDB
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jan 2024 16:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAzKg21lfVo4rQFhpcevduphwdRuYheP1cVvoV9Bqlo=; b=xLx5qfBKr95V5aMd8lptPH0UgB
	3YeIBuo70j6mt2Adi+pe96P/2UHIWW2DBwnID+JEMKSEBDzbiPOA0Q0jhPJRz/l+Vk44somfG8U9z
	beTntSahqEQykzyl+x3WRd3fVnhNvJsShH9k8mY8ekjHStq0YCb0fxYUTjLUlt6Qjc5UNORx8HG1O
	20FyDCuUIlKCf6Ev62pecQDehvTL4Ijo1eTTFaojd63Z/i+p45jxPCI07aFx1CgCB7T8atV8XKx7K
	6EmfJSTOYpOHgj0m9E2KB1NY76d32nxkkll7l1nt+YGe9M9jgLijacyXdeK5N5vxy8t1+dAQ4LrGk
	FlmSxFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTPML-00000004jnf-2bjS;
	Fri, 26 Jan 2024 16:47:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTPMH-00000004jkS-1V1j;
	Fri, 26 Jan 2024 16:47:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4D40ECE370A;
	Fri, 26 Jan 2024 16:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DCA3C43399;
	Fri, 26 Jan 2024 16:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706287614;
	bh=S8uf1+3V/6CW8VnPFT58PDMnQ3a9uAWN2UFFule9amg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1v1bGxKRtJl7chLLI5Khywi90YT0KiB8pRqdlmslf41IEqCKjxk7TwbhGYXeWOwU
	 R93sgnK3R2Auw7XBu8lZyiNBynOxGqH5w20hMhscfxiJ2FuydO7jXQEFWeUNwTwY5U
	 0mftxsnVjqTrs3U4vWsLhmJ9CiYW10H7V1C15G3HkkHKP2kK4xc4BJ+KLGj91Cuj+9
	 bFwmj72/MqgahU8bdCEEyiAtvosqYQnZpE17hzHW5gsCcY4Htm6grpr8edc6E4sOm8
	 p+0oisAdpas+KQsm6NWTuySmSfweECES8qIZiXMi+S4gYkh0Oht3IrIcWf00WMMlG/
	 33CwBPDV/bOmA==
Date: Fri, 26 Jan 2024 16:46:46 +0000
From: Conor Dooley <conor@kernel.org>
To: William Zhang <william.zhang@broadcom.com>
Cc: David Regan <dregan@broadcom.com>, dregan@mail.com,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, computersforpeace@gmail.com,
	kdasu.kdev@gmail.com, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	joel.peshkin@broadcom.com, tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com, anand.gore@broadcom.com,
	kursad.oney@broadcom.com, florian.fainelli@broadcom.com,
	rafal@milecki.pl, bcm-kernel-feedback-list@broadcom.com,
	andre.przywara@arm.com, baruch@tkos.co.il,
	linux-arm-kernel@lists.infradead.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v3 01/10] dt-bindings: mtd: brcmnand: Updates for bcmbca
 SoCs
Message-ID: <20240126-armadillo-clean-e3509ed23ed5@spud>
References: <20240124030458.98408-1-dregan@broadcom.com>
 <20240124030458.98408-2-dregan@broadcom.com>
 <20240124-direness-outpost-bbc22550a161@spud>
 <451151f3-33df-4de8-ab62-a683ad4b7cb1@broadcom.com>
 <20240125-drove-undiluted-5d822b7fd4fa@spud>
 <b2bc0948-7039-4dbd-8152-08a51e744c59@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <b2bc0948-7039-4dbd-8152-08a51e744c59@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_084713_774669_8EAF6667 
X-CRM114-Status: GOOD (  50.17  )
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
Content-Type: multipart/mixed; boundary="===============5177187981194355012=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5177187981194355012==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iKGIjVp4UK6D/Mn9"
Content-Disposition: inline


--iKGIjVp4UK6D/Mn9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 05:55:29PM -0800, William Zhang wrote:
> On 1/25/24 11:51, Conor Dooley wrote:
> > On Wed, Jan 24, 2024 at 07:01:48PM -0800, William Zhang wrote:
> > > On 1/24/24 09:24, Conor Dooley wrote:
> > > > On Tue, Jan 23, 2024 at 07:04:49PM -0800, David Regan wrote:
> > > > > From: William Zhang <william.zhang@broadcom.com>

> > > And the reason I keep it as int is because there could be a potential=
 value
> > > of 2 for another mode that the current driver could set the wp_on to.
> >=20
> > Can you explain, in driver independent terms, what this other mode has
> > to do with how the WP is connected?
> > Either you've got the standard scenario where apparently "NAND_WPb" and
> > "WP_L" are connected and another situation where they are not.
> > Is there another pin configuration in addition to that, that this 3rd
> > mode represents?
> >=20
> The 3rd mode is WP pin connected but wp feature is disabled in the
> controller.

What does "disabled" mean? The controller itself is not capable of using
the WP pin because of hardware modifications? Or there's a bit in a
register that disables it and that bit has been set by software?

If it is a hardware difference for that controller, why does it not have
a dedicated compatible? If it's a software decision, then it shouldn't
be in the DT in the first place ;)

We've gone back here a bunch trying to figure stuff out, and you give me
a vague one sentence answer. Please.

> > > I
> > > don't see it is being used in BCMBCA product but I am not sure about =
other
> > > SoC family. So I don't want to completely close the door here just in=
 case.
> >=20
> > If you ever need it, you could have a "brcm,wp-in-wacky-configuration"
> > property that indicates that the hardware is configured in that way
> > (providing that this hardware configuration is not just "NAND_WPb" and
> > "WP_L" pins connected. The property can very easily be made mutually
> > exclusive with "brcm,wp-not-connected" iff it ever comes to be.
> Yes we could have a new property but if we can have a single int property=
 to
> cover all, IMHO it is better to just have one property as these three mod=
es
> are related. I would really like to have it as an int property to keep
> things simple.

It is "better" because it is easier for you perhaps, but ripe for abuse.

> But if you think this is absolutely against the dts rule,  I will switch =
to
> the "brcm,wp-not-connected" boolean property as you suggested.

I'll answer this when you describe the mode better, right now I cannot
really comment, but I have not yet seen a justification for the non-flag
version of the property. Even if there's a justification for documenting
that other mode in the DT, I'm likely to still think boolean properties
are a better fit.

> > > > > If ecc
> > > > > +          strength and spare area size are set by nand-ecc-stren=
gth
> > > > > +          and brcm,nand-oob-sector-size in the dts, these settin=
gs
> > > > > +          have precedence and override this flag.
> > > >=20
> > > > Again, IMO, this is not for the binding to decide. That is a decisi=
on
> > > > for the operating system to make.
> > > >=20
> > > Again this is just for historic reason and BCMBCA as late player does=
 not
> > > want to break any existing dts setting.  So I thought it is useful to
> > > explain here.  I can remove this text if you don't think it should be=
 in the
> > > binding document.
> >=20
> > I don't, at least not in that form. I think it is reasonable to explain
> > why these values are better though.
> I understand the decision is for OS/driver to make. If we were to write
> another driver for other OS, the same precedence will apply too so the
> binding works the same way across all the OS. So I am not sure what better
> explanation or form I can put up here. I am open to any suggestion or I j=
ust
> delete it.

I would just delete it tbh.

Thanks,
Conor.

--iKGIjVp4UK6D/Mn9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbPh9gAKCRB4tDGHoIJi
0hw3AP4gQkWoZ3hipO7MVsw7nqCAhwk93HFqEigAirONBQpwwwD/b5a1m+W+ot8F
ksyesbSb6mDLyHd0R8xEtvEhcp0UrAs=
=xuth
-----END PGP SIGNATURE-----

--iKGIjVp4UK6D/Mn9--


--===============5177187981194355012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5177187981194355012==--

