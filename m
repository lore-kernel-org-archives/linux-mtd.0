Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF5B606A32E
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xIAZD+DE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hod/CvcS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QEnATWiWtKJkmlkuT177K1S6INb+fp7/mNYqRXkOvbk=; b=xIAZD+DEGPKrh13FWl0F0s2w37
	k8YTC/Nb5S1n51SCFJRBek76WaN+xjLyjaxziQnFg94Xaz2qg7dqHAv50eUCmaZ19f5BmTnO5jcu+
	wiHiZou1lYVrtnBjkgosj0cIFGtZ8ro3kX+3D3LYn4QwIkMVTdK/LDtb4fZph6FHQM/WROCQRhYpu
	oWk3r5ZA7NkCbrTrhwxCvUYJ17uIBqCzmtmPWdsP7hoe/tt/dG7zaxLqd8bsK2LdnXk5WVIChgHjT
	JSlYttBSOpbhq4nASCF9wGtHOa5qQZVttbsIZnKiiqhxmf99f1X1qDc3rc+1D/Jy1IVf5qOuoQIAs
	4tMpHdsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Fa-0000000702B-0HWg;
	Wed, 28 Oct 2026 12:59:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3FY-0000000701n-2fHA
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 12:59:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E956F601F8;
	Wed, 28 Oct 2026 12:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDF41F01828;
	Wed, 28 Oct 2026 12:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793192367;
	bh=7Ukhz+foZbHEWrgGjP8lji/Ry9Af0ETpCcrE+aHg+Uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hod/CvcSGKGYWD7DlrMUfQbAQ5i6F6ec+swq+EgZt0PCWFrl4yOFUwI4CfFCfSYvq
	 IIhwCOrBRQisOzfUtWt6dLP540Hyk0zhrmjZQrlbl2kd+9u5IRXCOsXg9IqNVVZQYb
	 9UupWr6FNl+VjykdMdaqZJIh9SYeuJaDNaUWIuFNuDxxNPXsb2lGf5DhAschHBmaeT
	 WSHwEWM8FZ0EO5nDLbFq1anGvhZOOi9wqy4jM2TReYqNXUwrPSjC6SK6B0AfbPq8yI
	 MqHAKBVFnCQWWu+ka1ynionzWB6+5i9nDvyVA8YFx6nzc3agIlsFiMxWgFC2icaRyR
	 SQbnl+kt4pWVw==
Date: Wed, 28 Oct 2026 12:59:21 +0000
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
Message-ID: <8979e4ad-5209-4fb0-bd3e-95919849d2fa@sirena.org.uk>
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
 <fdc79c99e3045635841f68c89fec3b9d9e2f7233.camel@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <fdc79c99e3045635841f68c89fec3b9d9e2f7233.camel@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============6625608989569910518=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============6625608989569910518==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OsA/JmV6B8s4J2aS"
Content-Disposition: inline


--OsA/JmV6B8s4J2aS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 11:42:33AM +0100, Paul Cercueil wrote:
>=20
> I have a second patchset for spi-cadence-xspi pending (unrelated to this =
one)
> that happens to have some Fixes: tags, and those fixes conflict slightly =
with
> the changes here.

> I'm thinking that in order to make it easier to backport those fixes to o=
lder
> kernels, my other patchset should be merged first. So I guess I'll v5 thi=
s one
> with a rebase once the other one is in.

I have no idea what that other patch set is, sorry.

> @Mark, do you want me to wait for -rc1 to send it to you?

Please resend any new feature work after -rc1.  Please also do not
misspell my name.

--OsA/JmV6B8s4J2aS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrh8agACgkQJNaLcl1U
h9Ag0Af+J7jCK4vlB9pOTozhxgQrWlUhmjH9P6zCrUmUF1SImas2es1OELwnFMfK
kDvcvJKBdWMSZACbwCjP8+EBWY7bV9axlwuxMDx2DIuBQd4dDW7tHpIZgFqVeo0Z
RPkv0RS/kuOOb7upFxyYo4psGACYAS2GjGvbqTFysbG/gag9bEUb+utfUeWlX0xL
k5a+RzFVAtJi6wq+sk0t6pRlAWPugAJcMe084lDmKgFfMCGUDV8B6fL8Pw1tF7c6
/kWfzjPva9EJeKBedhraTEpZvIc45pdAfit0jKZoJDNPUPtOi9W8B+8HjPbfzF0+
6SNPZd4HkQV8rXHNVy/+C5JziS82Dg==
=IIp6
-----END PGP SIGNATURE-----

--OsA/JmV6B8s4J2aS--


--===============6625608989569910518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6625608989569910518==--

