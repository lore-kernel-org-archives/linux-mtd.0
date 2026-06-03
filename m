Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A14CCD6E57
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2026 16:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/ltsgr/aHerSdc2sop/Bv+cqCMu2IFvzIdaPgiJgMk=; b=FHqcqmyvk6rlV55iXxvV3JN8dK
	Vz4JPGoeo8qp2uFBVN0+/HUu6lyeYxd+mCR2AFNW3cQAHo71vaa6uzUwE4m+oEaHVlPvLguo5skBM
	eB5KgjfyfumkE36TXXuc8qtiE84azS01hDw7S26S2g/eiXAsGUXvXV6Am5t3ISWBe94ow2o9g6Hzp
	TUd6p2dlXo7iYH3mHbxOnrw0PZeaotpGZr9WM1dtFFkM/8F+nrx0GUigkdrzjdTldvcHE5lFFsy6L
	AqCZm5SOYcY40GVfKrDmPl8RPC7gG0IqbDQCwJrNK8uFramUkK3YMpZWO42XYPUiFX6NOp0soRXSf
	Jeiee6GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUo7t-0000000FUGw-43B7;
	Wed, 03 Jun 2026 16:07:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUo7r-0000000FUGS-3DnT
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jun 2026 16:07:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 035D14167B;
	Wed,  3 Jun 2026 16:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964A81F00893;
	Wed,  3 Jun 2026 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780502846;
	bh=4DcE3gdg2zZx4lddjSrV/qCrZ+duToKva+T9bA0+opQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XzcwUY6hOFK7yIkrn0LZIMQD3zb+4dRS2+e6jrsGkybCCbdk2Z1Sa4GpSNGVP8m2I
	 R5sMMGyzSggulE3CYbjsmaeCAq3BoNzwy/ydL/TIdYWOWhKxjwBvWXqzZFpPlrYMb0
	 ZnIiauKyY8o25Bk5pVkIvPbOqhAj25/VMLY/arDAFX1srPFeIaFJvcwQydW0Rtt7Pp
	 618etvKuJwRj4dtzGwJY0Brhy4q9hA+0y86M6Sq3Wmv4TNzKcKuDRCqCYmLGbcXtQC
	 uHSTXp7RxLa+bc91uQYWOtKZknSb1WUwhYXG2O3yUVApF0mTRb9hxsqzjf8zsELMJb
	 9NOk/d3RtSk2A==
Date: Wed, 3 Jun 2026 17:07:21 +0100
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
Message-ID: <20260603-neatly-twine-e89b923f5cb6@spud>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-2-s-k6@ti.com>
 <20260528-clergyman-kindling-20971775ba78@spud>
 <eaa75113-2b89-468d-aca8-932bc7e33a7d@ti.com>
 <87cxy92llq.fsf@bootlin.com>
 <20260602-aptly-bunkbed-1bd3a8d63d54@spud>
 <875x3zzkji.fsf@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <875x3zzkji.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_090727_852480_86DFF029 
X-CRM114-Status: GOOD (  33.86  )
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
Content-Type: multipart/mixed; boundary="===============6405874866010413017=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6405874866010413017==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s1EwmNtQnf9Fscw6"
Content-Disposition: inline


--s1EwmNtQnf9Fscw6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:54:41PM +0200, Miquel Raynal wrote:
> Hi Conor,
>=20
> On 02/06/2026 at 17:18:15 +01, Conor Dooley <conor@kernel.org> wrote:
>=20
> > On Tue, Jun 02, 2026 at 02:05:53PM +0200, Miquel Raynal wrote:
> >> Hello Conor, Santhosh,
> >>=20
> >> >> I also don't get the point of this property, why can't you just set
> >> >> the
> >> >> max that the device can do and if the controller can configure itse=
lf to
> >> >> be fast enough it will do so, and if it can't then it'll pick whate=
ver
> >> >> the fastest it can actually do instead?
> >>=20
> >> If I may, this is not doable because there is always a phase at low
> >> speed. By low speed, I mean the speed which allows reliable data
> >> transfers between the host and the device. This "maximum low" speed is
> >> non discoverable, it is necessary to describe it. As of today, it is
> >> widely used (and I believe for good reasons) and covers 99.99% of the
> >> use cases.
> >>=20
> >> >> Seems like you're abusing a peripheral property to encode informati=
on
> >> >> about the controller.
> >> >
> >> > The controller-side approach you mentioned is similar to what I had =
in
> >> > v2, where a compatible-specific base_freq is used for non-PHY ops.
> >> >
> >> > Miquel,
> >> >
> >> > I think we should revert to the v2 approach.
> >> >
> >> > The non-PHY frequency is a controller limitation/capability rather t=
han
> >> > a flash characteristic, so it seems more appropriate to keep it in t=
he
> >> > controller driver as Conor suggested.
> >>=20
> >> The non tuned frequency is the maximum frequency one could use
> >> reliably. It is not controller specific. It is mostly board specific,
> >> and to some extend may also be chip specific.
> >>=20
> >> The tuned frequency is the maximum frequency one could use reliably
> >> after line a controller or chip specific training procedure. It is
> >> also the result of an aggregated set of non discoverable hardware
> >> limitations:
> >> - board routing
> >> - chip capability
> >> - controller capability
> >
> > Right, and this I guess is what scuppers letting the controller driver
> > sort the configuration out itself and leaving the property as-is.
> > It could be that the speed in spi-max-frequency is lower than the "base
> > speed" of the controller but because of board routing or device
> > capability that the tuned mode is still required, right?
>=20
> I do not actually expect any tuned mode/frequency to be mandatory.

I think you misunderstood my use of "required", I meant that the new
property/information was needed in the scenario I described, not that it
should be a required property in a binding.

--s1EwmNtQnf9Fscw6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBROQAKCRB4tDGHoIJi
0j5OAQCWb0zo1IHNOKEyAsgZCqvYqoIIDdppeJHQXnA34qJKgwD+LjAZKbifRJpB
IlxAJqU+VfU6Udqf4CwOEBPWL7ulWAY=
=iGpw
-----END PGP SIGNATURE-----

--s1EwmNtQnf9Fscw6--


--===============6405874866010413017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6405874866010413017==--

