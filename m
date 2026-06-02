Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D2ECD6E60
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2026 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fCxHxQWyFdDtzkOhrzreo7VsSFAhRnI23BvDBoI90I=; b=yj/JGl6zcFVHCmAM9DceKm2z53
	52qJqfT+WIbOeyZ3IJsZYOCupkoDtuHARyXFmn+C3kMry12wOhMhcnD3hQsGPESPabgPPs4LU7mD1
	r7rbGfJtEguUPtD4HVAGd5yLMiQB0jD1vj1wB4IhpT8GvqwrNHwm/Vt8cAm9QiEJA5nRcw3LO6SFh
	ZMnUsgRTsPKKZu2IfitZF4Qr6H1SdCOd3PEQztdDz0jU1SgP77MERL6usBJZjh4pJRxpsN4YJMKHu
	pzfbpkFwkotKLykY0ZsbgpdpYJ5vyQ5sMYKks5OQ30H7PCZghTlOlxebzAt6XqJ5oW51cOsBj6Ccx
	X3hXlVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURou-0000000DPz4-0N7R;
	Tue, 02 Jun 2026 16:18:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURor-0000000DPyX-28eM
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jun 2026 16:18:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D74D944400;
	Tue,  2 Jun 2026 16:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782C41F00893;
	Tue,  2 Jun 2026 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780417100;
	bh=E5lBZBn/6XyQaGLUjyr5xRIhIu6ddOyB1ZKhOi4w6SY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OzTqAnWvhREs7kN0FRcFz4cNP22b8RALpcnJfUsvHX9ZgANlP8wEgvF8Inwnk8WFK
	 6qh65PJZtP8YT4c/C+JaUf874b2joMoJdaZwNd/3+pqO0nqOjJmsitgG1E+FkYL/Pl
	 kO0EENlj9mkH/iGsQqFUA5hQAWR4NJrMfIr6YgfvCtRmeSKLwF0yj3eshsyodsCzRz
	 udHklaals+GNTGEc5mDiFbC65Vp260NwpA5hflI87my2ePxdlrtIexTEGxT8A6fUzJ
	 EUjDiID7e8SCBkm0mg5VuK63PVI7SDh5Z19n2VXMWXYY+QAZ3RRPMSYyf+tnM5Y95B
	 N7D0dXYKBiDDQ==
Date: Tue, 2 Jun 2026 17:18:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Santhosh Kumar K <s-k6@ti.com>, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, richard@nod.at,
	vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org,
	takahiro.kuwano@infineon.com, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, praneeth@ti.com, u-kumar1@ti.com,
	a-dutta@ti.com
Subject: Re: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to
 specify a frequency pair
Message-ID: <20260602-aptly-bunkbed-1bd3a8d63d54@spud>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-2-s-k6@ti.com>
 <20260528-clergyman-kindling-20971775ba78@spud>
 <eaa75113-2b89-468d-aca8-932bc7e33a7d@ti.com>
 <87cxy92llq.fsf@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <87cxy92llq.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_091821_592034_FB2C12B1 
X-CRM114-Status: GOOD (  34.99  )
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
Content-Type: multipart/mixed; boundary="===============4620752953224662927=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4620752953224662927==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AJLPS9b34NY10SeL"
Content-Disposition: inline


--AJLPS9b34NY10SeL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 02:05:53PM +0200, Miquel Raynal wrote:
> Hello Conor, Santhosh,
>=20
> >> I also don't get the point of this property, why can't you just set
> >> the
> >> max that the device can do and if the controller can configure itself =
to
> >> be fast enough it will do so, and if it can't then it'll pick whatever
> >> the fastest it can actually do instead?
>=20
> If I may, this is not doable because there is always a phase at low
> speed. By low speed, I mean the speed which allows reliable data
> transfers between the host and the device. This "maximum low" speed is
> non discoverable, it is necessary to describe it. As of today, it is
> widely used (and I believe for good reasons) and covers 99.99% of the
> use cases.
>=20
> >> Seems like you're abusing a peripheral property to encode information
> >> about the controller.
> >
> > The controller-side approach you mentioned is similar to what I had in
> > v2, where a compatible-specific base_freq is used for non-PHY ops.
> >
> > Miquel,
> >
> > I think we should revert to the v2 approach.
> >
> > The non-PHY frequency is a controller limitation/capability rather than
> > a flash characteristic, so it seems more appropriate to keep it in the
> > controller driver as Conor suggested.
>=20
> The non tuned frequency is the maximum frequency one could use
> reliably. It is not controller specific. It is mostly board specific,
> and to some extend may also be chip specific.
>=20
> The tuned frequency is the maximum frequency one could use reliably
> after line a controller or chip specific training procedure. It is
> also the result of an aggregated set of non discoverable hardware
> limitations:
> - board routing
> - chip capability
> - controller capability

Right, and this I guess is what scuppers letting the controller driver
sort the configuration out itself and leaving the property as-is.
It could be that the speed in spi-max-frequency is lower than the "base
speed" of the controller but because of board routing or device
capability that the tuned mode is still required, right?

>=20
> We must try to think about other (non TI) possible use cases of these
> properties and also take into account the existing DT expectations. If
> turning the property into an array is too complex, we may go for a

I don't think it is "too complex", but it requires removing the
definitions of spi-max-frequency from the 4 or 5 bindings that redefine
it and making a mechanical change to all spi device bindings that
specify a limit. It's not complex, but it will be annoying without
tooling doing it for you.

> second property, but I believe the name should not be TI specific (but
> I'll let the final decision to the DT gurus).

Yeah, I concur. If not doing the 2 cell spi-max-frequency, then
something like spi-max-post-tuning-frequency or w/e I think should be
used. Doesn't seem like TI would be the only people that end up doing
something like this.

--AJLPS9b34NY10SeL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8CRAAKCRB4tDGHoIJi
0owGAQDo4OJ+lanJzDDiAy24r90RjmLY345XbhNb35eu9nR4pQD/bylNWRFr8zIC
ieLJyX/nv5hK66XKGg37ALalXfCBCws=
=ETpe
-----END PGP SIGNATURE-----

--AJLPS9b34NY10SeL--


--===============4620752953224662927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4620752953224662927==--

