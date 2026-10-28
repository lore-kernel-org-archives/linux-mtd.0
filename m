Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D046D606A321
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YuFzdkWv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nppO/gcd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gRNBK7jgYrJYdZ0H30EwrfiuBEhzYipg6BOdubi7tj4=; b=YuFzdkWvDqo49TB3kqfxc41NgX
	CL6PryaP6Zyne3lO4oowdihDj+bOXqzHZPGwkpslED9xh5AltxQaB9rdsfNYgCqVPYfjRRJ33iMgo
	9h9RtnpFWhyWRf3PAGPp8WRNt9iK/u29z4bdj5AThzjF0T/+rl85CllrmKa+3WPFBGNkTzmSdZJYR
	yQEIA21X7PRKWNh8je9J1wjywuv+gsCkmktdjOzc1+tDWvA172zTtqJMdy8lCVz5xagXY9+aNhU/q
	cBP/aVqC69QBRnM+z19l0nGB0Ph7HwL3hjZgPMprsdsim/iClMp4AGM8RNSge7Q/It4WHWjcwNrDl
	7G1tvGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3fG-0000000738W-0MVe;
	Wed, 28 Oct 2026 13:26:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3fE-0000000738Q-0v3v
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 13:26:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F32D543BD2;
	Wed, 28 Oct 2026 13:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD401F01828;
	Wed, 28 Oct 2026 13:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793193959;
	bh=07idZJgHA8uGkBFoT2EY4Wk6RmCDQXk80GkxlixdxRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nppO/gcd6xWYQXFDxz8DEnJhSOFHakV0ohSMCaHKPQhwUktD8EkRfAoe0/xCMQL2r
	 g+m3CgndCd0A+VHCwwAZojXot+MOxkUwQxtr854YUZWOv5rUmxw0PiDJzK4xQUuFpS
	 rqXwkbhE2wmULWjH32d3+s2mGCgONUzQ8d3Foq5Ikxb+Jb4BHejHjSfZCUmz8Dr0j+
	 kmHFP+jwQ7LBgpdcfRrlwccJKw4smcpRmyjYDrLr3fCPZrYEdEjjAl9hUouH01HM/x
	 TF+Bp+DkTY7q2IJ/th5UW0OjH++g5Ifl+IUIMS6/efUnYbcJ/9oBE6dgRslSQbC9We
	 UwPlcddN9cylA==
Date: Wed, 28 Oct 2026 13:25:54 +0000
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
Message-ID: <8c8cf14d-954f-4b33-a0e7-8524b1596845@sirena.org.uk>
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
 <fdc79c99e3045635841f68c89fec3b9d9e2f7233.camel@bootlin.com>
 <8979e4ad-5209-4fb0-bd3e-95919849d2fa@sirena.org.uk>
 <cf96edf1cba37b775817d4df5f759b10e71c73da.camel@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cf96edf1cba37b775817d4df5f759b10e71c73da.camel@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============1858099064267376676=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============1858099064267376676==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qTajYpijgV2rIxUN"
Content-Disposition: inline


--qTajYpijgV2rIxUN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 02:15:00PM +0100, Paul Cercueil wrote:
> Le mercredi 28 octobre 2026 =E0 12:59 +0000, Mark Brown a =E9crit=A0:
> > On Wed, Oct 28, 2026 at 11:42:33AM +0100, Paul Cercueil wrote:

> > > @Mark, do you want me to wait for -rc1 to send it to you?

> > Please resend any new feature work after -rc1.=A0 Please also do not
> > misspell my name.

> Your name is not Mark? Or where did I misspell it?

You added a random @ to it.

--qTajYpijgV2rIxUN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrh9+EACgkQJNaLcl1U
h9Ah9Af8DU/4M1KJdCrU+Dz5CzHQbXvivhJykrHffBFOH1qgQqVMX/A5/d2PDLN1
4P+w1qmsAqME5pCxkWqjBn6YTUK35AnxidI2AfBX8eb8jXiN+iM21yg3I+CziV3+
bidjhZIXoKFGv4WcvTI0PnFevebRVg5nOj5fTEYDP9lYrPCl8Qp6IsqzRV+6Gj08
bmrwdS8+EnPtI1Izw0M1yzkAAbJOAkbugQTyiFvH3Bany84B/8HTT8h4i3bKNhCK
oZnu11AZJbQY0a7gr4YwrjuFWsCslmmqLmIdKvrTetBy5wZOUeBlNjPnHJ22FAQC
8BG6qRtmuqZMKX0/bj9nbyJ/P1rtFA==
=Kn4k
-----END PGP SIGNATURE-----

--qTajYpijgV2rIxUN--


--===============1858099064267376676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1858099064267376676==--

