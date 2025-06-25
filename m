Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A40C77B7C
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jun 2025 22:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uGpZyD0XFGlVAb3+cJRzWP83eim/m5xFY3LqDzIsRc=; b=0yKjco2SIai9niG/jtH9MIoP1E
	3XNRamBPJP6lwpCmhHLnosfw/hdgxWY4KYr+4dKOYDnS8YZo5xp95Ar3C4e+hQIwj06PiFLjDp2Rp
	GbE7A/8ioNtro4kMZr5TwQlMZXcQUwOyVGY/40ewsECyqLLmEG7q3bXyfg2yzuhVUiure7g03v8MI
	jFXWRqEDYH7ivBehumZA7ZxS/RkT/1YCSYqSxbUXG4cH2wGgxa7/TjCFEGLLVd1qWyDhAvxrF2oaP
	JlAIcl1wj2xisRwErUBOU8UJQz0PL+wh4jaq+80VXy+JViq4Rq0yLmPbHxm3Bd1idpkBUx+Nk3HXX
	/8eKXr5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUZ0b-0000000A7sg-3vOs;
	Wed, 25 Jun 2025 22:54:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYq0-0000000A5vU-3Eic
	for linux-mtd@lists.infradead.org;
	Wed, 25 Jun 2025 22:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7413A442B9;
	Wed, 25 Jun 2025 22:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1586C4CEEA;
	Wed, 25 Jun 2025 22:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750891408;
	bh=xZtSzPqdbJ8208R4RJdG5ryYeh1/4FRyOAC1mvLBQrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9lM+5Gc+L7q2ca8HZzWtCcZHjuqT+xnq1wlbdQIhJl6GxXCYLWDUcazMsQC5MTo4
	 PWlHHO2snzOKBmHolt4bLf062MLyx5QG6GE2bhJ9ZbK9EmvPasMFPL9zEeyuvo0qNw
	 fBJ3p3ZiEeXAE6UEAwEj10f19WjdQI2lI9up/mosp5lmH/F5EJe1XMkZsEp2Vkn7JL
	 E9H7kNoTVa3jHkzwArtNGJvJlyFMPmCIM4ahC0ZNwPAGu3wh7NxLYzlxlsl6aA4K3D
	 X1Lw6y4+4UA2spjku2uyUuXl5D0ZYtt0Enns+LYhuqghGJN90o4xxLnXBoqBOW9ikj
	 +/tRezTKybA0g==
Date: Wed, 25 Jun 2025 23:43:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lakshmi Sowjanya D <quic_laksd@quicinc.com>
Subject: Re: [PATCH v3 0/2] spi: spi-qpic-snand: avoid memory corruption
Message-ID: <aFx7ix0uikB8dkm4@finisterre.sirena.org.uk>
References: <20250618-qpic-snand-avoid-mem-corruption-v3-0-319c71296cda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250618-qpic-snand-avoid-mem-corruption-v3-0-319c71296cda@gmail.com>
X-Cookie: Do not cut switchbacks.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_154328_832941_F8358AE4 
X-CRM114-Status: GOOD (  16.13  )
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
Content-Type: multipart/mixed; boundary="===============2734937593399865389=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2734937593399865389==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6lvN9Ro0oZtMf/Z5"
Content-Disposition: inline


--6lvN9Ro0oZtMf/Z5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 10:22:48PM +0200, Gabor Juhos wrote:
> The 'spi-qpic-nand' driver may cause memory corruption under some
> circumstances. The first patch in the series changes the driver to
> avoid that, whereas the second adds some sanity checks to the common
> QPIC code in order to make detecting such errors easier in the future.
>=20
> Preferably, the two patches should go along in via the SPI tree.
> It is not a strict requirement though, in the case the second patch
> gets included separately through the MTD tree it reveals the bug
> which is fixed in the first patch.

Miquel, are you OK with this plan for merging via the SPI tree?

--6lvN9Ro0oZtMf/Z5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhce4oACgkQJNaLcl1U
h9B+2wf/eAiUMzOvjQ9ulZwzoVeTR/QxB3I0UmI2oTP88zeNfeOivQc5l31yTtca
U5r6vueSYI4LvMYCwSgpG+4ye/1ZvpBMbpRXuNYCV/xC+jwtWwGerxk7MIlp3vLC
yLkvKnpYCwljsjZUx2KgkKmrrA+zttfJWWQwhRbYif+Q3mo+p2Y0kqBF01V7GYDu
CKOQP+xrQnTLzgmr38Rnw+YH3/x/gZBxWLrwIqagVaFfY6iMDWZrgw/Q9fzOFX0V
uqKFR36pBXSue/r5MXTFY1mLwc4IVKqz8jq+wLZuo72ZBxvcboZk7I4sgSkrivkF
kxPnKDJjk9t+6mW0SWfYBAHS1+qZcw==
=3z7M
-----END PGP SIGNATURE-----

--6lvN9Ro0oZtMf/Z5--


--===============2734937593399865389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2734937593399865389==--

