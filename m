Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F402606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0kSKWt/V;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T0YgkuBs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zyR7VgaD3XtLm4TOKHuVC+FcRWvEEFailtJXZW4Nw7Q=; b=0kSKWt/V5BrqmFhi29uNSIdWaf
	LHluIc08VGKNNzfmlbb26+Uxud67J9mFTLLvumeEyRqLeonpxrj96JctAc/eDWvmRfj6D0M+kGh3a
	xfaNlkMr84xFPb44W/0mEXfiPyBfzCVBYaXY+Hw9wxwriau3PZ7XfF1KrcYfEdtBQMnIdiLxPu8f1
	NYR4kX22UU2dAJsX2Vtd/Tcime1MbpAWek5o3DV9qtADBnjv2e7cHeRvZrDO6q6qyU5ITp7r5ZpVI
	sta8h5a7D+2OP26K2UFM5afB7Ge33QfK56vsZFIREX7t9R7zgj7gbVdNJQsduUIiO8sH/BddtpbaJ
	cEbIXboA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4k9-00000007DKM-1xPi;
	Wed, 28 Oct 2026 14:35:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4k7-00000007DJc-0Eyj
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 14:35:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E2E36600C8;
	Wed, 28 Oct 2026 14:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8817C1F01829;
	Wed, 28 Oct 2026 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198105;
	bh=bnNJbpqduWQXQiwHAnkGgrFtEfEJIJp2I+OMZwtwzic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T0YgkuBsdR804jUsWJpj2B/zsCd9n3tZvgdKCNt5UYd9zgMDJ8c0FqB4w27Z+AKP1
	 rtVTs2lw0z1WnDGaNJRAZ1zRS0LT38h2XwJka46b2ciG/oNWTJDeZWP8jQ4DFWh6zQ
	 1OFyb+c3OR1cg6moqRPExet86ph3aqIGacSBvtini3BuxgEIV9hyFgQAGYV2J40d/9
	 A6pFzAToEh4Q7m5QXiBhlaB590ccPrcLdf8O/ScvtwkbPVGXHH0gBUfZ7x6UbAXidD
	 yqbyXIhEsBxLJfWvG6LbrBxiEdvnaQxJynAWWG0RCYvS/u40CF43TJdS3MY5mQvhZk
	 eDxqJIIpWecgQ==
Date: Wed, 28 Oct 2026 14:34:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>
Subject: Re: [PATCH v4 0/7] spi: Add support for panic mem writes
Message-ID: <15640a01-ac6e-499e-a5f4-37860c701f49@sirena.org.uk>
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
 <fdc79c99e3045635841f68c89fec3b9d9e2f7233.camel@bootlin.com>
 <8979e4ad-5209-4fb0-bd3e-95919849d2fa@sirena.org.uk>
 <cf96edf1cba37b775817d4df5f759b10e71c73da.camel@bootlin.com>
 <8c8cf14d-954f-4b33-a0e7-8524b1596845@sirena.org.uk>
 <7f27a8b7624ddbd0f7d32c27fe3f58df48a08c0d.camel@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <7f27a8b7624ddbd0f7d32c27fe3f58df48a08c0d.camel@bootlin.com>
X-Cookie: Pushing 30 is exercise enough.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1635241218019511872=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============1635241218019511872==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7NfKPAq3m99Mfz6P"
Content-Disposition: inline


--7NfKPAq3m99Mfz6P
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 02:59:03PM +0100, Paul Cercueil wrote:
> Le mercredi 28 octobre 2026 =E0 13:25 +0000, Mark Brown a =E9crit=A0:
> > On Wed, Oct 28, 2026 at 02:15:00PM +0100, Paul Cercueil wrote:

> > > Your name is not Mark? Or where did I misspell it?

> > You added a random @ to it.

> I do that when addressing people in emails, I thought it was universally
> understood. I'll refrain from doing that from now on.

That's not a thing with email, it's something that some services use to
format usernames.  It just makes it harder to read due to the
misspelling.

--7NfKPAq3m99Mfz6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmriCBMACgkQJNaLcl1U
h9BK6gf8DMFrIAc6ZaxY5bDWI3hF9E+0urLGgv3mbK0FYpZDofbv+dUr89BC74zv
vdbtYfCaUxYNEVwkhZwUZIDiVDuII6d1LQtzMPOBz1OyBNTzaZRHN/UAeRXskMFw
FeGZ5fxTjlBLQY22jQsJrG9RnoUj89Zf+gqHQMKW5qwo8Ryu+8ES/93C6TmVxdvt
7IT2FzX/miZxFQ11GFG7cKNBsLUJ5F1oiRUE90KyoMv1B7NsKu9mj+ruoxvDWE1r
/jx4zQ5p8EM4GeWR3v9LXVjEKxIuJ2psj2wYiIJXdtL9AZrfgNUtoHfTbmB0htDA
2fuPw3hXq1tep0hGX/m8LicZTqGCtw==
=rvPu
-----END PGP SIGNATURE-----

--7NfKPAq3m99Mfz6P--


--===============1635241218019511872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1635241218019511872==--

