Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB06606A321
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 18:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U1npSdbg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YnsdK3M9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ztbqlHCAVODt+bWLxfUejK0umJXQGy84RaNQ00Jz9OM=; b=U1npSdbgTXCGl6a37b2jcnvm7x
	xVYusg7cM8jS3aVM2sqAtwIAVi+xA5grPH4AG0ccqxom6p8Hao4q7qHS8NAThQgydsgyHlgUb9cJI
	SSOkOxyUJOs/4GLdqEWCkRMaiqK4Zd+6t8z9wSpZbYmxYIS9Lx9o03vYgRxaduFX59yQkdQRha9Ak
	KwGZ0aB/Ij175LQnyG6U+1ekXfd3ukZ6Ydmjl09A03nuvS0NwPOVYvTrdhQGCQxAT2OfizIXqJ38t
	tHT/8mPs8CEsDPC5slSopBsOt7yC1421XFmmQrWY/JblODml99vrRO91e7srZ9Mvobvpx7Fbt9EKp
	QIdHS12Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqrK-00000004pWJ-3FB8;
	Tue, 10 Nov 2026 18:46:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqrJ-00000004pVs-2fwM
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 18:46:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B97426319D;
	Tue, 10 Nov 2026 18:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8EE1F008A2;
	Tue, 10 Nov 2026 18:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336376;
	bh=IdYY2IXjfD8Nx/hXFd3DnmQig+okTC6FGAh+kYY8spA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YnsdK3M9iXqkkN71f+AXsmF+nQiZ7hvK65psffwr3W3jdYeHyQwYaX5KccEQPzpjy
	 qfQ22eDXMHBWBkkSDSHIh8TL/pWdSF+pEaDC1xYEjvE0CHeKOsTi9mlDywjNxIT21D
	 b7aWWjSX0zNbDc6xGGJa9gk8wdFqVvKitw37O4CKlgFxH5pVoXa+BBhd0OssOg1fUQ
	 DOVGkY09++hIbLP0AlnaOyWnnn9oY5v/eXfYDGKHZ+mOBBYLklQ6DGu5wQC8+ltK50
	 R0f2h2vCO95BVksxbFNnRkPUzNiJzeRB5gRwY4SZpangQMl33kaGV6fKEcRVekh6wD
	 f/a0Xp0IXOdLw==
Date: Tue, 10 Nov 2026 18:46:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] spi: spi-qpic-snand: use generic code from the
 'qpic_common' module
Message-ID: <25dfb787-27ce-4d47-a619-e9600f4f7902@sirena.org.uk>
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
X-Cookie: You can't take damsel here now.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8419033715744232057=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============8419033715744232057==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q41XEbKkWRq2nBzx"
Content-Disposition: inline


--Q41XEbKkWRq2nBzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2026 at 08:41:01PM +0100, Gabor Juhos wrote:

> base-commit: 4a8faaea975be15cb636646c0d4c6ff1c2110baa
> change-id: 20261028-qpic-snand-use-common-functions-12b18fc7a1e5
> prerequisite-change-id: 20260922-qpic-snand-fix-singlecw-readloc-c4c89b4369f5:v2
> prerequisite-patch-id: 7f8a48bccb2e3c8de950bbddacfefe052cea50b8

I can't apply this to anything, please resend when it can be applied.

--Q41XEbKkWRq2nBzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzZnEACgkQJNaLcl1U
h9ASqQf8C5hHDQp5evAYSgoFu5THyO4LM52sY3PgAs2A2ksq7HL78wIqCuadEdS5
wSWitIrodovDXkG984cuc4PzpCzuybzPwhEdJWq8lbr/Q8/R4R+3e/4b9EZ1ixy6
OckOnmI3PCtSH+NJTJGTIRa495HfqSega0BxsywHURDFHfr8ntKKwh0mR5Yxp1cm
i3rAKHNHnkRj2hicx/8yPjgrl6PRbEld6x6kS3BFW+fCsAjdMa4ZZv7TcI2vD8IQ
SP3KzUoxyCUO8FGCsvijvQF/WcKvkTa1hpGrJJneclxlBgthb3B//ch5le0kZkJh
KSb0AZbIkIoBsK6Rd8RSUaU6aGtV7w==
=xKp8
-----END PGP SIGNATURE-----

--Q41XEbKkWRq2nBzx--


--===============8419033715744232057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8419033715744232057==--

