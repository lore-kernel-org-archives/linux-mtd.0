Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9403C47DDB
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 12:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9SSP/ssXpRoCPLGOxUA/x672Zmfl7Ve8yasq+8Zj+0=; b=yVybincLMmNJj2IM16e6nMR9R2
	9QP/AydP0/noEWhvtj6rsrxTc0ry1HB4EWbJqCF/cMQREib6yGzmVGrRzr3QwhKt0RjAyEfcYzVUx
	IRS09Cm2KotxuOl+bi5grzc9CcprLa9EgXphOss199g5/hJ/oHf8hwAoySkXrdFsL0Q67MQLN2PGD
	Teivv/k6vhEZQD4cwhWEOTfMzzNvp1OGairOJBAk4rmLLMzNFtxy3XJN4CWE9NXIoE72gBldSwrpT
	fY9rR9WbersPDok7FjQct5+SdWDc1WMw0xEYF+zs+ObKURqpm/MLU4hU9lEX8kcJ6wCZebeHSUCsD
	pzOt5LNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVVor-00000007gAs-0aRX;
	Thu, 01 Feb 2024 12:05:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVVoo-00000007g9i-0hlQ
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 12:05:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 87595CE248D;
	Thu,  1 Feb 2024 12:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB0AC433F1;
	Thu,  1 Feb 2024 12:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706789119;
	bh=JblNlADTGIUqGdf8F+iqM4tBd9N53xAW9CwEjFnpqp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfwkO06DYVAeN2U82y3W0uzC3jtu1NCFX/lpLfoKhuYt5lIunR2XPvdtUjv5av7yV
	 ZVg03T10OVl5DBGiVuKo7Q+4E8Lm5ObOxoLye855pmiyVg3WtwZ6L3j6UVGYUVPTYI
	 oLR7ZfACxRQ9MwyyawBBsUMoW/1nF6JkBecJ34lOXN10gX1xXIPnce4modNpTpAiDA
	 cKCQW7Wn+lnaQDEaBCwbxCEHt3fPZ5NHQj9KMrXu4s+OYxI0wVonHvR7wKsXOc9rW3
	 X4BcPunlPv85njhsigXZz8TnFCtnpASfldfqcCzcltVmfgHTmxNY0UxrgmiyK4Ah/9
	 iGh8CfbZOkPqg==
Date: Thu, 1 Feb 2024 12:05:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
	tudor.ambarus@linaro.org, pratyush@kernel.org, mwalle@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
Subject: Re: [PATCH v8 5/9] spi: mxic: Add support for swapping byte
Message-ID: <c81eb3b6-c9c1-499f-8868-0f6bed10b259@sirena.org.uk>
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
 <20240201094353.33281-6-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240201094353.33281-6-jaimeliao.tw@gmail.com>
X-Cookie: You can't cheat the phone company.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_040522_405474_70087214 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7969025140765722105=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7969025140765722105==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gBg1v3E20fkE7FB1"
Content-Disposition: inline


--gBg1v3E20fkE7FB1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 05:43:49PM +0800, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
>=20
> Some SPI-NOR flash swap the bytes on a 16-bit boundary when
> configured in Octal DTR mode. It means data format D0 D1 D2 D3
> would be swapped to D1 D0 D3 D2. So that whether controller
> support swapping bytes should be checked before enable Octal
> DTR mode. Add swap byte support on a 16-bit boundary when
> configured in Octal DTR mode for Macronix xSPI host controller
> dirver.

Acked-by: Mark Brown <broonie@kernel.org>

--gBg1v3E20fkE7FB1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmW7iPkACgkQJNaLcl1U
h9DJlwf+Lmmsat/t2Ej8cR794ywlry2+IcRfBH4pN8fKO7aLvV1lUl9kCo7wqsQt
RxmBmbcsmiNVFPFtst57PyFbc5YWzQCm3D7ZRj2l+LsLUUepDrLlxXTuIVQCmErA
hZuD4xbzxRNb14s9nfkXMRHbwfGYZpmxQyJvEvCBd567Oo+akVJ9lp1jJZVXDusr
CBStw4y4wnwsl4qFJnSdl+AVjMHSpKfXqkpSwD5HcZO1ppU36FFYuqlUHH8V0J5u
u0JtpNKq92TQtZwyDAQyMlc9AE/cDtVHPvEKx+ja4b06P7xMzU4GwGxUV/4sKZlx
3pKoP0v637XaKQ4Rggm+c2fvi53fdQ==
=Dpq9
-----END PGP SIGNATURE-----

--gBg1v3E20fkE7FB1--


--===============7969025140765722105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7969025140765722105==--

