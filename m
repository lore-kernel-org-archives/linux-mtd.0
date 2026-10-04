Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142E7CA5FE6
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 13:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huSE64Il079lbE06D94nYgaR8tg+7Ku0vE1u+ipjUas=; b=nF1lstE/HaZXeCJVREX4p7+69t
	EQ3R+bou5ylAEXI1VdQ7Q2Frr6S+CwiXBu1MKoqsPT56IkV+O2n2BA6Xavs+EEHR87geoE6k9snja
	TSri22ykVP9fDIVH9AoIb6cHKKMokelSlBPJH42bB/XaXU4T7yC44b4hRB0zYdeYu+NeuzeMLDUBm
	BjmT92HWbubXYeADlW+OSZeANyA8jSj29iAvIsOAC/uwbl6whb1UcazcrfEHKywsvGLtiM6SbgZSw
	G5xY/FL7U6KcCQcgLNGkTDy0tLlZEW4KhKTdCgK8b5oZIzKKt4he2BUtlceU0P7a378YPMEdOHQKZ
	WOcAU5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMPI-0000000EqwO-1fx7;
	Sun, 04 Oct 2026 13:37:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMPG-0000000Eqw8-3VXY
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 13:37:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E9344601F7;
	Sun,  4 Oct 2026 13:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B641F000FF;
	Sun,  4 Oct 2026 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791121053;
	bh=Pl46IOZhk40Hybov4sG5iF5x9sqFwGsbh8WtArPBWqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hmrPEE8Oj0RN7uFUmMI6LL0KiZaGkJtuRDKzbVwA0mpw74vvu8DRXsJNmVeoWFwfp
	 5i4SN/TBILjisEC2rU4rCz7aZIxUVwvAraSFJsvp7CdPNcQ2EP4Akew7rpvQDb6pd4
	 TKrnbYGmSdx9QA337CaF3tls527wOgKdOVjU0EX6JgMhr0fsO9aCxvcpg3a6+OIPTD
	 OkVkYDXQFYnps0MzDwu7HUbdi0sEisCx7gJrTZOr28cSJX12Pp21q1G5EAqB2AGP4P
	 pEG/ED2Rqq5U74vJAk4h/5gVFNAwKxcHJCHTyC5FnxcVmMIoAUkzLvzUBVJ+yTZVnR
	 D3hylO+KsLqAw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 4FA3B13546A2; Sun, 04 Oct 2026 14:37:30 +0100 (BST)
Date: Sun, 4 Oct 2026 15:37:30 +0200
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>
Subject: Re: [PATCH 0/4] spi: spi-mem/mtd: spinand: Prevent SPI NAND
 continuous reads on am65/am62
Message-ID: <asJWmi_Yim-jsdin@sirena.org.uk>
References: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
 <878qa7dzke.fsf@bootlin.com>
 <87mrt177km.fsf@bootlin.com>
 <38290328-a562-4813-a9e0-2fafaa3874c7@sirena.org.uk>
 <87cxttml2j.fsf@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <87cxttml2j.fsf@bootlin.com>
X-Cookie: Orders subject to approval.
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
Content-Type: multipart/mixed; boundary="===============6941863191379333484=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6941863191379333484==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9Le09z8KgXx1luYP"
Content-Disposition: inline


--9Le09z8KgXx1luYP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2026 at 06:39:48PM +0200, Miquel Raynal wrote:

> > No, they don't apply to even v7.3-rc1.  I didn't see the immutable
> > branch mentioned in:

> >    https://lore.kernel.org/r/1FyLxEwWqNFzX@sirena.co.uk

> > yet?

> In theory you should have received a request to merge
> the immutable mtd/spi-mem-cont-read-for-7.2 tag some time ago:

> Subject: [GIT PULL] spi-nand/spi-mem changes for 7.2
> Date: Tue, 05 May 2026 17:17:42 +0200

Ah, that wasn't in reply to the thread so didn't find it when looking.
I'd have expected anything there to have landed in mainline by now
anyway.

> But that's not a big deal, I will rebase the remaining SPI and resend ;)

Thanks!

--9Le09z8KgXx1luYP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrCVnwACgkQJNaLcl1U
h9AH2wf6A9I5Gjx9ErZA95l6pvSSI3DO/Cn+deMkTuHSICHdD3Mp53sbC1lu1a8R
OeQiC22eTnPQhlKyqR0rVupYb8JJRfTtNKNasJJDCghUMp2nq3U6AhJRlQZO0QPy
2uUNkQPivpufMzknAVBUUrVI3ZnDJYGhvUiQJNc6rmpwO5EiKV6gX8r/pBSW2WYL
vfmKTHWQz34iYFkaIcFmtFFona/6d1ihudtn3mNrbx/p5a3EJZPWKJBiskdI7GJl
Uwutj7ZpMyocFfxiZcdLi2qEd3W9H7x7RUUfouVUx7vWwmUwy1CE5d6hLbPWs/Zq
9ASaMSICNxpMg86HC7PmTDPDILQ0/w==
=69MY
-----END PGP SIGNATURE-----

--9Le09z8KgXx1luYP--


--===============6941863191379333484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6941863191379333484==--

